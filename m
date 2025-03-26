Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ECFC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 13:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXPlT18QFH+sWN+p4xBpJSoaniF8Pd8PdaBLHb0Xox4=; b=radueg6G3m6gi5vfNealFRYaEh
	YECUZkXmrZPi+VJnoQI56IwrV9qS6LjfgiC9iyHyvciqNQloiDct6QGoC46WCPgXq2kbxxpzlKC4G
	/cX65xszquImCkhgJExLhxZLk7VPriMBhb0C3fZsGhLiC28Q/BuqcoMF5tWtWSFOH9PxKTIW6YFlw
	jZF7K0MwoeWip3j9XeznlgIY08SYEWpe9OcYB5bjH7ZBO+4RQnFn/aZmoijbbozSa0mOA+fdeiuxW
	94jnE8ZWXWY58g5SYsPAjZl0b8dzvsXA994VsuY6mOVEVcDW6hqJc3GkUV/Kv4fZtx+zZlTRci3dm
	8L5rU3EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQtL-00000008ZsS-0PMO;
	Wed, 26 Mar 2025 13:33:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQj4-00000008Y9x-38ty
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:23:23 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D28D11D9;
	Wed, 26 Mar 2025 14:21:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742995294;
	bh=RuiwkWYkXDPZIyqS2srDTuseW4wRtdGOjSjDtskjiwI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eSYLKTt8O32894iqX/Hoqr49QlQLFyG0/wiGIdhT+9tiE+X9/X+LV9JRyMzzUx187
	 snu2MfZWclN7MxmzCAjzGYwKLH0W4biifXKjjERNRWjfixwC8tyfwh/mpq5A9HJtcu
	 KiaJbbhcZHk6rGZSuPbzIija54HQ91ivP6hnUg60=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:48 +0200
Subject: [PATCH v4 05/11] drm/fourcc: Add DRM_FORMAT_X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-5-322a300c6d72@ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
In-Reply-To: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=RuiwkWYkXDPZIyqS2srDTuseW4wRtdGOjSjDtskjiwI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//Bs2/DMsm0t+zsYTdQ7Dcu7n+xbEHvoo0jv
 I7PQSKvvUWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wQAKCRD6PaqMvJYe
 9VTOD/9jFgKgiTf0yGGG6QkDGvB2kB3FBx1D4T8EqaQKRDlJBrDiFvZiUnwrbwlrL66fMlHPBBw
 /Kkc3ysttJiQzXAS3L4QVnLV6k9X0atU/7ibDNZo55HERe3pNOOXCkRa+ZwVKSt9viL7oS1AVNM
 NpE15l3DGxqSp6Vxrj/T9EQdwsXFyQ1tS9NGYH9lf9Zbk6iPJ3DzlsVbf0tQSPyIIGkfeZFO9xj
 kUXudD+uNvYJn4XXl+hW4aXeUGVGxDfqJny8FblYXbhMl5WPLkdPk1r4PWIrwf/+3yaW4uyPJZO
 L1zzbeGTvrDam9gYqQhaZ2bO4LbIdYWp3+HIOVAJjqSkNlqm7SwYhToJUp8uqxa51VytWVbQvsP
 EEFJ2k6QqpeTGlFuaUKgF3gbedkXfTHGjvzTAg/3bke3BxWyEh3n2tUTyG/heshlbAQDafR6uJ8
 fIB7zUmpsjWm7gXWCm0ID+vfwyf/agz+6agZ2bSJZ2DO/H5rT9Szru3Kp57fH8hb9VBZbYsH88P
 Ykpow683tzybEeGhT30YmF+bNktP6IoPwWLMuXmgjRx8YWpHHJxqFavyIjmBvLhoT+BiRLWiZA8
 g1j25Dfk9PKQhNU6h4oe6vUDi+9GS+VA+n85Q96j7n4KOVYwcDWkRCGOH+fXd4ciBjdWpMKPzVn
 vFeC4HrV0kFgGyw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_062322_929395_B41300E5 
X-CRM114-Status: GOOD (  10.52  )
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

Add X403, a 3 plane non-subsampled YCbCr format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 3 +++
 include/uapi/drm/drm_fourcc.h | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index e5f04f7ec164..60684f99f4a7 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -356,6 +356,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
 		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
 		  .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_X403,		.depth = 0,  .num_planes = 3,
+		  .char_per_block = { 4, 4, 4 }, .block_w = { 3, 3, 3 }, .block_h = { 1, 1, 1 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index f6316adbeb97..10d77f6f6e95 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -385,6 +385,14 @@ extern "C" {
  */
 #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
 
+/* 3 plane non-subsampled (444) YCbCr
+ * 10 bpc, 30 bits per sample image data in a single contiguous buffer.
+ * index 0: Y plane,  [31:0] x:Y2:Y1:Y0    [2:10:10:10] little endian
+ * index 1: Cb plane, [31:0] x:Cb2:Cb1:Cb0 [2:10:10:10] little endian
+ * index 2: Cr plane, [31:0] x:Cr2:Cr1:Cr0 [2:10:10:10] little endian
+ */
+#define DRM_FORMAT_X403		fourcc_code('X', '4', '0', '3')
+
 /*
  * 3 plane YCbCr
  * index 0: Y plane, [7:0] Y

-- 
2.43.0


