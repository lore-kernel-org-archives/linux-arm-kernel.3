Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8A8C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAooB32uAcG0QWvFzgpqh3sQmn2wrC5rrQIephimC1Q=; b=EtU7s0JGDQNmLP/RPuznlMonK8
	72ul3aoARamxu7PmVIG2Xxj4MIzgrxU1VYGv5r2tzaK8MWdfKA38I3DjoeHr+B3RgdrdShjWFSzOx
	d+LaBQ7dez+w5H/jvZoGZ/XsV9ByhVqBsXgFWqaVqM5jkYS+B/Ba1Qsd4FP+x4QXq8Myc4AzHbFiw
	3viTNLLXE5R+6VO6lcYObY5mBE1YpSbWSrd7p2ZyJtJTcO6sgCvHrxosJI+n48yO7P8n8Y3YIwDC5
	X4llzQd3YHBoVhnA6k3YXXrBjsCZkZeFzHewjrnuGveL/AetV6ooUVCeIj4Sh716YnpAOoVRB1i5n
	t507LCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cNR-00000001wbi-39rY;
	Mon, 21 Sep 2026 11:40:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cN7-00000001wMT-0x2K
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sAooB32uAcG0QWvFzgpqh3sQmn2wrC5rrQIephimC1Q=; b=BREJ+OWJkhAg3y86GdhjA83+Y3
	zb1BVG8fpmLHISLTBLTsNwFxcSyyppB0y3OLfjKuvAAjCtCaeDqWuJBcRc9R8PBvW5/z1uzv6CoP/
	44/9ZBy9f8BqjfM0rBmu0ablHRR7y4xrsCniGJGArxEiGvpK5d3QjMdsC+k/XqNu3SKDdF4adpTE1
	2mjSI+dHa6IA76MmgadwryRwf0i0YjT4TFGlB84etZPpzoKhaFxrNEBFAlx+e7PgRW+PY/x4BVV/7
	pCY0BuiNO2U2geU4VhbZQZsozIq2I6kjJ17R6Yn5mQ5sfdmqpRzn5l8gP1+aZTEp6DdFaCL2X5SMI
	zHBH1wYQ==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8cMx-0000000CDld-1dZR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:39:43 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso24780155e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990773; x=1790595573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAooB32uAcG0QWvFzgpqh3sQmn2wrC5rrQIephimC1Q=;
        b=cRxJPyAD5HjIKjIrUagCXYKwZBD8Q1lCQ1iGTWfOGF+AZ9ShL75nBdBX1K/PNTMtxk
         K4TxxJ8ggL3j0GD06Yytwmvf1hv1wqJ65QIhWeB5c2aQ6jFFuNi25k9IWkOtDX27jOwO
         PsPINUNdUNmZh2zj4lQYZM2Yl3CPi6HgwtjFlTfCPekPtun8H28szkQZ81ccRRVml/Y/
         yaYvmTQ1LWLCZGHblTINiGo3MND8Z6FJ3STCrlrek4UyW0gtkO4bqwCZ+z8na1mw7q/e
         Srcch7SzpJkCZ2rW9P6NZ3x5Ok8ouCMZe+dkwcBLCRyh1tXka+5wQOWoLpp+N+t3D/o5
         dffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990773; x=1790595573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sAooB32uAcG0QWvFzgpqh3sQmn2wrC5rrQIephimC1Q=;
        b=SRtTJ4ZyYe3m5QcVkU9fPPOsY49jDj3jOHrypyZpJj5ipEdXMZsyW/wuhcZ4o5wyoa
         GMoLkpdMhsuhAycrwWWMfUb27LtRG2JT7mWAeF+Da3gdwxhqQ4rPgNGWYW4QyJXTFvrv
         Tuve7vnuYRMDe49yV1tj9v68rHFMuuMArbS7notOVDBytGsUb2MBZlmJr1HpwRuAMJCY
         //YD6uvx3XdG3wNo82JFzjCyo7fW2QjVxLKmrVTxtSVKL6qPJBjFGlhof1E9fCf+qvk9
         As9eF0PuAO+APKJNFmW+uKhkVL7AC2yaCD4Olx24VjadZXsx/Jv/x1Nj4oANYC5Wdsrh
         vpGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVQkoGs6Ynzm0RuGGgWmPT1UqeJf3YSwyYETYphD9SFAXbuLnygsn9kyVvGPB7709d/b+BWPlWsbQnXNAeGvLU@lists.infradead.org
