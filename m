Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1CFE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efhjXff3MTCg53zAY/hGo5Xt5ge+TUQAtT63IqeZhA0=; b=D2Y307S4yQ9jg87P3qlElpbJ4m
	dx3o27YZavuzBs2rLAbnIBA4Fw3ov1KMokVnfudKyRFxzqUWzXvij2lsmwMY4w/kDheMgykLcygQR
	MAFzFZO6y+lonnjFwmia88DfbiYiav7gz1XjYeOHRsowdkjWygiojtp9Y02HZNUv9J3HxxsfXn3Ku
	oxXvNi70UGWnqumzdRuI7NOPxMgMRWN437hxWhL6kfJbkE/SG6aBMWcp0aUYdRDQ5e6qXnL5Pjf5Y
	hyP8B+av85VtaAHNAelsHSMXz0TDrzsC0oJUWsgbV+C/B/hf6DNvQf0svAx1zzRgfhR24egoVCoEx
	oiKKcPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlsd-0000000C5Bh-0MId;
	Wed, 04 Dec 2024 09:41:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIljS-0000000C3DY-31M4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:31:44 +0000
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 592F0157E;
	Wed,  4 Dec 2024 10:31:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733304670;
	bh=tvMPrDZtee9n82xo6aNU/4PQa7v5HzHr3u2kPTARj3M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YAimj7nzYQULQeidimnqh3H3OPPk/X99/EMoCvnDiFLidzDItFEYHZbVbX0VArFps
	 7uDFveL75r5hx2mN2ZOC97wliYMGHVzJ/wcXexxGbOGK/YYGoMpAJ8bdy/VzCPISto
	 YhbxPp3AxhXPgYCifSZt3FBPagnoPcwO2JcgW27k=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:05 +0200
Subject: [PATCH 05/10] drm/fourcc: Add DRM_FORMAT_X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-5-0bf2c5147db1@ideasonboard.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
In-Reply-To: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=tvMPrDZtee9n82xo6aNU/4PQa7v5HzHr3u2kPTARj3M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCFygysXkOjEMoy40hXOyiyvyWv/rkOZmGJNZ
 oS6zZYKsiWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhcgAKCRD6PaqMvJYe
 9VIsD/oDLZF8H/FHcv6f7SUf7QmryZogfPRwUG0h3yAwM9HymRrbzwpDheUYCDmQkOzBb4oYwJs
 2q1htt2fXMOufdXbAGCJA3+rBT/6Pf2+4xPWNFVAyxWT3Qox8wk2/c1zfBHZxsioLumpDTzkwBu
 PGCAckYPjkyFCwXprXI4wj0B7NLdBULLhMz1Cj4JADP/+eaDnBw//4J+9zxC+yQE2/YdUw6Pga1
 vu1MPBu8r/Q/IBUt3aRA1GvBj6G8vKdf5p+V0CA3P5GjzvIDDIDm2if3aL6647BAu8KOoyu7MX5
 Qlamz+P/RYbp6dgeehWMx9uG3ZEEWbpmdtWmvIN8jFiM15idLIEWGabXmE7Pf/79p4ReLQTPkcL
 N0sjALOu1mbgRE6zzcqGyjrSXYAot7Ly2ZJDbG43iKCVU1TF+wP/qgrheLxpFqbk63yfQE/zYzt
 JLosv0gW5Iu1RUvPMxgPhdTZNLKLr93//BuS2tEa0KAL0tITqOUR4r4GYU1oiLXWoHtCmthfLd+
 /agfnhD/NKGO4uG6mV4NZct/35xzPKRD0FSWJTqIdQHFE79A+0dCVJNLlRjMME+Js5PRxLret0P
 0C2RdfCXaLEbw0K58Cu7W+fTFf0tcFrPEhIEc+gr432jLgF9yA8wZXJsxfzOPhlciq/6nkbe4Sn
 /tZS6FaumK2qzgw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_013142_919413_0741342A 
X-CRM114-Status: GOOD (  10.17  )
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
 drivers/gpu/drm/drm_fourcc.c  | 4 ++++
 include/uapi/drm/drm_fourcc.h | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 6048e0a191dc..219113b5924c 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -331,6 +331,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		  .num_planes = 1, .char_per_block =  { 4, 0, 0 },
 		  .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 }, .hsub = 1,
 		  .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_X403,		.depth = 0,
+		  .num_planes = 3, .char_per_block =  { 4, 4, 4 },
+		  .block_w = { 3, 3, 3 }, .block_h = { 1, 1, 1 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 82f255eb3d1b..097904407617 100644
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


