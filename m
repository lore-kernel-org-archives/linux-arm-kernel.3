Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85421D75BD8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sA8zIvCeVehOTON6gWSJevS8rNPym+2I4qMSEQq/Vfs=; b=eJPgChdaMQIdIY/sq7h5upLnJi
	sf4O3ZqkqWExAjb+sLHJKxiXHAn8PD/2q5ix5I+ty2QAVK3AysnCM2pT+5B4ItBinzqoUJjCtiidg
	aLG+zrQnvwHzn9EKXOzsSSyJCS+B/VvKqGh84Cu9ISqEvFWD6pDoaQAudqZAw3rpF3Vz0u886JG+J
	CruD2y1tPsCTsJiknR38jNhLvNwqtgICtkS7g6lX6KZa+u3Cl5z8FICaoL/WbOLzF8pLBBfZYW2rP
	zFEe40A1cNshxRR+njaPpRXEeecsHhV3Cy2EnzADnFdnZ9s5rWUo0AeYcdo/FUYfc8GLEsoelTFzY
	kDY+jWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2zt-0000000H9tm-3enA;
	Thu, 21 Nov 2024 08:57:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2wE-0000000H8xk-1vsB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 08:53:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3824a8a5c56so414235f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 00:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732179201; x=1732784001; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sA8zIvCeVehOTON6gWSJevS8rNPym+2I4qMSEQq/Vfs=;
        b=dhfp1G4T+cWUp5RrvFuu2YA/Fc7MIoE78FVqgECTJ/Tth0Sx9ZuBx5nDciv3FCRMez
         W7P7aa8MD3Ii0aZkB5eiMHP6XcHyKT0rJwO708RHjvDObAoYKA1w8AKd2tf68nca7LUf
         OHFpEJqvIttgiV3dHY6y+Z4l/mSYqdg74rf2Z3NhfIg5M6CMxQQ1jjWFTZPI31yZxjVx
         qCOxRAF66F9yUwUQSQF6qIHOmz3TlLq6LM2Z7FxMq0SRZXIV6/EiRmN0xStUyHZZ5ojN
         +O9GQ9M+rsGzJ69LETVh0d+vohBi2xNSDbtRQGJa/q+awkjPDv5rYygKSpXz6p7wi4C2
         sRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732179201; x=1732784001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sA8zIvCeVehOTON6gWSJevS8rNPym+2I4qMSEQq/Vfs=;
        b=TlVHSvfXxUVebCJ5RZLll4RZ8Qv6yCd9LWuu7nnK9yeLXaIdV8THpiF8UHfAbQ7hnJ
         nFGCCTrg7QoW6/NifF9BKG6Slzs9pcGEm9AErpUnuX6EdlgRnn1amrcgsm5U5RRPOEcU
         S9HurbVgbmfUiRdKcWUqI3enAyslIHxccn78KEfLgyC2U2+roItu/QLslqDcmooGKcIw
         4h1W5k+s52xlbNm3d151rqKBdedQdokLDzqCkM7AnsFP6Si7tOt0FrWogFasN2EqkLAM
         lit7SWkKMGonYp1PrJISd7MP8oAfq/f359vOmpIRt7JTY8ixxPWAL+7z35kW61H3WqZN
         08/g==
X-Forwarded-Encrypted: i=1; AJvYcCXMtKjHGMQ33ja72r0SuVVf+DyyNN8osxUmowwFv2mA/S3hOCbaIp1w/p/zMjLLZOw3b7cBSDtFdBhKrNmnQWLX@lists.infradead.org
X-Gm-Message-State: AOJu0YxNfI0xGJvhaS86/ImtMLmhweHbHUpntkwkw//vuXeP97zth7yF
	eM0gF09Q4mDExwMumNTI53c+KSI/BVvyKaq082E0KHMSsO54aSDh7uQksb89QiU=
X-Gm-Gg: ASbGncu4P2WkHUipNokP1CbJHBlbJ7eGIaFMi3JdIcGNgBh1dDZdQnWzUc2Q1Nf7NgZ
	3/qercyNDEzwzhfU4FAkbC8BHE6u/17CvlsZp6LHnp81wwkmi9Ry4Gg1GjH9efiJbL9GPXuBQlq
	rNKKCfW7G7+4JJZXiUHU9BEMOKvm4HOeJQNpUXSPzuQq5ySFc5bwCZneGHqTIbLBxjqH3t4zpYm
	gp5LubMDb2YFcyKUeMarQ46AIJq6laBh5D5G9lSlY7cHPSIXXHWaGNnbn2fm7qPuSrEutFVMmpN
	17OXHPpxRLAT+TD+/9OAHznkxth+XsE9GBadIJ1PdcQ=
