Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E743BCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Dy/GQpes6t3Dr4yJzGcSgwwK8OeTYqUiZJxbHyAXsg=; b=itAKWUw3tgwKQSW/046FsBqGg+
	BW+5DV0m0x7YHIZgtEVtK0b2qRdM5AEud3UoRx1d/nK4cx6ZYg2mQywDr/WK2kOTx/GPTK3TFsUrV
	SxRgXLr5mk3O6Jcy8RdbX9nRiyVY1kfjN2CUtHHVhqluTaJ4J3dPQwihRRXCd7DAzNhcIC/0LxDYW
	9pSz1WIM53M/rscuTD4NrNL19gw6CBlHr+Boc+0428M8wfg7Rt4S19iAOw0klX2/W/ndLy0kNvr0V
	WTAQqr/X+WfjNWSqXsicLgbo7OVRaDyFkcK2CqoLVZ9Bu0vEpPkPlEzlBxCeCDh3z3VL5o+Mf/cM6
	soganhkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP1-0000000F8b1-39S0;
	Wed, 03 Jun 2026 13:12:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlOy-0000000F8Yv-3pS9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:12:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490b12270b3so13827515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492375; x=1781097175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Dy/GQpes6t3Dr4yJzGcSgwwK8OeTYqUiZJxbHyAXsg=;
        b=W7pemsZP2teBfx/6h6p7iOWNbkAclKXl5qKXFddhqhxfitgt3lp0FM3PHx5FPPjADA
         ZdxxTHhsdN3ofv82bPUoM0pAm4JCE+iv46Cd00MLIlO3OSvaNHtPP2h2n+THTBacyM+b
         6+puyLN3bZl9tOV2aXTdgmfYCGHnJwwkebrLTzda84gxM1hjlgvMWBXu4UBSHqyfg3m9
         eSWu0x/FYoS/z3rFV4KmZ7fusqsVX/4yhj51drB11CbKvg8j49mIiyd272yKcUM96wMT
         GOsGmzgqElHmIr9eZVHxVLXmTngjIDH1U709auAzmWYNYE0EdwzhI8Z6lOwmTWL+c8Fm
         DAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492375; x=1781097175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Dy/GQpes6t3Dr4yJzGcSgwwK8OeTYqUiZJxbHyAXsg=;
        b=lZtTZ+kKAjpOARdvlT5hCHFAfCzy8gvZLjCnNkMzs4Z4DCME0Tifj+ULFY/0MD3P7a
         PTQeW3oY6XhDIaztGj7Ak58tiyyt1MbIYENiV+sFs7b/V+oHkwIOxIqeW0ZqUzSq7Pap
         4oXkvrWWu3OkwZXD92779YnE0lFb0Vu/kPR+m+jNiOHlRZB2pRFSnCpGFG9tWkPvT1s9
         iTDLsZwaZ1exK0IhZp1heWHYGT7OqxJY86aJn0m0RXwbIu+uVYOJ+E61voWtQkV3IXpl
         esFuH3xpHvfKHFYotyX6KTPHLnlnPiE2Y/sNmeP87n43v/+sKpCvhZ4TQgwIwufcb4k2
         sFGg==
X-Forwarded-Encrypted: i=1; AFNElJ9s5o+/ZqC5MIbxLYLW+r6BGJZsqR3ZSgNH9hQBJ1ez2WHYeHlZUvAszGcRpFyuH4J+JJjZXGOMAE/AdAIUtlTN@lists.infradead.org
X-Gm-Message-State: AOJu0YwnTsf6pweVA5Ycq+NDjj/sWLKD9HTVPtcAvqOADrqJvqfB1NfH
	5n7mA6kQnv9K4kEAhm4lTPo94cHyLJP3QlGATUi008EnWpBnYCWOTwEm
X-Gm-Gg: Acq92OEyZLz+JqEkxVXXxC3nUPicxV1DreQVSTMMGIzxJWQO/tLXix1HaZZcg06KSVY
	8H+Nef09U9J9Ay7eQE/BqIw2Gim4pu2x4AAXM6SLuX26G3DdNBOg/55MM20agy4P5PZmUaq63dE
	86y+D7tgl81eBnDyBJDoax5CP4NZCdinsAYKCeKbCWqcRJR8SzUa+W7isI5JNncDR0kKpgTthSn
	p0BGsadMbUZfldXwJAfhmDn/+qIclQZWNbjuXZHsSv3tVsr0bfwaBQgQBGFDAUL3Uhi9j30VFTq
	44Fq7VkmOcRiNeB0ioZp2z2srGEm8euI63X+ObDm7DCNhaiaTMIrfnWlz6/5xGQzbbUMjUE5GOm
	IYm1SxheSSeoayIKmUqMNj1owj3QCv8IN0uaNz/vZ0V7WsEAAuWaRxoR5HT86UfzttVeaWyUj0f
	J7+OkWcVIhqAHTFhyqt+4CgiWhWD2lqnlovDXXGSof5vj6CxD1nPpbUFrigt8pECI9hnw5tVuVM
	ocIL+Yfbr4WY7hMe6ZyILiMFdI6yhYKMFR0HWkbglHcKXCs
X-Received: by 2002:a05:600c:8184:b0:490:7227:100 with SMTP id 5b1f17b1804b1-490b5fe9544mr53737595e9.18.1780492374970;
        Wed, 03 Jun 2026 06:12:54 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:54 -0700 (PDT)
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
Subject: [PATCH v2 01/12] arm64: dts: imx8mp-var-som-symphony: add input keys
Date: Wed,  3 Jun 2026 15:12:39 +0200
Message-ID: <2a02e17dd1cf516332e2f86e733620d58b9a73b9.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061256_969892_12990D8C 
X-CRM114-Status: GOOD (  11.27  )
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


