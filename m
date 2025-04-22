Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2C8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q/6xMBMxNAOWvizFK7UxPS1OZi2vbb1Rlb7KIT1Q4o=; b=nxYuozHH79OG1QGb2p07vrMKpt
	Uzqvf5/bEtduL1KEGoL119o+gMRtKr1EhrMutP1cbxJNNwtOfDyMiMR9Rgi5wEgQB26Q7QO4ups9f
	v99MvITecZCrUXQChBV65wHa7Y7HM7EKPS8XhXnOJOmTuOKx7krkyPRUA4KlCzwzVPqUbCYIAvOGb
	we/+Y0meiFEcoW47Gc/8oNMsjcN/HI97O4s88J1oSqmioK6IWTKl4RpLX6JhrcHtkCWckD1P/oNJY
	gpT+0wQECsL23jSMsPGktk85m9S8pwmRE5fqcLjqg1P+Z34rZqQxXqwUowv8iix6TiBhaGhaks7wV
	ujkem0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73W4-00000005eWm-1zs0;
	Tue, 22 Apr 2025 02:37:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73D2-00000005Zb9-3Rqk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:18:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF0D36116F;
	Tue, 22 Apr 2025 02:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D79C4CEEE;
	Tue, 22 Apr 2025 02:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745288284;
	bh=L3/HcG6wXKyGIPN+AAPEjXN6F2jJXbxSsfwJd+Pgyqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tAFN661fW85LmZDdDVS/o4M9xgnFv7g5hka301AZeVwAxK+KWMwSHNKMyJ4t9nAUb
	 5Ix6OMqlNLAkaR/aN8zLBFd+HVj0lHhX4h5L6dICIeSdqLeZ658SZkE/JgO7Pu3g/e
	 Pf20PdYkczu9Cly1QhgfZbfGh7VyQ+dyCWAKM+WrKh0V5R4qsWu45cSI3YgBZop++r
	 StIM/o8X3yhSeAZVag5AyHaNj2Si9B16KJ49qYYgL0+z8eXcmLmAR2/TwHdunXPZ08
	 IIUywN9OWph5e4DHvruP+3JOjZyPsw20I2HfN5mTtpzn0Ocv+pNwg0NShRy45WXhvf
	 mzgUKFpglSTFA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	krzk@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 02/15] scsi: ufs: exynos: Ensure pre_link() executes before exynos_ufs_phy_init()
Date: Mon, 21 Apr 2025 22:17:46 -0400
Message-Id: <20250422021759.1941570-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422021759.1941570-1-sashal@kernel.org>
References: <20250422021759.1941570-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.87
Content-Transfer-Encoding: 8bit
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

From: Peter Griffin <peter.griffin@linaro.org>

[ Upstream commit 3d101165e72316775947d71321d97194f03dfef3 ]

Ensure clocks are enabled before configuring unipro. Additionally move
the pre_link() hook before the exynos_ufs_phy_init() calls. This means
the register write sequence more closely resembles the ordering of the
downstream driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Link: https://lore.kernel.org/r/20250319-exynos-ufs-stability-fixes-v2-1-96722cc2ba1b@linaro.org
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/host/ufs-exynos.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 268189f01e15b..76703a7fa5717 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -984,9 +984,14 @@ static int exynos_ufs_pre_link(struct ufs_hba *hba)
 	exynos_ufs_config_intr(ufs, DFES_DEF_L4_ERRS, UNIPRO_L4);
 	exynos_ufs_set_unipro_pclk_div(ufs);
 
+	exynos_ufs_setup_clocks(hba, true, PRE_CHANGE);
+
 	/* unipro */
 	exynos_ufs_config_unipro(ufs);
 
+	if (ufs->drv_data->pre_link)
+		ufs->drv_data->pre_link(ufs);
+
 	/* m-phy */
 	exynos_ufs_phy_init(ufs);
 	if (!(ufs->opts & EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR)) {
@@ -994,11 +999,6 @@ static int exynos_ufs_pre_link(struct ufs_hba *hba)
 		exynos_ufs_config_phy_cap_attr(ufs);
 	}
 
-	exynos_ufs_setup_clocks(hba, true, PRE_CHANGE);
-
-	if (ufs->drv_data->pre_link)
-		ufs->drv_data->pre_link(ufs);
-
 	return 0;
 }
 
-- 
2.39.5


