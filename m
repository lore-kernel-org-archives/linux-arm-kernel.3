Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F3AC53219
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 19:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cnh9LuBe1nllVe6dn8rg7eH465Ab2ZOSgYQD7jgYRGs=; b=aS9Fhdrz3O/FHN8BcRixF+kGx+
	d5wueJNb9JRnJTyhH2wZmzwAbbrYFoQH3UTHCslNoGJnZeB5UJ+dZ/zrePTjXBYGXMmyX4FVhr9rg
	ze3wO1QSW1CstZGr1V8ze32fI5jZ4pF4RiF4q4Qs7GhQjV2oEms+mpOX7J43urF2fpJlV5hctNq6d
	glXw5aSCttCyoaBoetjQlDVsXF67jM5l+5XE9iWPIEwHAjvn9hsl+fpXRqypLjxy/h/R5KGqV51Yf
	8IieYFrERF+V7BLb+COUwTlmHks16ixJEZvMpwY6ZV4RWdMTjQpasYM2fafWVt87SDS6ICPFMsdXo
	N61OOS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4lP-00000001X3k-27YM;
	Sun, 26 Jul 2026 19:43:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4lM-00000001X2i-2zl1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 19:43:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6gU3955112
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cnh9LuBe1nllVe6dn8rg7eH465Ab2ZOSgYQD7jgYRGs=; b=FzmefLSAtCzjOw1O
	w5jZRHtTqcNmdCEbNAnp16PtSUDvWIUJC0qM8+au1Dp61p66KI8YSDV5Ip+KqE2e
	frpwLESANXukoVrYMx7134xo2jY2RrLU5q3ciQl8SjrDWLQM4OrUsT5rCjkHAd7U
	xLnteKCIZsZC1qjUg7zJlTkLTp9s1e714h2k0eaDBx/GC8loP9i835jHar9MFvKm
	r3HL6nToWnZOrJ4DhsVhlzaRfKA1c8zvypWtGnJNNGWYzWwFQOnsdTZpIG0ge/av
	lyrf87hevYx+bMwcsgWERbvaE0ntjJMyhE5J8YZT4DXlYMlVDBtkQ1n245TvOMrD
	vYF2Tg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpeebdvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:43:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso2581248a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 12:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095031; x=1785699831; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cnh9LuBe1nllVe6dn8rg7eH465Ab2ZOSgYQD7jgYRGs=;
        b=VEeQkmoPGMs5kOroNVsSUYy9a0sgOfDsQe0eBBBVu0q6w6Soip21HXqh5OTsWDqZda
         CQWsYcIP1AVHlb+jI8mU2HuJscqokM4cteZbQolhcYveZdXez1upX23twlIKom090W7H
         c/nRKiAia+Yc4MnZJQ4Ah8Dg9ndJVUbzw19uu3ys1dJWy3noG3BsiGuWWt/waowHo3Qx
         Bp2LWA/MywWPMvvUvXYNnY96qkOkPucU2X0NyrM3mptbuIKg/DOHUmoqi+yB5tjySMZg
         CcujDekV05/2wbcv2SvfHGg2nG9t17I3cVh+jkqlkwMQegFBcHzZfvshXUVjUFvdL2/t
         gDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095031; x=1785699831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cnh9LuBe1nllVe6dn8rg7eH465Ab2ZOSgYQD7jgYRGs=;
        b=BkybvwtmkTWpDWzI/bkVhlOeqoAUoD2g8v82CwWJkBCspTOdeNnmDooOQHqRyH55jL
         tXThza0bNdg+96AT0jm4bqXO9IVcV1TyJK8WyNgTPy9lus5pP0Nddai2nBfS+Ab3c/4u
         jysVm0dBGhh3tVkEsyyGjlG4OuUOiz1X0/lnxebBghPd0x53cjhp4hprocxgXFrbVR9W
         J0tcXR9z4/v7TcvubCmuj6sNCniD641dwNUgUjGxILiQ6FhU/ewTaXbyl3uajhn9S+Wl
         H3Gsz5WHkG3CHQQsLjz9JMhdg4GLKSVjDYmfKuWTDONpFETHmiyZBn/H/AO4BwnWcrDQ
         Bscw==
