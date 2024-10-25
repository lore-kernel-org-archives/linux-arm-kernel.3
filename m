Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19250D11718
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 07:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6laKqa55/o0629X+75d0Pfs5pGBVZ/MLyO3PoLeX31M=; b=lnr9lXxtdrGhxkXrtMDdw/Vzqa
	X1yvav9m5Lth1B+4GtbZtxkMk8KjVg0RvtDXbTtSVDphkh2kEhW2T2eMZSciq2iut5/RNa9e/RyYM
	dUQbzgPbf8KSwizBJsFuxlFDpje9O8tBpXTa5YECMWlOG9PPQKyFCkUn/Y1cTSlYF2GiDKwdS1epF
	adOg6GmN2sAmosZHaaWbAn3mjUMlR5fJ6Bq4DyA3m4WJS2QadS8GlZUDS3GpJKpExkr3ffyLXKOkd
	STqsByLM3/1ldj0yqeV92FIwBnhRhB/oOh2gHA1Xi8QWVc1n+W4jVtBK4kCxdE1FgucFBMt7MUfgV
	yFUi40Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FD9-00000002spg-13e4;
	Fri, 25 Oct 2024 07:58:19 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FBY-00000002sXR-1Xrd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 07:56:42 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2e2cc469c62so1254289a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 00:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729842999; x=1730447799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6laKqa55/o0629X+75d0Pfs5pGBVZ/MLyO3PoLeX31M=;
        b=eUJjqlSXLuKMibEA/2cZP23Lg88Cyy4zdIA4j3zaxmLNmQl2Wy/ejzEJt7Uv4no5Wa
         fv17NEGoPGf9sTx2NEnMdw+kMO1dO1W7x/nF/DJsKz8e0cAg/QrSvTV4RwHfY2D+wt2o
         ljyv9Q3D4YqTK/nOxUrN80KcytL+5rM33X5XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729842999; x=1730447799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6laKqa55/o0629X+75d0Pfs5pGBVZ/MLyO3PoLeX31M=;
        b=Xanz1AHDMYn61o8M6jK0Y4qm6UOnMMA1RyS+ANG9M4BYge3Tecc1XG0popoD6q7VdK
         0+C0Ukhn9OH8BkkBEv8BpYvoQ97TmPUTqIYffA7dtoJkOJkv4TjBxRsVCIXvzCfu3NLc
         SLq+k+mdE3yvxoRJT/E/y3EANH3syj5wBJVo6WJFqN+lNnrDU98RMkqNRaOD7i5CGzFk
         ND8mHqsjWb0oGVCCzHD/laM+YAXajsCLstYGf0capwRDbLS0v9d1ncHyeHP9DibsxB2Y
         aCQMyGzt9qudpw/PI7wqHKZW+zgQ8eFA7pN5VbaL2JkPHfU0OId/G6OpuQ0jdGjAbgla
         UgAg==
X-Forwarded-Encrypted: i=1; AJvYcCUBvtRel59Tj86uurT02EvgirZMU2REdXiEGis6AKkljDbDEaAA+9f+q1kJR4IGB2bi8XPdVMtd4MlxRuNNG/5/@lists.infradead.org
X-Gm-Message-State: AOJu0YywaGCrHN14oWzIYHHmFTybrQNeZyKJPgc/FeDeSRCdvg2kqAIh
	zKoLoSnTw1l92DslIuAXCOx8hB6pmJNzD23IW0diZRK+enELHLvjsjc/8RLAzfChcm+Upoo3FPw
	=
X-Google-Smtp-Source: AGHT+IFmmKGI2cs990SRzNz65POmVSt+7jqG6ghbGRlWIcpYgMGvGVtY/qLmA8mHzd2tQ8d9uEfU1g==
X-Received: by 2002:a17:90b:3850:b0:2e2:d1a3:faf9 with SMTP id 98e67ed59e1d1-2e76b716566mr7196222a91.40.1729842998905;
        Fri, 25 Oct 2024 00:56:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d8f:752c:c7f1:3169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e4c9c1bsm2797553a91.19.2024.10.25.00.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 00:56:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8183: Disable DPI display output by default
Date: Fri, 25 Oct 2024 15:56:27 +0800
Message-ID: <20241025075630.3917458-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_005640_451407_9A693B31 
X-CRM114-Status: GOOD (  13.05  )
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

This reverts commit 377548f05bd0905db52a1d50e5b328b9b4eb049d.

Most SoC dtsi files have the display output interfaces disabled by
default, and only enabled on boards that utilize them. The MT8183
has it backwards: the display outputs are left enabled by default,
and only disabled at the board level.

Reverse the situation for the DPI output so that it follows the
normal scheme. For ease of backporting the DSI output is handled
in a separate patch.

Fixes: 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183")
Fixes: 377548f05bd0 ("arm64: dts: mediatek: mt8183-kukui: Disable DPI display interface")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 5 -----
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       | 1 +
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 07ae3c8e897b..22924f61ec9e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -290,11 +290,6 @@ dsi_out: endpoint {
 	};
 };
 
-&dpi0 {
-	/* TODO Re-enable after DP to Type-C port muxing can be described */
-	status = "disabled";
-};
-
 &gic {
 	mediatek,broken-save-restore-fw;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 1afeeb1155f5..8f31fc9050ec 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1845,6 +1845,7 @@ dpi0: dpi@14015000 {
 				 <&mmsys CLK_MM_DPI_MM>,
 				 <&apmixedsys CLK_APMIXED_TVDPLL>;
 			clock-names = "pixel", "engine", "pll";
+			status = "disabled";
 
 			port {
 				dpi_out: endpoint { };
-- 
2.47.0.163.g1226f6d8fa-goog


