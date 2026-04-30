Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FBECD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kel3aEvgR2LwrabvkGqWPn/9dZy2wQYqVSdPgSKOyq4=; b=3bA7VBwC097GkvUjTJNWOQsw7a
	dF0zfwP1y+/Qi8HLyKmKzDx80XKS8vAG7wXgOx0kD+k0JJUfSsx9qddt7QgjDqTu5xXFTyOqp9xV4
	nVzRsbA1I9BuSTbkxo9EGivJGn4Rs5lG+5itJKjLauojxwk/94YY8EgrXjo9K1rm2NnW+/a4tip1l
	nUfAnQq/nLz/44iAwQ8OCSwILahEXam0cYHtV7GdaTQIYQuM7ISnsFW2aHivRBBO/CUTjmt8dA5Id
	6CeZ0ju3L5iDgfUWabF4JHiu7G8q2FoqJpRoCwBfC8rwo7l6IybF9CG5Ai7Bfi6DzUKP1mb8d3l4S
	7Q0pX8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMWm-00000004yJC-2dxo;
	Thu, 30 Apr 2026 08:13:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMWk-00000004yIE-2aGc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 08:13:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 41E864431C;
	Thu, 30 Apr 2026 08:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E567C2BCB4;
	Thu, 30 Apr 2026 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777536822;
	bh=Nv1JYf3LO+jPMQgpo8pnXz9mJrVmyxe8ICeN5WxGts0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JnXNUI2kbvksQ919q/521+avcOx2zyEVqsVBqxwt3RH+ROKd/fUUSJM2rrjYPNmbw
	 Q/9Ce43RKwDKkj0ud0TJw07+77hCYkRBEm9jiXX/78PnIDPPdbCs1kQueuYT7oaFhI
	 oOsMhugqGFr8JP5pOTdkTbj8KkvTJj8XGx8uuIDrNHw4CFk94NWeWI7mb61GdIqetW
	 2EdVMER7zLILK/DlEhSRGyCYQJ9PacbwJ1nXAyiLH4fcKkE0tkRnTN58kIU9pQQzuJ
	 +UaqLXcKnzfZ5UwRymPYa0Se0wSbc/fyCijAcH2h37t6l7buHiEvCCvJHxRPwM/OVn
	 8m2Z3vwErKoUA==
From: Arnd Bergmann <arnd@kernel.org>
To: netdev@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Aaro Koskinen" <aaro.koskinen@iki.fi>,
	"Andreas Kemnade" <andreas@kemnade.info>,
	"Bartosz Golaszewski" <brgl@kernel.org>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	"David S. Miller" <davem@davemloft.net>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	"Eric Dumazet" <edumazet@google.com>,
	"Felipe Balbi" <balbi@kernel.org>,
	"Jakub Kicinski" <kuba@kernel.org>,
	"Johannes Berg" <johannes@sipsolutions.net>,
	"Kevin Hilman" <khilman@baylibre.com>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Linus Walleij" <linusw@kernel.org>,
	"Paolo Abeni" <pabeni@redhat.com>,
	"Rob Herring" <robh+dt@kernel.org>,
	"Roger Quadros" <rogerq@kernel.org>,
	"Tony Lindgren" <tony@atomide.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 3/3 omap] ARM: dts: omap2: add stlc4560 spi-wireless node
Date: Thu, 30 Apr 2026 10:12:42 +0200
Message-Id: <20260430081242.3686993-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260430081242.3686993-1-arnd@kernel.org>
References: <20260430081242.3686993-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_011342_678872_8BE1B36C 
X-CRM114-Status: GOOD (  10.03  )
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

From: Arnd Bergmann <arnd@arndb.de>

Converted from the platform_device creation in board-n8x0.c.

Link: https://lore.kernel.org/all/20230314163201.955689-1-arnd@kernel.org/
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/boot/dts/ti/omap/omap2.dtsi                |  4 ++++
 arch/arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap2.dtsi b/arch/arm/boot/dts/ti/omap/omap2.dtsi
index afabb36a8ac1..fdc1790adf43 100644
--- a/arch/arm/boot/dts/ti/omap/omap2.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap2.dtsi
@@ -129,6 +129,8 @@ i2c2: i2c@48072000 {
 		};
 
 		mcspi1: spi@48098000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
 			compatible = "ti,omap2-mcspi";
 			ti,hwmods = "mcspi1";
 			reg = <0x48098000 0x100>;
@@ -140,6 +142,8 @@ mcspi1: spi@48098000 {
 		};
 
 		mcspi2: spi@4809a000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
 			compatible = "ti,omap2-mcspi";
 			ti,hwmods = "mcspi2";
 			reg = <0x4809a000 0x100>;
diff --git a/arch/arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi b/arch/arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi
index 63b0b4921e4e..fe9dd8bbfc85 100644
--- a/arch/arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi
@@ -109,3 +109,15 @@ partition@5 {
 		};
 	};
 };
+
+&mcspi2 {
+	status = "okay";
+
+	wifi@0 {
+		reg = <0>;
+		compatible = "st,stlc4560";
+		spi-max-frequency = <48000000>;
+		interrupts-extended = <&gpio3 23 IRQ_TYPE_EDGE_RISING>;
+		powerdown-gpios = <&gpio4 1 GPIO_ACTIVE_LOW>; /* gpio 97 */
+	};
+};
-- 
2.39.5


