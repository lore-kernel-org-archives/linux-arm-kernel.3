Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8943AC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTEmncciocPRgY7H5fUjlRkCt48qMFTt++Vy8wJxvVM=; b=0L8kEc0BIC4GSYiss78/VmBj3p
	1oJXnofgzsFg9+Cb/YQXeK8ixs41tZ1J/8nkH8Weba3e7Xg+cL+bf8VjcuhmFTZNt0kI5y5cyS+yj
	QtwoCBCqxEiCGcPP44ADPAKY1M1pbO6nQ4qsGrdhkKaclNd4T1PcVYZ946XvuorVLRIDGC0qX4qFO
	wwR8OrpgpVYFi1fgObtuqNH1P4OdEapgoNkx4G7hDYxQv4/pRvrHxvDNJO5eqi2oxlwnDlr2Mm8JU
	LuqmFGrpRu1Hs81RoFfnicrOwwPZXby6gfGyCpP4286ZyrRXpOoI2wXJkQp+w6DZeJaR2CokFr5Ax
	WDSzTZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzNO-0000000BEc8-159l;
	Wed, 15 Jan 2025 09:07:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzJg-0000000BDOD-3vjR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 09:04:02 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C22413DE;
	Wed, 15 Jan 2025 10:03:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736931782;
	bh=mf5laTsJQS47wTWaPVq+HhwOLi61DaR3sotP+bSFleI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wIjUOXoTrCAsZyIy6oVy/itUfwQu9oNqpBayUzZ+kYXDQRFzwAZN1uo0dQxq5ZjvO
	 l/1S5T4qpNqtLdiuPHQ61LcoEqmOoOujugrnbMr4yoa7RzFNQHooG8YDFgySB4Ii4p
	 GrdJKp0l25VnPxV5+grBzfXNGh4aBhF3SnQeYku8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 15 Jan 2025 11:03:32 +0200
Subject: [PATCH v2 03/10] drm/fourcc: Add DRM_FORMAT_Y8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-xilinx-formats-v2-3-160327ca652a@ideasonboard.com>
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
In-Reply-To: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=mf5laTsJQS47wTWaPVq+HhwOLi61DaR3sotP+bSFleI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnh3n5zvpecihnBOCdSx1weKiME2DEAayx1A2jv
 fA/3PoFUBOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4d5+QAKCRD6PaqMvJYe
 9QbID/9GekFdMW0H18lXJ9fm5qUiNHHc+Iyzp1+DxUB6NtlHy9niKCNSrBZWEd4r4z6qTOAbURi
 hwUMsuIp8nDWiNdX/XvLmGRTHzrGtyDtvVzodr3xfw5PVFGCqfzHvnpthMdYf2KhjzcBLTiUaA2
 ovvdKHS3MqrgQh7fau3JIDk718kEM4a7yIcboLyzaNYMLtgj6HAPo5JKQyGuccP3AXFHLTzUOXt
 UUe0Rh56/dq7MDi/dIR1Ds+ynsFj5E8jmu39uUTUmQykEE7mDEBn8P5rxsXz48NNaBSeblQscoO
 0kUnLH0xhWwmwACTJ9AZbL+FCfYxj01AX1TJN+ACY9K+DjPKUOWdBvvQGYk2RnA4OWdyIEmM9F2
 NO2yD+SECjt5+cTx4VJ0/olpnmVSEgW3KzMefluX3QuzOVFNKDkRWG93is0FEKY0eEKE1qsbmEn
 uJI9NJzskJuYNTyJw7D5REmCHvd6Yr/7JdiDPINHhJuEgZornrYEX0tZ1bVyk5K3+F+5j8Mhlgt
 OSWALRQtm65G/lJgZ+1YJ4DW0KMXOJ1taHtWh+Rs0nmtk8uRfXst5RJSnvC9+JkZKcUhLTpT3oS
 TrABXctCqUs7Vla74JbQJTvrq3hHZbvTxDPciZCuh9VTRGHUVpQ7f8YxUiaELAS8NblSNiiyGMv
 aPv5VoocYqvqopw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_010401_115963_6B9365ED 
X-CRM114-Status: GOOD (  10.83  )
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

Add greyscale Y8 format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index adb2d44630ee..d721d9fdbe98 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -239,6 +239,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_YVU422,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_YUV444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_YVU444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV12,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV21,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV16,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 2a00adcfb1ff..f79ee3b93f09 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -405,6 +405,9 @@ extern "C" {
 #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
 #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
 
+/* Greyscale formats */
+
+#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
 
 /*
  * Format Modifiers:

-- 
2.43.0


