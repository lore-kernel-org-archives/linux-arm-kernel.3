Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03684C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iKmO5h0ivr+GWwteg1fLidZAV1kvvOVf7tyt0J1txmM=; b=2tiOknZyvWC4Ct
	mLMLaBHsN6UGB7In6mODMl2T/Kqu143CPj/KXqL+rwc6qbFqGj6hCDFa1MxSIhFoVHL1/00AIF+eg
	amZ2Ns66/F53rR4oCSGWh/7NFbPzpHxNV/AvkvfA4j51ymqM+hA9TRI3GVkk2Ss7xfhNru2si8Jxf
	6I/9CRZiuX314/qP183BVoSA0odG9Lq+3QqNVZIXan3S2Szcw50MzndwHiaIqUt8ZySjPHAL0eGnJ
	CDCXqi5GOlCIXf2vPh91CP7Myv3d3DOxMDATzhPwrNV4oA4/oW4VyHbgqsY03J2TwAfUPpTzFQ+zS
	H5+i8OL74k8j+9TvV1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RRK-00000006BZp-1JCJ;
	Tue, 15 Sep 2026 11:35:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RR9-00000006BKp-2KJd
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 11:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=iKmO5h0ivr+GWwteg1fLidZAV1kvvOVf7tyt0J1txmM=; b=XfVHOyNnXwEHAFlcYbdSFlwrd6
	NCAFog48jLPSQXZ6tm72gHqhzAcNSD+7JrLRGn4iHdMFet+X9tbFt390XGMjnzsIu09AgvsjPOTxc
	IEcZahi/omYQ3pOBPLpdObevZB1Qu2JHsgf4DbYgBY4oFXUjoNlviuFzq5r/GcvmyDfbuQ8LRZULa
	eH5L4+GzPFTXsSRq58SF4ELbfQ9rzQj3gHm02RJeWkckAUr+c2JMvUcc10P8FI7l8IU3n9uPPexaY
	0FHiFHaExL61W/LkeoxuygCA1A0u3bAi2Uz96KSt6vg/xmntN0BMv/ULuRzruVqpmZ48UnRBt3F/q
	1xVYb9BA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6RR5-00000006e65-1sqH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:34:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5958D153B;
	Tue, 15 Sep 2026 04:34:46 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34FEF3F86F;
	Tue, 15 Sep 2026 04:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789472089; bh=ASSjsXnuAzfqz0oWZqhM1o3UsUzefrnFTTMP5w2pCFk=;
	h=From:Subject:Date:To:Cc:From;
	b=NQKTWTzczili1mqN98mR45xKrLn/c4BJ83oQqCk1DUuAoWu1qWdkuobV3gO6r8RXN
	 3hqhSh/IOIdsShyaRJhVE9bqDkYdJR/V4Fy4tl2mKrxnuFf96+M3ke1w41EjOnh5eS
	 4Zg0WDpLPwQZf+x+9h1p3z1lx8ScVTKuyF8gCa+Q=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v11 0/9] fix several inconsistencies with sysfs
 configuration in etmX
Date: Tue, 15 Sep 2026 12:34:35 +0100
Message-Id: <20260915-separate_etm_cfg_v2-v11-0-d2b258d51747@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEwtqWoC/32NTQqDMBCFryKzbkomxZ905T2KSIwTnYVGkiAt4
 t2beoAu38d73zsgUmCK8CwOCLRzZL/mgHgrwM5mnUjwmAEoqSqpEUWkzQSTqKe09NZN/a7Eo8T
 GYNXYwTnIyy2Q4/elfXU5zxyTD5/rZUf5w/+FuSSkwKHGctSlVrVpTVju1i/Qnef5BTAch1a3A
 AAA
To: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4871; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=ASSjsXnuAzfqz0oWZqhM1o3UsUzefrnFTTMP5w2pCFk=;
 b=kA0DAAoBbdXD0VrFMTMByyZiAGqpLVGij0h5BDqLSBuiBFYD4Nv4RnptiWxeS4smV8yGblVep
 okBswQAAQoAHRYhBC2D4JLdBTO4WHWknW3Vw9FaxTEzBQJqqS1RAAoJEG3Vw9FaxTEzTZYMAMlA
 7SScm6mCVsze05suXyXFxjPgk29htCaMe3/+PalNPJj4TzuTDB1TYITaGpquyXHqZh+P4zBPo8u
 8aANH1W8myAF9gCPP9lLhmzMH6FxWdvLY5v08eWF5yw2CAYcRpKUo+M0JRP2JOGncgnRM6G75w9
 da8E/nssLH9WDPl7VS8/AxHiM7QiBwyg8Zsuro0h/SpuRXc91HpMecwtepjcjrqLmKmcT+Wnho2
 4WPjUP1pDHQ/XUtlrz10vVTcg14E9CjgTNcH5NWsbw/LPueoYUuZ+T+StijRWcU9QJMoMmuPr2Z
 NLgufhL1inGouZ29e6hDJAztc2ZX1uYMEMsZm3PwqBJbtbLK7oHN+QbfuE93kjnFpv/1DgukgfX
 eOsQwy2KPX47NgUVfjIimcJjnLQCxrkbNnVBcUHoeknGfAFlYMx6mWSJNndM5hSM5IPHb3IJX+G
 g+TZKjcO3UyUuk0Qx1Gb/WtHCLgphoQZH+drW1BlM0CxXKjAuOTaYX5k2BJw==
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_123452_172113_976556DE 
X-CRM114-Status: GOOD (  13.07  )
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

