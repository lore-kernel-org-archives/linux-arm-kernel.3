Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4760FC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 16:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yWEo1m5U7JSWIhc+bgC37Go+1MRYNAMl/oywARAfabs=; b=Db8RMjUmwSUXMC
	O/ARrIg68jjhANPMLpaSEZW8BsIL23LTj75ACQiUdlVhORkssoN7MyqG7ewsoWAMrvQqWclVBv3lX
	wgkZR9D7RibuebS38N+AEQYIWBJGETMsvf7SckKV9qXLbH4byHWmkWYmQMIyISaIxJx4IYarjqn5B
	cB7FTlzGFetO1y7t/mUTCD6bBqQvgUp1OUSb+fGhhC5CNqwnOFyiEyxCj2sOqCXwA1huXeAn8L36w
	m9ND42SRYnCn3hsHZ2v0k5A7sH0xYu8Arcz4T8h4yBNroulVSpRvPeFQF0jUPk1P4N/PjeVFc/eLx
	zaCoI9cpmOMznCHm33rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIhY-0000000GpWm-0voM;
	Fri, 24 Jul 2026 16:24:44 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIhV-0000000GpVY-2Dbr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 16:24:42 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so380946f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910279; x=1785515079; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yWEo1m5U7JSWIhc+bgC37Go+1MRYNAMl/oywARAfabs=;
        b=mAHJD9EWLRyCQq7+KLWQKXtikDlc+RWQLpdOiajBuUQJIfN3CDDJ1xctpfYUgrcgk/
         bBLBSReT5+7dloUaEgQVcfUsDrC77ZrazYLlKBgw4CsKRGAyAoGvE4ns3jjU2ZELohEn
         WslFlOt48KJvAaw9E4BUbfLMvNvIxNSM74PbYaFpwSDuwnNgaFXmHdmo27lh6zpv2/9l
         E+j17gdkP3DOs92wyc348ENeewzYqYUf5xaSVhC1AdtrYRN76wqQhkVtSgjItO6r14ov
         eT07jqfotrOmNARy/8WpP02JxVweYfWfUZ4pb3lDkjGMZBdtR1isUgfglWcHVTEPYcvu
         z9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910279; x=1785515079;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yWEo1m5U7JSWIhc+bgC37Go+1MRYNAMl/oywARAfabs=;
        b=XYkUeFg/cPDISjwzvHTnd5wT9fQveYZzjEkBmJf3AWDOwf47wY2PXqYmF0grEze0B2
         rFpH0J1vvAb18Ytb6uEuyu6GQxH823X+m444KiEDhc52mONEdL30+YANLOqMFgL44H1X
         D2gQb0atiRw90QoX29PJ2YpGqvb0W//Iic4ZQ+22Wd89OtfbaYBttwzj63sWXaHihZpR
         GxSpWHTkHwbKvhvAg3R39tAjj/d2MhJudxS4c5335eLrTVRZwF5132Iu9TJRAoNR2/jy
         5U3TLmnS6VjWIlGpa2jWOdKaHVGO3YjolyEC5ihprSZFQGHLhD1vonNZqt8tZ1SEHzKT
         dZdQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkB8rqYv9g4SowbGLOWfMj03/LlSxhQEUR/ot36OwMYA8wRWZV2lwujfxp+PanxmhHz0Y8zN5MZ8pLpB/rbnhb@lists.infradead.org
X-Gm-Message-State: AOJu0YwQZlIj8cIeXHopZu7vbbr91yzsn+Hxc4DTHdYUNz3NAzEeHwTk
	6dmsEe8ovW/cipbwCXyCK7XPrLeiE5W1fLc06CU2rqxqHiLIIT4Dn5QZ
