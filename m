Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B708C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPjvgmHurA9QB7uZXjAStLUtqAnkSK96qD/+I6+APD0=; b=KaB9+8ofgwfnSY5Nt2IVYRxqxU
	rE9Yah3iBdr8DygSTKRVCX7PuJtrn2Qv85jz0RpIzqgJkXPbt+MWTZo8nXWv/eUrjSvJc3nIr4uGf
	qpHbXIBI0wsERDeF7Jl8Zas695GGr1+ES/1z1bbD+YQjWbcjGGrfIpeFHYzt++EZ8BDkMwED2QbRi
	X2PWZTkX6RkVYZ0VTzRncXIASz7B+Cx75TeEdFFEmBnyVJAseWV9PALYl22/mrK18PJXbWcKV4Ain
	LhueB03SDEVkBM+q2OUbi9jEUhqIxUp1kebMSdnx0yNGLkpRByAjuRYmxKt20gq6b49knsyAyOMk8
	6pncj60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gop-00000008HTS-2eFA;
	Wed, 16 Sep 2026 04:00:25 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gof-00000008HPY-2mA3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:00:15 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cea4c79fso243384a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 21:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789531213; x=1790136013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPjvgmHurA9QB7uZXjAStLUtqAnkSK96qD/+I6+APD0=;
        b=lbsUoY6dss6tU+qPbouICBqDbskkS6pH7Ugw6VaqlOWKbH2NE2lyQKkEwXTAWk6ouB
         FLKc3kaMqy1DI3ten5/nTL6Go4hjps5rhgK/qrjAnk33OQGcNDQvjDFundQXeOELqDYq
         /NJgRLKTYUFUg6uXqxh0/SvQn+ECR5Y+YNFB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789531213; x=1790136013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPjvgmHurA9QB7uZXjAStLUtqAnkSK96qD/+I6+APD0=;
        b=2QuzQnEpQNQlJxGeI62JY6EnBNiSF136Kpu6D+CBGtEBAuobWg4/606+8Ha/Wi+bDW
         YRvbwzN2g1Knznh3nlwR2yJtr7kC/hmsxuOuC+8f3D8TcJKHEEtatITXnGOrZy3k9uZl
         DSMKCasGUjbnSKSvtWOXb+IGcOZ+of92rDZx5Km9Owswtpe0r/g+somT3IMpDDFcZ0WZ
         m5/Dm7iieGlf0bNE4Qzj6lUWQDz+r1i70ajd9vFMxSF90qN4izL5Z47SrTIpZ40Wou1c
         GL2F3nsP5CIOhT5ylj9IyL/Yxr0ruufcN+mLfmsykoVr8w0uxggxzDf0jHgUlxR90MtC
         5zCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzi/nwNf4LEFJFnnjWoKB1GL81z7CR+DMA3MIrjvVQilNCsZdZOiwp8GevM24IsW0/dQfSoT6jAe2ge+q5554Bv@lists.infradead.org
X-Gm-Message-State: AFuF++k/A424Cu5FyWs1DwBn5Drt51oOE0O6SNXN4mGbK+HhyD5pxFYn
	vqV0bZ0uCXoYD3BybKDvHoIBfkmkCgv/Nsvl+XqhY0xeS/2RKt5T0qntjREo5DN/QQ==
X-Gm-Gg: AYBFou0X6eU++IGwphmEPZKFYgd1J4BDUKBKwuUWSQ75J55dKUWB90iAxylIxn3T8ph
	ElldUPG1kS/gTbNBqw4rWI7cdT6ZDLUnsd80Fmcqv0B4dLpYwiYVV8dtBJPhXquNcow2iPVSzK/
	eHGgT0tWc/yjjrb0jcsOfy/nbUYa6s9a9Jwu4xG+r38KdyuJxyCmPUBNRqD+Yt88jWCAfaszurf
	TJtOTdvgrwX9ajXCdpdt/1N12qUTRgBY540S8zHXMe6dbyMUXu4EBCyjdBAFsyRLPGviDSEMLAV
	4mn0DIWKT58tkKp3gq4xfGvuq+VimEr1SPobHooOfFbvThvreTL70K9/v0oprIpybF4hAwBcDgt
	a6mAIGmvihGVpAmttlJ+j0deynpT6r5vwcD1BdcJgkHa86X9yrDRIlat2Dso6M3IwSKbVUqOp2s
	gNeg89RajHh5PPevDT/2wZg3vj287Xg1Lw0w9A1uxygfY5WFReT+GQcXxWScyxYv3d1aPd0sV2D
	uhttdWr0doaOe8rKA24vtTCEgXoYv0SWrFkvMJ34BnEtH4Omt+OtU72wA==
X-Received: by 2002:a17:90b:390e:b0:39e:1c03:14c2 with SMTP id 98e67ed59e1d1-39e1e3898f0mr2478995a91.11.1789531212760;
        Tue, 15 Sep 2026 21:00:12 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a3cc9sm2030139a91.14.2026.09.15.21.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:00:12 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH RESEND v4 2/2] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Wed, 16 Sep 2026 11:59:52 +0800
Message-ID: <20260916035953.3111607-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916035953.3111607-1-wenst@chromium.org>
References: <20260916035953.3111607-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_210013_708957_6DC0A825 
X-CRM114-Status: GOOD (  14.60  )
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

On top of the GPU is a glue layer that handles some clock and power
signals.

Add device nodes for both. While there is supposed to be two different
power domains to the GPU, MediaTek does not have any information on how
this is integrated internally. Assign the same GPU power domain to both.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index e75ed4bd458f..66e68702732d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1002,6 +1002,37 @@ u2port1: usb-phy@11291000 {
 			};
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8173-gpu", "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0x13000000 0 0x10000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&mfgtop CLK_MFG_G3D>,
+				 <&mfgtop CLK_MFG_MEM>,
+				 <&mfgtop CLK_MFG_AXI>;
+			clock-names = "core", "mem", "sys";
+			/*
+			 * Binding and GPU core HW have two power domain
+			 * inputs, but MediaTek does not have information
+			 * on how this is done internally.
+			 */
+			power-domains = <&mfgtop>, <&mfgtop>;
+			power-domain-names = "a", "b";
+		};
+
+		mfgtop: clock-controller@13fff000 {
+			compatible = "mediatek,mt8173-mfgtop";
+			reg = <0 0x13fff000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MFG_SEL>,
+				 <&clk26m>;
+			clock-names = "sys", "mem", "core", "clk26m";
+			power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+			#clock-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.55.0.1032.g73a4cd73de-goog


