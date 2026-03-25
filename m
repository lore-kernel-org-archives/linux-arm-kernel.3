Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6E2106B53D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8zcUnluPzacILSxtJWEz6Xifh8V4ZUf2vJfmqIuhz8=; b=Ovu9Q8bbx3zlOPrDa19z+1qpwU
	ATKzHCuxlm3p6ONoosK0gBQL/AE3awcd0ZF17bvhSR1GMar7RhznZbSu2zM1xYvr0mnSkY6nYCAyu
	WUeAiv4tZTC0WzYSm7BFreACELD0+EkoEh9Dm8kAZ1wvmmmgYVe6XRJajR0DO2NiJPk7BN2HVTkwM
	ShcjRRTTS9hk21+Q5ULPhUhVsy51G3UGuH+3CegxPjgp3GTQj8rIZqDpxQoUNVf9WNdRTcDLb506k
	NnUCqh5P3fjibncmJuJ/LpBC+i8zKN4uwIl2sNnYtSroCT4hFqcmTWD0KHVleNMO+4SijRTx+muS3
	jf66PcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OoA-00000003WDJ-1Nmt;
	Wed, 25 Mar 2026 14:02:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oo5-00000003W6R-3OC2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:02:03 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5D471D4F;
	Wed, 25 Mar 2026 15:00:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774447242;
	bh=k9y+r9AQsyzLRuxOMeW3RIlvydqMMB/I8owjYfiXmrQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=baWiEuMK+KYH9fGw6m8z5ROFC/XcnacMmAOIiNe0CgVlr51VWex2fLYjP/M6y4Z+8
	 5qSYKlwakuKxIp3qD2i+s+LAiTvQ390GGjV+es2GuNkngwRo0TEl07Fh/ri+rVuLYX
	 Mp1Xd/GGaOc8b5dbWNi5zojj4sg/j9lrlIeAW3F0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 25 Mar 2026 16:01:31 +0200
Subject: [PATCH v9 08/11] drm: xlnx: zynqmp: Add support for P030 & XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-xilinx-formats-v9-8-d03b7e3752e4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=k9y+r9AQsyzLRuxOMeW3RIlvydqMMB/I8owjYfiXmrQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpw+rMMmrZiohBlBVeMEgyN8mTfhmmJmO9o2TxA
 lLPwQQDT06JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCacPqzAAKCRD6PaqMvJYe
 9R0zEACBua6RpiCI6I5z96JcFGMi7g64s/IGCSErw1ld3WRuDZtDvWityNPokRrS5kI08eYqGzz
 JoexVVE8le29K4g2Q1F/3lRSUPP8duZruhdMjh3vtk/9AKJF3qm22DJeKR4G4EebwWkvS7pDFOC
 Xe0+ZXYk4fD1ivFZeHH9yus67cMlAo2/w0MaBET0zdUVIF3HM3xYI70lY2/7Efu5DmcTLtuwPi0
 qtfDmRTR6Khobab6eiejCefSeRgLIhgMhCr3W7t3ZwTwamYxa73zwlIe6pn5TLH5i8rID5N5dbW
 tsjOFsbaABGbo4FYW1i3/YSIfUP9F+J6popx6/chl0gRbiovjqgKVO2ptajSTTDm7uhq5wzxLeF
 DcG7Af38wRqGCN0LxKB6Jq8/WLWgAWIgaIobQKgZrIxXCWHdmKBeTqsPudSQdMk/cIvuM+2TsiN
 +qX2MWqc5Ckh9YyDAhdjWtiNRP9gsCiFsqbZ8SDGhOIJsXEvtEG45tYIWQWmdpL3D/c0I7R+y7+
 Xab3inQI8VPVj5YCX0SnA2vT0d6JjUxoCIb5RGsOnMff4VIjxl0tD91zLu8eXJDbE4EoYFnBR5Q
 TX7X4GdMQOWzV/TIwyjM4HXttmSRV7ucdpwkLcoTEBMhhRpR0DB5lYjBlFmsDv7XpgTKDaBZXkF
 99YtDuZiHa2E+uQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_070202_027419_4525DF99 
X-CRM114-Status: UNSURE (   9.62  )
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

Add support for P030 & XV20 formats.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 12a8d643915f..40deca67b83b 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -297,6 +297,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420,
 		.swap		= true,
 		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_P030,
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


