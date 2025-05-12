Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09D2C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 19:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHmzi1JghzgO2lKN7GfkMIAB+j0JUv2F/ls2ddofuRY=; b=2e1Wk1RSeDp+UNWBMz9B7YGx1o
	DCh1wSvIznB6ykXMQcDY68WMjDxbbXqtgt58Y6SeL5up3Kb1v5AirFAWTmwML/x0fcg5vgJ3H2TA1
	0zGbTihwq8rfro4H8LlgN0Clq8Y7pn3yeXxTQamhjL11m4aQUYNmVXXflmpb2m87ljVIDxtM4HsYN
	Zhcs7ct1+hKN4/DCurmuKxUvc3fvKWcbgMTlAqmGvgAMQbQk+Dpex3GvjjAQkZfWmr0v4Fb57Pb4r
	2GA182QUfKkgjp/mG3CoNaYWJqJMVbRZX3V9zMjZbhoXiM/bgrHp8XIwYrVqa1aIx9GwKDpX1hTDZ
	8Ms5Ssyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYQ5-0000000AThl-0C57;
	Mon, 12 May 2025 19:02:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYBU-0000000AS7T-12Pu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 18:47:29 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747075646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jHmzi1JghzgO2lKN7GfkMIAB+j0JUv2F/ls2ddofuRY=;
	b=Icj9fsugE7Xl2MsWfdMVUWGJhjPTfEoe6zlNASHGY/toScPK1MHSVWzkTNkxavWwxcFwsl
	6jYuXbpA6sx7ZOouSDUHrM8U6xt9uLpfyH8i82F5YcK3P1lKzHLgVat8kfrLjx0rHzRHMY
	Tu/vopPk+5fGFNZR8tcYMKYsY/KHhHvXM4xyxO++gY4XqpVpNJUcZg7jRY/XRSaMEDj/DA
	mAXBjy0aENBEe+C5U4xpjx8XkinOHSJbEymQb5ARCxTB/IcQBxYnHucr5hChS76uKfaWZn
	nD+YLIBiE1dIR6WHm8nrNUShqBzWjJCBSJWMVMKBxJeXILgQe2dOR3s7nXJmog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747075646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jHmzi1JghzgO2lKN7GfkMIAB+j0JUv2F/ls2ddofuRY=;
	b=vtdc6rMiCftIgQQzBqx51RmevM5pbSBHVZRqyQSA7eduSZfiNZXQE2l+MYpzk5rTVx0q+j
	ivvrWb15lFv0Z2Bw==
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH 2/4] irqchip/gic-v3-its: Implement .msi_teardown() callback
In-Reply-To: <86sel9g694.wl-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
 <20250511163520.1307654-3-maz@kernel.org> <87ecwtlwx8.ffs@tglx>
 <86sel9g694.wl-maz@kernel.org>
Date: Mon, 12 May 2025 20:47:26 +0200
Message-ID: <875xi5ll8h.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_114728_422586_4E84D20B 
X-CRM114-Status: GOOD (  13.58  )
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

On Mon, May 12 2025 at 17:09, Marc Zyngier wrote:
> On Mon, 12 May 2025 15:34:59 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Changing prepare first breaks nvme and igbxe, amongst other things,
> for the reasons explained just above, so you need to implement
> teardown first, plug the MSI controller into it, and only then you can
> switch prepare.
>
> What I can do is:
>
> (1) introduce teardown without the call site in msi_remove_device_irq_domain()
>
> (2) add its implementation in the ITS driver
>
> (3) move the prepare crap
>
> (4) add the teardown call to msi_remove_device_irq_domain(), without
>     the check on info->alloc_data
>
> With that order, everything will keep working, with a temporary leak
> of ITTs in the ITS driver between patches (2) and (4).
>
> Is that something you can live with?

Sounds good.

