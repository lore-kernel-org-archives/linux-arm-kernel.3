Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1580FD2E9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 12:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/dZXX6cXhLQs1S8aVcJyXdTyEsRgJq2rjEjW3RafsgQ=; b=sE2NoghJH9180SYODAjOHLLtA+
	RcWw36ntuvsCZhQWzvtlyB4K6u3BoVAZ30IfnQgjxY22xKtSK+DAuHUh73qA7azSQRTi56sxaO/BV
	+OdhgOpe3tuemXOUaSk2H03QRwFR+wy8zL/Q2u2Z9VtBYnBYom8l87Q4U9xu72luAmhtUaAGM4h4K
	wOqj5rFwFjYztO29eOcRyZd7ROAxprnWMb9vuQBASj8hnabJhbe+ecjJEo6gBg7g8KLYmUv2I3V7c
	EihCHw9YsJPPCmigjUSBmg5PC6KMyYvocqDl2c+PooCPWTtKLe/w4c6qyNOPJsvb+2C29iDyaZyhR
	AE1/JjXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tATrn-0000000037I-0yon;
	Mon, 11 Nov 2024 12:50:03 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tATpv-000000002SE-0VRV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 12:48:09 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABCEwcq030976;
	Mon, 11 Nov 2024 04:47:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=/dZXX6cXhLQs1S8aVcJyXdT
	yEsRgJq2rjEjW3RafsgQ=; b=HUggambrkZbaNegBGaUAjf9++RRsHZqh8z4j3FZ
	0H+S89OKKBphM21EOMF1n6OeAm1iZFLvr8ZfaUyYu1yVfHjdmeuCE1WuZD0lwd9Z
	p6BMq7zRQf0Y1bYcXziGV61r8duwJ1wBAug50IiOPOShUf5Q0dDkfw0PK9REgjRe
	FiZesaqq+De6o9MgDi1vpStuy3UkD9F4zl/y6ccliygay5k4teffCaV0EeleUQwk
	qe+y0jEC+ARff/HppFvU+i2eVp5h81hoeS6keBM3VeEbghOR+e6bCZjZtVUSzDOT
	yJ7mLDPDEsu/kfw03VrwXzRjGkiT2zSU+RPHYOmiixtgBvQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 42uhrrg1bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 04:47:58 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 11 Nov 2024 04:47:58 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 11 Nov 2024 04:47:57 -0800
Received: from virtx40.. (unknown [10.28.34.196])
	by maili.marvell.com (Postfix) with ESMTP id 0EACF3F70AE;
	Mon, 11 Nov 2024 04:47:52 -0800 (PST)
From: Linu Cherian <lcherian@marvell.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>, <james.clark@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <devicetree@vger.kernel.org>, <sgoutham@marvell.com>,
        <gcherian@marvell.com>, Linu Cherian <lcherian@marvell.com>
Subject: [PATCH v11 0/8] Coresight for Kernel panic and watchdog reset
Date: Mon, 11 Nov 2024 18:17:38 +0530
Message-ID: <20241111124746.2210378-1-lcherian@marvell.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: AUBVls4F4PdgGNZHrJD0a0CJR_jgXIj9
X-Proofpoint-ORIG-GUID: AUBVls4F4PdgGNZHrJD0a0CJR_jgXIj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_044807_306146_6E515230 
X-CRM114-Status: GOOD (  22.30  )
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

This patch series is rebased on coresight-next-v6.12.rc4

* Patches 1 & 2 adds support for allocation of trace buffer pages from reserved RAM
* Patches 3 & 4 adds support for saving metadata at the time of kernel panic 
* Patch 5 adds support for reading trace data captured at the time of panic
* Patches 6 & 7 adds support for disabling coresight blocks at the time of panic
* Patch 8: Gives the full description about this feature as part of documentation 

V10 is posted here,
https://lore.kernel.org/linux-arm-kernel/20240916103437.226816-1-lcherian@marvell.com/

Changelog from v10:
* Converted all csdev_access_* to readl functions in tmc_panic_sync_*
* Added "tmc" prefix for register snapshots in struct tmc_crash_metadata
* Converted dev_info to dev_dbg in panic handlers 
* Converted dsb to dmb in panic handlers 
* Fixed marking metadata as invalid when a user is trying to use the
  reserved buffer. Earlier this was wrongly set at the time of reading
  reserved trace buffer.
* Moved common validation checks to is_tmc_crashdata_valid and minor
  code rearrangements for efficiency
* Got rid of sink specific prepare/unprepare invocations  
* Got rid of full from struct tmc_resrv_buf
* While reading crashdata, size is now calculated from metdata instead 
  of relying on reserved buffer size populated by dtb 
* Minor documenation fixes

Changelog from v9:
* Add common helper function of_tmc_get_reserved_resource_by_name
  for better code reuse
