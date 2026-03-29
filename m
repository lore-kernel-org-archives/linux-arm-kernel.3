Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150FBF3D60A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 15:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dSTWTisZC7qHFtnvjGqfuBKqkwNcsHPHtyRlsXTafDg=; b=L1UZZGcXSxxq/nXlgvsn9JeIwY
	/SSwCVusFtELGeXro9c2ASaK4/Z0d4UqbZB6a8UnZT4GatJqUwloJmPZZ3s4OA3FBPLcI2Vic8hW0
	+vYzgxuLR/q+MGwDZ+HGIckDrPvVucqHKHP1F1QCwIEowzcj4ndX1Y5F/vu05WnxZtDDxxnXDk0WB
	qd9qa7L+Z5HqDWnjiAAZ5el4HMYs2z+0vm5tbM7HA+M4iSvbAI/mg9rToMTu0zg7OOUbMvXG8PtxU
	MRUzwsPizegcHfeHaAcepsHGEH2QvWAam+w0FfMGmyvPdyFGlncl7QyxsvqXtQgma7eaDXMgrVd8i
	SKgQQI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6s0a-0000000A4Ls-0x5Y;
	Sun, 29 Mar 2026 15:25:00 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6s0X-0000000A4LU-022n
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 15:24:58 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAvNFh3148474;
	Sun, 29 Mar 2026 08:24:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	pfpt0220; bh=dSTWTisZC7qHFtnvjGqfuBKqkwNcsHPHtyRlsXTafDg=; b=ZM3
	6BFl4xA+2IqF4kDw8ZeWGuCpVVLzXdzbKYMa51xlOc7BVXR+aKgOn3RcY2QuG1N1
	Shlpm+SNxeZEpR4dPHwTEvlf+2U9mldiH2kchfr8A17Wqsi8hi4PJ0Uvg52hajSm
	TSh9SSKbmtaC0PqySFx1KuZrDMjlQ4+Vyktz64Ibyf+4l8jv9o6oIg1qJ7VRavsP
	Q/Lmoiz17SB7i8FRZJfQrhuSaiXtDmyvEj2+weeDOKSlmfjtYXLdmtPloDoIEFhQ
	wzeObDVKsTcaCrPUFCpgSP2rLMagnwdXLMa1gjSSk6JpJSA44uxyXp4biljHmI1N
	c9KtnY7vWiOlg/LzxXQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4d6cbjsx39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Mar 2026 08:24:43 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Mar 2026 08:24:42 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Sun, 29 Mar 2026 08:24:42 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id 501723F70A3;
	Sun, 29 Mar 2026 08:24:40 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH v2 0/2] perf: marvell: Add CN20K DDR PMU support
Date: Sun, 29 Mar 2026 20:54:37 +0530
Message-ID: <20260329152439.10573-1-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDExOSBTYWx0ZWRfX82PwbOSGQcTk
 abLIH1ry8qwVG7mTofV3IJgkM63PVX1trEmaAJh1DuFj3AIagPdgvvqk8pcv5gDvs3LC5KXTlmS
 Pb8UqDq6/B6mz5jc78g/uH1WCwhAvlwQmlNWHpio80mdGBFSJCyTmGKiUJRO1Z4SzkDi7EdZxF/
 FSigI1MvPeY//k8fG0j+6J3y363xmk6YwVJTVLpYjfkMQfCZA0L24Ekvfo5CEesehYCDWHEn7Kr
 75Lq2fIh04T+BjZ6xmZM8zVcEXfVWr4tpjz/QaZgO4GT9bHLqUe/HLcWhON0m9lH28GFUbGdIYF
 ojMs9Gxr6A5o/eSe3NACkTRuH+9umNh4lyLml09b/Gr+Op6O4fPb3Ne6DYyVNhoqKG9VYTIXnY4
 GGCg9gRLLXn9OckH573QZzmbYQD8E21YjYqcG9zzp4M85BC0t7cAe/AujiDmss9plsFJW00Enw7
 6+aRaYvEP6JG34cRwsg==
X-Proofpoint-GUID: LYaSR4RAhHpENY-j6uPpg1-_o8eqnexB
X-Authority-Analysis: v=2.4 cv=Pf3yRyhd c=1 sm=1 tr=0 ts=69c9443b cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=EAYMVhzMl8SCOHhVQcBL:22 a=M5GUcnROAAAA:8 a=g9OxYFsRBXyit7-cW8EA:9
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: LYaSR4RAhHpENY-j6uPpg1-_o8eqnexB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_082457_054867_B76E7B3F 
X-CRM114-Status: GOOD (  12.17  )
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

This series adds support for the Marvell CN20K DRAM Subsystem (DSS)
performance monitor in the existing marvell_cn10k_ddr_pmu driver, and
documents the device tree binding for the new compatible string.

The CN20K PMU provides eight programmable counters and two fixed
counters (DDR reads and writes).  Patch 1 adds the devicetree schema for
"marvell,cn20k-ddr-pmu".  Patch 2 wires OF and ACPI (MRVL000B) match
entries, adds CN20K register offsets and event maps, and refactors
platform data to use silicon variant flags.

Signed-off-by: Geetha sowjanya <gakula@marvell.com>

Changes in v1:
- Added a description field to the binding.
- Simplified the compatible property using 'const' instead of 'items/enum'.
- Updated the example node name to include a unit-address matching the reg base.

Geetha sowjanya (2):
  dt-bindings: perf: marvell: Document CN20K DDR PMU
  perf: marvell: Add CN20K DDR PMU support

 .../bindings/perf/marvell-cn20k-ddr.yaml      |  37 ++++
 drivers/perf/marvell_cn10k_ddr_pmu.c          | 186 ++++++++++++++++--
 2 files changed, 207 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml

-- 
2.25.1


