Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84985CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qUf+g4bCt5MdFtjpNpCg96lRmztOVhCXpafgxW+ipE=; b=qfif0Mh6qHp3Z9aJ4TgKjhKKio
	HjX4zd9l19p46SSKhAkAvVg6m+56tsbYk13MV04JtwwoDS6HZp+l609vpxemwbOooQDAJUSzsPSE0
	+i6Mw0J9yQ+akJj/CotkaUV7YnR6MU6zaJ3zjb/0B6f0UU0uyMYyKiGkyWncqp7AO9Z8JRVTOGVWq
	H/IJssjCym5nemlDzk8T8IY9nLWFY5qfwrDUBkXL7JoaizFxovuHkdW7kNl1SCctrH2CXDKHBao6v
	44xvFsKvIiTAB+Pu9Q3HPcV7+BfHwpQ4wnu5kO7S8jKv4VQ7bDww3yZ5HfDFv3xbnbhhT5PSfwx1e
	OxawdT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZbP-00000003vNo-3Xv9;
	Tue, 29 Sep 2026 15:18:43 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZap-00000003v5o-3WZI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:18:10 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912df756so34039275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695086; x=1791299886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qUf+g4bCt5MdFtjpNpCg96lRmztOVhCXpafgxW+ipE=;
        b=orUOcm7vhpbiPWAo5HUufoqAVPzHJnUUU8DQZmZeuS3HF9QEK1y80cbySUhAhbEKq2
         izqlbY2gsT7auIIy4yMbF+8hDv84VVAJFszyZJ1YO0HKqJ6MXczSLQADwSru5eCg9sUF
         sWrMwN0VwDsLEdq7SHO9Z775NdBVqyY7L8VZePcnuIgnotK7qhgBtr1GfT/OLZ/EYjdw
         YWMa454q0kli5IGnA5UluirtG3HLHjTisQzq99keFIOoOatLd05pxwF0LRGGMD9J7ded
         qtVm42CnOD51lcl4eJXyCwwxdty2GDXEERr4WRAUV6NphojhXCdyNnrMtq+Jgbj/TWiY
         GSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695086; x=1791299886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qUf+g4bCt5MdFtjpNpCg96lRmztOVhCXpafgxW+ipE=;
        b=kuxXgMHX0jK2a+AQ6sMSdGsUFjtk0a6a//ASEJCh66zqKGsuUJac7fxRSXQXLNxNPv
         IrFaQyTJidDWUR5SN8HekEIWvP7xgXDCsUjAdLoTbVCbp4frKlFx1j55BhCZt0Sft2b0
         2kiQldqW6uEvryo5pOtJx4iLmpUR6APNXr52tyzIXgP55xHW35riCgxObR/T73NVT2Fc
         4bCVgNFUfyKf/YfqOsHF8B971bybZr0Jr9rhzHl7AJfaKT2wh285i4lTUrFEyif7+htd
         1lEVaIIFLzw2osCkEeEdBPcGVwpfx6B4CY/LNyvB9Ns1tBy4ev1tAKfQYXvFrIg3GK9n
         35iQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIJuNzfyzrDgniLf0Im0eDVGmNNsEsPjB7Ff46F34RUdXkcDFwRsSCfmjwkKoEl+BGezAbj6DdmlWrTlNe0Srd@lists.infradead.org
X-Gm-Message-State: AFuF++m8tGAdBbgA9dDBaOi4sWmb9jDKzcIzDpy7mv/TI0855To1K1fY
	K9HFYFyIDQN3r3qIaz7g7ArYY2G/HzVO4uUD97JZBvsVEmr+uu3p45N2
X-Gm-Gg: AYBFou103jhR91wlOGoyUdI2IhUVCGvylKL9cZ0g8va2Ur75Pt6BTpgyVmc65mfgAor
	7o/lS11TE3pdcW/N/e8Lvdie5V+r8I4UHVvT/ZjO0qWefdPNZ4HqUfG1F4Aj7+jhfHDeIyeSb7R
	LHzpiau+lMIwdoXYmhRASxJ/Ss4txfgE5nseykObKKoysrzJLOoa67AjVAPYzIm4/ZaRBGi19oC
	12G1v4dhXgV5ytOMTqBFAaWNBWQULa3xicqu1mFwhrWBG1E9/8ZGeMBWmL0QJbdSRFjbw4JP3BA
	VpywQ4xSq03PfK1Eo3wpboU6lMCQCJWNpEnSZ0pz5zI0E0H8ADECDOQ42zSfz+O44cHp/mB7bMl
	wbobxOqlswf7/SDCaVY97KFYuCWnlabEy+mKfKkQmWrD8RZ8iSayzUzllJQDwTWLckqa4BODqeF
	NGXdmDuY7rO8UEXo41w+ir5qdj0DyR4K6ct5R71cA7yDFg6suD83sH0BAkmQITps+vR8aW997NX
	Rdl5gXE3UPMu3/EhFR5QTc41gCTUK09pH/MqZlK70k4igTGJZ+z1t6DsxRAqeMenwmwugw7ZcmZ
	AGUQ9TBwSPGV93kQvr2cMw==
