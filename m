Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EED6CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNJJ9kwWhZqeENPGzU0YRnOooYzBFcKz0B9dMRj627o=; b=hsDbUdO4SsVsf02AZ7T7bQbnb0
	hy/f4bRuOE25ysUyQv0icpKwtJhCnO9ahHJmcD+Ec0kwFnSEVLk1iv62UIUffOAB8ARube8VIMUqs
	9ltvgyr31J0rO7RyZw9ux8LD8a3w9h8yV8bcpLatvFSynbkga//HwTM/hO0PC3S9E53HADQYlZ1QT
	jRwFTwpqXeiW4S3Fi/fCD5f3AyqkPB9LfaT0MFBS01k2I7TwKN8Lran6lclCVEEAs4Jo9MJ/K3LT+
	mGU3dKPuolYYHJRVZffwHZFR4Z/uakFoOvRVzNqnV+enWYlMJ9RnrLpGkJLHOsRSOwHFSJMprKQMN
	2OeYqy/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmiq-0000000FGnO-2QJx;
	Wed, 03 Jun 2026 14:37:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmin-0000000FGkY-44Ss
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:37:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso40052975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497448; x=1781102248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNJJ9kwWhZqeENPGzU0YRnOooYzBFcKz0B9dMRj627o=;
        b=meQO0j7iL+DyYWv/TtRT3ZYGdEvYt4lLivR609NPgFMpPq39UEdbieztuF/l6Y8hCM
         cRisMz+y+XzEoymEsrR5Q1ypmCxPw85Wx/xtvL6hPmonbwzGiVKYFnhugBBkvLkAnLVo
         QtG+MWaFyfW1ehkmeWGfr1uhyBRSYU0qwGcoMbuPcVnKLvj1SLjzdHaHPQtI8B2DbcUs
         eJi1yCcZWO+WDk4pZQGwL3Wa1RfXDh0gWJYstc8k2G5JbyLZ57MkOfiYEM3B8BIyRB/z
         3JOby0mOlTGNxXedxYSTJZUigaMfPg65qkUU3eDJeIO1f6NQR78ahDZ/WTsegkGBTnmh
         r8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497448; x=1781102248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zNJJ9kwWhZqeENPGzU0YRnOooYzBFcKz0B9dMRj627o=;
        b=P9FkJKI7r094+4rhWFzYku/GD/h2q2hl2bTpCrjvuuDNzwMgDF7pgAezbEeAJMyFfP
         w4ID8Xv1IVY0D91JtzZMyeB0bdupAMtE78e8/n80jWFBPDJ+XBBOUOnNZcD03wyWovBh
         11UZlQ3Zn6EPXWmwGjd8ryja3BRD7WY0cXdeLonS2TLxUwI15nh/zV/BepYlj27evg64
         MGMhAnv/Oo9en+5M9NGMGH1X3Yqk3N3odd/YlzdwX//z0RD2L6jYszGJkF09988oqVhb
         2Gr3CEe00MzjUvB0h+eW0wBKvFGk7LX7HBfNLOfEk+SsKq6YMOM2wkw6E1zyIz91HQkO
         kbJg==
X-Forwarded-Encrypted: i=1; AFNElJ8CKxX1oYc/8K81VLvy6tRPQYD0m9XFMq1wQP7kY6RPTGw3Gl9ns32tPJkhWjXyZCqGaviQPBlGvrKkQQEQoBcN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyz5NfCjXB25bu7edVwf30W2iMWs4IVktKsrl+IGXbWe4HNhw/
	NjXwMVrncoAX/8ankEmYhu7IGSwWB1+7qirPKO7KK0tH6COd+jisRfa9ssjobw==
X-Gm-Gg: Acq92OG+nfpCq083a5eh+PBda8A2R0XGYP8zvWC6HaLtX11RaYUiU6Lik+bWbppYdY/
	tTCZWbnDhxqhhGGLuffjgW0WT6K5kAuylbdx74Ml0CxtXqBRvdD9yBF61lV/wIahGSlSgb3stFd
	yjNB6EB89CUlHXpTRGUD7xB56i+y/KdRB2xPSd99UXY6r8Ak1Z6Dwy2XDdZwi4ftgHXVBxECfd5
	DeTaySH4vierbs813FNqwEyGoVsopdi5G6pQKPNDdgtsIc5eH/KampJq6CHKdSUfsUpDj/5X2xF
	bPf6IQX21NbbEtULJOCWxD3g4icD5mbA3N+M87nzx2iGg1PQpC/rxnnD58VF5/tYInLcDFgvDyA
	kM2BQajM2sHOmXetcCX0YiLDyPZplhoP0cA/1gmu6R0wgkqS+9HS2rv6bhYAmpIA8/CnZ0Md849
	8/NO6IMqX+4Ycx/OUx3e3PtE60/9ZIoQVpfYxT9ZZfOXfZ7OysoNX4sTa81LIhpQwPXozjKBRZi
	04/VGK4z6Hox9rqptgDNdA92fs+vm1Sk0+S/A+iyLbIs7cA
X-Received: by 2002:a05:600c:1392:b0:490:52fb:12dd with SMTP id 5b1f17b1804b1-490b5e8cb8amr58453575e9.10.1780497447770;
        Wed, 03 Jun 2026 07:37:27 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:27 -0700 (PDT)
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
Subject: [PATCH v3 01/14] arm64: dts: imx8mp-var-som-symphony: add input keys
Date: Wed,  3 Jun 2026 16:37:08 +0200
Message-ID: <2a02e17dd1cf516332e2f86e733620d58b9a73b9.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073730_023053_0FEE33E6 
X-CRM114-Status: GOOD (  11.28  )
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


