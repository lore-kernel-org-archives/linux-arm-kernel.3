Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA9BC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f0jJjB7Jvsz4fWWVlAehxvBSwyf+RWKNhTeHpJeKZVs=; b=3RGrXq+6C3Sw7BNZSeWxqJhj7l
	PbK6TdTdy2JLeLJMDBDOkV48rFKrWcCDsgJH4FLd4sBra/215ORpgaBkC+Hz39WJkn6gVnud7YBkW
	vOeg6znoSNDF8Q6hAWufrMlx/sWqlS7+SZRMqj8rPdv+WiqU5sJbGAGtVLGNmxsA3s7ArgNPTAy+8
	EdLuN9kZh6fwiiOMUTeIN6Hd94h3L6HsAbjvZyTjjAIsUc6ReeA7pZ53BCyCdYd8TQix6sb13Vm0S
	3P/4AClT2U0U9vw6nBj+gzIGV3Nyvv2qN9QTltzNtGXKzuxHBBgPdNalWOO+GzUYxqAoG7eOeHvEW
	oFjeM6wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSukK-0000000HJcd-1Wb8;
	Sat, 21 Jun 2025 09:42:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSufs-0000000HJ9K-1HlC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 09:38:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86DDA5C48C6;
	Sat, 21 Jun 2025 09:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7E16C4CEF0;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750498690;
	bh=CitvJ9lBuFBmvOFYluWUYT8ZBS/Uz4ur42/Hat5GQ4A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lMLZt0KerD4uqkCP+1qwLo0727PbXucOv1hg/7s6Cuxl/2zuCdwJQtcVtzG7aKlA7
	 LfbOeIz66N38SilHdX7ToDXonFBdhGSY2JTvil/Oma2ZN6gt6rNEMrtgDQKyPAntKh
	 YFpiNvoODqVNHyF630W2ZIftR+a58k3qYtwPyZFxAKXgcF2dXrJWMbz55WhyqZcXmM
	 s+h37O4atm+1Mske6iYuPlHPVeF286BZMOUwhlk0JoTa3LcDgPVlEHOoaE3bZn3Qt1
	 ZW4A1lhjd38Agz3r0ihErq9+LRnSiDXqJx+mQW9BZrc8/09odbi/VNC8n+4wuyNMRs
	 nC1M5rZcl4NmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A68C77B7F;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH RESEND v4 0/5] media: i2c: imx214: Add support for more
 clock frequencies
Date: Sat, 21 Jun 2025 11:37:24 +0200
Message-Id: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
 Ricardo Ribalda <ribalda@chromium.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750498689; l=2067;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=CitvJ9lBuFBmvOFYluWUYT8ZBS/Uz4ur42/Hat5GQ4A=;
 b=qBVnWGX9fYuR/NlJubqUCHiLTyH2Q3JoBGcZkE67yh6g/S9FGcRsNoxIwPC1LbX5SM/XACoKO
 Voew7dq6cXqD/LlGxAEJptcDY3LE5clDojWotTadzEfnuWAU1k29RlC
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_023812_431748_A0B234B4 
X-CRM114-Status: UNSURE (   8.87  )
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
Changes in v4:
- Add missing colon to error message
- Add A-b, R-b tags
- Link to v3: https://lore.kernel.org/r/20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu

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
base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
change-id: 20250406-imx214_ccs_pll-e4aed0e9e532

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