X-Forwarded-Encrypted: i=1; AHgh+RoIjB12IMWMFQxfBqIPr7yDo9ujRgWie/yjDAD0nnOeNgq0Qxwq+Ff3jvS+IBAyOoADh9lhA4KDwt6MXji8ZWMb@lists.infradead.org
X-Gm-Message-State: AOJu0YxnQlDvDY5nF+fE/y1s82iDWyZK8QUd4mlwyJ5m8el66MXGXp4Y
	u4f9O+sNniMYJ31f9jo49d4WqjMb1Iqm044Va7kM5SuD2tK418tJjL0s/rX+U2KqZ+4hHiNREEU
	ZlpslEXgZaD9PJ/uD3vzhs2/8ZuhnA+2+4vNpLduSTJXnpaLSt3lO6VtclNvTYmgiVYBQEsdal/
	fDkA==
X-Gm-Gg: AR+sD12s+VZWDKaZLYjIP8gby/i87LdTVdSwTXOYA7Zdi6vQHJqrglS7dIBZZJ1UIgN
	2r5BNPsy2jcMplTHYyxgOWTDNvZejzXpgfwQZRWIrJP0ZH556DSJ1v6zNZCms9KEfeujU06hqsM
	h1EBgNwV4YrxNlztNRdCdfeRkvn6Vr74M/AfSNJORW+fGaRgsOyrZL8Pht0BcGwHkj/Rrb/xWmk
	xeLWVee5/ORghodi+PoWrnl6QgJoLnBWFOO0iMjbSfVSe40F174aLVHuFa6vl5sWeRfJmI/2Vll
	SRAoSUEctV5Hc0cccIjJmu3/EuJFHWGuVBNhHgjqllFzGZ3FoBDvln7op5AX4D2ArWNnmoR1iSv
	PXB5gUmaD8sl78tif2+O/
X-Received: by 2002:a05:6a20:ce43:b0:3c3:dce5:b1a0 with SMTP id adf61e73a8af0-3c67e133c1dmr6000513637.64.1785095031119;
        Sun, 26 Jul 2026 12:43:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:ce43:b0:3c3:dce5:b1a0 with SMTP id adf61e73a8af0-3c67e133c1dmr6000492637.64.1785095030649;
        Sun, 26 Jul 2026 12:43:50 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66dcd38sm2312070a12.29.2026.07.26.12.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:43:50 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:42:33 +0800
Subject: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
In-Reply-To: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
To: Alexey Brodkin <abrodkin@synopsys.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Alex Lanzano <lanzano.alex@gmail.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Marian Cichy <m.cichy@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Ze Huang <ze.huang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095005; l=17703;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=ii7D7fVwMZnTOsCdry61t18Iyruc6rBN0buH4kXzP+A=;
 b=rMjPpwlvOZ8uxGZ3bMH3pDWt0BN6+82F2BNkMU6Kx2gIMw+MXmvUrDU5uaQuTOq5ii2IiEnoX
 /9/3teg1E6oDpDSEJoOeu7dMhff4ReKw6BEADbivI8wb7g7q1YilJ+Y
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=Jr3Bas4C c=1 sm=1 tr=0 ts=6a666378 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1bWX6k_Zg_mReU0a2YEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX0LQToNC+C9OV
 cCtPVuVCamzqYTkiCX8SkIceeeyT8dVUDrHUxQ+YU/TNmRiHr9p+eA3lrppP6zlObI56cYsXvPM
 Hw80fM/M7HNluGg3bBJTWhUQsxQv2zc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX4kzPTP9MEfW7
 NveUuuxPJUC67FptpdcGLy3LgqFisDBnHbqpKzd1Xxu6a66Pg9NwTUULbUKexJp5m8FmioZxgSR
 /vpq64nAjCTOGu0WCutBFBwheYUKwHbcnm9JFrcQpIl0ut/WXlnzAy7DxpzYTsk3RyHUZaXDK/t
 odqkXaVXifgL0c5Z09AInsV2+8jcVCms89BYMFGzlB8UB4Jdh8XFcTa2LgJkT6RqWpgSQ1cojlt
 rWMw84cfxg6bmX1mqNvrKkJKEwkhJKNRFK7eg6RORNwrHgyUFT6kcs5iKE85N5cbx64cY79SQwF
 6PlAdjKBhEhtQnDH3JEbtx1Xwy//mvGzXgex5JbNdVobg6yIRwXWLcAemB5lAg/EbIRSjWl4cHO
 51kq+Pgh/cMWO1JRscMYqd/CdXn8DH69V39RkoxpHpte/itFNfrzv9iSyCKQl6/DHgUKYHkCDWo
 8MJYXbmiS8/f4Bm1vpQ==
