Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA78C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 04:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDU5mSwIENMROE2c/THRi1I4cLbBTvRapiEmlKn5+P0=; b=GYvNybStRVwrKP+v0V9B6cS0En
	hpVHXHUO7TMcwP65ZD/JRf+CjCcl/1BM11WWcrF2LCatcf3+7bnMxElQ1ZMzb6CtBjNO/R4M8qsYT
	aw+A/fFLDiSIHhQvysAVd71Xx80v5qzdre4/oVvJxyneldTRxyYdOSMjh1v2/T4uqFtRiJSj8XccC
	FDsCCr1ZluY/3NlF0J0uWzh7yV2tYfhnqX5nqYtqOVzlJYtmG4UaTT623LzYDghdkS3pjnk7cA5sw
	oAOGLHUDLIgpSAnRcgdd+klvnm4slHqWLTxThikid11eKgdly/xfWFpCyL79Cv7fpli4Geto6Vpbt
	wDQaRmZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7S3p-00000009Cwm-3VpF;
	Wed, 23 Apr 2025 04:50:13 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Rvz-00000009C7O-34yK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 04:42:11 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250423044201epoutp01a20d1cb8e15f0e4f13587c0a8e6ed434~42OIkeLIe0720307203epoutp01Q
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 04:42:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250423044201epoutp01a20d1cb8e15f0e4f13587c0a8e6ed434~42OIkeLIe0720307203epoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745383321;
	bh=MDU5mSwIENMROE2c/THRi1I4cLbBTvRapiEmlKn5+P0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bGVrvnhVaO+A9rOaUbb/PVKNL4VaQkq7xEokIZazVMfCRi3nBXuz+jGwf+n7CotOJ
	 S3mshRiXZJDWn2yFzxYfNXxgYww6Bh90SJp9ASpg6/HMQ0RnjpoXt9tu/nr/f0F6n0
	 dkycplf2ZRe4rRh1bpPcvx2YVe+uCk6pQYPRt7JM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250423044200epcas2p16da050f303f2e1d9f40918334e3a36a3~42OH3N0Ed3184831848epcas2p1t;
	Wed, 23 Apr 2025 04:42:00 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.98]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4Zj5zr1fHtz6B9mD; Wed, 23 Apr
	2025 04:42:00 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250423044159epcas2p26a4d07552b5646c7e076f3989d8ea354~42OG3BRZW3023630236epcas2p2C;
	Wed, 23 Apr 2025 04:41:59 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250423044159epsmtrp2256fdcb9d71d512aee46cd285469b31f~42OG10lfz0544505445epsmtrp2N;
	Wed, 23 Apr 2025 04:41:59 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-0e-68086f97861e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	04.48.07818.79F68086; Wed, 23 Apr 2025 13:41:59 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250423044159epsmtip1d13252d2ffa850de0665b63f037a8aa4~42OGgaocV1228512285epsmtip1c;
	Wed, 23 Apr 2025 04:41:59 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: clock: exynosautov920: add cpucl0 clock
 definitions
Date: Wed, 23 Apr 2025 13:41:51 +0900
Message-ID: <20250423044153.1288077-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423044153.1288077-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWy7bCSnO70fI4Mg9sbxS0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLy8bWsFk3L1jM58Hu8v9HK7rFpVSebx+Yl9R59W1YxenzeJBfAGsVlk5Kak1mWWqRv
	l8CVsffcJ5aCqxIVEzeGNDAuF+5i5OSQEDCR2N98mKWLkYtDSGA3o0T7mQZGiISExOEZE6Bs
	YYn7LUdYIYreM0r0dK0G6uDgYBNQldj0Wx4kLiLwlkli+f8DTCANzAKnGSV2npEBsYUFIiQO
	3ACp5+RgAarvmbqTFcTmFbCWOLDvGivIHAkBeYn+DgmQMKeAjcTMhl1ge4WASiYv+cIGUS4o
	cXLmExaI8fISzVtnM09gFJiFJDULSWoBI9MqRsnUguLc9NxkwwLDvNRyveLE3OLSvHS95Pzc
	TYzg+NDS2MH47luT/iFGJg7GQ4wSHMxKIry/3NgzhHhTEiurUovy44tKc1KLDzFKc7AoifOu
	NIxIFxJITyxJzU5NLUgtgskycXBKNTAFzFnTFFdV0XM7udvBomTlrl6t6GtPbx1N97tka/Bt
	botFzYrLVl/K5fwT4l9+jFyTIXRqedIG4fPcGola9ZPLrSMZFj7/YdX2ZcNJWY+lN9bxnXQ8
	eS3GuOT+rVleu9vU5gsfKnp24m2nCb+vd+iTH/u6d4kHsKxxaLnzysOt6eXfCaszTx+ynnDh
	7rX7Ndm/002nHdF51/98drbv2xCdcPXs0PY/Dyu5q/RDDE/+4ZN+cK2u8/PeI4sibeeILvq8
	a//yF4Fud55sO+g5S1vGv2mTgtzlBYYbhR8tecnGXPh6dc1G/geTzHwSlklZ2FZtZ0yQqNS9
	uGDe2ktf33Nukuk1e3LMyWR3s4tql98lJZbijERDLeai4kQAceVmyf4CAAA=
