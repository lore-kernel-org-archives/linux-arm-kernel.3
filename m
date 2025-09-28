Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A0ECAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 10:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OajlQ+6PdIYG+fmsAAOl6Cm5I8NVlpLVeebHG26Kl94=; b=X7MAtAaD8tSOtuToGkK9SZlG3L
	idLJscB3jyD0buX8qbghbaOfNS5y1EDTPyWH8jcZIfeoCgRD2yALHekklL+CVerfjV2oz+gbGHUfB
	HN7FA++013wSEdXdFdQqVLGCVBRKq+SHHZeRVfj/EP/7vpoWMuK9K3xX647L01jgd6yFmvsAt0rR9
	05nR1vlDpK0k+KJux73FS+fCPv2GtslajOsbVHR9/FbtVrsRvHcw9d80GZck8/OzeZ2BAR6JPBnPV
	ltoz9RRk66BHGbVMyVkVVCWPwAkw3eoFjLAVzevAhQLgTloZO8yiF9F1OyQ63sw2vgmwGqGvQt6VU
	NtZFezWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2onJ-0000000EzlX-2ZNs;
	Sun, 28 Sep 2025 10:38:17 +0000
Received: from mail-m15579.qiye.163.com ([101.71.155.79])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2onF-0000000Ezgl-3MX9;
	Sun, 28 Sep 2025 10:38:15 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2456910da;
	Sun, 28 Sep 2025 18:38:03 +0800 (GMT+08:00)
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
	Damon Ding <damon.ding@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3] drm/rockchip: analogix_dp: Apply devm_clk_get_optional() for &rockchip_dp_device.grfclk
Date: Sun, 28 Sep 2025 18:37:34 +0800
Message-Id: <20250928103734.4007257-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a998fe6ad8303a3kunm5a055eb71de05e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkxMGlZPQxodTk4dQkJKShpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=CFQEKBdLzj3RmovydjJ/6w0J+Z+ocOD7NCH8UCPOUnv9joMoyk3Hp31PZpKDFASAdryKQpPfo22/0OLo8xKgWTdFvb6BSK4uvk7rCil7kPubAqF6r/HV/LaZ1SZvZbsaZWPWfEHUcXLYs9WozLnsbAmpMFRDfa/nBcp2LaJry8g=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=OajlQ+6PdIYG+fmsAAOl6Cm5I8NVlpLVeebHG26Kl94=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_033814_026585_10028BC0 
X-CRM114-Status: UNSURE (   9.33  )
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

It can make the code more concise to use devm_clk_get_optional()
instead of devm_clk_get() with extra checks.

In addtion, DRM_DEV_ERROR() is replaced by dev_err_probe().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

------

Changes in v2:
- Replace DRM_DEV_ERROR() with dev_err_probe().

Changes in v3:
- Update Reviewed-by tag.
- Fix the spelling error 'consice' to 'concise'.
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