X-Proofpoint-ORIG-GUID: 1JE9PKhgSo32sNrPUiPSQj4JYnav3xJF
X-Proofpoint-GUID: 1JE9PKhgSo32sNrPUiPSQj4JYnav3xJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_124352_782360_D9BACA47 
X-CRM114-Status: GOOD (  19.57  )
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

Convert i.MX LCDC to explicit primary plane, CRTC and encoder objects.
Keep no-scaling plane check and GEM framebuffer prepare callback from
simple-KMS path.

Wire the vblank lifecycle explicitly with CRTC vblank callbacks and
drm_crtc_vblank_on()/drm_crtc_vblank_off(). Use the old CRTC state in the
disable path for clock unwinding so the clock reference count remains
paired with the previous active state.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 264 ++++++++++++++++++++++++++----------
 1 file changed, 190 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 81024f7d9e96..4835f01954f7 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -2,6 +2,7 @@
 // SPDX-FileCopyrightText: 2020 Marian Cichy <M.Cichy@pengutronix.de>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_damage_helper.h>
@@ -14,9 +15,9 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
@@ -102,7 +103,9 @@
 
 struct imx_lcdc {
 	struct drm_device drm;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	struct drm_connector *connector;
 	void __iomem *base;
 
@@ -135,14 +138,15 @@ static unsigned int imx_lcdc_get_format(unsigned int drm_format)
 	}
 }
 
-static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
-					 struct drm_plane_state *old_state,
+static void imx_lcdc_update_hw_registers(struct drm_crtc *crtc,
+					 struct drm_crtc_state *old_crtc_state,
+					 struct drm_crtc_state *new_crtc_state,
+					 struct drm_plane_state *new_state,
 					 bool mode_set)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_plane_state *new_state = pipe->plane.state;
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(crtc->dev);
+	const struct drm_display_mode *mode = &new_crtc_state->mode;
 	struct drm_framebuffer *fb = new_state->fb;
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
 	u32 lpcr, lvcr, lhcr;
 	u32 framesize;
 	dma_addr_t addr;
@@ -155,24 +159,24 @@ static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
 		return;
 
 	/* Disable PER clock to make register write possible */
-	if (old_state && old_state->crtc && old_state->crtc->enabled)
+	if (old_crtc_state && old_crtc_state->enable)
 		clk_disable_unprepare(lcdc->clk_per);
 
 	/* Framesize */
-	framesize = FIELD_PREP(IMX21LCDC_LSR_XMAX, crtc->mode.hdisplay >> 4) |
-		FIELD_PREP(IMX21LCDC_LSR_YMAX, crtc->mode.vdisplay);
+	framesize = FIELD_PREP(IMX21LCDC_LSR_XMAX, mode->hdisplay >> 4) |
+		FIELD_PREP(IMX21LCDC_LSR_YMAX, mode->vdisplay);
 	writel(framesize, lcdc->base + IMX21LCDC_LSR);
 
 	/* HSYNC */
-	lhcr = FIELD_PREP(IMX21LCDC_LHCR_HFPORCH, crtc->mode.hsync_start - crtc->mode.hdisplay - 1) |
-		FIELD_PREP(IMX21LCDC_LHCR_HWIDTH, crtc->mode.hsync_end - crtc->mode.hsync_start - 1) |
-		FIELD_PREP(IMX21LCDC_LHCR_HBPORCH, crtc->mode.htotal - crtc->mode.hsync_end - 3);
+	lhcr = FIELD_PREP(IMX21LCDC_LHCR_HFPORCH, mode->hsync_start - mode->hdisplay - 1) |
+		FIELD_PREP(IMX21LCDC_LHCR_HWIDTH, mode->hsync_end - mode->hsync_start - 1) |
+		FIELD_PREP(IMX21LCDC_LHCR_HBPORCH, mode->htotal - mode->hsync_end - 3);
 	writel(lhcr, lcdc->base + IMX21LCDC_LHCR);
 
 	/* VSYNC */
