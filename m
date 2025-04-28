Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8871C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gv4uEOrX8a41Yfxl0MxRIvO3aeY5474RalTWjyT+BM=; b=yzy7o0U7BLpJvLIWbk+wiT7B4M
	T21kD7gtNQFZI/ebcN5XmIHvnKfPsT99f14qjwDkPeCFeiStaWmwPlCvpiJxPTK2/m8rNAAKjGUEW
	r2g7c5191chUhezD+Al9sJgn/QorudJV0/kPnLssNKQSfRatOMf8g9g9sRHLj7Ijn92Gznx/LFYwV
	NaAWcHIimSSd3kG91pqvVPcDcOlfARnGrMVTGsxYQtTdP0V2eeME0cJMW7e4cuSiWsqTTjSzo5CL5
	CVzvJ16xUwV/S2G79hiwUkpcVbxS5XiF4UlAVjfBIhWAPALYXzSeXow5WAQuxGy6oLq8pMRhLRwMU
	bMqUBvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NKw-000000067YV-04LC;
	Mon, 28 Apr 2025 12:11:50 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MmK-00000005ymI-24AY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:36:06 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250428113600epoutp03ff4ff4654f65212ec562beaff7188014~6eGBMq2-r1030410304epoutp03Z
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 11:36:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250428113600epoutp03ff4ff4654f65212ec562beaff7188014~6eGBMq2-r1030410304epoutp03Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745840160;
	bh=6gv4uEOrX8a41Yfxl0MxRIvO3aeY5474RalTWjyT+BM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vRgzEaBP73Dp8FhQQm6QxARBTSOAH/NY4Vup4jOCDreo3MOTqNpwK6fgCWp7+5+vE
	 R1DnT0FGDbZ/FtDVmc7F85xSUP7SFyjqxYGxANFqWpzjTSL8OIBcRObJNYGJ8vptGR
	 AfCOB91Yub0CDOGNnPbkWCzzE8/uZXNiNZ5w1Iu0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250428113559epcas2p421002f868cee309ec0ef37dd36514125~6eGAhanxO1115111151epcas2p4F;
	Mon, 28 Apr 2025 11:35:59 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.70]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZmLxC3gNnz2SSKY; Mon, 28 Apr
	2025 11:35:59 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250428113558epcas2p1f2980cbc58f71dde78a9529e2b85ac20~6eF-dv7n10617306173epcas2p1-;
	Mon, 28 Apr 2025 11:35:58 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250428113558epsmtrp234b4e537bfd411e0a293c32f6614bbd5~6eF-c5Uw71223812238epsmtrp2e;
	Mon, 28 Apr 2025 11:35:58 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-da-680f681e748c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	14.F1.08766.E186F086; Mon, 28 Apr 2025 20:35:58 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428113558epsmtip1a3203238fb3cd4edd2117db4665a4af2~6eF-KifOl2456424564epsmtip1M;
	Mon, 28 Apr 2025 11:35:58 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] clk: samsung: exynosautov920: Fix incorrect
 CLKS_NR_CPUCL0 definition
Date: Mon, 28 Apr 2025 20:35:16 +0900
Message-ID: <20250428113517.426987-4-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428113517.426987-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnK5cBn+GwcMrChYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYjH5+FpWi6Zl65kc+D3e32hl99i0qpPNY/OSeo++LasYPT5vkgtgjeKySUnNySxLLdK3
	S+DKeLIjtGANV8WsNpcGxpscXYwcHBICJhIL1uV1MXJxCAnsZpT4/+AEaxcjJ1BcQuLwjAmM
	ELawxP2WI2BxIYH3jBIT26VBetkEVCU2/ZYH6RUReMsksfz/ASaQGmaB04wSO8/IgNjCArES
	nadmsYHYLED1X568B5vDK2Al0Xl1OwvEDfIS/R0SIGFOAWuJTxfXMUOsspKY8PgMG0S5oMTJ
	mU9YIMbLSzRvnc08gVFgFpLULCSpBYxMqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcx
	giNDS3MH4/ZVH/QOMTJxMB5ilOBgVhLhrTLgzxDiTUmsrEotyo8vKs1JLT7EKM3BoiTOK/6i
	N0VIID2xJDU7NbUgtQgmy8TBKdXAVGv0eVXygxRvYZWX3zcFngm/vnXrnFzVksuBJxYdWVF+
	lMe79F75jSy/gykW6cv+PhP6Kdstd3/hi52abz5pr99zyou105BDzCXl95IXKlP79vsZnHpW
	Y5d5jk/7iVh78P4dIjcidGw37xS5OmFR55Eb1xp8D//Jf8PwMfJlq6T2lU2P9pVP+O2bcLa0
	6EwgY5W23vf+ypWtpdNnds5/bL9CY0u7TdgT7f6+yle5vHdvu/Pvj7FKd98pbnx623pj06Nv
	yjhvRTPWVq8qZ25VFtF5PbWjV57r09Q5LE7rmHeeD65675Tbw7dyiWXJHYMM5YL/ky48Yryo
	YJ7f+jBKJ9bs5PQbzFpvDy894rr2vxJLcUaioRZzUXEiAM0fvPv7AgAA
X-CMS-MailID: 20250428113558epcas2p1f2980cbc58f71dde78a9529e2b85ac20
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428113558epcas2p1f2980cbc58f71dde78a9529e2b85ac20
References: <20250428113517.426987-1-shin.son@samsung.com>
	<CGME20250428113558epcas2p1f2980cbc58f71dde78a9529e2b85ac20@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_043604_855833_316D72F1 
X-CRM114-Status: GOOD (  16.78  )
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

The CLKS_NR_CPUCL0 macro was incorrectly defined based on a wrong clock ID.
It mistakenly referenced CLK_DOUT_CLUSTER0_PERIPHCLK, which corresponds to
a cluster peripheral clock, not the last clock ID for CPUCL0 as intended.

This patch corrects the definition to use CLK_DOUT_CPUCL0_NOCP + 1,
properly matching the last clock ID for CPUCL0 as intended.

This error was due to confusion with the hardware diagram, and this patch
ensures that the number of clocks for CPUCL0 is correctly defined.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index c1b0203b8cb4..f8168eed4a66 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -18,7 +18,7 @@
 
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP			(DOUT_CLKCMU_TAA_NOC + 1)
-#define CLKS_NR_CPUCL0			(CLK_DOUT_CLUSTER0_PERIPHCLK + 1)
+#define CLKS_NR_CPUCL0			(CLK_DOUT_CPUCL0_NOCP + 1)
 #define CLKS_NR_CPUCL1			(CLK_DOUT_CPUCL1_NOCP + 1)
 #define CLKS_NR_CPUCL2			(CLK_DOUT_CPUCL2_NOCP + 1)
 #define CLKS_NR_PERIC0			(CLK_DOUT_PERIC0_I3C + 1)
-- 
2.49.0


