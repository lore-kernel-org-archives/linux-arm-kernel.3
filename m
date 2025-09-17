Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20309CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=i/pN2d16gN/aOiyBlIWmhnSKwC/rb7+GOnUl5obF2Jc=; b=dY/LkFbsJTu1+fL0wJcAuM+kuS
	Kj1P0yzH2FDHYtf0e7jR9n0jsAmI31EuNgyo2MuhhRtlpP0KfU4OdQWR1XqfzayA++IKRT8x/DlJZ
	isGKsdZI+cnFs901H4nYVtbJ1M/xkM/BNAeHHQEnkagYBCz6LtoYSJRwjfwK/lTj3M0bHwIhlsJxN
	I+ihbDrbIVJ+nu1rCm6oPiXVAx39zSHcBwocf3SOLaBBmLGbJhRMK2NG+3v0lw45yF6uNFVpAcFHF
	btNp1gF/x0fx+wwIINkwmIebvyW1sZ3UtZnEwwk1c0+1bNaaaHGPQlizlWIp4eaX4d+UAN9S4INkA
	ggnQcDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymM7-0000000AQQf-0agg;
	Wed, 17 Sep 2025 07:13:31 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymM4-0000000AQQF-0id6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:13:30 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250917071324epoutp03941c69ed4b8cc30a39ef80f351394111~mAHReMiue0318603186epoutp035
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:13:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250917071324epoutp03941c69ed4b8cc30a39ef80f351394111~mAHReMiue0318603186epoutp035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758093204;
	bh=i/pN2d16gN/aOiyBlIWmhnSKwC/rb7+GOnUl5obF2Jc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Xykv6jajixf7eQQ/VvuNMThZgMxenMfG2p8egUqJeyaTfwlhG5jw+t7pWQ1mj9OlV
	 mXEvwCD7kmO4SQFmXMquenAQek3zC3fgzCAE+mKh0j2dMaqYsaMuIXUM4nRl25eC+0
	 gJ/ruKwhFhFDezcav4ipstQjr/oynK55XU4GFnzQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250917071323epcas5p1ad55db6b7f1c81762373e30093eb8b29~mAHQ-S9Rf3046930469epcas5p1b;
	Wed, 17 Sep 2025 07:13:23 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cRVNf4y3Nz3hhT9; Wed, 17 Sep
	2025 07:13:22 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250917071322epcas5p3b25ff15ee16f58aa3101f2fc44b554cc~mAHPbtPBs2147421474epcas5p3T;
	Wed, 17 Sep 2025 07:13:22 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250917071318epsmtip197b5a7d162ae47ea3d9d1223e43d5864~mAHMMaGiw0529705297epsmtip1C;
	Wed, 17 Sep 2025 07:13:18 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	krzk@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	ksk4725@coasia.com, pjsin865@coasia.com, gwk1013@coasia.com,
	bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
	lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, swathi.ks@samsung.com,
	kenkim@coasia.com, Ravi Patel <ravi.patel@samsung.com>
Subject: [PATCH] dt-bindings: timer: exynos4210-mct: Add compatible for
 ARTPEC-9 SoC
Date: Wed, 17 Sep 2025 12:43:11 +0530
Message-ID: <20250917071311.1404-1-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250917071322epcas5p3b25ff15ee16f58aa3101f2fc44b554cc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917071322epcas5p3b25ff15ee16f58aa3101f2fc44b554cc
References: <CGME20250917071322epcas5p3b25ff15ee16f58aa3101f2fc44b554cc@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_001328_860526_F94E9B44 
X-CRM114-Status: GOOD (  10.90  )
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

From: SungMin Park <smn1196@coasia.com>

Add Axis ARTPEC-9 mct compatible to the bindings documentation.
The design for the timer is reused from previous Samsung SoCs
like exynos4210 and ARTPEC-8.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index 10578f544581..a4b229e0e78a 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - axis,artpec8-mct
+              - axis,artpec9-mct
               - google,gs101-mct
               - samsung,exynos2200-mct-peris
               - samsung,exynos3250-mct
@@ -131,6 +132,7 @@ allOf:
           contains:
             enum:
               - axis,artpec8-mct
+              - axis,artpec9-mct
               - google,gs101-mct
               - samsung,exynos2200-mct-peris
               - samsung,exynos5260-mct
--
2.17.1


