Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D926C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=il6l3k0+dgD2R2BRxeUEIQUC6Trb9UQJXmQcv498G/I=; b=mHhEe0UGn80Evr9B1NHvr6U2oD
	GL6QsEFoZJblp10wlYwTL5jY5DBkNX8K6gZk8Il/qS7dzRdaONqR5hy69Kt20tVCRILJeufPPZyma
	cXFZvVt7O/YaUnAGXlaKKHY2u5Vs8407KtHiEPsHmM5pZO0OVi8ocojFVhxS5PR9+V82OQR3+PO3P
	rtfM2eUYGWhf//7tpjA5VxGCBm3zjLIIqnUjtn56w4QudNPGd6TGuYuxF/P5ybQrE+2MEhVSbBEvC
	Ki8Og0hVsAFxfnNBKnS3JEGjFON1tJvNbD0Nd70ruVogHj3RQXTKQW3K+UoDMGXZV1C7OSVXrcDnr
	e5TVjROg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ISN-0000000HADD-1Kz1;
	Fri, 25 Apr 2025 12:47:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Gok-0000000Gr9b-1FeE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:02:03 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EADC9122C;
	Fri, 25 Apr 2025 13:01:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745578918;
	bh=umPZaDsg5uyoYpXd0vVmqROXAQICx0jSw2Uz52BcwI4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IBN0gKIVaXKU0YVNHxyNWnYK2NxrrtjP1QK2/VCULi2THqaWRLGfxiF1EU9WkDnKn
	 HWuqLyn4nVNEPJbv7LcqbZX2zp+yUim0/CTXWT/hKeB+yY25igsGYWDds/M8gsdf6I
	 4JyUlvyEps1aD8dOIVN8+dQ1SjrtPl18RD8e5zvY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:31 +0300
Subject: [PATCH v5 11/11] drm: xlnx: zynqmp: Add support for XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-11-c74263231630@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=848;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=umPZaDsg5uyoYpXd0vVmqROXAQICx0jSw2Uz52BcwI4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2udA4dfbG3QN9DCmOMTbyod1RCs6z7QUm/k+
 O+S0UBcMSmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrnQAKCRD6PaqMvJYe
 9UQ/EACp+r42VR3lFkCS5/8ec6tOljoXhYM8kv/4xGJjUR4Lj/bvJBP6qd4HZVs6uUQiF8mOCJr
 ti4x7a7KiuXOhqzkfllcXXflFbg90rekkxIHq32156hcahEdeDq4U51mMaOe+BK/mXycsjP5q4J
 3sdpGkahFqP1rPAKnbsaAJLDf+ri1vpdc9a9JQXUQpbmvb+PH/kkStAWjxu/+j5Cc4W32G946bd
 ODmbDkqyMkO6RMvm/8py+NXjcKnaI4r0dqzBJr0YZqoPplGfXNT8IKxIpYdAPhb006MTM6VIehJ
 T8rwqCEPozFceLWHwoeXeTkdOQj3cNUC8GpqNBlcKdYraGvHL61luAicYeyo2sHjqbU8zvXA70J
 3jD1gIOAnOxJV0Y/qPPixYKk8YD2GJHNliPMoIhFCG4Fl4joqsCJbT87x8cfE/PE6d6FeO6xldz
 Aev4S/5CvgRi69tRj3lz7W0w5ifzjar/6kuM25qQf290hg2CUVtWvNv68DC6/p2jj17cVnIbW7R
 7HkEf4/swM8qE9yDW3uIS7HGMPDaC4J26oVdgsSZpx8AtcMaPpnw4Wi+TQIm9bsEngEXCuas5I4
 j04jTnKC3zP+CR78eVqNgm+tIsyXSl2Yukk62ihrM3jacV2MTeV+zVppmapPn2QkueOZHMR55EG
 260SO33d05vwWhQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_040202_478168_BC9BA377 
X-CRM114-Status: UNSURE (   8.08  )
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

Add support for XVUY2101010 format.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index b7cc7a7581ad..f548f375750e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -322,6 +322,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XVUY2101010,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YUV444_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 

-- 
2.43.0


