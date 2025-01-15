Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634BFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlqhThizescGP6ZXihy7A2ZFIPb/nILyw3v/NmN1pNI=; b=yZxSpdJF2bktJ01eKouedIXB7A
	094OKJ9KD8KzEm8tBOkYTsj9bu9muYtTtLZ5Di9IOdI5korJie135l2aEC8DRnsBoAE1jTsWukwLG
	jSWCABPCWkY2uoo7US+Cf5x3tzzkPIF5Eu4VMvT4EEtqclv3jU49z5gns07lyfnSRy+qVksAytUvx
	UTaISts9iiHBi3EEzKYhxlRHcw22uxP500Xj/gdim+QAW0q9MzNQvKDSv1j4MCwXW+U2vGVi5JDJv
	kP86EHMjP17jckbAoEwTuqAqNEEwyJzrScTO7UButH0ti7L2zMeDV9Q7Vz+hZ9gET0IQHHeLy8kzK
	OPPI2e7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0XI-0000000BSsp-0C39;
	Wed, 15 Jan 2025 10:22:08 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0W2-0000000BSlV-3fDN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 10:20:52 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F9bE2L013425;
	Wed, 15 Jan 2025 02:20:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=ZlqhThizescGP6ZXihy7A2ZFI
	Pb/nILyw3v/NmN1pNI=; b=EaPFpucVlXjIj1UDf3qPES4VagKzoFWzvAFHyTW9P
	P4Bx6kEJrikmq4Me4dNVm/ICCMwXJ83bPJtYLaCLkUAKpcQ9Fo++XzXO1rLj+26A
	7NDMvq2XY8F/I2+TcPvcr06EKhY9d6cQGXuo2DC45gszWCfcdTV61NxID6tLda7+
	cGplVw9PaQDUwTzOBkjrEfd1MLfsYZoKs31FdTenCLVeFRFNr48Z/fYoPIu/oN3v
	HyqvfVjg01eSRHDBxVV0Zvbc7Y59cZURwpchVd3kB6MQitv9GuZit87QO3/MIvUj
	KRPYgJz/XfyEpd7GHNeDY4uh8VRGki/VwOrbK+DgQRTzA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 446aht02d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 02:20:42 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 15 Jan 2025 02:20:41 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 15 Jan 2025 02:20:41 -0800
Received: from hyd1403.caveonetworks.com (unknown [10.29.37.84])
	by maili.marvell.com (Postfix) with SMTP id BE8613F708C;
	Wed, 15 Jan 2025 02:20:36 -0800 (PST)
Date: Wed, 15 Jan 2025 15:50:35 +0530
From: Linu Cherian <lcherian@marvell.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>, <james.clark@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <devicetree@vger.kernel.org>, <sgoutham@marvell.com>,
        <gcherian@marvell.com>
Subject: Re: [PATCH v13 0/8] Coresight for Kernel panic and watchdog reset
Message-ID: <20250115102035.GA1406221@hyd1403.caveonetworks.com>
References: <20241216053014.3427909-1-lcherian@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241216053014.3427909-1-lcherian@marvell.com>
X-Proofpoint-GUID: 6aj2TyNIFZ0herCnXeSw-X9YNrIEYNE5
X-Proofpoint-ORIG-GUID: 6aj2TyNIFZ0herCnXeSw-X9YNrIEYNE5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_04,2025-01-15_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_022051_038276_F9DBF812 
X-CRM114-Status: GOOD (  38.12  )
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

Hi Suzuki,


On 2024-12-16 at 11:00:06, Linu Cherian (lcherian@marvell.com) wrote:
> This patch series is rebased on coresight-next-v6.12.rc4
> 
> * Patches 1 & 2 adds support for allocation of trace buffer pages from
>   reserved RAM
> * Patches 3 & 4 adds support for saving metadata at the time of kernel panic 
> * Patch 5 adds support for reading trace data captured at the time of panic
> * Patches 6 & 7 adds support for disabling coresight blocks at the time of panic
> * Patch 8: Gives the full description about this feature as part of documentation 

Do you have any further feedback on this ?

Thanks.

