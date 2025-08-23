Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACDACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIEZ79kkVYGhuScirCpXFEjqDlYt3vFs+rDCw2sPbA8=; b=cpLyEYPLVDj1qiYZ8E+uy/N0DG
	mpisQ+WLBl3bYPs0lqZ0rUxSyxNWjNInG0YhoxMjygyn3UEI6CuyRtGRqDCRKHhdmtB9y8/49oOBk
	HOvMTvOpl3tfnDUNnJt6++/hYuZLCEGLM847bioUZLxvIlYlTL9/Ua/sbcYCsiYPgReqJus7lGDe0
	UdVCkT7O3o3CNONXJOnmzPVN0SY7YmxGRsot2wu3i3W+lOoCWUzyl4YVkMX1jkVtjTlZW9JbazJ/L
	MMBQ8w/AEjuig++fQmgJcdcud0y8CNrjBT6AyDQMHRVraEbukAlZVcRuh416oP8DK05zGD4SdT3jy
	2DiuutQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplBN-00000004b9e-0QN0;
	Sat, 23 Aug 2025 10:09:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upksu-00000004Zq0-1se5
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 23 Aug 2025 09:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zIEZ79kkVYGhuScirCpXFEjqDlYt3vFs+rDCw2sPbA8=; b=Izh7Zkq5vSrLV8GbXpmtjIjUtA
	sUHtViluW07pOLY3D0qWr4CVog6MmX3wnNFNFtX4AJx/MBfoWuQok4XY+9Vt6tAMTmYeugnioTdVK
	d5Qxi1BpI6pfOtQ2h2hnItgvrWeeM0caZhH9VY3FGzTLJtxfUiLrw2mLX086qc/wviG7/Jldp14Jp
	+G9M1Q4oXmGJcacFFrN01qTYptKBUDYNttQQACovV5rJrMVIaRjjY7eUhWyxKgp1N8AC5RgTBs6fe
	KNox5G9hUjFAdD/cuDEkcngmXl+3N2Pip/UQPhQODU2/GQ+W9/ASO+14F2cATl1Yq39RmfAlwzTWA
	jreDYvBQ==;
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upksq-00000001PTC-3OxF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 09:50:03 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7AA847A0137;
	Sat, 23 Aug 2025 05:49:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 23 Aug 2025 05:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755942594;
	 x=1756028994; bh=zIEZ79kkVYGhuScirCpXFEjqDlYt3vFs+rDCw2sPbA8=; b=
	FKJOS1LU6ejW6havAPlBQHjV7oPCIyCsPS5YRN/plT2ZP+VZgTPio0zJJfc7SRxi
	rHMhqDlFdJ+bvjOK7ThIupvfGldDk68LepnbgV80cLqGtGUpO0Ly+I5Q60Bs7TAg
	GJ3POQab5pYzM865zV55oyfuYcu13nn00NWMb3MbzbkiDW4GPm4b5AzdArMEcs0V
	uqbvge6j+r6Bi6UoeA+y1WkOvqvaYEKm7cI/ye4NREzIKHVo3aOmGezk+wxmsWmA
	7qoYeeH/uEg0jkBKWiPEkGNPCMadnEtTjtxiF33CEWUv0ZtzjztNDcYpNhS+MFjj
	GTOpjYzK3uIWdMJY+e5zLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755942594; x=
	1756028994; bh=zIEZ79kkVYGhuScirCpXFEjqDlYt3vFs+rDCw2sPbA8=; b=W
	rCILy44ua83bb1K+Fa5scbTOOipfPRuPHiSuB1A/r/M7VPWv91OjCUiQXU7ylhWo
	z9MF1GDlNhoOpg9jtnv25dW4t+AxaYEMF6vGlJ45QTBUAPkszLze3Lsz44rgQHqg
	66a3iptqVEf32uq50WKETeKfkAttGWZ32NH7VP3Yc+J76xPqYZVy1Oys7g2csS/u
	fEZZCyC1Uw0eFOGkKn//cPRuEq5lzRxr4RhuKNMVQEULjzOy+8HfklyHBzH5hiwN
	0Se+kmtpL9ROteqKTdtYox13TxXgSg002sZgCCL6HiQlope9Ekrzpir67ryOZmAr
	f3i9OwE413kYkexkcwasA==
X-ME-Sender: <xms:wY6paCiGnFhKaihWrwPgavtxcjoQAHzjVuw9jT5oeBfufxLabzbH2w>
    <xme:wY6paKRchH-i4FQfC3fIE2aMN1YaTJZeZfXs8YAbd05Pyx7J7VFwvNTce0eubtFcc
    Vcgk4kPZQg8uhc8ZQY>
X-ME-Received: <xmr:wY6paE8RRwY7G7_tK51B4uniD-ubGvuxKMuRNILqC6-JARs6XqPK1u4Wddi-MlDKLFosVQZ12I924ugWXk4dagWA33seaji3Z4o24Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieeifedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepkhgvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtoheprhhosghh
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprh
    gtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsth
X-ME-Proxy: <xmx:wY6paLPgDRxbmc7J0sLqvwPVxPl8wQ6IWhF1Hx0yLkzQEyypeWk5gg>
    <xmx:wY6paFi962bndx-V5TyXU-GlMIcdLp438IL1j0grl3g1GRBucO3HsA>
    <xmx:wY6paOlBGF5r-StLV23s6yoZ-tSIzHKl4G3G4gQjiI8BTqUq37TUyA>
    <xmx:wY6paCPmN-1yGMpgxYaJE3YBUQuY2IsctTU6rf64lCGSzOtgO72lFQ>
    <xmx:wo6paPO02tWOeXWFVJHHxF3zxjrUMmoM9SmfqnAPpqfcKUaNrZrQw9ua>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Aug 2025 05:49:53 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Sat, 23 Aug 2025 11:49:45 +0200
Subject: [PATCH v2 2/5] arm64: dts: apple: t600x: Add missing WiFi
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-apple-dt-sync-6-17-v2-2-6dc0daeb4786@jannau.net>
References: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
In-Reply-To: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5020; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=4sTHPm369837yATd/OM+wN0/EZ/iAnwGoBiqIT2OsUw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhoyVfTuXPbRauG1B5ttlz5pbrJqzii+43vA8u2HWKsUEK
 9Z5/4vXdZSyMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZiIthwjw9H5CWvex4SGcn/w
 snjgqWu88ojhTFPNQoUH5rsqz9Rx2jL8D+3fOItph6LzEi232zoFrus0jGZlreCcWejl67nQukG
 OEwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_105001_667468_D9E771F5 
X-CRM114-Status: UNSURE (   8.45  )
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

From: Hector Martin <marcan@marcan.st>

Add compatible and antenna-sku properties to the shared node and
brcm,board-type property to individuall board device trees.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Sven Peter <sven@kernel.org>
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


