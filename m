Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9E4C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otNSsKeaBQVNJuSBUzQmZDF6LDbqttCmzYgKm8SxVG0=; b=h1yvXJtIXxQgm7/FSbsK58mCgd
	cHxFKPweNlsmhc1gXRJBjTIejk+Cfb/O9xk9h9dTp0MLvo0lzhOMNiDa2x0HG9im5qF8Jpg0D2A0I
	/GmgzDQtLoOJuTtEyQ4q42m0CAR3KJPS/g8QibzH9DpUFxkj1lPcO0YDP3/4g8gfe4nVyHmH+ok21
	HkyztBtha2M5l/Se84eUwwCLeez7yY7ntIb8fYrQZFx3aI9GIog3cq8snPd28hHrGGHfgiJ7PPtri
	HujV1YxhEmdi8/6tuaT992mwszNuht8zsYKGhVx7c8roRdf5yewD+4VYG90+/78IlXAY5G70efg1j
	hZ/oSfog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73Zm-00000005fUE-0TI9;
	Tue, 22 Apr 2025 02:41:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73DU-00000005ZiY-1Ade
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:18:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADFA75C5A77;
	Tue, 22 Apr 2025 02:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24125C4CEED;
	Tue, 22 Apr 2025 02:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745288310;
	bh=iTTR50UEs+yrc/reCuVPmDh42fZK32s3XImxX3rVRIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XDxjbC9nWQSMxkn/J39Sk6V4V0+ei+dOvlNtxJy+XTE6D6KnlkCCtN7wqYl8JNZqK
	 eMsniPVD1M2TUvp7pWtUmVOOh0z1UxWkzO7lbNW/RhD53OZhiQltzQUtBF7A1vLr41
	 QYO6LVYE4JWrjvGJiM5NQtlspuRXFAesXyb+v6YJfWgEWZS4nKSvdC7KUSX0GsET/D
	 fSKr074fS5SMCZUQp7pe+4Sk/E7/QtSpJ7P0uJK/jZ6b5GoTwvqDlBBN+rY2xo3mmh
	 ztjKAUTPC5gwtL3fSWQe1dQXdwqm0pmodK0pRLnKD5Wr/nQlrSC+/6sRu+LIpSk9ty
	 2QaWmjb62LTaQ==
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
Subject: [PATCH AUTOSEL 6.1 02/12] scsi: ufs: exynos: Ensure pre_link() executes before exynos_ufs_phy_init()
Date: Mon, 21 Apr 2025 22:18:16 -0400
Message-Id: <20250422021826.1941778-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422021826.1941778-1-sashal@kernel.org>
References: <20250422021826.1941778-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.134
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_191832_369862_B715C6E6 
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
index c0030a03dd34d..3c10029723c79 100644
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


