Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8D8C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 04:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85nfx4ldL54wSVT5XtoQ/mvHVV77q6rK3dhp/Wa5E+U=; b=SPvDLPafrkaJi36rYjBST+k/cI
	2ChRaho290M88s5HUBWnwzItWB0AmAYlgN0cg/+dgY7QB2Fbcq/1RhAv68B2xPqxxb5L/0srAXNfy
	3oYhpG03gY+20kbTv3lNzkJk/qD3EbFqSKp20w9JhgMutfIm44sw3284F/ihlLz34/gqvhsLQXmG+
	6PKrD1XopOVu7Zubv6tNMLui7GuCS0Sv8LoplibCTFjB0iTo125ZftxQGr9HXlrvDs4vIeuqKOLSK
	HerPqqTKU1uKalls+3SPFPK33W/55TKxCilPie8gisri3OZ5i5xPrQtCXzgQJI7lGqsqgECjFlbLF
	hsVRhziA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua53P-0000000DdLn-3JV4;
	Fri, 11 Jul 2025 04:08:07 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua4uj-0000000DcUW-3nNr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 03:59:10 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso1837549e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 20:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752206348; x=1752811148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85nfx4ldL54wSVT5XtoQ/mvHVV77q6rK3dhp/Wa5E+U=;
        b=WQTSt/rhXplQkhpCtJjI+2rTZx4uiMMW6ZQvURIE7v38pIreSTaqFZIZWD9GzMXv3K
         qehO3nMD8EcCWRX82i6nDMltKHnVOMoaUBKB/Z1TYUXlTYtUij5eBgtn2tqAS3md5qrD
         LbqsKA0SxPfJ8Mgx+DgkwxE+f8GdcZ/dzwt2h6A79VHMTlG5uUaRj6wDTWjYMFcQIxU8
         yICeuQlrqotwSNK9ktTYdyLA9VJPkUGEJBY/nszPa8dAbZ6JtztelCnScN9o0u3wm+GI
         WzBjTBSDRpoAe63vldnsCZdbDuc0/ChSPutzl5/ap6mIFjCB/psQT+889kU/XK4TdZ6H
         69Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752206348; x=1752811148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85nfx4ldL54wSVT5XtoQ/mvHVV77q6rK3dhp/Wa5E+U=;
        b=anFF0gflFsd8shqXJ4GMVTDPnK4PozE3aTbIRs4pY1hn1SGxCNHVQB7HDzrAz6MLda
         ACyHgtYs2nRNr5MjW1MwVj5w8qRPweyR6WHHJBKe8nDKFZLPnfC6cpDS5pIxGNFAZkv9
         dC9gG6kSSYEVPQTVGli5KI2ggzrr/+09/Snx4ndmf3Uuymy4BAFtq2mscdLSJ5h4r6fz
         fOuLT7sN6uSDcYTbBcKylYcbs4uYS22GTfmEb+8DCA9bQOL/ercZG/jK07a+LxmEQYAw
         v0tWtXWB40opHC0qDzYQKV+V7ugactewj8K5SXBtfz3LtiFy/B4GLSOJGarQjLp+nu/m
         dKYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxiQjvyH+RFy7C8MbfJklNSmmOUxM+OMe0/q4hhUMvqqHnuG98ti5cAAvMlOPftqFo8xtQCsLaErhCTNx7t/1g@lists.infradead.org
X-Gm-Message-State: AOJu0YxoAT8U4OGQsT/5eQdqSPqt4ED5T4zQExvEn/4+hOqhlTz5KaqZ
	5jySxzx1rgbLL2lXV81T0ElkNZFKKL9F0yeI6bPbwsr/rxedUCSJxNnd
X-Gm-Gg: ASbGnctpe48CCXS0h3BGH4h2WX9m/7U48HiI1ejz54JhYItQ5Xaiv8lOcW57ZEfA1By
	eGjso/F4ckY+KWdN8+2u9EZoJoFAJh/lnuX6yuqBXiuwRkUXJO6BfiDZqkyT9nRl6GLp9LYb9JI
	R/bIQMoU1PhJw6H08kl22gr09SNJL2D/LwbvJLdJ7pY1RuDFsEY4iO5g86usQ8ede6ndnLeF81w
	cjm4+BVgZvy9d7oXL4S8Du2Mv73kly8jzIcZFbj5AYU1xlOQ0d0Nhno/FjStulweaJOJRD6mWrd
	LA+P3bfuvTwU3W9dLtExQSm17lRU54ZDRpc966rPK63vCPlh2wW0JVVovr/83mD65B5nJYBjFhM
	LtuvqHpgEi0c=
X-Google-Smtp-Source: AGHT+IF2Vs2taWbckoiIUXDCtLJBtsJW8Ugy8fMUOW8WzA36Et0dLFCN8dorIxDAVjB7GGJ88bp0Fg==
X-Received: by 2002:a05:651c:555:b0:32b:7ddd:279e with SMTP id 38308e7fff4ca-330532dfb0emr4152281fa.14.1752206347958;
        Thu, 10 Jul 2025 20:59:07 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa2943d46sm4971191fa.40.2025.07.10.20.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 20:59:07 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.or>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: enable Mali GPU for all boards
Date: Fri, 11 Jul 2025 11:57:29 +0800
Message-ID: <20250711035730.17507-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711035730.17507-1-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_205909_939516_720228EC 
X-CRM114-Status: GOOD (  12.65  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

All devices based on the A523/A527/H728/T527 processors contain a G57 MC1 GPU.

Enable the DT nodes for this GPU and specify a regulator that supplies power
to the SoC's VDD_GPU pins. The other parameters are set in the SoC dtsi,
so are board independent.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts    | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts   | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index 8bc0f2c72..553ad774e 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -66,6 +66,11 @@ &gmac0 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index 59db10354..a96927fbd 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -54,6 +54,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 142177c1f..b9eeb6753 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -76,6 +76,11 @@ &gmac0 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 5f97505ec..d07bb9193 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -95,6 +95,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
-- 
2.50.0


