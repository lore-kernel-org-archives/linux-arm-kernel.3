Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8858CA9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XawY6rGwERNjw0CFRz+0ONBwu0wfWrlBMNsKmysKmec=; b=FRheol6tDegyHTfyOA6wU9q6qo
	MnsIbYKcDiRelYd1rCwEkeTprqwYAL9RKAzFEMr6RhlEJAuy1F0Ivn10KjTzQVXDoCa308vkTiENh
	ul9ARpygBe/W1tkMmJe4Yaw5iewd7OTmEZiAUQLguJX+24FylnUGx+Zsw+ITHAm/+Q2MXoSpsQJRp
	4KmdTuAlvLai7BwCNMMSsMuxtivKa5GXxtde+O/xITkOXhmd+QuZ4wkPMoAbhgcKBB5PRcVgJi1Ls
	w+lcd8BE71mNdnj4LiWBeoGBQrACN+4DpAgu1VB6qCPcW9+jKzw/SbXwyG93TlzYlc9TvV3MHkdAU
	Hthgw05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVhG-00000007yhx-0KQ9;
	Sat, 10 Oct 2026 11:57:02 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVgZ-00000007y5F-18rl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 11:56:22 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso5247955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633377; x=1792238177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XawY6rGwERNjw0CFRz+0ONBwu0wfWrlBMNsKmysKmec=;
        b=JWWTUbZIdg7WsyHda0Swm0t1BbxxN2aiFvRotTS908u2wnnWrCd1IBFUtJUpJ3W4T6
         P23G/x9Ookg4nmgFT6C1rL403I6ZjwCO4QGxuZyDhie6jVT1RxNIRHZiV+Ncyzxn7F/6
         cI9jLpeoI3SLUzvgk+H7HZ0fp4H8ptRjLyhpKKMGY9KeczryGmMqrNUj7BY+A0scZBBb
         QpP1F56pmaT+tmOekIeD4SxOPclGdVQ23GwFIqu7lzj6Dx5Wbjeb6oRmMejxM/7GgUBc
         kq981lwu+MBrXuOysUddNpdopitkQ1UYgvfx3+/UwResDUqamfb1Cjq4dcy2R6TksymE
         c7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633377; x=1792238177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XawY6rGwERNjw0CFRz+0ONBwu0wfWrlBMNsKmysKmec=;
        b=FATRJ0Z+Iil0PMLgV6HcgtlghD4djnTHS+KXpmAIT8hYDgqKJ8yCSECXjPYOMYp3dY
         dt8WZnBldGnlvvDyfDfMdohal/iXOr7wsmP7rSKMyf4LLmsbPhaqLr7+BqfTLGCVsghc
         8VlurUTUqLvg3hvNEJ8q95Cm54gZzJ8KshAKRJqlnHhptjBXc1lQWuobNp2n6I36kHTq
         cRZ1fcMLvuwgi5ej86ILclWRsFXJS1uBALMfg12dGmUD6WWf5QLYutXJKCG/iELyRnWc
         naToWQL82i4iotr4fZx6xwlRWVkpzt7R05V5VhjxJoudHaoXbzik7GmuxwtXkUWzkFa7
         Ae9Q==
X-Forwarded-Encrypted: i=1; AKwUvByQdLVAJvsJPKC1IKxve+nHHsIHB3Hx27kT8i5R0HvT9yg/s7EGudtrbxuPd4WTtktIAqu2Mbj50/eX1QQP/o+F@lists.infradead.org
X-Gm-Message-State: AFq9FYLTeMAaInxbShqPpV75T/JHwx7VoE2QEwpdGvteF2LpfaqaLbDs
	yfIfZSUtnLJE8pTwhkveIDidKK/7BIIYRTTlciE5/UTTS8dq9EE3EaXb
