Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08868E7314E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RQTsMr+lTOpu6B5pUiiE93BdsQuNRWqfW/evCNJlH4c=; b=VgBbVDyW48noyu
	IgewRsq2m1mORbTFv+/v+YFHv4gA5RRoMjf1C61pFyy1Qruq4zv8wafM4pURf9J1LGASe4uNosam4
	KvctA0ejOi6FRhP2pR50r0kq2DFL8/u34FKPQgTzVeXffcKkPkNtW1Ml6IQCQoB53+Ur56xfaUEIw
	w9Cxm9plfidpuDDXS2HPb/miY7KGnZmhJSqxEL5J8VPJkqVwAu3uxKcueOH/lwFFwXdOSdQe8B37o
	Mv0Dx3XhqFnpoc7at7eS8rvmkujQXuoaNulEFfLP865mFInbzV6///Eu6Ei8miYoIMyLXqZk+YFMj
	KjSaNTlxtQgMrGaIaCQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqKD-00000004iBN-1M4J;
	Mon, 02 Feb 2026 09:34:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqKB-00000004iAe-15mu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 09:34:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDE07339;
	Mon,  2 Feb 2026 01:34:17 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D6A93F740;
	Mon,  2 Feb 2026 01:34:22 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v3 0/8] coresight: Fix device registration and
 unregistration
Date: Mon, 02 Feb 2026 09:33:56 +0000
Message-Id: <20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVvgGkC/42NwQqDMBBEf6Xk3JQkaqA99T+KSNysugdN2UhoE
 f+9W6H3Ht8w82ZTGZkwq9tpU4yFMqVFoDqfFExhGVFTFFbOOG+sMzrw3EFizDROa8c4BFgTdxG
 LwEh5RdaD9WD8Nfa1jUpMT6nR63h5tMKT1BK/j9PivunP7//yF6eN7ptQgalrC7a5y+oCaVbtv
 u8fY2fSg9QAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770024862; l=3686;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=DmjbDlzT0f1zqFRseblFfl6EnZmEnjYn41rANQon/5s=;
 b=sfolEIqWg+TKNlD6h9rHtG9GR1b0ZhjO0l6tCFrV79wSrEpjRU0XYXVf1qsoaUPyUZ0T7eeDq
 rDVlEVCx93iDrNdYjHYoGRnOMpnafC0z7/gEwocZSq7pX/UwQ+16+8F
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_013427_422427_2D8E216B 
X-CRM114-Status: GOOD (  12.16  )
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

This series is verified on Juno board with kmemleak detector.

For kmemleak verifying:

  echo clear > /sys/kernel/debug/kmemleak
  insmod coresight modules
  rmmod coresight modules
  echo scan > /sys/kernel/debug/kmemleak

The result shows no memory leak during a cycle of device registration
and unregistration.

---
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
      coresight: Unify error handling in coresight_register()

 drivers/hwtracing/coresight/coresight-catu.c       |   4 +-
 drivers/hwtracing/coresight/coresight-core.c       | 230 +++++++++++++--------
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
 19 files changed, 175 insertions(+), 161 deletions(-)
---
base-commit: eebe8dbd8630f51cf70b1f68a440cd3d7f7a914d
change-id: 20260120-arm_coresight_refactor_dev_register-f16c069db41d

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


