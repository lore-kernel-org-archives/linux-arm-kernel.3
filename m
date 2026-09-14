Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5A5C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udDyoigq11uB8rCsHk7XbWP+tZUO240AMWYiFrGzuJk=; b=oZv49bj+Rch7hjkfJCQWYh78GZ
	gvdW2Qdd7kN7n0UqzMWd+cfzPd+oYpYfA/XDbrNGBWCL7m2uh+mjMz9Q1BZ4J79TQ5D0lUrV6YqWp
	Zibt+gLOutbrlRcRSnOfYJH1Mvwr78LGXCbVLikzqndlmAy0irDSu/Pe7RXBh7EaZQg5Hu0/FIsTh
	wxXw5I14fyv5uKBj2Toehbed2a2xVX4+F4oopwlVkelzTC8xkK5s+DBjheglmcnKltfSE3KdEWrhy
	c5MjECnYf7JYF7B6UfixbdMO/g4Vc1YOL1mvyJBls8Uzuxk+GQUzsBb23Ey6KRDLuvNrIUfWhN9bY
	Wn7YkpUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Fu-00000002nPI-3tke;
	Mon, 14 Sep 2026 08:41:38 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62FI-00000002moB-1777
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:41:07 +0000
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8DBB2140011B;
	Mon, 14 Sep 2026 04:40:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 14 Sep 2026 04:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375259;
	 x=1789461659; bh=udDyoigq11uB8rCsHk7XbWP+tZUO240AMWYiFrGzuJk=; b=
	H/ddflnytL6at09RqxTtsuxIjkeSMpJL4/Ad9YYn/aNKdnlc57vZ6UNLFoSn4VC/
	UTk11G2Gd+Lnu6WyD3cRAx7yDkD2G/zlpNBDHSG42oI77s4Y6ilhNvaC4mrT9w+o
	/w/jYfAZvWaYY1/iRl1Fai39lh8RFxp6jNKF8JPhJmDqAXCy+9oOJV1OnyOGXDuT
	zq6BTj3YACSwZ13gyRFzior3EzuGvlyd7njYSD7IiGTq4sj0fpQmM1RrTPwsXHq/
	ri/t5OmrLvSZKrP6cdSEVvX/bIS7hz/etJv2FtWXQvf/w674rIqo35ttvkV6L9me
	G62wOdvP1UlvGzPzrWBSJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375259; x=
	1789461659; bh=udDyoigq11uB8rCsHk7XbWP+tZUO240AMWYiFrGzuJk=; b=d
	J131Ni2lbOnXF3niV1hp277KEqf1NVOPNMN6s+Gxx/UyylNUYCt9y7q6wI0ViyFe
	eL0mfksw5KTE3fHz1rDy3nS3AUawBBR2HJAwXbl45zbXyZXpGWD7c0Ab+8128j64
	CP27fvnDdnrKJ9ygXIzjOEIFpeYSwrAIbAnV4hiQuOslOYcpS5nWUYPlNKd2eR4z
	jxgVhHUJkf96RBxiglsVHGJaNgAe4zFVMG4N5LhJegVb0m2Rnx699SgutIUMRX2V
	X6oNvLpRbFzjj+OWYWIngUfzY3FeUPSVgVXiGyMKaYxR8QI9gyg9ra7BCuk58SQR
	FXCstuZbexXTK3eTmkdYw==
X-ME-Sender: <xms:G7OnaqSqrbnq39IHapuBzdmwr-Z80o3jTNWIzLqXgqpScPVlV8U2Wg>
    <xme:G7OnavfB6ybNUxlyZsvMk46mAY6pLCi7TG9dnjsGVHaG47BGJ9fTWSvYCPtMJwDMN
    uOG-41obacB6AlR6N_ganyhXr62JPDAOTsqHMzLjc6uHDaUwFBpNlaC>
X-ME-Received: <xmr:G7OnajcG0saXcmVyiwMyxlyQ9ibF-XkuYk37qgV_JUHXpGEWniDMgMIkdKRs_rCq_GWXkRtawXbaeZZQM6KL-9yftLKyB5NskLazUw>
X-ME-Proxy-Cause: dmFkZTGTKY//RUR5EgjNbSpcd3VVyHi7/RyZZoSH75sSjgM30+UMh0SnsYKjQljj3zB5sH
    UfXSIJXXAUSEPTXl3x5Pe7T/YIndxdissUCd+4R1d0nftRIrhDo1ZQaSJwH2QxYEcZjR6q
    e1HSRCovBuObDp7yvtbJu0MeL0TzRLJi/WjnPbfUseVNsYil7chlvegBuYUJmT7prpLoO5
    9KBYbuj3PPvZPnU/frjB0pX1g3DRpbM/YNiNklFelr4yqg27xxhYMIdtJwD7hUpgzK9cSv
    KRK6VlgNVAcaqJfEMRnUBHVIz+eN0YLgQlErlN1OImZXUK+mDrswsAndDkuJm87YyrVFtp
    Zc/noVkza4VfMBwt4kV4HCObZRHkuNIP9N3okWa6ueOQbDNWacx71FAwCXumTVseOvLYp1
    5kBxHAZimNoG9WedkGtus4Yn3z5S7d/L/y9hpuINtLbSopPBQMmGpD35rHhxEXh3WPikEX
    8aolg4wYCwPPCkzHCcKu1c1etc+fBYAKzzwPPvLhLyOo5chayRpoN5Y6oGFXID+jSxNz/K
    bHWMgoockrq4m4MT9iTGaMhA1NwIVFS0bHVOJ9wLi0gi8dTa5ZWWrktWkSLE99/ihSGlzm
    0j+116CSHnhjYJyZS0tj+eFxIhCFmuAg+thN9t6gQMENDU6gmrgwPMOzG20w
