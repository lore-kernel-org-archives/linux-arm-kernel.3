Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73344C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 06:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4l+MDSTZ2r2HMz/v67DtIs5pH+NnoP/SjYH2EZLuoY=; b=ur+AB+iDMDjDLPFIexQ1LngIUw
	ltV8HwDNtPhVHf2+wymqS4GpjXe09M214/Gf/tnVkh4Nf3E4LJavQBO+x9fmkP8XGyOzYzbv7M8lq
	WKdrFyhSCIQMykIIZI0aifratWm6r2V0r94W5ikVWHEA7wkPoavVHCEhy/F3Wt94esfy0HXEcHwGj
	ADKMhazzEtk0ZBA1wOVa6ug5yPtkl3prcXwrNCE7A0SPBl2kWM1QCwPHI+lFM/k4yAPVjpi0aDoi1
	ae2vAnxZ2/Up6V4gRYqIboTIFr5OFhQVZuVn1gCuUJUPSoWX+ke7gCbR8jed5YyCTyQ6C2PAUB0vw
	rgPHeeTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7R0-0000000DsTX-47VY;
	Fri, 11 Jul 2025 06:40:38 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7MQ-0000000DrXr-0QYI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 06:35:55 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250711063551epoutp02749606dbf0737b71067aa1b2d253fd2a~RHvFJ3txd1888718887epoutp02H
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 06:35:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250711063551epoutp02749606dbf0737b71067aa1b2d253fd2a~RHvFJ3txd1888718887epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752215751;
	bh=z4l+MDSTZ2r2HMz/v67DtIs5pH+NnoP/SjYH2EZLuoY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rrFWc25Gnv/aHcMO8P2jNKyT9abbDHxg5+Kgm1MnN3XfxbtloZWfnvABqg/7grriv
	 s7SUT6P12iaj8bTJC9M+wcuejOpVCwuQMglzgI4jtrLZ/E1p2DR/Jpap/mGedF1/Uo
	 swn3Ok4aBh4Ckv7UlU2MiQGaKUkQRMlvi0pRT1Ts=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250711063551epcas5p298c51dca665271d9789048adfd7f6fd6~RHvEpdVV73228232282epcas5p2Z;
	Fri, 11 Jul 2025 06:35:51 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.176]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bdhmj1dqXz6B9mT; Fri, 11 Jul
	2025 06:35:49 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe~Q1ll7N7pz0133701337epcas5p4n;
	Thu, 10 Jul 2025 08:25:34 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250710082533epsmtip13f65bde4bd8338ecd91d21a7064e403c~Q1lkcI3pM0630306303epsmtip1V;
	Thu, 10 Jul 2025 08:25:33 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, alexandre.belloni@bootlin.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH v2 1/3] dt-bindings: rtc: s3c-rtc: add compatible for
 exynosautov9
Date: Thu, 10 Jul 2025 14:04:32 +0530
Message-Id: <20250710083434.1821671-2-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710083434.1821671-1-dev.tailor@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_233554_296338_761B4A15 
X-CRM114-Status: GOOD (  10.60  )
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


