Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB5FCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 03:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLwdnFJkTban4EYcPq7DmxYQAfDer3UBe95lCccalhU=; b=L3TrKlcMtzLGfhovc6iELPjUqq
	b8s3KYow/ZRenlHjXORJV+jEFUMip8ezDWfsnXl1TB65FeFG6+CWksKIudsIadGVghE28CxbReDpo
	BQJyf9aaOldH/m9maHJkfW7yzb66zp2izQPskAyQZ035iMjzH5jh/+FJyq8/pCPqRnmZn+ENhX3jJ
	xW+JCR2glz1Kv64fhxZr9d/nPr5ngKQdHOPHLUb1nqqfMDrUnbTeJ73EVgzYnyAfHSC8J2iDpYmN7
	2O4vt89yeZ7UB6RD/Kjl1XtqRGf5EZPGZlGJUPt8Bp6iZm6Ilw7rSb7EsDn8dPaIRZ3WbaRMJ+b0m
	PFq43inQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9F5-00000006iUO-2QeJ;
	Wed, 10 Jun 2026 03:04:35 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9F2-00000006iSd-3dbf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 03:04:34 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c858014845aso2567181a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 20:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781060672; x=1781665472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLwdnFJkTban4EYcPq7DmxYQAfDer3UBe95lCccalhU=;
        b=g0Tus6iNd7pgdzFz8ZFEPYkmMX0hWnWUyqxXPUP0DmV/Wm5wqYcGozy7DY5xSsyHS9
         EB2mYSUL7mB3NbKK98Fy7M9K9RKr9W/k+wH5CSS6Kn28jCpJBYP9rqAkz/+/xidCsgAq
         CdH0ZTgvoc1e/INtFi9nrQboQjaBZenuiAHbveWznV1zFMPdaDQA5ptWssCCGg8QksYh
         djB82Y7cd2rfiPkcbf3z+Cw8aRgEWVPTbXCE9xH6iKai2ARXDMEk3LcxdNCVFYTq2itQ
         Z6OOsuUYSGauGZMNQzI3JxYkNBFj7wEdGMQBECtZWO9hglA/S3SF9W4R/lVVew7bwczd
         Uu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781060672; x=1781665472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lLwdnFJkTban4EYcPq7DmxYQAfDer3UBe95lCccalhU=;
        b=c52s0z70kTxgWDZX7LIKN0iO0u0Qg9DJcFWn4DMM59hlzbaDfIsegam6raINhAcKpZ
         qA0NTNcMm4wm/IPokHNXyDK3/4x/delxffv+6/salnGm69FU3miHcnqW+apzKINK2kik
         uYA3N6whJIR2jMH96c2L+kYKwiUwtAOa3jHku/bAx4OR14gGkxoY64jkYawDS2H74NFT
         k4wzZak7+BQA3Tc05kSh+1FbMBSVz7feoQ6VsOvd8yumcXytAod19yl9wbv5IobZ+fkm
         3XssKNlMBAC3dt1Byc2hS4hAB7UstK6wE3CDXS3+XAPvUutECoqgMg7+HTijuxtg1Dbx
         xRkg==
X-Forwarded-Encrypted: i=1; AFNElJ9/A/lANNgvd4ilDpuMIke4SxSZcwvRNFIFa7g9P7Djt46rD8K/+6ChwSTmZreOqi2qzrvNvs9krNaP2mRrljsx@lists.infradead.org
X-Gm-Message-State: AOJu0YwiPG0n62Se0AqA4wDXATg9x93gtZt4fPFtpkeRzPkqAWZbc985
	ZqIDkRgs+WrRiz3hUZV5TlFL1EQnDSJjIzXvh4I4ruNlXJ8wdSJMuvwy
X-Gm-Gg: Acq92OHtrrZ1djQ9pl0yqDhr3TfS1rNEZAV2ZxBJrOMvQ5Dyzu0L0PhcdxwM6fjWFnJ
	mX22b7Te7yhm0A0itnLlJK3wY5WWjNcVKtx2MvfiCyT5ap3BSlTCglbwgeIoUE5msb4vt+dki3W
	DEG2ab7nQTG0CthL8b5RDUt5fPWLZCzWBtKmvZGKp4GoW1PMmvT2q2aOLblXbrxNCt0dt8Y0H2s
	emqoi50Sr6qhrVvSsIS+sy+jzk1HyFiWxzRDIAFuFf8DO7AR7c+6tWL6zVGxiKn2FOTKYHAvh9c
	BrIEI+VWZO2JUhvpWZKbaTJcbsnVP2hZe6XWqzKX9eLdBRUCaTyWawh9K+wz+RX5cma65z+ez8F
	uV5lpCU91N35Vx7xRNCMb2LiGLgX6y3xYDts045/3bkRu25NppaDwck5fhPTmmCBb+tkImaairW
	yGpYsu2qnTC0B7WLd+/zjjE3yQDEtFvPggR41+7TbUf8Bk752HZker0BmYit4MNEoJgj4O4Cvrj
	qY86OlEwkdCgbIjc8B0
X-Received: by 2002:a05:6a20:4387:b0:3b4:661d:8405 with SMTP id adf61e73a8af0-3b4d39f7d02mr20694441637.4.1781060671689;
        Tue, 09 Jun 2026 20:04:31 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a61b3sm19927082a12.17.2026.06.09.20.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 20:04:31 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Wed, 10 Jun 2026 11:02:08 +0800
Message-Id: <20260610030208.2020275-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610030208.2020275-1-zychennvt@gmail.com>
References: <20260610030208.2020275-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_200432_917629_D109338D 
X-CRM114-Status: GOOD (  11.09  )
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

Add I2C controller nodes to the MA35D1 SoC dtsi file.
Also, enable the I2C2 interface on the MA35D1 SOM board and
configure its pinctrl to allow communication with the onboard
NAU8822 audio codec

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 20 ++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 72 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..4b9ff6d00631 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -55,6 +55,18 @@ &clk {
 			   "integer";
 };
 
+&i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+
+	nau8822: nau8822@1a {
+		compatible = "nuvoton,nau8822";
+		reg = <0x1a> ;
+		nuvoton,spk-btl;
+	};
+};
+
 &pinctrl {
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
@@ -98,6 +110,14 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	i2c-grp {
+		pinctrl_i2c2: i2c2-pins {
+			nuvoton,pins = <1 8 4>,
+				       <1 9 4>;
+			bias-disable;
+		};
+	};
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..fe9e0895beb4 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -372,6 +372,78 @@ uart15: serial@407f0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@40800000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40800000 0x0 0x1000>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C0_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C0>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c1: i2c@40810000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40810000 0x0 0x1000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C1_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2: i2c@40820000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40820000 0x0 0x1000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C2_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c3: i2c@40830000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40830000 0x0 0x1000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C3_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C3>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c4: i2c@40840000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40840000 0x0 0x1000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C4_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C4>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5: i2c@40850000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40850000 0x0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C5_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C5>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		uart16: serial@40880000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40880000 0x0 0x100>;
-- 
2.34.1


