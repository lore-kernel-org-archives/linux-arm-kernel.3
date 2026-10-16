Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301F5CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 17:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCT6orX277V/eXrgGHXRg277x8AusfyPsqCSasnsFic=; b=KLNZHPwvrEBGKJ6CGlAzm8j34Q
	Q1q01xfDL2JIFW7qJZVtlCjpnkCHJ58fthVZaCtoNKFsdCMzfps59swECCK9BtnMf0shm6Fk/dJp7
	1PpSjIsNexXHHgNUor2o8PLBt5eO0dgSE/7M15r3zJacuUurt65ZDrmMDbrvaxWoXW1y0hYSa5PRE
	u/B0LfKHsCi9X6Ik1wfzvApu6oPokh1infllxNtSoCnfOHb7kp8x6JobbhnNnFA2t1WkZ+Ts8ABo8
	VThNNDMFYR/vhq7PoCMqqkLjPUdAiK6ndFycON5DZ/5QRYs5QTnzVAkVKJ1U7ipweIeULX3h/rHPj
	VJ7jKcOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlS5-00000003Wfn-0hOa;
	Fri, 16 Oct 2026 17:10:41 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlS1-00000003WfB-1mzN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 17:10:39 +0000
Date: Fri, 16 Oct 2026 19:10:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792170630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xCT6orX277V/eXrgGHXRg277x8AusfyPsqCSasnsFic=;
	b=FgDsF/D5Edeyu2Mo0sHNinfcY38reKu9+5gIxKRxJnaXTDW1+G+diQgxfT9prblrVYGcDW
	1t92YvUYk8vfEBGJ1+Jei5BonJZ0GBBFoWEZAFdbW4BhvusA1X7riVY7mzVnl6+tzUZ7ev
	sBGj+5RpAGPOhizB40jp9gvF1hgPG5nYc/lldkkLrhiJKJDhgS/iiwVgCQ0ZbRKRxduSKs
	ftKWOu07I+6hArLCi3hBG9vHOanv1bqqKibky1FpDos1GisURUJS+X1QIhRlARns4eSiEx
	RvCjJE1KilOr1hX2AtiyONBqvey6YSTFgnhBcEunV0JtGEe/dbl3VDZiVKZwqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792170630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xCT6orX277V/eXrgGHXRg277x8AusfyPsqCSasnsFic=;
	b=jBw2PMJzPZmXpNqNVTH/hpYeoIqJ86JtMYBJn0cK+Gw+QTUJK7WBCFizx/58pyPVJnI8Lm
	z3dPFRl9cT+Mw+AQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: tanmay.shah@amd.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Harini T <harini.t@amd.com>,
	Saeed Nowshadi <saeed.nowshadi@amd.com>
Subject: Re: [Q] zynqmp-ipi-mailbox and SGI interrupts
Message-ID: <20261016171029.wSftndCb@linutronix.de>
References: <20261015083937.8SDbdK8P@linutronix.de>
 <1ee3f542-e0b2-41d4-bf6a-b103dabf50cd@amd.com>
 <20261016162356.m2X9jbCa@linutronix.de>
 <4c9b533f-251a-4569-bc78-fd7af664c831@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c9b533f-251a-4569-bc78-fd7af664c831@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_101037_609510_57BA63B3 
X-CRM114-Status: GOOD (  19.34  )
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

On 2026-10-16 11:44:07 [-0500], Shah, Tanmay wrote:
> > And it has to be a per-CPU interrupt? It can't become a regular
> > interrupt which is not per-CPU? Does the driver at some point access
> > per-CPU registers?
> > 
> 
> As per my understanding, it has to be a per-CPU interrupt.

I see.

> Driver access those registers via percpu APIs, for example:
> xlnx_mbox_cpuhp_start() uses enable_percpu_irq(). It is called for each CPU.

Yes I know that part but this is not the question.

I meant _why_ the interrupt has to be per-CPU. I'm not sure if this is
internal wired as such or just configured.

For instance a timer is using a per-CPU interrupt. While the timer is
programmed for the next expiry it uses per-CPU registers. So the timer
accessed from CPU0 is different than the one accessed from CPU1. Once
the interrupt fires, the processing that follows is different on both
CPUs.

Looking through zynqmp_sgi_interrupt() which just invokes
zynqmp_ipi_interrupt() I don't see the difference. The OP-TEE firmware
is invoked at least the bits I saw, it just masks the source and moves
on. So I am not sure what is the difference between the interrupt on
CPU0 vs CPU1. Both could fire at the same time and handle the same
request unless the firmware returns a different
IPI_MB_STATUS_RECV_PENDING bit. I don't see how the remote side would
make a difference between those two CPUs.

So this is what I am wondering about. Based on your response so far this
has to be that way.

> >> Thank you,
> >> Tanmay

Sebastian

