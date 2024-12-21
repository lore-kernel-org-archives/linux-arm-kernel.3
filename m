Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0BCE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OE1x/SFoPuvjqQM46euQohKrxDfC87JAVBTFIJk/JVQ=; b=YIwKIjzR4oJYsux9LMIxpZNLBI
	G8/Fa8XYhp+mQEnO36ElYErc4kA14WrXB6TRzXVCxF1M5mQuH+yaMpuzpOymXCraIqExgimpokynr
	f8xPhNBLEhGlouhKWV6M6Jawvvtlpd9hQWHkq9ZfhpWI8e/RGcaBvc7eZYgs5uRmgrLL+aBsnlqy+
	gKl0YxhmtZT8FdC8RFrVWWquR3WBgJ7iCX4iSH7T04F63u2JlgYsdNr+p3Q0IMJwf/FVFioipVl55
	Fy2ukuCFINOiwsvFQjA+LdCU1uHTQL3j/tk8bsvuTMFkAKSbyzstHHQDrI0Fm28rApK4TsvNU3/Pn
	XZM8We/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP1Py-000000078L9-2P8B;
	Sat, 21 Dec 2024 15:29:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP1Om-000000078Dp-1u7T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 15:28:13 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso19452995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Dec 2024 07:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734794891; x=1735399691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OE1x/SFoPuvjqQM46euQohKrxDfC87JAVBTFIJk/JVQ=;
        b=U19nYgf0/1mnxgirMPvXr0wuE8IRntyeZReQcK9Emg7jrmrDtB3Es/Amc1ppDxedK9
         7YVjiJRxI4OiAi4rpKdTS+I5tUJT2YAMc27DqdU0Vz941Qr8sEceqwk6ZqmoZt4B6/e2
         zKZM6TfgYIGcp5zyvsQRstWORTnnhb9di4HUMZII4uatT7NfKT01rhiXUA1EnHutl7nS
         dxRA56ZqppmJwADQb1tMFz2AslcThLRfE3Cfa/bMe1sNzg28Yx/zAzCpfd+/w9Ta+U5W
         oGKe4CWUhsZ6OLkI+nAelbYkoN/t6KSKz43RJh8LnWbntpPoM902itizbLGOCLbagqdK
         T0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734794891; x=1735399691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OE1x/SFoPuvjqQM46euQohKrxDfC87JAVBTFIJk/JVQ=;
        b=fEesWPN7RvTZbRzxpxpkXIM9fTLThPiKarW2kWKjXkFjwTjwYj+ZEGAk6cUYxgiPbr
         rNIAzM4CKqxV+6u8QdJnMaeqBVcqvlHB1VBmP+N3QgN/S8vt4VIdOxrh9cbOBTVIAjYz
         +oOFB7VNjIt2O7hhXCKGIjy0V6dQDbKik2fu6YlDHX0un/qh8KsEDc+PUH4VxLHz8SSO
         02aNSLxNYnC8HWwzraafKFTXg7AK2pv+7grNiKWU5yb9E7llBfrCSHZzgWJ6ELHOk5wU
         jq54LWlw6qroTOsSd6N0ZDrYgE6miOV/7U7CWPhNj/NQcqAQvnuT2XdpNv2tQOM4K6sm
         inLw==
X-Forwarded-Encrypted: i=1; AJvYcCWnx7GrrJtCzdxlzMLlbyapJIVEbdaRRgaKQmbiX3hvOAed4YbkKsNkVc4AJaWiq+btLS+irfzlm11qUA6ydCAM@lists.infradead.org
X-Gm-Message-State: AOJu0YwBfjpXzwshBHSXAgzJzN+o3a0wlONnr94igIw/55p1zeQ7QOTw
	unuDl327t9sLtyxR9sR/HQ27dgrjdeZ6bdUHed1R/verImURew1D
X-Gm-Gg: ASbGnct3gShTQqv83WbGFcCpxIuzlSFEYxUYsTJb1VIih82jrN324I57tY7gR7xwkER
	wypAsCRy5OojGJVp+N2ZOGZlBf2QmGyuJsb6toHfnK0rOQi89gjixATBXKSP1Sf9IJMBe7mExpA
	cm3O3hPaPi80et/u6W2ez+WaFoJoLlGWlMT5yA2TY9GqQ5Og4j3pAMUPuXgX8WHTdYx0FNhmzni
	5Z4QtczCz/uTXiHivmgDsDCKtnGTfhr6ZnRGC/4ivaeyKm7RvAAX0S1bjTzte5LqzYcy3WvhJ44
	ZLqUPG8MwncQQWvG1A7qQIG4FbEUAxfN
X-Google-Smtp-Source: AGHT+IGoOuZNtYoITLOG2vWZWYpqu4FbjyfjTwdrHrvZ/TTqDoVpDDb9JxqC+j+tEHS1yOWkwW0Xyw==
X-Received: by 2002:a05:600c:3590:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-43668b5f6b1mr52935245e9.21.1734794890420;
        Sat, 21 Dec 2024 07:28:10 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b271sm111659835e9.34.2024.12.21.07.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 07:28:09 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: exynos8895: Add camera hsi2c nodes
Date: Sat, 21 Dec 2024 17:28:03 +0200
Message-ID: <20241221152803.1663820-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_072812_508703_DA32360C 
X-CRM114-Status: GOOD (  10.13  )
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
Bindings are in another patchset [1].

Changes in v2:
  - Mention the bindings this patch depends on.

[1] https://lore.kernel.org/all/20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com/
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


