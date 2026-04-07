Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2458DFF5104
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V96PxtxjjCu7m4wxga8K+elwPTNPNCtkr0qpIMETfAs=; b=q7j/08nsug6/dHGyljH3Rsd5/B
	drNQ//sOlUOd1rRMlKZnegPPexaG0EjJfZLWSBayesaZyKFqCMWlPI+vsVRDy2Mzsd1IH1PgtXLKT
	iUIWf/AthF7NN5Xy+uFgc7YS2rTqi7FT+HOcyURaGe0j0TXpcwsU75DCbGd60/xhU6me27lLhhEiN
	KZVRBLZE1mwjue4LhkRld2+mhxVDOKeSRTiniHdrVRlNrpFNIVEx7+yfSsO1oPtcMVQCIP8s3YoA/
	I7orYbO5CSIlyRirKWbQg3TwJPu7t3LkWA7iVTnPEil4jAfOlosT6jX8c2p7vvyYEOrYkDncySTXc
	TitnFsdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Si-00000006iPy-3Cm7;
	Tue, 07 Apr 2026 15:35:32 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Sg-00000006iP1-1nho
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 15:35:31 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637EIPmR2601069;
	Tue, 7 Apr 2026 08:35:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	pfpt0220; bh=V96PxtxjjCu7m4wxga8K+elwPTNPNCtkr0qpIMETfAs=; b=Pab
	0btmprdE2DiOzGsBMNZYYxtgKfFVS6Azt3KkW67VM2i061sQMtACEWolRqxYFAYg
	w8ZVW3urDZzfYYs9RMhIVuUWK4d6amgLc/ROSGvxLbGFn43DyWhX9mmMyMqc/8pQ
	NKetQvamwH1NXr/s7U7zAUqMGQFUsICENtXCtLrr7Hki54N2prdAyvTmNo0jmKMF
	68QALmRCLEoXS4f8i8oCXcItNCnqEKfiLJMtIaUi2WRk0uSJeiDaxWYRQi0wlfsP
	13M81CvOEtvyokESdrTam6xqF4HIOHg/2OjeKQIkAnbaGzNPT9M1ap79PvYfsF4t
	vPI6m7zcJQlVJsCS8Vw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4dcms9hywj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Apr 2026 08:35:16 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 7 Apr 2026 08:35:15 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Tue, 7 Apr 2026 08:35:15 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id 23EDB3F7043;
	Tue,  7 Apr 2026 08:35:12 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH v4 0/2] perf: marvell: Add CN20K DDR PMU support
Date: Tue, 7 Apr 2026 21:05:09 +0530
Message-ID: <20260407153511.4250-1-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0MiBTYWx0ZWRfX9+rGzVi6n+j1
 ygWog7w6cZ6dvPmqvUgzLbQcpdBQ+xjB4l/S20ElbJNYFOPWytYPfcTgbpF9unr+6JTaGvR65i5
 Z42t+kgTO97qgykY/NzeH1I8snV55IbaqYrY3kM/G1vBmUm3iUL+wD4R7P8W8Ll5uRZLC6sKgxU
 vVOhNNTycDAE0aKLHl9aJn5P0B04kT8eHSJ+cJ3IZReLFuT2VguS2UznOkruYwC1OLmvaikhKJK
 CwDe8+nRWO5IYn11giqYKo7p5HVa3jPJWRauN8jstKtijjpNXwIQlFb1AJ3R4P+V067ZY5OtW6w
 W2Zu5zxymdVVPm/hVBLMfIybpoYOjRfE/f+OiVnmAF30+RV+SklYhlv9BhSUfXri6LWNuuA4FKu
 AkmK/jlXOfR/691jUcslYa356MfsfE64rjt563zscaBvetOgZ/+ZJplenZBGMsX4inS4YGU7BkL
 r74K9+E+ezGs5b9TWJA==
X-Proofpoint-GUID: anZ_Aoj0OH_XX9yVr0TGrivMbGseZEhe
X-Authority-Analysis: v=2.4 cv=FuY1OWrq c=1 sm=1 tr=0 ts=69d52434 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=QXcCYyLzdtTjyudCfB6f:22 a=M5GUcnROAAAA:8 a=adgkevBCHCmUBQKKAzcA:9
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: anZ_Aoj0OH_XX9yVr0TGrivMbGseZEhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_083530_594061_1F6716FD 
X-CRM114-Status: GOOD (  12.51  )
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

This series adds support for the DDR Performance Monitoring Unit (PMU)
present in Marvell CN20K SoCs.

The DDR PMU is part of the DRAM Subsystem (DSS) and provides hardware
counters to monitor DDR traffic and performance events. The block
implements eight programmable counters and two fixed-function counters
tracking DDR read and write activity, and is accessed via a dedicated
MMIO region.

CN20K is the successor to CN10K, and the DDR PMU hardware is functionally
equivalent to the CN10K implementation, with only minor differences in
register offsets and event mappings. To allow software to distinguish
between the two silicon variants, this series introduces a specific
"marvell,cn20k-ddr-pmu" compatible and extends the existing
marvell_cn10k_ddr_pmu driver to handle CN20K via variant-specific data.

Signed-off-by: Geetha sowjanya <gakula@marvell.com>

Chnages in v3:
- Expanded cover letter and commit message to better describe the DDR PMU
  hardware and its relationship to CN10K
- Fixed the file name.

Changes in v2:
 - Fixed YAML syntax error triggered by a tab character in the examples
  section, which caused dt_binding_check to fail.

Changes in v1:
- Added a description field to the binding.
- Simplified the compatible property using 'const' instead of 'items/enum'.
- Updated the example node name to include a unit-address matching the reg base.

Geetha sowjanya (2):
  dt-bindings: perf: marvell: Document CN20K DDR PMU
  perf: marvell: Add CN20K DDR PMU support

 .../bindings/perf/marvell-cn20k-ddr-pmu.yaml  |  39 ++++
 drivers/perf/marvell_cn10k_ddr_pmu.c          | 187 ++++++++++++++++--
 2 files changed, 210 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/perf/marvell-cn20k-ddr-pmu.yaml

-- 
2.25.1