X-Gm-Gg: AYBFou3pikEpt+jzppL6Z/kYCYe2MKtmq7YGf7b2aUKOeMfHKDHS8hY/+ut76Th2nho
	Yy14BsbDLLLjwa1CJYNQD8A18hk4o5zWWm1Eil1KKs9heRwt41tkR9vimAQf+T7dk+HUilRp5SL
	yapj6WP+08o63F8LTclen0pP2bqR420Mz2KbnzMYBzdQe+vihyLDc8ubCQiXtSNZGeasVY/q+CJ
	Hj3+Zncu4egJUjssQPTolI2vai9rIkybPAHnT44y/rmfgDRloHVqNV+HydO26FmdtHgPKVZVlHk
	stV+e0ZHviJRWO3DxRxuHsTgWU6om0bdCIJzOLUQdJtFwGuxJ1Kb38ku8CelQK4ngQRTvuRN5t8
	GSFgn3kvFqqfQpvJ8g0R03XLLc5gokQHCGVesFsRMVWbBuNUGqC5Pxb2MCtgKyeaBlMmzj/iEfF
	hxInSrEFTP1gmRozwWzAYKgHBcCm83yQNCPr/y5Kj7yldMzasFjx4/gLwDSUiGSoVvGw==
X-Received: by 2002:a05:600c:820a:b0:4a0:98c:e082 with SMTP id 5b1f17b1804b1-4a18e4a3f0dmr88323785e9.13.1791633377176;
        Sat, 10 Oct 2026 04:56:17 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:16 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] arm64: dts: mediatek: mt8167: Add HDMI display nodes
Date: Sat, 10 Oct 2026 13:54:07 +0200
Message-ID: <20261010115539.9237-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_045619_432832_C0B04DEC 
X-CRM114-Status: GOOD (  11.23  )
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

Add the required nodes to drive HDMI output on the mt8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 62 ++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..ab76e0637eb1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -112,6 +112,27 @@ apmixedsys: apmixedsys@10018000 {
 			#clock-cells = <1>;
 		};
 
+		hdmi_phy: hdmi-phy@10018300 {
+			compatible = "mediatek,mt8167-hdmi-phy";
+			reg = <0 0x10018300 0 0x20>;
+			clocks = <&apmixedsys CLK_APMIXED_HDMI_REF>;
+			clock-names = "pll_ref";
+			clock-output-names = "hdmtx_dig_cts";
+			mediatek,ibias = <0xa>;
+			mediatek,ibias_up = <0x1c>;
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		cec: cec@1001a000 {
+			compatible = "mediatek,mt8167-cec", "mediatek,mt8173-cec";
+			reg = <0 0x1001a000 0 0xbc>;
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_26M_CEC>;
+			status = "disabled";
+		};
+
 		iommu: m4u@10203000 {
 			compatible = "mediatek,mt8167-m4u";
 			reg = <0 0x10203000 0 0x1000>;
@@ -120,6 +141,15 @@ iommu: m4u@10203000 {
 			#iommu-cells = <1>;
 		};
 
+		hdmiddc: i2c@11011000 {
+			compatible = "mediatek,mt8167-hdmi-ddc", "mediatek,mt8173-hdmi-ddc";
+			reg = <0 0x11011000 0 0x10>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_26M_HDMI_SIFM>;
+			clock-names = "ddc-i2c";
+			status = "disabled";
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
@@ -145,6 +175,38 @@ smi_common: smi@14017000 {
 			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 		};
 
+		hdmi: hdmi@1401b000 {
+			compatible = "mediatek,mt8167-hdmi";
+			reg = <0 0x1401b000 0 0x400>;
+			clocks = <&mmsys CLK_MM_HDMI_PXL>,
+				 <&mmsys CLK_MM_HDMI_PLL>,
+				 <&mmsys CLK_MM_HDMI_ADSP_BCK>,
+				 <&mmsys CLK_MM_HDMI_SPDIF>;
+			clock-names = "pixel", "pll", "bclk", "spdif";
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_LOW>;
+			phys = <&hdmi_phy>;
+			phy-names = "hdmi";
+			mediatek,syscon-hdmi = <&mmsys 0x900>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					hdmi0_in: endpoint { };
+				};
+
+				port@1 {
+					reg = <1>;
+
+					hdmi0_out: endpoint { };
+				};
+			};
+		};
+
 		imgsys: syscon@15000000 {
 			compatible = "mediatek,mt8167-imgsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.43.0