-	lvcr = FIELD_PREP(IMX21LCDC_LVCR_VFPORCH, crtc->mode.vsync_start - crtc->mode.vdisplay) |
-		FIELD_PREP(IMX21LCDC_LVCR_VWIDTH, crtc->mode.vsync_end - crtc->mode.vsync_start) |
-		FIELD_PREP(IMX21LCDC_LVCR_VBPORCH, crtc->mode.vtotal - crtc->mode.vsync_end);
+	lvcr = FIELD_PREP(IMX21LCDC_LVCR_VFPORCH, mode->vsync_start - mode->vdisplay) |
+		FIELD_PREP(IMX21LCDC_LVCR_VWIDTH, mode->vsync_end - mode->vsync_start) |
+		FIELD_PREP(IMX21LCDC_LVCR_VBPORCH, mode->vtotal - mode->vsync_end);
 	writel(lvcr, lcdc->base + IMX21LCDC_LVCR);
 
 	lpcr = readl(lcdc->base + IMX21LCDC_LPCR);
@@ -184,19 +188,20 @@ static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
 	writel(new_state->fb->pitches[0] / 4, lcdc->base + IMX21LCDC_LVPWR);
 
 	/* Enable PER clock */
-	if (new_state->crtc->enabled)
+	if (new_crtc_state->enable)
 		clk_prepare_enable(lcdc->clk_per);
 }
 
-static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
-				 struct drm_crtc_state *crtc_state,
-				 struct drm_plane_state *plane_state)
+static void imx_lcdc_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
 	int ret;
 	int clk_div;
 	int bpp;
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
-	struct drm_display_mode *mode = &pipe->crtc.mode;
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(crtc->dev);
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, &lcdc->plane);
+	struct drm_display_mode *mode = &cstate->mode;
 	struct drm_display_info *disp_info = &lcdc->connector->display_info;
 	const int hsync_pol = (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : 1;
 	const int vsync_pol = (mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : 1;
@@ -207,7 +212,7 @@ static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	clk_div = DIV_ROUND_CLOSEST_ULL(clk_get_rate(lcdc->clk_per),
 					mode->clock * 1000);
-	bpp = imx_lcdc_get_format(plane_state->fb->format->format);
+	bpp = imx_lcdc_get_format(pstate->fb->format->format);
 
 	writel(FIELD_PREP(IMX21LCDC_LPCR_PCD, clk_div - 1) |
 	       FIELD_PREP(IMX21LCDC_LPCR_LPPOL, hsync_pol) |
@@ -231,40 +236,46 @@ static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	ret = clk_prepare_enable(lcdc->clk_ipg);
 	if (ret) {
-		dev_err(pipe->crtc.dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret));
+		dev_err(crtc->dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret));
 		return;
 	}
 	ret = clk_prepare_enable(lcdc->clk_ahb);
 	if (ret) {
-		dev_err(pipe->crtc.dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret));
+		dev_err(crtc->dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret));
 
 		clk_disable_unprepare(lcdc->clk_ipg);
 
 		return;
 	}
 
-	imx_lcdc_update_hw_registers(pipe, NULL, true);
+	imx_lcdc_update_hw_registers(crtc, NULL, cstate, pstate, true);
 
 	/* Enable VBLANK Interrupt */
 	writel(INTR_EOF, lcdc->base + IMX21LCDC_LIER);
+
+	drm_crtc_vblank_on(crtc);
 }
 
-static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void imx_lcdc_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+						struct drm_atomic_commit *commit)
 {
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
-	struct drm_crtc *crtc = &lcdc->pipe.crtc;
+	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(commit, crtc);
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(crtc->dev);
 	struct drm_pending_vblank_event *event;
 
+	drm_crtc_vblank_off(crtc);
+
 	clk_disable_unprepare(lcdc->clk_ahb);
 	clk_disable_unprepare(lcdc->clk_ipg);
 
-	if (pipe->crtc.enabled)
+	if (old_crtc_state->enable)
 		clk_disable_unprepare(lcdc->clk_per);
 
 	spin_lock_irq(&lcdc->drm.event_lock);
-	event = crtc->state->event;
+	event = new_crtc_state->event;
 	if (event) {
-		crtc->state->event = NULL;
+		new_crtc_state->event = NULL;
 		drm_crtc_send_vblank_event(crtc, event);
 	}
 	spin_unlock_irq(&lcdc->drm.event_lock);
@@ -273,66 +284,151 @@ static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
 	writel(0, lcdc->base + IMX21LCDC_LIER);
 }
 
