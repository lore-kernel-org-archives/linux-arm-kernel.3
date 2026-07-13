Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C0EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9S1PRlH/iqWvGeBsKfAMCNUYuSclIYuofwpciyu1Yoo=; b=1R0QZp7s4gbvZb
	ZsvszoAmzqtXBznFfStS5FcVCYrchJQwZJWlTzJfzYPUnPOT2un0LOUq5fFouL5F7COXVwv1uAMYe
	+qbXolddpLKQnKoBn2v+iZNMOAiybBIUpxY9nRMARQaOfOpNF1a2ikhBefIINxYoMuskHX1zjCz2b
	h3RmYhPa0S2qQ+mZ2yS3TLbbL2++ZYjnCdJpefMlmi08Qhu18G5ihmSsEmLKwxXhUIjyxC/Y9+OWx
	vSlX5a1GI3QqnJo3J95b9bZ8AGgn7kSz5pWBWUWVmCKdrVgOeW4gXc8dac+t7N/dNXPOJ3JQYT2P6
	QpQ88cWckX2zv5jpLdNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFE-00000009j6w-3P1M;
	Mon, 13 Jul 2026 15:06:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFB-00000009j63-3flR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:06:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47362928f65so3179272f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955212; x=1784560012; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9S1PRlH/iqWvGeBsKfAMCNUYuSclIYuofwpciyu1Yoo=;
        b=TBUON5CJGk1tvCGaZl8LIA7aLhclfVNFxyVPyupi0L0jiRpcr3jvB8vRfL12ikQXy7
         uf4racpnwZdUtS425INoelg0r/IrSwWo4DUtCRWeytRSGDViHqyKYXQu7USHeUm9+CPl
         EO3JqnZeiuuDcsBXFRqblx4rsYFpTuT51Oeh+y6Vsep/olsas51sK0/bHAaK3PF/y+1t
         1GUwG+stDGTAxI26X5qtOPg6OJz7Xnc2j2Ogi8+ETdnj2sHDaC8QdzyR7U3aTz3YXBXE
         q4yc0mMPdYSCT07g904nDUgvbefvOwg+CNu/G22pCDXWtgtDXj9vMeyGV/itxHkC1OpG
         mOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955212; x=1784560012;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9S1PRlH/iqWvGeBsKfAMCNUYuSclIYuofwpciyu1Yoo=;
        b=TaydvyXDKhAm+IcJ39YDrL7AOO05kCVTUjaX/FYT9Kt2H22l7fYLeaHYjVm65w68Ag
         p0bYicIZrqs4v9+m0i39j5pzGxibZSne8Q8gPQoJ16+xNxEb1qCQN5MR1XmmU6Uimmml
         FXEAh1v9gz8gw/LIStAwvCxATwb7lyYIHk/I4O4IgER/AytZkotCC6O2G/EBb4BBlVhr
         B8grYznEJtCJvMQ7pI7rUhj4sxOdAIGDXKtnpEKID8hWSuWd18MKTgDnQWmWd4/dfyrx
         4LHEUAu7w30929HIseWSwuhYfI2k00vej6t+9HgTFVL3i4Wy32/xtkMX9ZjkuCeANJvb
         66IQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp36ZraUTXE7q/JnELi1RwB2r6SdZclmyE9lePVW76J037MyC+Cy4TyOJI3rq1IG+RLUiILcT7+NdY5COfKnA7e@lists.infradead.org
X-Gm-Message-State: AOJu0YyfQ4B5MatdeU7FwBivdm40Oe5xxk4R4IyQ6My2w78ZtaTxDSvE
	FQaxK7EZaVfVDGIKerxO6JL1O9bg16dHxbEm7iAbL2R9Lz7Fw0nEnpc2
