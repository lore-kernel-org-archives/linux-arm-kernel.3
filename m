Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A45FF5108
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fKSUdkJa8S13Mjb9Z4zDuPVRYpCHCVQdrMjRNCPKMo=; b=RIUAMttTWjzkQdA4xV51tTfztB
	NKIDklfxADFfHc9qYqpeksq0Zezkqh6dOrX/VJWAWB0e4vmka8I0hVD5flFekzIIWymt11+KnkEMs
	q8CuXMfajDj1CrOG7/WMEJKexvIrCTDt207B37BY8F8EglYeLh5NdU9eTK5S9vrCOV37Hxd0ezLts
	0luyVwwaoV7yJ44eLTr0aVSmuy2OKcNi2bVmmuUyLW5+oR7bK6OAJF0ppk7HwT+XHSugIs/Um03se
	KcyR2l5ZbBVCfdkDc3Ls7exz+y4oNtK+NU4Lb+F8a0FKWNKEMFisPQSndRUjcQyf/tsyEU9iZNknB
	QQzbirWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Sl-00000006iRL-3gnO;
	Tue, 07 Apr 2026 15:35:35 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Sh-00000006iPX-34Pu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 15:35:33 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DbuhR560624;
	Tue, 7 Apr 2026 08:35:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=/fKSUdkJa8S13Mjb9Z4zDuPVR
	YpCHCVQdrMjRNCPKMo=; b=LdJ8wfBTkcpz59fhBWnyk92ZrCf3kmOTBve6pMYsZ
	Xq6DmtB1ZOnBFwvE5DU2bTwcsTCc9KlVch5c9yKRJLiGrq7M8xAHfDdqm8nQ5qLt
	UONiDsn8pZp620JkARrBYSd8oOEy0Yic6qJq8bujpVF5qb5eGc4HiV/X6lj4zUN4
	1INZCeJpPgnSFIZfIplOpTLGPJj4AjLZw2hmR0ceVYczMDyEOKOe2p21DuFalQx+
	MMzkXp42sp866c73S0U5+LIS51tWe42TntezxECGIv00MmDIKd/KecSnQH4dFa5y
	uh0KzS4DzCBmYCa1td/pIyEd6qClKM5et+1Pk7DILX06w==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4dcms6t0j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Apr 2026 08:35:19 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 7 Apr 2026 08:35:18 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Tue, 7 Apr 2026 08:35:18 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id 144AF3F7043;
	Tue,  7 Apr 2026 08:35:15 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: perf: marvell: Add CN20K DDR PMU binding
Date: Tue, 7 Apr 2026 21:05:10 +0530
Message-ID: <20260407153511.4250-2-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260407153511.4250-1-gakula@marvell.com>
References: <20260407153511.4250-1-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=D+p37PRj c=1 sm=1 tr=0 ts=69d52437 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=qit2iCtTFQkLgVSMPQTB:22 a=gEfo2CItAAAA:8 a=M5GUcnROAAAA:8
 a=cxBr6QS3EhuSzrwsu80A:9 a=sptkURWiP4Gy88Gu7hUp:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: aIddzSPyhTQsTsOx42NFllAPZdh7bDh8
X-Proofpoint-ORIG-GUID: aIddzSPyhTQsTsOx42NFllAPZdh7bDh8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0MiBTYWx0ZWRfX6UWrvcnQA6kQ
 Lf3UC07svgYOl393ZvYGxtekNyxFr/5+Hm1GuIne0A6z+P7rhDu1J7c0dwWHcZsYznf+nCVQ1Mt
 8aDhAc/DjTtY3sDVC1ysME/qBO2u59qSHLXgJapR18ueaq/GqWEDVM8H/iSR3CiRDz3belGXlaW
 J35/mvPhfK6qHJKxUTYRTYw8/kjkB7X20RgTavWMRWeOs6IMrG3rzbB1NIDYW3nSlIxo4HnX7dL
 71prORYksreA6jpmKmeVVnyR11Kdru+UXYtUHbYBSnTHKTc8ah5nTjgXXOPWD2i2uVcAqzFdXlf
 CU4KlWGulY7k+W196l+zbIyzahSVXlt+vIsiE5C+7RArNynNixBQBxyTrcqurtxCl+D2q3PHpqD
 09sXvbaURukFVfQITl3aBJXnmYs6P8RD+d14tBD37a/TCwL4zDYJAWSgh1FRUSxaTrkt8CXEnog
 mY8fPVZefyu6e9ARl5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_083531_888303_6384CCB2 
X-CRM114-Status: GOOD (  13.34  )
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

Marvell CN20K SoCs integrate a DDR Performance Monitoring Unit (PMU)
associated with the DDR controller. The block provides hardware counters
to monitor DDR traffic and performance events and is accessed via a
dedicated MMIO region.

The CN20K DDR PMU is functionally equivalent to the CN10K DDR PMU, with
minor register offset differences. This binding documents the CN20K
variant and introduces a specific compatible string to allow software
to distinguish between the two implementations.

Signed-off-by: Geetha sowjanya <gakula@marvell.com>
---
 .../bindings/perf/marvell-cn20k-ddr-pmu.yaml  | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/marvell-cn20k-ddr-pmu.yaml

diff --git a/Documentation/devicetree/bindings/perf/marvell-cn20k-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/marvell-cn20k-ddr-pmu.yaml
new file mode 100644
index 000000000000..78a0cd9a7b1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/marvell-cn20k-ddr-pmu.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/marvell-cn20k-ddr-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell CN20K DDR performance monitor
+
+description:
+  Performance Monitoring Unit (PMU) for the DDR controller
+  in Marvell CN20K SoCs.
+
+maintainers:
+  - Geetha sowjanya <gakula@marvell.com>
+
+properties:
+  compatible:
+    const: marvell,cn20k-ddr-pmu
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
+        ddr-pmu@c200000000 {
+            compatible = "marvell,cn20k-ddr-pmu";
+            reg = <0xc200 0x00000000 0x0 0x100000>;
+        };
+    };
-- 
2.25.1


