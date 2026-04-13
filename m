Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BA9F34C65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 16:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SaMe/XCfATJZ2LJcHZ4lSlaqFFo8ZIhHj8aFqQq8m1w=; b=x85b4xpX5/Si9shjUdsfYENL8k
	gbuEpmy7e1YLn1XNzOkCoxmbVDkndofNYFBF0rm0AzcglphhmwwxNX5PX0wGgF3EdaWBQ43TOdp02
	dW0lEuQr1ly0ckbRnxrCDakVKeCqfDRo87Yfw48VMbVLUN4siOq+dPhTr4VccASRQCCdx1OfVU1di
	sw4WZK03Tini70qrQ+2grW9M26tISdRFu1ze3kRLrRNuwOoTak3351GKQdbHMVRAKDD+sX0dKnU9h
	AS46o1DVuhbHC6n2hbh4G3oXLEkJQYvSYEmeNbl/uMFAKSn5imgghY/xmaMEu8N+hiiRo0byoScK0
	DTALJjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKaT-0000000G5g7-0QED;
	Mon, 13 Apr 2026 16:56:37 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKaQ-0000000G5ff-2tHY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 16:56:35 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D8f4j83064118;
	Mon, 13 Apr 2026 09:56:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	pfpt0220; bh=SaMe/XCfATJZ2LJcHZ4lSlaqFFo8ZIhHj8aFqQq8m1w=; b=Zta
	yu3j8M08aS2q2T+sEcF+zHOzBiAPJCdRJdB3/oDXS/Eqak3li39quJDhQKkJISvD
	FaEna2J9kDMm9aZz5QC1L5gsJ+ImrnbeaqzzRgqx9UVseAjrLPok/bxYlpqD/AhF
	ELBTS3v352+BGq+9SIjjqehSYyML+QDQ8ekaMGlTfhrcQuZAvskQS0hvuOe230yW
	4v327coq8jqpjZFQ3o805ABLcBx4JeoKrJuF4MJ04JKU75tPPYDH2J9QYwnaaz/A
	M29sPSvJHeozFzmoCHHJlMW0BFKVKNOrq4nG0bN8E26O8Y8Gh8DtqkwAS0vONhqM
	FphNsxWz7WFX6gKx6pQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4dgw6hh3sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:56:27 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 13 Apr 2026 09:56:26 -0700
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 13 Apr 2026 09:56:25 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Mon, 13 Apr 2026 09:56:25 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id E3EAD3F7075;
	Mon, 13 Apr 2026 09:56:22 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH v5 0/2] perf: marvell: Add CN20K DDR PMU support
Date: Mon, 13 Apr 2026 22:26:19 +0530
Message-ID: <20260413165621.10921-1-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=BY7oFLt2 c=1 sm=1 tr=0 ts=69dd203b cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=QXcCYyLzdtTjyudCfB6f:22 a=M5GUcnROAAAA:8 a=adgkevBCHCmUBQKKAzcA:9
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: mimk6iZsQBwJGLdnfxC0-_l_kfZuqGiR
X-Proofpoint-ORIG-GUID: mimk6iZsQBwJGLdnfxC0-_l_kfZuqGiR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE2NiBTYWx0ZWRfXxW18DiTN7u24
 T8+lCtTW87VKhOR7/FFOZQL86/hY7zUFGBIGw3sNPbRA0k7FIfMIgNv0t9zicES6vXWb6OeJsUg
 TZ3427BLf+6/WA/HhIghVqLj45BIlcj1/v9eOc7XvzT0p+w+XiwNUdspWzBTycv/FAf6fpOdEkd
 8w6j2HPzLwIyOU38Hy8ULNrRkDQogx3EIvDfn5LtDtyzwx7/5GLysI9UWLlDvl2Fx+qqZ8BrUjO
 bKeritahmHOCm8NNz1bAyLrLzsZQ2b/ENsEVpxzwG6SO+MV685oVOSAl4tVqTWNSIEayan7TljH
 4roV4VWAiaa6ihbkUDkOXiOBM4PgurBFQ5zpOnNOFMWI0LRIeyvc+AkvjpNO1Etq6mKV3e2f2dy
 exL1tKV5qC+Q4rEWpJOsXjIxX167bf8I9ZB/sUq5Xgkx8ji5WH7UZ2blBxnGPCGwEJpkjLlnVnY
 m/PdpZpBVghLelyc+xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_095634_844525_8B5EC69C 
X-CRM114-Status: GOOD (  12.38  )
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

Chnages in v4:
 - Fixed document file name.

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

 .../bindings/perf/marvell,cn20k-ddr-pmu.yaml  |  39 ++++
 drivers/perf/marvell_cn10k_ddr_pmu.c          | 187 ++++++++++++++++--
 2 files changed, 210 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/perf/marvell,cn20k-ddr-pmu.yaml

-- 
2.25.1


