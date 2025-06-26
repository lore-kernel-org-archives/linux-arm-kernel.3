Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AECC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 19:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61C56Q6Ep76yYJPbdXUFIZ1GUL0CTZoCtZck0sPYqq4=; b=v7+/UET6COA2xjpfl2c78Y4MXf
	HIVrAbZTE5aUOOJG1keCBkPCkg0yMy2zgvNNc9OLP59T9oF62u/Qc+JlnUpY+/LDhXUf4cjMzd4LW
	W7u7A0iPRn0YLQ0Os6DASWlAkB4rbpczZbDNowFgMuBHoFMZxY6gQ7Vd4lpCtRT9ZvBY1rF08s05e
	0NFa4zrcsKZ3xgBrTR5pIuFs5zL9ZgZ0V+HNuvZAxqwK0o8iNXCJIunio74zuNQt4dV8oJSH1PZh/
	sSQ54LjYE2eFHJRKvbWLcP846zPu/O2aITqE36FHbiVru1Uazwf8PDgSfo/xYse5Akg+xPfQAhCKH
	5XkgwGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsIR-0000000CZiI-1BqC;
	Thu, 26 Jun 2025 19:30:07 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUs9v-0000000CYk5-1zcP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:21:20 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3CA0825D64;
	Thu, 26 Jun 2025 21:21:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IstntXv3cZpE; Thu, 26 Jun 2025 21:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750965677; bh=D8o5aKxiqPDfJaP/Wlra9wiusUGgyAqkKg4+LuSvXis=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Pn62ZQw+QE0tjCn0VDNyryMq5NiYYLWChHURVJLwXWY2Rtsz8kcRaMh+VeqrNGfPK
	 QuawYtCEC5pwvYquUJF0BTaMYUdEP8mymD61+I3J8Xi2vCBuYj5GsovKtkj0QKWpcJ
	 SWkHfNKqjS2N/+UHOsL9ZJKWbbnkBf5hR0OTTNwaIr4OY7IxzOxJETsWYDP7jQ8uFV
	 5DEerlKJvRnt3vZ9+CT63xLNQXw5Jd/E3Tn9H3C4usiVQ7WnH/WkraBe41J2S/gY9A
	 aPvN8jGDGw3u9oyx+EU+4ao2KrmF/gUBkSa5srdyrzqIdNeg7YFct6bsKZaG8tBtQ/
	 dhC4GJ1vo/jxw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 00:50:30 +0530
Subject: [PATCH v3 3/3] drm/exynos: exynos7_drm_decon: add vblank check in
 IRQ handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynosdrm-decon-v3-3-5b456f88cfea@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750965633; l=1467;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=D8o5aKxiqPDfJaP/Wlra9wiusUGgyAqkKg4+LuSvXis=;
 b=Zaidk2/MU65T4C2DakEpl1E0vJyg4XwWxX2szoui0qZZcrrbhIkFhB55oDTaWDS1w+QzFykVB
 dtvzv6gyjheBTohjdUEszCp2rVBomHkZYW6z6n3GgQhxqz5uqjV/bmL
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_122119_649534_4B4BFCF7 
X-CRM114-Status: GOOD (  13.03  )
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

If there's support for another console device (such as a TTY serial),
the kernel occasionally panics during boot. The panic message and a
relevant snippet of the call stack is as follows:

  Unable to handle kernel NULL pointer dereference at virtual address 000000000000000
  Call trace:
    drm_crtc_handle_vblank+0x10/0x30 (P)
    decon_irq_handler+0x88/0xb4
    [...]

Otherwise, the panics don't happen. This indicates that it's some sort
of race condition.

Add a check to validate if the drm device can handle vblanks before
calling drm_crtc_handle_vblank() to avoid this.

Cc: stable@vger.kernel.org
Fixes: 96976c3d9aff ("drm/exynos: Add DECON driver")
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 43bcbe2e2917df43d7c2d27a9771e892628dd682..c0c0f23169c993ac315fc8d7bcbd09ea6ec9966a 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -636,6 +636,10 @@ static irqreturn_t decon_irq_handler(int irq, void *dev_id)
 	if (!ctx->drm_dev)
 		goto out;
 
+	/* check if crtc and vblank have been initialized properly */
+	if (!drm_dev_has_vblank(ctx->drm_dev))
+		goto out;
+
 	if (!ctx->i80_if) {
 		drm_crtc_handle_vblank(&ctx->crtc->base);
 

-- 
2.49.0


