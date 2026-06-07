Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B327CD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 12:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWcYYpxWpHV0gRGBfsC2kHwRUbnJJhhEUIpChyiUSAY=; b=Hsmah1QyEXS4UVbMoBOt/rRms/
	5nvWy/E4LvsAtMUnhWg6zDjDncTZ07aQBm8wMWXO1cn8By3VD7KzPBJnS3984o2l0dZbQ84Qnkbmv
	fbkXw7xYBa2TlW6kdIL7ExSOdZ8rdi7aUroINTrkh4hMi6VV8QcKfBeU0u7FE1JQJy/+2BgB0hx7i
	fRG0pHcQbgzvivg0FQEjxrqwlyAdAKcl1fyB0v50T3w8USv0rrVk3mwVvvJTQsDHu+uIUVB9BpIv6
	VAc52euwWYzXmFlRT6pBppnUyXSg6TcziB7CUaHZmoER1IWX1SBockBg8OYuWEGVEEvhXsfXVQILb
	k5c8xy6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWCyJ-00000002FVR-1XRA;
	Sun, 07 Jun 2026 12:51:23 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWCyH-00000002FU6-1Es5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 12:51:22 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B1cqb3698744;
	Sun, 7 Jun 2026 05:51:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=aWcYYpxWpHV0gRGBfsC2kHwRU
	bnJJhhEUIpChyiUSAY=; b=eds3Ek3vxSQhI88b03EtftC7ngUl7P+H+3bHyH3j3
	z/6irkzQ1ovrrh/aha/+whitXyNs5Jfp2ZXc6f1pTyKAN0LcXjsVZVIUqoQ1jfnJ
	1nwnpjWKoH2aTM6tHJJ/BrI5HSsUF0ItKZOsPxsw60IL5lF+NbyNJp1iJ+L1HHDU
	fJN6pPoaNWnRBpQPHF3ir/2mdf/3Oz+AEiTJVn1G+n4YX8LBJz04DOVs8+aqo7AB
	bwOpjjx9kDyC5G/KlLHd7vWhTm+zdH464sXr9SyEDy5bG3pHSMOH2UeCCCfZuB7b
	eX1aa7GU7c5FmxMgQfFtyg/Aqlqsv9UDvu/CQRaDBGCVg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4emk2ek3f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Jun 2026 05:51:16 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 7 Jun 2026 05:51:15 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Sun, 7 Jun 2026 05:51:15 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id AEE213F70C5;
	Sun,  7 Jun 2026 05:51:12 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>,
        <gakula@marvell.com>
Subject: [PATCH 3/3] dt-bindings: perf: marvell: Extend CN10K TAD PMU binding for CN20K
Date: Sun, 7 Jun 2026 18:21:01 +0530
Message-ID: <20260607125101.17778-4-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260607125101.17778-1-gakula@marvell.com>
References: <20260607125101.17778-1-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEyOCBTYWx0ZWRfX7i5rzTf4t3Bz
 k6XEnIA6TnTI+IBPSxZScs0dLR6I9MigGv8ogGoXd9SXOujlSmQpE4MnYBFBzhRbnLJ5N6rqKoc
 cSL/V9GUlNnpZQ4Q348eJdpHsXWEK89Z0LuELtyMBX8uhSm3y7imjHnfuzH2RkwnLU2IyWNn/++
 t6i0alma3eR7M8ym41ptMWlTXis6LICnw9MAB+nus453guVFDPVL/RMFzUgMTXc/VSHpU3zMEtQ
 Wyi77hsRc9gMuypqmMMcq8YtDWY0sR/D7WucOZq12eY0gtqzMS0uzWQgyD83P5oPzUpG+kJWzoH
 mgwSgMzZ9663HP3IoFW8TIbbiEyQXh4MfpU3HMXM5E6g7V/vZy1Logrc1ll4RYIB0Owl3vUAvuw
 tMjoaPdjFU8rUI9j4rLaNh2qPTHm6SUKF7//DlOOg8pg+sjQHlMeU7J8HEtW8V+h88Zz/B4IRSI
 aGgBcfWJelhxraapTVw==
X-Proofpoint-GUID: Knqm4btXgidxs7KvtiAQGoPwpMAezOuj
X-Authority-Analysis: v=2.4 cv=bJUm5v+Z c=1 sm=1 tr=0 ts=6a256944 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=QXcCYyLzdtTjyudCfB6f:22 a=gEfo2CItAAAA:8 a=M5GUcnROAAAA:8
 a=rc1d4UPXP1xlpl8uFC8A:9 a=sptkURWiP4Gy88Gu7hUp:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: Knqm4btXgidxs7KvtiAQGoPwpMAezOuj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_055121_474202_C4D8A7DD 
X-CRM114-Status: GOOD (  11.84  )
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

Allow marvell,cn20k-tad-pmu alongside marvell,cn10k-tad-pmu, document
CN20K in the title and description, add a maintainer, and include a
CN20K example node with the same required properties as CN10K.

Signed-off-by: Geetha sowjanya <gakula@marvell.com>
---
 .../bindings/perf/marvell-cn10k-tad.yaml      | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/perf/marvell-cn10k-tad.yaml b/Documentation/devicetree/bindings/perf/marvell-cn10k-tad.yaml
index 362142252667..1612052b59ae 100644
--- a/Documentation/devicetree/bindings/perf/marvell-cn10k-tad.yaml
+++ b/Documentation/devicetree/bindings/perf/marvell-cn10k-tad.yaml
@@ -4,23 +4,27 @@
 $id: http://devicetree.org/schemas/perf/marvell-cn10k-tad.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Marvell CN10K LLC-TAD performance monitor
+title: Marvell CN10K / CN20K LLC-TAD performance monitor
 
 maintainers:
   - Bhaskara Budiredla <bbudiredla@marvell.com>
+  - Geetha sowjanya <gakula@marvell.com>
 
 description: |
-  The Tag-and-Data units (TADs) maintain coherence and contain CN10K
-  shared on-chip last level cache (LLC). The tad pmu measures the
-  performance of last-level cache. Each tad pmu supports up to eight
-  counters.
+  The Tag-and-Data units (TADs) maintain coherence and contain the
+  shared on-chip last level cache (LLC) on Marvell CN10K and CN20K SoCs.
+  The TAD PMU measures last-level cache performance. Each TAD PMU
+  supports up to eight counters.
 
-  The DT setup comprises of number of tad blocks, the sizes of pmu
-  regions, tad blocks and overall base address of the HW.
+  The DT setup describes the number of TAD blocks, the sizes of PMU
+  regions and TAD pages, and the overall MMIO base of the hardware.
 
 properties:
   compatible:
-    const: marvell,cn10k-tad-pmu
+    items:
+      - enum:
+          - marvell,cn10k-tad-pmu
+          - marvell,cn20k-tad-pmu
 
   reg:
     maxItems: 1
-- 
2.25.1


