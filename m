Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B18AC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKloT1/S//Urk+FBTMlgrixMy5D+V3gXzgQgrhOj3Ow=; b=2XlWICQvoG297O5X3tXlFlITr4
	9AuD8CRzU8jbtWyM8HNBihTCLI2qF1/dtIVvHh9ydZlu+dAN+CTsJjve+nJC+bBcLF2mxhCZD3zAJ
	yDwYFCghU4r6XfcLyJT+hFvHhi3rQBnLF05rkjHh7Dpug2xPxlrFYQRTRHrtyVZV1RvWQSPu/NapR
	18bgDIiOquRhJrJyyed3onGPNltgI2YbXJHxULIC1hT+5AGPShRc1u4M/Zf6nZDHl8IYkxke94+wE
	NBB4YF18CGn3kxL9HmYIZnQAGWA/7tCPQRyjBKCMK6o4QrOFOLpFVvzoWZmTVBOuFJRjKTUh3divX
	EYTFSP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQyU-00000008aTh-0iVf;
	Wed, 26 Mar 2025 13:39:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQj7-00000008YBS-1n6q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:23:26 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF1871934;
	Wed, 26 Mar 2025 14:21:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742995296;
	bh=n4H1G7bDwVSyN9af32Phxvop+mYwINBt64VvrVEfgwI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aNzM1Vtg24SjQ2sJTEyhHj0fPi9/oUHgRzhotAuQ2FagHu6244HzQzebUuZq5N7NI
	 NmqPngMcW2GtVzQClTBLA31x1Yy58zq1Vmi8BM1THzWTHDWrH939P+KKfKGUdOQHae
	 lvu9BKIavW/dEc6P6Hf5+OhFqY7vtfhHzgBEX7UI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:51 +0200
Subject: [PATCH v4 08/11] drm: xlnx: zynqmp: Add support for XV15 & XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-8-322a300c6d72@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=n4H1G7bDwVSyN9af32Phxvop+mYwINBt64VvrVEfgwI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//C9nW48zLc5yoHs96DcP2KozatkETh+iI3k
 sHsf2q7YkWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wgAKCRD6PaqMvJYe
 9QzSEACFG1eIBhJcW2WERjhx9t+sclrPU9jrPsfmW6Hy3GMW1qy2+p/m6DWqfyix6UPo/bSOhw8
 dIeqvx5BY7SbB9DSbkkQin9yDIbWi9XTwWpRDOkyZtM7Ufw78bchBZlTXu/F2tfQqpA/IgmDpTz
 1fBrPJUxBfDk3xI0LrH/3wlrKYmusg1arVlQt6LjQ7+TR0F+mvKSmMK1uDbq+K54RzexzdBQ+R/
 6dQI0LxArQ6HK4dLRJamSLHXTcbv/ahLCWHH8lAPjw6MVunRe7WOMLFEx0298F+b0Yddb1BrX1l
 4cx254ObM35yYoV3wvSq0RSZWPx1WHD1PKV9ObBF/nTy9DtleV0yr765ce8DXIXej+jOQxp+TOX
 IayCsjWO9S11EsA+Jh/4qUd4fR5kaUaP2oolZgmt28qbdI+iFP91XAxMAhDftDsXWwgnMALTyIW
 IZtr2WKiAKiNEwPiZgC5rkHpoYZeLfzkJbjzYciWJH6zrP4IgE0sgTeGAlfvQ9z0UfuUlHoVGRC
 9fkpu7oSFcwgNSE8FjmG9qsRTlyAP6Epi8WD/NBXtfYWNPYZjzPAFLcHAR58dh005VzGFee/dPW
 7fjdcIhOeipupxtoSYPPsVnsmJ8F2mWRqNKWVX5DMunOhNWe1vjePWEspTrr8vebH02qnpXudto
 TRzs8OZGqR/DGjw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_062325_609729_B5C84377 
X-CRM114-Status: UNSURE (   9.08  )
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


