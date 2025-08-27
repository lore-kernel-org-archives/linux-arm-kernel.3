Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5521DCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 05:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oixCpq4frQkHJU5kPDWHHO8FnB0bWWAyMSsLl8RP6Q=; b=GoOMsuE3jPt9wa5pdChyGkSqOm
	tiO1oeWQiIVhdO0kXUkprHwvhG1FzdWnbQHQWv4lU/kzajimJZ1TiNetQXakRywZwyeb508YM3WH4
	60zlXLMqhZ/UYzwOtbad/xAZUhqkmUalTMkScc+OC54a6JXo9HfHvmBLBQroWpQGaNPzCzBVrtRn/
	4Rzkqz/TY1Qi5GQhFg1fGnIan6J4oUqWeL9lDqHwB7CstoHMZVvBBKaZRR2yVdNjm+2C0MaSe/Ovd
	aLNr7fWBqD4tr74oovKXEcO8nTj2ZBKD+0jyGq5tH6cSvnoIIYw5L1tocc5xHtRc92n/ddK6h5ibp
	MowOuTbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur8IN-0000000E3gR-0QRK;
	Wed, 27 Aug 2025 05:02:03 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur8Fe-0000000E2yn-04lR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 04:59:15 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250827045907epoutp01bb60334f83ccf6a7221e9eee35847c1f~fhvChLeA50518305183epoutp01e
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250827045907epoutp01bb60334f83ccf6a7221e9eee35847c1f~fhvChLeA50518305183epoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756270747;
	bh=8oixCpq4frQkHJU5kPDWHHO8FnB0bWWAyMSsLl8RP6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qqeX1/48myY0kVClgM04MOHYWrhW8F/qrchPTWqSl6c4kWaC7c3nNK90Z1jSVzLnl
	 ekDDPBcjuFdjGAI1eABnCrmT2+XuXWT3WEu2qkDJs57VKik1fcxhGntrE1g0/ZP1Ga
	 NTa3VzzLbipMV2op+0JBsXeCfgJ9exYCXlcTpNLw=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250827045907epcas2p14cd817aeb803e37481873e88e923355a~fhvCCg1GE1186511865epcas2p1f;
	Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cBXPQ25Hmz3hhTD; Wed, 27 Aug
	2025 04:59:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250827045905epcas2p4b2cbd4b881af1c1be4b345861d1a635b~fhvAflIe82320923209epcas2p4t;
	Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
Received: from mclaren.dsn.sec.samsung.com (unknown [10.229.9.108]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250827045905epsmtip2009f0b11b3909a6cc82fa31a646beeb5~fhvASaS5H1855818558epsmtip2h;
	Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
From: Kisung Lee <kiisung.lee@samsung.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Mauro Carvalho
	Chehab <mchehab@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: Kisung Lee <kiisung.lee@samsung.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: soc: samsung: scaler: exynos: Add
 ExynosAutov920 compatible
Date: Wed, 27 Aug 2025 04:47:17 +0000
Message-ID: <20250827044720.3751272-2-kiisung.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827044720.3751272-1-kiisung.lee@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250827045905epcas2p4b2cbd4b881af1c1be4b345861d1a635b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250827045905epcas2p4b2cbd4b881af1c1be4b345861d1a635b
References: <20250827044720.3751272-1-kiisung.lee@samsung.com>
	<CGME20250827045905epcas2p4b2cbd4b881af1c1be4b345861d1a635b@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_215914_547441_C51F84C0 
X-CRM114-Status: GOOD (  13.69  )
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

Add samsung,exynos5-scaler compatible for ExynosAutov920 SoC.

Signed-off-by: Kisung Lee <kiisung.lee@samsung.com>
---
 Documentation/devicetree/bindings/gpu/samsung-scaler.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
index 9fb530e65d0e..5a472e29dc8a 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
+++ b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - samsung,exynos5420-scaler
       - samsung,exynos5433-scaler
+      - samsung,exynos5-scaler
 
   reg:
     maxItems: 1
-- 
2.25.1


