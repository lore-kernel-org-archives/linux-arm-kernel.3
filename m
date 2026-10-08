Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D3DCA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjxzPwSt88wvALu9O1lDer263mckyRxOxNaaGlHvefY=; b=HynxcBew9FAHz9LpByvFG2n+YQ
	6GbmiVnv7jdReCes7LtaZDp9pBNZGaPC63LfVbLgW91/bFPL+6jY8vRTecyHHwvLPTOT4Wr0+3bl+
	2Mk5GQC3Po+bmaC7AeiktsiXEPvy3NjYDVq3QTFeE10/9PPglw8rqs3vUYkmpIP/yrfGmgZ3ZJiAV
	LwtSu1Swfg6pV2IzmFX1NLJ3ycr2FBp5JtFgqvANzJ0/ci5f/OWnLZWSaL/kDwHwjV4xDwfB5v1xJ
	8km6AGBlb/3RUhZAiRymUt8EqGUNpfbQ/wdGyEGnOor55yNmK0bNLe+whWXttw0t/DzG++4GrVGWx
	aduLsmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtz7-00000004wvR-10qZ;
	Thu, 08 Oct 2026 19:40:57 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyy-00000004wnv-3d4H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:40:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so55388395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488447; x=1792093247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjxzPwSt88wvALu9O1lDer263mckyRxOxNaaGlHvefY=;
        b=dQsNwsFAMfKswRXtmXZL/KdcciHcrfr/2JHJizFoW9D6epS8zsmWdyoEJwuCwWtnXV
         dW0QiRxdgp97hyv73TQ2J0ydKRZvy3WP7LPJTqOe2hkgKxV7rygLD6lb3zcQoZzwnf3S
         9RTeoq6ZJCyCLliKbH52HWq47ygSVF9zBGOcHxsWUUNhIldT5QAZTcVHdH08889mF+6Z
         uFXOxJKMLqtVRXfcE5JfTxj9bNK5SNE2a9IuEzZ2t1pnMRC4WWG9Wc+t1GlZ4XOi7gyj
         Qq8UJC+Hcws6HKQ93c2PxRjHh9gzEAfgM1BMGNEDHZ6yps+bY7oOED6c2FcifiZTQgXG
         3Huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488447; x=1792093247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WjxzPwSt88wvALu9O1lDer263mckyRxOxNaaGlHvefY=;
        b=kC0tEtn7MmiIClOabS6JPhoS31uOI1ZUPUuuvVYr7O2Ssfr7DDAixzITVPHgsj11T7
         zhsyrmkQZ/rtQjRZxUZ8fqGsxAUo68D4WJwX23qOW+7DS2i72BvJHCLxg1jvrRv97zcN
         L0j7k42YMgZ4W2vW1CxU+s0l6Kw5UVUiokAkYNAWGgCsdvmZMNLeD8JZJ6YXSJnnAfmF
         I9prSSIfze8Fi7qdZFYhl88TtTZGGuHU6dJ6VM4LAXI3cs4ekcSYikXgsl0iGbg9rDG6
         kRDHBwgTW++FDd/SCSnwGLoRxvnU7d+zl5xneBoudGrR0WAQWssfSoyEVcW92Q3kAOxB
         rkBg==
X-Forwarded-Encrypted: i=1; AKwUvBy6HoCrmL1nAKwYOwHyXuCfiVHJatnTWsQAnXioE8WEoGwcdPwtx0KAIcVV9j48vTPyH/My+Puxmy9jO1a6ViBR@lists.infradead.org
X-Gm-Message-State: AFuF++lAm9BUcl75cZBXN2CxH4VKUpxh3UxwdsR9iYuBEOvVerDEZsmR
	wdeot4vlmK0tsbcYONuETQdLxcRx3cpqWTTqwtXoKbmhF0EZsclEDyN9
