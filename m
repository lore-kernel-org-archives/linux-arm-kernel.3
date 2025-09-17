Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B40CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+D5B06vroVqWtb2LSgm7NrHxeVosJ6vlqrc5RxlweCk=; b=Kbc4lszNo3zsU1
	nnZmqpMDrJGi/iBYrMDci2dPo5yeylZgtTjPBU6Vx2tiQ9LPGcN7N4re9Dr4g/AstdGzY9ejMEQ1b
	Obn8KrJXVB57UkKY5cTdQaeL+gsyJQHd/zE3GurJY2Nb60QIYQT2m8oCX80NU47d9owcLquWHgmZK
	xjU8PzXEa6h+0RaBC/4wd6z1J6QvY5h7v2iROTXRGlCg5367khbUF0i8Rs32NIKW8wxbaWhVtBWgX
	j92DPKYjb621LxzQE5PMwhH2Jawm6UbHX7eW4WNUZ32mw29uY1vnm6SkG37uyv+MN98gMjlTMD/9h
	hSvjTl51INVmspLNWPvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymNU-0000000AQhh-2AyZ;
	Wed, 17 Sep 2025 07:14:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymNS-0000000AQhX-2s8O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:14:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F918601E5;
	Wed, 17 Sep 2025 07:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFAEAC4CEF0;
	Wed, 17 Sep 2025 07:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758093293;
	bh=+SEj6xYX/EWfxD7ME+D5evkEJEd+ldO13clpGMiIubE=;
	h=From:Subject:Date:To:Cc:From;
	b=eB3yTlprGYoL95eR8DwgCRLPTWIb0VclyCs3Z/rrBg2ahxJKL1In23VY5ydz+mfUF
	 yTfE4vnd6kd95goSx08kaz+CNwg2FEE9xTxx9wfelzQDt95rNasUnaOgGr2KZdPTl3
	 NSrKuu5nOiecUMyHyBOJeJ/3VbrsN0PvyQZwNlcB5LJZ9jSt112H8n/10TL94w1c9L
	 2MyP655KenpSWSd6a8NaJAb+s4migGmh6gjkZwAiArwopL3+ud12NnDUr2jYwYBuyG
	 AuBW1NiBCU4jjfW4R78/LN+LauMhduxR+L11JrT/Yp98ZgGB8Ym9z6N+CVanTNDu4a
	 R5etlgOR1Xr6Q==
From: Andreas Kemnade <akemnade@kernel.org>
Subject: [PATCH v3 0/3] regulator: sy7636a: define and init all resources
 needed
Date: Wed, 17 Sep 2025 09:14:28 +0200
Message-Id: <20250917-sy7636-rsrc-v3-0-331237d507a2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANRfymgC/22MQQ6CMBAAv0L2bE1ZoFBP/sN4qGULjQbI1jQSw
 t8tnCTxOJPMLBCIPQW4ZAswRR/8OCQoThnY3gwdCd8mBpRYSS2VCHOtCiU4sBUWpTHqYQzaElI
 xMTn/2W+3e+Leh/fI8z6P+Wb/f2IupCBsGmV0sqa+PokHep1H7mAbRfyN9THGFFvXaleWrsVKH
 +J1Xb9XMLYn5AAAAA==
X-Change-ID: 20250906-sy7636-rsrc-c20aa6baa2c4
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <akemnade@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=1931; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=+SEj6xYX/EWfxD7ME+D5evkEJEd+ldO13clpGMiIubE=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDBmn4l9a31Y8Odk5cG7r/iix43+v9OTwF/mc742cvCte+
 7DiueBHHaUsDGJcDLJiiiy/rBXcPqk8yw2eGmEPM4eVCWQIAxenAEyETZThv+vUL6V1VouVt3NJ
 bIyQYLGpsvQ7JZgqoyG9yViq8MG+vYwMs0rn3IuWj1rPHXv8OkvghaYTjezzPZLm3bz0zEEus8u
 TAQA=
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
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

The SY7636A has some pins which can be hardwired or used to have more
more advanced power management available. As several devices containing
this regulator have these pins not hardwired, but instead connected to some
GPIO, enhance the driver to have them defined and initialized.
Also add the ability to power off the chip completely by defining some
input power supply.

Actually implementing better power management is planned to be
implemented as a second step. The regulators in the SY7636A should only
be on for a short time during display refresh, but currently they are
unconditionally forcefully enabled by the hwmon part of this chip.

Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
---
Changes in v3:
- shorten descriptions in binding
- Link to v2: https://lore.kernel.org/r/20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org

Changes in v2:
- en[-gpios] -> enable[-gpios] in yaml/dts/driver
- fix en vs vcom_en in error handling
- comment delay
- drop applied commit (rebased to regulator/for-linus)
- Link to v1: https://lore.kernel.org/r/20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org

---
Andreas Kemnade (3):
      dt-bindings: mfd: sy7636a: Add missing gpio pins and supply
      regulator: sy7636a: add gpios and input regulator
      ARM: dts: imx: e70k02: add sy7636

 .../devicetree/bindings/mfd/silergy,sy7636a.yaml   | 11 +++++++++
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi              | 25 +++++++++++++++++++-
 .../arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts | 24 +++++++++++++++++++
 .../arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts | 24 +++++++++++++++++++
 drivers/regulator/sy7636a-regulator.c              | 27 ++++++++++++++++++++++
 5 files changed, 110 insertions(+), 1 deletion(-)
---
base-commit: c05d0b32eebadc8be6e53196e99c64cf2bed1d99
change-id: 20250906-sy7636-rsrc-c20aa6baa2c4

Best regards,
--  
Andreas Kemnade <akemnade@kernel.org>


