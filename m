Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4786FCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWjxZPbO7YyWOylyQwzbH8jAmeHC+JWQnIMid9X14ts=; b=C5l32PtWfl/saEHVAKRAE+uFyl
	0EtEPe5p1GS/BqAitbNjsGcLAx8Q2RFJXvi++KEVhCUvHCqNDldMH+E20NwrRuRMgX1kehU+/Zc40
	dvfliNGlQ1odryRst7KKlQSDcG7oPc/lZFG/Y9WpOrRG4b6oZVZhpDA4syShBFZz0PL99tq50RgbY
	n/s+hCUN0jv6ph536ZM3ILB0rg4UNy0Qjv5Z1kA//oknISpsQJOVDHHb3lKk+fCg9GVl1s4HSLY2G
	DtqT4YMIjhhc2jGuCHKj11H5Tlx2oqoh/gTgSUGHyY2YO6Zeym4LAm0kx1skgwBbZgBGnDFcnjLpe
	xPnOP4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9SG-000000011cS-2C7t;
	Thu, 18 Jun 2026 09:54:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9SC-000000011bF-3apR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:54:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B16EDC06CC8;
	Thu, 18 Jun 2026 09:54:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 385B55FF03;
	Thu, 18 Jun 2026 09:54:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BF15106C8326;
	Thu, 18 Jun 2026 11:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781776466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UWjxZPbO7YyWOylyQwzbH8jAmeHC+JWQnIMid9X14ts=;
	b=KyUQ5AXZua/L2ZCNVAnSqLro4Y3sx4uqBwBsTO7cJFgnu5Rp+dqmtK1F/xgk8G0UvQOK4L
	VwI2xMwITW95tQSPsvqn224uNxRy/BsjM2iTHP6lFxamo0rj3pbFdCprNH+8SmbVEfETA+
	tj8K1oaMbgnQOw/RPm1/UAoG1+wu6eFZ8Fg+nuTL0BnAYcYm57WDABzLeV2duWrbWhlSri
	j24g4Z7zs8RgCQ3QSAfHymrBB2m3ATV+2t1Hi0uOgunt/EeTGx2jOIlEfq8Q2mxI9pzbTP
	89ennLqwDihGKNA968tH7zjBHocVAbQjRWUuky+IYz3Fb/BW7nHMMavOdizaxg==
Date: Thu, 18 Jun 2026 11:54:15 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Runyu Xiao <runyu.xiao@seu.edu.cn>, Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 jianhao.xu@seu.edu.cn
Subject: Re: Question: SPEAr PLGPIO irq_enable on PREEMPT_RT and regmap
 updates
Message-ID: <20260618115415.28b99ea2@bootlin.com>
In-Reply-To: <sj3oxg5ymbe2ac2geznsidsxz23rkqzqc4ir3pkjc7bsrzaorw@cw3waaj6xxkx>
References: <20260618023418.213453-1-runyu.xiao@seu.edu.cn>
	<sj3oxg5ymbe2ac2geznsidsxz23rkqzqc4ir3pkjc7bsrzaorw@cw3waaj6xxkx>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_025433_065922_4D888AEB 
X-CRM114-Status: GOOD (  30.02  )
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

Hi,

On Thu, 18 Jun 2026 13:10:31 +0530
Viresh Kumar <viresh.kumar@linaro.org> wrote:

> + Herve (the last guy to work on this driver).
> 
> On 18-06-26, 10:34, Runyu Xiao wrote:
> > Hi,
> > 
> > While auditing GPIO/pinctrl irqchip callbacks, our static analysis tool
> > flagged the SPEAr PLGPIO irq_enable path, and we manually reviewed it
> > against the current tree.
> > 
> > The path is:
> > 
> >   irq_startup()  
> >     -> plgpio_irq_enable()
> >        -> gpiochip_enable_irq()
> >        -> spin_lock_irqsave(&plgpio->lock)
> >        -> plgpio_reg_reset()
> >        -> regmap_update_bits()  
> > 
> > On PREEMPT_RT, plgpio->lock is a regular spinlock_t and can become a
> > sleeping lock.  Since irq_enable/irq_disable can be called from IRQ
> > management paths while the IRQ descriptor raw lock is held, taking that
> > regular spinlock there looks unsafe.
> > 
> > A minimal Lockdep reproducer preserving this irq_chip::irq_enable carrier
> > reports:
> > 
> >   BUG: sleeping function called from invalid context
> >   irqs_disabled(): 1
> >   plgpio_rt_spin_lock_irqsave
> >   plgpio_irq_enable
> >   request_threaded_irq_probe_path
> > 
> > My first thought was to convert the PLGPIO register lock to
> > raw_spinlock_t.  However, that does not seem sufficient because the IE/EIT
> > updates go through regmap_update_bits()/regmap_read()/regmap_write().  For
> > the syscon/MMIO regmap used here, regmap may still take its own regular
> > fast-IO lock unless the regmap was created with use_raw_spinlock.  So a
> > raw_spinlock_t conversion in the PLGPIO driver alone may just move the
> > PREEMPT_RT problem one level down into regmap.
> > 
> > The repair I am considering is to keep the gpiolib resource updates in
> > the fast irq_enable/irq_disable callbacks, but defer the actual PLGPIO
> > IE/EIT register writes to irq_bus_sync_unlock(), after the IRQ core has
> > dropped desc->lock.  The driver would keep per-line shadow state for:
> > 
> >   - IRQ disabled/enabled state
> >   - pending IE update
> >   - edge direction state
> >   - pending EIT update
> > 
> > and then synchronize those shadow updates from irq_bus_sync_unlock()
> > under a mutex.
> > 
> > In other words, the fast callbacks would only update local shadow state
> > and call gpiochip_enable_irq()/gpiochip_disable_irq(), while the sleepable
> > regmap writes would be batched into the irq bus sync phase.
> > 
> > Does that sound like an acceptable direction for SPEAr PLGPIO, or would
> > you prefer a different fix, such as changing the underlying syscon regmap
> > locking model or handling only the IE register path?
> > 
> > The draft patch I have locally is roughly:
> > 
> >   pinctrl: spear: defer PLGPIO IRQ updates to bus sync
> > 
> > and it changes only drivers/pinctrl/spear/pinctrl-plgpio.c.  
> 
> I haven't worked on this for a very long time now (15 yrs). There are some
> people who use this hardware, and so it is not removed until now.
> 
> Also I am not sure if RT kernel is a valid use case here for this SoC family.
> 

I know some users and they don't use RT kernel.

But well, isn't the pattern present in some other gpio controller drivers ?
How it is done in others ?

What is specific in this controller compare to others ?
We take and release spinlock in gpio chip .irq_enable(). I think we can
find other drivers doing that and probably drivers using a regmap as well.

Best regards,
Hervé