* Reserved buffer validity and crashdata validity has been separated to
  avoid interdependence
* New fields added to crash metadata: version, ffcr, ffsr, mode
* Version checks added for metadata validation
* Special file /dev/crash_tmc_xxx would be available only when
  crash metadata is valid
* Removed READ_CRASHDATA mode meant for special casing crashdata reads.
  Instead, dedicated read function added for crashdata reads from reserved
  buffer which is common for both ETR and ETF sinks as well.
* Documentation added to Documentation/tracing/coresight/panic.rst

Changelog from v8:
* Added missing exit path on error in __tmc_probe.
* Few whitespace fixes, checkpatch fixes.
* With perf sessions honouring stop_on_flush sysfs attribute, 
  removed redundant variable stop_on_flush_en. 

Changelog from v7:
* Fixed breakage on perf test -vvvv  "arm coresight".
  No issues seen with and without "resrv" buffer mode
* Moved the crashdev registration into a separate function.
* Removed redundant variable in tmc_etr_setup_crashdata_buf
* Avoided a redundant memcpy in tmc_panic_sync_etf.
* Tested kernel panic with trace session started uisng perf.   
  Please see the title "Perf based testing" below for details.
  For this, stop_on_flush sysfs attribute is taken into 
  consideration while starting perf sessions as well. 

Changelog from v6:
* Added special device files for reading crashdata, so that
  read_prevboot mode flag is removed. 
* Added new sysfs TMC device attribute, stop_on_flush.
  Stop on flush trigger event is disabled by default. 
  User need to explicitly enable this from sysfs for panic stop
  to work.
* Address parameter for panicstop ETM configuration is   
  chosen as kernel "panic" address by default.
* Added missing tmc_wait_for_tmcready during panic handling
* Few other misc code rearrangements. 

Changelog from v5:
* Fixed issues reported by CONFIG_DEBUG_ATOMIC_SLEEP
* Fixed a memory leak while reading data from /dev/tmc_etrx in
  READ_PREVBOOT mode
* Tested reading trace data from crashdump kernel

Changelog from v4:
* Device tree binding
  - Description is made more explicit on the usage of reserved memory
    region
  - Mismatch in memory region names in dts binding and driver fixed
  - Removed "mem" suffix from the memory region names
* Rename "struct tmc_register_snapshot" ->  "struct tmc_crash_metadata",
  since it contains more than register snapshot.
  Related variables are named accordingly.
* Rename struct tmc_drvdata members
   resrv_buf -> crash_tbuf
   metadata  -> crash_mdata
* Size field in metadata refers to RSZ register and hence indicates the
  size in 32 bit words. ETR metadata follows this convention, the same
  has been extended to ETF metadata as well.
* Added crc32 for more robust metadata and tracedata validation.
* Added/modified dev_dbg messages during metadata validation
* Fixed a typo in patch 5 commit description

Changelog from v3:
* Converted the Coresight ETM driver change to a named configuration.
  RFC tag has been removed with this change.
* Fixed yaml issues reported by "make dt_binding_check"
* Added names for reserved memory regions 0 and 1
* Added prevalidation checks for metadata processing
* Fixed a regression introduced in RFC v3
  - TMC Status register was getting saved wrongly
* Reverted memremap attribute changes from _WB to _WC to match
  with the dma map attributes
* Introduced reserved buffer mode specific .sync op.
  This fixes a possible crash when reserved buffer mode was used in
  normal trace capture, due to unwanted dma maintenance operations.



Linu Cherian (8):
  dt-bindings: arm: coresight-tmc: Add "memory-region" property
  coresight: tmc-etr: Add support to use reserved trace memory
  coresight: core: Add provision for panic callbacks
  coresight: tmc: Enable panic sync handling
  coresight: tmc: Add support for reading crash data
  coresight: tmc: Stop trace capture on FlIn
  coresight: config: Add preloaded configuration
  Documentation: coresight: Panic support

 .../bindings/arm/arm,coresight-tmc.yaml       |  26 ++
 Documentation/trace/coresight/panic.rst       | 356 ++++++++++++++++++
 drivers/hwtracing/coresight/Makefile          |   2 +-
 .../coresight/coresight-cfg-preload.c         |   2 +
 .../coresight/coresight-cfg-preload.h         |   2 +
 .../hwtracing/coresight/coresight-cfg-pstop.c |  83 ++++
 drivers/hwtracing/coresight/coresight-core.c  |  42 +++
 .../hwtracing/coresight/coresight-tmc-core.c  | 326 +++++++++++++++-
 .../hwtracing/coresight/coresight-tmc-etf.c   |  92 ++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 181 ++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h   | 104 +++++
 include/linux/coresight.h                     |  12 +
 12 files changed, 1216 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/trace/coresight/panic.rst
 create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pstop.c

-- 
2.34.1


