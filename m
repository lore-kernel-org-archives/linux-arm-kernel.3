Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423EFC44500
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 18:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kuFitKvD+N+j3LNjGp20fDGgGetUmMinD8vCRF2MSU=; b=YU+XrHmKSGJ78/qO3B4bgY85fQ
	K/V4cwLLaVJixx20yA93FXNcVgNr7TxFS5cgVaKZScgiK1Nx6E1zqz2e0UdzKERLPUv2ckGVla9Sd
	pv+2WAChsmDYzWsJvX9rFotDN/EIEjG9aGZL/DaXzmZD5f5jdFehAEwUmZfxmaO5DjmZ0eWHlASwi
	10EPUTWMX9ABlCoQrMMLIpXYzzRB95F4aNN6dh99XBhTdSU9DRHR+HAb5MCdrA3fTQVpzfNRVPcfH
	WLhdlbuaE3V5BiM2pGDDZoKhbEs/Q2eBPQbs5bjAvaP7qFP3Ehjxih1coj0TnJ0M/kNzl1y26OpuA
	xA+tmGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5B3-00000008fGP-0PO2;
	Sat, 04 Jul 2026 18:33:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5B0-00000008fEQ-24hr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 18:33:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664G8ZCH3429554
	for <linux-arm-kernel@lists.infradead.org>; Sat, 4 Jul 2026 18:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/kuFitKvD+N+j3LNjGp20fDGgGetUmMinD8vCRF2MSU=; b=chGpCVDhexRvJ6rr
	wnmP0f94vr8luGOm/++TME2IvEnl0eKIx55FeM3CXaEiwLRW7vXHIKtqjy4o6v06
	SAHgN+sR0Jj96ZfmMzcgh335WxtjOsMExrklcuQvZl0uYzFXYR3+G1qMf7iQJMSH
	wgjWX8QkGys5zg3B0KSZEaLe+bq/Tq1HzMGUDBzrixKO/XaeUaogKOUhmMN/5fE/
	Bo4+ixv+GyB7BhGd3crg1HcJOQ2aynBeUQUP5g/YAQXiZVkBVQpbEnRJF5Z03g49
	fz0f/Vv79d7TcM4jozs0CKmd2kiry+IbhZSW0rpic/qx3/3xor4rojO9WILwcw0Y
	/TyXkw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgspau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 18:33:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8479c6c6cbeso1492778b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 11:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783189997; x=1783794797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kuFitKvD+N+j3LNjGp20fDGgGetUmMinD8vCRF2MSU=;
        b=fpc92wjXFN6+fzBDQJcE+h6YsXLrYLeuUboij+xJ6lqR+TaQJFXuOVp1yaYSa+GAPC
         JlJERFX1XyXVTtvCgwA8DUZw6WWazecLf39uc6lJPlf2vJcC6Wt1d3WBIt36jlGlUeMY
         yPCqGKQxWAKkY6Gcwvmh2klikS608A6wWjmaWqMzCTHvmT+8g72GFjvFYa3tLp+r3LfI
         VfB9TIrTOt0GfUq0QUcTr7ySuedenC5KNUXonVikWg4zLJVjsR9XhNDcfw63xGzv/MIJ
         koGveh21SnUCIVdNfIMh6xpCr46Hb7MYsWImjiQPv7RjVgncJK52fdHQKJumeyeE9o2w
         PR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783189997; x=1783794797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/kuFitKvD+N+j3LNjGp20fDGgGetUmMinD8vCRF2MSU=;
        b=I4W7A3CfBku154pIURSj9Fv2N2XnTUy9lfsnMEyOGjPbocOu4nqD1dgXwtUMgOoOEz
         fbufWc/tYxU06AuX5Y+UUZXUNYmyTV0Q6HH7JBH/iMgH0rK3UOGUKxRndcTuI04vcqbq
         SNBsigfC1Jk2ar0yB0pojwCd2buh6HezIeVN8mSMU4go3vHDkVTIMpd98eILOmZeUe0m
         INRdPFCBdb6SWJBSgUaeJtDS+s/0dw9V0A8znjIciZ1ztiqrUlW5KY6tLWLwOvXPiF0R
         +wDARBmnGZw7/k7nCfvmOEHWD+hZXUBbEWWk1J/IMy/GhceVTIbaKx1da6LWq9SP7MRj
         EyqA==
X-Forwarded-Encrypted: i=1; AHgh+RocGs39k8lvTfyebqVDAq55ZGEoT1JWlp3HonTwZTBlfbFYkNAWUUtG02YWGStXEh5cRr/AGftRrm2/Vmk9OzZ/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9OchbW1ixRkfOQqfBlP7YkpjRaVl+Ny/sQSXP+eouAd4qAH8T
	abtHBoRrjmqf3nxgzHCyb46J5OW/YY6RQctR+znFTMmVYU7nbvGnRhKxC9b6i/W3F0bkPnW5P+T
	mLBmTchOyILFxPYmWIiqVAaRTEau5ZT7xsRZ3nbbT1Gh29bXwMEfw4ivxmBREFQ8huJoBGLhoN4
	QR6A==