X-Gm-Message-State: AFuF++mxqZSXIkbx0yfINE6n+uKNQwgUC+5CmhbM9asU3bvLa2HGrBWj
	rq4hhpLSR5iIrsDev6M67UHRwhcCVqfrbuGYL4kg9Qpl9iWpVfW5ZgrU
X-Gm-Gg: AYBFou0zQBOAZs7Qgix86jk3SiLZJ2xhPOHm+XvPmj4VortB6m5DuqJJ8oozhOLuwHV
	jMHutE19l4Wwih1awAC0qnG+vtG7VGu1vljFGmQ5h4j6lFhlIHibvid4uNtO7dKBFyUHBAqMIPu
	4w2Q1gJKDuRZs7Vm6LWMnM1Hw5CFV5H5jH2i2jIjpbUJfY0mWw/QEUadQqU6vp9dbuOh9JI2bR0
	Zee3JqydaLpNwcIz5z8mOdfnBz0bvEFdrOY2CKfAdhaOJX8vChbo2+BN3WNvNauipMPEg6JHnVJ
	RS9jpk4XrAof+XYxgL3p2eSGV6aUtFsPkT4axtOpa452LqyBz5XZgyznkwozZ2BHiTezYc1kHMM
	XZRiWm0M4gYmpBqFteNvZQe2OmdNUq2i73lL4zoT6iunzhDekxZDMxiSep9oVcNNMnEPpnefE+9
	L4l7h78IUTdrB0aseZw7gEqEtk2t9QXXv1nvSDSXO7sV2VwcMkJKRgDTGcUgcqjjFedFQ=
X-Received: by 2002:a05:600c:4e46:b0:49e:642a:4f6f with SMTP id 5b1f17b1804b1-49fc585e9edmr142186555e9.33.1789990773333;
        Mon, 21 Sep 2026 04:39:33 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc57547easm244273865e9.3.2026.09.21.04.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:39:32 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] arm64: dts: mediatek: mt8167: Add DRM nodes
Date: Mon, 21 Sep 2026 13:38:58 +0200
Message-ID: <20260921113914.779393-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921113914.779393-1-l.scorcia@gmail.com>
References: <20260921113914.779393-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_123940_647000_CB14F5BC 
X-CRM114-Status: GOOD (  11.22  )
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

