Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB44FD41C06
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 12:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vp7h0xYwBuBH6Aj8hNFJqvrhXvr9y9ghHlCoCaA9+Kk=; b=zVsse1g9VKhZdz
	hA/cdvpBu+/RhqIajiTCIxXO2z6sySW8vAxLjPk2J2oOlvCgkf/+yXzOX8W6FIi+xENZDr6pETBty
	SQQj3lXeBwwH4BeWEN+DmwFfmWuGht/fL6Dgv5PjxjlujNVMjU/NYEUYlfSPw9NQx2jJdsS6+bNrO
	CWi9JoD50rr9sF5+QcrxBtdyL8RxLi4moZ3jpV5jzjtz3cuEqzoF1mOeG2DlkROrWUrMDC0rC10ky
	tbAh9D7JMsHXieAqXuuFHslYBQg0HliRoOz1XFsr9ouFxOHHwjJcpBD6tJ/7wohoPq/wMae5mZFE+
	JTJ8YXM/TJNk791BDf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCOX-00000006kc7-2E47;
	Wed, 13 Nov 2024 12:22:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCKj-00000006jon-3Noc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 12:18:55 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1tBCKg-0004eO-WF; Wed, 13 Nov 2024 13:18:51 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH v2 0/2] spi: imx: support word delay in ecspi
Date: Wed, 13 Nov 2024 13:18:30 +0100
Message-Id: <20241113-imx-spi-word-delay-v2-0-2b65b737bf29@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABaZNGcC/22NQQ6CMBBFr0Jm7ZhpQ8C68h6GBWkHmERb0iJCC
 He34tble8l/f4PEUTjBtdgg8ixJgs+gTwXYofU9o7jMoEmXisigPBdMo+A7RIeOH+2KWjlLqiN
 zsRbycIzcyXJE703mQdIU4np8zOprfzlF9b/crJBQt6YyWpWuNtVtZN+/phi8LGfH0Oz7/gEdz
 Rl3uQAAAA==
X-Change-ID: 20241009-imx-spi-word-delay-21dc01f098cc
To: Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: kernel@pengutronix.de, linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=tZGNi/z9iX3qW1qh+hyrUffDenpNLquRG7rp41ALlkw=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYkg3malp7Kn/nLHILMjk/NSINDtPp3mZxt8f/9jnYPBuv
 cDMrD2sHaUsDGIcDLJiiiyxanIKQsb+180q7WJh5rAygQxh4OIUgIm4nGdkeLZGXa43QKxlmtbq
 lKSP8YuWXT4rMbOYq3NyQmpE0pWCBwz/vU+2TzLQ9zl/88avjmhLs8PTI6dtFp+zSWfB2gOejlf
 DOAA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_041853_884152_8515EDC8 
X-CRM114-Status: UNSURE (   9.99  )
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

The i.MX SPI controller supports inserting a configurable delay between
subsequent words, which is needed for some slower devices that couldn't
keep up otherwise.

This patch series introduces support for the word delay parameters for
i.MX51 onwards.

The SPI clock (CSRC=0) was chosen as the clock source over the also
available 32.768 KHz Low-Frequency Reference Clock (CSRC=1). The sample
period control bits (SAMPLE_PERIOD) are set to the selected word delay
converted to SPI clock cycles. A deviation from the requested number of
wait cycles and the actual word delay was observed via both software
timings and oscilloscope measurements and accounted for.

The Chip Select Delay Control bits in the Sample Period Control Register
remain zero.

Behaviour on i.MX35 and earlier, where the CSPI interface is used,
remains unchanged.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
Changes in v2:
- Remove accidentally added CCs
- spi-imx.c: Add missing includes, Rb kernel test robot
- Link to v1: https://lore.kernel.org/r/20241107-imx-spi-word-delay-v1-0-2a969214d796@pengutronix.de

---
Jonas Rebmann (2):
      spi: imx: pass struct spi_transfer to prepare_transfer()
      spi: imx: support word delay

 drivers/spi/spi-imx.c | 108 ++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 92 insertions(+), 16 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241009-imx-spi-word-delay-21dc01f098cc

Best regards,
-- 
Jonas Rebmann <jre@pengutronix.de>


