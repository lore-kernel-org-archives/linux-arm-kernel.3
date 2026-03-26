Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395C6109E529
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ap1YbZX/yQWRBqsIyNu0uhaKay3h24DGIo1KCXMJJdI=; b=hY2lYm8/1pUiU9AvV74vagDIFX
	nw9p7oPIh+n1FWTxkklgU4Tblupwwj7d+nHQzy2W6ufte0JAfNhBakUxXU2T2Fi/5Dwz7aiS6qmZZ
	BqhXO7F9ce2VN9vZm2NW8v/Jx3C/hxBbZ951GrnBTwqZu11krY4CisKim6m7GqeiWEzKa9MP1z6Tc
	pAUDnSjeIDquZsX/7x0/H+u2l4N6Qv2HxST7uMA6ls0YY5LmFpah85aYMi3BaCw+YRHRGqiuXgIoS
	QLOJxjarpqr1tIkNlTFlxCpQtO8NIolSqzTdob51wRN1sG2qxjI6PZAUqaZ2u8WFblJOrMLusD2R+
	wQCZN/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cks-00000004hKF-0Hzd;
	Thu, 26 Mar 2026 04:55:38 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cko-00000004hJQ-0W4Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:55:36 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fhBKt1sLKz9tK8;
	Thu, 26 Mar 2026 05:55:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774500930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ap1YbZX/yQWRBqsIyNu0uhaKay3h24DGIo1KCXMJJdI=;
	b=rpUdAddiB2SKM0+nCCfC0zqDcCY00A6vp06BgSvyzMpIrcWVe46UENK3fisagb1ekYyEmO
	3O4oswoKfqm3tnRx/GIgL/tw01mzuT1Bf9piHjvlFtVcEjtpsdOdjXQG7QTIB6Gu9rIiQb
	P4Pwc3TwOoaY9neF65N/CbOyba6reH9hoOp9oRBShH35hSKeWwAboi963CXeWzgFOirfyE
	IfI82ieOcgc8D0GycWqRyQganzEweMVa1YyIMejyPXFNR9qvbspieuGyKEBZ5mr8LlpiJZ
	6gU6VvCbG9sBMmawrnvEq6VxEohNTXm/W9sb/es7kREMjfEET3Vuvepw+qn+Rg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=wmev7xDR;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774500928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ap1YbZX/yQWRBqsIyNu0uhaKay3h24DGIo1KCXMJJdI=;
	b=wmev7xDR8qN4VqrCDOlqwgqP/AC/fXR36IzzV+o3VfAGsIVyeuK5z34EsoDyoN01vSRw2t
	5SG31D8KZvRuEkOAynIfsQaWPdCHI5Aug6+PZ3fctOvGYfCXhfNgp1cFz5EjQ4gOWQjyt2
	k9GDWa1b61lv1stODCgWtxq9kvr2QGKlmrKRFiUZ01DQEt0GlZZrNrGWuPT2yZbuH06Pbr
	yxlM26T21AqHI+k01rPpNhPbmN80+W4c2oc999tZSBJW+Esh5ux3MZzTufuo0y5kWrJ7N+
	EHwzYZwkZftfhYhxTXBcjbC+GdbJhY2dpEWxJQfYXhbtspmiz1ULIyVN3BCx3w==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: Drop KSZ8041 PHY C22 compatible string
Date: Thu, 26 Mar 2026 05:54:59 +0100
Message-ID: <20260326045523.223620-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c62c4ab2119fbda3824
X-MBO-RS-META: sx6tszgz3bzkhb8nkh5iswj1iwne7en5
X-Rspamd-Queue-Id: 4fhBKt1sLKz9tK8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_215534_346346_194BAB2E 
X-CRM114-Status: GOOD (  10.56  )
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

Microchip KSZ8041 PHY schema indicates that compatible string
"ethernet-phy-id0022.1537" must not be followed by any other
compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
to match the schema.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts | 3 +--
 arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts | 3 +--
 arch/arm/boot/dts/renesas/r8a7790-lager.dts    | 3 +--
 arch/arm/boot/dts/renesas/r8a7790-stout.dts    | 3 +--
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts  | 3 +--
 arch/arm/boot/dts/renesas/r8a7791-porter.dts   | 3 +--
 arch/arm/boot/dts/renesas/r8a7793-gose.dts     | 3 +--
 arch/arm/boot/dts/renesas/r8a7794-alt.dts      | 3 +--
 arch/arm/boot/dts/renesas/r8a7794-silk.dts     | 3 +--
 9 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts b/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
index 9b16fe7ce713c..60217797e5345 100644
--- a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
+++ b/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
@@ -70,8 +70,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts b/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
index 571615a506207..42e82f0697553 100644
--- a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
+++ b/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
@@ -65,8 +65,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc 8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 4f002aa7fbafc..8e76655016755 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -685,8 +685,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
index b1e20579e0710..8ba9d85f10389 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
@@ -208,8 +208,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 1 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index 61ea438eb6af1..48db62e0ff874 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -676,8 +676,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
index 81b3c5d74e9b3..811e263452acd 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
@@ -326,8 +326,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
index 5c6928c941aca..69d9c674bb032 100644
--- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
@@ -616,8 +616,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
index 3f06a7f67d62a..5d6d0d8cc4dd8 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
@@ -378,8 +378,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
index 3428256057680..af474b1d9676d 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
@@ -412,8 +412,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
-- 
2.53.0


