Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E30CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOaklr0Z8A7gtp1ktpsq7SgsTnp+Akvr7bZ3S4KWi2o=; b=YtSn682bLcgTAXvHz7OqdQihJ7
	FQS+uG8BKs3qC+3avgyuxPuBmfWebHm1dsd63LYbgX/Uoti1ByJwjh/z/8r5JKozBsYqQMdFAWy4S
	4hTj9gtKfW0KPCBDXlbz3qaTJWWDaNlDm9jfHpclhZrFmbzSwv+8XrHet5Qmwku48GcKzwZyE7Oy2
	TVGKdFOuMSFGStx6jCbyVzQDP/+3nb93jpsKIREhZX6+XgikwHhRQDYSLvZAIZNImj/R6YUH/kWhq
	b5JHeVl3hOP1t9AgmdkH+X0YwsTY+B0G3OIh+os4NuhUE7EPRI3XfHEgMgPw34vlsJw7OftekWAbK
	f1CW8HJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEnC-00000001Ukc-06zt;
	Thu, 18 Jun 2026 15:36:34 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEn7-00000001UjK-2YhV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:36:33 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IFHeqK4091336;
	Thu, 18 Jun 2026 08:36:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=bOaklr0Z8A7gtp1ktpsq7SgsT
	np+Akvr7bZ3S4KWi2o=; b=NTQVyNNimkGEot8AfF2+FdRHV3+i2UVz+F7solWCn
	1wInN7mDNRwLLJ78IXvCWaaLjM+IuXo3dvFGefcksAOd82AI7KI0KIVUPuaAKa9B
	2kqjx1HqcJ7B/n8lp2WhKrjdr2fHNZ/5rkykdd7Lh8OBdZFW1jeSYb6T4XKYvOKI
	syc6rKSr2tv+l50UrTSmr32i++7UabCAf085JonqYfGnMPFZQZvnpOHcZ9dwKHSW
	hgCfQopDOOWRZ4who16WPWqVSp0b9IUVJIv00k/E2Zc2FjJuoanKUjBdzYtj33Ms
	Ra1gyEALHfw+0eHLbsgyOkymm0V4kpPW4iT1V3JVPHE9A==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4ev59a2ep7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 08:36:24 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 18 Jun 2026 08:36:23 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Thu, 18 Jun 2026 08:36:23 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id CA5223F7041;
	Thu, 18 Jun 2026 08:36:20 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>,
        <gakula@marvell.com>
Subject: [PATCH v4 3/3] dt-bindings: perf: marvell: add CN20K TAD PMU support
Date: Thu, 18 Jun 2026 21:06:10 +0530
Message-ID: <20260618153610.13649-4-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260618153610.13649-1-gakula@marvell.com>
References: <20260618153610.13649-1-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE0NSBTYWx0ZWRfXy0+FY5Xp8ls7
 Spgu++BcNoX2r3ABUsAyRTgsS48AUMK7s2l1qCfgK6UPpWjGxR9O1raJI9LVA3JpRf4qF+Ae4n8
 QoxH84+C+Put1fSfRrXlZ6SBam+3zxk=
X-Proofpoint-ORIG-GUID: p0nmuOTMN99THA7enoDcyx0DPNtofk-b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE0NSBTYWx0ZWRfXxMXaEGQYwsmx
 sbBt73BiTwZ6doudkjFeOU3D+gXiAbLOMHnoDb5WvUbUIhcExh3jVDxFed8qZlriRMS9YuRx2fH
 5S3et1SS+X3awGlWWSFOvKyBt6JsW7WlYHJ5zNYeGjUXwTxipLHZNGzuJawhGTH5tODMTYJKhnT
 e4K2d8W6JEcD//LL2mehDoW7K+WIYw1Jm2ZvuyiYJncgMt7g/uSNMX4iRv+YvHijGp7cJYOu9D9
 AjIMYJDhgWG6ODHQoVKCPYf9N+hGq6cEvs/A4SgGrGpgRzICdTDJOG3PT44C7WICzz3goXc40ka
 vl7t3iEVyjPjb9kBtbMBC7iiwxcA99BT4sHfrTteR5GO0ZwUf2RnvHDFl7lawVza7xHznQ8oR/w
 i7K6QKA1jYMRX5K65fEJSSCIwoFDBzthDjStgiEEL5bUBAmQbz+gGWON3XjIKa27xKKhjnm3XFH
 rsKOa9Os3abUkJL5XhA==
X-Proofpoint-GUID: p0nmuOTMN99THA7enoDcyx0DPNtofk-b
X-Authority-Analysis: v=2.4 cv=GMQ41ONK c=1 sm=1 tr=0 ts=6a341078 cx=c_pps
 a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=qit2iCtTFQkLgVSMPQTB:22 a=gEfo2CItAAAA:8 a=M5GUcnROAAAA:8 a=EUspDBNiAAAA:8
 a=AeVSjtvhjGoncaazplIA:9 a=sptkURWiP4Gy88Gu7hUp:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_083629_757179_59095390 
X-CRM114-Status: GOOD (  15.00  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/perf/marvell-cn10k-tad.yaml      | 25 +++++++++++++------
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


