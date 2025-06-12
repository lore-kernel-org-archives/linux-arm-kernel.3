Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E750C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ex8oQa+YqEYdb2fSXibJ5RTDwcm8bJDCkvBEZ+deQxs=; b=FJmrjbltTA2j5OR1MqI7L/Wlnm
	7mELV0LJsZqO3b7fKZpGDckL2ZbJNnn08J94cOS6gNsCGqu1mQ2Um/N6LX1FbUzWppaKl2eovzXr9
	FDcrSa2cc9PQnY4PTDWGG0BWS4MKMeb432cEoxANnEC2NnvmDxpQbZMGExneadG3h+D1vfW96PGRe
	7cKcXZT/gYMxtGys4jCH0oDiSVY3BUtye+v75TQUjldFWCjA17bMIabVL8kpnw2dCk5YzsQHW7/Gi
	7jhIxxEFcg5fasCzMwxjFx+yRgEztW/SdQRXc/W9fdME5ycmrcTluSFzFrZ29y87XFvg29gEyKN6r
	iAeGzqdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowS-0000000EXLB-2mOD;
	Thu, 12 Jun 2025 20:54:32 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPj4x-0000000De4f-0IJ7;
	Thu, 12 Jun 2025 14:38:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749739130; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Hp3G8ROEQbeWJoK7N5HBK3D9jXIWLRscx3PVFjO/g1T2xkWbE/Uewze7ia8LQwVsvvPDN5R/1GuBFqAEXysV9BpNTorzKdotaQ3ESJFfEv3TeQA6M7uSpnxyAXqVdH+kQqWYjQ6tqx5QCvuXp6jooESsuUdQJcGFswtdCCpRDek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749739130; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ex8oQa+YqEYdb2fSXibJ5RTDwcm8bJDCkvBEZ+deQxs=; 
	b=bPokZiHrisMW+dSeWPXXE+AyO6REJap2XqnG/2zQuQfbQ1Vad5SZtJmKwcvwrgSqV4DL/KWm3+zbxtTnp8XmKGNUcZ6RdeYEcIjrXbTunmQPVta6/6R+CeHFfdyUbVpLO7qqWxgb+MJTA6QwaZaWWJa9J2luaaDdXkWjaqivO/Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749739130;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ex8oQa+YqEYdb2fSXibJ5RTDwcm8bJDCkvBEZ+deQxs=;
	b=OVbXLxNEZRbYJtTuOauDGPtwA5HcpqqIH3N3luJmESXP8XHBYHVSVgn3FRkuvOUt
	IKydVIUduYnvPc778E5mAUJtxdmuPKKY6LQB4obVF8V4oWGesROyTsl69LGJEB/tI+V
	9vK8PqEOL3bunsBO4sTAeOCc611nq/s7XRagjya7ziqqEeWiOSGZy7kssDhYb1gYmR9
	/Zkl5TU1ygTdTcY1cPxrCWFh6lrvOQBqcKiHOWULvAd4JE3tbAAeFdwhdDB6g817NI0
	ITNbgimg3cVDGIZuuM6qAjfJyquR94QdW/aRVzhcII7aCAvvhylo+F3k3ml5BnDutzp
	wNpYyHN+3w==
Received: by mx.zohomail.com with SMTPS id 1749739128525523.5659147415079;
	Thu, 12 Jun 2025 07:38:48 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] arm64: dts: mediatek: mt8173: lower SD clock and disable wp on Elm
Date: Thu, 12 Jun 2025 22:38:33 +0800
Message-ID: <20250612143833.2612714-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <20250612143833.2612714-1-uwu@icenowy.me>+zmo_0_
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_073855_177363_2A76649D 
X-CRM114-Status: GOOD (  12.28  )
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

The microSD slot of Elm seems to have a little signal quality issue and
cannot work at 200MHz. In addition, a microSD slot cannot handle
write-protection.

Lower the clock frequency to 100MHz and add "disable-wp" property to
eliminate a note of assuming RW.

My Hana device, which is a Lenovo Flex 11 Chromebook, can handle 200MHz;
so hana DTSI still have its max SD frequency set to 200MHz.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 1 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dts       | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      | 1 -
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index dfc5c2f0ddefd..3147240cfa6ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -68,6 +68,7 @@ trackpad2: trackpad@2c {
 };
 
 &mmc1 {
+	max-frequency = <200000000>;
 	wp-gpios = <&pio 42 GPIO_ACTIVE_HIGH>;
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dts b/arch/arm64/boot/dts/mediatek/mt8173-elm.dts
index 2390d04204e83..3385183b60d36 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dts
@@ -13,3 +13,8 @@ / {
 		     "google,elm-rev5", "google,elm-rev4", "google,elm-rev3",
 		     "google,elm", "mediatek,mt8173";
 };
+
+&mmc1 {
+	max-frequency = <100000000>;
+	disable-wp;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 0d995b342d463..2a253a90bce1b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -402,7 +402,6 @@ &mmc1 {
 	pinctrl-0 = <&mmc1_pins_default>;
 	pinctrl-1 = <&mmc1_pins_uhs>;
 	bus-width = <4>;
-	max-frequency = <200000000>;
 	cap-sd-highspeed;
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
-- 
2.49.0


