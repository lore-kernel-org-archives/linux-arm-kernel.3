Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D70C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 03:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QRjh9FhrnaHu0S6KpqI8qiqynan6VGuEAgxuDFjUP/U=; b=aJ8OtTmxq6XHxbTcBwNgU+Xiwm
	q1WiAg2wUF9Fj580XYO807IFsaGC2DBm+hOx0ea2BmpVEynMqkgLB57tC3VaTHRA9rnwWZtD6u8br
	APVQvFgXA46sDMQdI8TrwJmZY+YXL19Jlsjkt21G8WuDnEqxBSDlZsBmgbiwcMmh8BW/ksiwQ+Mez
	Z0xzcxTkZUfbCKo5sU1rCVUIZbp+aXdD2K7hmw8p7gaeYJ0PV68oIH8tBxrScgIq1uAcfs3bidO1u
	FzV2gPwMMZVyadNf3EcDbBaN9J9CRG0E+gPn6Hs1sztGMIQlyEIkbfCnNYMLeeQk2HN0GjeSpcltO
	wVnJwjVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taR2u-00000009HwD-1E3h;
	Wed, 22 Jan 2025 03:04:48 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taR1c-00000009HtP-3pzE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 03:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=QRjh9
	FhrnaHu0S6KpqI8qiqynan6VGuEAgxuDFjUP/U=; b=UyoLNlt6vmCgZ+SJU1ru9
	gffJweKRjs98BGRmGx6BBDYGF2luHg3g+ZWa2blkEPGxtfdEivo1bO1Yqx3hVAy3
	6n2tUSlqih1Rf5dCiYmsAQXrCzsLSHtq4x8uzsRp1e8g6Wu4QnMN/+apgMPqWElQ
	HEMYAzsE4o3pnLVSmp1Il8=
Received: from localhost.localdomain (unknown [116.128.244.169])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAn0lmmX5BnaACMLQ--.47927S2;
	Wed, 22 Jan 2025 11:02:00 +0800 (CST)
From: oushixiong1025@163.com
To: Joel Stanley <joel@jms.id.au>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH v2] drm/aspeed: Use devm_platform_get_and_ioremap_resource()
Date: Wed, 22 Jan 2025 11:01:55 +0800
Message-Id: <20250122030155.57802-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgAn0lmmX5BnaACMLQ--.47927S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWfCryfWFWUJr13CryxAFb_yoWDWFcE9F
	48urs3XrW7AryDt3yjvanxCFyIkF9agrWrGF18KaySv3W7Z34DWryUur92qr1Y9wsayF95
	t3WUXr17A3s3CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbqQ6tUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXAPcD2eQUvPxtQAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_190329_362844_0FD7B437 
X-CRM114-Status: UNSURE (   9.19  )
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

From: Shixiong Ou <oushixiong@kylinos.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single call to
devm_platform_get_and_ioremap_resource().

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
V1 -> V2: Add Missing commit message.

 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index a7a6b70220eb..33f81b53771d 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -146,8 +146,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	struct resource *res;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(drm->dev, res);
+	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-- 
2.25.1


