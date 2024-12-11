Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C05CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 05:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tY7r3wEjIkXTlIAMLJz+ui9MVhaOPU6f72Mx3sHGkok=; b=xcdvS/5j0ppujUeuhVbwEo7eXa
	pkspANwXIsRGcskzVgDNs9Nck/MXG9u/yLTLUtcAqI7f+b4GWyUh2Silo2XhhPWykOGUXtc++qzLk
	+59c5r+SBP7chzlCmbTbY1T7bRwJBCu1pLMHMcrQCn1FJ0+wbBQzD7hxY2Clk7MyFwtCg6OUqz8PA
	Om6JXZmvKbzFm0nO8UPZu98Abzigdnr7byQz+tisG6TO8tbdXbozHiyBKCril5klCCcBLeFa+PJdd
	bg09ClhJAT1KwommsbYcbp2VA4S9fYVZCu2rGPo26SZQG3n0pOgWwqotUCS5a5GkpjajF1iD3jJ+y
	+TCVSagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFHI-0000000DptQ-1QCE;
	Wed, 11 Dec 2024 05:28:52 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFDH-0000000Dp4T-19nR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 05:24:44 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-725dc290c00so258217b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 21:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733894682; x=1734499482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tY7r3wEjIkXTlIAMLJz+ui9MVhaOPU6f72Mx3sHGkok=;
        b=NbY/eJKOGPo3xdBz+8EBHpXdtiOlrR1/Jp1fRWfpapy5aV+Ox6OUj3ZdUJMhPErrNS
         qsomXVf4dQfhJHxa4BplOjT/yAlj/4nYVfbsqefU1zc6j97vdlW6C6yTtTczOXM8duPs
         xC51J3GU6tJBGkyumj0KTDQ6LPnAXWTCcl6SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733894682; x=1734499482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tY7r3wEjIkXTlIAMLJz+ui9MVhaOPU6f72Mx3sHGkok=;
        b=T/oZzAM6cL94Hf6CGj7GTbbZWVBqbUeFb2UxTtzo0n0Nhprw+A6qEs9OOFwvf798mY
         yscoL+I0P8zFbZvBXWoW+DPktzpvr5uBEMhHOVp4Qws8fPYM5VeweGLj3+8ZGBosbOrk
         aK61svNq4gweAJY1OISET+yGGzZuqhtTcu3lmILVgPEF6O/mZVQiFIIRcwSrcNLHMMlx
         +fTX2hKKUYc8CPt+I2XnOFOiO+2VVgmoKtTz0Jw465IEVIWOOhGyXDOwthnVud+mDYQR
         aLKq2pIcMVH+GxmFjfgSNN1Ym0YS6kRrZHy1l3V3eMSdbwdwMtokt7QB2v5mQ1hsgvLg
         gTBw==
X-Forwarded-Encrypted: i=1; AJvYcCWI5T/ApCLjhHORu3QWRP4mE9N+rzjkIqUoArL2VYsWICzR7TxAgfOZzE1BiHyeOHsHSGeGOo/yvbpgOI15FlMi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9g5+2AWuQZsSEDWraTVhHQRu+GokbhNITagLsLFNP1Q4mllsC
	jjQqHdw2TgRLQyuzflEimBjDGNRz6Rm2xWT9rBooGe0jSatbkyVTAGc4oWiYWA==
X-Gm-Gg: ASbGncskpQPX6lwDUx5fs1uKEOeU8kU25XRqRTQfo1EbnTNEKZ6Y7MUyKaafpQLl6fw
	ZLeoO7iydYZHmKVCxauBGQvntqsazkVuo8NAgqQ+whtxL+2ISM1iy2SGnhaBGE7RO24bO7Sk1zX
	yLNKVcoo0cDLdgsYCS3iC6jIZSssXqjDf4Nj/tjuf3zyFjiEhVrxOBTdzS7xTvkw7IdiV5b+aTV
	oijztLqpowt7cqQkLQeH6IX8Zf6VaFeLdoQWeA/QF0ybU1TSzxrmikRTHNmxDemXDIXfMzz