Add all the DRM nodes required to get DSI and DPI to work on MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 369 +++++++++++++++++++++++
 1 file changed, 369 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..a50bae4307c1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -16,6 +16,22 @@
 / {
 	compatible = "mediatek,mt8167";
 
+	aliases {
+		aal0 = &aal;
+		ccorr0 = &ccorr;
+		color0 = &color;
+		dither0 = &dither;
+		dpi0 = &dpi0;
+		dpi1 = &dpi1;
+		dsi0 = &dsi;
+		gamma0 = &gamma;
+		ovl0 = &ovl0;
+		pwm0 = &disp_pwm;
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+		wdma0 = &wdma;
+	};
+
 	soc {
 		topckgen: topckgen@10000000 {
 			compatible = "mediatek,mt8167-topckgen", "syscon";
@@ -120,10 +136,325 @@ iommu: m4u@10203000 {
 			#iommu-cells = <1>;
 		};
 
+		disp_pwm: pwm@1100f000 {
+			compatible = "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm";
+			reg = <0 0x1100f000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_PWM_26M>, <&mmsys CLK_MM_DISP_PWM_MM>;
+			clock-names = "main", "mm";
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 			#clock-cells = <1>;
+
+			port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mmsys_main: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&ovl0_in>;
+				};
+
+				mmsys_ext: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&rdma1_in>;
+				};
+			};
+		};
+
+		ovl0: ovl0@14007000 {
+			compatible = "mediatek,mt8167-disp-ovl";
+			reg = <0 0x14007000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_OVL0>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ovl0_in: endpoint {
+						remote-endpoint = <&mmsys_main>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ovl0_out: endpoint {
+						remote-endpoint = <&color_in>;
+					};
+				};
+			};
+		};
+
+		rdma0: rdma0@14009000 {
+			compatible = "mediatek,mt8167-disp-rdma", "mediatek,mt2701-disp-rdma";
+			reg = <0 0x14009000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					rdma0_in: endpoint {
+						remote-endpoint = <&dither_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					rdma0_out: endpoint { };
+				};
+			};
+		};
+
+		rdma1: rdma1@1400a000 {
+			compatible = "mediatek,mt8167-disp-rdma", "mediatek,mt2701-disp-rdma";
+			reg = <0 0x1400a000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					rdma1_in: endpoint {
+						remote-endpoint = <&mmsys_ext>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					rdma1_out: endpoint { };
+				};
+			};
+		};
+
+		wdma: wdma0@1400b000 {
+			compatible = "mediatek,mt8167-disp-wdma", "mediatek,mt8173-disp-wdma";
+			reg = <0 0x1400b000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_WDMA>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_WDMA0>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+		};
+
+		color: color@1400c000 {
+			compatible = "mediatek,mt8167-disp-color";
+			reg = <0 0x1400c000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					color_in: endpoint {
+						remote-endpoint = <&ovl0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					color_out: endpoint {
+						remote-endpoint = <&ccorr_in>;
+					};
+				};
+			};
+		};
+
+		ccorr: ccorr@1400d000 {
+			compatible = "mediatek,mt8167-disp-ccorr", "mediatek,mt8183-disp-ccorr";
+			reg = <0 0x1400d000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_CCORR>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ccorr_in: endpoint {
+						remote-endpoint = <&color_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ccorr_out: endpoint {
+						remote-endpoint = <&aal_in>;
+					};
+				};
+			};
+		};
+
+		aal: aal@1400e000 {
+			compatible = "mediatek,mt8167-disp-aal", "mediatek,mt8173-disp-aal";
+			reg = <0 0x1400e000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_AAL>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					aal_in: endpoint {
+						remote-endpoint = <&ccorr_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					aal_out: endpoint {
+						remote-endpoint = <&gamma_in>;
+					};
+				};
+			};
+		};
+
+		gamma: gamma@1400f000 {
+			compatible = "mediatek,mt8167-disp-gamma", "mediatek,mt8173-disp-gamma";
+			reg = <0 0x1400f000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_GAMMA>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					gamma_in: endpoint {
+						remote-endpoint = <&aal_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					gamma_out: endpoint {
+						remote-endpoint = <&dither_in>;
+					};
+				};
+			};
+		};
+
+		dither: dither@14010000 {
+			compatible = "mediatek,mt8167-disp-dither", "mediatek,mt8183-disp-dither";
+			reg = <0 0x14010000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_DITHER>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dither_in: endpoint {
+						remote-endpoint = <&gamma_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dither_out: endpoint {
+						remote-endpoint = <&rdma0_in>;
+					};
+				};
+			};
+		};
+
+		dsi: dsi@14012000 {
+			compatible = "mediatek,mt8167-dsi";
+			reg = <0 0x14012000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DSI_ENGINE>, <&mmsys CLK_MM_DSI_DIGITAL>,
+				 <&mipi_tx>;
+			clock-names = "engine", "digital", "hs";
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_LOW>;
+			phys = <&mipi_tx>;
+			phy-names = "dphy";
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint { };
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_out: endpoint { };
+				};
+			};
+		};
+
+		dpi0: dpi@14013000 {
+			compatible = "mediatek,mt8167-dpi";
+			reg = <0 0x14013000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DPI0_PXL>, <&mmsys CLK_MM_DPI0_ENGINE>,
+				 <&apmixedsys CLK_APMIXED_LVDSPLL>;
+			clock-names = "pixel", "engine", "pll";
+			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dpi0_in: endpoint { };
+				};
+
+				port@1 {
+					reg = <1>;
+					dpi0_out: endpoint { };
+				};
+			};
+		};
+
+		mutex: mutex@14015000 {
+			compatible = "mediatek,mt8167-disp-mutex";
+			reg = <0 0x14015000 0 0x1000>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 		};
 
 		larb0: larb@14016000 {
@@ -145,6 +476,44 @@ smi_common: smi@14017000 {
 			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 		};
 
+		mipi_tx: dsi-phy@14018000 {
+			compatible = "mediatek,mt8167-mipi-tx", "mediatek,mt2701-mipi-tx";
+			reg = <0 0x14018000 0 0x90>;
+			clocks = <&topckgen CLK_TOP_MIPI_26M_DBG>;
+			clock-output-names = "mipi_tx0_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		dpi1: dpi1@14019000 {
+			compatible = "mediatek,mt8167-dpi";
+			reg = <0 0x14019000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DPI1_PXL>, <&mmsys CLK_MM_DPI1_ENGINE>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL>;
+			clock-names = "pixel", "engine", "pll";
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					dpi1_in: endpoint { };
+				};
+
+				port@1 {
+					reg = <1>;
+
+					dpi1_out: endpoint { };
+				};
+			};
+		};
+
 		imgsys: syscon@15000000 {
 			compatible = "mediatek,mt8167-imgsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.43.0


