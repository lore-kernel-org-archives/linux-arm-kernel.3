Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDC9D46BE1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zs+L2v3HlUcDq4p9j7UjWZJrUFs4aeRefsFVTEi+DqE=; b=DX0ODpDtsz9okONwX1QI/HeYMq
	Lf57+K5zfE8QjOZB9IkqTvm5+Kjj2NKm15Qt0BwnoMBc+I4Zm6tc1p3nOA0uL07sJeZiNRdW/Pg5B
	E/cI3yGjMqEk2iNFaTadx5qcBznqHjl0xy2VvfEOZ3jqyovXPPM5qL8A/3P6OZzTFL4sawv8BnIvK
	EKK4wapdRLTfv+nMI/einaxmzjy9yh3pdu6qZ5MILyaxXGsuNhkU2SH/wT/vsMQu1bg6Wh78X9s9w
	VG3svfzYr7RjhJ7snnmheLWw1d4mfdwjJFD+gX1DynJO9PFoJ2TByIlU9/MbVQlb1GUDifLU9dT6m
	l9pPbJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Je-0000000GTnZ-389L;
	Wed, 28 Jan 2026 17:26:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Iy-0000000GTKU-08xz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:26:13 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01D272E20;
	Wed, 28 Jan 2026 18:25:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769621133;
	bh=+oUF2qRpuz+LzSyFszlYyMlSIQmD/HVVsSraJ65kr0Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hm+EoL4Pu24+tyTfy8xruslPx1Ri+WPQ/JOTOC56dyeG+qxz0XVCD969IfZpxOKcN
	 IiwZCYrzOagZU+P7FLtm/4iR7fIWtQFsWfhuDAzGci6YjU2LAbeRJ5m8xrw775ejG9
	 SIys+F2t2oDjEvVUqtp1dNw9CkvD6UyZ6RlfVszM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 28 Jan 2026 19:25:36 +0200
Subject: [PATCH v8 11/11] drm: xlnx: zynqmp: Add support for XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-xilinx-formats-v8-11-9ea8adb70269@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=898;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+oUF2qRpuz+LzSyFszlYyMlSIQmD/HVVsSraJ65kr0Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekam+SKdKnF77nq/1RJT5BJN1fQbu9mCPItnz
 y9VstkS/O+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGpgAKCRD6PaqMvJYe
 9ZThEACXjLutPrz62N/7Y0jOBsEefTawu+HuIBAaLb4zIHL0x1c5NjqnwtgVXw8f3I2WW9JxmIk
 tiJf/ujq9uxPgFTeDnXjfQ/GPykYhvOU6ctujeoOoCW+BwV47CISO4Ca2T+OurlkgTAKo0zeo4D
 hSQE0apJEAKq4a+IMi/rMfM5GDcsuGXwQSyOzeFZVaCI4bSGPF4YGfMwjczcyH2zR/8QPJm9a4E
 mUm1FNLCK6y+dlxAKZFCUvIA3xKRFhN8Tfb33zSvn+U42aZVzYepUn/9wKRHrxWtYkbfjCd8bcy
 4Z/uQPMCKKYGYMP8DrowR7I+5s8RZiU/ez6YFF45qhwZoRZnBChuBYaLNFxGiS5iTGqO6kS4lDO
 63im0tIxf9S/F59By95FI8Sz9KkaSv9YKFo6Shnk2DhizU6k0nfnbGL114ezv4gOvqSuqviPThZ
 VH7nFBx9SvkgGd53W+wGSsBVyfeAXU20sXhy4m0VzXFgkj74V7AhRmrqYuhP+IZEbx40+RKeMF6
 WlIqnCE8DWtYW2hdaxqNp/MYOIdSgDMq1C4lxVFyF8fyVTKoJy/bwQS2yemmyNIFRCZijE8lfw7
 3W8Nhdosj3OvkzkCdc5wKc9LuvStx1Pw1U5ckWlZ8BnzhE6ezYmdGTUnn4m9Hq4mPiC5xQDXo13
 HgVYJ0Jeq1hSLsg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092612_235712_4CE54099 
X-CRM114-Status: UNSURE (   9.48  )
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
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 98105d1c4456..a00a57c6dcca 100644
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


