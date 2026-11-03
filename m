Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA349606D807
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S4ZnkAwq;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=GNCY00i6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=unrXYpRM04ZDnuSzMCxmVlS1hxiwU0LvVlULs3HYgng=; b=S4ZnkAwqz5RydD
	Ljf5Vk+hRbQVUJZAqWRiW+FXaGL/KaKYrkSD17zN7C13kR70wWrod+tT3KlY6JLsn88UU5zuYoKkc
	Npwpz38385I4dCa3AAyrMg2Z5YAhN2okEnPg3f6N8PwyqoxbC/agEarBKBu0LgqgA4rNE+bRMEKb4
	EC0i+DvA8WbxzBmIdlU3UAdgMKq76TWTq50H7YGHZvHRL4ZVxtrM85gS6KjmyQubWAaXXfc0zDFRW
	p2wqhRk9KHgH7vdAVlyaX9cHHle4YDpvlsfnt6qHF14m9bpcZTmnsbULCBeHOJWq8Yd6TTGOSiCGP
	Q6KzowGZ3aFHgDG3oXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99R-00000001N2l-2dZR;
	Tue, 03 Nov 2026 07:41:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98v-00000001MKN-1vq7;
	Tue, 03 Nov 2026 07:41:34 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5CE32805;
	Tue,  3 Nov 2026 08:38:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691535;
	bh=6Q9ze18PqHn248ojyQQszGM7rBEuyTl31r061SKya5g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GNCY00i6tFBKpRHwoaElC/BNx/mHQcHLatcF5sA2somBrLB3U5PUfx7KhBYozzf8G
	 KTwXTjITFhe2DsAxT0wjQqllEP2Q4nJXABMxre+jXtREEtG4RVHBaDNuhsvFnEsGK8
	 OTfQ2xg3O99JsIfd4lbozFIM/S6A5WfJUIs2BHsE=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:43 +0000
Subject: [PATCH 07/16] media: rkisp1: Power down after subdev
 initialisation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-7-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=6Q9ze18PqHn248ojyQQszGM7rBEuyTl31r061SKya5g=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAQsEz30yISu/ty86JMYqKVlaIhSKowTjLKq
 OxO/5Dl/76JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQEAAKCRDISVd6bEV1
 MpqdD/9UIlQ0Z1KWJ43DKnhvwdh7TZAdi75TJBQH+hMli4XVXFcUVl7u7haiDn+RqH0A7ad2lEa
 LNlqYpyMbuvYPRP8t3iB5ARzaA+yDO/PyjfPDKCWIXpfdFUcCR9mzrVY/fp1cugpZPld5l6FqGY
 29m1M+G54/6DBBLB/I2p+sYAHe1epUDm8L1FQRrXjBr1ADFqnldp7RMSiW1GMwEQHwwI9VNybt8
 min/iFAXJiVFdhJmIu0MPWtpX7UbAk3aqn/RJaKupr4gtga4YTBpF6vPNOkIZAoR2Uysi9X9lHz
 Q6wFTMoJyf9vV2CvXDbfcCouNYihS0HZTEk9GUyJBqoz0j722OStMOXFTTipqnjhtUzmFwnNCse
 e23s99jMkvKw+VryxqWIZwP4PZfxOBHRotiakMRRqr2DiqThuk2q8xfY/FozGdAF8oLrMG9a2IR
 TPYJwW26+SCC1pLk6o1v+G/mLzd3P8FIs7ONTUFBZDPQ97aL9R1/vk4XwOc2VGG4eIMD0UdXl0p
 cPPVAIyNGpUCAHCbUp82eY6HPesoT5+NqMQCw2Idy9NkPXrpl2gJiF4IZsAvt/rpy8IjxK+zIzq
 s+3mWHksUWvvaTDG9lsvVULcs0B/2X0NoqnQCvJms0AF5QjWRXrEmEBxzb9g+YMhwWVqCEMB6G4
 KszVl8mCjDQrK1g==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234119_962966_1CF98598 
X-CRM114-Status: GOOD (  11.99  )
X-Spam-Score: -2.1 (--)
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

We will shortly need to reference the ISP's subdevice in the PM
.runtime_suspend() callback - make sure we don't call it until
after the subdevice has been registered.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 2efbe6140da71a51077d7d4aa2352ef95497ebe2..9f1d0f72ee9bf4364c696d9fdd8febea80d2bcde 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -729,11 +729,6 @@ static int rkisp1_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm_runtime_disable;
 
-	cif_id = rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
-	dev_dbg(rkisp1->dev, "CIF_ID 0x%08x\n", cif_id);
-
-	pm_runtime_put(&pdev->dev);
-
 	rkisp1->media_dev.hw_revision = info->isp_ver;
 	strscpy(rkisp1->media_dev.model, RKISP1_DRIVER_NAME,
 		sizeof(rkisp1->media_dev.model));
@@ -770,6 +765,11 @@ static int rkisp1_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unreg_entities;
 
+	cif_id = rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
+	dev_dbg(rkisp1->dev, "CIF_ID 0x%08x\n", cif_id);
+
+	pm_runtime_put(&pdev->dev);
+
 	rkisp1_debug_init(rkisp1);
 
 	return 0;

-- 
2.43.0


