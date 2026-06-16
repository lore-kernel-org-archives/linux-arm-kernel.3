Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F010ACD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 07:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOaklr0Z8A7gtp1ktpsq7SgsTnp+Akvr7bZ3S4KWi2o=; b=c3JIVR059Pko0jOC2bd2c2n+Sa
	FZDuqCBm23RynxRhAIdvglXt/dHIxacRDq1McFyPftISzb7ZO+fsoq55+mrs6d1KcVOc/SANPKWwX
	04LNqNzPtzC94pYhlo5e40L93ArjjnhE/rRZ4Z0W0G1F2lNIWJ6uEcPfAHqPwJ9oxxKfyZWdbW6li
	qoaBiD4kM+s1uoLutTjgZshWbvAufrpeEmGVDZ4PD3SjyzqClEkHrXQnIJ8TaWIZKo+LrYmZHa+gW
	E/yzumoNytdjSdXV9hqCa9s+mO8A+4VNy8f0w4cimFfYl/Rbjvhc43Voo14KRryluFjrmGGVD/bwO
	ntR8mHqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZNyC-0000000FM9X-2hk4;
	Tue, 16 Jun 2026 07:12:24 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZNy9-0000000FM6V-2ThI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 07:12:23 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G65xNP1992650;
	Tue, 16 Jun 2026 00:12:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=bOaklr0Z8A7gtp1ktpsq7SgsT
	np+Akvr7bZ3S4KWi2o=; b=KtE7azVYOALGjMKQrS6kr7xTZNOusvzTJyVsn3G6k
	ZMEoXJELQZG/l7xkITI/LdMS7+uOR52Art9sxSyCzOLS9gCDdzKrDs8aEjYxrqQZ
	3Q433G3kmmA5kT3uyJ4EG/TF4+i5XngWCAfi8yUOFP+lpGiZr9v3yqYxtzzYLUGn
	Mh7aMgqUGWV4NtZQyT6IgsViBV4sUBX9xLef8kxIr9Oq1Diozg9Q0DpJV94X9Udl
	vHuWHhwNRsjN3r6/XXJekQ4QG8mG4BELpCIGZo0ASsxayK982lugeINxYq2+OqFi
	kq7KymX2LwaMu/rZGQ7iFfKWH7slw6hr8DUrdk8ErcFEg==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4etu38hk04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 00:12:04 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 16 Jun 2026 00:12:03 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Tue, 16 Jun 2026 00:12:03 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id 9F3043F7043;
	Tue, 16 Jun 2026 00:12:00 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>,
        <gakula@marvell.com>
Subject: [PATCH v3 3/3] dt-bindings: perf: marvell: add CN20K TAD PMU support
Date: Tue, 16 Jun 2026 12:41:49 +0530
Message-ID: <20260616071149.12523-4-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260616071149.12523-1-gakula@marvell.com>
References: <20260616071149.12523-1-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: J-001GTt2QhuW3hjQn_6GIYHdK4EJTCW
X-Proofpoint-ORIG-GUID: J-001GTt2QhuW3hjQn_6GIYHdK4EJTCW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA3MCBTYWx0ZWRfX46XvziRoK90Z
 QdpURor9aX4QYA4f8ASoHkvIB4I/nOqUCiuu0AtY2J0atdbghg3/2FbETPpgfXw88a827HOEfIW
 RyRx7pGXtwGMWulBDeXFo2Ew33P1juA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA3MCBTYWx0ZWRfX0pMvjy00X74u
 Ci+O5y/f8DKE28Rpz6p1pf8iHJlE2VGuoGgfCspFioe9vYs05OLfSM3JbY8665/SIJ8QAGB1tj4
 EQenEujtC9YzxKbCeRU8kXheuz7vbPAB3qfFNC53eqN66ESPZ+Fhi+1d7U5mV7Ck0Hujc0vQF4E
 3jD2uqhgIVf2zTYOpIJK3FA9fmvO6XVsbrR+kRwg+V3/qjQ7VmClS83EXOUvM1Dwv6WfDmjdzp3
 nd2KUfNclYDyFbUCOWrgO/UXKL2xkEca8o+VpyyD/WHDJIo4NIBaU7QoMZwRFqnMXh8MvFNLWt+
 hHMMiLJYN8tgQrRBE42OmeNL3f+8/om1ncb4APql5s3EWFsH2FHvoFKzO/9EIZUd1VXvRgy2dtI
 ZE0iibj79DTIwoEAEGMqLJB/tCX3jOBcVMK9k8rXAvq8vVN0JBEfkSMePAWacfEMQPSbu4XbGqb
 QUqUW6SwC1ZwtgraMEQ==
X-Authority-Analysis: v=2.4 cv=SeXHsPRu c=1 sm=1 tr=0 ts=6a30f744 cx=c_pps
 a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=qit2iCtTFQkLgVSMPQTB:22 a=gEfo2CItAAAA:8 a=M5GUcnROAAAA:8 a=EUspDBNiAAAA:8
 a=AeVSjtvhjGoncaazplIA:9 a=sptkURWiP4Gy88Gu7hUp:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_001221_763519_E6F4DBE2 
X-CRM114-Status: GOOD (  14.56  )
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


