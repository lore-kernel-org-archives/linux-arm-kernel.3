Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978906083608
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nUP4O3jT;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l+2qG/rQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=It6k7UD5Hx6cfh+z/HI//bRLuLUB2Zv39AgYutsE7d0=; b=nUP4O3jTGwYn65
	g0dEM+AJYDsN3e0WLJ/yZrqFygYulpB81vbV6KEZjXYMbNRfBECV0lcw05C6FDqJLaLb6gR/kKkCn
	3HQceE+UDIY94dOXsrD0e0VwhMllXk1DXau356bn5tG4iXInO3U87egJgGvMrxaRdEVzXXIB4sywr
	93YjpBJ8R5SjXwEy+RBDnze+diVKyk1Xf7vHHFNq+uA4yUdjgZ8ObrNrRlKJx0JgmjHtRtjxEhqK+
	yQ0EgJ7STx54VhxmkHZJ2zThFn4zz5tkf9edryAsmjpyooBoO5Um0a9mqrpAJBBKXO8IXxiMpGqrM
	08Yv4eq+72E7xgZQVymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwPA-00000008tEc-1VwW;
	Thu, 05 Nov 2026 12:17:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwP9-00000008tDk-28mG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:17:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 44F7F44084;
	Thu,  5 Nov 2026 12:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BF01F00A18;
	Thu,  5 Nov 2026 12:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881039;
	bh=It6k7UD5Hx6cfh+z/HI//bRLuLUB2Zv39AgYutsE7d0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l+2qG/rQs7gsn8d/dkGLfk2SprYhH/NYAlpCKJM1SgLr+Oi+8qZDUV+NjRDluJYRY
	 YEAoqCEW/VI2wNdkgoW1a8XIIawzkumGa4kDWj2q14jQ7WsSpVGrw/cBGQLy9aGiPK
	 v2/hfD8ZUVBpaWMdmPd296hVDl9Ri1y3A7U6nla2voy6XlK7y/hgMSqxBB6btFVGeQ
	 JXxRkBJGpBosxMxNBj5xJ+O0SAqCK1A9u6bmPxxWLBUI05VYtCCA2WSjS9G/BSc8z5
	 r6sO2R2KLb7zTBvVrCfWnLUBiqLaF9PD4cL4ZlVU5RdBJeLUdCJyk3rrO3bCgqr0h+
	 CCWUrog44/6JA==
From: Joshua Crofts <crofts@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Eugen Hristev <ehristev@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH 06/10] iio: adc: imx93_adc: remove redundant pm_runtime_dont_use_autosuspend() call
Date: Thu,  5 Nov 2026 12:16:31 +0000
Message-ID: <20261105121635.1612-7-crofts@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105121635.1612-1-crofts@kernel.org>
References: <20261105121635.1612-1-crofts@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function call.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/iio/adc/imx93_adc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/adc/imx93_adc.c b/drivers/iio/adc/imx93_adc.c
index 797adaf371ba..1ced0c59609c 100644
--- a/drivers/iio/adc/imx93_adc.c
+++ b/drivers/iio/adc/imx93_adc.c
@@ -415,7 +415,6 @@ static void imx93_adc_remove(struct platform_device *pdev)
 	pm_runtime_get_sync(dev);
 
 	pm_runtime_disable(dev);
-	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_put_noidle(dev);
 
 	iio_device_unregister(indio_dev);
-- 
2.47.3


