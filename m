Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A2F106F30A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=se03Pleb/yvbhpdA/nP9mguBlHjhILkDPsR0MJ+AyMY=; b=mAwzGdEcUGXDGQHbefd/2zI8Fg
	AcKRi3ck/zYZsQFTu39Ui/vSBPv7UU2DWaV2GfOYNQCUIZ91qWa3dYBdHob1oO3Q07u+IS0k2WmC2
	He2j//fsnjbvS0Vp0P23J/V9OApeJAQCh3+4lWaTLGQIJTQS/a5k1xON2mi6dvDoXAd7cvOMEQ0v5
	3pUD3AZ0E1syMjizTse+vVylikw4LRbd6TSIMKb7CXmJrsusak8K6u8nGoyLtrrK90Enum0o+6Noi
	7LcF6ZVWsoa82ePlPhqBXBGuPI3mM3pGTXhGnrz4IT275kVOuR3e2MlA9CX/Lp5//9YLtWTQC13bZ
	NtpmGrfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ggQ-000000056Wi-2sVY;
	Thu, 26 Mar 2026 09:07:20 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gg7-000000056OK-2stF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:07:00 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q7H9fV2125486;
	Thu, 26 Mar 2026 02:06:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=se03Pleb/yvbhpdA/nP9mguBl
	HjhILkDPsR0MJ+AyMY=; b=PCiG3SgpEbvWRQTu4kad+h6ehEIX2FG2sgfMFfm97
	2IyIFOytkWTPP3y/A69tcRdT0Mn/XV597ExFDCjToeP8KWtgCrdPKKD6ItID4q9z
	Z76dQnmz174pryk/BpMda52ICP9POUgSPhFytaV805zXN/snHPyZK20TOAEjSueo
	0jdLS0Yme9hlKE7Z/yYoqDZfeTLla7ssYwIOFQIpjhSU2qNF2s9RIywaEQgKmtSW
	ffEn9L8nt1UVZDjmuLMTrccAP9cMLQMsITrS5vTAe1c9d9yol9CyqKeqSN2UQt3Q
	QlyOCiKFIgzKBwFzMZIMkRVOGQ4OCXY8E/QKBFuKjnWTQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4d47nac0ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 02:06:53 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Mar 2026 02:06:52 -0700
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Mar 2026 02:06:52 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Thu, 26 Mar 2026 02:06:52 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id 995BD3F7041;
	Thu, 26 Mar 2026 02:06:49 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: perf: marvell: Document CN20K DDR PMU
Date: Thu, 26 Mar 2026 14:36:44 +0530
Message-ID: <20260326090645.22590-2-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260326090645.22590-1-gakula@marvell.com>
References: <20260326090645.22590-1-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2NiBTYWx0ZWRfX/J5Arq7S4bjC
 zQadQ6PFaV0w2/oFsNfaidkz+iO+2cu5Hi9YgIUeVHXLVR4qhx6vFlCwVYoDq6wkufZU2N/qT61
 zoBL6eWy9IbAwL9OJn0fQWPPKTf/88z7ev3fwJdXTdQedyQXpx9lWCpZu/eYdVo/3z99S0bkeIg
 xXHTOAE/0BF0c1p+/UvQy5pacMXAl1lmIQ1FESU6js04bYI/MaVBpagdw2nqhgZmRSQx/j450Tr
 v0Vcno+IS7rFhHfpiwsaS8vw4clrt0Z/kGaQV6HNHJdTL4csFopMXee58ze6jqU5S++OobTU+/Y
 HBKNgfEKn7g8oJIPjTNQbvLaWZ6OJmS95keEWveK9pS6MRNTastgNXWEOU4nrKq3cHmyS4ZbWOp
 fEHeHc2NHl9g9GA2Qu5ff6ju2O+L2N1UV1f97J+HMHc/pJ3RKaAaNjCFqW441pEIusH8miSgpvM
 vBh8Wcj0HDsAEJHw6IA==
X-Authority-Analysis: v=2.4 cv=LsifC3dc c=1 sm=1 tr=0 ts=69c4f72d cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=EAYMVhzMl8SCOHhVQcBL:22 a=gEfo2CItAAAA:8 a=M5GUcnROAAAA:8
 a=4RHyKZYBQQhKSXLDbdEA:9 a=sptkURWiP4Gy88Gu7hUp:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: 0st2OJMtM2llfiW5VdOFHYLxAIjmqY_r
X-Proofpoint-GUID: 0st2OJMtM2llfiW5VdOFHYLxAIjmqY_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_020659_728437_D5B91887 
X-CRM114-Status: GOOD (  12.37  )
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

Add a devicetree binding for the Marvell CN20K DDR performance
monitor block, including the marvell,cn20k-ddr-pmu compatible
string and the required MMIO reg region.

Signed-off-by: Geetha sowjanya <gakula@marvell.com>
---
 .../bindings/perf/marvell-cn20k-ddr.yaml      | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml

diff --git a/Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml b/Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml
new file mode 100644
index 000000000000..6677d9eb4ba3
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/marvell-cn20k-ddr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell CN20K DDR performance monitor
+
+maintainers:
+  - Geetha sowjanya <gakula@marvell.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - marvell,cn20k-ddr-pmu
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ddrcpmu {
+            compatible = "marvell,cn20k-ddr-pmu";
+            reg = <0xc200 0x00000000 0x0 0x100000>;
+        };
+    };
-- 
2.25.1


