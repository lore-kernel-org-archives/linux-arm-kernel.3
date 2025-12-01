Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A29DD116F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiv5qIK9VKR1+5NLJfJHkMA36wyxe+yO6sm71WGYqgo=; b=pYm0hTARHerEBxWwZPEdaWeova
	CsK5ARceF4mfqnM/JYGciMIDn2D6FBQDExZpwBKBuEtO4EfRDdY4ptX+tZG7lYLjVhinkk0h4QfLP
	7ZAr8K+v/7ju7nSzNQRD4lW98POIeNUQqeBCsNKZsSrQoxj/J+QkGYUr9bDre79P7Fl77acP5KZFi
	bbh5zufGWtgu6E1XeGbADY0m6JErVTcQIvRyrbzi5yXSjs1ksoLYgUH8L6/QX5P0ZS/dDUoXfHPXy
	VyZliWCgLAkcu2FFG9UBLcEsSYQ+Sizwz7AICwpgIeOFEIgN8CJlWoG9a8wviE9bjtFJEqTN0h51Y
	VEPQWAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2sQ-00000003X1F-0yq3;
	Mon, 01 Dec 2025 12:19:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2sM-00000003Ww1-0SGw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 12:19:31 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BEEB1E2F;
	Mon,  1 Dec 2025 13:17:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764591434;
	bh=BqlrzuF9SVJTOtBOmexpRoqMva+a0mHR+U4P2a9DVlo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m0e8QnPD7REu4xoj75wIkFyVWzbym24RSsQlREbnfVON/YHwUC0rTga04FVuRSNoz
	 ABxFHoeFGsLk5MBlLh5rUNs2qW2fyyQLnk/RAYxb+B3+hRlUQQX3pVi+YcI3QPW2/L
	 twgnTp8zJ2TqP1Xih7Tu9fWimJNxGZWH6HO3ojPI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 01 Dec 2025 14:18:50 +0200
Subject: [PATCH v7 08/11] drm: xlnx: zynqmp: Add support for XV15 & XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-xilinx-formats-v7-8-1e1558adfefc@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=BqlrzuF9SVJTOtBOmexpRoqMva+a0mHR+U4P2a9DVlo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpLYfFwrt5/gzH5MM55abiHE5BtW3y0F2PH7NCn
 ShM9e7J88KJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaS2HxQAKCRD6PaqMvJYe
 9WptD/42n7d9GhmtGI3R7Dd0ENEX/gu5k/f/okNSKqZ8tTURHLAJR/9qAwri2NZkykpbSRb9sGm
 /ze/egv7DAgC9zLoyVtOX5gqnfoa1HGScQdRQuV+V74XnXJXAel3xvzy+O3j7HmZo8O6KLGDQ4Y
 0ETuh2A+M3MwCxXcFtFHCDzAoFIBz0YpjoWYf9uRv5vBrIMmwUp0FnZhXupBnjlXxph2rQeNCz9
 ZvVPkKoePMKTZa4ZeBElv09dhF3vsPDT+G3VYUvPkCGNf5E8CJ60JYARfcEhT3xH0Sskv9tE0B+
 AyRdVAcUuVNDdUjWyv0MHpVzoQ5Cps3eL7HHHdAk3IFAFxqjBfS17bpMNpRuXflIi7L9mlDjNdZ
 FWfEtG1ZiqaTg4GgpusjNIRa7dNpIHaIqGtnY1qZVr4ZDLhWhLmemD0fc5S7bnWl/RzHHaF+u3t
 neqGfmO4r36HMuhI4hvOGCHiRnSIyM/+a4uO+hJR8Lbc9yQdqB+QCOPICPaeOvN47xAr7SUzjHd
 O4fV/o+vDWK38ag+I2UWDRZU9ZmyW0CcSs0SKNSIHWRxnFruJZRCI2KZSCJA0mzr+hfMV7Sqpy7
 JLfwZ2KXj5QJWYEpaaE48jPIC8f8DqsZ19pGPNHQd6vSkfkdQPYgMpf3CtBiDBGsaOGNmKbqZno
 ktXEGFjt2xsuBew==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_041930_297658_ADB68425 
X-CRM114-Status: UNSURE (   8.79  )
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


