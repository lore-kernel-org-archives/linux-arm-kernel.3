Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A2AC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 19:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qyW8MVqE8Ww2LSIMUg86pjuBqABSUAEMsReV3ocNIA=; b=lQPLFkHii3skikr7C6bcRBMHRS
	MsMKyvZC/Ex+Jhv0UaOZV35DkbmoQz0bkiq9GCemkznMbQggNvWVJ8W/WIy09sk6EfdbrrmqYKh2U
	YI6H6hfNf8IMDrNa+Hm56XLGHCtcDeoDatGATVgUg2zfiD5N7v2RZhfTWv+z33Z7BeQhabovIa9w2
	BMypOGbydtOpacCnr3bwLzxKycm7OtwULjxtemPsIqhH8XHdwradfcpCOC3HdRuQ8lH0GGGRxugyX
	q9blbodFEPgwtA/Fe5FRboEVjr5i6lla24RKUDpr2hV7CGsOG9FAwpPfhBS3h/Sp/eHZEJipTWH1F
	5vSyE+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsGC-0000000CZOM-2U22;
	Thu, 26 Jun 2025 19:27:48 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUs9m-0000000CYhQ-2vGh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:21:11 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7C5AB25EA5;
	Thu, 26 Jun 2025 21:21:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpXY8ydbfAis; Thu, 26 Jun 2025 21:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750965666; bh=KbVD8W1QVZAFqfq85+oBgINP5cpWpTrtB33hPtktZ+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MG8glo+fruRM+8D2BU0fMp0cvDbaYgtOlshEO7nse3GJghFUYkSKj4Ql7t0om0X9j
	 UrekMns4NSUP1mcIZTQXP3iSL8DQZZ+uUNOsxmH6xnPinqovDbTxX6zjzBb8kh4urL
	 5NDJ5EQOSVqcDZmCh0mcXhIy+x+DVgRwb/8BiINWK/BKhT6mAuAYMy5TIHEF0UxEKI
	 hR5FSu+F3XwBjPR7gst4RHrbIqpEDJeC6uGdsyVS0465s9bzoxvsjv99Q/ByGrz6gH
	 R/mBRuOrF/NI4/AXfwhJs9GYnCuYpWQySdZd1Ot4Zo3HB9SZJwB0YCojuaGOMXm/Y2
	 WkeugJ3uib13w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 00:50:29 +0530
Subject: [PATCH v3 2/3] drm/exynos: exynos7_drm_decon: fix call of
 decon_commit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynosdrm-decon-v3-2-5b456f88cfea@disroot.org>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
In-Reply-To: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750965633; l=1313;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=KbVD8W1QVZAFqfq85+oBgINP5cpWpTrtB33hPtktZ+Q=;
 b=l6zKg3a8pR9r1QKiRsjmvmVHGHaF1tZJjt8lK5gh/2h/KiirJyc9jqoyg3mzVMn7Vci4KJW5R
 MMkXTr3ADETC4zz5BREvnEqVAErWJijHMYQhLXViseVxR+jLvxzVTRo
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_122110_870016_60A637E7 
X-CRM114-Status: GOOD (  12.02  )
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


