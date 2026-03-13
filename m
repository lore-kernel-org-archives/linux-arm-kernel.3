Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460BF107BCCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z453Tyol3L3VETEDAmcm0JWJt+RA5s/ri+ONurGIO58=; b=MPOmYtlv5idjKB2IxjkC0//G1v
	ugRtEM9s+QoxZ2rfIyNGRmRR9TG0glUHSMyltkfMW2moMEM73ctKRM9hKIqw0afJt7R3xtVk6wwhX
	KmLVxjQrgzgOLbT486aC+JUQSPg+BtrEFGoaaNJg9SiM30cj+JWE/G/gA9BVqI7T/Led35sz0mQi3
	jyfxrTd+ZjOayHjRKE02MZB834n3zDHraf2rqlW+buvSVEdmtOLK1x3J3pAEKmb+qwE6hsWCAoRVt
	WCglE72amqE3msnvLXp/hQeRe5on+AZBBlymIRlqEkqzMqC+0J4y4GxdwaR0AdjPwx04vwGjaNuB2
	uqH/1B+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15ZA-00000000fQX-07AC;
	Fri, 13 Mar 2026 16:40:48 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Z5-00000000fM9-3MPL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:40:46 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fXVbH2qZmz9v0n;
	Fri, 13 Mar 2026 17:40:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z453Tyol3L3VETEDAmcm0JWJt+RA5s/ri+ONurGIO58=;
	b=AgFDCy54oGUGzqZ8449HAYFL0KLu9wBNvp3uNlkcghl88zk3tAepZU6+w5gWnHx1cgBHtC
	g5KfF7HuQn5kBVEP7nXikx47jERKvpYL6JTA+HFub8mPaQPU3ux7izh0eAGVK9hYj9HHVT
	9m+E7go//kFhNi6g2Etb0j4rJfhUn0rEHbIGFMTt4hhuzfpDd/r3PW+3W6hUjpAJxM978P
	N7rwuAtUA1+wgPxBi4/BfN4ffVlZsC5SILhFqQsAcoUE9Bt0MJaNIWDFQsf4daFveMDZAz
	nDNwTizuVTi/6y9kDfuB+TJniBNZA79lIGZrIB+jLCLREQNO6WdvZrloeMhkVQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z453Tyol3L3VETEDAmcm0JWJt+RA5s/ri+ONurGIO58=;
	b=oN6uE6rpVwQSD3CXY9VPs9g1dXRZW+HYLEAAP8F/KrQcHXP3c6i7nqv7z/+IgzWvcDO9Li
	Nr8lTgEgLE6khKU6BCrS5cPEZ9/7nk9FqlU6jD7/8YO6Qzebd2S6rneP1j9hS2qSE0PUDt
	RfiDR80tCT947i9Y5gv4xojp4x9IDeYaGrZLTrmWqZecBgRCKpw+YW655mprn5KtKThr3W
	w9tI1U+FGlr/uBmoV0jgjLwtGyBv2LUHKktpl4d+h74/ufDTWiLYopATz5DLqwTMl4pn+R
	Ig/UyMCjqzxcI4VTp2AqneK8wzyb46B48LRMJbt/jCFz2U/o5aRoYb01udxjyg==
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
Subject: [PATCH 1/4] arm64: dts: renesas: Drop RTL8211E PHY C22 compatible string
Date: Fri, 13 Mar 2026 17:39:03 +0100
Message-ID: <20260313164008.40933-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6yg744pxjru14qnneqync5m7ybf8qkxf
X-MBO-RS-ID: 3d426e35b99a79129b8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_094045_307224_681DAE51 
X-CRM114-Status: GOOD (  11.40  )
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

Realtek RTL8211E PHY schema indicates that compatible string
"ethernet-phy-id001c.c915" must not be followed by any other
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
 arch/arm64/boot/dts/renesas/cat875.dtsi         | 3 +--
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dts/renesas/cat875.dtsi
index 191b051ecfd45..5815e9d2d8a93 100644
--- a/arch/arm64/boot/dts/renesas/cat875.dtsi
+++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
@@ -22,8 +22,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c915",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c915";
 		reg = <0>;
 		interrupts-extended = <&gpio2 21 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
index 4113710d55226..83b6c04274ac9 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -24,8 +24,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c915",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c915";
 		reg = <0>;
 		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
-- 
2.51.0


