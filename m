Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441A4CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dtEmMu3lwpPD8ey75GlWWq9wkeJOe/QTnhrrTQHL/AQ=; b=xXTFTUjDUH8UbXq9NgCYcgrkWk
	/YbYhWdJw38sYCvw4M/ZPEj10XiacN/WMaYbiePpYrKvHBN9x1+wPsluJRzXyquUI3a/C/3o7OKn4
	8IvxZsEYL8bc26YQanbp0VweRETEa9ssqXSlTWsc06FsHC7wTalTPxdT+C/WpTLQ0bF7GO2kxz4za
	k632B+ggzD+A46ThOS+H7GK/EkE1qnmFgmBtuwtcET1LjCjofOvxlNNi7c4nceM3jFM4unelWELbm
	7RNq6kh8VwHOooAmgeyvldfPj+K3P1oZQQ+yTa4K4uShLi0zvF22hpUe0qB6LMBieyU2fa7ZOid34
	uVz9/irQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTx9P-0000000AIxo-3Yw4;
	Mon, 01 Jun 2026 07:33:31 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTx9M-0000000AIwn-3IuH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 07:33:29 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VLkoCv2671986;
	Mon, 1 Jun 2026 00:33:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	pfpt0220; bh=dtEmMu3lwpPD8ey75GlWWq9wkeJOe/QTnhrrTQHL/AQ=; b=b1e
	ne0MvoOAf1ybwOAEVLp3nyIADvZAiCBnVx7OEmhSQFg+vVS4XW9tGJ+rg+7YDWMv
	RD+eex6nV616kh1DWj/+jjbH+F9Hh42/K+fU1KDFVADOkUnKDXTBBoozIPeKHZJm
	gYiV0N1o1XyhotseMNToxp9gvl7ZDk/sGaC30rQJ4RtmNjlcbMmpnht7LAeACNRX
	ci3HJlQNqAdiJVfX+Wf+oPWHE/jEQ7lltCUbXWFvn5hE3otaqnGGfvFJ6Bj8igEW
	znHhPIIJQndxjMozCyj9Lw0ne5vF99LY2slOdPXsOEk5mUyKEf0X1y0KoVxxQ8He
	ZHDok/bxS2N3SkQIVyQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4egm56jga4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 00:33:23 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 1 Jun 2026 00:33:22 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Mon, 1 Jun 2026 00:33:22 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id A5CB85B6921;
	Mon,  1 Jun 2026 00:33:19 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH v8 0/3] perf: marvell: Add CN20K DDR PMU support
Date: Mon, 1 Jun 2026 13:03:15 +0530
Message-ID: <20260601073318.7098-1-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: krqOJr4sPd8zSESlr_e363EHZCzDYoKw
X-Proofpoint-ORIG-GUID: krqOJr4sPd8zSESlr_e363EHZCzDYoKw
X-Authority-Analysis: v=2.4 cv=ZeYt8MVA c=1 sm=1 tr=0 ts=6a1d35c3 cx=c_pps
 a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=TtqV-g6YmW1Jfm2GSLaY:22 a=M5GUcnROAAAA:8 a=5P6x6L5GWbpB3kLCBsYA:9
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA3NSBTYWx0ZWRfX1pzCGeHysHJJ
 5KbpLexnsh//+JueKdva6x7SYbDWMM0H5Gkn8x+OEApavBeEnNFELbu3vjdDNsqYRTvPH2ClbBN
 WHEsmr6UgBkfBv3P+kTx6IzBMYOsUJxYvRvqawwqJzHloO/uINz9pUCsgREIIW8+fhsAcRUzkrs
 +rCcej/vZ48+KbAetLjh/m1/FYNTBrqbkXoPf4OB1l/sOQg7nvkT9RKegfpBT33l+LvbMLPg5y9
 qXlOU5JEWL3mO/hbaQHfax6E0qwy7q87kRSd+m4QFaqhXrvR5qSThybWjsYHsoL9r2EqaicwPBu
 YKnbbPsR1dT5N4DAyVot3XQFuCFmyRTzTVc8tFmXbGs7zwUzC0u3nF/ErVVerx7DCQPNVAcuQ1V
 Bbq8bHbciRsCJiO+2J6VosQC9GArZ/Ay83BCCCnG++DzIzJkyeAlKrCK9OwacpfOjG2/MDRozqv
 zqpJtBB8QxSubFpl97g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_003328_827371_6D58CF2A 
X-CRM114-Status: GOOD (  15.14  )
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

Chnages in v8:
- perf: Cancel the poll hrtimer in cn10k_ddr_perf_remove() before devm frees
  struct cn10k_ddr_pmu (pre-existing for CN10K/Odyssey).

Changes in v7:
- dt-bindings: dropped the CN20K DeviceTree example.
- perf: Handle ZQ sysfs IDs (62/63) in a dedicated switch case before the
  DFI range so GCC does not see overlapping case labels and Odyssey IDs
  58-61 no longer fall through into ZQ handling.
- perf: Resolve shared numeric IDs 58-61 inside the DFI case for CN20K vs
  Odyssey (identical bitmap); extend programmable-event coverage to CAS
  events (36-38) for CN20K sysfs.
- perf: On event_add failure from ddr_perf_get_event_bitmap, cancel the
  hrtimer if needed and free the counter slot instead of returning with
  partial setup.
- perf: For CN20K, zero CFG0 before writing ZQ to CFG1 and zero CFG1
  before non-ZQ CFG0 so stale masks do not combine across banks.

Changes in v6:
- dt-bindings: Document CN20K in the existing marvell-cn10k-ddr.yaml;
  add maintainer, description, compatible enum entry, and a CN20K example
  with unit-address aligned to reg.
- perf: Route CN20K ZQ events via dedicated sysfs IDs (62/63) and CFG1
  programming; use (eventid - 42) for CFG1 bit positions and reject those IDs
  on non-CN20K silicon.
- perf: Disambiguate CN20K perf width events (58-61) from Odyssey DFI events
  at the same numeric IDs using an early CN20K branch and fallthrough into the
  existing DFI + programmable-event path on Odyssey.
- perf: Run CN20K programmable counters through the same manual-mode / start
  sequence as Odyssey.

Changes in v4:
- Fixed document file name.

Changes in v3:
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

Signed-off-by: Geetha sowjanya <gakula@marvell.com>

Geetha sowjanya (3):
  dt-bindings: perf: marvell: Extend CN10K DDR PMU binding for CN20K
  perf: marvell: Add CN20K DDR PMU support
  perf: marvell: Cancel CN10K DDR PMU hrtimer on device remove

 .../bindings/perf/marvell-cn10k-ddr.yaml      |  18 +-
 drivers/perf/marvell_cn10k_ddr_pmu.c          | 236 ++++++++++++++++--
 2 files changed, 220 insertions(+), 15 deletions(-)

-- 
2.25.1