X-Received: by 2002:a05:600c:468f:b0:49e:799a:8952 with SMTP id 5b1f17b1804b1-49fe66e89e1mr303142575e9.26.1790695085880;
        Tue, 29 Sep 2026 08:18:05 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:18:05 -0700 (PDT)
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
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 12/13] ARM: dts: imx6ull: Add Variscite i.MX6ULL board variants
Date: Tue, 29 Sep 2026 17:17:39 +0200
Message-ID: <5a5a713bc2245ac1423d7b684af00e98e875bd6d.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_081808_130107_81AA8640 
X-CRM114-Status: GOOD (  17.47  )
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

Compose each new board from the shared module, option and carrier
DTSI files. Add its Makefile target in the same patch so every new
DTB can be built as soon as its DTS is introduced.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Add sorted DTB Makefile targets alongside the board DTS files.
 - Drop the redundant -board suffix from new Concerto and Symphony
   compatibles, keeping the SoM options before the carrier name.

v2->v3:
 - Use the shared storage and wireless option DTSI files.

v1->v2:
 - Update audio includes for the shared WM8904 and WM8731 files.

 arch/arm/boot/dts/nxp/imx/Makefile            | 30 +++++++++++++++++++
 ...l-var-dart-emmc-sd-card-6ulcustomboard.dts | 20 +++++++++++++
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts | 20 +++++++++++++
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts | 20 +++++++++++++
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts | 20 +++++++++++++
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts | 20 +++++++++++++
 ...l-var-dart-nand-sd-card-6ulcustomboard.dts | 20 +++++++++++++
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts | 20 +++++++++++++
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts | 20 +++++++++++++
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts | 20 +++++++++++++
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts | 20 +++++++++++++
 ...ll-var-som-emmc-sd-card-concerto-board.dts | 20 +++++++++++++
 ...ll-var-som-emmc-sd-card-symphony-board.dts | 20 +++++++++++++
 ...som-emmc-sd-card-wm8731-concerto-board.dts | 20 +++++++++++++
 ...som-emmc-sd-card-wm8731-symphony-board.dts | 20 +++++++++++++
 ...-var-som-emmc-wifi-brcm-concerto-board.dts | 20 +++++++++++++
 ...-var-som-emmc-wifi-brcm-symphony-board.dts | 20 +++++++++++++
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts | 20 +++++++++++++
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts | 20 +++++++++++++
 ...var-som-emmc-wifi-iw61x-concerto-board.dts | 20 +++++++++++++
 ...var-som-emmc-wifi-iw61x-symphony-board.dts | 20 +++++++++++++
 ...ll-var-som-nand-sd-card-concerto-board.dts | 20 +++++++++++++
 ...ll-var-som-nand-sd-card-symphony-board.dts | 20 +++++++++++++
 ...som-nand-sd-card-wm8731-concerto-board.dts | 20 +++++++++++++
 ...som-nand-sd-card-wm8731-symphony-board.dts | 20 +++++++++++++
 ...-var-som-nand-wifi-brcm-concerto-board.dts | 20 +++++++++++++
 ...-var-som-nand-wifi-brcm-symphony-board.dts | 20 +++++++++++++
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts | 20 +++++++++++++
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts | 20 +++++++++++++
 ...var-som-nand-wifi-iw61x-concerto-board.dts | 20 +++++++++++++
 ...var-som-nand-wifi-iw61x-symphony-board.dts | 20 +++++++++++++
 31 files changed, 630 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-symphony-board.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 33a9a38d74a5..2d6b2de9d34f 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -445,8 +445,38 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-tqma6ull2-mba6ulx.dtb \
 	imx6ull-tqma6ull2l-mba6ulx.dtb \
 	imx6ull-uti260b.dtb \
+	imx6ull-var-dart-emmc-sd-card-6ulcustomboard.dtb \
+	imx6ull-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ull-var-dart-emmc-wifi-brcm-6ulcustomboard.dtb \
+	imx6ull-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ull-var-dart-emmc-wifi-iw61x-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-sd-card-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-wifi-brcm-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-wifi-iw61x-6ulcustomboard.dtb \
 	imx6ull-var-som-concerto.dtb \
 	imx6ull-var-som-concerto-full.dtb \
