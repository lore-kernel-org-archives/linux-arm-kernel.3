Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38B6D2F7CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ciEYlRaPS29SaCNp9VOvzP0yjCeypafv0bVq1+Exa2s=; b=i67yuB/egllrrA6iqHr5JBFDmt
	1iXGrwiSaY+g7IWL9fyxXO03f6nJQd7vgO3TQZO+vhKB2ciFLj58KWB0PtL2y30FLMxRP9YtZewgT
	J3ljI2ejGeZPrs9aibyljPyHpn3CSCR+gwRRvalJXiLzchjSZ+cJIOfV8FoKpRDTJz0h/3DdmJB7b
	R5MQ5LqMNxUXWx/Tzv1wjlcJ6HCHZ8KHKPCkrpFoqJgJjlozP+g2bdw/UarC+eAH3y/SIIvmwm59s
	BCnNazmTHeXEjU7J8TLHRCkPmVZJUJXHqIKxpuLIVy4w+xbwoyD/zmzRUkKWaXEqcR3+WPGHwByfK
	cNvHpURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSeT-00000009M17-0Pcc;
	Fri, 05 Dec 2025 10:03:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSeP-00000009LzM-2kTH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 10:02:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DBB9A4E41A60;
	Fri,  5 Dec 2025 10:02:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA47B60731;
	Fri,  5 Dec 2025 10:02:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEA2810B60754;
	Fri,  5 Dec 2025 11:02:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764928969; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ciEYlRaPS29SaCNp9VOvzP0yjCeypafv0bVq1+Exa2s=;
	b=pRDeWFnjBi9qBkYJ5mUydyXd3bbtI+w5dtoQsGf4P1mVceAA63VWsCIaT1pDExR35Q5nZ4
	GinRGHtBNm+VZ1Z4dGA0j75YHM1YkJwqVr8paEwst61yaDwetFAY36kWVRHd/qMPHpuEjs
	vXMygmOkRepWb4BINhFAIXmCt2mMVHRpIPqa83f/sKBye6/AB32vELhzyALQwfUFh9oH49
	yN4WRVt7NSN5kDGcbUGvvvHrgvnHjeFl0w6c22/nIzaTyzTqDVsqbgNdlGQIjEUPg+SHzy
	yKCngu/dtndfg5ixDm+1YCsdns8r2RCA4ZIyjBsSbni8hP/c30TC5QF+m6WTvw==
From: Richard Genoud <richard.genoud@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 0/4] Introduce Allwinner H616 PWM controller
Date: Fri,  5 Dec 2025 11:02:35 +0100
Message-ID: <20251205100239.1563353-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_020257_826549_8BE49319 
X-CRM114-Status: GOOD (  12.51  )
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

Allwinner H616 PWM controller is quite different from the A10 one.

It can drive 6 PWM channels, and like for the A10, each channel has a
bypass that permits to output a clock, bypassing the PWM logic, when
enabled.

But, the channels are paired 2 by 2, sharing a first set of
MUX/prescaler/gate.
Then, for each channel, there's another prescaler (that will be bypassed
if the bypass is enabled for this channel).

It looks like that:
            _____      ______      ________
OSC24M --->|     |    |      |    |        |
APB1 ----->| Mux |--->| Gate |--->| /div_m |-----> PWM_clock_src_xy
           |_____|    |______|    |________|
                          ________
                         |        |
                      +->| /div_k |---> PWM_clock_x
                      |  |________|
                      |    ______
                      |   |      |
                      +-->| Gate |----> PWM_bypass_clock_x
                      |   |______|
PWM_clock_src_xy -----+   ________
                      |  |        |
                      +->| /div_k |---> PWM_clock_y
                      |  |________|
                      |    ______
                      |   |      |
                      +-->| Gate |----> PWM_bypass_clock_y
                          |______|

Where xy can be 0/1, 2/3, 4/5

PWM_clock_x/y serve for the PWM purpose.
PWM_bypass_clock_x/y serve for the clock-provider purpose.
The common clock framework has been used to manage those clocks.

This PWM driver serves as a clock-provider for PWM_bypass_clocks.
This is needed for example by the embedded AC300 PHY which clock comes
from PMW5 pin (PB12).

This series is based onto next-20251205

Richard Genoud (4):
  dt-bindings: pwm: sunxi: add PWM controller for Allwinner H616
  pwm: sun50i: Add H616 PWM support
  arm64: dts: allwinner: h616: add PWM controller
  MAINTAINERS: Add entry on Allwinner H616 PWM driver

 .../pwm/allwinner,sun50i-h616-pwm.yaml        |  67 ++
 MAINTAINERS                                   |   6 +
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  47 +
 drivers/pwm/Kconfig                           |  12 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun50i-h616.c                 | 874 ++++++++++++++++++
 6 files changed, 1007 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun50i-h616.c


base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
-- 
2.47.3


