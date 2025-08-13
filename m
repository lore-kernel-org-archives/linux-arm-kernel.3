Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266EECA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1Hkpw2YIHCAio2hpBWBtk0yrHysL0yyMIrc1srRsS0=; b=Pam9utaFH/Q41JTQil8v6q6K1L
	6Ql/fDuGFEwqN0AhLg7lxHzXl3/Kiojta/lunfYo2VKMhNjn1Y2kSodpUI/rtzVxxLppTnjvTwex/
	bhgdkOrHBc5reDVLGHXfZETCZiANTYtR0q6ihMjhZdw9904BJMibwIGxSlhoZJY5cvr6gn3Yg9Ln6
	1sAwQ0vtSTrMPbmh5BcjWKLCdU0+dWOIEbzpd+gEdOmVSZYxslrAm9VNjha4yuG+nvV0NE6wPg99D
	piiyMTmBrAGpJxq1FBRIvl6m/c+uNcq9koQb4h6+6vroDWuNr8mBOvUvB8l/iDHKl3sFWMa6i8GbE
	SkpdcTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8MJ-0000000DJus-0nb3;
	Wed, 13 Aug 2025 10:05:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8BA-0000000DHou-2rKi
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 09:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=u1Hkpw2YIHCAio2hpBWBtk0yrHysL0yyMIrc1srRsS0=; b=ZSgl+kt4GliUnWeADVn1SrqEwc
	cDtrjsYgxECaQTTz/RhPFBw3eJlTaddZHc+RZSTf1iOxfFafNxsO3cmMUTEICkJq6v6eDPP3094i0
	7waKCvd2qBNsjrRkNGyoLIhG0Y1kvZJ5inVgucZcz5LHGhx0kxbYKFr++HLZ8Faa61eGddV8H8PiV
	/rrv5xKEVr+joXBqXKuIK+blEbWXsI466TYbtgNG85Uhvo2q6jcLhbN768rW9YXAcYMW9Y542DNfQ
	W1Wr6ilhHOKZt35HzjvG2c4BGiuR3P6ipb/UYVcRol79PQ83XxV5ZpVZm8mGvzFesKPBlKAsfKMWm
	03XP5ZdA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8B7-0000000G3JP-2G8w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 09:53:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6CB0A57C21;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40B2CC4CEF6;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078830;
	bh=h7b0Eg4uN7JXP4JlRT6JygCnqQqOrX+rBXUSG6mR1rk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bF+aICab99br/2eSZXb5dI/VAW3Y3cguV73+PpjXSzF3qSYLc7c7GSjoJvzdvXakg
	 7ktPI7kxNUOUE9+gHhzczgdo9d0t5k6UO+5iZzhbngCb82+3e7DEy3HzjTPdjcPjCB
	 vGgCDzgC/duWDaz9HeXo3qIuPWYH1l3hnTpdcm23rwXBEt7Kfshd1D9JhklaSieKAJ
	 i7i8ZGw5J91DpkVxMFD0V0ZeRieATfFPUQ1EglBWqzEHBt0YxxAQD2km7h309n3nBB
	 KnXBq/de3UoCJJhkQSRSOgY3KckNsNmGNhUpf/u9D06JvbMK1PHcShI+K5sOcUFcBf
	 JQG/eZOkHgeOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CBDCA0EE0;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 13 Aug 2025 11:53:34 +0200
Subject: [PATCH 2/5] arm64: dts: apple: t600x: Comple WiFi properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-apple-dt-sync-6-17-v1-2-209f15d10aa0@jannau.net>
References: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
In-Reply-To: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4966; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=SrTiUajMl8doOD8Fc18xDAuFz8wdUpSfSiCRbDLpSoM=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhow5CWsuf9/3qkP3e+79V9JrgqMNY81+B+Q8P52Y/i3ow
 5fP5mt2d5SyMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZiIbRDD/xQdn6CGMzPl5fmu
 V8dZysW+39Ty4NIM553Gl4Lu/LKx/8Lwv2DqjwRLHf8yfcNpfFcNtPOlfWclCTi8+ZzgI3PuyFo
 bXgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_105353_990246_7C387D58 
X-CRM114-Status: GOOD (  10.37  )
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

Add compatible and antenna-sku properties to the shared node and
brcm,board-type property to individuall board device trees.
module and antenna properties

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6000-j314s.dts      | 4 ++++
 arch/arm64/boot/dts/apple/t6000-j316s.dts      | 4 ++++
 arch/arm64/boot/dts/apple/t6001-j314c.dts      | 4 ++++
 arch/arm64/boot/dts/apple/t6001-j316c.dts      | 4 ++++
 arch/arm64/boot/dts/apple/t6001-j375c.dts      | 4 ++++
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 4 ++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 2 ++
 8 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6000-j314s.dts b/arch/arm64/boot/dts/apple/t6000-j314s.dts
