Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089F2EF586F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 08:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8EVs3djMjehVjELOyPKlz6f3ecqc5eYir0MGFdbhOo=; b=mCznCGxDJahRK5P+ccbHjviLMu
	pYZKkH7DU6qwBR0omvEdl3i6JqDx3vjMQuxiSZs5iEGS432vHxIZ3XiLnUWraHj7CnSR78VPpiFMQ
	lY/PZb2qWLrpM68aMcwLQplo4kcALfrD97edj4kxuziJALRqT65h0UKl3qms9nuOE3mdCFfGUPHAY
	JWMJdQCmAPUn/RifQeL90fS2r/bb6UxGsRvr6K0XoWKYYPCPKsuR1GOH9y25F7Kk3qcWCFhbHid+e
	ZXU8dAc3cEhBtkLUsVIhyJFLU4+UxMgr5epDY6/8+UwK5iC7IJO4ouoWR/WSThfk7KCLKfJgt4Dvr
	RS6kEvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrXus-00000005HAE-36Ks;
	Sun, 15 Feb 2026 08:55:46 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrXun-00000005H6P-34ea
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 08:55:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso26897395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 00:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771145740; x=1771750540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8EVs3djMjehVjELOyPKlz6f3ecqc5eYir0MGFdbhOo=;
        b=X6Fzld5OZ8tuX12fYm1LnZjv7KRKNGYmMheSMmcImwv8t0mrfdGYlXmbdKJi/N+DY8
         XYrB6rkOhyr7lsJ6jwG+7G4HZgZ1QIYlik88b8ePe1RWwMSUPG/In5SHxGiGPwMhkEMn
         6cJ2gDrXhv273nig1qiYezhwkC13ad4Yy/Ajkin+FGOZ6Y5w8+8ossaX2MbEmPBt3ez6
         q07e6FaGAEoF51C9TTAL65PmaBLe9/+uZZljEFP2U9rFOiRxENULht++V3PJnlvnChb5
         1M6cm890fHOVuPHFWhx0ccaQNolzhAcL/hGOhf63Qo6LfigYV5t9ihdC0wptU4NJWqAi
         96Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771145740; x=1771750540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T8EVs3djMjehVjELOyPKlz6f3ecqc5eYir0MGFdbhOo=;
        b=ZYWbmeSCFTqQCiuE9gry5AeIBfsqjDqkCkkCyYdFMN4u15tdemTMJZUVAGBaCQFhyc
         rmw1Ir7zC/it5+NF4WxKpAlw2cO8iZMrwyQiCDLOq2Eu5DwqFhSIyyAwXL7snaI1Aj5G
         +Ds8JG7SEOHggcexGwZPVj120LKTV+SyNye8GxOOhY9FIfptlKBuJmxGQ8bZvZKIb2jb
         2TUkWK52rIPdhD1xPaey4p9xSy1XxZCvmo/3T4MmUNZhfQhrh+d5vTxLKtqn23cngZlk
         dwxgTwMapr2qGC0J+6ffJr2zT4CESPxGb07QDmamPkeFzq0ZcdexEs2tkgNJAtuO1dSu
         tTJw==
X-Forwarded-Encrypted: i=1; AJvYcCWKRbpz5HlIJQIvL+YVuvQfFpqoE12enCU+swE7Ws9TZBloVTqiQAVALr1hGmnzY6AkwZ6UryRCnhp3couVQqUe@lists.infradead.org
X-Gm-Message-State: AOJu0YyZJ8aVHq+RD/UHa0HCIabblQicKcEtQiO4gL2NZBx4SOn1sBZw
	E2DbjrHYuRTctH5LRaknihGfDp/5Cfwrgq+oItsLHmvLmMVHJtsXkY8j
X-Gm-Gg: AZuq6aKrHVZ+K/L7/JpuuaLSzNQ2ChMpBT9KaNUUHmrROYXl3wK6G22D4Cf68QFC/Me
	lB0X7h+NhIKfcHq4sGbdX/4eTiux6xjqS5SWYe3bdzjN5XQ7iY8muhkuzkD/yiuEg0wUVTIXQLO
	x82lO5zMzJ5g4S61mfwJvjlJusNPcNODlPy5sJkyJM6vI75JznnoIxzSlSNBO3+AjkKNKLGehdL
	A9yFiASlls3w37moNPBPnLVfcWcD3Zj+OlXr6KH0PxxbkziFoyhfS2s2F2UN39lQcBOX/KSQMcF
	fky0Pra3GISBzPssQkPlO6+7LKP0ziimAXc2Qq8MxTCpvEBP9Q7ThknVGED4R7RTfm5o8gSQP4+
	1zh4rjjXAnmzBUkFeOqYaKcJlmaMYRz3Z8v8qL3s9FnUgHS6RG2j9/AkaUCn5QF+rCpdJvIZlyl
	kIExJ4gqZG7by+g1v2Ihk=
