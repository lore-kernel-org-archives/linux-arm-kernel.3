Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C50C105F781
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2itlYxryxighjPrEcU7jThIOdut7hYtrYJKXW7qdI6c=; b=uQpGOOLqgUIblH
	5/iw2JprbtiF0TLgO4QGv86yh1dmiQqSKLHJzSiu1iE3C+FLzKirTd3UeTiYsKd42e+jv0u6ueADu
	zrQHa/n48i/c2XVVQmiRbzgZUD6AhnwWSd9rvH/5KZ0QZWBn3PqJ6EJ+Hdium8paFgp3CnEFgmPIp
	gnpkUBx+0XvTAP7AnfAglLOUEP4ef/tJ/2VO4ekrUGXTmAv6lfHshzvX2JE+sSKK3ZmGI3Ef2pU2S
	PUY6eiRj4WliUTjMxIJjCenNalV2beMOJmci4mdAe6jeGbkfzgy1LCpqGinUZoGYUPofNvYYhHZMb
	DnAkW/Vewm0ClKfeoWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yLS-0000000HKF6-3GGm;
	Fri, 13 Mar 2026 08:58:10 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yLQ-0000000HKDz-27Cn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 08:58:09 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so17126135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 01:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773392284; x=1773997084; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2itlYxryxighjPrEcU7jThIOdut7hYtrYJKXW7qdI6c=;
        b=T68eU6CYQi3dnOfgpoBPicuyTLhcAduRAeMGM39VkjRIQE3xBNaEZdO13oQfCRqETn
         q3Icb4jMszRoTJ5mtsmekJoYemxkT5ED1WU3J2TQArPqLgy478bO5gGXRZvWRgml4/zm
         b9mXnt2Utc/fwwCnJ9KQKFQ5zU0AWpq8qDWnFMEkuGJeX9munw0sAEtw69VeYtsJ9d8p
         NRH8EWhZxTdW10EAt5wrxl2hDgbKUwgg4n9Qtl6wXDydqZOVjAP/QpUSmtuyjEGI5q2B
         +7kRRJrx310w0LlHpBzjOUYD95MpraBRa2onrbcr3UhO/G7IEA7GPTu+K2f7GSZTEhXg
         LdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392284; x=1773997084;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2itlYxryxighjPrEcU7jThIOdut7hYtrYJKXW7qdI6c=;
        b=BC3IB+Xrb3q9aDRi37rRImlxZb2zYY5t3vrvweQjaPfOlvwzaV63Ek+Qklhh3X8wFH
         uhyiBP9iRfvAOn8r7NX1iXa1sOCQ+6r7a3B4b6KilnkMiNJa/S9kqpagdgngMtWNWBT0
         YrEvd6Z6FxWeC9lucznt2lQSq3pPwtxdr7M5weBry58OF7g/vPRyGtobCENXjejOGP9j
         7d+rSMgA9Ze0x2TOO1skXvekekuWcBArJjBW1JZQYrjavNA/Eok2q38ATSTHo/hPNLKM
         H35efBBhqR5iOdP8ylUUwoIVlKeUq2xAxswS5/QYxQrOBCjXjOqFoXzqPW2BF1bU7J/6
         Jgrg==
X-Forwarded-Encrypted: i=1; AJvYcCUNMA36HiFJpRmcc6ht1CmeRYjX6pV+4G2cAeBy28C8iajuxmDGnUAipb+0RZQDZhFnDXrZIMfKnTdkxgiMNIMV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzav2kw/aOF9ceKP706V9P3JZphXrToWofuCkG8hXsoczGr9Z+
	W9zGpcxMlp+8y3f4VxnQeYMCQs2dZ++svxk+BwkjVIBwkqApmF/mXWS+
X-Gm-Gg: ATEYQzzdR5cJMZOSUfIN6jzqFxR4eFlX7ytIvaoxCPX3QlpOZ9HvM9Dk4V+omWG+t7q
	ebP3H/ZcLOWg2iJMFkViJG1458mD/sVu/v3bZWpTLlhn/BsHC04uoXWxNqn0wL5dIYfqMW0fJGD
	uFIe2zEH35dE0XurB5xBTdv2O+xHE20Ko8piO2bOzDaHiiNAFT0ojBrycchEcUkk7e/NF96e3kX
	xTVs2LH21/MA2d7jaUv/3ADlpkuqG2a8kdEVqKn+5JEXXQbpMuoUZAZcow6GYY0DlgT9tChk8T9
	jXpaxf9vGLlYRQML3yuW8jdI5rfKWW/1rKm+83QFm5CwYVc2RY5Erui0gxbDfN3vVG1/lDxnU1N
	fIcszDKPTfQn7V2rV6JX52/uMHvoKZKYpCDniLiN+nwXu0DKE4onRudkSlPF3zRzT7xDz5thgHs
	Fh0mlLtlu0SGe5dM3sgA6zGA13o16clF1Zhs9ZtxJbPZKVvQ5zsgXcyhKCUxFLKO3YuxJ1Nh14X
	wHbRgD92I62u2dxBFfuEKTtDNk=
