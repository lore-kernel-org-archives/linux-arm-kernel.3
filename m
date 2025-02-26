Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDD3C18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AAI++sx2S3RJZTy8ln+4wl1FDEIkh8pRsIqLMpUtMfY=; b=iXDAblmrGYBbdOyd+V7p0lGm2D
	f4mm+F0j30yZVh2puUncLKqWv162ASdIlMuk0htChYH9JND4G3i9qmKCIZqNhVMeGdcnzLwu564r0
	dRhyeS8wUi1T7rC4DZ0wUlyRskfNRiPj2wzygRJ3EeAVz3kRSsX9rknxRalxvZTKSrM/3yddjydVo
	f9vfLOJKAIuWuNdcdj9omUbvphC9SAH63WZ9eK0BceMVXbCVCQyWOq13t/wFAE490SdY3U8cgpLvJ
	wtm+jjAEDz5rw2j383VtDGF0/9J4L1aG3XKL40Tdm/hS6aey1soC5gX7pVV4ZGkM1rLJdoPCeXPTX
	UPzEhQag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIWx-000000047Sf-09w0;
	Wed, 26 Feb 2025 14:36:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIFx-0000000432A-2U0Y
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Feb 2025 14:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=AAI++sx2S3RJZTy8ln+4wl1FDEIkh8pRsIqLMpUtMfY=; b=jPlA2MExTDTdkf8MHmOyGqnFRJ
	CBS2fPaL7xZI7+mvd/v+OnTwMQmCRFTYM9MflisnLk5WGpM4Q3Xxivc/jWwJbKhs2rnOyEfS1d2j5
	TkqhVvteArlFB4Xb/yJLnixkxW6IJBZFm+Xs5CR7Q0sOnbPNOiwbbxm89mfvgdTjc2WaSxaRGhrWG
	fd9OnAdzeghMVLlGVAMtjtcw0THxumqTItuWVz387gMVZJ++wSQi01g6qg+4ThOO9drEByQiAAcSl
	ZXuPYN7RUFBzGWm3VTNEky7t0CmdvdikfHpNOPn+Eii1qcI83NbHdHDiudTSUtfwiCqhnhgOp4ni1
	tgyWKxTQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIFu-00000003cXe-0u23
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:19:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E98B65C0416;
	Wed, 26 Feb 2025 14:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 725D1C4CED6;
	Wed, 26 Feb 2025 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740579558;
	bh=qPNp8kJ1SPfm9hzzYuFUJ6PYED9G/nfRjZrkm1H8psw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bL+z4glLMLjtif7nD9V/K+zaxSZc5JKr1f6vzndjetO9s6CLSiE3EieO271ZapLua
	 w4DbabGONJtBQ1cSvWyZdKcxYMYuri+cVoFNBGE9GL1l1neZnpGDVJvmQtX9cbgpPE
	 lOeGOExJzZRd4A1YOpI4/eq7TyJG7GOzboFnZCM1G/dPHWZaCUpgLMlrgeo2yMFdxw
	 qAfj7yCnENDpX1iu52Jf2jWpMSjN4jENNcJdsPHbZWxG5v9Tt9l3KjlifPE+GzecVZ
	 h1zoPYVbK32Yj86q11vI5Wr3oKSXojO2e2y6cAFgLNR11Sm7bsA2W6tVdTGNa7fjDd
	 slxQu3SaHJwFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F8CC021B8;
	Wed, 26 Feb 2025 14:19:18 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v2 00/12] arm64: dts: freescale: Add support for the
 GOcontroll Moduline Display
Date: Wed, 26 Feb 2025 15:19:11 +0100
Message-Id: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8iv2cC/3WNQQqDMBBFryKzbkoyGpGueg+REuOoA2kiiUhFv
 HtT912+B//9AxJFpgSP4oBIGycOPgPeCrCz8RMJHjIDStQSsRLseWXjXgOnxZldjKZBVA3JmjT
 k1RJp5M9VbLvMM6c1xP062NTP/m9tSkihre37sValrsrnFGzwawzO3W14Q3ee5xejftpzswAAA
 A==
X-Change-ID: 20250224-initial_display-fa82218e06e5
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740579556; l=2470;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=qPNp8kJ1SPfm9hzzYuFUJ6PYED9G/nfRjZrkm1H8psw=;
 b=RO2wdKrxZIYN3bZWZRvWLLnJ4q4OJ3zzHkzPM4aFfF+XjDIXbjVCFjRpeOidaQRPXZt2qJz7l
 zFN4KACCPHFDLlu/B1Tc95xI78GkFMvm5PPtjNbTX4mec1Lj8g+V8Sc
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_141922_841108_BB677525 
X-CRM114-Status: GOOD (  12.02  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add inital support for 2 variants of the Moduline Display controller.
This system is powered by the Ka-Ro Electronics tx8p-ml81 COM, which
features an imx8mp SoC.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Changes in v2:
- Dropped the trivial-devices patch
- Added a patch with bindings for the gocontroll,moduline-module-slot
- Added a patch to spidev.c to enable the spidev driver for the module
  slot
- Added a missing usb-c connector in the av101hdt-a10 variant dts
- Switched to the new bindings for the module slots in the base dts
- Fixed some commit typos
- Link to v1: https://lore.kernel.org/r/20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com

---
Maud Spierings (12):
      dt-bindings: arm: fsl: Add GOcontroll Moduline Display
      dt-bindings: vendor-prefixes: add GOcontroll
      dt-bindings: connector: Add the GOcontroll Moduline module slot bindings
      arm64: dts: imx8mp: Add pinctrl config definitions
      MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81 COM module
      MAINTAINERS: add maintainer for the GOcontroll Moduline module slot
      MAINTAINERS: add maintainer for the GOcontroll Moduline controllers
      arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM
      arm64: dts: freescale: Add the GOcontroll Moduline Display baseboard
      arm64: dts: freescale: Add the BOE av101hdt-a10 variant of the Moduline Display
      arm64: dts: freescale: Add the BOE av123z7m-n17 variant of the Moduline Display
      spi: spidev: Add an entry for the gocontroll moduline module slot

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 .../connector/gocontroll,moduline-module-slot.yaml |  88 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  17 +
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     |  27 +
 ...tx8p-ml81-moduline-display-106-av101hdt-a10.dts | 100 ++++
 ...tx8p-ml81-moduline-display-106-av123z7m-n17.dts | 133 +++++
 .../imx8mp-tx8p-ml81-moduline-display-106.dtsi     | 535 ++++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 547 +++++++++++++++++++++
 drivers/spi/spidev.c                               |   2 +
 10 files changed, 1452 insertions(+)
---
base-commit: 2bc63dbeabecce860eb8b261bf67b97552fe7747
change-id: 20250224-initial_display-fa82218e06e5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



