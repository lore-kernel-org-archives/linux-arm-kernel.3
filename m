Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584F8CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dk84ZQRgSc8xnw8MT3aYpxHJpf1SJ9OoPddG086vJpQ=; b=4RsMJM3Tf3Ldk8lTd/qP/XGk6P
	CPiX8GIAGdPlFxoac5S/JdRhfdag85xuklFNwxaiwIzD+7Bn7CmzHG0kwrJcpVzJ8i/EnXqf/HrNg
	/ohR2oBbFdVdNPCbFTA98W48NreTbOA+zsjflL+wzbK7vw64VutTXxMESydMLI/f9kW4MItryksvU
	5wkjp4WrLWAEZneHN5UNf0ShZ5h7Wfs+e2CXcpGqq20jELadjHLAQfUE7gk87wMPGR5/7eoUl/knr
	hiU+pMFeiY+LyyjMivesf9ehiRWPLYLtvfnZ1SMlC6fzv+oHRDhqOvEQRWyJLnKDgwlSA8FlBoeS4
	p9ZwxfhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyeQ-0000000AiDt-1NMQ;
	Fri, 12 Jun 2026 09:58:10 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyeJ-0000000Ai9D-14a0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 09:58:04 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39Bi53782209;
	Fri, 12 Jun 2026 02:57:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	pfpt0220; bh=Dk84ZQRgSc8xnw8MT3aYpxHJpf1SJ9OoPddG086vJpQ=; b=BQ0
	Dad5HB25OrjSOB+5Ez9ykAVegXrrEw9D76h7BlWHLoebh1ci43eyZmpb0A00/bW4
	4wKavL9L/k3PdzwOZ5oNpZLUiv/7mgdISIpJtIGNX+vJkjjceqs4hWk0k9rzk1Kc
	FiNXGRDUuT4FkIt1FsSO3TTaOdKgNVZfHrM9ui7cbPhQ2cdWB3wPLMJPzm8KCkJI
	yzRArx7HwJQbsLoL5Kf8Skj7mVVlnR1Z2QY7NxWaqIXixwrlfz/7O7PJwcHSUn2y
	S9ySA3ve5WMkpudJnQUifiqRK8ITYemzdPDHzLfTKMZ6E3K+g9MThxCW5Rx8XOFu
	OBTBDza4JQaMmaYheAw==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4er6r2hjq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jun 2026 02:57:51 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 12 Jun 2026 02:57:49 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Fri, 12 Jun 2026 02:57:49 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id A3EB23F7040;
	Fri, 12 Jun 2026 02:57:47 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>,
        <gakula@marvell.com>
Subject: [PATCH v2 0/3] perf: marvell: LLC-TAD PMU MPAM filtering support
Date: Fri, 12 Jun 2026 15:27:43 +0530
Message-ID: <20260612095746.19679-1-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA5MCBTYWx0ZWRfX8orRE9Qu8ZtH
 1qMvX4tzVG6OeL8pJndA2WjFBcpy7yqDIWp5UYRbIVsqLgHFoa5BjKE4nal0OuQTJFHnmqqKpMb
 CNtLwbjb/k6nHwtNHSXPflrgpzrWCUxN84widfQ8bFiIygsEoy93G/+kHx4KNo/VkaftWGl0oXH
 dAHmx00Toigyl/4t9Bm8i2B/uKmXbRlpN/Rp9oxrFleZkyjsmP9YkF5YX2odssnbVe5PbNATy5O
 hXn9D2mhPCBH97OE79slq2OkMAa1VwzLkWrUKwff+MBmfgZW+PcZWThdTA+tGWt1xk5HiCtlJJL
 K5U1n6DAW6/vxDRF30wk31LjIZgC7I3wwwUaanv9z3oBQoCFL0GZHhrvUUyWdVmHMQrCOPIFj0H
 13QhCkxHT350VE/lfyS9qMsFZ4MVDDhcWytDZKIL/83liQhok44waLl9s08UchEFeLpeOnPQDvq
 N/1yTiSFysH5aHW3/VA==
X-Authority-Analysis: v=2.4 cv=GoByPE1C c=1 sm=1 tr=0 ts=6a2bd81f cx=c_pps
 a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=qit2iCtTFQkLgVSMPQTB:22 a=M5GUcnROAAAA:8 a=KMVilSr8rocH2AwasoUA:9
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA5MCBTYWx0ZWRfXzbl0NpO/5elC
 y0L1rzoTwwa1ZnF6Cu5p/5Hv+OCl1iBCd3i3RPRwvlvSyPxwtKRlTSuxhaCT2PJlEJOwb/OQfmp
 VTWXXx027PnkN/CxbYJMiQAlkJmkhOI=
X-Proofpoint-GUID: KtVaQ1yIH1D98X_-_s8nIePreeDEcsUN
X-Proofpoint-ORIG-GUID: KtVaQ1yIH1D98X_-_s8nIePreeDEcsUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_025803_414941_93A005A7 
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

This series extends the Marvell LLC-TAD PMU driver for CN10K and CN20K
platforms by adding MPAM-based filtering support and introducing CN20K
hardware support.

Patch 1 adds optional MPAM partition-id (partid) filtering for the subset
of events that support it. The partid and partid_en fields are exposed via
the PMU format attribute, while platforms that do not support filtering
continue to expose a reduced event set without these fields.

This patch also includes several fixes and cleanups:
  - Avoid modifying platform_get_resource() bounds in-place
  - Validate the MMIO window size against tad-cnt
  - Correct ordering of perf registration and CPU hotplug with proper unwind
  - Align the filter-enable bit in config1 with the sysfs format (bit 9)

Patch 2 adds support for the CN20K LLC-TAD PMU. Compared to CN10K, CN20K
uses different PFC/PRF register offsets and introduces additional events.
This patch:
  - Adds a CN20K (V3) profile with platform-specific register offsets
  - Extends the event map and hides CN20K-only events on CN10K
  - Implements CN20K-specific MPAM encoding for filtering
  - Ensures correct counter initialization using local64_set(prev_count)
  - Adds device discovery via OF and ACPI (MRVL000F)

Patch 3 updates the Devicetree binding documentation to add support for
"marvell,cn20k-tad-pmu"


Changes since v1
----------------
- config1: use bit 9 for MPAM filter enable consistently with partid_en in
  the PMU format; allow only bits 0..9 in event_init on CN10K/CN20K paths.
- Hide V3-only sysfs events on V1.
- Reset prev_count when starting counters after clearing hardware.
- DT binding: explain non-fallback compatibles for CN10K vs CN20K.

Tanmay Jagdale (1):
  perf: marvell: Add MPAM partid filtering to CN10K TAD PMU

Geetha sowjanya (2):
  perf: marvell: Add CN20K LLC-TAD PMU support
  dt-bindings: perf: marvell: Extend CN10K TAD PMU binding for CN20K

Signed-off-by: Geetha sowjanya <gakula@marvell.com>

-- 
2.25.1

