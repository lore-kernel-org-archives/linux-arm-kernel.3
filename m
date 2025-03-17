Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2696C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 12:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3mnqLDuDPua5EpgkqaHWGLv7FT/Nkrvbmi5xJquSp4M=; b=4Hwgtqir62vF9iYU1sfKDFrTOK
	EP2Zc57xSByx81vO/+mc2mu8/eeCbThxas2mSYFIpBZ5me991cqWiDYH9FJIGJcTwLrxK4IS6zlnv
	jNORYHYBGD37HZqznBKEFEXvcY3WgHvyGKtK45Uc22GYAMpXLCUkLnlxwMK87rSgbFd4NFLrTDSdm
	RtwVZ16uXRVN/WMdCfSQIIXxgUaJGAc/9I1XhUqP1nH0ZaDoEoh2apv/q3yRJLpdsspjO2Hj0fs4e
	5QPXnxn9IQ/SQsw+pawIo5NXixQNT9cUUjV6dkvgkVJw20h33e5mP/BgaAyOu/GUEObXQzeLhtVpJ
	EB2xLNGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9Aq-00000002UYw-1DoI;
	Mon, 17 Mar 2025 12:02:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu999-00000002U9J-48Si
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 12:00:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30D5113D5;
	Mon, 17 Mar 2025 05:00:50 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6DA013F63F;
	Mon, 17 Mar 2025 05:00:40 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] perf/arm_cspmu: Fix missing io.h include
Date: Mon, 17 Mar 2025 12:00:33 +0000
Message-Id: <657935ca177024ad08d5ec6f85e8faf75f82cf65.1742212833.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_050044_071505_D41B7FEA 
X-CRM114-Status: UNSURE (   6.80  )
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

Adding the writel() calls needs io.h, which apparently gets
transiently included somewhere on arm64, but not elsewhere.

Fixes: 6de0298a3925 ("perf/arm_cspmu: Generalise event filtering")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503150649.Dol8RBSh-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202503152245.cAG4FMfi-lkp@intel.com/
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index 4d5c4912c68f..0a7e316fb999 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -6,6 +6,7 @@
 
 /* Support for NVIDIA specific attributes. */
 
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/topology.h>
 
-- 
2.39.2.101.g768bb238c484.dirty


