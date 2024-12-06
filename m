Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B101E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 11:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NqUN3W1QE8uKX1PduVefoAqn9x75Rt+nVAqamJ38O94=; b=C9nD8ESGSy1t7laLzK33lOan6R
	RWIpm2ZoZhbI+tsU+XCsMwa9zJho0A1Hq9SzMSgUZD1vqfwGkbGR4wYercNNzNrzmX7+EdOulyB2S
	1vVUex8FjULLZAAVqLmz+inzCmbgBzRyI3J+yQAykoWq18Bvy3yjp9rc6t6xcARyVMUEAwNFH0TEp
	F49SEF9+iO9DsMZ+eZHSIK5/Qs5MJW51q1ZhHf1luPYAsmJrMM1TxZyhAwEHa6+BbR2vpbL4rOJJ/
	35HKK+O+LUiVQAdUPI3rWPMXQAJYiR6cdFcnhAL0MtiQZZi9n4wbxOGqImqEzbTRXN4MCcP8eILRr
	mX/dkGpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWnG-00000001USc-29Ht;
	Fri, 06 Dec 2024 11:46:46 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWmF-00000001UMu-2TUJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 11:45:44 +0000
Received: from laptop.lan (unknown [125.33.216.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C12DC3FDCA;
	Fri,  6 Dec 2024 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1733485542;
	bh=NqUN3W1QE8uKX1PduVefoAqn9x75Rt+nVAqamJ38O94=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=ds8IN9YhzmM6Rca8WcY5tZRE4XShCkTXv6lZchhaNO5x485K8vtvnl1j/yiU0eh7F
	 Rp74dxfXC4Rq+ZVve9pMmKmt6bdqu69mzoLcYw2Mmt/XxyJnSF0xp1St5CFr0WQk2T
	 ZyGIR2AakBu1kz/2JBYbl/wepAk+k6sr6+0K/k4MTP/tKK3sV6lNV4zOidg7Zf0E/g
	 T4P5kQ5Z+e9eUvlovdJaEx64K97EmFCCCHeKpcT71htARonJH5wAHVN2hvbF5Sf1GN
	 aEhWiJeQxFthq9df7hOQpl2PalP32ivZb0iSvt2Hvc5Hnv9yJ5fU0WNeu4HkAnEU3O
	 nSDG9TzrJV0NA==
From: Guoqing Jiang <guoqing.jiang@canonical.com>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: Remove unnecessary checking
Date: Fri,  6 Dec 2024 19:45:31 +0800
Message-Id: <20241206114531.1271123-1-guoqing.jiang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_034543_810305_87C3E205 
X-CRM114-Status: UNSURE (   9.79  )
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
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 2a466d8179f4..461384705cf9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -357,8 +357,7 @@ static void exynos_drm_platform_shutdown(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
-	if (drm)
-		drm_atomic_helper_shutdown(drm);
+	drm_atomic_helper_shutdown(drm);
 }
 
 static struct platform_driver exynos_drm_platform_driver = {
-- 
2.35.3