The current ETMx configuration via sysfs can lead to the following
inconsistencies:

  - If a configuration is modified via sysfs while a perf session is
    active, the running configuration may differ between before
    a sched-out and after a subsequent sched-in.

  - If a perf session and sysfs session tries to enable concurrently,
    configuration from configfs could be corrupted (etm4).

  - There is chance to corrupt drvdata->config if perf session tries
    to enabled among handling cscfg_csdev_disable_active_config()
    in etm4_disable_sysfs() (etm4).

To resolve these inconsistencies, the configuration should be separated into:

  - active_config, which is applied configuration for the current session
  - config, which stores the settings configured via sysfs.

and apply configuration from configfs after taking a mode.

Patch History
=============
from v10 to 11:
  - replace direct register read from etm3 sysfs with IPI.
  - fix issue cntr_val and others field which required to be shown after
    sysfs session disable.
  - prohibit the write for some etm3 sysfs while sysfs session is
    enabled.
  - drop locktype change in etm3
  - Link to v10: https://lore.kernel.org/r/20260911-separate_etm_cfg_v2-v10-0-1b715d95927a@arm.com

from v9 to v10:
  - rebase to coresight/next
  - https://lore.kernel.org/all/20260725113645.57519-1-yeoreum.yun@arm.com/

from v8 to v9:
  - add feat_csdev_lock guard interface.
  - set feat_csdev->drv_spinlock as NULL for etmv4_drvdata.
  - https://lore.kernel.org/all/20260629090007.1718746-1-yeoreum.yun@arm.com/

from v7 to v8:
  - accept @Leo Yan' suggestion to handle error.
  - small minor fixes following @Suzuki' suggestion.
  - https://lore.kernel.org/all/20260519154812.254884-1-yeoreum.yun@arm.com/

from v6 to v7:
  - rebase on coresight/next
  - add ETM_MAX_SEQ_TRANSITIONS define
  - remove redundant patch relavent cpu-hotplug as coresight-pm patch
    merged.
  - https://lore.kernel.org/all/20260422132203.977549-1-yeoreum.yun@arm.com/

from v5 to v6:
  - fix missing of calling cscfg_csdev_disable_active_config()
  - add rb & fixes tags.
  - add ss_status field in etm4x_drvdata to expose STATUS and PENDING bits.
  - https://lore.kernel.org/all/20260415165528.3369607-1-yeoreum.yun@arm.com/

from v4 to v5:
  - add rb-tag.
  - fix underflow issue for nrseqstate.
  - fix wrong check in etm4_sspcicrn_present().
  - remove redundant fields on etmv4_save_state.
  - rename caps->ss_status to ss_cmp.
  - fix wrong location of etm4_release_trace_id.
  - https://lore.kernel.org/all/20260413142003.3549310-1-yeoreum.yun@arm.com/

from v3 to v4:
  - change etm_drvdata->spinlock type to raw_spin_lock_t
  - remove redundant call etmX_enable_hw() with starting_cpu() callsback.
  - fix missing trace id release.
  - add missing docs.
  - https://lore.kernel.org/all/20260412175506.412301-1-yeoreum.yun@arm.com/

from v2 to v3:
  - fix build error for etm3x.
  - fix checkpatch warning.
  - https://lore.kernel.org/all/20260410074310.2693385-1-yeoreum.yun@arm.com/

from v1 to v2
  - rebased to v7.0-rc7.
  - introduce etmX_caps structure to save etmX's capabilities.
  - remove ss_status from etmv4_config.
  - modify active_config after taking a mode (perf/sysfs).
  - https://lore.kernel.org/all/20260317181705.2456271-1-yeoreum.yun@arm.com/

---
Yeoreum Yun (9):
      coresight: etm4x: prohibit modifying ss_status and cntr_val while session is enabled
      coresight: etm3x: prohibit modifying cntr_val and reset while session is enabled
      coresight: etm4x: fix inconsistencies with sysfs configuration
      coresight: etm3x: fix inconsistencies with sysfs configuration
      coresight: etm3x: remove redundant cpu online check on etm_enable_sysfs()
      coresight: etm4x: introduce struct etm4_caps
      coresight: etm4x: exclude ss_status from drvdata->config
      coresight: etm4x: remove s_ex_level from config
      coresight: etm3x: introduce struct etm_caps

 drivers/hwtracing/coresight/coresight-config.c     |  18 +-
 drivers/hwtracing/coresight/coresight-config.h     |  22 ++
 drivers/hwtracing/coresight/coresight-etm.h        |  46 ++-
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 126 +++---
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    | 104 +++--
 drivers/hwtracing/coresight/coresight-etm4x-cfg.c  |  14 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 426 +++++++++++----------
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    | 210 ++++++----
 drivers/hwtracing/coresight/coresight-etm4x.h      | 196 +++++-----
 9 files changed, 676 insertions(+), 486 deletions(-)
---
base-commit: 9e3604d7369cfc0110100eb1a0acab1865ee2d18
change-id: 20260911-separate_etm_cfg_v2-3518a168cbff

Best regards,
-- 
Sincerely,
Yeoreum Yun