-static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
-			       struct drm_plane_state *plane_state,
-			       struct drm_crtc_state *crtc_state)
+static int imx_lcdc_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *commit)
 {
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(commit, crtc);
 	const struct drm_display_mode *mode = &crtc_state->mode;
-	const struct drm_display_mode *old_mode = &pipe->crtc.state->mode;
+	const struct drm_display_mode *old_mode = &old_crtc_state->mode;
+	int ret;
 
-	if (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES ||
-	    mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES ||
-	    mode->hdisplay % 0x10) { /* must be multiple of 16 */
-		drm_err(pipe->crtc.dev, "unsupported display mode (%u x %u)\n",
+	if (crtc_state->enable) {
+		ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+		if (ret)
+			return ret;
+	}
+
+	if (crtc_state->enable &&
+	    (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES ||
+	     mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES ||
+	     mode->hdisplay % 0x10)) { /* must be multiple of 16 */
+		drm_err(crtc->dev, "unsupported display mode (%u x %u)\n",
 			mode->hdisplay, mode->vdisplay);
 		return -EINVAL;
 	}
 
-	crtc_state->mode_changed =
-		old_mode->hdisplay != mode->hdisplay ||
-		old_mode->vdisplay != mode->vdisplay;
+	if (old_mode->hdisplay != mode->hdisplay ||
+	    old_mode->vdisplay != mode->vdisplay)
+		crtc_state->mode_changed = true;
 
-	return 0;
+	return drm_atomic_add_affected_planes(commit, crtc);
 }
 
-static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
-				 struct drm_plane_state *old_state)
+static void imx_lcdc_plane_helper_atomic_update(struct drm_plane *plane,
+						struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_pending_vblank_event *event = crtc->state->event;
-	struct drm_plane_state *new_state = pipe->plane.state;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc *crtc = new_state->crtc;
+	struct drm_crtc_state *old_crtc_state = NULL;
+	struct drm_crtc_state *new_crtc_state;
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_framebuffer *old_fb = old_state->fb;
 	struct drm_crtc *old_crtc = old_state->crtc;
 	bool mode_changed = false;
 
+	if (!fb || !crtc)
+		return;
+
+	if (old_crtc)
+		old_crtc_state = drm_atomic_get_old_crtc_state(commit, old_crtc);
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	if (!new_crtc_state)
+		return;
+
 	if (old_fb && old_fb->format != fb->format)
 		mode_changed = true;
 	else if (old_crtc != crtc)
 		mode_changed = true;
 
-	if (!drm_atomic_crtc_needs_modeset(crtc->state))
-		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
+	if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
+		imx_lcdc_update_hw_registers(crtc, old_crtc_state, new_crtc_state,
+					     new_state, mode_changed);
+}
 
-	if (event) {
-		crtc->state->event = NULL;
+static int imx_lcdc_plane_helper_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_commit *commit)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc_state *crtc_state = NULL;
+
+	if (plane_state->crtc) {
+		crtc_state = drm_atomic_get_crtc_state(commit, plane_state->crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+	}
 
-		spin_lock_irq(&crtc->dev->event_lock);
+	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
 
-		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0)
-			drm_crtc_arm_vblank_event(crtc, event);
-		else
-			drm_crtc_send_vblank_event(crtc, event);
+static const struct drm_plane_helper_funcs imx_lcdc_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= imx_lcdc_plane_helper_atomic_check,
+	.atomic_update	= imx_lcdc_plane_helper_atomic_update,
+};
 
