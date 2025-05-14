Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84834C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoJi1TwSD3DRbeondGqKscn4X26JsnVq7ifODsScXBQ=; b=GbqxLrZslbL/BbHU+VSfhcWSqM
	7pbdSyJ9B+s2U84TIaPU6L8pNXx4OzMj++BHudE4OYXjb+4T4ANSRw/IYJZpFGyCxuFCVO+LdvSRe
	MuKydzDRaNbzpLWEr6TmfO38tlWokh0lQOxQyL/twiu8p00H7ErImhERQU5ziHv3ioFmkZiYaBwYM
	cPyo/xx7HX44z1YVi5bA+4R3PNeOJGVMVAK6R0yXXZuvZTFhHnFlcgYhebbMiXZid4Tr9WAfkEU+L
	lk9ivofrG8A1xh9pA7CuJmkQktP9NS4/bSzMyUhFkIzOw1W59HGqhj0UX+wddb3Bjj98Fw2CDRcL4
	lTjuvhAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGCJ-0000000Fv9A-3xJ3;
	Wed, 14 May 2025 17:47:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEpv-0000000FjCi-46va
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 16:20:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66E5A150C;
	Wed, 14 May 2025 09:19:52 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5191A3F63F;
	Wed, 14 May 2025 09:20:02 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v6 2/3] coresight: holding cscfg_csdev_lock while removing cscfg from csdev
Date: Wed, 14 May 2025 17:19:50 +0100
Message-Id: <20250514161951.3427590-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514161951.3427590-1-yeoreum.yun@arm.com>
References: <20250514161951.3427590-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_092004_066789_B573C1A2 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
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

There'll be possible race scenario for coresight config:

CPU0                                          CPU1
(perf enable)                                 load module
                                              cscfg_load_config_sets()
                                              activate config. // sysfs
                                              (sys_active_cnt == 1)
...
cscfg_csdev_enable_active_config()
  lock(csdev->cscfg_csdev_lock)
                                              deactivate config // sysfs
                                              (sys_activec_cnt == 0)
                                              cscfg_unload_config_sets()
  <iterating config_csdev_list>               cscfg_remove_owned_csdev_configs()
  // here load config activate by CPU1
  unlock(csdev->cscfg_csdev_lock)

iterating config_csdev_list could be raced with config_csdev_list's
entry delete.

To resolve this race , hold csdev->cscfg_csdev_lock() while
cscfg_remove_owned_csdev_configs()

Fixes: 02bd588e12df ("coresight: configuration: Update API to permit dynamic load/unload")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index a70c1454b410..23017612f2ea 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -395,6 +395,8 @@ static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, voi
 	if (list_empty(&csdev->config_csdev_list))
 		return;
 
+  guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
+
 	list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
 		if (config_csdev->config_desc->load_owner == load_owner)
 			list_del(&config_csdev->node);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


