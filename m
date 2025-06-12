Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D28C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qyW8MVqE8Ww2LSIMUg86pjuBqABSUAEMsReV3ocNIA=; b=EkbmbYcOVNqaRCfwgGNUXcU8LD
	QoiPG3k95yJyz0KSfKWaHVU6LJRT725+yzRUGhSQLhsP/WOsirMIH1GQ5iK7mhJFqVExSYFMfVe9B
	nkEXiZm0vX9WoX2WVHr7/mddAzFhZraa/U9a95NOOOgfwCGzHiij5MBM0fM1YclLObCX6tiDhJbVe
	XNOX1qd73eLHTVlTDGCNVQ4OazBcT194HXtH9T0e8zdeu+JvivWZ1mozM1vlWLY0/KxizcHfwiyjR
	pgND3aykKFSCXv2p6ieIf9Yr0k3gyfdArW+r/YQliukrIZQYs4VFenelgrafAUU/XNz1yE72/0PmL
	7MTR/5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnqE-0000000EIQt-1meL;
	Thu, 12 Jun 2025 19:44:02 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjQ6-0000000DiYh-2kgL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:00:47 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7830325BDA;
	Thu, 12 Jun 2025 17:00:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMeiQ2439zKd; Thu, 12 Jun 2025 17:00:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749740443; bh=KbVD8W1QVZAFqfq85+oBgINP5cpWpTrtB33hPtktZ+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jI3AIceGSQxra2yoTfTIA90AEBneXw4SWE6pC0dq8CDmGvDnLSQQyPZlovnj3eAnL
	 QJ8f1iIm/HEkB9EhB2v1Oz1uw9fEHQTzqd/F1uiXndB0FOp2+jfOiDqM/gsf+0K1Lp
	 WZZCUHNZifvvoQMnj1cO4gf4R5bI7G/zDhc3CWLg7Rh/HxLlvdrdtM8iXP2P1nlon/
	 6siEdYIR3d8jHJp/XrgVaVQLUkvXBhMAfosUtse/HtLtZX+e/MN43odHAmGfUfY7UQ
	 aGhI0gCJ97dKLk5fi2JWihqjvCLw3IcQwFmBugV3Ii/G7ZsPgjfFk7nPKeOET8FxoD
	 YYz5M9ZYZgJxw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:29:19 +0530
Subject: [PATCH v2 1/2] drm/exynos: exynos7_drm_decon: fix call of
 decon_commit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynosdrm-decon-v2-1-d6c1d21c8057@disroot.org>
References: <20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org>
In-Reply-To: <20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749740428; l=1313;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=KbVD8W1QVZAFqfq85+oBgINP5cpWpTrtB33hPtktZ+Q=;
 b=3RvGk19WcfpcLnwZ3sIxU4O4s2l4UIkGy0HYA+2T/gW8t0neQhz8mhwCSXco4kguluClsWlGi
 LeoLEAjC/YgAuHmhHqrrnwVmDRmxZ4uSB9sY5rn+V+EZ6WT89QbRA/z
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_080046_833510_3ED6EF69 
X-CRM114-Status: GOOD (  12.42  )
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

decon_commit() has a condition guard at the beginning:

	if (ctx->suspended)
		return;

But, when it is being called from decon_atomic_enable(), ctx->suspended
is still set to true, which prevents its execution. decon_commit() is
vital for setting up display timing values, without which the display
pipeline fails to function properly. Call the function after
ctx->suspended is set to false as a fix.

Cc: stable@vger.kernel.org
Fixes: 96976c3d9aff ("drm/exynos: Add DECON driver")
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index f91daefa9d2bc5e314c279822047e60ee0d7ca99..43bcbe2e2917df43d7c2d27a9771e892628dd682 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -583,9 +583,9 @@ static void decon_atomic_enable(struct exynos_drm_crtc *crtc)
 	if (test_and_clear_bit(0, &ctx->irq_flags))
 		decon_enable_vblank(ctx->crtc);
 
-	decon_commit(ctx->crtc);
-
 	ctx->suspended = false;
+
+	decon_commit(ctx->crtc);
 }
 
 static void decon_atomic_disable(struct exynos_drm_crtc *crtc)

-- 
2.49.0


