Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A8ACD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uIGJv06tp2fYr3qME+4/5ks9JXN0Cpu9SA6dXG0aL4=; b=cJcTfvOIvDYBBqgwBahZ/aI4+B
	yG/G9IRgmtEZW9s2c3BW++7hrjRBvPV2PK/xgMaaPtTQSc4mQ32Kq5ag3vXNscMoGIYR+cHAWqOto
	DOzAT1/kv+XWWj4jw6UVyBsI2qexrxYvm2PsMlqYJKAwcikNFuQPxZxAR+a5tXHi0DVmOdXt+8P9Y
	nV77azfGpa9eVOlTDuzRfsYLR1bdJbuNANkLe14Oa5EVZoGtsiYmtezjgX+SoItrXqH+gF/pCw3Rg
	7GepEMdwT1qLusmd+zDxpSNIIJ9HueKDdOrbE+gwfpfVQF/eNbzXBIFJ16X/BNE+2G07E1CYlD5YK
	kJJHNSOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlPB-0000000F8pr-2bum;
	Wed, 03 Jun 2026 13:13:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP8-0000000F8ic-2Lxd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:13:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so3573620f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492385; x=1781097185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uIGJv06tp2fYr3qME+4/5ks9JXN0Cpu9SA6dXG0aL4=;
        b=RtMZisb8miVNmR5p+Ritfmb05CzU3HJKqdYVj2pmUvrapa9YNH1LGW26uRXgBUVy9C
         itCB+mcQtYS6vKTGE712c2tdptw/fbMapY5y6PVE7syC+Ia2KUH3M+DRAdpZNOrVD5Jo
         9rOuC2gciDAhPf0QbBO3zL/X4Y/V+oixtTVkE9m3qjHfIPP2/SzC2uWXmrGn1NGIg0Tw
         PbJIAoAjSf20tnJAXb0u2S7ulRrkrxhbMAQRBOYY6N4xpM6Kcm3mXDylE4Vx0FMYcE89
         p5ZLR+1dCbRAI7PyzceUdwM1dCc+TGczBT9PVvAs/ZsOWYN+f3xymSswb3qiDMpTlN6y
         3E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492385; x=1781097185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0uIGJv06tp2fYr3qME+4/5ks9JXN0Cpu9SA6dXG0aL4=;
        b=P5Xckm1aIBX01SOMy5Dk7x7igPQ5Ol8b6KLKMO/TJGyMFBAOCcyN5qwtV9PhjWBMXA
         MdOg/R5i2jbHV99+riOTDvTNORQOLpFEgiiBarCbx79vu4L98NFNsGKRe5fh8mjPrD+s
         Vn5MTpFGLir2BxJTy6BS2EKV2CrkZZa9nGAD2AltSuYF6j3/yaLHLuHBj77ddClzerJJ
         i872VqqJzByhJgw5zXE+lSQyTPwfaXw9fJoJ4EY6rCsB6gKjoE6DXsUt8oi3ywiSwEF9
         VBCO82rNATzBHX0ZGUCn6Liz8xNHf2maKnZVu5Y5S405O3wl+aAPZPJPELmGblU8vICx
         Dgdg==
X-Forwarded-Encrypted: i=1; AFNElJ/yrsZ6Krd/L1HhCsApH55rYD+TjDbUnIt/tdwaClh1UmN4rLr7l8f+e37Nq+PStGk1FxqWD5Y7Iqs4Ijlg7Qle@lists.infradead.org
X-Gm-Message-State: AOJu0YwjR70nTHRMVa84pUzgf5HPM1yz0V5b/nHOjV9BeCB5B/+Db2nw
	Dnv0xpiIUcLif9K6OBMegbHVBO2ChhOZTFGOpu/XeHXFZkQAbyTYhQop
X-Gm-Gg: Acq92OH+S9QIngPrd8tPuEMNmxbSa6vB1lna+gbc7CLB+8dQXcuMXDbotNlHZdJGXYT
	OL41ox5GykBh1r3VNn6NZ4bVRZtGaJogf1BEy9hBMS6Ei7/+hRU5a4DcBOWVJSRTz4J22nc2Uw+
	BYAI/9ZEY4irX/kjH6wf2mslSln8KSFfSoH3qUfJ9qjQAzm4klcvwOXKNY1jZ39KVuTDaa4wpg/
	tm4/JQsHyNC8jyJVerXa+8hlmoqeBYQJEbnTCqelRzOeqoFjBVGIkMKgIQJf7s63gXc5OTkgcHt
	C/NnGLjq/wHqlFijlo2tKWwpx7RGYmGmzdvGFPAGYvH1cE1sjCBqBjOUW/klMYVoBBy218maB9g
	tH2mI7axfUwzck/DLsFrS275L80T41c8mtweC/sXKRMfrc6eLiS4ev98pZOeijzgleQtYEEUL8z
	BdeWuRbhAzloDvkkS9rGWeyXg2/dC8CuqJVdpb0OwjifR1sHMi4wNFYT7qVKiYoE7fxZlEcyAOZ
	UfRsypavoCdBpoFDLIfP+jzDz3s7cJTT1BkbYZbEMEIUmpt
X-Received: by 2002:a05:600c:1989:b0:490:b9fe:e64a with SMTP id 5b1f17b1804b1-490b9fee832mr34646215e9.2.1780492384590;
        Wed, 03 Jun 2026 06:13:04 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:04 -0700 (PDT)
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
Subject: [PATCH v2 10/12] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
Date: Wed,  3 Jun 2026 15:12:48 +0200
Message-ID: <aeec2a409aaf8e80d882fde9af76a181dea072bc.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061306_649927_B96C043F 
X-CRM114-Status: GOOD (  11.50  )
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

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 98aea97e9438..91d24110a283 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -193,6 +193,14 @@ pcal6408: gpio@21 {
 		reg = <0x21>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3


