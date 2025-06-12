Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2372C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 03:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ht07tlK7uVqjW6eAyQxL9Kr0y3ckT/a8+OLYs3oBRRE=; b=BgWnzH3WclXvOSpVvt/SmKqioa
	BZS37LSUL+fIMMQ/pWrCJ2W/x0QJeH44a1zrU3HT5IqX2VmxbhOEiUUWGzeka52jmx3N2Kr7Ne77e
	hWuKej/kJsWTgKhc7DsHNAjhXrTxGb1fn7eb8o2kzjjXk8sWqo5zcbv31Z8vv7rxk1aaO4iwYjPtP
	OTt7Eqpc9uiNnsoBSXDRKDIh53CWm72eLgfJRxj3ttJQrozaSTGd0kIDaCZ3zHPYplsIlOgZo4ntj
	o8/hSHs8KkEISMruVffOC4hj8B0C7BCsNvKMZgBcl8wUbNWvTBHHKayEtm/MGpnys1gsSyIKToWm5
	VMlTsKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYLM-0000000C2ff-1GJZ;
	Thu, 12 Jun 2025 03:11:08 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVyc-0000000Bncy-0p1p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 00:39:31 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7d0976776dcso42726185a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 17:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688769; x=1750293569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht07tlK7uVqjW6eAyQxL9Kr0y3ckT/a8+OLYs3oBRRE=;
        b=ls8sn5EF+XWJZHBPSkU3iY1r+avYe02iXLuSWS/zYkePFwP3BdJJIJkNCur5H5j/Ds
         LujZqR44ANuR9gUdsWq3Quxiu8rq2XpfAVR0ulyqnRcLNz8StLh2ZWZBIQYKEmXxeSlc
         RWeDrFiCs/4d0UTAnRZyK59DHomjqiuo+kvIuwkpx+MxRbGmnbIn1TGRqfQ37gRsyQAi
         x88GziYOywg7lHv7RV8ZV0RH8F3Arb3ViLlQI2iiYbt2/aZqSIfBUJNmSBJv9Q2P227i
         uvvYCwWbb7CSvofggV0dofskENO7k5a6AAEjqpmCunpJvxzOyfJnadDstNkdNhuUbrKz
         3niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688769; x=1750293569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ht07tlK7uVqjW6eAyQxL9Kr0y3ckT/a8+OLYs3oBRRE=;
        b=mCwlAf5M62uSmchhNQqylw741bBRSSizV1/sjmVXKAW/I8wUuVGqupeN207MFp6sDO
         AKOJwxinjYEyDN4LusYkYpxCiH2pkjSaFnQxLnvH1Yj7aPmQF00OYTiQsrDEUVcBHRnp
         QMv4aoPWSJJtUzGLsy55LREWxYmJKcOhJtRnV/vFsE7CsVM4HlS+ZYF8xRcP9N3RWhnn
         7jzMKHqpqcpg6yBer6VUy3RrtaOio5j0EtSBpDlmjd3kZ3Z+a0QMV2kn7oGK2OxYKSQr
         0CO/i7fP/r8LdJwi2bz6brnrw/zg3A5PuMCZIyqOtolRA7lEmOd5thQIF9vnmSUyBx46
         f7Yw==
X-Gm-Message-State: AOJu0YwNyM53sT5xTzibN+n/0QefHgcxaPakqff8mny47LT01vKSmoRo
	/LJwGzOnlgaln218tzgfGAf/mvlxCE6O9CtzfytsXFI7MlsffGCoIlI8PNGObQ==
X-Gm-Gg: ASbGncuXbVRGRroj0djuSOYxO6AFq/NHdQNEIChja8/5VDhJHOCbd4odJsGrjcDaGk5
	wdS/ZTtSw3KCCHrks1bo7urO8KkvFY9eU7j+Crqvh7kuvlbXnZrFxfVuycDNwMdR1srIKfyxurW
	SdCPAxUvpv9YIpP4O1fTCmoFZac219J5fTkYCpk5zNhIxc4I2yYI9+AKdU6ihZJkD1w3oaNIFHO
	juLvvvGWHifwPCDb3DK1ZLzqrArZCxV5X3UhBcc1d/lsjgaihQ+Df1O/ENbrWvRCqv+nYWoynz6
	fvDJX4AlpagrhjM9t3IxHnfIc21dXaSSYmrBpeuWGaAmjVXdLlO1xRzK6UUle5JDRxg8e+MCcxz
	ZKHWK9yGZcFh3OGV2kMLhZeo4iDoNwkpRfaf3
X-Google-Smtp-Source: AGHT+IHj92rjE5qEUlCyMD3EgBcwTmr2UdNmG+KE1Nz52ks8zHt3wuxrHowijrdAL92PLvCq+AMakA==
X-Received: by 2002:a05:620a:2699:b0:7c5:49b7:237a with SMTP id af79cd13be357-7d3b360025emr167835485a.19.1749688768755;
        Wed, 11 Jun 2025 17:39:28 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:28 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/4] arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
Date: Wed, 11 Jun 2025 19:39:19 -0500
Message-ID: <20250612003924.178251-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612003924.178251-1-aford173@gmail.com>
References: <20250612003924.178251-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_173930_233339_16F32DF8 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

From: Marco Felsch <m.felsch@pengutronix.de>

The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
VPUMIX power-domain nor their module clocks since the power and reset
handling is done by the VPUMIX blkctrl driver.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 948b88cf5e9d..1bf15c502280 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -876,24 +876,17 @@ pgc_mediamix: power-domain@10 {
 
 					pgc_vpu_g1: power-domain@11 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_G1>;
-						clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
 					};
 
 					pgc_vpu_g2: power-domain@12 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_G2>;
-						clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
-
 					};
 
 					pgc_vpu_vc8000e: power-domain@13 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_VC8000E>;
-						clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 					};
 
 					pgc_hdmimix: power-domain@14 {
-- 
2.48.1