X-ME-Proxy: <xmx:G7Onah1TBL21qK54zzqIhOpohZ0fxg7KMffaKN46SC2Qa7YRuvUdiQ>
    <xmx:G7Onaj9EJBm2Ax_IeJZJ0HQT4ie40EwOvBVQoGv_iyayaeXrzYAX4A>
    <xmx:G7Onau7DoKUAbY5rWiIfDhVy4iOsuWx7gKMq3eZpx5gBl9QUx5dNwA>
    <xmx:G7OnajurFLaKeE_yZnVOF4AJTIVpWZaaGuW2zbL2bvxwWit-E36ylg>
    <xmx:G7Onapv9ReQbG-1fl8odEeVAHZNgcSWbIZcyqRwhtCfoPfUiGfgLwZsu>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:40:59 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:42 +0200
Subject: [PATCH v2 12/13] arm64: dts: apple: t603x: Break overly long lines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-12-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4678; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=1baPjQaZ3lRGHLwVs5BL2CEaexGqyGoKEzwUUYbRUh8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm1l+v11p9P5T41/vWXGqwpmiGq4fQtXOHBc+bBV5V
 qJgmb9aRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIkkr2dkeCqXylda/MT00G1H
 tvat8UVzL2TbMc7d2HXhm260SKniA0aGoz5XTv36kmZWx1N+ftvn04c0921t3GrC8thT8moC27N
 +fgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_014100_393896_BADDEA02 
X-CRM114-Status: GOOD (  10.29  )
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

Fixes "[line-length] line exceeds 80 columns (N)" dt-check-style issue
with N > 84.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6030.dtsi           |  9 ++++++---
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi      | 12 ++++++++----
 arch/arm64/boot/dts/apple/t6032-j575d.dts      |  3 ++-
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi |  3 ++-
 4 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index 71b75a59f695..524e532830e2 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -372,7 +372,8 @@ serial0: serial@289200000 {
 		};
 
 		pmgr_gfx: power-management@290e80000 {
-			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			reg = <0x2 0x90e80000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -433,7 +434,8 @@ i2c8_pins: i2c8-pins {
 		};
 
 		pmgr: power-management@350700000 {
-			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			reg = <0x3 0x50700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -474,7 +476,8 @@ pinctrl_nub: pinctrl@3641f0000 {
 		};
 
 		pmgr_mini: power-management@364280000 {
-			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			reg = <0x3 0x64280000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
index bd73d691f0d8..1624651c1d92 100644
--- a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
@@ -8,14 +8,16 @@
 
 &SOC_NODE {
 	DIE_NODE(pmgr): power-management@292280000 {
-		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr",
+			     "syscon", "simple-mfd";
 		reg = <0x2 0x92280000 0 0xc000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 	};
 
 	DIE_NODE(pmgr1): power-management@292800000 {
-		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr",
+			     "syscon", "simple-mfd";
 		reg = <0x2 0x92800000 0 0x4000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -45,7 +47,8 @@ DIE_NODE(pinctrl_nub): pinctrl@2a01f0000 {
 	};
 
 	DIE_NODE(pmgr_mini): power-management@2a0280000 {
-		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr",
+			     "syscon", "simple-mfd";
 		reg = <0x2 0xa0280000 0 0x4000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -99,7 +102,8 @@ DIE_NODE(pinctrl_ap): pinctrl@2b3000000 {
 	};
 
 	DIE_NODE(pmgr_gfx): power-management@408e80000 {
-		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr",
+			     "syscon", "simple-mfd";
 		reg = <0x4 0x8e80000 0 0x4000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/apple/t6032-j575d.dts b/arch/arm64/boot/dts/apple/t6032-j575d.dts
index e83fdb5d8c86..12991546d4bb 100644
--- a/arch/arm64/boot/dts/apple/t6032-j575d.dts
+++ b/arch/arm64/boot/dts/apple/t6032-j575d.dts
@@ -27,7 +27,8 @@ chosen {
 		stdout-path = "serial0";
 
 		framebuffer@0 {
-			compatible = "apple,simple-framebuffer", "simple-framebuffer";
+			compatible = "apple,simple-framebuffer",
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */
 			power-domains = <&ps_dispext0_cpu>;
diff --git a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
index c9af6103487a..bbee373044f9 100644
--- a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
+++ b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
@@ -32,7 +32,8 @@ chosen {
 		stdout-path = "serial0";
 
 		framebuffer0: framebuffer@0 {
-			compatible = "apple,simple-framebuffer", "simple-framebuffer";
+			compatible = "apple,simple-framebuffer",
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */
 			power-domains = <&ps_disp_fe>;

-- 
2.55.0