X-Received: by 2002:a05:600c:45d5:b0:485:4535:73d with SMTP id 5b1f17b1804b1-485566cfb8amr37509835e9.2.1773392283369;
        Fri, 13 Mar 2026 01:58:03 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm7663718f8f.36.2026.03.13.01.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:58:03 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/6] arm64: dts: freescale: add Verdin iMX95
Date: Fri, 13 Mar 2026 09:57:41 +0100
Message-Id: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIXRs2kC/5WNQQ6CMBAAv0J6dk0pqYgn/mE4LO1WNkohLTYYw
 t+t/MDjzGFmE5ECUxS3YhOBEkeefAZ1KoQZ0D8I2GYWSqqLrKSGRMGyBx7XRsN7jksgHMEF9E9
 4MfQYCXpdY9/URmtTilyaAzlej8u9yzxwXKbwOaap/Nn/+qkECVdVObRSWXJNm3NoaT2baRTdv
 u9fA5NI6NgAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_015808_568579_FC923815 
X-CRM114-Status: UNSURE (   9.40  )
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

This patch series adds support for the Toradex Verdin i.MX95 SoM and its
currently available carrier boards: the Verdin Development Board, and
the Dahlia, Ivy, Mallow and Yavia carrier boards.

The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR4x RAM,
up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
Ethernet PHY, an I2C EEPROM and Temperature Sensor, an RX8130 RTC, an
I3C bus, one Quad lane CSI interface, one Quad lane DSI or CSI
interface, one LVDS interface (one or two channels), and some optional
addons: TPM 2.0, and a WiFi/BT module.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Link: https://www.toradex.com/de/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Link: https://www.toradex.com/products/carrier-board/yavia
---
Changes in v2:
- Fixed imx95-verdin.dtsi, imx95-verdin-dahlia.dtsi and imx95-verdin-ivy.dtsi node order

Link to v1: https://lore.kernel.org/r/20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com

---
Ernest Van Hoecke (6):
      dt-bindings: arm: fsl: add Verdin iMX95
      arm64: dts: freescale: Add Verdin iMX95 support
      arm64: dts: freescale: imx95-verdin: Add Dahlia carrier board
      arm64: dts: freescale: imx95-verdin: Add Ivy carrier board
      arm64: dts: freescale: imx95-verdin: Add Mallow carrier board
      arm64: dts: freescale: imx95-verdin: Add Yavia carrier board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   24 +
 arch/arm64/boot/dts/freescale/Makefile             |   10 +
 .../boot/dts/freescale/imx95-verdin-dahlia.dtsi    |  270 +++++
 .../arm64/boot/dts/freescale/imx95-verdin-dev.dtsi |  250 +++++
 .../arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi |  515 +++++++++
 .../boot/dts/freescale/imx95-verdin-mallow.dtsi    |  223 ++++
 .../dts/freescale/imx95-verdin-nonwifi-dahlia.dts  |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-dev.dts     |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-ivy.dts     |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-mallow.dts  |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-yavia.dts   |   21 +
 .../boot/dts/freescale/imx95-verdin-nonwifi.dtsi   |   16 +
 .../dts/freescale/imx95-verdin-wifi-dahlia.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-dev.dts   |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-ivy.dts   |   21 +
 .../dts/freescale/imx95-verdin-wifi-mallow.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-yavia.dts |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi.dtsi      |   50 +
 .../boot/dts/freescale/imx95-verdin-yavia.dtsi     |  217 ++++
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi    | 1162 ++++++++++++++++++++
 20 files changed, 2947 insertions(+)
---
base-commit: a251f9ed77f01f16adaaa1b3d2f568fc1b5acbfd
change-id: 20260305-verdin-imx95-upstream-frank-li-base-b57ab97c55c1

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


