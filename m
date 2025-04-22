Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACA1C369D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJaTElFXyGxiNW69/HcNbE8GlxVzryNv8ifQos5AbzA=; b=EYTwffrOsp1Gjq/EW6o/FFNJ5O
	jALamkNew5RJLKYIyk8nIWAaa4eqekrPOC10Hw8Hob3GSo377RPa9XxF5U2Y4zsXGLjX3Q8UTJ+0O
	xOi14YHBYtNpn8p7DKEeneXG6oaqpd/3tVnXN7Qmym4l7PqUxf1SQFtnasRWa4x3/C+GrMN+7jGMt
	dxLi2oxb1wS8LxtB8bY7GIHclabMfnKsrLesNeypRXQXhj6Dw8JrDH1k9Grct2A9+rWCvQbxFdZGZ
	GiW35ciQEciIaEJ3UMExdYBfWiSiLVL1ax63bGBUlv+thuVijRSHTd3wJlIYJDrdJZEuxGYMdveup
	/pVHSgwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73SN-00000005dWv-3Z1u;
	Tue, 22 Apr 2025 02:33:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73CD-00000005ZMK-29FH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84AA861166;
	Tue, 22 Apr 2025 02:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592D0C4CEEE;
	Tue, 22 Apr 2025 02:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745288232;
	bh=dYAV9kglKcUTI7E8go+96gdPhYEE40Ew+7OR2lBPlmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EphySgD3O6DrAEbf33ZFr2Z5uh4vYNO+6pE3YZEygRg1KjmiOIQ/NDTmgF6adNyPi
	 Dr04JLHbSkzW8FsBTnd3DtxgZ/jiKq/KgEprtAMJDFUrN3FhCrkhpgMypi8/tCFFQd
	 9smtwD1TqSVZN3h9QfKrKvY3wgw5q39dVpYT8RvCdfnba+aygaBEQT/MU5Uhe3mzdP
	 EwrJYnpp5oQxMX6+7QuFfryQykSGdADtdTn4zi4h5jBJJSOyqzigB90y02ttvacRDp
	 SHDtqlLWQt2fWXoNV5TijsHPsJJCN3vIwgg4+2NfCuLcayLg3oPGhsn9LcZWpRr7tz
	 63uD2Puit6LhA==
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
Subject: [PATCH AUTOSEL 6.12 05/23] scsi: ufs: exynos: gs101: Put UFS device in reset on .suspend()
Date: Mon, 21 Apr 2025 22:16:45 -0400
Message-Id: <20250422021703.1941244-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422021703.1941244-1-sashal@kernel.org>
References: <20250422021703.1941244-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.24
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

[ Upstream commit cd4c0025069f16fc666c6ffc56c49c9b1154841f ]

GPIO_OUT[0] is connected to the reset pin of embedded UFS device.
Before powering off the phy assert the reset signal.

This is added as a gs101 specific suspend hook so as not to have any
unintended consequences for other SoCs supported by this driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Link: https://lore.kernel.org/r/20250319-exynos-ufs-stability-fixes-v2-7-96722cc2ba1b@linaro.org
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/host/ufs-exynos.c | 10 ++++++++++
 drivers/ufs/host/ufs-exynos.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 344bcc8152244..795716f2d84f1 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1656,6 +1656,12 @@ static void exynos_ufs_hibern8_notify(struct ufs_hba *hba,
 	}
 }
 
+static int gs101_ufs_suspend(struct exynos_ufs *ufs)
+{
+	hci_writel(ufs, 0 << 0, HCI_GPIO_OUT);
+	return 0;
+}
+
 static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 	enum ufs_notify_change_status status)
 {
@@ -1664,6 +1670,9 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 	if (status == PRE_CHANGE)
 		return 0;
 
+	if (ufs->drv_data->suspend)
+		ufs->drv_data->suspend(ufs);
+
 	if (!ufshcd_is_link_active(hba))
 		phy_power_off(ufs->phy);
 
@@ -2140,6 +2149,7 @@ static const struct exynos_ufs_drv_data gs101_ufs_drvs = {
 	.pre_link		= gs101_ufs_pre_link,
 	.post_link		= gs101_ufs_post_link,
 	.pre_pwr_change		= gs101_ufs_pre_pwr_change,
+	.suspend		= gs101_ufs_suspend,
 };
 
 static const struct of_device_id exynos_ufs_of_match[] = {
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index 1646c4a9bb088..be4e3a2411edb 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -191,6 +191,7 @@ struct exynos_ufs_drv_data {
 				struct ufs_pa_layer_attr *pwr);
 	int (*pre_hce_enable)(struct exynos_ufs *ufs);
 	int (*post_hce_enable)(struct exynos_ufs *ufs);
+	int (*suspend)(struct exynos_ufs *ufs);
 };
 
 struct ufs_phy_time_cfg {
-- 
2.39.5