X-Gm-Gg: AR+sD10izO1KnfkYTzlVTIkyiZXUFII6DuOkjJRjCTheZ+lubRsyXoItMTESJFlsxz3
	Vs2NbxrhmST4iaf1YY+w6EvvO8JIZ+t6V3e2KGo6FStSk3t1v83eRU4xtx+VfQPp7jN9KFEsGYR
	HDsUiS68it+QP0QCPKk2o1v4yYi1g1zseFg5lrCt3bFSOtI1FoNg/PQkTfrcU0/CaWucjZp6uXR
	N6rokBpriWx7InA0OxF2avmwvGd96b6ICLzicOFe8X5MWwHoW5z35u6jGki9lsGDSms5FrWK2Cb
	B/Qg9U6I6G9qf6v2yiC0fSxCm65CnIU7n8ZZkqrc16F2yZKVe+pUSwk7lg4QH4MwHzFc6unMsbV
	SyGiHEvokV2Kiexbq8FUAhxYmfRplWZ48tZKPoFAdtG7v8EEA7ObCpRC2j/Uh5mPAI/PxSlT1RD
	vUEjJ3M1pX4brraahNzuXEDKRYbw3L57tvoPZZqlu6gLxCnQXd3kI2qIafBWq0L/WOhr3kz7oub
	WBj4hTxrWlIZ6K7
X-Received: by 2002:a05:6000:4802:b0:47f:763e:e03a with SMTP id ffacd0b85a97d-47f8dc7a25fmr9546533f8f.34.1784910279327;
        Fri, 24 Jul 2026 09:24:39 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:38 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/7] arm64: dts: freescale: Add Verdin iMX8M Mini
 overlays
Date: Fri, 24 Jul 2026 18:24:26 +0200
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALqRY2oC/3WNQQ7CIBBFr9LM2jFAkRpXvYfpgsJoZ0Ex0JCap
 ncXG7cu30v++xtkSkwZbs0GiQpnjnMFdWrATXZ+ErKvDEooIzrRYZFYKHmekcN6DQH9MsaMtlV
 GauOMchrq+JXowesRvg+VJ85LTO/jp8iv/SVl+y9ZtUBtnTetH/VF6L4WrKf17GKAYd/3D50fR
 OC+AAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_092441_591752_1BAF1962 
X-CRM114-Status: GOOD (  11.16  )
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
displays, and Cortex-M4F integration.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Verdin Development Board
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- DSI-to-LVDS adapter based on the TI SN65DSI84 bridge, combined with the
  Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants
- Cortex-M4F remoteproc support

Cortex-M4F support is split between the SoM description and an optional
UART_4 overlay. The SoM dtsi describes the remote processor and RPMsg
reserved-memory regions, while the overlay reserves Verdin UART_4 for
Cortex-M4F firmware use.

The Makefile entries build the standalone overlays as DTBOs, add
ready-to-use composed DTBs for selected carrier board and accessory
combinations, and add representative composed DTBs for build-time
coverage.

As discussed in v1, the overlays for the OV5640 cameras will follow
later and use the partial connectors model to specify the Verdin CSI
connector.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v2:
- Dropped the OV5640 overlays, they will be added by a later series
- Link to v1: https://lore.kernel.org/r/20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com

---
Ernest Van Hoecke (7):
      arm64: dts: freescale: imx8mm-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8mm-verdin: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
      arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 7" DSI
      arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc
      arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F UART_4 overlay

 arch/arm64/boot/dts/freescale/Makefile             |  35 ++++++
 .../freescale/imx8mm-verdin-dev-nau8822-btl.dtso   |  14 +++
 .../dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso   |  88 ++++++++++++++
 ...-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso | 104 +++++++++++++++++
 .../imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso  | 129 +++++++++++++++++++++
 .../imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso   | 129 +++++++++++++++++++++
 .../dts/freescale/imx8mm-verdin-uart4-mcu.dtso     |  14 +++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  33 ++++++
 8 files changed, 546 insertions(+)
---
base-commit: 4d0d3a3d1993a41b2bf8d28aa6c6071fa1a3bff7
change-id: 20260707-v1-verdin-imx8mm-dtbos-a326146c62c4

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