X-Gm-Gg: AfdE7cnNFiLtRCDhiD6+qJZNV9g7sqAqq1euJ18cu3lAW1pIJLDTb8ZXitcxyEKS4wI
	OO+GPJGxwOoSX8bNLYiCMxKI2DnG/Dyng9eiCAKjqt+1YxBRG8lXxG/oZl5pzVvgE9NlPYCbgs/
	dcKseUEgwKhjFQlnOGE2YlW3j2QPGkIhtQ7v0bVUunK8KuOSQv+hDifdNg7msapkeVpHptCULjZ
	Zuv9iUWU1poksTYfV47OfofF6SH+Vy/PsuDzv/FGiYg5eDAlY4jJ4MEYA3waubWNDpfDunhvqCT
	PYDvaih7Uy1ICjej6uBw7pi9YqbiRy84WnaMyUOgyBNV4WIfjSd1j3kOtjOEE15i0WTF2j/NKBM
	L6Q2aPTFUuKrhlI0V/5EW+K6Hor1yjLb76XTTonyw0S5XZXRPh5tkekHaMaxeTP1ahvUY1yLTji
	OV0RU8AMJZvqpYxDt3gQF5luHcbcEUtNFpkKrx/pFPUM/P1bp+5063Yr4ErwvxAHscVunrYmvjK
	7NPhg8g61ICJ/XQ
X-Received: by 2002:a05:6000:400c:b0:475:a4ae:e630 with SMTP id ffacd0b85a97d-47f2dcd71f2mr11505336f8f.37.1783955211246;
        Mon, 13 Jul 2026 08:06:51 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:50 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/8] arm64: dts: freescale: Add Verdin iMX8M Mini overlays
Date: Mon, 13 Jul 2026 17:06:21 +0200
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO3+VGoC/x3MQQqAIBBA0avErBtQC42uEi1Kp5qFFhoShHdPW
 r7F/y8kikwJxuaFSJkTn6FCtg3YYwk7IbtqUEJpYYTBLDFTdByQ/TN4j+5ez4RLp7TstdXK9lD
 jK9LGzz+e5lI+RpD16mgAAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_080653_944675_97DE2C1B 
X-CRM114-Status: UNSURE (   9.86  )
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

This series adds device tree overlays for the Toradex Verdin iMX8M Mini
SoM. The overlays cover audio configuration, display adapters, DSI
displays, OV5640 CSI camera modules, and Cortex-M4F integration.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Verdin Development Board
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- DSI-to-LVDS adapter based on the TI SN65DSI84 bridge, combined with the
  Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants
- Toradex OV5640 CSI camera variants with 27 MHz and 24 MHz oscillators
- Cortex-M4F remoteproc support

Cortex-M4F support is split between the SoM description and an optional
UART_4 overlay. The SoM dtsi describes the remote processor and RPMsg
reserved-memory regions, while the overlay reserves Verdin UART_4 for
Cortex-M4F firmware use.

The Makefile entries build the standalone overlays as DTBOs, add
ready-to-use composed DTBs for selected carrier board and accessory
combinations, and add representative composed DTBs for build-time
coverage.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (8):
      arm64: dts: freescale: imx8mm-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8mm-verdin: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
      arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 7" DSI
      arm64: dts: freescale: imx8mm-verdin: Add Toradex OV5640 CSI Cameras
      arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc
      arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F UART_4 overlay

 arch/arm64/boot/dts/freescale/Makefile             |  41 +++++++
 .../freescale/imx8mm-verdin-dev-nau8822-btl.dtso   |  14 +++
 .../dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso   |  88 ++++++++++++++
 ...-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso | 104 +++++++++++++++++
 .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  |  17 +++
 .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   |  78 +++++++++++++
 .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   |  18 +++
 .../imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso  | 129 +++++++++++++++++++++
 .../imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso   | 129 +++++++++++++++++++++
 .../dts/freescale/imx8mm-verdin-uart4-mcu.dtso     |  14 +++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  33 ++++++
 11 files changed, 665 insertions(+)
---
base-commit: 10e06b5bd4be88cc89375227c31467734f6658de
change-id: 20260707-v1-verdin-imx8mm-dtbos-a326146c62c4

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