index c9e192848fe3f9f91c3c305e169b949a45e7f7e3..ac35870ca129ce353b04296800b197bf684d0bd7 100644
--- a/arch/arm64/boot/dts/apple/t6000-j314s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j314s.dts
@@ -16,3 +16,7 @@ / {
 	compatible = "apple,j314s", "apple,t6000", "apple,arm-platform";
 	model = "Apple MacBook Pro (14-inch, M1 Pro, 2021)";
 };
+
+&wifi0 {
+	brcm,board-type = "apple,maldives";
+};
diff --git a/arch/arm64/boot/dts/apple/t6000-j316s.dts b/arch/arm64/boot/dts/apple/t6000-j316s.dts
index ff1803ce23001c7817a336456bed626adc3931e3..77d6d8c14d741e9b6a0dc44f764ea54f966e0d59 100644
--- a/arch/arm64/boot/dts/apple/t6000-j316s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j316s.dts
@@ -16,3 +16,7 @@ / {
 	compatible = "apple,j316s", "apple,t6000", "apple,arm-platform";
 	model = "Apple MacBook Pro (16-inch, M1 Pro, 2021)";
 };
+
+&wifi0 {
+	brcm,board-type = "apple,madagascar";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j314c.dts b/arch/arm64/boot/dts/apple/t6001-j314c.dts
index 1761d15b98c12f9f6a19798e10d0544805538397..0a5655792a8f1cb6d0029bf9f967aa74cf6c01f7 100644
--- a/arch/arm64/boot/dts/apple/t6001-j314c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j314c.dts
@@ -16,3 +16,7 @@ / {
 	compatible = "apple,j314c", "apple,t6001", "apple,arm-platform";
 	model = "Apple MacBook Pro (14-inch, M1 Max, 2021)";
 };
+
+&wifi0 {
+	brcm,board-type = "apple,maldives";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j316c.dts b/arch/arm64/boot/dts/apple/t6001-j316c.dts
index 750e9beeffc0aa87f1dcac1b57dddf78184ddd47..9c215531ea543e9afe8c131f7c8dc68cfaae666c 100644
--- a/arch/arm64/boot/dts/apple/t6001-j316c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j316c.dts
@@ -16,3 +16,7 @@ / {
 	compatible = "apple,j316c", "apple,t6001", "apple,arm-platform";
 	model = "Apple MacBook Pro (16-inch, M1 Max, 2021)";
 };
+
+&wifi0 {
+	brcm,board-type = "apple,madagascar";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 62ea437b58b25ca649e20b1072b4d835bbc17d3a..88ca2037556cec4307d27bba0244d7ba7f45b184 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -16,3 +16,7 @@ / {
 	compatible = "apple,j375c", "apple,t6001", "apple,arm-platform";
 	model = "Apple Mac Studio (M1 Max, 2022)";
 };
+
+&wifi0 {
+	brcm,board-type = "apple,okinawa";
+};
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index 3365429bdc8be90b63c8051822243d897854ab27..f56d13b37eaff1c3c14815575a71024661669296 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -38,6 +38,10 @@ hpm5: usb-pd@3a {
 	};
 };
 
+&wifi0 {
+	brcm,board-type = "apple,okinawa";
+};
+
 /* delete unused always-on power-domains on die 1 */
 
 /delete-node/ &ps_atc2_usb_aon_die1;
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index 22ebc78e120bf8f0f71fd532e9dce4dcd117bbc6..b699672a5543c1c172f9a788d36287c0b09051e1 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -99,9 +99,11 @@ &port00 {
 	/* WLAN */
 	bus-range = <1 1>;
 	wifi0: wifi@0,0 {
+		compatible = "pci14e4,4433";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 		/* To be filled by the loader */
 		local-mac-address = [00 10 18 00 00 10];
+		apple,antenna-sku = "XX";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index d5b985ad567936111ee5cccc9ca9fc23d01d9edf..95560bf3798bfebe133afafba674005a3e62ddcc 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -84,9 +84,11 @@ &port00 {
 	/* WLAN */
 	bus-range = <1 1>;
 	wifi0: wifi@0,0 {
+		compatible = "pci14e4,4433";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 		/* To be filled by the loader */
 		local-mac-address = [00 10 18 00 00 10];
+		apple,antenna-sku = "XX";
 	};
 };
 

-- 
2.50.1



