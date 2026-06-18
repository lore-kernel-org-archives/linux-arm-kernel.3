Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910C6CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 02:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vMH1HYNQKQ/qahkG7RCFCu22hgnkU7ddsQQrw8qsHa0=; b=Tm3e3JQfVODV9+LaR1R8Cqi0tE
	oCIywFPg297DSkyLTv2jxo2S9lQMgT3U8UpioUmCysc7SzFfD1sKtJaVIOqZLE5jAwET0pjfuYhP/
	V69JI8UiGX1npkHfywvEacaZRsldS+yUd5Za+3pQRARcZraVLbGF5IPOr7/40ugSNiW62R6fu+xwu
	CvFN/g9GMsuZ0TpSTOWXFBSJWNMuNPkby8kr43/mkps/6T8dewnh5Lma7kl0Nd06Y5yqAvqNIahL/
	diDlfm3Mol0pWvL/qWuGBPTQgEIzP2xzk5nXJHpHbU6zA1b/fvse8n7ZMm+bX4lG7dF6ivRmp7kKg
	pzgCZ3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa2aS-00000000Wce-0jAJ;
	Thu, 18 Jun 2026 02:34:36 +0000
Received: from mail-m81203.xmail.ntesmail.com ([156.224.81.203])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa2aN-00000000WcJ-2kzk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 02:34:34 +0000
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42d5d546d;
	Thu, 18 Jun 2026 10:34:25 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: Question: SPEAr PLGPIO irq_enable on PREEMPT_RT and regmap updates
Date: Thu, 18 Jun 2026 10:34:18 +0800
Message-Id: <20260618023418.213453-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ed8946a3503a1kunmf2d2cccc885db
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGU0fVkpIHx0fHRgaQkoeQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Piz9kGozhLGhAp7BcS2rw2ba7CmgSgklDxmtNboRQ5YYYBESGwjFqpSrhHhUawXgG3QuTvrbrxl2tcZ1o6y7Sy3nXbq/3g87F7FnXGJlmxnoME6Y3vHQ6PMwMDKL9EcBJFj4BiX33skF+NHZtMrHIGRP//YsSSwKouDO3avIQvk=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=vMH1HYNQKQ/qahkG7RCFCu22hgnkU7ddsQQrw8qsHa0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_193432_415515_65BBE7DA 
X-CRM114-Status: UNSURE (   8.50  )
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

Hi,

While auditing GPIO/pinctrl irqchip callbacks, our static analysis tool
flagged the SPEAr PLGPIO irq_enable path, and we manually reviewed it
against the current tree.

The path is:

  irq_startup()
    -> plgpio_irq_enable()
       -> gpiochip_enable_irq()
       -> spin_lock_irqsave(&plgpio->lock)
       -> plgpio_reg_reset()
       -> regmap_update_bits()

On PREEMPT_RT, plgpio->lock is a regular spinlock_t and can become a
sleeping lock.  Since irq_enable/irq_disable can be called from IRQ
management paths while the IRQ descriptor raw lock is held, taking that
regular spinlock there looks unsafe.

A minimal Lockdep reproducer preserving this irq_chip::irq_enable carrier
reports:

  BUG: sleeping function called from invalid context
  irqs_disabled(): 1
  plgpio_rt_spin_lock_irqsave
  plgpio_irq_enable
  request_threaded_irq_probe_path

My first thought was to convert the PLGPIO register lock to
raw_spinlock_t.  However, that does not seem sufficient because the IE/EIT
updates go through regmap_update_bits()/regmap_read()/regmap_write().  For
the syscon/MMIO regmap used here, regmap may still take its own regular
fast-IO lock unless the regmap was created with use_raw_spinlock.  So a
raw_spinlock_t conversion in the PLGPIO driver alone may just move the
PREEMPT_RT problem one level down into regmap.

The repair I am considering is to keep the gpiolib resource updates in
the fast irq_enable/irq_disable callbacks, but defer the actual PLGPIO
IE/EIT register writes to irq_bus_sync_unlock(), after the IRQ core has
dropped desc->lock.  The driver would keep per-line shadow state for:

  - IRQ disabled/enabled state
  - pending IE update
  - edge direction state
  - pending EIT update

and then synchronize those shadow updates from irq_bus_sync_unlock()
under a mutex.

In other words, the fast callbacks would only update local shadow state
and call gpiochip_enable_irq()/gpiochip_disable_irq(), while the sleepable
regmap writes would be batched into the irq bus sync phase.

Does that sound like an acceptable direction for SPEAr PLGPIO, or would
you prefer a different fix, such as changing the underlying syscon regmap
locking model or handling only the IE register path?

The draft patch I have locally is roughly:

  pinctrl: spear: defer PLGPIO IRQ updates to bus sync

and it changes only drivers/pinctrl/spear/pinctrl-plgpio.c.

Thanks,
Runyu

