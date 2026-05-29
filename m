Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E919CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 13:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rMxhIukJleY41vOIZ+SD59yfY87aAB1ancR/PBsfkqk=; b=Zajan16jZ+8d7FhWOXbH0ogpt7
	uZOgDTiaAynZC6enWcAHdv2++maW15RTqSGl56qEmsPe2dvVKk1mIwj61w/GLR0cWDYb2Ut4+7FUZ
	cIf3bvCRK+SPWuKelT+M6+YWpP5lQgJ6bE3MoQWAET8MAFwFCqtobco79S10oND6W8cwdQ8qQWfj3
	gO09zd1xnWezeuXGVzl7AjHlWM5Wsy2eprw/WRtY1b6myvRBK6PBgzjUJsjpGlQ5CN744CpumGQTB
	OcO5Ovc6n5mzSmtpKh1PDmtQEy3vmZKcVjye4mTWNnZUy0q94h7xc3M7yBbp/6QKGv41Cz/BzBu/v
	iDV1IajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxa8-00000007TGl-2kCS;
	Fri, 29 May 2026 13:49:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxa5-00000007TG6-3Sdf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 13:48:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4905e190c71so66718825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 06:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780062536; x=1780667336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rMxhIukJleY41vOIZ+SD59yfY87aAB1ancR/PBsfkqk=;
        b=NY0qnjGk1rpG3XWsKW7468Ze7MJOhxlxcU/Qkwk9kx6xWJsecDEgLu9qWlPrUyr9Bx
         VMR4Nii1XpIcXr1sy/gyZ733hQyTAmNpCsbaZB9EInZZ46qTkuBAeS+t4v++/knXreUJ
         RvYqgTsgPhq+Mh314uJcv6tTu0ApGRkipiqoRmYX10vd4pfNaHfrj6kElFG7tYyQe2BY
         8VT7XbM1MvyFA5mRtSZWy/+z+6UKV01rOuJ5T8oIjh5dc8dMjUr9fmjLNbQYOhoXXAYH
         KLzqBgM/G/TCWL7D9g/pTq9UAZXtIyECQdbMNlkuSfDmalIFygGbykue5O5zdlYGPC2y
         gkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062536; x=1780667336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMxhIukJleY41vOIZ+SD59yfY87aAB1ancR/PBsfkqk=;
        b=JVqp5wJYLfbqFw2uS4NEj6SsXXv9YQMXqZR74WApbVMB8RQjCKDq7DOH+AeZf+2OU/
         R8STRQMDGpa2RUPRO8eVNOIDQrcwtrDGfigNDNDCqfEz97xsc1ZKatT7C6mlJTIdnU7L
         wJrFsUxfP/9g+voo7ITAFrS3r4If1v8Mzl8c9ZXhjScTGErlYuufFiVD+fH0leHz6FI2
         nIaJbDkfflc8sAFWqUGOoGvsVxZ1ZQW/V3OZIARqF2Ggl9H6DeFMDngR6cTGTyXIkA49
         OHckpIoH7xRMGgqYwmO2+kvshQiWdYfGrqxMEMd4VhLaeuHd8+WHyNm4dLuhVvcrYne9
         Q1Lw==
X-Forwarded-Encrypted: i=1; AFNElJ+fD0hocPKadYHfbR8cbZwgsmNU6SZiCZBePw1GTxLZM4niNeXjkhHe/HP4iTAmDaeM2IjWlooqWgP7P0sdernt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+cidEEcWzngSydcSrRUbyQH16xT3srhSFCbFC01F+/zgc8HZ7
	T5XHmwZ1Jf0MaZjj7jYhP5EJQJFOSp9tGskiDaC3KHn3sXolEt3cNASn
X-Gm-Gg: Acq92OFRJ1/g0k9jPoAGKlUc7zIWIyRz1Y/nCvONkWwPYt4xUIXc4sBg2r7rqd6UOAz
	hBCN1J5pgzmnpcaMA68v8dwi5h7zv7Ibf3W6L49qtMeic5zLBKkj3A765cGhvUsTsptYOLYn2Ms
	aDQJVn8dmbtVafzHytsPmWcLPmbKIo3P9M6YEQlCzBTMWCxzWvi+fmL7/eDQ/yZkdBYUUdGqb9h
	YkDDv49nCzP6jOQ3CJYhn4TC3y11E3VE/z/3VQk29C7O6PKYM3KlLG24nuns1S2IhF+ZSCaaoMi
	iz7HN94PhVHVUg5gVPesBffZ3r5ULrd11+GWIiXqtl8c4draBA9NlHBiFq8XB1EwoDXOvGbBInb
	V/BvIAuyoj5KsZ+WEz/RffLLD4BpxEDTwkqc2xLQIyOljOcnjVN1jq6E5/1313iVxBgSepwqrZF
	whNOP4kkrY6RmeknV6kUXSdnx7//DAEJ6aZalOHmyt7L6NJ5AITe2FEL9jDCbhJJsFWUPQIGSc0
	17Qi1RdLCS/YbBUdsMTyoQlLTYgY11DQ6uGwVORuw==
X-Received: by 2002:a05:600c:a012:b0:490:9d5b:d721 with SMTP id 5b1f17b1804b1-4909d5bd98emr48239965e9.16.1780062535369;
        Fri, 29 May 2026 06:48:55 -0700 (PDT)
Received: from GLaDOS.lan (93-55-225-230.ip265.fastwebnet.it. [93.55.225.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm20777125e9.9.2026.05.29.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:48:54 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/1] arm64: dts: imx91-var-som-symphony: fix RGB_SEL handling
Date: Fri, 29 May 2026 15:48:50 +0200
Message-ID: <20260529134850.22196-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_064857_907470_C6E79B55 
X-CRM114-Status: GOOD (  13.01  )
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

RGB_SEL is a board-level signal driven by the PCAL6408 GPIO expander on
the Symphony carrier board.

The signal needs to be driven high on the i.MX91 variant to keep the
board in the expected display configuration. Move the handling of this
line from a fixed regulator tied to the PCAL6408 supply to a GPIO hog on
the correct GPIO expander.

Fixes: b3292129dcef ("arm64: dts: imx91-var-som: Add support for Variscite Symphony board")
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx91-var-som-symphony.dts     | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
index ac9fed58357e..c1e6c9978275 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
@@ -97,13 +97,6 @@ reg_fec_phy: regulator-fec-phy {
 		regulator-always-on;
 	};
 
-	reg_rgb_sel: regulator-rgb-enable {
-		compatible = "regulator-fixed";
-		regulator-name = "RGBSEL";
-		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -258,7 +251,6 @@ pca6408: gpio@21 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
-		vcc-supply = <&reg_rgb_sel>;
 		wakeup-source;
 
 		tpm-enable-hog {
@@ -267,6 +259,14 @@ tpm-enable-hog {
 			output-high;
 			line-name = "tpm_en";
 		};
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "lvds_brg_en";
+		};
 	};
 
 	/* USB Type-C Controller */
-- 
2.47.3