> 
> v12 is posted here,
> https://lore.kernel.org/linux-arm-kernel/20241129084714.3057080-1-lcherian@marvell.com/   
> 
> Changelog from v12:
> * Fixed wrong buffer pointer passed to coresigh_insert_barrier_packet  
> * tmc_read_prepare/unprepare_crashdata need to be called only once and
>   hence removed from read path and added to tmc_probe
> * tmc_read_prepare_crashdata renamed to tmc_prepare_crashdata and
>   avoid taking locks  as its moved to probe function.
> * Introduced read status flag, "reading" specific to reserved buffer to keep the
>   reserved buffer reading independent of the regular buffer.
> * open/release ops for reserved buffer has to take care only about the
>   set/unset the "reading" status flag as the reserved buffer is prepared
>   during the probe time itself.  
> * Few other trivial changes  
> 
> Changelog from v11:
> Convert all commands to literal code blocks, that was missed out in v11.
> No other code changes.
> 
> Changelog from v10:
> * Converted all csdev_access_* to readl functions in tmc_panic_sync_*
> * Added "tmc" prefix for register snapshots in struct tmc_crash_metadata
> * Converted dev_info to dev_dbg in panic handlers 
> * Converted dsb to dmb in panic handlers 
> * Fixed marking metadata as invalid when a user is trying to use the
>   reserved buffer. Earlier this was wrongly set at the time of reading
>   reserved trace buffer.
> * Moved common validation checks to is_tmc_crashdata_valid and minor
>   code rearrangements for efficiency
> * Got rid of sink specific prepare/unprepare invocations  
> * Got rid of full from struct tmc_resrv_buf
> * While reading crashdata, size is now calculated from metadata instead 
>   of relying on reserved buffer size populated by dtb 
> * Minor documenation fixes
> 
> Changelog from v9:
> * Add common helper function of_tmc_get_reserved_resource_by_name
>   for better code reuse
> * Reserved buffer validity and crashdata validity has been separated to
>   avoid interdependence
> * New fields added to crash metadata: version, ffcr, ffsr, mode
> * Version checks added for metadata validation
> * Special file /dev/crash_tmc_xxx would be available only when
>   crash metadata is valid
> * Removed READ_CRASHDATA mode meant for special casing crashdata reads.
>   Instead, dedicated read function added for crashdata reads from reserved
>   buffer which is common for both ETR and ETF sinks as well.
> * Documentation added to Documentation/tracing/coresight/panic.rst
> 
> Changelog from v8:
> * Added missing exit path on error in __tmc_probe.
> * Few whitespace fixes, checkpatch fixes.
> * With perf sessions honouring stop_on_flush sysfs attribute, 
>   removed redundant variable stop_on_flush_en. 
> 
> Changelog from v7:
> * Fixed breakage on perf test -vvvv  "arm coresight".
>   No issues seen with and without "resrv" buffer mode
> * Moved the crashdev registration into a separate function.
> * Removed redundant variable in tmc_etr_setup_crashdata_buf
> * Avoided a redundant memcpy in tmc_panic_sync_etf.
> * Tested kernel panic with trace session started uisng perf.   
>   Please see the title "Perf based testing" below for details.
>   For this, stop_on_flush sysfs attribute is taken into 
>   consideration while starting perf sessions as well. 
> 
> Changelog from v6:
> * Added special device files for reading crashdata, so that
>   read_prevboot mode flag is removed. 
> * Added new sysfs TMC device attribute, stop_on_flush.
>   Stop on flush trigger event is disabled by default. 
>   User need to explicitly enable this from sysfs for panic stop
>   to work.
> * Address parameter for panicstop ETM configuration is   
>   chosen as kernel "panic" address by default.
> * Added missing tmc_wait_for_tmcready during panic handling
> * Few other misc code rearrangements. 
> 
> Changelog from v5:
> * Fixed issues reported by CONFIG_DEBUG_ATOMIC_SLEEP
> * Fixed a memory leak while reading data from /dev/tmc_etrx in
>   READ_PREVBOOT mode
> * Tested reading trace data from crashdump kernel
> 
> Changelog from v4:
> * Device tree binding
>   - Description is made more explicit on the usage of reserved memory
>     region
>   - Mismatch in memory region names in dts binding and driver fixed
>   - Removed "mem" suffix from the memory region names
> * Rename "struct tmc_register_snapshot" ->  "struct tmc_crash_metadata",
>   since it contains more than register snapshot.
>   Related variables are named accordingly.
> * Rename struct tmc_drvdata members
>    resrv_buf -> crash_tbuf
>    metadata  -> crash_mdata
> * Size field in metadata refers to RSZ register and hence indicates the
>   size in 32 bit words. ETR metadata follows this convention, the same
>   has been extended to ETF metadata as well.
> * Added crc32 for more robust metadata and tracedata validation.
> * Added/modified dev_dbg messages during metadata validation
> * Fixed a typo in patch 5 commit description
> 
> Changelog from v3:
> * Converted the Coresight ETM driver change to a named configuration.
>   RFC tag has been removed with this change.
> * Fixed yaml issues reported by "make dt_binding_check"
> * Added names for reserved memory regions 0 and 1
> * Added prevalidation checks for metadata processing
> * Fixed a regression introduced in RFC v3
>   - TMC Status register was getting saved wrongly
> * Reverted memremap attribute changes from _WB to _WC to match
>   with the dma map attributes
> * Introduced reserved buffer mode specific .sync op.
>   This fixes a possible crash when reserved buffer mode was used in
>   normal trace capture, due to unwanted dma maintenance operations.
> 
> 
> 
> 
> Linu Cherian (8):
>   dt-bindings: arm: coresight-tmc: Add "memory-region" property
>   coresight: tmc-etr: Add support to use reserved trace memory
>   coresight: core: Add provision for panic callbacks
>   coresight: tmc: Enable panic sync handling
>   coresight: tmc: Add support for reading crash data
>   coresight: tmc: Stop trace capture on FlIn
>   coresight: config: Add preloaded configuration
>   Documentation: coresight: Panic support
> 
>  .../bindings/arm/arm,coresight-tmc.yaml       |  26 ++
>  Documentation/trace/coresight/panic.rst       | 362 ++++++++++++++++++
>  drivers/hwtracing/coresight/Makefile          |   2 +-
>  .../coresight/coresight-cfg-preload.c         |   2 +
>  .../coresight/coresight-cfg-preload.h         |   2 +
>  .../hwtracing/coresight/coresight-cfg-pstop.c |  83 ++++
>  drivers/hwtracing/coresight/coresight-core.c  |  42 ++
>  .../hwtracing/coresight/coresight-tmc-core.c  | 308 ++++++++++++++-
>  .../hwtracing/coresight/coresight-tmc-etf.c   |  92 ++++-
>  .../hwtracing/coresight/coresight-tmc-etr.c   | 184 ++++++++-
>  drivers/hwtracing/coresight/coresight-tmc.h   | 105 +++++
>  include/linux/coresight.h                     |  12 +
>  12 files changed, 1208 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/trace/coresight/panic.rst
>  create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pstop.c
> 
> -- 
> 2.34.1
> 
> 

