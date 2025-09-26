Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69044CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 07:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Po68KLFilpwQWxw9CyNZz80qkVt9zVydR1HkDC6YYQ=; b=ovzOj+g7OcI59p4KyHssc5B0Vn
	fR63xnHvvG3C1hQ3TttloHCoNKpwfBvC1ZBJTctxGNp7wywfMfW6e8KyR2UokjNw7mu4kQefAHN6d
	3LI0aL+TTHy4iNBxN1ho98pXd2KJhe9xBate04b7y3lW/caBE0Ut3M0a7WOTs9zztLk+nZ/WNABEw
	JOmSrzfKdMDYM3nJgY+h9JMBPx53aSoX3gd1ZndBBIkYqS3IYf7WODjZx3mJq8xqiTZ+/Mv87gh6u
	ULANePTOJeDgFEGSzag7vNMohjboWwwMyPQ4X095P9R6USZ6JR2rG0IyJZnfqoYhB853QvNMDxhMq
	Sb3E2VXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2340-0000000Grn3-2AFW;
	Fri, 26 Sep 2025 07:40:20 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v233x-0000000GriK-0REh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 07:40:18 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250926074013epoutp037e1bc32caa77b2c1f5b09b42d4ca697c~oxSQ3ToWe1383313833epoutp03n
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:40:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250926074013epoutp037e1bc32caa77b2c1f5b09b42d4ca697c~oxSQ3ToWe1383313833epoutp03n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758872413;
	bh=4Po68KLFilpwQWxw9CyNZz80qkVt9zVydR1HkDC6YYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y/KbEVBjmokg4+rbkbl3LnNgD+ybwZi0ZJHpJWYRAn4PRB/rmdlxP9hji9hz0Z+tE
	 flK4XM4SjHwWetBjYBgRu649Vul9FOjF+y+6O8+mGpEcFHDy0DEjetNqZKWmFDfp7r
	 nPhS43qc8OwIkg8ZsSrXypEHjsIXE6FbTVtkvf5c=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250926074013epcas2p329a4df283d64467842604511dd0aebfc~oxSQRMzSv1530715307epcas2p3K;
	Fri, 26 Sep 2025 07:40:13 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.100]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cY2YS2nM0z6B9m5; Fri, 26 Sep
	2025 07:40:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250926074011epcas2p438f7edb31c720c0950e9df986983f5a5~oxSO-KU-m1317313173epcas2p4B;
	Fri, 26 Sep 2025 07:40:11 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250926074011epsmtip2f18560c1e912ca2ce076f493e09534a4~oxSO31j4l1189111891epsmtip2G;
	Fri, 26 Sep 2025 07:40:11 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org, m.szyprowski@samsung.com,
	jh80.chung@samsung.com, shradha.t@samsung.com
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	sh86.bae@samsung.com
Subject: [PATCH 1/4] dt-bindings: soc: samsung: exynos-sysreg: add hsi0 for
 ExynosAutov920
Date: Fri, 26 Sep 2025 16:39:16 +0900
Message-ID: <20250926073921.1000866-2-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250926073921.1000866-1-sh86.bae@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250926074011epcas2p438f7edb31c720c0950e9df986983f5a5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250926074011epcas2p438f7edb31c720c0950e9df986983f5a5
References: <20250926073921.1000866-1-sh86.bae@samsung.com>
	<CGME20250926074011epcas2p438f7edb31c720c0950e9df986983f5a5@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_004017_300039_11EE64B9 
X-CRM114-Status: GOOD (  10.51  )
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

Add hsi0 compatible for ExynosAutov920 PCIe settings for:
- PCIe PHY power control
- PLL settings for PCIe
- PCIe device direction (RC/EP)

Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d27ed6c9d61e..a44fd24ed0ea 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,7 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynosautov920-hsi0-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
               - tesla,fsd-cam-sysreg
-- 
2.45.2


