Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94DCC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3r837BHKTOfX71htIqYe1SqYT8Pc+1jmeqmKw4V61uM=; b=L38bsRMHEreBP4brA55mnM02Tq
	9DzVFXONB3XlrV+xCN29SvU881exdm0Mv2OYP8bKuWkyfXlV167GQolPQjUdTZDDfxsLQJm8Fk3Zn
	svEFtnkrVREEtetftfwHfB00MRavUjWWN7J9pGczgK/xX8+uKnP3ZCQzCZQMYZEJ4RnbdOQfy4IBC
	Zdjc7BiBVT/EtBrCGYYdRnA2O0vLcdVspzDCml1WKTTQUXReQZHJ+51oYuN+LYngwYmYtGYnqaEWZ
	QeMxd4HgOSBSndEcbeeakCc/Y6pro+BN/GZzUpyNx1sgdIb3GTxmZfmmOK6hLleO/m2xtJjUPNBRC
	yPRhgsMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5zv-00000009FIB-1qTx;
	Tue, 06 May 2025 00:17:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4LI-00000008mYE-2p1N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:31:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40059629C2;
	Mon,  5 May 2025 22:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECAEC4CEEE;
	Mon,  5 May 2025 22:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484279;
	bh=v/ju6zynRUJtqKH6u2Ic/XOrJDA6okuwg9/FkbE2tGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A+9TDjsH975qB90gOtGzj6E8AYAO6D6H6gh72hzEOFkisAEf5JYKmoWKPAeZxcdY/
	 AjlMjaSZ2a4nx1t7J/oNri/SagdMybVPD5L9ot6Vl9CzwLHqBUXAeajdjVjTzzrxm0
	 cmu8xP+oTskjPSYxivCQaPu3PVq7iHtJ+V0eyu9HlWvBHHVAQ35gH8XMi2oi4z0xvf
	 0lAznC+zZ7JD9W7Za+OYgO4MdN9WbroaDzZeA1qdmZYWo3iIqNm3dtOAATpT7y4mVm
	 DyaMOKAGiLSQ6wlYp9XGagytxZWxlrYJ6uCKmFXeOOEzDo6TRyMZTXolysCoq3o+CH
	 h7wNrylfx7iIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 431/642] media: stm32: csi: add missing pm_runtime_put on error
Date: Mon,  5 May 2025 18:10:47 -0400
Message-Id: <20250505221419.2672473-431-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Alain Volmat <alain.volmat@foss.st.com>

[ Upstream commit f7cd9c94959e7a5b8c4eca33e20bd6ba1b048a64 ]

Within the stm32_csi_start function, pm_runtime_put should
be called upon error following pm_runtime_get_sync.
Rework the function error handling by putting a label in
order to have common error handling for all calls requiring
pm_runtime_put.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index a4f8db608cedd..0c776e4a7ce83 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -499,21 +499,19 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 
 	ret = pm_runtime_get_sync(csidev->dev);
 	if (ret < 0)
-		return ret;
+		goto error_put;
 
 	/* Retrieve CSI2PHY clock rate to compute CCFR value */
 	phy_clk_frate = clk_get_rate(csidev->clks[STM32_CSI_CLK_CSI2PHY].clk);
 	if (!phy_clk_frate) {
-		pm_runtime_put(csidev->dev);
 		dev_err(csidev->dev, "CSI2PHY clock rate invalid (0)\n");
-		return ret;
+		ret = -EINVAL;
+		goto error_put;
 	}
 
 	ret = stm32_csi_setup_lane_merger(csidev);
-	if (ret) {
-		pm_runtime_put(csidev->dev);
-		return ret;
-	}
+	if (ret)
+		goto error_put;
 
 	/* Enable the CSI */
 	writel_relaxed(STM32_CSI_CR_CSIEN, csidev->base + STM32_CSI_CR);
@@ -569,6 +567,10 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 	writel_relaxed(0, csidev->base + STM32_CSI_PMCR);
 
 	return ret;
+
+error_put:
+	pm_runtime_put(csidev->dev);
+	return ret;
 }
 
 static void stm32_csi_stop(struct stm32_csi_dev *csidev)
-- 
2.39.5


