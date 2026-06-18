Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7B7CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 05:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dri7msVJ02+jPQSBZnSYMVmIqcPBpOQbQ5XfzTRxPCY=; b=R3cCUuEPP33QzLv0TIdIiLSfxz
	N7h27DVZ/b+rgh4FtaXVsyAzsSgvTNpvIdDuGbj9N6GpK3idSIVyiaWtSqhX8aInoPJTbz3xcSTDA
	kH5mXsT662Ok4tynPqSbSpMC1zPMbKLR4jY/d9VqoiFkBTjAbJCZbwk2LoxGaIL/JtC6iBBSo4jlr
	jYBM7eurHvPGptoBOgeB5V0Q7Qo+zcobJNUlc788N3SoyQuEbZs0czKWQyp3gaksfEXB/sK5IeEhs
	fh/P1DAAAMOBVVDfvmhsCCfTvurZpTwKb3fqi52eL6HqVjg92euCb9l/mLEK2A7k+EV69p5XjuuzO
	tBABGsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa5R0-00000000f9W-35k4;
	Thu, 18 Jun 2026 05:37:02 +0000
Received: from mail-m128190.netease.com ([103.209.128.190])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa5Qx-00000000f95-3xCK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 05:37:01 +0000
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42dcad3f6;
	Thu, 18 Jun 2026 13:36:53 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: Question: pinctrl-backed GPIO set_config and gpio_chip::can_sleep
Date: Thu, 18 Jun 2026 13:36:50 +0800
Message-Id: <20260618053650.4053352-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ed93b770303a1kunm888aadba902f5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSU1DVk1NTxkdHk9JS0hDHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZJU1b9W4Jh98QqUhr1aQzw8XNGLQ4YZLglW1cb3o2xMn/gzwQhTHfDJQ7OHctmOMGtnvoF9o0cnjREuuH6PYHzw1f9E5w0EY0vBQ2mKCGWNepb0uGRZyoU13fa5S0ltRw+W51IGzgwKuWGgRY0QrC0I7+f+BcqxaDQ1um9KACK8=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=dri7msVJ02+jPQSBZnSYMVmIqcPBpOQbQ5XfzTRxPCY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_223700_203291_DEE06EE8 
X-CRM114-Status: UNSURE (   7.66  )
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

While auditing pinctrl-backed GPIO chips, our static analysis tool
flagged several controllers that expose gpiochip_generic_config() while
still advertising a non-sleeping gpio_chip.  We then manually reviewed
the findings against the current tree.

The path we are concerned about is:

  gpiod_set_config()
    -> gpio_do_set_config()
       -> gpiochip_generic_config()
       -> pinctrl_gpio_set_config()
       -> pinctrl_get_device_gpio_range()
       -> mutex_lock(&pctldev->mutex)

If gpiod_cansleep() returns false, a GPIO forwarder or another consumer
can choose an atomic carrier and call gpiod_set_config() while holding a
spinlock.  A minimal Lockdep reproducer preserving this carrier reports:

  BUG: sleeping function called from invalid context
  #0: ... (&global_shared_desc.spinlock) ...
  pinctrl_get_device_gpio_range
  gpiochip_generic_config
  [ BUG: Invalid wait context ]

This looks similar to the Meson fix that marked the GPIO controller as
sleeping when GPIO configuration is routed through the pinctrl-backed
generic config path.

The local draft I am considering marks only these controllers as
sleeping:

  pinctrl: at91-pio4: mark the GPIO controller as sleeping
  pinctrl: stm32: mark the GPIO controller as sleeping
  pinctrl: sunxi: mark the GPIO controller as sleeping

The reason is that all three expose gpiochip_generic_config() and can
therefore reach the pinctrl mutex from the GPIO set_config path, while
their current gpio_chip registration does not set can_sleep.

Two other candidates from the same audit, bcm2835 and keembay, are not
part of this draft.  They use gpio_irq_chip::parent_handler, and gpiolib
rejects chained interrupts on a GPIO chip that may sleep.  Setting
can_sleep there would therefore break registration instead of fixing the
contract; those cases need a separate irqchip design review.

Does setting gpio_chip::can_sleep for the at91-pio4, stm32 and sunxi
pinctrl-backed GPIO chips sound like the right fix for this set_config
contract mismatch?  Or would you prefer this to be handled elsewhere in
gpiolib/pinctrl so that set_config sleepability can be represented more
narrowly than the whole gpio_chip?

Thanks,
Runyu