X-CMS-MailID: 20250423044159epcas2p26a4d07552b5646c7e076f3989d8ea354
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250423044159epcas2p26a4d07552b5646c7e076f3989d8ea354
References: <20250423044153.1288077-1-shin.son@samsung.com>
	<CGME20250423044159epcas2p26a4d07552b5646c7e076f3989d8ea354@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_214208_407742_59E89A8E 
X-CRM114-Status: GOOD (  17.28  )
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

Add cpucl0 clock definitions.

CPUCL0 refers to CPU Cluster 0, which provide clock support
for the CPUs on Exynosauto V920 SoC.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 25 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            | 19 ++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index 3330b2727474..d12b17c177df 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -8,6 +8,7 @@ title: Samsung ExynosAuto v920 SoC clock controller
 
 maintainers:
   - Sunyeal Hong <sunyeal.hong@samsung.com>
+  - Shin Son <shin.son@samsung.com>
   - Chanwoo Choi <cw00.choi@samsung.com>
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
@@ -32,6 +33,7 @@ properties:
   compatible:
     enum:
       - samsung,exynosautov920-cmu-top
+      - samsung,exynosautov920-cmu-cpucl0
       - samsung,exynosautov920-cmu-peric0
       - samsung,exynosautov920-cmu-peric1
       - samsung,exynosautov920-cmu-misc
@@ -69,6 +71,29 @@ allOf:
           items:
             - const: oscclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-cmu-cpucl0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_CPUCL0 SWITCH clock (from CMU_TOP)
+            - description: CMU_CPUCL0 CLUSTER clock (from CMU_TOP)
+            - description: CMU_CPUCL0 DBG clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: switch
+            - const: cluster
+            - const: dbg
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index 0c681f2ba3d0..c57a1d749700 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -162,6 +162,25 @@
 #define DOUT_CLKCMU_TAA_NOC		146
 #define DOUT_TCXO_DIV2			147
 
+/* CMU_CPUCL0 */
+#define CLK_FOUT_CPUCL0_PLL		1
+
+#define CLK_MOUT_PLL_CPUCL0		2
+#define CLK_MOUT_CPUCL0_CLUSTER_USER	3
+#define CLK_MOUT_CPUCL0_DBG_USER	4
+#define CLK_MOUT_CPUCL0_SWITCH_USER	5
+#define CLK_MOUT_CPUCL0_CLUSTER		6
+#define CLK_MOUT_CPUCL0_CORE		7
+
+#define CLK_DOUT_CLUSTER0_ACLK		8
+#define CLK_DOUT_CLUSTER0_ATCLK		9
+#define CLK_DOUT_CLUSTER0_MPCLK		10
+#define CLK_DOUT_CLUSTER0_PCLK		11
+#define CLK_DOUT_CLUSTER0_PERIPHCLK	12
+#define CLK_DOUT_CPUCL0_DBG_NOC		13
+#define CLK_DOUT_CPUCL0_DBG_PCLKDBG	14
+#define CLK_DOUT_CPUCL0_NOCP		15
+
 /* CMU_PERIC0 */
 #define CLK_MOUT_PERIC0_IP_USER		1
 #define CLK_MOUT_PERIC0_NOC_USER	2
-- 
2.49.0