X-Gm-Gg: AYBFou210VBI8JrcZRQhI2J1ssfBGwZqd3y3DQ/va5sYmqCHXWfG6CYtaQilGv7izuo
	Mzl9oqRcG9geNYGaxU1WoC/BTFP6TRfGuprbGVVD4fStHpv5hc+upoMzhLSyMlXDQAg0x6ZWaY/
	5RBh5Bm5/cGpGTGgR96oH1m+kkb4k4oZ0TxuBhoz/pv9A2t5C/Fy/LfiLtW9xtTPmBa7O+VTSyk
	E1jk3sly8Fvc6oPvYSXvMeMxeGOeJs78jRpY7Vs/yLHyvwL71UjbIVI3mHnb1JCwBB4WQC16T14
	9DNrKaQeg684AuVK6a756EMiUVlkdkzYOA8Jjca1NKzoXEJiv7CWRSkCIRSWn2EVh02xxNRzvpF
	jMjbXk6KJ43ttS77a6trF5SX2fqYFucExafWyWqbNhSLGoINXwisJRcUUbwWXj3s1KZTkXt76aI
	IfavPzCe+ODBQUbuYr8Hpmo9sedpeHnTemAVQ0d8QyHxL87IJSIWpfQSeVqjfKY4UnvqEojCV2y
	ku5apQXrov8TqPqVh6Artq9jKet4WAGIta1ciKsbwDNIGpFuG1A68oUdR2t+ZZg5Ppm38E4boAs
	UWzWXFx62qwY83+MvPRj4ABkOcC4UsVEHQ==
X-Received: by 2002:a05:600c:6986:b0:4a0:2533:c8b7 with SMTP id 5b1f17b1804b1-4a18068313emr96719505e9.35.1791488446640;
        Thu, 08 Oct 2026 12:40:46 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:43 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 11/13] ARM: dts: imx6ul: Add Variscite i.MX6UL board variants
