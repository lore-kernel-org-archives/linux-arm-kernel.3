Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE1AC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 19:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UY5V4769IH4Ej/gBFK5P/RDOlj2xF6MyPqJ3qhvhir4=; b=qIMibJXKPfjcwe6x4/SHBiIAcQ
	PBEvR2v3b7DWTDp457kWyDoxZ9g63QZG4gdRczW5PgD7XuYOvzOoU2aqXAGda7y+SeBjQij6DS2HG
	0krU4LzkUXlgu+mislIFOz7FQBFcIMq6o1488GA5vl7Hm1tTyj33A9F52bl3lEkkALDwDjz1Jkp8w
	Mk7W6c5vUkoSXZ+KI7242D2ull8BL+LI6lXP5YcEOfuHjDG4FBdflXHpB6ngK4Dys5ePi73mmDG0i
	brIHVXtHDLalIw58z1G2uybZBQp6fMm0AM3vdb5klna25ZsDX2cAzMWYbPDmwu0ZGU6/JqNVj6V4Y
	XrIbqzCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fCn-00000007fQ1-18Jh;
	Mon, 07 Sep 2026 19:40:37 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fCl-00000007fPg-39Qx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 19:40:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2d032846c95so42314755ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788810035; x=1789414835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UY5V4769IH4Ej/gBFK5P/RDOlj2xF6MyPqJ3qhvhir4=;
        b=MuN8+Ebl3rxLp6VOep1eMb3hOXVKbPT2a9kxDzJb2GltvHzRo7pPlQ9/RZbzbI6HPV
         ++lbmeSbXe79fdr8mzy9M9InzFVeqL+G0c9Va6oM2mwqbGKIEiC7LpGY1cuQLxsuvp70
         kZQXxsPzgbgpWlHkLgdqL3oF7WXmYM9kY0ZREliE4io21KYKWrZnhZcqjKfJbMJeb103
         oEUzlLcoMxFyWgosWjFnU4fomYic7IJ84ZrLdhTdLgO35CkGwSpBSdhLCN2nvDyn8PrR
         wojiNqTciaIJ8MeaMQTitdQj1y7FumOIu1aJWMmrOKCJdFiPqu3DWpjJqALs75nnMRVD
         iI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788810035; x=1789414835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UY5V4769IH4Ej/gBFK5P/RDOlj2xF6MyPqJ3qhvhir4=;
        b=Qh7a6xLJ/NdGjgJJRZLeJXdxhj9QAd64+EYsa2tG4wP8pA4CRnLsX/J3Q94XpfvTNT
         pVAuquwHTLesiXkmfC1X59kqUB+RrYpModEU6yR0WDWFTFZz+BXm9Kz9dL9v4G3Ftjr+
         6JzhqzYsuIDciJyZN8fmP5tzSqKF22hXqw8WcRr1+Ltc0x6Yyeic2Ze1RaP4rfen/uXa
         Q9DVwawJ25TsXWPR8CDrwR1ME7SBL/1Q6OwXimWJWiMg+wYyZb/b8/3+2zmVVW3ns543
         CBi+FjXgartv9fparK+Cps+HSTP8e0bFb149nIhWbuykNUsDJwazBoldwOlCMed8PKaj
         pr2g==
X-Forwarded-Encrypted: i=1; AKwUvBwNTjy1b2EBhV64VF4GaUPKuQ20B37s+EuRrbNH8pqnefMnxOwdY7ofkXiuC2ApFm7iMLbQyZbF+A9THneyETuk@lists.infradead.org
X-Gm-Message-State: AFuF++m0Kl/L1eIQnZHj9/W/9KwGCs6J6faK503RngiD2P0ZOUAcgvba
	c5LyushJWrbA1bp5XOpMo4J+nb/FQ2YI+qMH6mxr7z50HTnfuCsvA9LV
X-Gm-Gg: AYBFou32kx1kB68xsY21mHpjR0u0AYSI6Cb9QW2LLSNrZWfbTAoZAg0Q1a3y/hY1taR
	yy7qsXy5NLeCnVL1uAIaV93FNb9Gq1AE+4+4/xy6pPmim+5Q5cAaTW+le9CFUIKXqw7l41Jocu3
	9lcKpzP6Pq7K9OCF+HaLO6LAjtZZBzQWY2kT6zE9tXtb6D9vlSvNOX2tO2VLelynU3j0X3Su/+Y
	tyrR5Q4cs88eZgnwsLPHrlRxdSR4BoeoCW+StXQy2pwnT8bkANVPGnxDejzRSihSJSePjX/tJ+X
	1U2arO5F2/53oHvGcAzsVmUa1BMtPdS1wXSVYcXMD3CZc0aoC7RA0Sf2ULbDxnqHqsXXkWmAYcy
	tUmpG08IWWHi+vSV8vvoYz9X4KRSq8JYni/Zmt7qZ/oJ2rkEm/T3XbKHaqmqrJ7vikYrnYzqmS5
	kDv4fivhu25V+lXuYzRHiEJGDHFxSaqirR8HsM2HeNi3jxxeLj97Z2XWWZyAhQunnsbCfbuI7wK
	GrORXuNaG6diV4IOBidSnC+VwHPbGg5Ge0BRbo3qGfgz82bDUtbcu8oBUz5lzB/ctpFSPGSdrUQ
	YVoDmU7IxAg0W8pem84gkv3EFEA+P5+g/jGOvB8=
X-Received: by 2002:a17:903:22c6:b0:2db:7269:38ef with SMTP id d9443c01a7336-2db726939a1mr31543325ad.14.1788810034741;
        Mon, 07 Sep 2026 12:40:34 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497e9e5sm47901105ad.38.2026.09.07.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:40:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: AC56U: add nvram node
Date: Mon,  7 Sep 2026 12:40:32 -0700
Message-ID: <20260907194032.20042-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_124035_790249_BE422005 
X-CRM114-Status: GOOD (  10.99  )
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

Add it and set for gmac0, which is the only GMAC used on this board.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index c80ac16ad949..550cc67f5ba6 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -92,3 +101,8 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0