X-Gm-Gg: AfdE7clHi78u+njnZkYxRTUpwnLoLHhmcXrbwldMMNzp91wuoetl5PSlQUT2jOExPBD
	dUYmMkkaKz1pbb9SrH/+du14o7Kla4QuUPmmmFts8C3Jih5QCWNakyhnDOqs5ly8Zq3OUv8/Ms3
	V7p7UtR5cSfxj5gltHVfaMDjH6GOtGa1CVZiXppGmVhljpkGgnFFQA4JXUDQPIJVZx0xVYMcm4e
	rvYKXhK88UoOy7Hbcp2RLD91EuDRZqXukfZumFmKAzubLkek9Jyo4EEaXnEt2AToiTvByc2oKc/
	4x0WLboBK/RqB4GoeQ2SfnPTNALn4/LQPS1EvmDO/AxqT9nOAiNy5uf/2wuVL+ItXuW4HnvZGTl
	u7SaZSicP7TmOzIVGytkGPXg=
X-Received: by 2002:a05:6a00:b481:b0:846:2f3d:6275 with SMTP id d2e1a72fcca58-847f6fd61e8mr3673898b3a.58.1783189996847;
        Sat, 04 Jul 2026 11:33:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:b481:b0:846:2f3d:6275 with SMTP id d2e1a72fcca58-847f6fd61e8mr3673864b3a.58.1783189996356;
        Sat, 04 Jul 2026 11:33:16 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:33:15 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 02:31:15 +0800
Subject: [PATCH 6/9] drm/gm12u320: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-simple-kms-removal-v1-6-b4e1ca053623@oss.qualcomm.com>
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
In-Reply-To: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
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
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Ze Huang <ze.huang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=7466;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=r2DdGfAWLZ7vlivcGlngDUbsQreUWLRRttkb80TMXtg=;
 b=ZpiamN8SsvzwHpSl4AWbZvzEzxMPS4b0qx+XHy2MamxT7sudsnCfhp6cfZmSMvpCePwkCMiIy
 rN1rIEme/zqBMPX9TVQFYz/cgOxWF7zd0K0T0G1rbbrGY1RY1W5avTu
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4951ed cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=g95SU4BBbiomblFqym4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: -D5T_k74gcJJUJoDvUH_tlhlrSANfOZ8
X-Proofpoint-GUID: -D5T_k74gcJJUJoDvUH_tlhlrSANfOZ8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX2854l6xYXF3K
 1FfN+EI++xD+AT81WODHj4YgGkrYyd968gWsKlaLryT8St9asy25MtAQ2FSauu+RNb7qpgnTBhe
 eOnzEXXgvsX3C25OXlfp6HNTcF6Di54=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX3u0WiC2Kk4qS
 uhoVMbqbJDTjApRrAd9fWSZ5rj4eUyMbS4RO1id4UVYq7EzPwBO7faWjReCxqF2BigSp6kA0l8F
 OlRkNEOZonY/sVSTS0nJdgkiU4JUSv9VLfIPaKnE8q+7kXRD8fsnmkubU7ZlrD2f/2t3bq67LV1
 hvPN4sBhygUjAEJvPcvYlP1+0B5XWNR7P2tMxoiOoTk6ZCD/9CoSV6+odUKQMWmkmksv5bCOQud
 KhxCU0k0/SCP9ZZsWY4XEnwn9MncAyRwUaM59TKNJ1SVb9bpYGX0eS1emDtTF+tZtT7Hgkw1Eom
 WQTELwdoof4/dh5K+NkVMgAQviUe8HdGO202ylJTP2146JVoDNk2XjrvXl01IblSN706FBdocCl
 YdcThuDaJc9WkI5ub1EZwKa2wGT69nIhvvDbE59AXGiUkwH2bFdPt2NbtZSLKKi0jz9iFeJDLKo
 J8O6dYXjI9nq5B747tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_113318_544357_151D9F72 
X-CRM114-Status: GOOD (  18.63  )
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

Convert gm12u320 to direct primary plane, CRTC and encoder setup.

Keep shadow-plane helper state, framebuffer access helpers and
no-scaling plane-state check from simple-KMS path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/gm12u320.c | 128 ++++++++++++++++++++++++++++++++--------
 1 file changed, 104 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index d73dfebb4353..992160ea794d 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -8,6 +8,7 @@
 #include <linux/usb.h>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
@@ -27,7 +28,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 static bool eco_mode;
 module_param(eco_mode, bool, 0644);
