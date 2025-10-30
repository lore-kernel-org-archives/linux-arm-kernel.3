Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2393ECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcZmBDUJk7yw41e2osOtFQYA59+nZfoqavQZwKrx8SU=; b=kUqt1Hns2VfMzXG5fnzuZgCJq+
	xZKlLwsmdFw7iLHQm5sP14x1g77q5Xj/hG5wjJcuJKNj3J4HB5X5v+2DslFuQwhmLxe3oF0WbWIDn
	BZiUEYUF6tLEotESfihXNTNkI9eEH0jakYrg83ans4gD8cXzfMhS+dXnpuybFisD0LyWVyTaASlwD
	t7qGKOh31B9PeDC6WuWVhoSqzLsftviSMXthtb5bfPU/CaOCooRPXvaRiWVokOl3EES5uDsCAodRN
	uoiTVyg9oxMI472Ux+hj2dkNBdfQ9ubGrtTlAUNp7OlzWz9F1pKKAczI1HVI01DjJvq3rQnkVWWvc
	YNo4Olyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUZK-00000004NmI-3JWM;
	Thu, 30 Oct 2025 15:28:06 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUZH-00000004Nlr-3zMu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:28:05 +0000
Date: Thu, 30 Oct 2025 16:28:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761838082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XcZmBDUJk7yw41e2osOtFQYA59+nZfoqavQZwKrx8SU=;
	b=mUWdCq7c+05S92Z6e3ycQap5GG7kv30irDPESS3zUYv5LZGe7HhqHaUMNrlwONd33psUke
	D5+1VvUj8ejnw9gyvQ+qOWQZvr0WbTRysFttiLkBTWMRczshO0ubWTEMrQgs0hKlagMPKU
	cPM8AYLlwviqdfPTYH1gHK7sOptPMkuIBRYojp4P5uKhpK1gE+S6KlyXrlK4Y+Ar1eueO0
	8qXcCGD/hrVeABPAXazUN398ZtWm5LbCdHLHe/jQu+YuxppyfA+yKuVzCfoDLriiDMz4S6
	Rqu8PxIB8v9CVRzPTCbvPTGEzl4D1ohGAN58AuP+9ks+ssgfkx0KJ47WnFvUFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761838082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XcZmBDUJk7yw41e2osOtFQYA59+nZfoqavQZwKrx8SU=;
	b=zb46iSxJzjaqi0J3/h4ZeZvlpftP3P6uGPFVE+TMicvvCPwsPjZkdtL4z1LgsFzylToKqK
	ooHg9L9VKk6q9LBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 4/5] ARM: Disable jump-label on PREEMPT_RT.
Message-ID: <20251030152800.9LD5D2GP@linutronix.de>
References: <20251029155918.503060-1-bigeasy@linutronix.de>
 <20251029155918.503060-5-bigeasy@linutronix.de>
 <a86e9827-9b8b-4313-8d46-5fb2af5b8826@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a86e9827-9b8b-4313-8d46-5fb2af5b8826@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_082804_150244_75DEAF94 
X-CRM114-Status: GOOD (  23.17  )
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

On 2025-10-30 16:24:16 [+0100], Arnd Bergmann wrote:
> On Wed, Oct 29, 2025, at 16:59, Sebastian Andrzej Siewior wrote:
> > From: Thomas Gleixner <tglx@linutronix.de>
> >
> > jump-labels are used to efficiently switch between two possible code
> > paths. To achieve this, stop_machine() is used to keep the CPU in a
> > known state while the opcode is modified. The usage of stop_machine()
> > here leads to large latency spikes which can be observed on PREEMPT_RT.
> >
> > Jump labels may change the target during runtime and are not restricted
> > to debug or "configuration/ setup" part of a PREEMPT_RT system where
> > high latencies could be defined as acceptable.
> >
> > Disable jump-label support on a PREEMPT_RT system.
> >
> > [bigeasy: Patch description.]
> >
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > ---
> >  arch/arm/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index 864a14a434b08..99c9b1c320af8 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -80,7 +80,7 @@ config ARM
> >  	select HAS_IOPORT
> >  	select HAVE_ARCH_AUDITSYSCALL if AEABI && !OABI_COMPAT
> >  	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7) && !CPU_32v6
> > -	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
> > +	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU 
> > && !PREEMPT_RT
> 
> I posted a slightly different version last year, which optimizes
> the uniprocessor version and has a little more information
> in the changelog:
> 
> https://lore.kernel.org/all/20241210160556.2341497-2-arnd@kernel.org/

This actually slipped my mind but I was fine with it according the link.
So let me replace this, too.

>      Arnd

Sebastian

