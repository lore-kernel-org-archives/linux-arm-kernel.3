Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC56D116FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gX5vQqy2YmRy9K4CVoua94RWgQd80fv3rSQfhUuuuAA=; b=gZD+MJd/dhHEQ4bm3Rg05iKcwY
	ECwnOO0TwSz5vJEmUtE6VftTP21XCH+d/Y4+SPhcrtvYKRVAOH3P/Kjh9fsdZ3znWuwUqSTAhMEz6
	Lw1eki5HwBV80m13JkB+lVZq6F3EDZDSnzSqUNxkwsHKUd8ljHcrpB0WTVe6q7kjDS25rZ6gG6XeM
	9y+77xcbrb8rs4A5+CaXakx27s3BzJTjHU5viGtDXv13CRZeQWDKfO4DT3E797ZaxHHbUpiZ76NjP
	8+o4HTQB7skQrMAq/kkAroAfIqNvHXCg/2LYQ5yu8hQR+4p9Rg53BNh9JfIDXlbcvoQ2q8a5Kmr1n
	YVcXtDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2sP-00000003X0w-3sxa;
	Mon, 01 Dec 2025 12:19:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2sL-00000003Wvy-3zZt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 12:19:31 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A28C41D48;
	Mon,  1 Dec 2025 13:17:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764591432;
	bh=WLk1HewuOuznQ13B2fTOs8j4JP0lR+n7QlwBtnwltGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mrg9GZqWIeaW4h0a3G3wBzTj96xm36rN+V3382lcG9Cc5f+B2EhUpZRxt4BiTxRbG
	 MYFEqDO2pIea7ukcvZsBoezx45OSDa32yxKCHp4Ikp7jXfr1NDDzs/GTpcL8uotWki
	 Xwq3LuHneTV+YunRG+yVy79Pgi2gR70QT3rYvpcw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 01 Dec 2025 14:18:48 +0200
Subject: [PATCH v7 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-xilinx-formats-v7-6-1e1558adfefc@ideasonboard.com>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
In-Reply-To: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
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
 bh=WLk1HewuOuznQ13B2fTOs8j4JP0lR+n7QlwBtnwltGA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpLYfE4uS3xsZK2P4QNjj2cnFF+Rrk3kuPKJwhW
 kachkYBNKaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaS2HxAAKCRD6PaqMvJYe
 9c5rD/9QZb6KZ49+r3tTtoz3+aAOf3OMFaxtXTSwjYnIaDi3ju2SaEUlFb6vAQBwy2Igc+UQacW
 jOAiTN+vbm6d1wb/KBzTAHhuykVG8abHpdyy+vCVMcFPdCNpSWnk2stti88MoyPG7FcQAYz2K0d
 mmK/xJqAvOjk4Ao9/3mQgrSU7wIFl7jy6+3Qvh3LpW52/jrzSx8vuED8jyqa6LAuq7msDpDWHsD
 6jyHzMf7RWye1BltpGNuuGnTW759h+A9URylvwnSD9OJHv/XO4ZyFb4IYIuUUHBi1d+UvbLX8EA
 KxEs1lsyLE5PAitTqdyQvY95PY3VFrdB/I5VSmsr/0ET3MugkZvJyoGe364SUwIT5f5UBGJAZp8
 rWqXRiZTS6jynHryN5U1RWPxIA7LdD6FYuuTtSVQD1nI5j4rZupBHtdKajVp5rHCKlwmxGD0k8V
 MhHo6gpUOXiQ3F5EqPEcoeh4zkgnKswt+KFQnWmdv6ZfptFHLUxp1yeK7w2SrD/q74zaoXs89V7
 wPt6LkuVheExGTvBYIKa3gqADUTsZsdehCgGF00ron+e5pdKVLhQfSyUcGD9vMNeDPK2WLENZ/m
 XbH7UoWxNZT3392A992qlIIXi7d96EcQ7jSs97SE3XmSasJ6sVN6DKjLSupZFdPnHYkoC9YecQ1
 a51VIo+lLqH3Flw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_041930_154063_7BD10501 
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
index abe6af8b5ac4..ce28faf7ad75 100644
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


