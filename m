Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED29C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApcboK/JyDyu8RnkzQth/Hg0oAf+ZNp6nWpZOQfTeY8=; b=N8dGh1ZffwKq0KpPM/YGZFsiK1
	44lk12yMnDlqKWaWEoI4NPEz5KLwUWEzKAcdQOV6Yx+OyXRSzS9/5sEijPWnLEU0lQxkLV8M99G44
	yMU0zf0nFfbAhZ0l5h8ACBUt2u+qLbMvissO/h8rnectenaeziMFsvDTBN6ycPgqzhINzyinm7QNU
	NwR1Wcz9Ul+9VlFoUJXl12C/E/JynvZfKvAkSLh5kVJ6R4o0LmWFfazv/76mvmHeh/Q7yZplTMOgL
	BlBtiP+XKyywnsh9ZVwwJfCuciXJRVW+GS3NZYIAzVPl1czVjsaWzKadiXK6POk3z0ONLE0uM9xvN
	axbJizNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wa5-0000000GQ69-12Z9;
	Sat, 19 Sep 2026 15:02:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wZz-0000000GQ3n-3LTr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 15:02:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JDJgJC2462666
	for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 15:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ApcboK/JyDyu8RnkzQth/Hg0oAf+ZNp6nWpZOQfTeY8=; b=HuG6hRTPvm/eAnHo
	ncZ5TYDbB0oFtiKFunOXuhj5+OgVh3Yx7lTGgqdEJ1i9pPPK71FmVaOCwEHmshlE
	t5zLWcMFDmGfKEQmFuirqjWgr9RQmMm6+2HKAuJ3aEt3ZW6g58HU1EX5IyPkFPdL
	JYCTZ19c2ImfxqJPwgV/lE2Dy6QHo0p1BH0Tz//J5b4/f1tj2JCc/3CPMbXkg7Wz
	WBbjnIsk5TgAwUxGZuLHhWFu03BUvlB9UyEzJ1ROuy+PMtU0JK6KYEAnxI3RiudF
	ft90tfqlLq6TktTH4ewnDKy1YFxbjD8duqTlwocQbLHgKMzOS+c/i20CDQ2a+HiF
	rFwFQA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk0yvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 15:02:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so2425409a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 08:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789830134; x=1790434934; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApcboK/JyDyu8RnkzQth/Hg0oAf+ZNp6nWpZOQfTeY8=;
        b=aH5vSOXcrqSm8y3EltfeB05wCo+uBu/iArpiq0uGYyvafIcAwDov3CjDhJuwnTap2t
         Ov2PQqRZojPq9hcRAQRHLftisDDbDaYGCrai1s9O+5ZA+bOyg/Y90acSGOu7oOlKn/AI
         nLcEBqn+AbKSYhUbsCrSrOOl7w35lKNzBkTS8VjwVqr07Ob0o28YHQ8cQXJfE9e6A3jq
         oTwg7x2VT8j7bY+7BZe0gYQAi00yd0kyCcwwlNoC32G/+aueyXU/WrDkIJ9ZosMzvNkK
         OEOEleBAX12XC0LdIjX6uChmJ6eIYR0vWbogTxY9LDfrW6Z4S24v1un4ydQYdFzxz0UB
         vgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789830134; x=1790434934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ApcboK/JyDyu8RnkzQth/Hg0oAf+ZNp6nWpZOQfTeY8=;
        b=wT1Ie7o/Ji8u3kWz03gZrQvcGBZPnBhNfaWBTZ/NO6vKEnwTGj9FDNztYdrSz0lvV4
         vgckulqPuT4i7Xdp7wQzPvp8BpcYuc4L8sn7P0mds+2kVP9XuntVRUqI7bz/ptM5ayaB
         kP4eP2P/MYws9Wjfa/PddIs3+giAEjEkksZhfDD/1PWiDJ7Tqy319uUUbhYadmBTkQ0a
         i0QlqkVygYToKOl6nSayD5DDl6sj96LyEW0CcNDwDLC33oyvGLR0rlRxE7B/1FVhfOqJ
         7sRpn1p1zGkoOgRRpU5ikiHBTFx2KfIc4xJ5+S2psBOMGmK5gvx8U+EHVZ9+Z0l+yTvX
         FLQg==
X-Forwarded-Encrypted: i=1; AKwUvBydXvGvnEdKIqSt5OFNRmXd8AHMjc3vhUSVRp26HFudWuI9nPA/mKQGZpC7sEao22NYIdhI6+SM2Qgl4xnRMBBU@lists.infradead.org
X-Gm-Message-State: AFuF++nNDuUHzLmElXc2IHERbtN+aoGGo2KOXQmkrmjh7TKE7+t4RSeO
	w4Nwd96vRyF2nWcj/oojftpozl9f2johBkrKcD0JA7+43cHb4wCXJtNcesqp7x+cBPP6KB2nY0s
	cUX5T+FoK2PKY9m/ekk1QVrLifjlGWE6sWC+mp5eXrQsfH+5TtOjRpN+bzLIHwAod/n31+7tjKb
	wrleHzPYrc4Ne8b9w=
