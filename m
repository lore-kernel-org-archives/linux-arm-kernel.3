Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228E7C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 19:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s2O2NEhEDrof0k2clYi/h8T/O8CwPa1AQ2twHE/TVh4=; b=X/hkMQeM7QyBMUh5TFLgJBe/yr
	/fjZ8zMBsCpWMF07PpaGL9xGqVOInqg2C1BKy4oF0PhxeTgxH0dyVDnO+VfNaU0w5TwBq7a/y3sxe
	Z/tFbL+Uo9bMbEqHQV0488rPQ4sMRCjtQPkd7qUmOfpYS1uwIAZchNNEQzk/EAGQZ42HzryJ+awd5
	30OCGw/ZjHhYIFXzyfTGi0BK+bS0KqDknOPx8w74cvTvmBcZbbuyq97wKt1oymxvjTL17kKybuIub
	eepl6TK/7E4jXf2XzV71MJ00EsiHDYl9klrvR7djh5KKxNwyovhyBNztdBDFzpGbCsnKSztvvIhVI
	3efg5DOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHpOz-0000000GkNY-2jFN;
	Wed, 21 May 2025 19:46:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHpEG-0000000GjBy-3zv8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 19:35:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C6345C5721;
	Wed, 21 May 2025 19:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00428C4CEE4;
	Wed, 21 May 2025 19:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747856151;
	bh=YCdymVDth/prPqkIK7W4QDnBSw+ChQ0vJvm38czsFpg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=a2GoH/v7NCUwJStHohhcwr7SDmdK+nqKj00Ld255vw6AaGS7s2evcP2kdLUZ/05SL
	 2g20KNGo37e6VbYkYB8+46wQLYBrmvwRYRgISjAdK9QIWeB1RBluxINAWT9FOpiPUY
	 kRjkkFJrwjzJHhgV3ecyN1rt1LnPgR5+YEQharZlZqTIuEqvy0JEdq5VgKS8bDW8m3
	 8dBIuQQHgdFjnPZ08lcAqhEzv8dDOZTzmLdJG/HX8F00S0t0uENuDlxDe4r5jAWz9n
	 itthYIeR1peS47wUKaIaftFlSc5D60TnvetGhfh9pjCzprCVbNPWXb7xlasEzHFSf5
	 23F8xhPYlCSfA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E08C54E90;
	Wed, 21 May 2025 19:35:50 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v3 0/5] media: i2c: imx214: Add support for more clock
 frequencies
Date: Wed, 21 May 2025 21:34:23 +0200
Message-Id: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL8qLmgC/2XM0QqCMBTG8VeRXbfY5qbVVe8RIbad5QHTsdmwx
 HdvShAV5+p/4PtNJIBHCOSQTcRDxIB9lyLfZEQ3dXcFiiY1EUwoJllB8TYKLiutQ+XaloKswTD
 Yg8oFSSPnweK4gqdz6gbD0PvH6ke+fN8UV79U5JRRk5uylDtQ9mKOtcPhGXSzhTtZsCg+QLo/Q
 CTAJlsJVnBr+Tcwz/MLkEYpUO8AAAA=
X-Change-ID: 20250406-imx214_ccs_pll-e4aed0e9e532
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747856148; l=1895;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=YCdymVDth/prPqkIK7W4QDnBSw+ChQ0vJvm38czsFpg=;
 b=syVQLuePuGfp3dACqYgN2W+Ayfo4zcFv5KgkcjstEAWtm0hlQX+CxxZbPIZe6GwMN6KyO86Ns
 /0lOZW8RTyTAklCrce5sVjlA8tuwqb/AzmNUrP5MyZOt5LtV/+4+vuG
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_123553_086324_B281662D 
X-CRM114-Status: UNSURE (   9.01  )
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
Reply-To: git@apitzsch.eu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The imx214 driver currently supports only a 24 MHz external clock. But
there are devices, like Qualcomm-MSM8916-based phones, which cannot
provide this frequency. To make the sensor usable by those devices, add
support for additional clock frequencies.

This series supersedes
https://lore.kernel.org/linux-media/20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu/

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Changes in v3:
- Limit range of pll_ip_clk_freq_hz (Sakari)
- Drop unneeded 'ret'
- Use pll.pixel_rate_csi for bit rate calculation
- Add patch that deprecates the clock-frequency property
- Link to v2: https://lore.kernel.org/r/20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu

Changes in v2:
- Add A-b tags
- Switch to v4l2_ctrl_s_ctrl_int64() to acquire the control handler mutex
- Add error handling for v4l2_ctrl_s_ctrl_int64() and
  imx214_pll_update()
- Replace "read clock frequency from dt" patch by "remove hard-coded
  external clock frequency" patch
- Link to v1:
  https://lore.kernel.org/r/20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@apitzsch.eu

---
André Apitzsch (5):
      media: i2c: imx214: Reorder imx214_parse_fwnode call
      media: i2c: imx214: Prepare for variable clock frequency
      media: i2c: imx214: Make use of CCS PLL calculator
      media: dt-bindings: sony,imx214: Deprecate property clock-frequency
      media: i2c: imx214: Remove hard-coded external clock frequency

 .../devicetree/bindings/media/i2c/sony,imx214.yaml |  29 ++-
 drivers/media/i2c/Kconfig                          |   1 +
 drivers/media/i2c/imx214.c                         | 263 ++++++++++++++++-----
 3 files changed, 217 insertions(+), 76 deletions(-)
---
base-commit: ae0384b772a260975af192746d900c328392e525
change-id: 20250406-imx214_ccs_pll-e4aed0e9e532

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



