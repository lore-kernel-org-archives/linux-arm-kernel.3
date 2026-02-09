Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D11E81BAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 12:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zdc497GG1KOf30pg/iE9oVzUkgCDHqjR3oBDRn9fCzM=; b=FNNE3m/ApkVVe6
	5AZkzUjY9C/QT0i1DMiothBGZ1Qc0yrEl5hXhy3pUlSRN5hELdqFHmCIhy7hGzRrI3WLnUcaLW6ZY
	MWPCUwd6KsTEppcj12s2sMarmtjwjsDb7a5Xdbr6cnGdnwpDEkreqfwdtmp+9gpJUI9FSCXvugEas
	3wtBFi/rSgqfsQ88bmCgb+dkRrCQ8fufSW544ruETAEsN5deWAXoLIV+4s3+gEP1CO7hBdyTzTwCQ
	pRvR9yNNcA5/QDizO8oII44zhoss65B0rB3nDo4oN2t/Nc6dltG6r9eFW0yTqKmMDvl9/35HTdzXB
	q8LYUZmfwOCEJnQ7ZtCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdL-0000000FNJC-2U5u;
	Mon, 09 Feb 2026 12:44:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdJ-0000000FNIf-1NWS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 12:44:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9902339;
	Mon,  9 Feb 2026 04:44:45 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78C643F63F;
	Mon,  9 Feb 2026 04:44:50 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 0/8] coresight: Fix device registration and
 unregistration
Date: Mon, 09 Feb 2026 12:44:32 +0000
Message-Id: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALDWiWkC/43NTQqDMBAF4KuUrJuSP9PaVe9RisRx1Cw0JZHQI
 t69o1Dcuhl4w5tvZpYwekzsfppZxOyTDyMFcz4x6N3YIfcNZaaEskIqwV0cKggRk+/6qYrYOph
 CrBrMFDqfJoy8lRaELZvayIaR9Kaa/2xfni/KPdVC/G5Ps1q3f98e8rPigteF0yCMkSCLB11dI
 Axs1bPeRRrHRE2i0KpU5irA3GAXl2X5Ab5y9ukmAQAA
X-Change-ID: 20260120-arm_coresight_refactor_dev_register-f16c069db41d
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770641090; l=3675;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qKQ5jPe/Oi4Fig+Kanu6SOqKwARYQuVpUCNCRebWYu8=;
 b=bvuUk+VLr+c1BzGIGkwMgpLYivIl8JxVn2kO0oO8W/3FOQ3DctO6rI9fM6qeoVqK98Q8Kx1Vi
 mgz5KWTAUzXBOAIHTAUFMbgPee01ZFhW2+6J6pCq+6hjiYV7Ca/yEKs
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_044453_467684_56324DEA 
X-CRM114-Status: GOOD (  11.28  )
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

This series is to fix and refactor CoreSight device registration and
unregistration, it can be divided into three small parts:

  Patches 01-03: Three fixes for memory leak, device reference and mutex
                 protection.
  Patches 04-05: Move connection cleanup operations into
                 coresight_remove_conns().
  Patches 06-08: Refactor error handling in coresight_register().

This series is verified on Juno board.

---
Changes in v4:
- Applied James' review tags on patches 01-07.
- Kept the "registered" flag to use central place for mutex release
  (James / Suzuki).
- Link to v3: https://lore.kernel.org/r/20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com

Changes in v3:
- Updated patch 01 to use coesight core layer for device index list
  (Suzuki).
- Link to v2: https://lore.kernel.org/r/20260126-arm_coresight_refactor_dev_register-v2-0-b5a3c0441c15@arm.com

Changes in v2:
- Refined the commit log in patch 06 (Suzuki).
- Unified to call coresight_unregister() for error handling (Suzuki).
- Refactor connection and sysfs group release.
- Link to v1: https://lore.kernel.org/linux-arm-kernel/20250512154108.23920-1-leo.yan@arm.com/

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>
To: James Clark <james.clark@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Leo Yan <leo.yan@arm.com>

---
Leo Yan (8):
      coresight: Fix memory leak in coresight_alloc_device_name()
      coresight: Get parent device reference after sink ID map allocation
      coresight: Protect unregistration with mutex
      coresight: Refactor output connection sysfs link cleanup
      coresight: Refactor sysfs connection group cleanup
      coresight: Move sink validation into etm_perf_add_symlink_sink()
      coresight: Do not mix success path with failure handling
      coresight: Unify bus unregistration via coresight_unregister()

 drivers/hwtracing/coresight/coresight-catu.c       |   4 +-
 drivers/hwtracing/coresight/coresight-core.c       | 214 +++++++++++++--------
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |   4 +-
 drivers/hwtracing/coresight/coresight-cti-core.c   |  19 +-
 drivers/hwtracing/coresight/coresight-dummy.c      |   7 +-
 drivers/hwtracing/coresight/coresight-etb10.c      |   4 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |   5 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |   4 +-
 drivers/hwtracing/coresight/coresight-platform.c   |   2 +-
 drivers/hwtracing/coresight/coresight-priv.h       |   3 +-
 drivers/hwtracing/coresight/coresight-replicator.c |   4 +-
 drivers/hwtracing/coresight/coresight-stm.c        |   4 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  12 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       |   4 +-
 drivers/hwtracing/coresight/coresight-tpda.c       |   4 +-
 drivers/hwtracing/coresight/coresight-tpdm.c       |   4 +-
 drivers/hwtracing/coresight/coresight-tpiu.c       |   4 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c         |   4 +-
 include/linux/coresight.h                          |  14 +-
 19 files changed, 167 insertions(+), 153 deletions(-)
---
base-commit: eebe8dbd8630f51cf70b1f68a440cd3d7f7a914d
change-id: 20260120-arm_coresight_refactor_dev_register-f16c069db41d

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


