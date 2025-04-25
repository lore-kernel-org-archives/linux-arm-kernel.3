Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0223BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNbfzCSI9RGaqss0UYo+qZtnaMpw5SApGU2qrcB5/+s=; b=YsAiy+GxeKxUojbcW7skLG0IT1
	pV90+cTLq9wkEXGxoSANZ+tmeBCjCJaUFunF8xei6CVoVDSA+wUpGdSLXkw8xG5vZgz8HrvVvn7Gc
	E0Fgapd8uF+7LBcDL/W5JAUrcZhZIerj3iYIWNgTsmQKystFe1+wVFhOcrZJvbCwCt/0PiAbEv4MM
	YROxypm4SOw/tEpGH+iodBouNyht1CFlM3tdnDIim6GQn4lYqq6c+V0RdxWC4aqrr40UMMCUzdj4O
	QQ2458ZgE+YT4GJeKOTnEu7F54FMYPl/onfwypFFwovEmMbjW3e//6HWXy4T68QngJF6Gl2ywde2d
	YhoK0URQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IA5-0000000H7nX-2OaE;
	Fri, 25 Apr 2025 12:28:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Goe-0000000Gr69-03Pu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:01:57 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76866124E;
	Fri, 25 Apr 2025 13:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745578912;
	bh=cVhvhYY3vvINyoHV0xAvckjC2ZNuAXRTm+8BLF/s7zQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n77idFsKvxNmXu6f9RR6HBy7DoH9Up55q5/wACzkRnoSqSajGj5lG+5zRXAAWN0Cd
	 1KNPtUAQN8VkfCd76rBtldbI9cmXs4SEVhPOjm0nLn8za+UMv7YloRKj4/gOdhv/K9
	 G+c6Hb43UUSX3bpcwABapLjAzh720z254BSV4vy4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:24 +0300
Subject: [PATCH v5 04/11] drm/fourcc: Add DRM_FORMAT_Y10_P32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-4-c74263231630@ideasonboard.com>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
In-Reply-To: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=cVhvhYY3vvINyoHV0xAvckjC2ZNuAXRTm+8BLF/s7zQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2uaukgIcgYiNdYQyfKwA6y6GZlPKLlYwMkGh
 0KfO1/O5g6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrmgAKCRD6PaqMvJYe
 9Us7D/0TNtLMLAaVUrej0RrRfkzhzaB7OtoqKTSGXSo19Bogjg6eHlm/Msq/apelMYsbRmHLyXk
 KawcwLjqENR6puhi/xEsoyQR6E7N/sMN25ztZvk4c7OMV8QNdYpVK7zQ08LO/TsSQ7Rd3Sdaa6J
 +G84lzH85T24ysVpDNOmQTKB9u5MSi6HDcnV0vFsX1eFMcl+es2EFukaO72JLoFhLOTfCh7MvNJ
 gJrrTy7nxEMp/b1V3LpMxyP5KqrbAnMjdyKBSfXgZrnzv7L2icgMe/aXcdELuc8nPnMtQyTY6pm
 +1DgDsVu3/GgsXB3WXQ8JCF6LxIn6gz6jLtrv8lisCRdEtIT576Afwo59vFcyzvBUhHEmzIb8AP
 S1LAL1NEWd5vnU7IbEQOuMETC+uuSpLs5IcAdK9oKiGB4robAg7VuTb8eb5UkMtmbHaE3ixe0CY
 EyxWN/A+NI5fR7/nyVvk68XKiAiAtNETBimeBNPoa7JRsgvAyrhkPFBPWloYT9ivbxkxXSLgsr0
 eL9T2U4n/BF342XSJisF4lkBUYRBFsX6i5EiexLaYgGpOXJWXTdn1pdP1ee4r0ojOL0QQcoJUKX
 +ESaYeYxH7zVAdP4osZQh549oXi1DXTGui9pCCGygnaBZ43zG6dkzLmH6t24AwT2X9Nk7bekmBL
 Zqs9sVTruClxLTQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_040156_196407_84647691 
X-CRM114-Status: UNSURE (   9.40  )
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

Add Y10_P32, a 10 bit greyscale format, with 3 pixels packed into
32-bit container.

The fourcc for the format is 'YPA4', which comes from Y - Y only, P -
packed, A - 10 (as in 0xA), 4 - 4 bytes.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 3 +++
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 355aaf7b5e9e..e5f04f7ec164 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -353,6 +353,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
 		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
+		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 5af64a683dd7..fceb7a2dfeb4 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -415,6 +415,7 @@ extern "C" {
  */
 
 #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
+#define DRM_FORMAT_Y10_P32	fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
 
 /*
  * Format Modifiers:

-- 
2.43.0


