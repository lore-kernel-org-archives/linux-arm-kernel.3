Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886BCC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+ayVJwgciizVxsr+RL6VH4988L9AOyityEB6YdMCKU=; b=TXDFL3e93O+pycYZtlcarya+zF
	jtRZOwban9pASSWFw/mBPDGDu8rjPXG4xfEshPQp+LDTATjuX3n+qRFZ1GH6FZkXDyZfOaPo7UlkP
	Sx8FvAWx9kowDnu9o1bvbyjVfaK6f4Xqs/LblMvmwkENnmIIwSopGeH+efF8+ecb9uUnxdtatciQX
	/2REQcnXHei+ACsD0TuwqLvkSdEZ9cU6Wtwnn2tkj0VZ1nGULzBHhuYz5K/uwF+cRastKIo7aqCrU
	+qNvqsVjB8BPbhUX4zhguzkKJLm4BLVOBGlUJeWc2v8lRB/k6U42t5pWOPPZHC9DcYlrNMfvHrTR/
	4co58Ljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujybi-00000000Lb7-1U8d;
	Thu, 07 Aug 2025 11:16:26 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyFn-00000000ILR-0m5u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 10:53:48 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250807105345epoutp03926b00c6d2dda476c85ea7bbfe1c2c72~Zdq9eb53p1046010460epoutp03N
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 Aug 2025 10:53:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250807105345epoutp03926b00c6d2dda476c85ea7bbfe1c2c72~Zdq9eb53p1046010460epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754564025;
	bh=D+ayVJwgciizVxsr+RL6VH4988L9AOyityEB6YdMCKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MYMpeRqxLIp4U/ePo3KYLiJXIbB9VxxK0Nj6+bBo0Oe9078w2kFyeyy5fj1FubINF
	 oVMbKf0ljLJVrMM4KyEOs8mGk3Ab5JfpjDSZ9YXl6gitaoKfi8PSAxha/VPtKhp8pz
	 vN9EUZLxi7LU/2zIm4eenNOUO48pWMRshxhGKWbk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250807105344epcas5p187b2c5cd75d7146e99e48dbde0863b72~Zdq8717_o2390623906epcas5p12;
	Thu,  7 Aug 2025 10:53:44 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4byPCq65ngz6B9m5; Thu,  7 Aug
	2025 10:53:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250807032525epcas5p42f764c0b2af23d0e47e853fc5707cb46~ZXjg9yEDk0583105831epcas5p4H;
	Thu,  7 Aug 2025 03:25:25 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032523epsmtip2831067472ba6dc46cb11960543bc4c44~ZXje91v-r1379313793epsmtip2j;
	Thu,  7 Aug 2025 03:25:23 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 09/10] dt-bindings: media: s5p-mfc: Modify compatible string
 check for SoC-specific support
Date: Thu,  7 Aug 2025 08:54:48 +0530
Message-ID: <20250807032449.92770-10-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032525epcas5p42f764c0b2af23d0e47e853fc5707cb46
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032525epcas5p42f764c0b2af23d0e47e853fc5707cb46
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032525epcas5p42f764c0b2af23d0e47e853fc5707cb46@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_035347_535317_CBDDBC7C 
X-CRM114-Status: GOOD (  11.14  )
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

Modify compatible strings in the s5p-mfc binding to reflect
accurate SoC-specific naming across multiple Samsung platforms.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 .../bindings/media/samsung,s5p-mfc.yaml          | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml b/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
index b46cc780703c..6a711c8103ac 100644
--- a/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
@@ -20,15 +20,15 @@ properties:
       - enum:
           - samsung,exynos5433-mfc        # Exynos5433
           - samsung,mfc-v5                # Exynos4
-          - samsung,mfc-v6                # Exynos5
-          - samsung,mfc-v7                # Exynos5420
-          - samsung,mfc-v8                # Exynos5800
-          - samsung,mfc-v10               # Exynos7880
+          - samsung,exynos5250-mfc        # Exynos5
+          - samsung,exynos5420-mfc        # Exynos5420
+          - samsung,exynos5800-mfc        # Exynos5800
+          - samsung,exynos7880-mfc        # Exynos7880
           - tesla,fsd-mfc                 # Tesla FSD
       - items:
           - enum:
               - samsung,exynos3250-mfc    # Exynos3250
-          - const: samsung,mfc-v7         # Fall back for Exynos3250
+          - const: samsung,exynos5420-mfc # Fall back for Exynos3250
 
   reg:
     maxItems: 1
@@ -133,8 +133,8 @@ allOf:
         compatible:
           contains:
             enum:
-              - samsung,mfc-v6
-              - samsung,mfc-v8
+              - samsung,exynos5250-mfc
+              - samsung,exynos5800-mfc
     then:
       properties:
         clocks:
@@ -152,7 +152,7 @@ allOf:
         compatible:
           contains:
             enum:
-              - samsung,mfc-v7
+              - samsung,exynos5420-mfc
     then:
       properties:
         clocks:
-- 
2.49.0


