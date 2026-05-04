Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9D6CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wBBgH/SwekkvEUj5hUEj4xBQU7ZFg8QEvCj3rWtRhYY=; b=ep892gVAThcK953b2Q+2iQaxC1
	2Oy487isbWo0oz0RyV3m7twLTl33Qp594/enQ127ehyZBr/uW/mxkSYu6i8uZ3krKhM2NZK4x2UFy
	L9fad8MDgVJdxchusE123sbN+AeSrBf7es0gsmSKnDJli+syxsHs+ctkSDnaXEPpbYqFi5a327AYz
	JOtwwlESKR5AkSvamGg1Txs0GFq9fMwCt0MYc/U9PR2rdJ2CE3/ZbLBcNH+orYfEiKrVgqryOUIU3
	xb5AjZf2kUEJTjHppWul9G6MajNy61QqmKuC/lzHJxItwlxO71jf7U9tlgCgrRyRXXlHHMkfPKSQ3
	hcLdTyPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuSJ-0000000DTRS-0yFn;
	Mon, 04 May 2026 14:39:31 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuSG-0000000DTFL-2yU3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:39:30 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g8PPz2KwFz9v0b;
	Mon,  4 May 2026 16:37:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wBBgH/SwekkvEUj5hUEj4xBQU7ZFg8QEvCj3rWtRhYY=;
	b=v1OAtEQ/iIuJbMejFNzyBoxHginAmhPCOi7gulFDDj4GOMs5ylY4snBvuOLhUT2IgvBLzd
	iLelwOZucftPCXtvPEFUu2kYEIelPmprnM6FKSozLzROJ+RjJR5ZvayQKFPYwVonsDV8Q5
	J4zXgPByuLAWwz9zGIz9GXfnEj5kQfYAJMevXvhCrOFY5QOoGbHH0uSqXfK0HJ8ENEjZwa
	RAcxEulictj1kqtqSICD3NFvSm/b1iVN4hR1G+cedt3jnujmNLVcMqszV5Yb/gxjdQK8gb
	Vpb4NKKnTHIR7okjrNgmhTD6OGSJQjrr9x0xS6ZrXiFt4ZD+KeJHt6Pj8lTwMA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="V2KO/UXm";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wBBgH/SwekkvEUj5hUEj4xBQU7ZFg8QEvCj3rWtRhYY=;
	b=V2KO/UXmenPspVl241dUMK//P4ADnYPSie9K4/xxflqBjBKGkU/ixNsP75QKC2faSQdFvR
	QqF0kWmx0H4ldrB95bVZx0s+3SMc/wFSJv3cw5Ex6aHYN+zp35SrNsYkiaQfleK26AlY4+
	opZo5ze60f7EfaJ5drzy+ZRf6GZXaLGdiDTJvH4f3otGnEYIZvHb1+F8RuFLaHu3kG0Pbx
	eVZlLgAyY2LTG9tn4rzfp0LivH8wxc8sE+G4M0Zz4vjXHPi2nYOp0Nt04ZHFf+cQER3Par
	Y2T45IG8AZF1gvWJa7ZtNfGToACSVYWYFfgQr3evEEUb8O5cziRLcLopsyLEiQ==
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
Subject: [PATCH] arm64: dts: renesas: Simplify AA1024XD12 display DTO
Date: Mon,  4 May 2026 16:37:15 +0200
Message-ID: <20260504143751.42753-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qtdtonkhjf5zyfsokwgws7cdwn8ejha3
X-MBO-RS-ID: db7a51eb740a63470bb
X-Rspamd-Queue-Id: 4g8PPz2KwFz9v0b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_073928_898675_7435E530 
X-CRM114-Status: UNSURE (   9.78  )
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

Simplify the AA1024XD12 display DTO, move all the differences into the
panel-aa104xd12.dtsi , rename OF_GRAPH links to generic lvds_panel_out
and lvds_panel_in names, and parametrize the LVDS output in use using
RENESAS_LVDS_OUTPUT macro. No functional change.

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
 .../renesas/draak-ebisu-panel-aa104xd12.dtso  | 33 +---------
 .../boot/dts/renesas/panel-aa104xd12.dtsi     | 64 +++++++++++++------
 .../dts/renesas/salvator-panel-aa104xd12.dtso | 33 +---------
 3 files changed, 47 insertions(+), 83 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
index 90767d74e21b2..2ab7e947a05b9 100644
--- a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
+++ b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
@@ -6,36 +6,5 @@
  * Copyright 2021 Ideas on Board Oy
  */
 
-/dts-v1/;
-/plugin/;
-
-&{/} {
+#define RENESAS_LVDS_OUTPUT	lvds1
 #include "panel-aa104xd12.dtsi"
-};
-
-&{/panel} {
-	backlight = <&backlight>;
-
-	port {
-		panel_in: endpoint {
-			remote-endpoint = <&lvds1_out>;
-		};
-	};
-};
-
-&lvds1 {
-	status = "okay";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@1 {
-			reg = <1>;
-
-			lvds1_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi b/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
index 4b1f0982b9e4a..11113a13a337d 100644
--- a/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
+++ b/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
@@ -5,26 +5,52 @@
  * Copyright (C) 2014 Renesas Electronics Corp.
  */
 
-panel {
-	compatible = "mitsubishi,aa104xd12", "panel-lvds";
-
-	width-mm = <210>;
-	height-mm = <158>;
-	data-mapping = "jeida-18";
-
-	panel-timing {
-		/* 1024x768 @65Hz */
-		clock-frequency = <65000000>;
-		hactive = <1024>;
-		vactive = <768>;
-		hsync-len = <136>;
-		hfront-porch = <20>;
-		hback-porch = <160>;
-		vfront-porch = <3>;
-		vback-porch = <29>;
-		vsync-len = <6>;
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	panel {
+		compatible = "mitsubishi,aa104xd12", "panel-lvds";
+		backlight = <&backlight>;
+
+		width-mm = <210>;
+		height-mm = <158>;
+		data-mapping = "jeida-18";
+
+		panel-timing {
+			/* 1024x768 @65Hz */
+			clock-frequency = <65000000>;
+			hactive = <1024>;
+			vactive = <768>;
+			hsync-len = <136>;
+			hfront-porch = <20>;
+			hback-porch = <160>;
+			vfront-porch = <3>;
+			vback-porch = <29>;
+			vsync-len = <6>;
+		};
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds_panel_out>;
+			};
+		};
 	};
+};
+
+&RENESAS_LVDS_OUTPUT {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
 
-	port {
+			lvds_panel_out: endpoint {
+				remote-endpoint = <&lvds_panel_in>;
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
index 7807c3f80409a..4eb3e06ce52bb 100644
--- a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
+++ b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
@@ -6,36 +6,5 @@
  * Copyright 2021 Ideas on Board Oy
  */
 
-/dts-v1/;
-/plugin/;
-
-&{/} {
+#define RENESAS_LVDS_OUTPUT	lvds0
 #include "panel-aa104xd12.dtsi"
-};
-
-&{/panel} {
-	backlight = <&backlight>;
-
-	port {
-		panel_in: endpoint {
-			remote-endpoint = <&lvds0_out>;
-		};
-	};
-};
-
-&lvds0 {
-	status = "okay";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@1 {
-			reg = <1>;
-
-			lvds0_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-	};
-};
-- 
2.53.0


