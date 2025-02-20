Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDB7C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eK4Q+gaIL/QDz6EnUoiKhEYDORlBBBWA6cwM5FTMJWU=; b=vXWvD5gti3BBbGkliWrhtgPgF2
	FuyLa51Hhoy7x+dWaYF1Ubcj22o0K9E4S79BlEAl9AtfHmJ41ip5LFL3T9m8fkSkwPR5J9ALuTff2
	UxDR5sDl1uLqAqugrvP7ci7n/45UqBEyK39OFYqf6oXt/TWrOLCM4ox8h35fBKztkZd0w9JueocUU
	kRk6cSkDnYwCnkVutm+hxcND1EgeekLEZJcgKGC30nVdF+qZkDs3ErnuBou+f2Vx7XCoIWXi7DBZE
	dy2m6d6rXCt9UHAQkHJb3kDrLnYLw6IhzKWKE232tKjdlSK+VYDgFTAnhCG9PS6MfnIw/pukcIE1b
	0o5UbWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGCm-00000003N6B-3Hxm;
	Thu, 20 Feb 2025 23:43:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGBH-00000003MjO-3gRE;
	Thu, 20 Feb 2025 23:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eK4Q+gaIL/QDz6EnUoiKhEYDORlBBBWA6cwM5FTMJWU=; b=DHfx1VNRaazraKTN/FWLVGZCpy
	z1l/UskSBoxSdyWKGdBQIVOxFWCazo8EgM97zvh7yvzc9gXxO1gnzbWer374BOM4qps/DO9rh/eAo
	tjVLhlHI7+mTC0xa11E6zThVmfY2rFinw600vsJjzVQvd8YgGb1UWT8Ka69GegAuWLkVJ+zSwC8Ug
	GCFu0SoGzA2cI8yZFJA6rzI1m+NLAWzsJxg+mI1S/jV6jUcTMhjhk5d0+We6BO574D7HqRLjzyvJ0
	9tI5+05x6oJdn5AI4r538D6/N0gdMCU8dltkviQm0Ogs5H8BFYz3580Fee2CFTJ2V51Pkjk/dQWTe
	7phMiwFw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tlGAz-0004Wc-0R; Fri, 21 Feb 2025 00:41:53 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: gregkh@linuxfoundation.org,
	heiko@sntech.de
Cc: rafael@kernel.org,
	dakr@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de
Subject: [PATCH 2/2] drm/rockchip: Fix shutdown when no drm-device is set up
Date: Fri, 21 Feb 2025 00:41:41 +0100
Message-ID: <20250220234141.2788785-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250220234141.2788785-1-heiko@sntech.de>
References: <20250220234141.2788785-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_154211_913320_79489ECF 
X-CRM114-Status: GOOD (  16.65  )
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

When the drm-driver probes, it mainly creates the component device, where
all the sub-drivers (vops, hdmi, etc) hook into.

This will cause the shutdown handler to get called on shutdown, even
though the drm-device might not have been set up, or the component bind
might have failed.

So use the new component helper to check whether the drm-device is up
and only then call the drm-atomic helper to release all the drm magic.

This prevents failures when the drm-device is never set, or has been
freed up already for example by a probe-defer during the component bind.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 439edc165ff6..285b721ff28a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -484,9 +484,11 @@ static void rockchip_drm_platform_remove(struct platform_device *pdev)
 
 static void rockchip_drm_platform_shutdown(struct platform_device *pdev)
 {
-	struct drm_device *drm = platform_get_drvdata(pdev);
+	if (component_master_is_bound(&pdev->dev, &rockchip_drm_ops)) {
+		struct drm_device *drm = platform_get_drvdata(pdev);
 
-	drm_atomic_helper_shutdown(drm);
+		drm_atomic_helper_shutdown(drm);
+	}
 }
 
 static const struct of_device_id rockchip_drm_dt_ids[] = {
-- 
2.47.2