@@ -87,7 +87,9 @@ MODULE_PARM_DESC(eco_mode, "Turn on Eco mode (less bright, more silent)");
 
 struct gm12u320_device {
 	struct drm_device	         dev;
-	struct drm_simple_display_pipe   pipe;
+	struct drm_plane	         plane;
+	struct drm_crtc		         crtc;
+	struct drm_encoder	         encoder;
 	struct drm_connector	         conn;
 	unsigned char                   *cmd_buf;
 	unsigned char                   *data_buf[GM12U320_BLOCK_COUNT];
@@ -554,31 +556,33 @@ static int gm12u320_conn_init(struct gm12u320_device *gm12u320)
 }
 
 /* ------------------------------------------------------------------ */
-/* gm12u320 (simple) display pipe				      */
+/* gm12u320 display pipe						      */
 
-static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
-				 struct drm_crtc_state *crtc_state,
-				 struct drm_plane_state *plane_state)
+static void gm12u320_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
 	struct drm_rect rect = { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT };
-	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
+	struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
+	struct drm_plane_state *plane_state = crtc->primary->state;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 
 	gm12u320->fb_update.draw_status_timeout = FIRST_FRAME_TIMEOUT;
 	gm12u320_fb_mark_dirty(plane_state->fb, &shadow_plane_state->data[0], &rect);
 }
 
-static void gm12u320_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void gm12u320_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+						struct drm_atomic_commit *commit)
 {
-	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
+	struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
 
 	gm12u320_stop_fb_update(gm12u320);
 }
 
-static void gm12u320_pipe_update(struct drm_simple_display_pipe *pipe,
-				 struct drm_plane_state *old_state)
+static void gm12u320_plane_helper_atomic_update(struct drm_plane *plane,
+						struct drm_atomic_commit *commit)
 {
-	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_plane_state *state = plane->state;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
 
@@ -586,11 +590,71 @@ static void gm12u320_pipe_update(struct drm_simple_display_pipe *pipe,
 		gm12u320_fb_mark_dirty(state->fb, &shadow_plane_state->data[0], &rect);
 }
 
-static const struct drm_simple_display_pipe_funcs gm12u320_pipe_funcs = {
-	.enable	    = gm12u320_pipe_enable,
-	.disable    = gm12u320_pipe_disable,
-	.update	    = gm12u320_pipe_update,
-	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+static const struct drm_plane_funcs gm12u320_plane_funcs = {
+	.update_plane	= drm_atomic_helper_update_plane,
+	.disable_plane	= drm_atomic_helper_disable_plane,
+	.destroy	= drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+static int gm12u320_plane_helper_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_commit *state)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = NULL;
+	int ret;
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	return ret;
+}
+
+static const struct drm_plane_helper_funcs gm12u320_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check	= gm12u320_plane_helper_atomic_check,
+	.atomic_update	= gm12u320_plane_helper_atomic_update,
+};
+
+static int gm12u320_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	int ret;
+
+	if (!crtc_state->enable)
+		goto out;
+
+	ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+	if (ret)
+		return ret;
+
+out:
+	return drm_atomic_add_affected_planes(state, crtc);
+}
+
+static const struct drm_crtc_helper_funcs gm12u320_crtc_helper_funcs = {
+	.atomic_check	= gm12u320_crtc_helper_atomic_check,
+	.atomic_enable	= gm12u320_crtc_helper_atomic_enable,
+	.atomic_disable	= gm12u320_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs gm12u320_crtc_funcs = {
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs gm12u320_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static const uint32_t gm12u320_pipe_formats[] = {
@@ -677,13 +741,29 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 	if (ret)
 		return ret;
 
-	ret = drm_simple_display_pipe_init(&gm12u320->dev,
-					   &gm12u320->pipe,
-					   &gm12u320_pipe_funcs,
-					   gm12u320_pipe_formats,
-					   ARRAY_SIZE(gm12u320_pipe_formats),
-					   gm12u320_pipe_modifiers,
-					   &gm12u320->conn);
+	ret = drm_universal_plane_init(dev, &gm12u320->plane, 0,
+				       &gm12u320_plane_funcs,
+				       gm12u320_pipe_formats,
+				       ARRAY_SIZE(gm12u320_pipe_formats),
+				       gm12u320_pipe_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(&gm12u320->plane, &gm12u320_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(dev, &gm12u320->crtc, &gm12u320->plane, NULL,
+					&gm12u320_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(&gm12u320->crtc, &gm12u320_crtc_helper_funcs);
+
+	ret = drm_encoder_init(dev, &gm12u320->encoder, &gm12u320_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	gm12u320->encoder.possible_crtcs = drm_crtc_mask(&gm12u320->crtc);
+
+	ret = drm_connector_attach_encoder(&gm12u320->conn, &gm12u320->encoder);
 	if (ret)
 		return ret;
 

-- 
2.55.0


