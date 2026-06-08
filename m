Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E33CD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXwjXcSk5MvZ7BwLfwPes/qcxy57EKErAjh+J+ytqQ8=; b=M6VwdT0hIap81zIMLdGtkO8OxN
	KcbeoRHHDpaRk4xXo8Uq0uWg1sIlVjRSPz3Hz9Ur4ytJHGQ89p8aKXPwWME5CurbuE/HcrYzgnYDH
	vffyMhBWCmbfSdy/nB8rXq7FB4FO7AKxljo9I41xccLS69TzzGyC0eCGhftYKWy4Jh9XTKpm50uIm
	tB7Wxn53BMaT2QJ3p/RZBUnY+DxJlbRo2f3DBS304Jj16LyDrP3pfvCOGVsdCB5zGky53xzIhu/vR
	9ZOQGw5QRDkXrdL7xg04uQBoaoq6gW83ECnVR5DVWzNOjzcKflpYklwdG8WbbLj814lFyqVrtpDXz
	x6gn2NUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvO-00000003HYI-46lG;
	Mon, 08 Jun 2026 10:09:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvL-00000003HVw-0Pld
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:40 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so36313335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913377; x=1781518177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXwjXcSk5MvZ7BwLfwPes/qcxy57EKErAjh+J+ytqQ8=;
        b=DFYY6DpJm7pTmbVG8tcm2STr1do/xn3C3wlbEtSSKkSkia1k0XUkmzhJVEk5O+1Plo
         eWPYtGlBWicZBjwsqknYSgH7sn+4YieqMs/Zg8DDIqVN/6ggb3jxxzcAVXNUMOgIPpQ/
         g38tebBieXS07ZTqXjla1uFaRzeWCCUTbTWZ49cSu2/Wfkh4CpdazpqgqEsHyca2fmWO
         PWyf+5Ym93gSmuRJ/c/yRu/yDSy0Zsqn4IbnXKz/h2AeK14HRpVDDIx29FkX0jkc/zW3
         /OMdT/hVpmaTDlACxDfmTo+MbChiNp8l5e5jlGYcf7og4hjx4tWYGwa7yxzap41tFnzH
         eWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913377; x=1781518177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXwjXcSk5MvZ7BwLfwPes/qcxy57EKErAjh+J+ytqQ8=;
        b=F0hYq6aHd9qZpxS0AvUUyFKoOe4FPp4OE8FqxGEatJ+6foj0SUmIZbVQF/gTJuOorG
         39oG46YhXg6j8xvHhMCv0DEADtOV+ur528NKtz5Kebqkp7kLL4NsBV71Eo7Rc1jH/6/a
         5+L7htZdbMPWtgBIVXjdf4vO2CxwRe/CUBXOAZaLTikPS1HRFgSOtutp66qLBMC7ntNN
         OkXD7w5z6IEsdr1dtTatk6+wH3Dlmb1Jh3MnQ1xAv74G6BpfJS9YdqC+CQvpmGa+K12E
         58Cs0i3UO8a+2X6rSf0OBhEntvcjwyz2HXHzYamT2rVTaxbbiu//ZCK1I0dKh75RQMmo
         onog==
X-Forwarded-Encrypted: i=1; AFNElJ+uOU1M4nyMIAF/TnGNOIAyQIQ/bjNKqqHAsIPevikiiAE76+dTUjG1zZXZrzFA1TVhaylG/xP3S4l8vCTuNh4b@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrsz+gl6kpUAWLo3i+hdPSg8H17D5vM5vPIZyf6HHuYBBUzw9L
	+BUAyBDunFA4bDQ4TrQORxsySAA6hXamdQaAhMhxN+ZIR/vGBrJ3oz/3
X-Gm-Gg: Acq92OFom294ZNN3O+cAS/Fb1GlI4ZCodoKZzNwQqg/7Np4C1Tkezfv4Thp29rEFRp1
	W/6S8X01SIfVPomJEuE0sACGFAZ7Umx1LyUYXPnVI8VzpZXN1gsgYtwLzsY3pJ5Y2Top4zQFQzp
	1+ORKv2uEcwul3JjgV6z8AgLTSu0gF3y0ZCVlVBitiVFuPhGaAe5cXgc6I1CSpmYcS3GV06meUy
	bc84G3ojeZdWpsaaZKJPYT/lFISdUOlpObikg6Lmc5ExtCeKSHrTpchUZD1ciYK8caYfZGk9RCa
	oRd9WN3Vz5ubP9xsJ8yD7hSL6GLMvoXsfwHs5B0ZqxBmPuxdooo2BV6qa3eJ9Ahu4orWngvXMF7
	eotv9e+S8cHCyPZRLNMsOxTxUuuHn0YvW/k8SHLT++5ziP+VKRLqruu9/mmSj4XCT8lm1Nildgg
	Nd3mpmDbFb9/TudM3yAfAHM8QAfWMOL8ftkEzgASSilSfi/Dt4x8BiXOPjYL1RJT/YFwJ3X61Ra
	4YZi8l7T99jmwxWboWP5mdyr6sgBkaXXHGL/IliAQzERhgV
X-Received: by 2002:a05:600c:1c29:b0:490:7df7:9190 with SMTP id 5b1f17b1804b1-490c2ceb6f6mr220547035e9.8.1780913377253;
        Mon, 08 Jun 2026 03:09:37 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:36 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 01/14] arm64: dts: imx8mp-var-som-symphony: add input keys
Date: Mon,  8 Jun 2026 12:09:19 +0200
Message-ID: <2a02e17dd1cf516332e2f86e733620d58b9a73b9.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030939_152901_0A53B570 
X-CRM114-Status: GOOD (  11.07  )
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

Add the Back, Home and Menu keys connected through the GPIO expander on
the Symphony carrier board.

Also enable the SNVS power key.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 291f65e36865..25f707012f62 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -13,6 +13,31 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 
@@ -72,6 +97,10 @@ usb3-sata-sel-hog {
 	};
 };
 
+&snvs_pwrkey {
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3


