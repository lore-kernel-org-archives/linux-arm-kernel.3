Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFA2D13C15
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I05K0xtmzar37AGg2mjHkTtiRO9FW9E+fYZ1hGyNGMw=; b=ZF7r2nNfWRV2IH
	Y+iUmJh9b6gihOkCNHNVCv6VNCtw/L2k63ybCcuKTayf5eNdUP7EpjRm1FP3aonXPDpc5/SHAiorv
	WqPdXPbloHl4PgeKXbeli1kslQ0JJUTpY5fcPiRJ5pcMMljzFr3V9fv/S+y7ccA0GybruHXww/Pvu
	4UknT35OfeACTmN4GCRSsB/lDaHilJ9JmtbcJGqGcL0OKu5Bqg7w1rliTm461Fe1o1pJC/+R+R8q9
	wHvgyZQ4/QIDIczX9JvNTi6nxwrI27XBlpwtnGKwi5bkJq4b6mmhqK7ENO6n0T4qhfi9MJPrLX1h7
	i20/Fk+ZEjv8DHEOeuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1J-0000000Ce7m-161D;
	Mon, 26 Jan 2026 13:52:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1G-0000000Ce6D-3YDV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:52:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96E98339;
	Mon, 26 Jan 2026 05:52:32 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 600833F632;
	Mon, 26 Jan 2026 05:52:37 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 0/8] coresight: Fix device registration and
 unregistration
Date: Mon, 26 Jan 2026 13:52:00 +0000
Message-Id: <20260126-arm_coresight_refactor_dev_register-v2-0-b5a3c0441c15@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIFxd2kC/x3NQQqDMBCF4avIrA0kQQLtVYqEmIxxFjVlJogg3
 t2hyw9+3rtAkAkF3sMFjAcJtV3hxwHylvaKhooavPXBOm9N4m/MjVGobj0yrin3xrHgoagkHdm
 sLmQbXmWZXAFd+mlG5//lM9/3A/WsWqZ1AAAA
X-Change-ID: 20260120-arm_coresight_refactor_dev_register-f16c069db41d
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769435557; l=2538;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Y1NXaf32gHmr2kWu+/1/YxkPBRXru1mSnHmgY8ud1u8=;
 b=9jqClqgA0AiIgyFMF1igYh2DP+FazynwRdAM6nhY1hVk2NjECfw3mAUHmilV/Qrh85ptp539q
 BGGEetpeQNTBjCi/YaD6anoQG1q01an6o0gDNqM3qHGZ0c1kgj79ea0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_055243_027403_B65CCA15 
X-CRM114-Status: GOOD (  11.00  )
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
Changes in v2:
- Refined the commit log in patch 06 (Suzuki).
- Unified to call coresight_unregister() for error handling (Suzuki).
- Refactor connection and sysfs group release.
- Link to v1: https://lore.kernel.org/linux-arm-kernel/20250512154108.23920-1-leo.yan@arm.com/

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>
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

 drivers/hwtracing/coresight/coresight-core.c     | 105 +++++++++++------------
 drivers/hwtracing/coresight/coresight-etm-perf.c |   5 +-
 drivers/hwtracing/coresight/coresight-platform.c |   2 +-
 drivers/hwtracing/coresight/coresight-priv.h     |   3 +-
 4 files changed, 56 insertions(+), 59 deletions(-)
---
base-commit: eebe8dbd8630f51cf70b1f68a440cd3d7f7a914d
change-id: 20260120-arm_coresight_refactor_dev_register-f16c069db41d

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


