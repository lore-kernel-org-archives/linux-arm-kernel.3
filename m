Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AF8608363B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=boYrFlPv;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=BNw4fsXN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5BT1om7dMxe0+KPFlhkATOyCWnao3HxieIFWLVHi+3I=; b=boYrFlPvMOTVJy
	nsg/LsFnI76KddqLOk78aZ84J3oO5+7KQK5QKXc8c5gDm98E1v3MPSpMLIHpJNOqqa9fRq61kpQeg
	sYpdi/IdGb19SXdTHIGocesGfdvE2m99EzI94h2SbJEqyknOiVRfX2OImY2z8eAtr92l7wMkHEJcp
	OpHwkWva1VkJh5tCT4qWfI9kZWiUg30o5mJiQEqt1uJHLgpy2qiqG3rcRjyhnxfBtAC0l/QYbvE1I
	oNfbKzSPSPecBppI+wnB12r6niLGyhntKsn6xF++YuSBFU2XGFJ9X6O+XpPWYTpprdIKGxJCxYnRr
	e4Shp0GJvOi95bd/xgtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCoE-00000002CX7-0f1h;
	Tue, 03 Nov 2026 11:36:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCo8-00000002CNW-3kz6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:36:06 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F2AD27FE;
	Tue,  3 Nov 2026 12:33:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793705626;
	bh=lCX97vVaNf2WptwIp7Q2Y19AtPkuKlMbVEBKL5bbL1U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BNw4fsXNZN3+/+uDs7U9f54aBfzd9g2SPlmgtU9oPHLaAdVyYK3i/T3kUsLS894O0
	 kwhUHJLi8yKsZ7Uj5bbk0UYEUIc382SJTcMuZVFozWColUVaBPR2ZvzBsrIu82Rkrv
	 dONE1xmhSPBOxpaYBbhCzLbB/h3qTXkeD3C+n/7M=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Nov 2026 13:34:26 +0200
Subject: [PATCH v5 06/15] drm/tidss: Use the AM625 features for AM62A7
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-beagley-ai-display-v5-6-f1c8d0e52bb4@ideasonboard.com>
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
In-Reply-To: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5259;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=lCX97vVaNf2WptwIp7Q2Y19AtPkuKlMbVEBKL5bbL1U=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq6ccX2ciXsFVaa3ku/BlYaLVhRR5Ey+tYT1l5W
 7qqG/rlbreJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaunHFwAKCRD6PaqMvJYe
 9W/xD/9BL9boxlQmi12B33BPVysIEAP5++92nJI7q/nIq+JZGfESc1NfrWq28x2gLxXNsG43g6d
 OO7FLyCvOJmwpA0eKmBU0IP9XaQBDsS2I8X1c9s9DH4sh308Wra91PobvAX+Y+jzoMnMWKvCo0l
 CBdmmymD6zegBVUBhXqg+zGOAtIX8aHXvzPwMnoUxfPMmmgfBIly4R4GbOYcVF4HIQRw9RQmFEv
 lBskFKJCzF/k0xmEJJxpJ67cI9jzESvikp2giC+SPbQBy+OqB2jkp6S8IGB8ISLl7JgwSX5gl8Q
 q71Dw8zOPCkw7gRdKwRk1McNzR2LpeW8JKQO33RGEVgUtjhhg5Zdi7Rm35pr2ixA9OI78XCnywm
 4RcTIbbdvuzYpZWqmVutVTtgvnMwiz+2XPK2t8MqmJmQ5O9yfFMLNLI47RzSKNRjNE1ys7UkC06
 +qHYXAFhFE3jvUiFvQBgp5SEpU2SMY0jnaI4cE9UROQ5xv+NlBLa0FVWtX/er/bSkp8uM2GMqOE
 oAbI+kS2MU86XHvm3lqGapBrVmzq2Mv3T00UktmWFK1HOlMF01QLoySEUnK2qJVH5SlUfTKjmOa
 9+uIUcNTPNIWmgFccuD+weKSIkp4RQ/wMGnfeflNKSyDjPplGr0xYnrAQWvSbIu1d05RG2sHvXt
 M+dYHosDbWlX6Vw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_033605_249248_F577964D 
X-CRM114-Status: GOOD (  17.94  )
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

With the recent cleanups, the data in dispc_am62a7_feats is identical to
dispc_am625_feats, except the subrevision, and the only place where we
have a difference of behavior wrt. the subrevision is in a debug print.

