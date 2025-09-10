Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0985DCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 14:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cx/cLzMdFwxZEfUZV5dGxlW5/VM8KOo9COoO8ANF8ms=; b=pmTdjp7ctFQ3t4uzn8dCZm76ah
	sVvZw7pU5PHakZ1316Avmze2pTjWIQEbR/PLRzY6kzAOJVp8UavqvSQxV2LKOlR2SI5A4r1vtFUcb
	wNxWnS9/sGCxV4FlIIMHqaA1gPHCh5xIYvn6pMnd6xZUg3PCARVHLIeMNeCuB9H/BXSJ6ThE3papP
	7mtYQMHkT2jU23CQIgZPz2SsV+t3d6AzSj0rAoKnd/X+OFgwJ9X9rWrY7fNdjCEfqCEYCUuWoSY1J
	AT+OPMjp/Gj2GHwnpe1A7vf9QEGny0Tjz3Khw/tcpkmZplOFjMfAnFUXigaeVuE+z+YmzLidX2sWk
	zf8imjgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwM6G-0000000EqFc-1cDe;
	Wed, 10 Sep 2025 14:47:08 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwM6C-0000000EqE5-3JNe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 14:47:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757515622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cx/cLzMdFwxZEfUZV5dGxlW5/VM8KOo9COoO8ANF8ms=;
	b=BTscDZbOpxt/U2TKqJdaOr1GCip/McoA8ZI8h8ly6noV7+Dd2N4nXQGhCwb+4YddUR0xLk
	WpzaV1D3GQYd84DvI+PvWHyomaCOhP3vxBTKqnkW34MnWocKFq4/V6sRzTfD0h/HcuaTc0
	1aHxiQ1dY776Y8FLU4rEv1sJV/OELPo1U1ws7aEaxXrAm8BTX7RXCX1M3PlX3WHGPhJm6t
	GxqvcxGqUn27vgi02Ezw8K+SQBJwg9NKFHL/yEiGPiwpZzJbqFvGflO5pgcIIMZvOLZBqg
	IeOvgQqeUOYzQXuKoYThKPZjBFD2UFY3gu5D0Za9rD0KSwdjcOsRTQ0/iFSHwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757515622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cx/cLzMdFwxZEfUZV5dGxlW5/VM8KOo9COoO8ANF8ms=;
	b=gLeMKV+z5z7Eu3gocJslS196gaSHl3jMqoNzqO7evhJrjr8gHcw6/xN7fF/Y5RfwJHuWMZ
	k8IiifZXielclmDg==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark
 <james.clark@linaro.org>
Subject: Re: [PATCH 15/25] genirq: Allow per-cpu interrupt sharing for
 non-overlapping affinities
In-Reply-To: <86ecsed84s.wl-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
 <20250908163127.2462948-16-maz@kernel.org> <86ecsed84s.wl-maz@kernel.org>
Date: Wed, 10 Sep 2025 16:47:01 +0200
Message-ID: <87h5xatlei.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_074704_992158_9A98657D 
X-CRM114-Status: GOOD (  11.78  )
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

On Wed, Sep 10 2025 at 09:28, Marc Zyngier wrote:
> On Mon, 08 Sep 2025 17:31:17 +0100,
> As Will points out off the list, the above lacks the a similar
> handling for percpu_devid NMIs, leading to NMIs that are only handled
> on the first affinity group.
>
> It's easy enough to move the above to common code and share it with
> handle_percpu_devid_fasteoi_nmi(), but at this point there is hardly
> any difference with handle_percpu_devid_irq().
>
> Any objection to simply killing the NMI version?

Removing code is always appreciated :)