+	imx6ull-var-som-emmc-sd-card-concerto-board.dtb \
+	imx6ull-var-som-emmc-sd-card-symphony-board.dtb \
+	imx6ull-var-som-emmc-sd-card-wm8731-concerto-board.dtb \
+	imx6ull-var-som-emmc-sd-card-wm8731-symphony-board.dtb \
+	imx6ull-var-som-emmc-wifi-brcm-concerto-board.dtb \
+	imx6ull-var-som-emmc-wifi-brcm-symphony-board.dtb \
+	imx6ull-var-som-emmc-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ull-var-som-emmc-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ull-var-som-emmc-wifi-iw61x-concerto-board.dtb \
+	imx6ull-var-som-emmc-wifi-iw61x-symphony-board.dtb \
+	imx6ull-var-som-nand-sd-card-concerto-board.dtb \
+	imx6ull-var-som-nand-sd-card-symphony-board.dtb \
+	imx6ull-var-som-nand-sd-card-wm8731-concerto-board.dtb \
+	imx6ull-var-som-nand-sd-card-wm8731-symphony-board.dtb \
+	imx6ull-var-som-nand-wifi-brcm-concerto-board.dtb \
+	imx6ull-var-som-nand-wifi-brcm-symphony-board.dtb \
+	imx6ull-var-som-nand-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ull-var-som-nand-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ull-var-som-nand-wifi-iw61x-concerto-board.dtb \
+	imx6ull-var-som-nand-wifi-iw61x-symphony-board.dtb \
 	imx6ulz-14x14-evk.dtb \
 	imx6ulz-bsh-smm-m2.dtb
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-6ulcustomboard.dts
new file mode 100644
index 000000000000..ea8bf022744c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, eMMC, SD card & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-emmc-sd-card-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..b0f02ebf158c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, eMMC, SD card & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-emmc-sd-card-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
new file mode 100644
index 000000000000..6e6a2c8ca180
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, eMMC, WiFi BRCM & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-emmc-wifi-brcm-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..7af5fe7dc1fb
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, eMMC, WiFi BRCM & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-emmc-wifi-brcm-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
new file mode 100644
index 000000000000..26d266d731fb
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, eMMC, WiFi IW61x & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-emmc-wifi-iw61x-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-6ulcustomboard.dts
new file mode 100644
index 000000000000..617bccd11457
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, NAND flash, SD card & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-nand-sd-card-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..d983c60015af
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, NAND flash, SD card & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-nand-sd-card-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-6ulcustomboard.dts
new file mode 100644
index 000000000000..8d1620bc1209
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, NAND flash, WiFi BRCM & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-nand-wifi-brcm-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..3c33aff6687e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, NAND flash, WiFi BRCM & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-nand-wifi-brcm-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-iw61x-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
new file mode 100644
index 000000000000..061b427be774
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, NAND flash, WiFi IW61x & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-nand-wifi-iw61x-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-concerto-board.dts
new file mode 100644
index 000000000000..1e748f8b1214
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, SD card & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-sd-card-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-symphony-board.dts
new file mode 100644
index 000000000000..d7da400e14fb
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, SD card & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-sd-card-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..4d4b69607486
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, SD card & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-sd-card-wm8731-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..dd7a9fe3917d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, SD card & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-sd-card-wm8731-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-concerto-board.dts
new file mode 100644
index 000000000000..eda48a9b7268
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, WiFi BRCM & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-wifi-brcm-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-symphony-board.dts
new file mode 100644
index 000000000000..75cdbb5a5db0
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, WiFi BRCM & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-wifi-brcm-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..c294efc5c91b
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, WiFi BRCM & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..9ae9182246a2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, WiFi BRCM & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-concerto-board.dts
new file mode 100644
index 000000000000..e9d47a865ff1
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, WiFi IW61x & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-wifi-iw61x-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-symphony-board.dts
new file mode 100644
index 000000000000..aa9691429c2d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, WiFi IW61x & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-wifi-iw61x-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-concerto-board.dts
new file mode 100644
index 000000000000..617ae3e86dd4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, SD card & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-nand-sd-card-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-symphony-board.dts
new file mode 100644
index 000000000000..2a09c16715fc
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, SD card & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-nand-sd-card-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..19a2df6abe72
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, SD card & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-nand-sd-card-wm8731-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..4028bdfacf12
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, SD card & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-nand-sd-card-wm8731-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-concerto-board.dts
new file mode 100644
index 000000000000..0c0400a41188
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, WiFi BRCM & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-nand-wifi-brcm-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-symphony-board.dts
new file mode 100644
index 000000000000..6a4ba1d915a4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, WiFi BRCM & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-nand-wifi-brcm-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..de472b5aa11c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, WiFi BRCM & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..a7cc0993e9d8
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, WiFi BRCM & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-concerto-board.dts
new file mode 100644
index 000000000000..add827d6d8d9
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, WiFi IW61x & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-nand-wifi-iw61x-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-symphony-board.dts
new file mode 100644
index 000000000000..d01ccbe10e68
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, WiFi IW61x & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-nand-wifi-iw61x-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
-- 
2.47.3

