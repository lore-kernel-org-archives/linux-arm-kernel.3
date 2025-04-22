Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4B3C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kg9EmfUFK8+COJjQE2S55F2cOtfoHwxbFMtPV7CvbJ0=; b=1MD2zgJ7T2a0JMqCcAc+LmXRsL
	49PeMYcFTFPMC6X0i5ZlJoFPxqx04QE5ktP+RVhWo+im9ZKRTGXJlHAWa3qkTR4ebO4+U/78IVeTL
	6LCxfKEqJKihOc23ONfHb8uajFusTCHez94tBPxHON3zEmziHdaMHg+wd6aXhWmOMLYVolUNF4cwe
	mpr6LHR4FIND/5ixVgt35iiJhWQE8VZax/Il6vjC4E93WWsgdPfXWIDvjIJODE7IK09Ws/QTmp317
	XoszGNJeAjuK9omo0RHh9Rr/UrUhoPg3jW7S23psOpKi9LwMt/XU7/17XPfsm8isUQjlOZsKLk5dB
	V4KBzyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73Da-00000005Zks-1nTA;
	Tue, 22 Apr 2025 02:18:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73Ax-00000005Ywz-0jdC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:15:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D8B24A6E5;
	Tue, 22 Apr 2025 02:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F8DC4CEED;
	Tue, 22 Apr 2025 02:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745288154;
	bh=xuHqTLQebAAopWVn5AUK4tRlpH7mCDuNmspy6Gj3EgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e6h0Hqb3FDIuv4ZRd+24yCxARKd6x8tTmK8LMVTXJ3DeGsX1D7rbxbLYkKKdIVH+O
	 cENIjaTKJsyH28KwG18xA4X1n2tGSBw9d9FXyDKQK74zCi8fOLxxIWwuZnAl9G8Ogb
	 mhwI48YomlyW1XXVEftU+9cHP2KuhK4HUBAZuD5bcNaVtrbLV9xz4YwlyrWQqQh2yW
	 QDvcUT2SPVTUheUzNOfdJIT/xUydZz0jH6dW44pEk++kCR94fX6cTWtBvu4mPUX3Xv
	 uqPNwG4zirQryDIfGagIxlsNyazgZJf9f+DEtMyGRcAV6GRSrNT14VyzlU8Vk1Hy73
	 oITtUuOptNd9Q==
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
Subject: [PATCH AUTOSEL 6.14 02/30] scsi: ufs: exynos: Ensure pre_link() executes before exynos_ufs_phy_init()
Date: Mon, 21 Apr 2025 22:15:22 -0400
Message-Id: <20250422021550.1940809-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422021550.1940809-1-sashal@kernel.org>
References: <20250422021550.1940809-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.3
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_191555_232297_598D9F22 
X-CRM114-Status: GOOD (  11.93  )
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
index 13dd5dfc03eb3..cd750786187cd 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1049,9 +1049,14 @@ static int exynos_ufs_pre_link(struct ufs_hba *hba)
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
@@ -1059,11 +1064,6 @@ static int exynos_ufs_pre_link(struct ufs_hba *hba)
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