-		spin_unlock_irq(&crtc->dev->event_lock);
-	}
+static const struct drm_plane_funcs imx_lcdc_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static void imx_lcdc_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *commit)
+{
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_pending_vblank_event *event = new_crtc_state->event;
+
+	if (!event)
+		return;
+
+	new_crtc_state->event = NULL;
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (new_crtc_state->active && drm_crtc_vblank_get(crtc) == 0)
+		drm_crtc_arm_vblank_event(crtc, event);
+	else
+		drm_crtc_send_vblank_event(crtc, event);
+	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
-static const struct drm_simple_display_pipe_funcs imx_lcdc_pipe_funcs = {
-	.enable = imx_lcdc_pipe_enable,
-	.disable = imx_lcdc_pipe_disable,
-	.check = imx_lcdc_pipe_check,
-	.update = imx_lcdc_pipe_update,
+static const struct drm_crtc_helper_funcs imx_lcdc_crtc_helper_funcs = {
+	.atomic_check	= imx_lcdc_crtc_helper_atomic_check,
+	.atomic_enable	= imx_lcdc_crtc_helper_atomic_enable,
+	.atomic_disable	= imx_lcdc_crtc_helper_atomic_disable,
+	.atomic_flush	= imx_lcdc_crtc_helper_atomic_flush,
+};
+
+static int imx_lcdc_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	return 0;
+}
+
+static void imx_lcdc_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+}
+
+static const struct drm_crtc_funcs imx_lcdc_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= imx_lcdc_crtc_enable_vblank,
+	.disable_vblank		= imx_lcdc_crtc_disable_vblank,
+};
+
+static const struct drm_encoder_funcs imx_lcdc_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static const struct drm_mode_config_funcs imx_lcdc_mode_config_funcs = {
@@ -370,7 +466,7 @@ MODULE_DEVICE_TABLE(of, imx_lcdc_of_dev_id);
 static irqreturn_t imx_lcdc_irq_handler(int irq, void *arg)
 {
 	struct imx_lcdc *lcdc = arg;
-	struct drm_crtc *crtc = &lcdc->pipe.crtc;
+	struct drm_crtc *crtc = &lcdc->crtc;
 	unsigned int status;
 
 	status = readl(lcdc->base + IMX21LCDC_LISR);
@@ -388,6 +484,9 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 	struct imx_lcdc *lcdc;
 	struct drm_device *drm;
 	struct drm_bridge *bridge;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
 	int irq;
 	int ret;
 	struct device *dev = &pdev->dev;
@@ -429,23 +528,40 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Cannot initialize mode configuration structure\n");
 
-	/* CRTC, Plane, Encoder */
-	ret = drm_simple_display_pipe_init(drm, &lcdc->pipe,
-					   &imx_lcdc_pipe_funcs,
-					   imx_lcdc_formats,
-					   ARRAY_SIZE(imx_lcdc_formats), NULL, NULL);
+	plane = &lcdc->plane;
+	ret = drm_universal_plane_init(drm, plane, 0,
+				       &imx_lcdc_plane_funcs,
+				       imx_lcdc_formats,
+				       ARRAY_SIZE(imx_lcdc_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret < 0)
+		return dev_err_probe(drm->dev, ret, "Cannot initialize primary plane\n");
+	drm_plane_helper_add(plane, &imx_lcdc_plane_helper_funcs);
+
+	crtc = &lcdc->crtc;
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
+					&imx_lcdc_crtc_funcs, NULL);
+	if (ret < 0)
+		return dev_err_probe(drm->dev, ret, "Cannot initialize CRTC\n");
+	drm_crtc_helper_add(crtc, &imx_lcdc_crtc_helper_funcs);
+
+	encoder = &lcdc->encoder;
+	ret = drm_encoder_init(drm, encoder, &imx_lcdc_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0)
-		return dev_err_probe(drm->dev, ret, "Cannot setup simple display pipe\n");
+		return dev_err_probe(drm->dev, ret, "Cannot initialize encoder\n");
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
 	if (ret < 0)
 		return dev_err_probe(drm->dev, ret, "Failed to initialize vblank\n");
 
-	ret = drm_bridge_attach(&lcdc->pipe.encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return dev_err_probe(drm->dev, ret, "Cannot attach bridge\n");
 
-	lcdc->connector = drm_bridge_connector_init(drm, &lcdc->pipe.encoder);
+	lcdc->connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(lcdc->connector))
 		return dev_err_probe(drm->dev, PTR_ERR(lcdc->connector), "Cannot init bridge connector\n");
 

-- 
2.43.0


