Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D302C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 19:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gnn4IM7XbPf4f3cFKLeYadwYhKZ80OKZBplQlTXsqPM=; b=PoLc7BaUV20xPgk3YUY/1AkGUN
	1Tzut3WsuPTaZfPlF/U8jYv4CUJkbizmKKkerAUB9123upEsC2qT8ZvxQtHEqYuaTAlgj6A0CO0EM
	SZKQXASoD9F7hNxqXUivRsYR2a51B7sChlwAWaN0/hWkKpX4R8rumNs3XqqJhvIQeYcvX8XQ0opjg
	fv+ieQg7yVBv/jadv2tHvk9KSifNFG8pdg0WCvEF0uIPcyDSwplnrusGpvOnyMEC4E3IY1CKofYTt
	3nSe4spqnj93CKvrUUSaSnD8YvGftyAZQ4zSTE+nUb/vHCP1s7P9xg1Qao+sKiR5x/ogW11nYsldI
	q66m3KKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgU4X-0000000AuSO-3ZJq;
	Fri, 07 Feb 2025 19:31:29 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgT0F-0000000AgAx-31KB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 18:23:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tgT05-0006i3-Ft; Fri, 07 Feb 2025 19:22:49 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tgT03-00418A-2d;
	Fri, 07 Feb 2025 19:22:47 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Damon Ding <damon.ding@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@pengutronix.de,
	patchwork-lst@pengutronix.de
Subject: [PATCH 1/2] drm/rockchip: vop: remove redundant condition check
Date: Fri,  7 Feb 2025 19:22:46 +0100
Message-Id: <20250207182247.215537-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_102259_750739_419B1467 
X-CRM114-Status: UNSURE (   9.67  )
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

Instead of checking the same thing twice in a row, fold the second
condition into the first clause.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 57747f1cff26..7f5fbea34951 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -733,11 +733,10 @@ static void vop_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	WARN_ON(vop->event);
 
-	if (crtc->state->self_refresh_active)
+	if (crtc->state->self_refresh_active) {
 		rockchip_drm_set_win_enabled(crtc, false);
-
-	if (crtc->state->self_refresh_active)
 		goto out;
+	}
 
 	mutex_lock(&vop->vop_lock);
 

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1


