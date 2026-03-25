Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097EC103A9BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlRZ97Vg9kUwqb3fLBh6UULibuqHL/WjtypuxaR6fyA=; b=pI2BAbcSqrU95nJjHw9qy8UTN9
	iaI0zPILJMLSRNj2Y6YN12A88mNImj1WEdnjrsihONjIjyqoLnExYds2HpbyOOVUGI+CXJFADHNUT
	+0SHeSXxJW+QOxEx3vHm+E/TQqV2WUBIQ1m+9NJYYynoLC5DwLu2gr8XgfA9lThibl0/qCTMQwZAr
	/EWo5jeBcefe0lTSuPUvLE+wbnhi+2sxd4Ah2D4K3bRrqw1rG/H9R9D9Oil7lPBDku/geuK4dOgGq
	APPdwy8hU/IiAaAk/8H9CrDlgintJ29QUEApK8Kfd3+SNqwY5l91tpEBlm8r70uwv7XIv7gZuh7Ib
	zqouzfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oo9-00000003WBo-2FvV;
	Wed, 25 Mar 2026 14:02:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oo3-00000003W5C-2NDp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:02:00 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82DBA1B9D;
	Wed, 25 Mar 2026 15:00:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774447240;
	bh=mMRpsHYy1pqwmXc7aWTQaKqbMPHXmze9/AesB8a3FEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CzYZ5d5z+Hs1MaNufYwdYoS7qRVVk4GZYzb44PDTC4zvsAgsNZUIPzFP+9CNNNb2s
	 ajT9yRD/pw8Kgo1iltEcKgRFAMyuaw7oOwSm0R8lpxi7nGZVvF5D4OJMZcNp7Q8BHA
	 l50wF+igAdUT9mw2So2370fd+NRHcckXD91nYVnE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 25 Mar 2026 16:01:29 +0200
Subject: [PATCH v9 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-xilinx-formats-v9-6-d03b7e3752e4@ideasonboard.com>
References: <20260325-xilinx-formats-v9-0-d03b7e3752e4@ideasonboard.com>
In-Reply-To: <20260325-xilinx-formats-v9-0-d03b7e3752e4@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=mMRpsHYy1pqwmXc7aWTQaKqbMPHXmze9/AesB8a3FEQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpw+rMeGeIX+tjkHGVyKWPVcJBq8bi+sdc5udzo
 K5EWZPuDymJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCacPqzAAKCRD6PaqMvJYe
 9QnoEACAcV4mlK32P0a/e8KNd2MbnUHbYyXT0m4m1cvYxM/pkSSW7xoNsFkseRkUtuE+gk9lg9N
 JNX/7r7ka5bRDyiFhhXWZnCxCcpwI1GD5r5q4sxYJFpkTTr+wu/O/2rGioiyOP1O5ya5PJroW6l
 FEqm7b1ASX1zBid82WUBjqJfSRHkV/J2rrxaeeKi8TYn7AvNEOWrIZV4G7uAYMfzkBSbgozqfd5
 RRD0oI+WQ+472BlYAolRlOvadS/QIumPYqDWOTtbVOgHeM1PNZvaEtANzsBBIs1O7bSBYkZqrUJ
 DZjq8/cBsdV69TscHseLwoLagHZ0Wx+KFJn+t/JewWWm081AOdWU+BR7o60r+6LEKAyl3O+Z3UX
 NftyNqtzLlGZ1rEf965GWN+NsI7Xs/I08KBIAIGQq9vQ27iiupygAQECk0RCCBE1Bh4WwA5FP/6
 1vp7YaZ9HgHLLqihqdhakhDLJjjycEq174f2saagv4vkXpihS62kN0Y7h/1SVCecTpky202h8Ph
 6BqgvyPr/lWR8TJA+m6bGfhHbf6jVwjla3VrwstHaHxXOUkqmUa/Re+Kr7aUU5vanjHlnj5HMiJ
 UO4lxMQ/+GHb535HDR/k0kCe4SfdEpPYpLe3EJ2qFEOb2cHabtmDjoF84hR6euhX3FPG8xoiWRq
 Q6zJLeoX1RuAavg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_070159_753165_BD1741BD 
X-CRM114-Status: GOOD (  10.23  )
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
Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index de8c98b166f1..c4ce7ee74dea 100644
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
index 385da5942716..2c8f5d637e16 100644
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