Drop the dispc_am62a7_feats and use dispc_am625_feats for AM62A7. The
debug print will print a few extra OLDI status bits for AM62A7, which
are not relevant as AM62A7 doesn't have OLDI, but that is harmless.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 59 -------------------------------------
 drivers/gpu/drm/tidss/tidss_dispc.h |  2 --
 drivers/gpu/drm/tidss/tidss_drv.c   |  2 +-
 3 files changed, 1 insertion(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 028cf78df3fe..17390f0c3913 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -350,60 +350,6 @@ const struct dispc_features dispc_am625_feats = {
 	.vid_order = {1, 0},
 };
 
-const struct dispc_features dispc_am62a7_feats = {
-	.scaling = {
-		.in_width_max_5tap_rgb = 1280,
-		.in_width_max_3tap_rgb = 2560,
-		.in_width_max_5tap_yuv = 2560,
-		.in_width_max_3tap_yuv = 4096,
-		.upscale_limit = 16,
-		.downscale_limit_5tap = 4,
-		.downscale_limit_3tap = 2,
-		/*
-		 * The max supported pixel inc value is 255. The value
-		 * of pixel inc is calculated like this: 1+(xinc-1)*bpp.
-		 * The maximum bpp of all formats supported by the HW
-		 * is 8. So the maximum supported xinc value is 32,
-		 * because 1+(32-1)*8 < 255 < 1+(33-1)*4.
-		 */
-		.xinc_max = 32,
-	},
-
-	.subrev = DISPC_AM62A7,
-
-	.common = "common",
-	.common_regs = tidss_am65x_common_regs,
-
-	.num_vps = 2,
-	.vp_name = { "vp1", "vp2" },
-	.ovr_name = { "ovr1", "ovr2" },
-	.vpclk_name =  { "vp1", "vp2" },
-
-	.vp_feat = { .color = {
-			.has_ctm = true,
-			.gamma_size = 256,
-			.gamma_type = TIDSS_GAMMA_8BIT,
-		},
-	},
-
-	.num_vids = 2,
-
-	.vid_info = {
-		{
-			.name = "vid",
-			.is_lite = false,
-			.hw_id = 0,
-		},
-		{
-			.name = "vidl1",
-			.is_lite = true,
-			.hw_id = 1,
-		}
-	},
-
-	.vid_order = {1, 0},
-};
-
 const struct dispc_features dispc_am62l_feats = {
 	.subrev = DISPC_AM62L,
 
@@ -945,7 +891,6 @@ dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc)
 	case DISPC_K2G:
 		return dispc_k2g_read_and_clear_irqstatus(dispc);
 	case DISPC_AM625:
-	case DISPC_AM62A7:
 	case DISPC_AM62L:
 	case DISPC_AM65X:
 	case DISPC_J721E:
@@ -963,7 +908,6 @@ void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
 		dispc_k2g_set_irqenable(dispc, mask);
 		break;
 	case DISPC_AM625:
-	case DISPC_AM62A7:
 	case DISPC_AM62L:
 	case DISPC_AM65X:
 	case DISPC_J721E:
@@ -1479,7 +1423,6 @@ void dispc_ovr_set_plane(struct dispc_device *dispc, u32 hw_plane,
 					x, y, layer);
 		break;
 	case DISPC_AM625:
-	case DISPC_AM62A7:
 	case DISPC_AM62L:
 	case DISPC_AM65X:
 		dispc_am65x_ovr_set_plane(dispc, hw_plane, hw_videoport,
@@ -2384,7 +2327,6 @@ static void dispc_plane_init(struct dispc_device *dispc)
 		dispc_k2g_plane_init(dispc);
 		break;
 	case DISPC_AM625:
-	case DISPC_AM62A7:
 	case DISPC_AM62L:
 	case DISPC_AM65X:
 	case DISPC_J721E:
@@ -2501,7 +2443,6 @@ static void dispc_vp_write_gamma_table(struct dispc_device *dispc,
 		dispc_k2g_vp_write_gamma_table(dispc, hw_videoport);
 		break;
 	case DISPC_AM625:
-	case DISPC_AM62A7:
 	case DISPC_AM62L:
 	case DISPC_AM65X:
 		dispc_am65x_vp_write_gamma_table(dispc, hw_videoport);
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index ebaf559d56e5..d07352f7b2bd 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -63,7 +63,6 @@ enum dispc_dss_subrevision {
 	DISPC_K2G,
 	DISPC_AM625,
 	DISPC_AM62L,
-	DISPC_AM62A7,
 	DISPC_AM65X,
 	DISPC_J721E,
 };
@@ -96,7 +95,6 @@ static inline bool dispc_vp_is_am65x_oldi(const struct dispc_features *feat,
 
 extern const struct dispc_features dispc_k2g_feats;
 extern const struct dispc_features dispc_am625_feats;
-extern const struct dispc_features dispc_am62a7_feats;
 extern const struct dispc_features dispc_am62l_feats;
 extern const struct dispc_features dispc_am65x_feats;
 extern const struct dispc_features dispc_j721e_feats;
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 44b0b009c29a..7e7f2ba6ae82 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -238,7 +238,7 @@ static void tidss_shutdown(struct platform_device *pdev)
 static const struct of_device_id tidss_of_table[] = {
 	{ .compatible = "ti,k2g-dss", .data = &dispc_k2g_feats, },
 	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
-	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },
+	{ .compatible = "ti,am62a7-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am62l-dss", .data = &dispc_am62l_feats, },
 	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
 	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },

-- 
2.43.0


