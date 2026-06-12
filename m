Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4871CCD98D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZhUEA2O/makZilFyWR6S+o4mEj16RKk0BJZID2UVvk=; b=lcvfd85s8+1IaYYDzwGKeZjCv0
	wdcBo0ogIbBzxyyPYji0vjyXF0IN5MK05q4L5D9Ek3HIdUjSYGNXsRD3njoidnPJou8/pVhk5pvq3
	5aM5JRK/5V6YkaZtN8ffwxcmBdyqDno1TLW7QP6AtCEuW3QsmFn8ha2jIMwKuxSNHN1kE2uWzsTe5
	RRd9pnWFup8/yfrd9VcnabHzxlIa2zDfuk3QNNSBqbjRkTjapBOCTTqO4LFg1Ig8dG7wkEefcH1Xa
	S9Eu6gDU3SZFG3eFEows8CFffliCNGv/OTtIYq1IDeLZmTY4/R/8JoIYcAAV/LD6Bb4vrb0xLJFsB
	zdpoGwmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyeQ-0000000AiE3-1nh1;
	Fri, 12 Jun 2026 09:58:10 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyeL-0000000AiBD-3U3b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 09:58:07 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C5FYEm273217;
	Fri, 12 Jun 2026 02:58:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=VZhUEA2O/makZilFyWR6S+o4m
	Ej16RKk0BJZID2UVvk=; b=CjQ3yilSwK5kAi4a6fXsSbT/s/3yPsMv2ShbpAkv0
	fnDfOgeW2XTIMW2BLIyFdn6n628RcC/NFhLkKxg2YaQd5Ct/dnAHHPR88BhLQkmr
	ZjXwqJLdNDXyUu3/l7VxF/MRSWpEr6jjwmjS1o1mfzk3naobeFMsbRYZFanEYlpQ
	/hJT1gvf0pq6a7BTulYznFd+fXD3LVEPOX3bqYdLhua0F1o5jcWLc2WXFcQs7N6g
	RELrDW299GITwQuSQB1SwTfRgNAcUJG2KYohityOTReMmwu55UZCSbKetx9iY+1S
	k4K6ysxamYf83AEIW7Yet4LEGkuChpA6oCbRWE8cVoF+Q==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4eqe5r6s19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jun 2026 02:58:00 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 12 Jun 2026 02:57:58 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Fri, 12 Jun 2026 02:57:58 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id 998323F7040;
	Fri, 12 Jun 2026 02:57:56 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>,
        <gakula@marvell.com>
Subject: [PATCH v2 3/3] dt-bindings: perf: marvell: add CN20K TAD PMU support
Date: Fri, 12 Jun 2026 15:27:46 +0530
Message-ID: <20260612095746.19679-4-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260612095746.19679-1-gakula@marvell.com>
References: <20260612095746.19679-1-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA5MCBTYWx0ZWRfX79Tbtp8O1EPH
 /RTjvmPBrCemSS2BN1m2JnD+nxIXx+Iry3iADLUjuX/W+T6PfCMA88xy9u2EMx66n2AvJ+oz74x
 0k4TOFKKKrLHQvi7bqOse+SO5mXZiaw=
X-Authority-Analysis: v=2.4 cv=O6gJeh9W c=1 sm=1 tr=0 ts=6a2bd828 cx=c_pps
 a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=QXcCYyLzdtTjyudCfB6f:22 a=gEfo2CItAAAA:8 a=M5GUcnROAAAA:8
 a=AeVSjtvhjGoncaazplIA:9 a=sptkURWiP4Gy88Gu7hUp:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: nw9eWlCB1oYQ2K-mBnSTdd25psgSTRO0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA5MCBTYWx0ZWRfX8NuqNVdcdqKy
 zkULfZ3nA9WoZl6Odx1im34F5p+G/ladaH0SeYXmOGzm0bN9eiXzXqFjUulFVSq9Yjja0LM6bLT
 X2H46Rwme7HZi43PYq24gxd1joxE6kOP38IN5uc5VhOBnNMH7/xm38adMAEMm6KfcEAwnVfRS27
 Iu4Asa4mbUNTOBEzSBKVsv4rrwSqndpo0lThml65uhTCLSpgT6vdaaKcommgH4sB3cu3AfjLj9G
 gdKsDJWk9Go/91ikkeTq2bLdEg3ot/u1BrOFWRKyxFC+0HBmZlzv0nnjM1EQ03N+VIyUTvRTuUF
 A038uCZpJo/p4N1d/3nwpThX/hN8Xc53sMAXzPVnmosR7taWMMnoeGdzjLnbKKGN5gNaFnKLPde
 82Xqf56fMVejuQLooNSGi6KeI7Us1z55en9ASYLdzbOdUuWeiML0ozcI7pC7R19rt+haUzKTxGo
 zTmYAULC/5VGQzP6wXA==
X-Proofpoint-ORIG-GUID: nw9eWlCB1oYQ2K-mBnSTdd25psgSTRO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_025805_988205_C65FFCEC 
X-CRM114-Status: GOOD (  14.62  )
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

Marvell CN20K SoCs integrate a Performance Monitoring Unit (PMU)
associated with the LLC Tag-and-Data (TAD) blocks. The PMU provides
hardware counters to monitor cache traffic and performance events
via a dedicated MMIO region.

The CN20K LLC-TAD PMU is largely similar to CN10K, but differs in the
layout of PFC/PRF register offsets relative to each TAD base. These
offsets are derived from the compatible string in the driver and are
not described through Devicetree properties.

Because of this, using "marvell,cn10k-tad-pmu" as a fallback for CN20K
would result in incorrect register programming. Therefore, add a
separate compatible string:

  "marvell,cn20k-tad-pmu"

Update the binding to document CN20K alongside CN10K.

Signed-off-by: Geetha sowjanya <gakula@marvell.com>
---
 Documentation/devicetree/bindings/perf/marvell-cn10k-tad.yaml | 17 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/perf/marvell-cn10k-tad.yaml b/Documentation/devicetree/bindings/perf/marvell-cn10k-tad.yaml
index 362142252667..d11121a1e2c9 100644
--- a/Documentation/devicetree/bindings/perf/marvell-cn10k-tad.yaml
+++ b/Documentation/devicetree/bindings/perf/marvell-cn10k-tad.yaml
@@ -4,23 +4,32 @@
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
+
+  marvell,cn20k-tad-pmu is not a compatible fallback for
+  marvell,cn10k-tad-pmu (and vice versa): the driver selects different
+  PFC/PRF MMIO offsets from the compatible string, and those offsets are
+  not described by separate DT properties today.
 
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

