Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F03CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 06:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OpejVT+/A4NMaugqkBklXTUATQceFhLY7R1EMZdVWEA=; b=NsQPR2PV3of0vwnbTehd2TwuAO
	dAhSb9JiO5kIzT6k2thXNr9pvS96s0Fg4UlLkT6GSMPOfyD1i4TE4hlNolnvtUE77NozLvw+WaYZ1
	gv14Dh0a+mc+JwoIifs+Pj9DP0CnurVgClCCY3obmEIKQhjoOR3/UuP9oMuQqVw+LI/FK04U9WEii
	38kLqu4j8Tfc0+Ch3YG3W3PKLsv/MExhhd/nZcDx8LjhhRCj+R27Ya+Oh5H+OifsK7UcNVI0VH3O+
	CbFZUiK4l2zHPzHw7qS+IeNnRek1RN673ZVobXmgCx04aIl8VGHgioriQ4W4NInZvCnWhm5D7E1C/
	QF8DRreQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4fd-00000005nci-02zO;
	Sun, 24 Aug 2025 06:57:41 +0000
Received: from mail-m49245.qiye.163.com ([45.254.49.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4cy-00000005nWY-26T5;
	Sun, 24 Aug 2025 06:54:58 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 20635ce14;
	Sun, 24 Aug 2025 14:54:53 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2] drm/rockchip: analogix_dp: Apply devm_clk_get_optional() for &rockchip_dp_device.grfclk
Date: Sun, 24 Aug 2025 14:54:41 +0800
Message-Id: <20250824065441.3220852-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98dadbc60903a3kunm3ac07d9129ef6a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGktLTlZNSU0ZSUodQxoZSBpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=aWZurvWEga4kNz/cNldCLoewF0HF8QPtT2dh5tGraPGsD/zd+2KstAZNu2IrmmTqtJH+k0p2weANjaAZzr/yenypcxh//+DOOWqsKCuE+/qNZm9c2Cqdu2zHk9zwIJB+P1YuPVVGpf4xv985YrpZYB2ftVI5JBQlWc3c9U62uWU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=OpejVT+/A4NMaugqkBklXTUATQceFhLY7R1EMZdVWEA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_235457_838585_EE912FB8 
X-CRM114-Status: UNSURE (   8.72  )
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

The "grf" clock is optional for Rockchip eDP controller(RK3399 needs
while RK3288 and RK3588 do not).

It can make the code more consice to use devm_clk_get_optional()
instead of devm_clk_get() with extra checks.

In addtion, DRM_DEV_ERROR() is replaced by dev_err_probe().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

------

Changes in v2:
- Replace DRM_DEV_ERROR() with dev_err_probe().
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index d30f0983a53a..937f83cf42fc 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -335,15 +335,9 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 		return PTR_ERR(dp->grf);
 	}
 
-	dp->grfclk = devm_clk_get(dev, "grf");
-	if (PTR_ERR(dp->grfclk) == -ENOENT) {
-		dp->grfclk = NULL;
-	} else if (PTR_ERR(dp->grfclk) == -EPROBE_DEFER) {
-		return -EPROBE_DEFER;
-	} else if (IS_ERR(dp->grfclk)) {
-		DRM_DEV_ERROR(dev, "failed to get grf clock\n");
-		return PTR_ERR(dp->grfclk);
-	}
+	dp->grfclk = devm_clk_get_optional(dev, "grf");
+	if (IS_ERR(dp->grfclk))
+		return dev_err_probe(dev, PTR_ERR(dp->grfclk), "failed to get grf clock\n");
 
 	dp->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(dp->pclk)) {
-- 
2.34.1