X-Received: by 2002:a05:600c:6814:b0:483:43da:6c87 with SMTP id 5b1f17b1804b1-48379c14894mr77535195e9.33.1771145739686;
        Sun, 15 Feb 2026 00:55:39 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm547211675e9.1.2026.02.15.00.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 00:55:39 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH 1/4] arm64: dts: mt8167: Reorder nodes according to mmio address
Date: Sun, 15 Feb 2026 08:53:53 +0000
Message-ID: <b7d7c27dda4dc1779425c57d187b84abaf6a1093.1771144723.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771144723.git.l.scorcia@gmail.com>
References: <cover.1771144723.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_005541_793401_3A018263 
X-CRM114-Status: GOOD (  12.04  )
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

In preparation for adding display nodes. No other changes.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 68 ++++++++++++------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 2374c0953057..27cf32d7ae35 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -29,12 +29,6 @@ infracfg: infracfg@10001000 {
 			#clock-cells = <1>;
 		};
 
-		apmixedsys: apmixedsys@10018000 {
-			compatible = "mediatek,mt8167-apmixedsys", "syscon";
-			reg = <0 0x10018000 0 0x710>;
-			#clock-cells = <1>;
-		};
-
 		scpsys: syscon@10006000 {
 			compatible = "mediatek,mt8167-scpsys", "syscon", "simple-mfd";
 			reg = <0 0x10006000 0 0x1000>;
@@ -101,18 +95,6 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
-		imgsys: syscon@15000000 {
-			compatible = "mediatek,mt8167-imgsys", "syscon";
-			reg = <0 0x15000000 0 0x1000>;
-			#clock-cells = <1>;
-		};
-
-		vdecsys: syscon@16000000 {
-			compatible = "mediatek,mt8167-vdecsys", "syscon";
-			reg = <0 0x16000000 0 0x1000>;
-			#clock-cells = <1>;
-		};
-
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
@@ -124,12 +106,36 @@ pio: pinctrl@1000b000 {
 			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		apmixedsys: apmixedsys@10018000 {
+			compatible = "mediatek,mt8167-apmixedsys", "syscon";
+			reg = <0 0x10018000 0 0x710>;
+			#clock-cells = <1>;
+		};
+
+		iommu: m4u@10203000 {
+			compatible = "mediatek,mt8167-m4u";
+			reg = <0 0x10203000 0 0x1000>;
+			mediatek,larbs = <&larb0>, <&larb1>, <&larb2>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_LOW>;
+			#iommu-cells = <1>;
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb0: larb@14016000 {
+			compatible = "mediatek,mt8167-smi-larb";
+			reg = <0 0x14016000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_SMI_LARB0>,
+				 <&mmsys CLK_MM_SMI_LARB0>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+		};
+
 		smi_common: smi@14017000 {
 			compatible = "mediatek,mt8167-smi-common";
 			reg = <0 0x14017000 0 0x1000>;
@@ -139,14 +145,10 @@ smi_common: smi@14017000 {
 			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 		};
 
-		larb0: larb@14016000 {
-			compatible = "mediatek,mt8167-smi-larb";
-			reg = <0 0x14016000 0 0x1000>;
-			mediatek,smi = <&smi_common>;
-			clocks = <&mmsys CLK_MM_SMI_LARB0>,
-				 <&mmsys CLK_MM_SMI_LARB0>;
-			clock-names = "apb", "smi";
-			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+		imgsys: syscon@15000000 {
+			compatible = "mediatek,mt8167-imgsys", "syscon";
+			reg = <0 0x15000000 0 0x1000>;
+			#clock-cells = <1>;
 		};
 
 		larb1: larb@15001000 {
@@ -159,6 +161,12 @@ larb1: larb@15001000 {
 			power-domains = <&spm MT8167_POWER_DOMAIN_ISP>;
 		};
 
+		vdecsys: syscon@16000000 {
+			compatible = "mediatek,mt8167-vdecsys", "syscon";
+			reg = <0 0x16000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		larb2: larb@16010000 {
 			compatible = "mediatek,mt8167-smi-larb";
 			reg = <0 0x16010000 0 0x1000>;
@@ -168,13 +176,5 @@ larb2: larb@16010000 {
 			clock-names = "apb", "smi";
 			power-domains = <&spm MT8167_POWER_DOMAIN_VDEC>;
 		};
-
-		iommu: m4u@10203000 {
-			compatible = "mediatek,mt8167-m4u";
-			reg = <0 0x10203000 0 0x1000>;
-			mediatek,larbs = <&larb0>, <&larb1>, <&larb2>;
-			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_LOW>;
-			#iommu-cells = <1>;
-		};
 	};
 };
-- 
2.43.0


