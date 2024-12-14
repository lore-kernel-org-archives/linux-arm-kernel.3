Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9521BE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 22:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ACrh33/0VpPxeYXX8I2uo19L8kPY5JYfKU4wzm3RzKU=; b=HwsliCNb+xXlqXPpQLrMF5dyvp
	+GR067Ek2AARhbYi1T+xzO3R9ezTMGW21GFmDN6x+bCIGs4badnYj4z0WlL2f6P97bBVczVck5irX
	5AYiT3AEBidnfM999Rumu99QmjBa5ibb1GTk370KG3m6h2nFWirBNNv0SsM84tAK9pMnGYprac206
	jprPHvR6xquBGunCBBQ3x9OTeS1WKrUhVlaD7f1EV8Dtuco2DxMw+grlrtlshk1l1KXW+qRrzi+Nj
	QrJWkH8+yUj+mBjqhUO7Kcbj6EetC0s20zFGLfAPcTi4GkPi2AyLPrgWAwGljX22xDWgkFchw9rGX
	Tp4GAc8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaK6-000000071wb-0Ct6;
	Sat, 14 Dec 2024 22:09:18 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaIm-000000071lm-3Ms4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 22:07:57 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so1510405f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 14:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734214075; x=1734818875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ACrh33/0VpPxeYXX8I2uo19L8kPY5JYfKU4wzm3RzKU=;
        b=W/x+chkETYs5xWR9HA6ffZIgd2tl3jWWIKkHSFP8Nb4siBryyR+Vjt/15rQMBc2qm2
         DkEOQzQb3O6goYmtcPNhIGntapgLnNUzPSQWXChUVGfoV6Jgi/EbPMxfXBqQm4amgIAk
         lEXn3YgkDeDthe7rk50tktBUkzwFQIVWUQF0euGMXzCCXWT9ojIVSHaYpEj9KkpU7NXM
         ke+zGzzbKucKrtnLKeR47x+9W/ZqnnHnJ/JZ3Q1DUyxLoTb1XuuhtgNaEHV2zEpGpZ0h
         TFct5bqYR2OFI/WRpV2W4+sXQfENi906d8wOP3rJ5kPm37g/6WaeT6QD4LBINoatbXAH
         84fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734214075; x=1734818875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACrh33/0VpPxeYXX8I2uo19L8kPY5JYfKU4wzm3RzKU=;
        b=aAELYKd1+QLkRIcPM6EwPDRQw7kEH9N10Jjl/WCh/8u+SA7+6A5wIj+u99Mpavb73n
         5xKA4e1LUEj8PwpMmaEzZUbijv50TxuslslnMgalA2CM9RYRoJh5hE2LWutx82kOW8vs
         daPW0ql3kLvhVFqttWumMpXxvayirg36j/i5HuJjV0kV4oC/htEDIHx68UiNy9gSmWb9
         yeyeLEupKkiYx68ex2pUzs9o2ydSe4EXM8MAAX4nXB2J/SnMgdCzpJ3BFmlSqaCJOeeG
         5hXMUeh72z25MG04KxyvPWe8QSyQdl5ioh7BHnFcYV8IapO2n8TyZhFKFI74XWCi2Otu
         UiOw==
X-Forwarded-Encrypted: i=1; AJvYcCWrejuidrJUwvOdfhdNK9IIWBqnIgP8abZJYe1g2yR9oFLQNo1GSjJJ2tj/TqZ8p01szOunOfsDuoDJ6ohv4/Ti@lists.infradead.org
X-Gm-Message-State: AOJu0YwFnO5R/J+fAp4O8n2LAC3uKT941A+7Ck9MljvTBn55/HtWyolm
	KTSGesLn/KdvkEEVnjb6wD31thCRvjOFfhAVjvgPVsNgYSE20hce
X-Gm-Gg: ASbGncudbJp2yU7cylSBJ3BSAd134ZyGtRXQQRK+aaW+aKWVg7ZPJK3a+eRZ8KxKCIV
	is9Qb6ynLFLfZauf8JV3dXXylleLaoYG7uS+u7OwHEHjBvrXb0KP6tQW0KpownffNMrET9J99wm
	X+Q2ok7ZRWOb7t8U5cM3DNimI97o0QDtSUIpMP7L34ZCl88bqqo+pIMBWM8/q8kfEiIzMwNBeCj
	ogc+9ZPvBikwvNDeyeDPIC0H+D5NSIwh2ihl6KFBVfo+Z8tjJfS7MSOYku8xfdv/zBqR3HeXINP
	bMFjxwaFlK2YqF29m/L5Ag+nYggyxRpw
X-Google-Smtp-Source: AGHT+IEfd+QSAC7E/LXZUUhBYjyLml2o2c1E1vNqypWjINCbXo/G4qVPa0wBP1p2fCV8u0Syz7iBSw==
X-Received: by 2002:a05:6000:460c:b0:385:e961:6589 with SMTP id ffacd0b85a97d-3888dcd4789mr5336184f8f.20.1734214074709;
        Sat, 14 Dec 2024 14:07:54 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8049facsm3696434f8f.79.2024.12.14.14.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 14:07:54 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: exynos8895: Add camera hsi2c nodes
Date: Sun, 15 Dec 2024 00:07:50 +0200
Message-ID: <20241214220750.723354-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_140756_842717_DC0CF2FF 
X-CRM114-Status: UNSURE (   9.39  )
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

Add nodes for hsi2c1-4 (CAM0-3), which allows using them.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index 90b318b2f..36657abfc 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -292,6 +292,50 @@ pinctrl_peric1: pinctrl@10980000 {
 			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		hsi2c_1: i2c@10990000 {
+			compatible = "samsung,exynos8895-hsi2c";
+			reg = <0x10990000 0x1000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_HSI2C_CAM0_IPCLK>;
+			clock-names = "hsi2c";
+			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&hsi2c1_bus>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
+		hsi2c_2: i2c@109a0000 {
+			compatible = "samsung,exynos8895-hsi2c";
+			reg = <0x109a0000 0x1000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_HSI2C_CAM1_IPCLK>;
+			clock-names = "hsi2c";
+			interrupts = <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&hsi2c2_bus>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
+		hsi2c_3: i2c@109b0000 {
+			compatible = "samsung,exynos8895-hsi2c";
+			reg = <0x109b0000 0x1000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_HSI2C_CAM2_IPCLK>;
+			clock-names = "hsi2c";
+			interrupts = <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&hsi2c3_bus>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
+		hsi2c_4: i2c@109c0000 {
+			compatible = "samsung,exynos8895-hsi2c";
+			reg = <0x109c0000 0x1000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_HSI2C_CAM3_IPCLK>;
+			clock-names = "hsi2c";
+			interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&hsi2c4_bus>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
 		spi_0: spi@109d0000 {
 			compatible = "samsung,exynos8895-spi",
 				     "samsung,exynos850-spi";
-- 
2.43.0


