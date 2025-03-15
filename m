Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B175C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G2IKgkMunXXR7TMdxbK3sY9zvfwwFTJHvRuEsUq2o28=; b=fOOGAFM9hVAXHEh5BaxWNeV0ld
	Ub0/94D3yexGKZPMcPEHhLTxuzSDUnU5fuFbHUVlL+lpeisHU1ac/u4RkvaGuB/43cwlqq4vIX/gN
	qq4mYw/wbuWSZG5AZXNnRmhrOYT5Vcz7jqgxVRZsjPcgxiujmB4dDmzizh7PdhYsqwCcqW4HAVaoY
	0mprytGMQ3Y9msob4uL/9Dgx7HGfpdf7N7sKrE8n/Id0Ex3MLPKAfZ54zc0vxpMoUDVH+kXs40YqY
	ZL71ANiaDm+Ta1rSb49x4Guq+xOSVGwy3B9RIhuTQ17EfB8CWm0ZwT6Y1gN0klRkjscZViswVtj/y
	JCuA6qvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttQNk-0000000GJud-398Q;
	Sat, 15 Mar 2025 12:12:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttQM4-0000000GJVp-0iaH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 12:11:05 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-225477548e1so52403125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 05:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742040663; x=1742645463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G2IKgkMunXXR7TMdxbK3sY9zvfwwFTJHvRuEsUq2o28=;
        b=YS0Ahj3fq1pybsJaCLmfHccV3uO6F6AGcDaZAn6T0db+rxcYxx0cyihb80unJs03BP
         nNhrN6Ru6MWMUk2do18yzOufQ9OgbtRr298ZYURHudoxbM/gicB2F/wfl0vNabBPnG9Z
         05b9/HmrWGO71IpEaYldimDupsR0cqkjWxOIJhLnPaJ2kiyHNi48sSaBqmFUO7oeZRf0
         IP2Q4UnxFgaQR/r+VJyxqb7iWb9uHdXWnStXuFy4IVVW51REfJvG0ZvjEICvlThRQbWE
         6fR8lXNpLcRRbM+cgFkfsBncT7PxCKy122i0XpG5fmyoNTM/07h2SqXjgN4vaSbLTQ7T
         3Arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742040663; x=1742645463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2IKgkMunXXR7TMdxbK3sY9zvfwwFTJHvRuEsUq2o28=;
        b=Goc1bgMU7yNtq4TMl9RO+OEAMPanasIQocF2ZhjecbvV6wTbFo6WfAYiHYOz8po0cU
         NRqvWSDhEtIqURCRI/Y40CC6mWda11YPzvTQco1zuswGf66+BBV3hEb/IxrI0Pezawor
         EZaou/1Qazrqwwfh/5XJw6LUUZ56divtI1reY3SCdNBJuyVrK7pNPBVZiKVmMV3++vgY
         m+Mlaknf7ooNcXaRqvMMBQnV+B4zpYHrERC3gXy47l+oNxXULXqOdwPEZAM//ynT3V8G
         gRqXJlVzQuIhCUCr86JY8eRKOLiCBKjRjQMhUVURPxAyn9kP8SjihAdIH2wyuPf8QUIn
         CkVA==
X-Forwarded-Encrypted: i=1; AJvYcCVEjXP28HZJGU1jM/sKfQfCtJ0q6vI2GIEl8dxTrTgsxVPxxwSL2bux318Y8WAPrcM26rCH4BOwD7yrZAT/N9Se@lists.infradead.org
X-Gm-Message-State: AOJu0YxsaiQE6Cbvrtah/UjBac7STSRFqxuEtfvdXQR/mGR2S418C699
	YyzqJh3XDmH6PRjqDHpLROk0sYOI4TVvFHC2aKyhj+bzDelrRHxdKtizPQ==
X-Gm-Gg: ASbGnctGcjSf9JIYjd1CzM5cr7G6pVuXonxBRyUGtPDy21dPqHjQCyopjQlDw4jQnHC
	MNz7GotTQ0VEBAkzD6+6hvj05xd/uja6cOQel2POLE5uTB9TTCG3YVNYHtvGDy0grmqGaNeutj3
	L7FcG9trrJwKEZxqTVfpfJ5VLmWoJiFjeLGmtt6DiL9fF3EaQlNylm9U8mbCxEo8ph6WxLc6KuC
	stH9bVPeKduldVjyBy0xPzSRpArBFvU/lyF3CVdUoJ/pv7EQZgSI6/aDLP4G3jTvAsR8hboscqK
	bZnTMeVxczPPe6m+bdYO2M87RsdzibIu3uUBzk8zRSEc7XH/f93OYoBAehw=
X-Google-Smtp-Source: AGHT+IGE+xVI7k0GD4ELtarb/xQZutRjL9TN/A3q/gGjUNc5bXqV1cAMaJxT4xFpFbcyvwPEIQUQEw==
X-Received: by 2002:a05:6a21:62c8:b0:1f5:70d8:6a99 with SMTP id adf61e73a8af0-1f5c1132b10mr8367207637.4.1742040663347;
        Sat, 15 Mar 2025 05:11:03 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:bb6a:1a3e:36e4:cce7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9ca494sm3504140a12.5.2025.03.15.05.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 05:11:02 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] ARM: dts: imx51-digi-connectcore-som: Fix MMA7455 compatible
Date: Sat, 15 Mar 2025 09:10:54 -0300
Message-Id: <20250315121054.1836483-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_051104_213579_D2BC589D 
X-CRM114-Status: GOOD (  11.94  )
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

From: Fabio Estevam <festevam@denx.de>

According to fsl,mma7455.yaml, the correct compatible string is
"fsl,mma7455".

Change it accordingly to fix the following dt-schema warning:

failed to match any schema with compatible: ['fsl,mma7455l']

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Fix MMA7455 typo in Subject.

 arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi
index dc72a2d14960..1980f751f161 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi
@@ -165,7 +165,7 @@ &i2c2 {
 	mma7455l@1d {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_mma7455l>;
-		compatible = "fsl,mma7455l";
+		compatible = "fsl,mma7455";
 		reg = <0x1d>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <7 IRQ_TYPE_LEVEL_HIGH>, <6 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1


