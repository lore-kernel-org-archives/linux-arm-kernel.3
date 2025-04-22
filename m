Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D73C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FigYgN5HEwvxNLsA2GsP5aG4XKypEIp+61hhm2ItXWw=; b=zMvy2hjSMnZOxNFPJrtBnx7TDi
	DhziG9QQ2xa/iLpRHP7vjcTIWDto3FD6z1MrWTKnq4gEaKsBUmlmurHjjUqrsZjQR2fx0lKPPt62W
	ZZ9QIhMUMg/PbPkvtzAhLO9LBNosuakteg0ALjF4EyLH2VVpKPj9CS3D98mnC1YzL/5N9mEjxfP1D
	cIERv1TxR/3IL1S3oLA7l0t0mtuv8uxKHVGT5jNeFq6HUCtW1Eq/34beCJfF3ZqUCdM/3yI35TLBY
	CcVahko91DesE+qd5dkBqEz6zbkT5BsLyhWRrjhd37Xc1Ak1dCL0bXM/aTe3pp29IffKVHTDY4gox
	saN0gHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73QW-00000005d3k-3eo9;
	Tue, 22 Apr 2025 02:32:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73CB-00000005ZLg-3hNs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 235C4A4BF37;
	Tue, 22 Apr 2025 02:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EFFC4CEE4;
	Tue, 22 Apr 2025 02:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745288230;
	bh=dwWKusiLvE5Ncu3OJcntHFiHfiZeZqGwomle4v1Vg7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GEljB0Y2k0BPls9jL+oF+S0zK3d6kMmjjwQs9zbIHLF4vw2xRqawqo/P24TZSWxq9
	 g2oXB8oHbVFHFDYOYdjAk1NZMdrTl2+/9haB0aoU3YS0Omligop/KlWkzkaEWSMkph
	 wVLGjSgmuucgJ2cvhK34hHUS+YetqRCMB/mjA3wJHUL2pwDNWFfiyRkW5H6J4lgwKX
	 06ieOWC9O6XFNPqebbLUJx8A4tgi2bUAwWHjUcy2k3/95Xyqyn+4tkfLIRryo1pKk8
	 MqzJi+nt0rffpPJ13UV43eoMwDiJsZWIq/Ejj6/Ae5wN1GahwfbUWfmrTy/YM6A65b
	 BnDZ7G6drY//A==
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
Subject: [PATCH AUTOSEL 6.12 04/23] scsi: ufs: exynos: Move phy calls to .exit() callback
Date: Mon, 21 Apr 2025 22:16:44 -0400
Message-Id: <20250422021703.1941244-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422021703.1941244-1-sashal@kernel.org>
References: <20250422021703.1941244-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.24
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_191711_983317_FE845A21 
X-CRM114-Status: GOOD (  13.20  )
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

[ Upstream commit 67e4085015c33bf2fb552af1f171c58b81ef0616 ]

ufshcd_pltfrm_remove() calls ufshcd_remove(hba) which in turn calls
ufshcd_hba_exit().

By moving the phy_power_off() and phy_exit() calls to the newly created
.exit callback they get called by ufshcd_variant_hba_exit() before
ufshcd_hba_exit() turns off the regulators. This is also similar flow to
the ufs-qcom driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Link: https://lore.kernel.org/r/20250319-exynos-ufs-stability-fixes-v2-6-96722cc2ba1b@linaro.org
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/host/ufs-exynos.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 477a9f2920765..344bcc8152244 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1459,6 +1459,14 @@ static int exynos_ufs_init(struct ufs_hba *hba)
 	return ret;
 }
 
+static void exynos_ufs_exit(struct ufs_hba *hba)
+{
+	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
+
+	phy_power_off(ufs->phy);
+	phy_exit(ufs->phy);
+}
+
 static int exynos_ufs_host_reset(struct ufs_hba *hba)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
@@ -1927,6 +1935,7 @@ static int gs101_ufs_pre_pwr_change(struct exynos_ufs *ufs,
 static const struct ufs_hba_variant_ops ufs_hba_exynos_ops = {
 	.name				= "exynos_ufs",
 	.init				= exynos_ufs_init,
+	.exit				= exynos_ufs_exit,
 	.hce_enable_notify		= exynos_ufs_hce_enable_notify,
 	.link_startup_notify		= exynos_ufs_link_startup_notify,
 	.pwr_change_notify		= exynos_ufs_pwr_change_notify,
@@ -1965,13 +1974,7 @@ static int exynos_ufs_probe(struct platform_device *pdev)
 
 static void exynos_ufs_remove(struct platform_device *pdev)
 {
-	struct ufs_hba *hba =  platform_get_drvdata(pdev);
-	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
-
 	ufshcd_pltfrm_remove(pdev);
-
-	phy_power_off(ufs->phy);
-	phy_exit(ufs->phy);
 }
 
 static struct exynos_ufs_uic_attr exynos7_uic_attr = {
-- 
2.39.5


