Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03F1CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 07:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cBL7Pcb/kOyjsK6nTlHrlSIR86VZRY5J3XGsowllQ1M=; b=Nh1eeRvsVc/zyEnCMbtDiodsSr
	NG45jbzUY/Fbnnj6BP6XvaAMRmK373AuZ01JQhQuEXiX1mBB8BltoCYv5E0kho8lteK97qq7xaTiN
	kE/3QxOo6LqXrjjvvDKe29kay9SzcBqeVY8ZY8ae4Om01jGxDo44P+kEtCUi4yZsusPYuNrDmghSk
	CvsVjPHpz7GU54khS0bJBVKQiHlvJ+nEqh+obbvyXFqNfl1xglJ4AGPA+P+wKisYprPZdlHDgNHiP
	t27HRQzdAjWSF6C+BTyD65GyzAV2NR0GCqVDJHrRt6Ro7b9cnfOj3Bndgg9gNMRpanKPSvvxh18Wo
	vgmcMcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMng-00000004vhZ-1iTR;
	Mon, 10 Nov 2025 07:58:56 +0000
Received: from mail-m1973171.qiye.163.com ([220.197.31.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMnb-00000004vfK-3fcW;
	Mon, 10 Nov 2025 07:58:54 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2903d7367;
	Mon, 10 Nov 2025 15:58:41 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1] drm/rockchip: analogix_dp: Use dev_err_probe() instead of DRM_DEV_ERROR() during probing
Date: Mon, 10 Nov 2025 15:58:17 +0800
Message-Id: <20251110075817.1159857-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a6cc63ab203a3kunm8d5d83d11091403
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkkZSVYfQ0xDQh0ZSB8ZGh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Lokkuw3yyN+NLB/K0CY5sAgotoS17XdzjMh0apqMeFsC0A/x7oRiYIywvudPBCawqyiKJrIZr2++pegwKJdImi/A9g6/3d/P4FAXyUwVNEkfK0xNognTWpS5pG5GREbmQvJ4WBLPNnWvNB2DgJCjhcbirpW2ne8axrlZ2BayWL4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=cBL7Pcb/kOyjsK6nTlHrlSIR86VZRY5J3XGsowllQ1M=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_235852_405257_A23E6C29 
X-CRM114-Status: UNSURE (   8.34  )
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

The DRM_DEV_ERROR() has been deprecated, and use dev_err_probe()
can be better. The other reason is that dev_err_probe() help avoid
unexpected repeated err logs during defered probing.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

As Heiko suggested[0], the other similar codes in
rockchip_dp_of_probe() should be modified to dev_err_probe().

[0] https://lore.kernel.org/all/8513b4b6-0b59-4b42-864b-0fe0423cd7fd@rock-chips.com/
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 31 +++++++++----------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 937f83cf42fc..94da0f745525 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -330,32 +330,29 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 	struct device_node *np = dev->of_node;
 
 	dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
-	if (IS_ERR(dp->grf)) {
-		DRM_DEV_ERROR(dev, "failed to get rockchip,grf property\n");
-		return PTR_ERR(dp->grf);
-	}
+	if (IS_ERR(dp->grf))
+		return dev_err_probe(dev, PTR_ERR(dp->grf),
+				     "failed to get rockchip,grf property\n");
 
 	dp->grfclk = devm_clk_get_optional(dev, "grf");
 	if (IS_ERR(dp->grfclk))
-		return dev_err_probe(dev, PTR_ERR(dp->grfclk), "failed to get grf clock\n");
+		return dev_err_probe(dev, PTR_ERR(dp->grfclk),
+				     "failed to get grf clock\n");
 
 	dp->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(dp->pclk)) {
-		DRM_DEV_ERROR(dev, "failed to get pclk property\n");
-		return PTR_ERR(dp->pclk);
-	}
+	if (IS_ERR(dp->pclk))
+		return dev_err_probe(dev, PTR_ERR(dp->pclk),
+				     "failed to get pclk property\n");
 
 	dp->rst = devm_reset_control_get(dev, "dp");
-	if (IS_ERR(dp->rst)) {
-		DRM_DEV_ERROR(dev, "failed to get dp reset control\n");
-		return PTR_ERR(dp->rst);
-	}
+	if (IS_ERR(dp->rst))
+		return dev_err_probe(dev, PTR_ERR(dp->rst),
+				     "failed to get dp reset control\n");
 
 	dp->apbrst = devm_reset_control_get_optional(dev, "apb");
-	if (IS_ERR(dp->apbrst)) {
-		DRM_DEV_ERROR(dev, "failed to get apb reset control\n");
-		return PTR_ERR(dp->apbrst);
-	}
+	if (IS_ERR(dp->apbrst))
+		return dev_err_probe(dev, PTR_ERR(dp->apbrst),
+				     "failed to get apb reset control\n");
 
 	return 0;
 }
-- 
2.34.1


