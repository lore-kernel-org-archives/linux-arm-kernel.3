Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4569D2F009
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBMLm1j9qMEfaJJUbhgN1fxg4NFI10v37TXNLgfFdzE=; b=lCZZlStQlEtH2v8kDMoQSLTnyU
	YdRBKkPXjB0lsp72Y92sYRGSvCMzRcFzZm9TxnsS1zze4ZcRlW2ItrQYjZal2UfhZi19556+qZ/bG
	CbV/QruAuKsqmfa6EzST/15/k2tpCLeSrddOR7UZ55O4uoVqBSbHce2bwZxhP3KN9exKeaieKX0QV
	Jet4t0lGNCZyh+3zD5sTz0AU6XtcGeMukblVn3gG3ZYewBbVM8E/O10M0OMcaflgj5NOidT4Ca7vy
	kfi+ZKGZeZvlnLNUjGWk4GIInMi3XbsiYBCHWhwnBN4Lb0YatTGbQUDHR1as/10tc4sK8yAnyTXb8
	Ikuvdnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9J0-0000000GTNf-1EXQ;
	Wed, 28 Jan 2026 17:26:14 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9It-0000000GTGp-3E9H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:26:09 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 510422813;
	Wed, 28 Jan 2026 18:25:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769621129;
	bh=UdDzA52TKl45mei5bdLdm5Kee90d3cZZUGKd3QBEtME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U8HhN0anf3MeQckAjmiF+Op+8Mi7j/5uKQpdJjEHkKm/xlfF0AkCUlk+9aEXbb6rF
	 5KpaTcX85LLOTaPitjSp6T7tklqLGfKdFPIKRoGjtUmUhRjyiHYEFXQndBIZ5KQFoa
	 07KRCpRFG+keIZhP1x9G7HKxqYrzTBTdRWzOFv/8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 28 Jan 2026 19:25:31 +0200
Subject: [PATCH v8 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-xilinx-formats-v8-6-9ea8adb70269@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
In-Reply-To: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2347;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=UdDzA52TKl45mei5bdLdm5Kee90d3cZZUGKd3QBEtME=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekakGLx5O67vHi3+kVGDNTWlVeg7//CZPVia+
 byCJzEfog6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGpAAKCRD6PaqMvJYe
 9enBD/4uoedvPCXL7DrVHTtZU/bEt5cI98bIySQVvairB77KkqCGinlPSC6bUkjtEsw5KD4Sqk3
 PmDvHNUoMPtxK2dgOb3ZSxzbd3KaX55sKubKuBSsn1Hmhc+A0kDPWqrLZhyMe/XPFFNh8wmcN1n
 uLjYsnWJvfGFql5YENX7/Xbv3rk1NxI07SgrVazxT57lViR7IqWLGTZvGuaeeASr03Sc7tJ0kEy
 Q7CogivhqhbWGJB96Fwg4IUY19ianyotT6sIJ6B4+piobRrxdoZKBAcqpDCBMqykUDR/t1IDBU8
 NJX+dZdIKiAzyj0FZ5gaYQrC5L9LdtSJysXCSexrz9bx7+cRBB9BfXSgyJ7nT0VdsqPY1Rjoa63
 q9mHNNzv1vXf9rV/OvES+XiRrfGwOSI71JnXZQrXYYTbtpfMNzb6aLSICKFwm3hNwXOkDWyFWHi
 qY55wYZP2t5SBqttc+S1CXpK+W17JaLWuHt5/6bSGz8qmBQVRDyTN2dXXMd9aK8XJlHK4+lOPea
 1Rc6OSXrtQ/UTPE/wwZvGywJZQh+L6QOYQCs5OHCADShtFIlQ5gtuG9biQGUGrQQmc0pXN65LUV
 i3+mGhEi+Y1iMsA70UM4fol9u6r57GE0RYYy+kbU7DcpWABokvmi3rIvMg0lFQglJi5WJYf4+1N
 n439CT2cWDLOd7Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092607_952388_1D97D287 
X-CRM114-Status: UNSURE (   9.92  )
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

Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
container.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index ab643dedd6d4..a736df2de3fc 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -288,6 +288,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_VYUY,		.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_XYUV8888,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_VUY888,          .depth = 0,  .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_XVUY2101010,     .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_AYUV,		.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true, .is_yuv = true },
 		{ .format = DRM_FORMAT_Y210,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_Y212,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 0128398b7936..13e3c57046be 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -264,6 +264,7 @@ extern "C" {
 #define DRM_FORMAT_XVUY8888	fourcc_code('X', 'V', 'U', 'Y') /* [31:0] X:Cr:Cb:Y 8:8:8:8 little endian */
 #define DRM_FORMAT_VUY888	fourcc_code('V', 'U', '2', '4') /* [23:0] Cr:Cb:Y 8:8:8 little endian */
 #define DRM_FORMAT_VUY101010	fourcc_code('V', 'U', '3', '0') /* Y followed by U then V, 10:10:10. Non-linear modifier only */
+#define DRM_FORMAT_XVUY2101010	fourcc_code('X', 'Y', '3', '0') /* [31:0] x:Cr:Cb:Y 2:10:10:10 little endian */
 
 /*
  * packed Y2xx indicate for each component, xx valid data occupy msb

-- 
2.43.0


