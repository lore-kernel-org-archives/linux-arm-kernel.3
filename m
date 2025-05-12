Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9998C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 18:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgkKtt2m6ip+njKFIPiUxvZoJwWMNpWdYXXziFn05AI=; b=SzHLeX1Uo/48g8xZx+Ixb6P9Ps
	r9Z7oiIO0RdCVvUV9/k4TTInQLqwRG2tPnnr/GdpSQJzrw/sbMBhgHYvqtVIBIArm8jMrGxSBnOo3
	myo5SFcJwS1BQX7FJnltsNmMox7QRSodiv5755eURmrBjUfb74ZGJ+6eNsXfy/XezadHzro4yveJd
	jud22Mn4LP9eljc9i5KAQPl5bs/kK/1CyeuwPwTn1fe8Cdl+dIcc8YcVQNJiitcEaCGt4DcwfsRgK
	3m6YaaI1uSttaOO5U2A7ZsydYfaoRUmsTYee7qVnTXnJC70H9Tha/J0Hx1zaGE57fraBqYJNlgfNH
	CLrWuyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYM3-0000000ATCI-33FM;
	Mon, 12 May 2025 18:58:23 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYAJ-0000000ARwQ-0dQO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 18:46:16 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747075573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QgkKtt2m6ip+njKFIPiUxvZoJwWMNpWdYXXziFn05AI=;
	b=QUDY2qiwkUtrnJxlrwX4pVuiinaAK+xnqMbHi6lmpC+oONYxc1MD0HbYqP1Fjc7X98claX
	GuYZ13eZOfbVwj1xKdj6TE65CJbXHDvxkkIJBUUO2jS1LhBRPjNhBlZDSMH0wdc0HY4nXA
	OZU8OXY1xq8GMrJ5Q51dPqT2aJ3h0ohpViTUFN2KJLnFEOX/6bpcUK8ZSd7/C4to2o5+dS
	WvTHNFZo+dJn1kehrulmR//ZFSVgetiHRjI5kdUGhRtlJoG4wGOX9NTU5KiQ0RiSjAqi+d
	vntc6qBIRx3DKXMq51TqTLBTxqeqZi0/s1lGRrHJOvQMDfBAgKyUDj54MuLB+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747075573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QgkKtt2m6ip+njKFIPiUxvZoJwWMNpWdYXXziFn05AI=;
	b=RjAUd/0kxFpNMmmZYd8Bkma4W7377Bwy2qQJoqSPucE0GOyhVdcSSD2RTVIj5Rh984EQCx
	F2AFyDvEZhJCvkBA==
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH 1/4] genirq/msi: Add .msi_teardown() callback as the
 reverse of .msi_prepare()
In-Reply-To: <86tt5pg6ur.wl-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
 <20250511163520.1307654-2-maz@kernel.org> <87h61plx64.ffs@tglx>
 <86tt5pg6ur.wl-maz@kernel.org>
Date: Mon, 12 May 2025 20:46:12 +0200
Message-ID: <878qn1llaj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_114615_329156_3B3CEBB7 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, May 12 2025 at 16:57, Marc Zyngier wrote:
> On Mon, 12 May 2025 15:29:39 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> > +static void msi_domain_ops_teardown(struct irq_domain *domain,
>> > +				    msi_alloc_info_t *arg)
>> 
>> No line break required.
>
> You mean...
>
>> 
>> > +{
>> > +}
>> > +
>> >  static void msi_domain_ops_set_desc(msi_alloc_info_t *arg,
>> >  				    struct msi_desc *desc)
>
> ... not like this?

Right. That was written before we went to 100 characters line length.