X-Gm-Gg: AYBFou0s6k2pMxLpPJz7l1Tmzlj31nnAtTcMDF/Md9zj/ovu2QdsIy4/4PGwUDw27Z+
	azP0resRhCr8KCKpVGk+XWlqoQ3a5W0VS7Zwmuk4YW+wgHPIU2ld17I7hfI98BibKx+IGYXFHK/
	Owv0eiLrMkZg/VkSVEG6neczQ35pH3wyIY6fpJa4G17n+ex2rDCdDfhz6SPpaxoJVwy579KCBFL
	w8ktaZ/k42xtkwR2oKmIlYfC6isRi2M4jBLTNEurTaCS7Q74OBNMIsC3qYlhWsBYzkLhBT90MT3
	YWmPvXV/8hRZHhEKfiLOZmF+bbG8FRnejPxi9yMpMkSzB5GK88/a7uPYFnHFkoNqM7KBGR08aCY
	NKRbMY9PiV0Vo
X-Received: by 2002:a17:90a:c105:b0:39e:4c80:f67e with SMTP id 98e67ed59e1d1-39e54f11f69mr11429968a91.29.1789830134240;
        Sat, 19 Sep 2026 08:02:14 -0700 (PDT)
X-Received: by 2002:a17:90a:c105:b0:39e:4c80:f67e with SMTP id 98e67ed59e1d1-39e54f11f69mr11429924a91.29.1789830133638;
        Sat, 19 Sep 2026 08:02:13 -0700 (PDT)