Date: Thu,  8 Oct 2026 21:37:51 +0200
Message-ID: <4ee0a8a644c0f2203be212673c0799a060ce5976.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_124051_441878_EE2185E2 
X-CRM114-Status: GOOD (  17.24  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add VAR-SOM-6UL configurations on the already supported Concerto
carrier, plus VAR-SOM-6UL boards on Symphony and DART-6UL boards on
VAR-6ULCustomBoard. Keep the existing Concerto DTBs available.

Select the storage and wireless alternatives and the assembled codec
through reusable option files. Reuse the original modular Ethernet,
SD, Broadcom and LVDS descriptions where applicable, with a DART
wrapper for its different backlight connection.

Add each Makefile target with its DTS so the board can be built as
soon as it is introduced.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Use the existing modular SD, Ethernet, Broadcom and LVDS files and
   the updated carrier wrappers. Select the DART PWM1 panel wrapper.
 - Clarify that the new configurations extend existing VAR-SOM-6UL
   support and add DART-6UL support. No DTB target or compatible changes.

v3->v4:
 - Add sorted DTB Makefile targets alongside the board DTS files.
 - Drop the redundant -board suffix from new Concerto and Symphony
   compatibles, keeping the SoM options before the carrier name.

v2->v3:
 - Use the shared storage and wireless option DTSI files.

v1->v2:
 - Update audio includes for the shared WM8904 and WM8731 files.

 arch/arm/boot/dts/nxp/imx/Makefile            | 30 +++++++++++++++++++
 ...l-var-dart-emmc-sd-card-6ulcustomboard.dts | 21 +++++++++++++
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts | 21 +++++++++++++
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts | 21 +++++++++++++
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts | 21 +++++++++++++
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts | 21 +++++++++++++
 ...l-var-dart-nand-sd-card-6ulcustomboard.dts | 21 +++++++++++++
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts | 21 +++++++++++++
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts | 21 +++++++++++++
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts | 21 +++++++++++++
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts | 21 +++++++++++++
 ...ul-var-som-emmc-sd-card-concerto-board.dts | 22 ++++++++++++++
 ...ul-var-som-emmc-sd-card-symphony-board.dts | 20 +++++++++++++
 ...som-emmc-sd-card-wm8731-concerto-board.dts | 22 ++++++++++++++
 ...som-emmc-sd-card-wm8731-symphony-board.dts | 20 +++++++++++++
 ...-var-som-emmc-wifi-brcm-concerto-board.dts | 22 ++++++++++++++
 ...-var-som-emmc-wifi-brcm-symphony-board.dts | 20 +++++++++++++
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts | 22 ++++++++++++++
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts | 20 +++++++++++++
 ...var-som-emmc-wifi-iw61x-concerto-board.dts | 22 ++++++++++++++
 ...var-som-emmc-wifi-iw61x-symphony-board.dts | 20 +++++++++++++
 ...ul-var-som-nand-sd-card-concerto-board.dts | 22 ++++++++++++++
 ...ul-var-som-nand-sd-card-symphony-board.dts | 20 +++++++++++++
 ...som-nand-sd-card-wm8731-concerto-board.dts | 22 ++++++++++++++
 ...som-nand-sd-card-wm8731-symphony-board.dts | 20 +++++++++++++
 ...-var-som-nand-wifi-brcm-concerto-board.dts | 22 ++++++++++++++
 ...-var-som-nand-wifi-brcm-symphony-board.dts | 20 +++++++++++++
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts | 22 ++++++++++++++
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts | 20 +++++++++++++
 ...var-som-nand-wifi-iw61x-concerto-board.dts | 22 ++++++++++++++
 ...var-som-nand-wifi-iw61x-symphony-board.dts | 20 +++++++++++++
 31 files changed, 660 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-iw61x-symphony-board.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index b5fad2ba764c..bbd3656a3a1c 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -377,8 +377,38 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-tx6ul-0010.dtb \
 	imx6ul-tx6ul-0011.dtb \
 	imx6ul-tx6ul-mainboard.dtb \
+	imx6ul-var-dart-emmc-sd-card-6ulcustomboard.dtb \
+	imx6ul-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ul-var-dart-emmc-wifi-brcm-6ulcustomboard.dtb \
+	imx6ul-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ul-var-dart-emmc-wifi-iw61x-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-sd-card-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-wifi-brcm-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-wifi-iw61x-6ulcustomboard.dtb \
 	imx6ul-var-som-concerto.dtb \
 	imx6ul-var-som-concerto-full.dtb \
+	imx6ul-var-som-emmc-sd-card-concerto-board.dtb \
+	imx6ul-var-som-emmc-sd-card-symphony-board.dtb \
+	imx6ul-var-som-emmc-sd-card-wm8731-concerto-board.dtb \
+	imx6ul-var-som-emmc-sd-card-wm8731-symphony-board.dtb \
+	imx6ul-var-som-emmc-wifi-brcm-concerto-board.dtb \
+	imx6ul-var-som-emmc-wifi-brcm-symphony-board.dtb \
+	imx6ul-var-som-emmc-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ul-var-som-emmc-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ul-var-som-emmc-wifi-iw61x-concerto-board.dtb \
+	imx6ul-var-som-emmc-wifi-iw61x-symphony-board.dtb \
+	imx6ul-var-som-nand-sd-card-concerto-board.dtb \
+	imx6ul-var-som-nand-sd-card-symphony-board.dtb \
+	imx6ul-var-som-nand-sd-card-wm8731-concerto-board.dtb \
+	imx6ul-var-som-nand-sd-card-wm8731-symphony-board.dtb \
+	imx6ul-var-som-nand-wifi-brcm-concerto-board.dtb \
+	imx6ul-var-som-nand-wifi-brcm-symphony-board.dtb \
+	imx6ul-var-som-nand-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ul-var-som-nand-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ul-var-som-nand-wifi-iw61x-concerto-board.dtb \
+	imx6ul-var-som-nand-wifi-iw61x-symphony-board.dtb \
 	imx6ull-14x14-evk.dtb \
 	imx6ull-colibri-aster.dtb \
 	imx6ull-colibri-emmc-aster.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-6ulcustomboard.dts
new file mode 100644
index 000000000000..418ec6d0a4ed
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul.dtsi"
+#include "imx6ul-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ul-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-var-dart-lvds-panel.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6UL, eMMC, SD card & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ul-emmc-sd-card-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..408ae5d78d13
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul.dtsi"
+#include "imx6ul-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ul-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-var-dart-lvds-panel.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6UL, eMMC, SD card & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ul-emmc-sd-card-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-brcm-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
new file mode 100644
index 000000000000..90273d87c21c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul.dtsi"
+#include "imx6ul-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ul-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-var-dart-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6UL, eMMC, WiFi BRCM & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ul-emmc-wifi-brcm-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..295cbaf2724a
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul.dtsi"
+#include "imx6ul-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ul-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-var-dart-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6UL, eMMC, WiFi BRCM & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ul-emmc-wifi-brcm-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
new file mode 100644
index 000000000000..e7ca803ceae2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul.dtsi"
+#include "imx6ul-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ul-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-var-dart-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6UL, eMMC, WiFi IW61x & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ul-emmc-wifi-iw61x-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-sd-card-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-sd-card-6ulcustomboard.dts
new file mode 100644
index 000000000000..8c092a3dd137
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-sd-card-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul.dtsi"
+#include "imx6ul-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ul-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-var-dart-lvds-panel.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6UL, NAND flash, SD card & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ul-nand-sd-card-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..aca81a1662da
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul.dtsi"
+#include "imx6ul-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ul-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-var-dart-lvds-panel.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6UL, NAND flash, SD card & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ul-nand-sd-card-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-brcm-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-brcm-6ulcustomboard.dts
new file mode 100644
index 000000000000..05a152477aea
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-brcm-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul.dtsi"
+#include "imx6ul-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ul-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-var-dart-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6UL, NAND flash, WiFi BRCM & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ul-nand-wifi-brcm-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..695844904c3a
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul.dtsi"
+#include "imx6ul-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ul-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-var-dart-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6UL, NAND flash, WiFi BRCM & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ul-nand-wifi-brcm-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-iw61x-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
new file mode 100644
index 000000000000..55c8e4dad96b
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul.dtsi"
+#include "imx6ul-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ul-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-var-dart-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6UL, NAND flash, WiFi IW61x & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ul-nand-wifi-iw61x-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-concerto-board.dts
new file mode 100644
index 000000000000..e975a6e98fd2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-concerto-board.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ul-var-som-concerto-board.dtsi"
+#include "imx6ul-var-som-enet2.dtsi"
+#include "imx6ul-var-som-enet1.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, eMMC, SD card & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ul-emmc-sd-card-concerto",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-symphony-board.dts
new file mode 100644
index 000000000000..6d0fa990eb9d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ul-var-som-symphony-board.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, eMMC, SD card & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ul-emmc-sd-card-symphony",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..b05024029c8d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-wm8731-concerto-board.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ul-var-som-concerto-board.dtsi"
+#include "imx6ul-var-som-enet2.dtsi"
+#include "imx6ul-var-som-enet1.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, eMMC, SD card & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..3b27044f2745
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-wm8731-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ul-var-som-symphony-board.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, eMMC, SD card & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ul-emmc-sd-card-wm8731-symphony",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-concerto-board.dts
new file mode 100644
index 000000000000..af654b725c85
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-concerto-board.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ul-var-som-concerto-board.dtsi"
+#include "imx6ul-var-som-enet2.dtsi"
+#include "imx6ul-var-som-enet1.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, eMMC, WiFi BRCM & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ul-emmc-wifi-brcm-concerto",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-symphony-board.dts
new file mode 100644
index 000000000000..c72411c9f638
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ul-var-som-symphony-board.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, eMMC, WiFi BRCM & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ul-emmc-wifi-brcm-symphony",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..22274fab3ed5
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ul-var-som-concerto-board.dtsi"
+#include "imx6ul-var-som-enet2.dtsi"
+#include "imx6ul-var-som-enet1.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, eMMC, WiFi BRCM & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-concerto",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..c4134eb79bb0
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ul-var-som-symphony-board.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, eMMC, WiFi BRCM & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-symphony",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-iw61x-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-iw61x-concerto-board.dts
new file mode 100644
index 000000000000..209678131fa2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-iw61x-concerto-board.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ul-var-som-concerto-board.dtsi"
+#include "imx6ul-var-som-enet2.dtsi"
+#include "imx6ul-var-som-enet1.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, eMMC, WiFi IW61x & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ul-emmc-wifi-iw61x-concerto",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-iw61x-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-iw61x-symphony-board.dts
new file mode 100644
index 000000000000..9f88fb3868be
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-iw61x-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ul-var-som-symphony-board.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, eMMC, WiFi IW61x & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ul-emmc-wifi-iw61x-symphony",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-concerto-board.dts
new file mode 100644
index 000000000000..b0ed50740771
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-concerto-board.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ul-var-som-concerto-board.dtsi"
+#include "imx6ul-var-som-enet2.dtsi"
+#include "imx6ul-var-som-enet1.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, NAND flash, SD card & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ul-nand-sd-card-concerto",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-symphony-board.dts
new file mode 100644
index 000000000000..73833238be26
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ul-var-som-symphony-board.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, NAND flash, SD card & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ul-nand-sd-card-symphony",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..6a60ffa8d016
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-wm8731-concerto-board.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ul-var-som-concerto-board.dtsi"
+#include "imx6ul-var-som-enet2.dtsi"
+#include "imx6ul-var-som-enet1.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, NAND flash, SD card & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ul-nand-sd-card-wm8731-concerto",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..40610e0ab2d4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-wm8731-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ul-var-som-symphony-board.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, NAND flash, SD card & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ul-nand-sd-card-wm8731-symphony",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-concerto-board.dts
new file mode 100644
index 000000000000..2cbc3e627d28
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-concerto-board.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ul-var-som-concerto-board.dtsi"
+#include "imx6ul-var-som-enet2.dtsi"
+#include "imx6ul-var-som-enet1.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, NAND flash, WiFi BRCM & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ul-nand-wifi-brcm-concerto",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-symphony-board.dts
new file mode 100644
index 000000000000..f8662a410d0d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ul-var-som-symphony-board.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, NAND flash, WiFi BRCM & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ul-nand-wifi-brcm-symphony",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..d4e8a102b583
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ul-var-som-concerto-board.dtsi"
+#include "imx6ul-var-som-enet2.dtsi"
+#include "imx6ul-var-som-enet1.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, NAND flash, WiFi BRCM & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-concerto",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..8612d76f2972
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ul-var-som-symphony-board.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, NAND flash, WiFi BRCM & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-symphony",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-iw61x-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-iw61x-concerto-board.dts
new file mode 100644
index 000000000000..f2d12346b7e0
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-iw61x-concerto-board.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ul-var-som-concerto-board.dtsi"
+#include "imx6ul-var-som-enet2.dtsi"
+#include "imx6ul-var-som-enet1.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, NAND flash, WiFi IW61x & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ul-nand-wifi-iw61x-concerto",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-iw61x-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-iw61x-symphony-board.dts
new file mode 100644
index 000000000000..a8be9a23088c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-iw61x-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ul-var-som-symphony-board.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6UL, NAND flash, WiFi IW61x & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ul-nand-wifi-iw61x-symphony",
+		     "variscite,var-som-imx6ul",
+		     "fsl,imx6ul";
+};
-- 
2.47.3


