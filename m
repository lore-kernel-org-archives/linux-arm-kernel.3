Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131D9E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PFPFV0Ax8i8C9LyOLIOefcKHDDFqRhlURq1jSxeY31o=; b=pzSxrR1NWkwht2eAHbtVtfgNiz
	vFuEg10QkM/LaD4xJBqRkfKzNQ2RYijKrsnSoQb9B+qzzabi0v7Pb1bxIroJJbY5nkf0G+GV+nmFU
	lS3qJOw0QYpLAP6WiQHn2vOSY7c11ORcVugYS27kfGUTY5dsmyrj1K+Ekf2MaP5VziKqgOq1u4xiX
	d95xpbRpDhN7xxrtZzHt1lRNv45fZIJg94IKHE3azFe2Xws9pHhqUT1YwyXtA+vf6xJk6c9+xJ1ly
	9H6NkjPbI8ik/ytYUAq2fmAgBJepGsoEo43Bt36V3CNnT+841IDl/Chg/uTzgK9IBkSQvDQ/cSvWn
	T+KAwBSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWkT-00000001U8m-1mM3;
	Fri, 06 Dec 2024 11:43:53 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWjS-00000001U1g-18zl;
	Fri, 06 Dec 2024 11:42:51 +0000
Received: from laptop.lan (unknown [125.33.216.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2CFCF3F789;
	Fri,  6 Dec 2024 11:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1733485365;
	bh=PFPFV0Ax8i8C9LyOLIOefcKHDDFqRhlURq1jSxeY31o=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=blgoFFBseV8uNYm7ISBs4Rh1VbtPHumoIOXPTinyfqfICH5IaNJv1CLMT3yRtHsXJ
	 3aSrEH7kzcWwEiUZLuWYDqkpfQ2fklpXSk50KvH0ju0RqTB1yfRMGWxE/ldKTFC1An
	 iVNQ4RYYnqqC4dae2l/0MdarYIj2bYOw9EG9oqKe08YiC8tZ2+eueUQjd7e+/G1SbY
	 2HWZCKN0uBZQEKI+RHwhs1F2L1h4B5bDY55uzMtumpV/6+90qAVWsqgZ8yW4+j3Luy
	 M8Is54VTN/qYoBoiEd2PXcKOLdCsT+5bvxcK+77I1/ohFzNIplLdEoK43sccfj7ntE
	 7Q7I8FcQ1dm5g==
From: Guoqing Jiang <guoqing.jiang@canonical.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] drm/rockchip: Remove unnecessary checking
Date: Fri,  6 Dec 2024 19:42:33 +0800
Message-Id: <20241206114233.1270989-1-guoqing.jiang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_034250_486895_9D485A44 
X-CRM114-Status: UNSURE (   8.47  )
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

It is not needed since drm_atomic_helper_shutdown checks it.

Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 585355de696b..64f5f547fb7a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -488,8 +488,7 @@ static void rockchip_drm_platform_shutdown(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
-	if (drm)
-		drm_atomic_helper_shutdown(drm);
+	drm_atomic_helper_shutdown(drm);
 }
 
 static const struct of_device_id rockchip_drm_dt_ids[] = {
-- 
2.35.3


