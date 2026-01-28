Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD84D46BE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiv5qIK9VKR1+5NLJfJHkMA36wyxe+yO6sm71WGYqgo=; b=LzMUXuzYrypgcymGOsZKbGGEh6
	APH/HlNMGi6Xao/A4DkLSjgFlq9FQX29vkFFeqO/n0apOsy29vP2aUXU+0Q0Xl+nwRzmO4xTHvTsN
	SAUYnFCtfkxXUZKsSA4gMuLfPLe0MI2mhN06G297mZJLpmDU9lokkC3oiunSib0Sf6/fQdrd7pII4
	HahCm+YC88DC28yQsDio09mjDvK7ptsOQEpxYZ6KehMVjfiKUI1Robmk03S3u+pqWQzErnjPtCmuE
	0ML/PgnLVC8QU3WgUewbq9gYBIDu7FFmwKngnpRuk9+EivH4tecFCPBcHeOeOaB58BsXCp27hRhPo
	a/r8KaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9J3-0000000GTQg-2Zts;
	Wed, 28 Jan 2026 17:26:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Iv-0000000GTIf-0zA6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:26:10 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 336EE22F;
	Wed, 28 Jan 2026 18:25:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769621130;
	bh=BqlrzuF9SVJTOtBOmexpRoqMva+a0mHR+U4P2a9DVlo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TzI/TV5aC+5mgOgQSfeXsBzS912kMomIeNJf0i7b30M5jAAzt1LMtc3MB9Cicr7Kq
	 +jwytMAtGmbohty5kCklPi3N7o00G5k4sXc5V6yOH1MSiOGzP6AzZZkt1u+XO0suUW
	 8EClE1+k2Nj4BOTD3b0x79ZecjS8FqnLybkRvSZY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 28 Jan 2026 19:25:33 +0200
Subject: [PATCH v8 08/11] drm: xlnx: zynqmp: Add support for XV15 & XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-xilinx-formats-v8-8-9ea8adb70269@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=BqlrzuF9SVJTOtBOmexpRoqMva+a0mHR+U4P2a9DVlo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekalk3XawtNNQQn7Vkgy4d0yJXcvtzib3wKKG
 M6Awk222xuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGpQAKCRD6PaqMvJYe
 9cgwD/4qXSnU2x+2lPDVinRQ+NEZhIy89lxXqpMcMAogA/kqbAhoY0VsPKMuKcvyFulZioAfzTN
 Nn21uQBJViiQb2ZJynb2XXM7MvEHH7SccJX3CiHtBlXlrrnLsnJUfwPsjokJZQ+sXMOu9s9qvBW
 WQG89rYIuSOeW5r+txZ2Ov2Cc774jGYPRNev4FTviOoFl5GIhipeBBvxUX5WNy5WQDTTtxTNwr0
 Mf0Y6fUA3hqOuTDtmG0hne5o8oAAG868lANlChdmwsIsmGLB2hkKD5lcQeKMDfhG7mVXedBhDQZ
 Lfe+YLuz4N0vNEMrX+RgV/p+1fppYBNLSWuKfbsOi4oej+1CsMCUSnOXaZsssK6VW5cAqE4wKE1
 EC1qP1jpuNWIn8rqPbZu8V1SFEG2NECNIvXflieqoB0N84sEBTUP/b+peHhUvITC+R7oYjeFIVT
 JeZdlt3Nv9d7mPzC2mNViSyWrCMmUe+rfHSUstpPFzlvErZvaHtgd1zYMmy3OVqRTmhkelUMtJ7
 s+2lx5zAMberDFSQxSsN3jWJP0vgr/i8o66kjltNbXYBRlu7bbhKrc60+tRzRMMu+LV8LvhleEU
 gC/xd2W5TFgxqQbrfn2Oy+twHiaXZHcWv9ZpaL2WKY7l13V411FCkx3xxKCZkYtHKHsV/ijsink
 0gtVVmtmLVzqy7Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092609_430889_BDF1E3E2 
X-CRM114-Status: UNSURE (   9.31  )
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

Add support for XV15 & XV20 formats.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index b9883ea2d03e..1dc77f2e4262 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -297,6 +297,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420,
 		.swap		= true,
 		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XV15,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XV20,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 

-- 
2.43.0


