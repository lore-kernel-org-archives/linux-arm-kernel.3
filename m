Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68F0107BCCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ioa4rs0AY+1xO/nDt/HduhJ3rE2814iMjAMBaaSwb7g=; b=HgS0s5Xr1PCy0JjbWAkbzDRi92
	nh3g+4/TMwuAVWzjxn2xWHz7pBiW6Ewi2Zj6QM8e17K8UhnDgUPk13kQvWyKpTrH/n5ZC6Zx5JyvB
	6JYK0v2T48y/bAJnQ3mBZvHF3hxRfVlMWFVb/xeGXVozgh9tSJOMywMl1tbeNqNduI9rF2FOGLmAR
	9R0ZwHnwz9q0DomP836UqQjWFCdyfrkT44FTjDd8TO5P32aQiRwHH8nmfzKrrLnJi+o7zjwM+SZGJ
	76k7e8arw3RP/wo+xok6s+nDIV/REdrj2GW1/QeOxk9MGqwsAYuIcy5MHKrMmC2RKBPipeb6JVnac
	7sbdJs3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Z9-00000000fQ9-31sa;
	Fri, 13 Mar 2026 16:40:47 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Z6-00000000fMe-2GW1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:40:45 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fXVbP0vhMz9tKQ;
	Fri, 13 Mar 2026 17:40:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ioa4rs0AY+1xO/nDt/HduhJ3rE2814iMjAMBaaSwb7g=;
	b=RbLGuX7BJnbsX5Icu0ckNHxNJs0XlWZkRKBYM6SNG4dDks2Oeteg4J55QJv9vBi0VNZzqI
	KtlWi6Q3vQbYxIN1S4MBqpdxjt6dS6Z9iZJvggkdozmjlUD+FfCNZN3Wmj/Nwm7acblgVV
	2zwItSIHybFTN8BEygqHXbLdfNIuhtMjTvVfoLb9dhWPFSO8lF0DdbdGYwOfrEvz0Qc6pJ
	e9YjF6o4rat3CS1Eo1oQLV/xe32kwqPF++PFbj/5XOoXKUr0cawnMc3I1l8leTpO1UZq9O
	Ko0bUTEA+7XgIfH9aj8NhTKep+mVQxiz3qsFH4NlHd8/+C81xvky7X4vzRL9HQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ioa4rs0AY+1xO/nDt/HduhJ3rE2814iMjAMBaaSwb7g=;
	b=MvEnR20yinIH41rDIQIvHoU7pITpDfBLh7rBEB3kHX+ntujEh4g9viFv7552PlC2EEhnAP
	4zn0nSuHNYilG14KwobUIJjq3zz7oo6ao+EBxXkZJutzvHtfHze+rvSlb0gJKovT4G0Vs/
	pxgM+3Y5hxAWf1UuG+L7DGjZX6Yj8IPq5dQ/4IR6Zkf8QmnvG6J88f4mU41GnO/0n8PDI8
	1Ridx0EqBBh/70Bs6NTVM+FcWzCb8LWoXlzoztJ5NFV4hEzNIfWKb490bt+Kcs+XXARZYT
	LW8dCL5QuEWl7G/W0Ylpz5rDlykA370662ZxoeqbTV4F7sOYx6epDSWLJH10TQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: renesas: Drop KSZ9131 PHY C22 compatible string
Date: Fri, 13 Mar 2026 17:39:05 +0100
Message-ID: <20260313164008.40933-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8knds6w3qsktbd964geswkbkd65bjtph
X-MBO-RS-ID: f60970eea33126c8695
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_094044_739434_3661AE79 
X-CRM114-Status: GOOD (  11.13  )
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

Microchip KSZ9131 PHY schema indicates that compatible string
"ethernet-phy-id0022.1640" must not be followed by any other
compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
to match the schema.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi    | 3 +--
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 4 ++--
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 4 ++--
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi       | 6 ++----
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi      | 3 +--
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi      | 6 ++----
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi       | 6 ++----
 7 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index af6d15f90c65f..f8442b6a85a75 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -59,8 +59,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <0>;
 		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index c191ecb397135..dd5e4b13f0f86 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -260,7 +260,7 @@ raa215300: pmic@12 {
 
 &mdio0 {
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <0>;
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
@@ -279,7 +279,7 @@ phy0: ethernet-phy@0 {
 
 &mdio1 {
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <0>;
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index dc4577ebf2e95..8ae7b6e3d712e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -281,7 +281,7 @@ raa215300: pmic@12 {
 
 &mdio0 {
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <0>;
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
@@ -300,7 +300,7 @@ phy0: ethernet-phy@0 {
 
 &mdio1 {
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <0>;
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index d511e152d7c6c..7eccdaffb221f 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -99,8 +99,7 @@ &eth0 {
 	status = "okay";
 
 	phy0: ethernet-phy@7 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
 		interrupts-extended = <&irqc RZG2L_IRQ2 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
@@ -126,8 +125,7 @@ &eth1 {
 	status = "okay";
 
 	phy1: ethernet-phy@7 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
 		interrupts-extended = <&irqc RZG2L_IRQ3 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index 3e8909a872e33..15f2e9eaaf0b6 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -79,8 +79,7 @@ &eth0 {
 	status = "okay";
 
 	phy0: ethernet-phy@7 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
 		interrupts-extended = <&irqc RZG2L_IRQ0 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
index cd4275d86935b..0f917d7c99398 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
@@ -75,8 +75,7 @@ &eth0 {
 	status = "okay";
 
 	phy0: ethernet-phy@7 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
 		interrupts-extended = <&irqc RZG2L_IRQ2 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
@@ -103,8 +102,7 @@ &eth1 {
 	status = "okay";
 
 	phy1: ethernet-phy@7 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
 		interrupts-extended = <&irqc RZG2L_IRQ7 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 3b571c0967522..cb5066443722c 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -136,8 +136,7 @@ &i3c {
 
 &mdio0 {
 	phy0: ethernet-phy@7 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
 		interrupts-extended = <&icu 3 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <1400>;
@@ -157,8 +156,7 @@ phy0: ethernet-phy@7 {
 
 &mdio1 {
 	phy1: ethernet-phy@7 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
 		interrupts-extended = <&icu 16 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <1400>;
-- 
2.51.0


