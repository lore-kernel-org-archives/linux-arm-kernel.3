Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBB2109318E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skgYPmd/csbMfVTbMpbPZBTc77Iez0lUU9Z3iDW6dW0=; b=CUCoTpc+sln5WrxHGCS2btgmpg
	U6XQL+QALoO0UVAGpkXCpEzvj9iN03lVfCnAQS7HKkmx/HoxYO3G3Dt9Jmdsexl9QwPROpjZf//t+
	+25Gk+/Xb5GWcb5h6ud6Ig+fQq0qqw5a2gESsHRsUkQr+GE+xR4Tm6+6qNaR+woNpIllc7NJqbOEc
	0C/0QDING1ADYjR3/rdgm/fGh0Ckgcji5angD5TVwLVt6QoXylFErH+Ekduyzk4+QUHdsagIt27YO
	zpH/ZqqXdeTYOcZjbDjB/sNmS8aIqRRwdx0wgsv6BJPQvOGQPbxPA9bUG3sQyqwZ7y0njNH6cXWf4
	Q/CzfAwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VTA-0000000CO9R-122w;
	Fri, 20 Mar 2026 08:44:36 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSu-0000000CNqH-41j9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:22 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c742882d2a4so162064a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996260; x=1774601060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skgYPmd/csbMfVTbMpbPZBTc77Iez0lUU9Z3iDW6dW0=;
        b=bT16UvR9mimEFAPgL4XVbW2ff0XjHykM+czG0pEshCqeAEUYjAchJh491mPeGCadbp
         8VcXoTkSRAtHtSZQXPjIA9dW550TtZpg7RQGKInqthGJFwelkBaKeoVpp14w0e6kONEP
         95f+VRvOwZqzRJvEIeIDFTcOqas1O2frzR36k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996260; x=1774601060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=skgYPmd/csbMfVTbMpbPZBTc77Iez0lUU9Z3iDW6dW0=;
        b=kCv8WyoFzkb3Y7D/r3rwHC43/y91rv1Xg99wQ4z39KdVxGd9Bu0qpyR4ht21AWUaz8
         ck9ms4CT+YkUkFfVI3VMrRsmbxCAFK31PZvxaUVtOkTndmGBaPzQZC8AkxSAXAtBwd4u
         VFkmgD9MZbUFSMbT4I4swjeibEydETzw1r7GAl+C0GqbArL2IJ7aQblBk0PY34B1deU2
         mlJ7/YeRl3Gcg6se2zmjcHYjlEGguSP7II/FoheZMi1OOcSLqxEwnVbxU0kNk8P8hnBS
         soBQHwxmAulKiv1hCEweazVbx5t54rStrrNJnfhgGyIAwlXMpxgpaHq+izc/ufo9wTQR
         9/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9FEWELFp+Ya1E3TjAvwMBeBGHj3lthCkGUf06FF90xzh+HRd0GCgeA8xpM6ZO50pWEqST3izX0liY0Au7fzdC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzylk2qIFPDrQBpD8RdWE0ZQVLEo0tFTI0BxEOS/WYVRTsJC1Mj
	NntSRZ7c7W8w+ln1GOjsMUgW2J0LTODJnybfabrz4uSCFRMd2RM1u7EfisGDFCsUBA==
X-Gm-Gg: ATEYQzwuzkmw9Ju5J7DygGeuHmcviJcoSifTutLHzfA2b/GxlecOzFf87Zw337+Y8NX
	JBW51a83OUshjunRRcL7D5qVdVOg9qNbi2o0kCCqIOoZeGlP81Yumk0ieoKnSUA/D5JJWSMYdUq
	6XAOcGJVPtaPP1ZjGV/aXedG4HrhpQ8VxbkSOPD+H7GiaBIqJ1MkGUUjMZRUIMG6F62qC5ukQKx
	MO5UH8YG0qDMQcFR8Vn96Z7oIN4xt6ilGi/tG8yxAUwxSbhDpcsIesLUFruHgCkV+xxAQXII6c2
	XSdBdVCAyBnGkDM5aIZm6g2eTTfQmtyuieTMmWQO23tWJtoDI4hVYuaX0xjv/oBaDp39eRGa3CQ
	5ZmpeMtdT5HO+9Q1GBwOkgTf9gi0EcEjzYLGxBRtXrh10VaOMUl9t7oRtMHLvnOMFDsUYne4666
	OQ+xQL+pncPNpQ5cIQNxYGQNOu2bBhhKe8b9VoHnGi5tO15CPraeyXXfpjQsKkSGRPk8O8qPick
	bMty90w
X-Received: by 2002:a17:902:d4cc:b0:2ae:ab2b:bd75 with SMTP id d9443c01a7336-2b0826d8db3mr20448475ad.3.1773996260036;
        Fri, 20 Mar 2026 01:44:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/13] arm64: dts: mediatek: mt8195-cherry: Add MT6359 PMIC supplies
Date: Fri, 20 Mar 2026 16:43:41 +0800
Message-ID: <20260320084351.2461060-10-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014421_003485_B4914276 
X-CRM114-Status: GOOD (  11.03  )
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

The MT6359 PMIC has a number of power inputs for its various buck and
LDO regulators. The binding recently gained property definitions for
them.

Add the supplies for the PMIC regulators to the common design dtsi file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f1ff64a84267..b53e602659a7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -716,6 +716,27 @@ &mt6359codec {
 	mediatek,mic-type-0 = <2>; /* DMIC */
 };
 
+&mt6359regulators {
+	vsys-smps-supply = <&pp4200_z2>;
+	vsys-vcore-supply = <&pp4200_z2>;
+	vsys-vgpu11-supply = <&pp4200_z2>;
+	vsys-vgpu12-supply = <&pp4200_z2>;
+	vsys-vpa-supply = <&pp4200_z2>;
+	vsys-vproc1-supply = <&pp4200_z2>;
+	vsys-vproc2-supply = <&pp4200_z2>;
+	vsys-vpu-supply = <&pp4200_z2>;
+	vsys-vs1-supply = <&pp4200_z2>;
+	vsys-vs2-supply = <&pp4200_z2>;
+	vsys-vmodem-supply = <&pp4200_z2>;
+	vsys-ldo1-supply = <&pp4200_z2>;
+	vsys-ldo2-supply = <&pp4200_z2>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
+	vio18-supply = <&mt6359_vio18_ldo_reg>;
+};
+
 /* for CPU-L */
 &mt6359_vcore_buck_reg {
 	regulator-always-on;
-- 
2.53.0.959.g497ff81fa9-goog