Received: from [192.168.19.100] ([155.117.96.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb400c3sm5045206a91.17.2026.09.19.08.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 08:02:12 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 22:59:36 +0800
Subject: [PATCH v4 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-b4-imx-simple-kms-v4-v4-2-53b1fdf4589e@oss.qualcomm.com>
References: <20260919-b4-imx-simple-kms-v4-v4-0-53b1fdf4589e@oss.qualcomm.com>
In-Reply-To: <20260919-b4-imx-simple-kms-v4-v4-0-53b1fdf4589e@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Marian Cichy <m.cichy@pengutronix.de>
Cc: Ze Huang <ze.huang@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789830097; l=17787;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=pOtGN4NAM2Pa9oG3fvR+BXhbi8ugcuMrSFS+xT05hNM=;
 b=kDGPvzc4fTZu4iH9tIYM7MZ15Z10BWeDytdI4d9vmfm8icNoORgt3w7/lVHHzopVWGadFqXAg
 3ZWhv/YPkJLBOg77iYBILKBKXXhODRVl4qz3M9QIaQPd+AtQsv/9DJT
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aaea3f7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1bWX6k_Zg_mReU0a2YEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDIxOCBTYWx0ZWRfX5u3iJ40NSwGQ
 gM1/C5UrQSa+sdW2wdjEXF8Ni8zyO0WIoQcc7gtiQ3Ujg30SNB1FqnQsntvQcOJC30w98ThEmNk
 QsTbIhlXG4uF2XDw0NSb/BlSru5izNT37SC6/XjiT3nstI4LCPA8rOwbt2SbRHqlYicvNYhdmOO
 bZ3nPENHLIOTHzstyQSw+6kMIf/9o91rQVwvceoZYlcNmrlTPodR/HwPSGrylX+3KkpXG5qP0Ck
 2OhduUz42sFljKFVxZemZcC3/lCgmKz8Yc2QrIYkR9t+Ckade7iazCN41DSjlYKQA00P4aiJajY
 WAdU0DVD65c44vO0kztBOaYpZB6n4AjKwP9i9nJY1Gi8gDjZFBUdT0Ci3EjjANh4MQLTrU/MMCM
 d1XOr+IV8NF0mehblGxobaXOcEH7djnb+h+zuC0s5yNEmGdSWB5JUVwc8jOkQ2iWC1T2Brnw2hh
 hH3i8q3X3WKjHu8vWnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDIxOCBTYWx0ZWRfXw/clvfJfasvO
 4SAJJ2kteR2OO0JcdQ5Y4k7a21ewn51RgAXTC0rMMAfbllWD+X9eZ/uewbbcdemhHbKbUJlWxjF
 bVvhqFHQ6g3ZtjpqMS1ykzSOZCli63U=
X-Proofpoint-ORIG-GUID: FdrlVh_TP3z1gOzMiOp0zGP_RGji_WMm
X-Proofpoint-GUID: FdrlVh_TP3z1gOzMiOp0zGP_RGji_WMm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_080215_862157_0BC594B1 
X-CRM114-Status: GOOD (  20.40  )
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
drm_crtc_vblank_on()/drm_crtc_vblank_off(). Use the old CRTC state in
the disable path for clock unwinding so the clock reference count
remains paired with the previous active state.

Use the atomic_create_state helpers with
drm_mode_config_create_initial_state() in probe, and
drm_crtc_vblank_atomic_flush() for the flush callback.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 250 +++++++++++++++++++++++++-----------
 1 file changed, 175 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index e00e52c1c46e..8f0a0d4cf61a 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -2,6 +2,7 @@
 // SPDX-FileCopyrightText: 2020 Marian Cichy <M.Cichy@pengutronix.de>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_damage_helper.h>
@@ -14,10 +15,11 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_vblank_helper.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
@@ -101,7 +103,9 @@
 
 struct imx_lcdc {
 	struct drm_device drm;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	struct drm_connector *connector;
 	void __iomem *base;
 
@@ -134,14 +138,15 @@ static unsigned int imx_lcdc_get_format(unsigned int drm_format)
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
@@ -154,24 +159,24 @@ static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
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
@@ -183,19 +188,20 @@ static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
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
@@ -206,7 +212,7 @@ static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	clk_div = DIV_ROUND_CLOSEST_ULL(clk_get_rate(lcdc->clk_per),
 					mode->clock * 1000);
-	bpp = imx_lcdc_get_format(plane_state->fb->format->format);
+	bpp = imx_lcdc_get_format(pstate->fb->format->format);
 
 	writel(FIELD_PREP(IMX21LCDC_LPCR_PCD, clk_div - 1) |
 	       FIELD_PREP(IMX21LCDC_LPCR_LPPOL, hsync_pol) |
@@ -230,40 +236,46 @@ static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
 
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
@@ -272,66 +284,132 @@ static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
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
+
+	if (crtc_state->enable) {
+		ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+		if (ret)
+			return ret;
+	}
 
-	if (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES ||
-	    mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES ||
-	    mode->hdisplay % 0x10) { /* must be multiple of 16 */
-		drm_err(pipe->crtc.dev, "unsupported display mode (%u x %u)\n",
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
 
-		spin_lock_irq(&crtc->dev->event_lock);
+	if (plane_state->crtc) {
+		crtc_state = drm_atomic_get_crtc_state(commit, plane_state->crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+	}
 
-		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0)
-			drm_crtc_arm_vblank_event(crtc, event);
-		else
-			drm_crtc_send_vblank_event(crtc, event);
+	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
 
-		spin_unlock_irq(&crtc->dev->event_lock);
-	}
+static const struct drm_plane_helper_funcs imx_lcdc_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= imx_lcdc_plane_helper_atomic_check,
+	.atomic_update	= imx_lcdc_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs imx_lcdc_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.atomic_create_state	= drm_atomic_helper_plane_create_state,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static const struct drm_crtc_helper_funcs imx_lcdc_crtc_helper_funcs = {
+	.atomic_check	= imx_lcdc_crtc_helper_atomic_check,
+	.atomic_enable	= imx_lcdc_crtc_helper_atomic_enable,
+	.atomic_disable	= imx_lcdc_crtc_helper_atomic_disable,
+	.atomic_flush	= drm_crtc_vblank_atomic_flush,
+};
+
+static int imx_lcdc_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	return 0;
 }
 
-static const struct drm_simple_display_pipe_funcs imx_lcdc_pipe_funcs = {
-	.enable = imx_lcdc_pipe_enable,
-	.disable = imx_lcdc_pipe_disable,
-	.check = imx_lcdc_pipe_check,
-	.update = imx_lcdc_pipe_update,
+static void imx_lcdc_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+}
+
+static const struct drm_crtc_funcs imx_lcdc_crtc_funcs = {
+	.atomic_create_state	= drm_atomic_helper_crtc_create_state,
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
@@ -369,7 +447,7 @@ MODULE_DEVICE_TABLE(of, imx_lcdc_of_dev_id);
 static irqreturn_t imx_lcdc_irq_handler(int irq, void *arg)
 {
 	struct imx_lcdc *lcdc = arg;
-	struct drm_crtc *crtc = &lcdc->pipe.crtc;
+	struct drm_crtc *crtc = &lcdc->crtc;
 	unsigned int status;
 
 	status = readl(lcdc->base + IMX21LCDC_LISR);
@@ -387,6 +465,9 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 	struct imx_lcdc *lcdc;
 	struct drm_device *drm;
 	struct drm_bridge *bridge;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
 	int irq;
 	int ret;
 	struct device *dev = &pdev->dev;
@@ -428,23 +509,40 @@ static int imx_lcdc_probe(struct platform_device *pdev)
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
 
@@ -483,7 +581,9 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 	drm->mode_config.funcs = &imx_lcdc_mode_config_funcs;
 	drm->mode_config.helper_private = &imx_lcdc_mode_config_helpers;
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot create initial state\n");
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {

-- 
2.55.0


