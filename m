Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F77C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 23:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lqe3QSfowQ1MEof2h4dcKqKHpvqxvrtTmnJ0esWztY=; b=y4gNYOMy35Vi4yVe0FMyjTvWX3
	BndmrO8VddVZTJhEmYqzV68sycsokt3eFDbiAcz/1uEj05gXyEqUYNj+u29HILANSIadznGbGGSs5
	8Y5taFoaHM9eFudh21QzgY1XfIvUEBvg5VnWqKGGXc3OriwEcphEvLcTyV/das2fH2hh9MLomNywr
	V2njE5796XjKG6VpZ2e9lBR8NzU5sgXSQN1xxf0rrmVdQvdeyfdpMLgf+daj8o830XXHTjTG7ALV6
	Bj3xr4+097g020wnPVfwbz6M/rvZPvKdMp+zOj0w9PGTpBalyxDd20RbWyheYgrh3kDgxO/Cwj6yF
	aVx1Vmng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihSn-000000069kI-113F;
	Wed, 21 Jan 2026 23:18:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihSc-000000069br-3iub;
	Wed, 21 Jan 2026 23:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769037480;
	bh=ZGveAJqQ1k88TxxI0g8RwTFg9n7mNfsWZAYPcfS1bz4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WJ6QRgiD8O9UXa2jilKWmox07w8XDr7bvSekiYTHeP+bt5xVeh9xcm/pqxUzf6hqx
	 5lsDgwfomETZtOcUEO2kQanIXWMJZTaYQgBDaJ5a+eyZH0HM9Nui6BxAxpkffsSdli
	 LY2kv2gqzszW2zjHaKONXaRYBE6RaGW4O/eg3+HSq3WOrRBiwU8QM2qyPyl9IK0v8O
	 avC+yXLgL3/942pQxDvZybKF0t5SjPFyZKuXgdgOC1Gwcjs08XDaJNlTq2DKJ1XrEq
	 +aQWFsZ5BCxbkxpone/rVOPpocxETajnPzL2OeVWhkc6ZeVqo7wI8VsBtXXlE55RON
	 2t82DV2e1QuoQ==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D3B5517E139F;
	Thu, 22 Jan 2026 00:17:59 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 22 Jan 2026 01:17:36 +0200
Subject: [PATCH 3/6] drm/rockchip: dw_dp: Fix null-ptr-deref in
 dw_dp_remove()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-drm-rk-fixes-v1-3-3942f185750e@collabora.com>
References: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
In-Reply-To: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_151803_082508_128CBD8A 
X-CRM114-Status: GOOD (  12.46  )
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

Attempting to access driver data in the platform driver ->remove()
callback may lead to a null pointer dereference since there is no
guaranty that the component ->bind() callback invoking
platform_set_drvdata() was executed.

A common scenario is when Rockchip DRM driver didn't manage to run
component_bind_all() because of an (unrelated) error causing early
return from rockchip_drm_bind().

Drop the unnecessary call to platform_get_drvdata() and, instead,
reference the target device structure via platform_device.

Fixes: d68ba7bac955 ("drm/rockchip: Add RK3588 DPTX output support")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 98d97e0f3cf4..6d57e1c74627 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -130,9 +130,7 @@ static int dw_dp_probe(struct platform_device *pdev)
 
 static void dw_dp_remove(struct platform_device *pdev)
 {
-	struct rockchip_dw_dp *dp = platform_get_drvdata(pdev);
-
-	component_del(dp->dev, &dw_dp_rockchip_component_ops);
+	component_del(&pdev->dev, &dw_dp_rockchip_component_ops);
 }
 
 static const struct of_device_id dw_dp_of_match[] = {

-- 
2.52.0


