Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F03606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 17:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jpTsuEpf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u1NMUq+jqXQwc0QHEPQZUDhJH1xGVhYW8LwKRkp9xfA=; b=jpTsuEpf1xFvMy
	EOvAGYxXegPFRrJUasTcBQ9G90dCxLdAw84RBDp8BCP9ySsWgciaotjkXuqwhJd/Prttwb5CaY8zd
	z+8hkD7TZ+ZT4sf3H+zIeYLlr7PvlFbBWWrmNzOJZZEoVUtRrCCT6r6Bdnm9dBq6eszRPdz7az9My
	If7otXBy2f+YltVnA58qh010P8288awK0HJbKVl+y+FwwWsLzD5bdPKxwCjLDScB1IamCWE5HbjkT
	er61WXh1Kn+5DaalmZFPuYPgFddUA6ETXl5TcA2pjrW4NZjqfAMP9pNKQS0lXe82VdAJaRVyFaiJR
	0iiVV+eZaye0PwlYQ2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJUE-0000000Gle2-2NoC;
	Fri, 23 Oct 2026 17:55:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJUD-0000000Gldk-3CsY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 17:55:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 37FFB601FA;
	Fri, 23 Oct 2026 17:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC541F031E1;
	Fri, 23 Oct 2026 17:55:01 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/DNI 7/7] arm64: dts: renesas: r8a78000: Add gpio-ranges
Date: Fri, 23 Oct 2026 19:50:45 +0200
Message-ID: <cae27d2d9dd17c081dcea27e3b223a8fb8653796.1792776697.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792776697.git.geert+renesas@glider.be>
References: <cover.1792776697.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Link all GPIO controllers to the Pin Function Controller using
"gpio-ranges" properties.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on out-of-tree pin control support.
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 36a4fa1e032ee703..946dce6ab38b619d 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -1273,6 +1273,7 @@ gpio0: gpio@c1080110 {
 			resets = <&mdlc_aon 0x20>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 0 28>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
@@ -1287,6 +1288,7 @@ gpio1: gpio@c1080910 {
 			resets = <&mdlc_aon 0x20>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 32 22>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
@@ -1301,6 +1303,7 @@ gpio2: gpio@c1081110 {
 			resets = <&mdlc_aon 0x20>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 64 29>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
@@ -1315,6 +1318,7 @@ gpio3: gpio@c0800110 {
 			resets = <&mdlc_pere 0x30>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 96 17>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
@@ -1329,6 +1333,7 @@ gpio4: gpio@c0800910 {
 			resets = <&mdlc_pere 0x30>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 128 16>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
@@ -1343,6 +1348,7 @@ gpio5: gpio@c0400110 {
 			resets = <&mdlc_perw 0x30>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 160 23>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
@@ -1357,6 +1363,7 @@ gpio6: gpio@c0400910 {
 			resets = <&mdlc_perw 0x30>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 192 31>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
@@ -1371,6 +1378,7 @@ gpio7: gpio@c0401110 {
 			resets = <&mdlc_perw 0x30>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 224 31>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
@@ -1385,6 +1393,7 @@ gpio8: gpio@c0401910 {
 			resets = <&mdlc_perw 0x30>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 256 32>;
 			gpio-reserved-ranges = <16 10>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
@@ -1400,6 +1409,7 @@ gpio9: gpio@c9b00110 {
 			resets = <&mdlc_hscn 0x50>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 288 17>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
@@ -1414,6 +1424,7 @@ gpio10: gpio@c9b00910 {
 			resets = <&mdlc_hscn 0x50>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 320 14>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
-- 
2.43.0


