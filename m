Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7E2CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 13:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiv5qIK9VKR1+5NLJfJHkMA36wyxe+yO6sm71WGYqgo=; b=1mohdcNRQnupSx8CTeWMeDqL4y
	28a/x6tEIal2ubfTxqhqemJofRiEANeYqAHd1dE88K9eKgBufz78ui6MQF2EHfnJfhL1x9nQCsV4O
	G3xZOhPVwwOEZb2FoXok7LeKwxDQFSY2epq3EYhZulnN+wUY5Rbaku2wIJXc4FnufaO1KIIBEKp5m
	f04zg0XVEqXH07zvLWzb+3HPy/mv+7Ip41XYO591qpiFcDkwAYRLTZG3kxR4a17XAG0QTkdoakrcN
	ES3Jwv93lvRZcA+P64VGEMpH7XmnL+hTkPWN8MT1eQxY5TWYvNC4cprttPavsTK5x/KWFnUohLhA+
	9D/9r4RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wnM-0000000804b-352R;
	Wed, 01 Oct 2025 13:23:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wnH-00000007zsp-2UP2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 13:22:57 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9289D180C;
	Wed,  1 Oct 2025 15:21:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759324885;
	bh=BqlrzuF9SVJTOtBOmexpRoqMva+a0mHR+U4P2a9DVlo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B5OBzdAtSXH4tuM/4M8eQP/nyhHxgBAxKnN9LfYaT5nmlcZ0nuO85AUOkbTtup7/r
	 Py07Zp3bCxU0k2GSJuNA8JYiUBsvEmJgc139K4rHXjBH21L1vnkI5FmH3fezl1cpqT
	 y8hTh7Z8ufKvWf6PHy/bBmokGGr7vEriSysRlcig=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Oct 2025 16:22:20 +0300
Subject: [PATCH v6 08/11] drm: xlnx: zynqmp: Add support for XV15 & XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-xilinx-formats-v6-8-014b076b542a@ideasonboard.com>
References: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
In-Reply-To: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBo3SsjlBsCG6t2EJC+t1j88FFLXFresjnC6b7jB
 ZgExwo3eAuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaN0rIwAKCRD6PaqMvJYe
 9WKID/9yRLmLsjiJGOt210NG9qGYGs6vsLOCMZ54xIYxjrIuzdmHGau6rb7lIgYMj+xZPBcGOhE
 sp1USHd/9gbxt4P+aLaMICzaq1OdLchZS0mI4oOYh/fHmEHaMExLLaR4MXKVmMCS2izQxmGNWfL
 Vzw/8XdwWaUvYpsXi4bVzfPFkLOGKgjkUKyRGFHFi8R+8aAyLJZd/BM8T+8jiFZLmToj5CZd6A4
 o/Bsg7b8QMjsagnF7+8na5zVeHEFfgMTwVerPz+TxmjfIiggAy0DJcy9+550V9xBe+zTiy1HJc6
 CvJHoYVy5sS3P189nItNYI1SZy5Bx7yJUwCMxXfEfYtH/CHh5zJezFeqHU4/B8pTVHx0RAfH+CP
 3g4hct8AWOWFgxd13jxATWbvjBnLRaNjBrtNeEqvaky7xQN2/6YoI08n8KqqQWOk2OUn1ksP7o9
 hhs5qPJ6nZwRn6hhskz/JVYXsNblDYzhMNms20y9MGdSHv76toYTSb2HQu2ateQUIMQXgWK5UYu
 K8Jc7CPOAzYNYScpNzvHzA2LEvEHuNBvZaGw5Y/4AXaXxn9DG6GWOldQkEezSzZFLd1cCc/vR71
 MaIDl5Eq29v4b8hmuIURNgGO+oKSEcNuDvBmetpA8Q2JxCAcZ6vxLWaw1lLxwCd2EgPK+PxqR/b
 pfhhZRLAhj3hAZQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_062255_835743_0F1FCB55 
X-CRM114-Status: UNSURE (   8.35  )
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


