Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138F0E7E0BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 18:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tn+Y5K6mgIyE2sJagfcTgS9CRCNuETXIR8tZ2e08rcA=; b=LJV1tP2SGS4haq
	t9G3wl9y6kdAXUGWNAjNFIhfdlgiaIzCn02cN5dndLQbtGWCBuDxhBehnWWKPc4RD/BS/zakxiyI9
	7QUeHZcnPEpsvSkSYqEe0bmBP6gk2fVbts2VvAkUe2qEHbrhDXYuX1a06yGLyvg+hEtBe5WlaEvcl
	kyJ0AHv2jF0s0P8TVExeT2zktBnEfIMBlPLHk9V2w2acK5zjlNRM1yeRBRZZwytG74IaC2w4Awr27
	KoWHqfGCZADckVMDybQ6MQ1Zo69wdrH98gj/5QCDZ/gAvr040madcs37KfTxfshQObJaRBlIKJ/vt
	ir+lHyQE22z9wnVmP1KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZj-0000000ForH-3t0z;
	Mon, 09 Feb 2026 18:01:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZh-0000000FoqY-0Cyt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 18:01:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3260D339;
	Mon,  9 Feb 2026 10:01:20 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8024A3F63F;
	Mon,  9 Feb 2026 10:01:24 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 0/8] coresight: cti: Miscellaneous fixes and CPU PM cleanup
Date: Mon, 09 Feb 2026 18:01:10 +0000
Message-Id: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOYgimkC/4XOQQqDMBAF0KtI1rVkJppIV71HKZLEac1CLYmEF
 vHuHbtpuxJC4M98XrKIRDFQEqdiEZFySGEaOcChEL63453K0HEWKLEGRFXaOLR+ipTCvZ9bP4c
 20s36eYpthtJoAtfZxhnQgo0HL8Pz41+unPuQuPn6PJdhm26ylgB6R+YjS1dJXTv0QJ06c//op
 0FsbsYfS8k9C9nSum70TXZojPy31Nfia89SbBlLHmvnKqSff63r+gZqNPWtYAEAAA==
X-Change-ID: 20251223-arm_coresight_cti_refactor_v1-76e1bda8b716
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tingwei Zhang <quic_tingwei@quicinc.com>, 
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
 Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770660084; l=2713;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=t9k1RuHaosmCEQm35jfU9xgYm7wZ3R/c4+/rBeubP/w=;
 b=AaihBKdEyN1nqICK1FYaICovaTll3U7NZJJ7jXjRfBcpsfUhyGEX2IzFdsNBFcTp7RL7Bopk9
 +oroqcHByF6BuH2j0ssRwVOsueN6mYA6p8OY7HNXzBpPBZOcGYlNLKE
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_100129_226007_16C42A56 
X-CRM114-Status: GOOD (  11.23  )
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

The CPU power management issue in the CTI driver was first observed in
series [1]; this series resolves that issue.  It fixes bugs and removes
CPU PM operations from the CoreSight CTI driver, the goal is to use the
CoreSight core layer as the central place for CPU power management.
Removing CPU PM from CTI driver can avoid conflicts with the core layer.

Based on review of the Arm ARM, ASICCTL is the only CTI register that
could potentially reside in the CPU power domain.  However, this is
considered highly unlikely for the following reasons:

 - Standard Arm CTIs place the ASICCTL register in the debug power
   domain;
 - ASICCTL is implemented only when CTIDEVID.EXTMUXNUM is non-zero,
   which is rare for CPU CTIs.

As a result, it is safe to remove the CPU PM code as done in this
series.  In addition, avoiding support local CPU access (via SMP calls)
to ASICCTL significantly reduces driver complexity.

If a future hardware implements ASICCTL in the CPU power domain, we can
consider adding a property to describe that characteristic.  That said,
from a software point of view, keeping all CTI registers in the same
power domain is preferable, as it makes the driver implementation much
simpler.

This series can be divided into:

  Patches 01 ~ 02: Fix spinlock with irqsave and register read with CS
                   lock.
  Patches 03 ~ 08: Access ASICCTL condintioanlly, remove CPU PM code,
                   and refactor register access in sysfs knob.

This series is based on coresight-next branch and has been validated on
Juno r1 and r2 platforms, pass normal sysfs and perf test, as well as
CPU PM stress testing.

[1] https://lore.kernel.org/all/20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com/

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (8):
      coresight: cti: Make spinlock usage consistent
      coresight: cti: Fix register reads
      coresight: cti: Access ASICCTL only when implemented
      coresight: cti: Remove CPU power management code
      coresight: cti: Rename cti_active() to cti_is_active()
      coresight: cti: Remove hw_powered flag
      coresight: cti: Remove hw_enabled flag
      coresight: cti: Refactor cti_reg32_{show|store}()

 drivers/hwtracing/coresight/coresight-cti-core.c  | 278 ++++------------------
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 168 ++++++-------
 drivers/hwtracing/coresight/coresight-cti.h       |  13 +-
 3 files changed, 134 insertions(+), 325 deletions(-)
---
base-commit: eebe8dbd8630f51cf70b1f68a440cd3d7f7a914d
change-id: 20251223-arm_coresight_cti_refactor_v1-76e1bda8b716

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