X-Google-Smtp-Source: AGHT+IHPBmMY46nd40L9l8B7rqf5OCepHo36t8dy/i4aNYeTnSBw7vMG0JUR5wQ8qEOw6/U4VQW7Bg==
X-Received: by 2002:a05:6a20:d8b:b0:1e1:a48f:1212 with SMTP id adf61e73a8af0-1e1c26a8ecbmr2331768637.4.1733894682401;
        Tue, 10 Dec 2024 21:24:42 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e66801e2sm5397702b3a.160.2024.12.10.21.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:24:42 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] arm64: dts: mediatek: mt8173-elm: Drop regulator-compatible property
Date: Wed, 11 Dec 2024 13:24:21 +0800
Message-ID: <20241211052427.4178367-4-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241211052427.4178367-1-wenst@chromium.org>
References: <20241211052427.4178367-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_212443_311192_3DA52E79 
X-CRM114-Status: GOOD (  12.32  )
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

The "regulator-compatible" property has been deprecated since 2012 in
commit 13511def87b9 ("regulator: deprecate regulator-compatible DT
property"), which is so old it's not even mentioned in the converted
regulator bindings YAML file. It is also not listed in the MT6397
regulator bindings. Having them present produces a whole bunch of
validation errors:

    Unevaluated properties are not allowed ('regulator-compatible' was unexpected)

Drop the "regulator-compatible" property from the board dts. The
property values are the same as the node name, so everything should
continue to work.

Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 23 --------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index eee64461421f..b91072f4723f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -946,7 +946,6 @@ regulator: mt6397regulator {
 			compatible = "mediatek,mt6397-regulator";
 
 			mt6397_vpca15_reg: buck_vpca15 {
-				regulator-compatible = "buck_vpca15";
 				regulator-name = "vpca15";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1350000>;
@@ -956,7 +955,6 @@ mt6397_vpca15_reg: buck_vpca15 {
 			};
 
 			mt6397_vpca7_reg: buck_vpca7 {
-				regulator-compatible = "buck_vpca7";
 				regulator-name = "vpca7";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1350000>;
@@ -966,7 +964,6 @@ mt6397_vpca7_reg: buck_vpca7 {
 			};
 
 			mt6397_vsramca15_reg: buck_vsramca15 {
-				regulator-compatible = "buck_vsramca15";
 				regulator-name = "vsramca15";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1350000>;
@@ -975,7 +972,6 @@ mt6397_vsramca15_reg: buck_vsramca15 {
 			};
 
 			mt6397_vsramca7_reg: buck_vsramca7 {
-				regulator-compatible = "buck_vsramca7";
 				regulator-name = "vsramca7";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1350000>;
@@ -984,7 +980,6 @@ mt6397_vsramca7_reg: buck_vsramca7 {
 			};
 
 			mt6397_vcore_reg: buck_vcore {
-				regulator-compatible = "buck_vcore";
 				regulator-name = "vcore";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1350000>;
@@ -993,7 +988,6 @@ mt6397_vcore_reg: buck_vcore {
 			};
 
 			mt6397_vgpu_reg: buck_vgpu {
-				regulator-compatible = "buck_vgpu";
 				regulator-name = "vgpu";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1350000>;
@@ -1002,7 +996,6 @@ mt6397_vgpu_reg: buck_vgpu {
 			};
 
 			mt6397_vdrm_reg: buck_vdrm {
-				regulator-compatible = "buck_vdrm";
 				regulator-name = "vdrm";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1400000>;
@@ -1011,7 +1004,6 @@ mt6397_vdrm_reg: buck_vdrm {
 			};
 
 			mt6397_vio18_reg: buck_vio18 {
-				regulator-compatible = "buck_vio18";
 				regulator-name = "vio18";
 				regulator-min-microvolt = <1620000>;
 				regulator-max-microvolt = <1980000>;
@@ -1020,18 +1012,15 @@ mt6397_vio18_reg: buck_vio18 {
 			};
 
 			mt6397_vtcxo_reg: ldo_vtcxo {
-				regulator-compatible = "ldo_vtcxo";
 				regulator-name = "vtcxo";
 				regulator-always-on;
 			};
 
 			mt6397_va28_reg: ldo_va28 {
-				regulator-compatible = "ldo_va28";
 				regulator-name = "va28";
 			};
 
 			mt6397_vcama_reg: ldo_vcama {
-				regulator-compatible = "ldo_vcama";
 				regulator-name = "vcama";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -1039,18 +1028,15 @@ mt6397_vcama_reg: ldo_vcama {
 			};
 
 			mt6397_vio28_reg: ldo_vio28 {
-				regulator-compatible = "ldo_vio28";
 				regulator-name = "vio28";
 				regulator-always-on;
 			};
 
 			mt6397_vusb_reg: ldo_vusb {
-				regulator-compatible = "ldo_vusb";
 				regulator-name = "vusb";
 			};
 
 			mt6397_vmc_reg: ldo_vmc {
-				regulator-compatible = "ldo_vmc";
 				regulator-name = "vmc";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
@@ -1058,7 +1044,6 @@ mt6397_vmc_reg: ldo_vmc {
 			};
 
 			mt6397_vmch_reg: ldo_vmch {
-				regulator-compatible = "ldo_vmch";
 				regulator-name = "vmch";
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3300000>;
@@ -1066,7 +1051,6 @@ mt6397_vmch_reg: ldo_vmch {
 			};
 
 			mt6397_vemc_3v3_reg: ldo_vemc3v3 {
-				regulator-compatible = "ldo_vemc3v3";
 				regulator-name = "vemc_3v3";
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3300000>;
@@ -1074,7 +1058,6 @@ mt6397_vemc_3v3_reg: ldo_vemc3v3 {
 			};
 
 			mt6397_vgp1_reg: ldo_vgp1 {
-				regulator-compatible = "ldo_vgp1";
 				regulator-name = "vcamd";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -1082,7 +1065,6 @@ mt6397_vgp1_reg: ldo_vgp1 {
 			};
 
 			mt6397_vgp2_reg: ldo_vgp2 {
-				regulator-compatible = "ldo_vgp2";
 				regulator-name = "vcamio";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -1090,7 +1072,6 @@ mt6397_vgp2_reg: ldo_vgp2 {
 			};
 
 			mt6397_vgp3_reg: ldo_vgp3 {
-				regulator-compatible = "ldo_vgp3";
 				regulator-name = "vcamaf";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -1098,7 +1079,6 @@ mt6397_vgp3_reg: ldo_vgp3 {
 			};
 
 			mt6397_vgp4_reg: ldo_vgp4 {
-				regulator-compatible = "ldo_vgp4";
 				regulator-name = "vgp4";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <3300000>;
@@ -1106,7 +1086,6 @@ mt6397_vgp4_reg: ldo_vgp4 {
 			};
 
 			mt6397_vgp5_reg: ldo_vgp5 {
-				regulator-compatible = "ldo_vgp5";
 				regulator-name = "vgp5";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <3000000>;
@@ -1114,7 +1093,6 @@ mt6397_vgp5_reg: ldo_vgp5 {
 			};
 
 			mt6397_vgp6_reg: ldo_vgp6 {
-				regulator-compatible = "ldo_vgp6";
 				regulator-name = "vgp6";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -1123,7 +1101,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-				regulator-compatible = "ldo_vibr";
 				regulator-name = "vibr";
 				regulator-min-microvolt = <1300000>;
 				regulator-max-microvolt = <3300000>;
-- 
2.47.0.338.g60cca15819-goog


