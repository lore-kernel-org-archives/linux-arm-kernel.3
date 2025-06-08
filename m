Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460CCC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 21:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vuHm92jjAqTiOXgOBm3MlO8YN8ijYqZbHNTQKOA2KFA=; b=W3E9NN92vFBV4Cd5dCtKEFC/HZ
	lNDhvNhK30NvP6BENATKLM23fGYkd87CrN0lcz6NOmDI5GBMt7YoergQJUyQzNkgBZJCKV+GB784s
	POD+ipViBlzMrMIqUW1pxTV0eOSxughpFj+uUZC1hkUiwXynFvVaWWNGCRej2F24AX3LLsN71MFmN
	rIPveC9CB/9iFNR4TZvqEnY0CwCgDQjUHvjiVqUfTl4TmvtiVUb39XusaWwzS8cVtIMf9FuxJhzKU
	fHpCo9+08Z5JzRrK6tmd3e1jEf0+p75r00zCMtN6Pv3RlMUcjCcZmhaeZsDm6y5cIHos//HqTNfyG
	DPrEWbXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONzz-000000032bc-3mdY;
	Sun, 08 Jun 2025 21:56:15 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONwR-000000032Ks-42fg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 21:52:37 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bFpgd1KtGz9stw;
	Sun,  8 Jun 2025 23:52:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749419549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vuHm92jjAqTiOXgOBm3MlO8YN8ijYqZbHNTQKOA2KFA=;
	b=WnjZSBpWdASc9I/HKCzec56Fgj4EfOuvOwOaHxeTadfUiklKfW4YNdCzwjR/McFeHvzaeb
	+/nbpSk8+qFcbh4LUPeuAt53B3X4gw+TXUTK2Tb2eIlttrrngBObs6k2nnitqZX1f6J3MT
	NVVASiPfqjdMSPVHd89wY4eSUpPHgQbvThYvBF3V10aEljquxHS8ZOUNfh5K9bH2QJas5A
	9bVlenOIFbfdZud/lmz2TkW4pNJeOO4hK40WSGhktY95ENbP9qx7PziptzZ7hK5viM5SBb
	adJ1belThfzjBk1gPxv6vi76mVFn1dCBd1bpebT02+bczSf9t3iISUeEPgZVFg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749419547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vuHm92jjAqTiOXgOBm3MlO8YN8ijYqZbHNTQKOA2KFA=;
	b=byqGow6SlDWKWrDm47vundsrmeEbAHpQWrajz9Zwkg4z5UKSvC95cteI6/srtE20IZpdtj
	z5TbZHt+f+TPA6AvkDT6F0qkaQ8LBeKhybZnGFhjpsABBc2JBaaM3+gPGdAluiRYX1WIvc
	qud+96hbMkqXPMSRwUS+d/SeVWfw+PNege9W1TMOgluVotn2BAv9HfS/ShkQzEpIUyOoSl
	U4poEW+ObokNlBNHUO632YbdyDWjGGuP/Dth35XqHJ+lfzxYDvibTyEEEIJwQhfH8IKaAM
	4Qv7iXv6ezqCfU9y8XdAXIutxbDzSFLpFx36PA83gamMNmTtv7ktnyx6Kx5TSg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: Add bootph-all to sysinfo EEPROM on R-Car Gen3
Date: Sun,  8 Jun 2025 23:51:20 +0200
Message-ID: <20250608215212.1619182-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: u1ukiybnrsttf9zk317xy15a748u3jaq
X-MBO-RS-ID: 5080ee407c2994054c4
X-Rspamd-Queue-Id: 4bFpgd1KtGz9stw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_145236_142613_7DB4E2F4 
X-CRM114-Status: UNSURE (   9.09  )
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

Add bootph-all property to sysinfo EEPROM on Renesas R-Car Gen3
Salvator-X(S), ULCB, Condor, Ebisu, Draak boards. The sysinfo
EEPROM is used by U-Boot early on, mark it using the bootph-all
property. No functional change for the Linux kernel, this only
reduces the divergence of DTs between U-Boot and Linux.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/condor-common.dtsi   | 2 ++
 arch/arm64/boot/dts/renesas/draak.dtsi           | 2 ++
 arch/arm64/boot/dts/renesas/ebisu.dtsi           | 2 ++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/boot/dts/renesas/condor-common.dtsi
index a10584150571..9fe9c722187d 100644
--- a/arch/arm64/boot/dts/renesas/condor-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
@@ -174,6 +174,7 @@ phy0: ethernet-phy@0 {
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 	clock-frequency = <400000>;
@@ -230,6 +231,7 @@ eeprom@50 {
 		compatible = "rohm,br24t01", "atmel,24c01";
 		reg = <0x50>;
 		pagesize = <8>;
+		bootph-all;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index 380b857fd273..71d9f277c966 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -308,6 +308,7 @@ &hsusb {
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 
 	ak4613: codec@10 {
@@ -449,6 +450,7 @@ eeprom@50 {
 		compatible = "rohm,br24t01", "atmel,24c01";
 		reg = <0x50>;
 		pagesize = <8>;
+		bootph-all;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 4f38b01ae18d..aa3092205879 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -503,6 +503,7 @@ cs2000: clk-multiplier@4f {
 };
 
 &i2c_dvfs {
+	bootph-all;
 	status = "okay";
 
 	clock-frequency = <400000>;
@@ -526,6 +527,7 @@ eeprom@50 {
 		compatible = "rohm,br24t01", "atmel,24c01";
 		reg = <0x50>;
 		pagesize = <8>;
+		bootph-all;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 68971c870d17..bbb3583372d0 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -592,6 +592,7 @@ csa_dvfs: adc@7f {
 };
 
 &i2c_dvfs {
+	bootph-all;
 	status = "okay";
 
 	clock-frequency = <400000>;
@@ -625,6 +626,7 @@ eeprom@50 {
 		compatible = "rohm,br24t01", "atmel,24c01";
 		reg = <0x50>;
 		pagesize = <8>;
+		bootph-all;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index fcab957b54f7..8a30908992ab 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -244,6 +244,7 @@ versaclock5: clock-generator@6a {
 };
 
 &i2c_dvfs {
+	bootph-all;
 	status = "okay";
 
 	clock-frequency = <400000>;
@@ -277,6 +278,7 @@ eeprom@50 {
 		compatible = "rohm,br24t01", "atmel,24c01";
 		reg = <0x50>;
 		pagesize = <8>;
+		bootph-all;
 	};
 };
 
-- 
2.47.2