X-Google-Smtp-Source: AGHT+IEb1ziv6SCjdyDQL96zzjg5G/z4Gi8F8wOiJmIAV34djYMshwdbu/LEIi6CkwPFG6A8w8/SPQ==
X-Received: by 2002:a5d:584a:0:b0:382:5492:4670 with SMTP id ffacd0b85a97d-38254b163c4mr4639144f8f.40.1732179201134;
        Thu, 21 Nov 2024 00:53:21 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382549111fdsm4219900f8f.58.2024.11.21.00.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 00:53:20 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 21 Nov 2024 09:53:19 +0100
Subject: [PATCH v7 5/5] arm64: dts: mediatek: mt8365: Add support for
 camera
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-add-mtk-isp-3-0-support-v7-5-b04dc9610619@baylibre.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
In-Reply-To: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andy Hsieh <andy.hsieh@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_005322_549375_2DE23A63 
X-CRM114-Status: GOOD (  11.57  )
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

Add base support for cameras for mt8365 platforms. This requires nodes
for the sensor interface, camsv, and CSI receivers.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 125 +++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 9c91fe8ea0f969770a611f90b593683f93ff3e22..f3aae8d76cbece5779fe0b23139d594c0ea52579 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/mediatek,mt8365-power.h>
+#include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
 
 / {
 	compatible = "mediatek,mt8365";
@@ -704,6 +705,23 @@ ethernet: ethernet@112a0000 {
 			status = "disabled";
 		};
 
+		mipi_csi0: mipi-csi0@11c10000 {
+			compatible = "mediatek,mt8365-csi-rx";
+			reg = <0 0x11c10000 0 0x2000>;
+			status = "disabled";
+			num-lanes = <4>;
+			#phy-cells = <1>;
+		};
+
+		mipi_csi1: mipi-csi1@11c12000 {
+			compatible = "mediatek,mt8365-csi-rx";
+			reg = <0 0x11c12000 0 0x2000>;
+			phy-type = <PHY_TYPE_DPHY>;
+			status = "disabled";
+			num-lanes = <4>;
+			#phy-cells = <0>;
+		};
+
 		u3phy: t-phy@11cc0000 {
 			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
 			#address-cells = <1>;
@@ -774,6 +792,113 @@ larb2: larb@15001000 {
 			mediatek,larb-id = <2>;
 		};
 
+		seninf: seninf@15040000 {
+			compatible = "mediatek,mt8365-seninf";
+			reg = <0 0x15040000 0 0x6000>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&camsys CLK_CAM_SENIF>,
+				 <&topckgen CLK_TOP_SENIF_SEL>;
+			clock-names = "camsys", "top_mux";
+
+			power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+
+			phys = <&mipi_csi0 PHY_TYPE_DPHY>, <&mipi_csi1>;
+			phy-names = "csi0", "csi1";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+
+				port@4 {
+					reg = <4>;
+					seninf_camsv1_endpoint: endpoint {
+						remote-endpoint =
+							<&camsv1_endpoint>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					seninf_camsv2_endpoint: endpoint {
+						remote-endpoint =
+							<&camsv2_endpoint>;
+					};
+				};
+			};
+		};
+
+		camsv1: camsv@15050000 {
+			compatible = "mediatek,mt8365-camsv";
+			reg = <0 0x15050000 0 0x0040>,
+			      <0 0x15050208 0 0x0020>,
+			      <0 0x15050400 0 0x0100>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&camsys CLK_CAM>,
+				 <&camsys CLK_CAMTG>,
+				 <&camsys CLK_CAMSV0>;
+			clock-names = "cam", "camtg", "camsv";
+			iommus = <&iommu M4U_PORT_CAM_IMGO>;
+			mediatek,larb = <&larb2>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					camsv1_endpoint: endpoint {
+						remote-endpoint = <&seninf_camsv1_endpoint>;
+					};
+				};
+			};
+		};
+
+		camsv2: camsv@15050800 {
+			compatible = "mediatek,mt8365-camsv";
+			reg = <0 0x15050800 0 0x0040>,
+			      <0 0x15050228 0 0x0020>,
+			      <0 0x15050c00 0 0x0100>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&camsys CLK_CAM>,
+				 <&camsys CLK_CAMTG>,
+				 <&camsys CLK_CAMSV1>;
+			clock-names = "cam", "camtg", "camsv";
+			iommus = <&iommu M4U_PORT_CAM_IMGO>;
+			mediatek,larb = <&larb2>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					camsv2_endpoint: endpoint {
+						remote-endpoint = <&seninf_camsv2_endpoint>;
+					};
+				};
+			};
+		};
+
 		vdecsys: syscon@16000000 {
 			compatible = "mediatek,mt8365-vdecsys", "syscon";
 			reg = <0 0x16000000 0 0x1000>;

-- 
2.47.0


