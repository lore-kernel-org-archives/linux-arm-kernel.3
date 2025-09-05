Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46428CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJD/glqqVPAbqFKdjl/N/YrzUzP6uBCpQtLsG4jXb+0=; b=mH6nfRoyBg97mOyMxjla8zByPk
	+cKotZ0BOSEr01Y8ANoTRNFYy7hSalBGWrD0d28kfkXToIngPquEvyzJ38Yv06+V6a4TkDCTxYfDC
	i+UY1VN5CBv2vduqapUw2YH3cuuf0xOyW6wQhDOhW7xbu8ymgvoH90EaxAPzJKXhbSlJXo5UtHP+j
	RZc/VlKX+k6UV9sdiAigYLU3i9xoaAtHjYtVVZ/S60FXFc91hS3nN0akm2fF7403xDKj21OkQMSfx
	gZ28OcYrXzLuP1nJYu6x66kC7XtOnK79VEMOUYp9sJ9qsup88LYDFwzT8AH0Ddjn0mPRNrY+Ba61G
	na4r8RdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXYb-00000002OgU-2pLk;
	Fri, 05 Sep 2025 14:36:53 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuU87-00000001DHb-2hQA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 10:57:23 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250905105712epoutp0301c8d6b4ff6be74f92a91771eef9eddd~iXbQG3SGz2303223032epoutp03Z
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 10:57:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250905105712epoutp0301c8d6b4ff6be74f92a91771eef9eddd~iXbQG3SGz2303223032epoutp03Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757069832;
	bh=qJD/glqqVPAbqFKdjl/N/YrzUzP6uBCpQtLsG4jXb+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C3Cy+9n/uklU9Di4eZN5DibPU851q1xpx8CoAzByIZTyXsCQBaP0DcN4HU2MmWfpd
	 ssAxJgNyjhKD5AjLeBVLecHIPB7s1lkio9kcJ4dqt29LA34EWXtZXTGD93gCDIfudR
	 tCn+u8KF/WU4qMxxZAFZQLDmk4W9EiOXS6Hy81/A=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250905105711epcas5p4a6a8fa6a9a2ecf20b1b1cf1ce26e905d~iXbPjhsFA2254422544epcas5p4y;
	Fri,  5 Sep 2025 10:57:11 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cJCwQ65Myz6B9m6; Fri,  5 Sep
	2025 10:57:10 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250905105710epcas5p10516745944f09e262f41a5e5dcfce5f8~iXbOCGQz32174421744epcas5p1c;
	Fri,  5 Sep 2025 10:57:10 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250905105708epsmtip243c001c810412d90b37b72a2aca06f3f~iXbMURmgC0714207142epsmtip2A;
	Fri,  5 Sep 2025 10:57:08 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	henrik@grimler.se, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: rtc: s3c-rtc: add compatible for
 exynosautov9
Date: Fri,  5 Sep 2025 16:35:52 +0530
Message-Id: <20250905110554.2212304-2-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905110554.2212304-1-dev.tailor@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250905105710epcas5p10516745944f09e262f41a5e5dcfce5f8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250905105710epcas5p10516745944f09e262f41a5e5dcfce5f8
References: <20250905110554.2212304-1-dev.tailor@samsung.com>
	<CGME20250905105710epcas5p10516745944f09e262f41a5e5dcfce5f8@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_035721_752654_2FEE79B7 
X-CRM114-Status: GOOD (  10.33  )
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

Add "samsung,exynosautov9-rtc" dedicated compatible for
on-chip RTC found in ExynosAutov9 SoC.

Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/rtc/s3c-rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml b/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
index bf4e11d6dffb..5daee2a5f866 100644
--- a/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - samsung,exynosautov9-rtc
           - samsung,s3c2410-rtc
           - samsung,s3c2416-rtc
           - samsung,s3c2443-rtc
-- 
2.34.1


