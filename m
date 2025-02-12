Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B92C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=diCFLpm9wwGN8BtsuEDbSY381ASSh6O4E3ny6a9IRXE=; b=yStDMNKrisIRWvvym/bdmuB61j
	Hny3f9UW9NzGr0tmvh/16PQuNH1qVFNPaNN4+52GpYl9NlRQF2GME3guYEdmrEFbbXwFFEpOEnItH
	AfM71F/sDNR6PxBM4qAU+/RMms0pN6zFrKVZQn/sFTXbd4ZGiGaFIEyCpg7c3fZkE6FtB8lXmP6LP
	QnIjRb1ht3bIquvEBg/Lq54RauXZKkJlc+n6g52adxz+ybxSJ2k58zqii2z1Eq649+2N66v4lYbEJ
	eX7oh8aiv2MwfmIAm5lSRQ1AnBWtmRwhpJJ+pSJUi/KaaQacBOwqm4b5G2s63TJ8VhRQWTwfT96RG
	fL4kNZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBgD-00000007K1x-0Xb5;
	Wed, 12 Feb 2025 12:17:25 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBFM-00000007F1r-3PDy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:49:42 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CAi2N8008420;
	Wed, 12 Feb 2025 03:49:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=diCFLpm9wwGN8BtsuEDbSY3
	81ASSh6O4E3ny6a9IRXE=; b=UY1vuHyh/esvQPCbXT4G2msIlxHso0j52KNanRA
	MTq0w798G3oZYQPj/9h1tG/Tz2wTKXlxBailP/qHQyB2O5xsKg6aouhrm1rSszH6
	eIDTWcNJPrD7+sbCOoSWu5DWo7gYkJcADQtQEdpUdZ7ZaqAg6o+QgHLxkSpX2zCq
	TDRXlBar0CwT2j5DPm/6n5hel6qwai7/m+U4b5z1AU8VCAgAf+FTXxg8Vpo9Kfdf
	AEz9Mj0Jywr4G2RDziD+VIqeWystRsGQTbV7e5UpbWikMteE9RlXv6Co+bXXt0YH
	JBRr3+ZCgwwED2HP7mbP1vQrSBxFzPJ0VHfE28SYTm+4tvg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 44rn8c8mmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 03:49:31 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 12 Feb 2025 03:49:30 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 12 Feb 2025 03:49:30 -0800
Received: from virtx40.. (unknown [10.28.34.196])
	by maili.marvell.com (Postfix) with ESMTP id 85B485B693C;
	Wed, 12 Feb 2025 03:49:26 -0800 (PST)
From: Linu Cherian <lcherian@marvell.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>, <james.clark@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <devicetree@vger.kernel.org>, <sgoutham@marvell.com>,
        <gcherian@marvell.com>, Linu Cherian <lcherian@marvell.com>
Subject: [PATCH v14 0/8] Coresight for Kernel panic and watchdog reset
Date: Wed, 12 Feb 2025 17:19:10 +0530
Message-ID: <20250212114918.548431-1-lcherian@marvell.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: KgrdpqPRvKOlDG_PXkVJwJvVGckKx6vc
X-Proofpoint-GUID: KgrdpqPRvKOlDG_PXkVJwJvVGckKx6vc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_034940_984867_E2E90F79 
X-CRM114-Status: GOOD (  26.60  )
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

This patch series is rebased on coresight-next-v6.13.rc2

* Patches 1 & 2 adds support for allocation of trace buffer pages from
  reserved RAM
* Patches 3 & 4 adds support for saving metadata at the time of kernel panic 
* Patch 5 adds support for reading trace data captured at the time of panic
* Patches 6 & 7 adds support for disabling coresight blocks at the time of
  panic
* Patch 8: Gives the full description about this feature as part of
  documentation 

v13 is posted here,
https://lore.kernel.org/linux-arm-kernel/20241216053014.3427909-1-lcherian@marvell.com/

Changelog from v13:
* Changed the log levels of crc error check failure prints from dev_dbg to
  dev_err as suggested by Suzuki 
* Add metadata valid flag checks for successfully opening crashdata files,
  as suggested by Suzuki
* Report to the user during probe if valid crash tracedata is found,
  as suggested by Suzuki
* Added CRC recalculation upon barrier packet insertion for overflow
  cases, this fixes crc check failures upon subsequent boots
* Few other trivial cleanups suggested by Suzuki

Changelog from v12:
* Fixed wrong buffer pointer passed to coresigh_insert_barrier_packet  
* tmc_read_prepare/unprepare_crashdata need to be called only once and
  hence removed from read path and added to tmc_probe
* tmc_read_prepare_crashdata renamed to tmc_prepare_crashdata and
  avoid taking locks  as its moved to probe function.
* Introduced read status flag, "reading" specific to reserved buffer to keep the
  reserved buffer reading independent of the regular buffer.
* open/release ops for reserved buffer has to take care only about the
  set/unset the "reading" status flag as the reserved buffer is prepared
  during the probe time itself.  
* Few other trivial changes  

Changelog from v11:
Convert all commands to literal code blocks, that was missed out in v11.
No other code changes.

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
* While reading crashdata, size is now calculated from metadata instead 
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
 Documentation/trace/coresight/panic.rst       | 362 ++++++++++++++++++
 drivers/hwtracing/coresight/Makefile          |   2 +-
 .../coresight/coresight-cfg-preload.c         |   2 +
 .../coresight/coresight-cfg-preload.h         |   2 +
 .../hwtracing/coresight/coresight-cfg-pstop.c |  83 ++++
 drivers/hwtracing/coresight/coresight-core.c  |  42 ++
 .../hwtracing/coresight/coresight-tmc-core.c  | 321 +++++++++++++++-
 .../hwtracing/coresight/coresight-tmc-etf.c   |  92 ++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 184 ++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h   | 105 +++++
 include/linux/coresight.h                     |  12 +
 12 files changed, 1221 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/trace/coresight/panic.rst
 create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pstop.c

-- 
2.34.1


