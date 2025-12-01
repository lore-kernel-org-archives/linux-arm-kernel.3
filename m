Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8EBD116FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OaAQemJb6KJJt7CrXqZoDzqLZRosfKzRZeSFjFBPeN8=; b=oGkfvao479ksx2L8JRzexRovdC
	Ef94llv9NcJnVroY7fceJICN9bJnFTyOzSwNtfcdxLb9rDU4Pa+R76dWxmPEZyTdr0Uq0+Ev5j2j+
	GsthSkIznDY5qhDSIhrwZkjb+HFAqNjML/alXTpebLSTeN3S5yIOSCvNkigR6WTMRGeXQcPjIKwtY
	a9rHSHH0gAL9oNVItRMKQ12tvRgaBiu59zOvkVpdwShQQo4qO7HrPVJaGsTLk+12kzEFJqAndfJqQ
	EjKl/I99jwCxgq6hmlzxjlmGzeC24zPOq37A+K7z5Q+CD8UaD1fC5JhP+Ph8/Nki0hrz3JeNrgNtf
	S1YTfiww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2sT-00000003X42-08T4;
	Mon, 01 Dec 2025 12:19:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2sN-00000003Wx6-1fJm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 12:19:32 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46112111D;
	Mon,  1 Dec 2025 13:17:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764591437;
	bh=LLJhV2LallcFwhanB+wQUXczMwB4XxYcFq1ZLrudUL0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CsXOgA2raTdsvWlup3/ee5iQ16wuTeakJkuNA/jwl0eVMU2y6Nt+AJneWnbqbAKWt
	 AxwuwTMfPCZlLQ4wcrY47Az//cfC2CY2bRbMByEcDWM2aTnMDJw2FLz0MorogcwmKD
	 YwcobUahqA+jG9yeBy8weTRQsk7ndZ+YLuHynigU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 01 Dec 2025 14:18:53 +0200
Subject: [PATCH v7 11/11] drm: xlnx: zynqmp: Add support for XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-xilinx-formats-v7-11-1e1558adfefc@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=898;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=LLJhV2LallcFwhanB+wQUXczMwB4XxYcFq1ZLrudUL0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpLYfGpcJhmLMDEtAiwjThXFIIRtc0D3p6Kkl7w
 xP2ZtTeGvyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaS2HxgAKCRD6PaqMvJYe
 9TeKD/oDij8hUrmBh4F7ueRaILMPEfgc3qUyCfuC/UPiH6K40Q5s4kvQZ2kVJvRl8f8ag8YP+dO
 CXKJUbE5Bq5Voxo4djH1UyLaqWHpOytzli8dxjqm6e4/ZPM7EAMxmUYhfOvK9FusFOIzwP94xFP
 3wISzq8iba8pIgDB/au/bKBAN22saytp1fNpjTT/0oIaEgrWaz70fej7uHacnwpre5cqYu0D+cg
 lFFeDk6bUsT1p6UgfihalcsiO4ACIs4sjjmOcGqoMmEvNwExaxhVbCCko/p2laTgHgPI0eHu4px
 VWy4I4XEEbPKFqaW6254wrO07dGbQhTSZhCO7Z263QjpjdkAZpkMcjhFOcDiamWh+2B7sZi8WQw
 JFRMdcfAgZZig+8XC4MPQl/QFQa9pA3ux51NLOaRhOPImCm7OVzHuL/x+l+iPOoQGBhjH1nIHsN
 H5x7hJ3wrU4O4038VG7WFfPwR/onCeEZeIHiVBaN003TfqGLnG3zXbMMNiV6yQbca2+5i0tnpyi
 2LMBfzETxIkP/SwDyjrv/06qkAkckfeMFpxhv+ySD0R+9n4LXEKfwmFqkDA6tShqTbeSQIFdUtZ
 5Ggi02R9hv+B0kv8NEfwsoNZxR338HXEAog/UDN3SButD1P+PtWOjbg25fxZ2gSm87bfR3ZLpCW
 gv3vqkOpx59+NZQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_041931_606614_EEB4A38B 
X-CRM114-Status: UNSURE (   8.96  )
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


