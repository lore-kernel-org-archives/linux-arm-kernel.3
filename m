Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45989C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TE/86mbnkjdeQ/eUjLcxECV2tO9a4hCqlVOp6ra577s=; b=zOXWWN0vXowMbVqo2fVBBWDBuh
	rzXYhuEeaVza9eF1IC/ZOx51VxXDta/cBcAAcWVEI+tyoNA4kVavssnHYpKgMVgagaPue8gVoeILm
	TwaAI2eZ374+6d9Wn1NqLrEmsFozOlvB2vxI8tqj3IQBdgnvCmf7MKBi8XdgeOJguizSdChEbLFER
	LVat6UPc0aTEgJnW803EBRaRsi1E5GeV2FNJvcx2TC/m8TmSySGLuN4JJOwyGxeLt70B31ws/9x3E
	ku7dUqjjrvrtTc5IMJXJW7VtbF3t7txbFcU/ppVUFPa3B6CKuJAZlo4z8eNrl+j9jwupJu+lZ4MxJ
	mpHQVwZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmnx-000000028aS-3yiQ;
	Thu, 09 Jul 2026 11:20:33 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmnq-000000028Vd-2d7p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:20:27 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b27c7451so10050295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 04:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783596024; x=1784200824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TE/86mbnkjdeQ/eUjLcxECV2tO9a4hCqlVOp6ra577s=;
        b=LZQ2jhT86bLeEM6hO7wrWCJ2Y+16zaRboSPOWxrd+itbJfh1RjwLtqhyG8Eftj5XT4
         xoMjM9TdjJDI8TagLwPuP8hzj4VN5neiqpddcEMFd+mBYlYf/bhizg4E4DoayxN0EfR0
         jfG+A++pb7vL30uuz3MD0QABm8aRCUYIywC38Hs4iH/S3EngjZDWb8ZuyBwb3qqVyy1w
         Uq/JgADdQ7JrMfqcEip1MtZ5eyKFMr0Ncv4Uo16L98WDgGjxaFAOtsFCV/uVjoMH/1w8
         VX9I3UJ5+zVpSQ3b+aaggvxwoW9PMFXdbp97W4GYh646+SnmiyKP1Ftn9KuUwp31E8pf
         if6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596024; x=1784200824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TE/86mbnkjdeQ/eUjLcxECV2tO9a4hCqlVOp6ra577s=;
        b=I35O0jqjvYSbf+brx/xVpvGRNitNeocmBQ8wqUJYqryf0FryqFSbrMtK1FyvVqZmqy
         MOAVQRKd3uGbtyeFxKTaCXXMlevTF4JIeC/ci0jphrKSkEaH5BbosDocE+VRdBmenprq
         jaBKU6h+0r9B6dk9aVuWsB18RoL3yoK5h5HRfKXuNMAhJXAyNgZtXz6QD3m444sfyaRc
         aNko/C470rm4J/2CggXNZP3bZXd65RrelcbY3Kr73luZAgR7V223gaz3dONj6n8/EQSi
         8tAttot2avaRDc2gnrt0ZBY1K0/KcqjiFrwWcqQo0yV8lwYvj67KKOIG/q2iopfkzJ/W
         w1EQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro38C6dhV574+Sr+jQiiYbuGqIZrQAbhVjpG1sy97iYU/8c3M94kD9+eS/819E/Vo0xp4tTlDuMzlpD+YHbkXRV@lists.infradead.org
X-Gm-Message-State: AOJu0YxJTGhtDbsuIIP9VsJlt+9qdWz5I9gK4l+74b1OXDGA9e/QdtTX
	pqwye00mMO3O3luyp1bCixtZgCF6h/JHAO7+HtBRRCmCGKIk4xGuUOvxYUE4Y+S5wq0=
X-Gm-Gg: AfdE7cnnxQae3kr2SSc+xTqi1Ra73YgjFtYUyT5FpqvhIFgYzVBEotL/vsN29xqkxJR
	sUldyEOOpXVszgSr3qcvqFCAULYDfsecSQUW6RCzHpHghYEMF/W1kDl1zAYWBD4K2idKECgdTfg
	ZrRBYNwIvE1rwlGnVx5dUELhF4WywW+gap5Hf2s582/MvAeYnYRy3GXo6gkHP3WsIGOvHpIlxSw
	xLXpWS/vui9r1z61aEBNljyIqrANNRMgBry1jmif59am0R7zaM7u+bcNADBJJTbvzRwOmBw/CHo
	l5bauFvWq8tjA2WSefu3jFwmcz+OhYLx6Ly/9Db60iMozOsVKrhi5er33IUHbR+84HMhaiwU8L5
	ak4G9AoMzedITYEtDFM7vnWYWF/z0mrpFy4RRcikxIqiun3rdbX1bgoccvAifwEmv62Ahzf8b8D
	+DWKL/1lfC3bVZzCiis14yMbS4mpZns7RIp3Zij0hMVYX+FK4+yWxyxAb2HmpNPlCcuZjdO8WIo
	ZzFGjNnFdbvZHs0wJubAeYYG1zJD/NNnuPQUq0jlBE=
X-Received: by 2002:a05:600c:5303:b0:493:e41a:9b23 with SMTP id 5b1f17b1804b1-493ec561411mr24840465e9.1.1783596024101;
        Thu, 09 Jul 2026 04:20:24 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm53910475e9.1.2026.07.09.04.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 04:20:23 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 5/5] arm64: dts: microchip: lan969x: add QSPI nodes
Date: Thu,  9 Jul 2026 13:19:11 +0200
Message-ID: <20260709112006.390742-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709112006.390742-1-robert.marko@sartura.hr>
References: <20260709112006.390742-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_042026_683709_B8B1D05E 
X-CRM114-Status: GOOD (  10.00  )
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

Add the required DT nodes for both QSPI controllers.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Make it apply on top of next-20260708, as SDMMC is not yet upstream

 arch/arm64/boot/dts/microchip/lan9691.dtsi | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index ed997d87dd09..a8541c6a098d 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -396,6 +396,39 @@ clks: clock-controller@e00c00b4 {
 			clock-names = "cpu", "ddr", "sys";
 		};
 
+		qspi0: spi@e0804000 {
+			compatible = "microchip,lan9691-qspi";
+			reg = <0xe0804000 0x00000100>,
+			      <0x20000000 0x08000000>;
+			reg-names = "qspi_base", "qspi_mmap";
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fabric_clk>, <&clks GCK_ID_QSPI0>;
+			clock-names = "pclk", "gclk";
+			assigned-clocks = <&clks GCK_ID_QSPI0>;
+			assigned-clock-rates = <100000000>;
+			dmas = <&dma AT91_XDMAC_DT_PERID(1)>,
+			       <&dma AT91_XDMAC_DT_PERID(0)>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		qspi2: spi@e0834000 {
+			compatible = "microchip,lan9691-qspi";
+			reg = <0xe0834000 0x00000100>,
+			      <0x30000000 0x04000000>;
+			reg-names = "qspi_base", "qspi_mmap";
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fabric_clk>, <&clks GCK_ID_QSPI2>;
+			clock-names = "pclk", "gclk";
+			assigned-clocks = <&clks GCK_ID_QSPI2>;
+			assigned-clock-rates = <100000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		reset: reset-controller@e201000c {
 			compatible = "microchip,lan9691-switch-reset",
 				     "microchip,lan966x-switch-reset";
-- 
2.55.0


