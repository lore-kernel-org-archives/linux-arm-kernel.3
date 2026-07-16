Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB3EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gs6ZFn51ViIywPhcgxd9Yb4ROtm55PINNXW4yAOhhE=; b=OdnQ9MUcctEYuboa+emQO1wqwl
	2crtdVdVpaEuSScWB027riWMGusVMKTlmVe2NV0upD5Pdsw8wtqST2+Lq0OSm7VcdLwxxgFoTpybR
	LHpDFJbng4csfmDv9zCpeT4GUYZbY4DyBgi6xxkBIJ+JPpdKNwhzk4ejBdN+nizLfZKqXw3fZjDRG
	2L1ZsV9IDhzXuVzsSRruGS7r2wk98cnGxdzIrIalag6+J0vv3+/Yhs5MNPxL73Kn5YuMBj1Y0s2Uz
	q6x1YlOT3aO412ePkvlldP/hG5DVhTS0Tea/pQwf4D3GlEfmVm5yXrHpbBYW6F/J2hbo12YCcikOK
	XXuoN/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHzw-0000000GnzZ-1Dd2;
	Thu, 16 Jul 2026 09:03:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHzr-0000000Gnw9-32Up
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:03:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DQ6j2102717
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gs6ZFn51ViIywPhcgxd9Yb4ROtm55PINNXW4yAOhhE=; b=PLzkANkoIcwLSt8u
	qxHbKYQBqEIGyO2zD8ScRdo116d1xg/kxNzHjH6wRUBPXjaSRWbwhIWprgtUuLPW
	KKXSZZjdsq6P20BmYmWkfRvjGicEbsDDRmbrScs3ts42gkrr6BG7rkMDzXfkQk7R
	XCM6gQv9sUWksFHIu4edURnNQqBEGuvw+hA2qNFkuswKLyLyNE/9rnRq6YmABhoO
	d/UeUHTGoFT6tFDGmMt/J71Jn/g9BodysDeOv4b751VtWPp0lgwJ83kqMdE538O8
	rm+50X8hZFJXBYVKeXh2Iqpxeea25a7lbs8Dt0DH1gJBof+Wx3TcwLyDz6fJjHiX
	xZ3ULw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4w9j7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:03:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso82084785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 02:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192590; x=1784797390; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gs6ZFn51ViIywPhcgxd9Yb4ROtm55PINNXW4yAOhhE=;
        b=Fi0YbULGQTrrBeDn3JWIVmtrnvgcgBWKzXyUjMLv2v77NOoA5EAOcNnGfEdOJNQxyt
         0hLJmmjMruZbENWlc1KLxIDiw++4yAYHUJOA4XRbd4S0KS2o81hH9cDyyIuNl84GziM6
         TkQw+fDV/RD6JWymAZYc3Ea1PUkl1JWsjzde73FaSd2qyFnGx+ltfeuEMa0pCY5ndYjw
         z4n/p6i+PisMDVcOQ+zjaHK72l/Y80F4YGc/WP9elYqcP+HMYop4VjFvSzyCJcpnlD8B
         fYclVhIzkJknQ4Qoy0LCGwPQhdr7rtCfWjg5nMJv8DQP5t119jIXLYegqjWNQqiCYnMP
         af/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192590; x=1784797390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gs6ZFn51ViIywPhcgxd9Yb4ROtm55PINNXW4yAOhhE=;
        b=Me8guSSlsM8Dk5FvU0Rqelz/HMCdhcsJCDlp0DR8oY+NKNfMF+Hf34nzJvdcRyGHM4
         UfWKBUmi7MeaA/EH9bQd8i1HOpgb0pmBUgaIF9nh71vzGXZlLX2j0lYfP3BCH1I9qP82
         co0KvLBKr/xMgb/Qx/ulUX30/1WiyGOqdIW6tnY9CLwep9Wrcdj4mZEa/mJe6fhUKwFf
         P0GbQ2xsWF9OXQOHdpq9lAW04AAKpf9rG6mKLar752bOu5ALol4v9RD5czsVJhkGPIsZ
         pUf+QTjoDwhhPnEc771ZSGLIsLF34DC81BStt6VRI13cVSfYlp9Rb121mjh7kjSZ3Fa3
         ppNg==
X-Forwarded-Encrypted: i=1; AHgh+RqlEMqH+6SALLtXYZP0PtKMitUdOQBm+iQfrPQCQ8N8wh/Uqoox88je8ZpIC1+ehM3/gg241Jp7j2dIdJTld994@lists.infradead.org
X-Gm-Message-State: AOJu0YyBqPqzXDQEv1jXfUH4zQeduJlaOWC0zfvMisQ6Z6s8msjOMjf/
	9lpz/6wa67PN6UjD4MnHBzxxUlcSg5YbEomteB5EVLkTlKNhDTz1tQbrX/2haXGCxrmXDpKTizC
	AKdUXSp7UobG7vtCLmreyglRaKad8HoOiouPfyyQ2jIBFLnIcdQW7hXTglAo5XmAA0NReZURyyI
	8myg==
X-Gm-Gg: AfdE7clu4ZjossJL8cquVxmzRPa5AuU1h4L2bzd3XdD6MLQ41OzMCjgXn7lb1Kq8r9P
	vSmqm8VExFYFVSP8DuUEKTKfZwYEt07hslQso2BG51Ad4cIYasSTNqEC/SJHhvSxoHpjhAdy3XD
	XxjZjWvwkwDXRR00jWPDqas7v8oqfneWfOs0V1qYqKr/n3BC+4/kIWktB0mtJHh0thRuU17e2Iz
	01cWrLSoPZ7t0Ll1JGRoI/QfQ5gskH2jvhda3B4k+P/KvZ3JB5Cit0053/VF95KbHpGXh0ROzyo
	6R1OEmfmlf/TpTYOdI8ySCQLkFw9Q/ic9tJNJX96/ugqHkRFJJFgUPmd0pMhrRa0RajTAq+XcCK
	iQeZu5Vth1dfBLN0LoxiV
X-Received: by 2002:a17:903:458f:b0:2ca:304:f93e with SMTP id d9443c01a7336-2cee9b58fa9mr109883275ad.22.1784192589918;
        Thu, 16 Jul 2026 02:03:09 -0700 (PDT)
X-Received: by 2002:a17:903:458f:b0:2ca:304:f93e with SMTP id d9443c01a7336-2cee9b58fa9mr109882915ad.22.1784192589269;
        Thu, 16 Jul 2026 02:03:09 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:03:08 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:01:55 +0800
Subject: [PATCH v2 3/8] drm/mcde: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-drm-simple-kms-removal-v2-3-1133a8fc3785@oss.qualcomm.com>
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
In-Reply-To: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192560; l=15094;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=68SyLROdh7gtSjTLnzbueeYHapUemcEJldTPDqGBdBg=;
 b=GZwBrZK7hIoCbv3x6DM9/eN8GGXvJVijZFHj5nkZmiajld9kb1tDcEAiNnFrtIIuriqYSY/32
 F3xiVq3FpDRA9RMcdgRY89Bz0rhbKAJEmtJuYqvmpmgQ33WCA3AICwE
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a589e4f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7TuhGXn_jpZpJwHYtc4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: CXUj28Jlk-hKj38H27UIy1vjFL8r-VBo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX5RKEA1+zhvmU
 ksDFwO9d3YcjPlsTxBGXDmDDApDbRqYKa+WIPPsl9A2JaCc4cx4pKbq8SdnD/+FqaHoddux7I+W
 JkREoHkFVCdWSsD6iLGsVaQ/lvPxdhM=
X-Proofpoint-ORIG-GUID: CXUj28Jlk-hKj38H27UIy1vjFL8r-VBo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX4se9qxPS7bob
 SnoZWEH5ufsRxTUlba7g/nTFC2BiEREwAk3Rl2GK4mAbQXRIKrAxOzMaXZTu1XTAkE1JbxR11an
 nKkl/ThIKzlX8t+beNV4g5KeVAOBk8VBduhQWtFvFtfTa+aTvKILDamOUjHUOq6/wwt835685Qp
 QeJu/ekZfE37xIVrIrccWh7wu2Ghyao201YBHW8nUD58gYeSWreZEqFueQhbGtekAUomfJhYN01
 Ym9M8CkHk677yD0s10giFe90nG2Zlz7RwNsCmyI1ji2OMd71cTKMx7ToE501m/LlapMfVbtPzbh
 EK/sVRc8kcblYgG+pR3rc6JPZdSGjozfDbAr0y47O5xU7EC0/sJ1Oh/Gb8Mo51CiEy1Sz6piTp3
 Y1RnmQaobeWl1/KefdHPA1NMjbymL55CuVvj3jFGXGzrVZmA74HZjR1/3XKVj0fHjpQmqD2ZEKz
 bMhNptyQfNrZNiQNsTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_020311_880210_411E7D8F 
X-CRM114-Status: GOOD (  26.75  )
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

Convert MCDE to explicit plane, CRTC and encoder objects.

Handle pending page-flip events from the CRTC atomic flush path using the
commit-local CRTC state, and avoid manual connector/encoder attachment
before the connector has been created by the bridge path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/mcde/mcde_display.c | 251 +++++++++++++++++++++++-------------
 drivers/gpu/drm/mcde/mcde_drm.h     |   8 +-
 drivers/gpu/drm/mcde/mcde_drv.c     |   8 +-
 3 files changed, 173 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 257a6e84dd58..86edf94c5237 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -10,6 +10,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/media-bus-format.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -18,7 +19,6 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_print.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_vblank.h>
 #include <video/mipi_display.h>
@@ -132,7 +132,7 @@ void mcde_display_irq(struct mcde *mcde)
 	writel(mispp, mcde->regs + MCDE_RISPP);
 
 	if (vblank)
-		drm_crtc_handle_vblank(&mcde->pipe.crtc);
+		drm_crtc_handle_vblank(&mcde->crtc);
 
 	if (misovl)
 		dev_info(mcde->dev, "some stray overlay IRQ %08x\n", misovl);
@@ -157,40 +157,57 @@ void mcde_display_disable_irqs(struct mcde *mcde)
 	writel(0xFFFFFFFF, mcde->regs + MCDE_RISCHNL);
 }
 
-static int mcde_display_check(struct drm_simple_display_pipe *pipe,
-			      struct drm_plane_state *pstate,
-			      struct drm_crtc_state *cstate)
+static int mcde_plane_helper_atomic_check(struct drm_plane *plane,
+					  struct drm_atomic_commit *commit)
 {
-	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *old_fb = pipe->plane.state->fb;
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_crtc *crtc = pstate->crtc;
+	struct drm_crtc_state *cstate = NULL;
+	const struct drm_display_mode *mode;
+	struct drm_framebuffer *old_fb = old_pstate->fb;
 	struct drm_framebuffer *fb = pstate->fb;
+	int ret;
 
-	if (fb) {
-		u32 offset = drm_fb_dma_get_gem_addr(fb, pstate, 0);
+	if (crtc)
+		cstate = drm_atomic_get_new_crtc_state(commit, crtc);
 
-		/* FB base address must be dword aligned. */
-		if (offset & 3) {
-			DRM_DEBUG_KMS("FB not 32-bit aligned\n");
-			return -EINVAL;
-		}
+	ret = drm_atomic_helper_check_plane_state(pstate, cstate,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
 
-		/*
-		 * There's no pitch register, the mode's hdisplay
-		 * controls this.
-		 */
-		if (fb->pitches[0] != mode->hdisplay * fb->format->cpp[0]) {
-			DRM_DEBUG_KMS("can't handle pitches\n");
-			return -EINVAL;
-		}
+	if (!pstate->visible || !fb)
+		return 0;
 
-		/*
-		 * We can't change the FB format in a flicker-free
-		 * manner (and only update it during CRTC enable).
-		 */
-		if (old_fb && old_fb->format != fb->format)
-			cstate->mode_changed = true;
+	mode = &cstate->mode;
+
+	u32 offset = drm_fb_dma_get_gem_addr(fb, pstate, 0);
+
+	/* FB base address must be dword aligned. */
+	if (offset & 3) {
+		DRM_DEBUG_KMS("FB not 32-bit aligned\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * There's no pitch register, the mode's hdisplay
+	 * controls this.
+	 */
+	if (fb->pitches[0] != mode->hdisplay * fb->format->cpp[0]) {
+		DRM_DEBUG_KMS("can't handle pitches\n");
+		return -EINVAL;
 	}
 
+	/*
+	 * We can't change the FB format in a flicker-free
+	 * manner (and only update it during CRTC enable).
+	 */
+	if (old_fb && old_fb->format != fb->format)
+		cstate->mode_changed = true;
+
 	return 0;
 }
 
@@ -1149,16 +1166,15 @@ static void mcde_setup_dsi(struct mcde *mcde, const struct drm_display_mode *mod
 	*dsi_formatter_frame = formatter_frame;
 }
 
-static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
-				struct drm_crtc_state *cstate,
-				struct drm_plane_state *plane_state)
+static void mcde_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					   struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_plane *plane = &pipe->plane;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, &mcde->plane);
 	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_framebuffer *fb = plane_state->fb;
 	u32 format = fb->format->format;
 	int dsi_pkt_size;
 	int fifo_wtrmrk;
@@ -1298,9 +1314,10 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 	dev_info(drm->dev, "MCDE display is enabled\n");
 }
 
-static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
+static void mcde_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					    struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 	struct drm_pending_vblank_event *event;
@@ -1318,9 +1335,9 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 		mcde_dsi_disable(mcde->bridge);
 	}
 
-	event = crtc->state->event;
+	event = cstate->event;
 	if (event) {
-		crtc->state->event = NULL;
+		cstate->event = NULL;
 
 		spin_lock_irq(&crtc->dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, event);
@@ -1381,44 +1398,13 @@ static void mcde_set_extsrc(struct mcde *mcde, u32 buffer_address)
 	writel(buffer_address + mcde->stride, mcde->regs + MCDE_EXTSRCXA1);
 }
 
-static void mcde_display_update(struct drm_simple_display_pipe *pipe,
-				struct drm_plane_state *old_pstate)
+static void mcde_plane_helper_atomic_update(struct drm_plane *plane,
+					    struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
-	struct mcde *mcde = to_mcde(drm);
-	struct drm_pending_vblank_event *event = crtc->state->event;
-	struct drm_plane *plane = &pipe->plane;
-	struct drm_plane_state *pstate = plane->state;
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
+	struct mcde *mcde = to_mcde(plane->dev);
 	struct drm_framebuffer *fb = pstate->fb;
 
-	/*
-	 * Handle any pending event first, we need to arm the vblank
-	 * interrupt before sending any update to the display so we don't
-	 * miss the interrupt.
-	 */
-	if (event) {
-		crtc->state->event = NULL;
-
-		spin_lock_irq(&crtc->dev->event_lock);
-		/*
-		 * Hardware must be on before we can arm any vblank event,
-		 * this is not a scanout controller where there is always
-		 * some periodic update going on, it is completely frozen
-		 * until we get an update. If MCDE output isn't yet enabled,
-		 * we just send a vblank dummy event back.
-		 */
-		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0) {
-			dev_dbg(mcde->dev, "arm vblank event\n");
-			drm_crtc_arm_vblank_event(crtc, event);
-		} else {
-			dev_dbg(mcde->dev, "insert fake vblank event\n");
-			drm_crtc_send_vblank_event(crtc, event);
-		}
-
-		spin_unlock_irq(&crtc->dev->event_lock);
-	}
-
 	/*
 	 * We do not start sending framebuffer updates before the
 	 * display is enabled. Update events will however be dispatched
@@ -1443,9 +1429,40 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 	}
 }
 
-static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
+static void mcde_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+					  struct drm_atomic_commit *commit)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_pending_vblank_event *event = crtc_state->event;
+
+	/*
+	 * Handle any pending event first, we need to arm the vblank
+	 * interrupt before sending any update to the display so we don't
+	 * miss the interrupt.
+	 */
+	if (!event)
+		return;
+
+	crtc_state->event = NULL;
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	/*
+	 * Hardware must be on before we can arm any vblank event,
+	 * this is not a scanout controller where there is always
+	 * some periodic update going on, it is completely frozen
+	 * until we get an update. If MCDE output isn't yet enabled,
+	 * we just send a vblank dummy event back.
+	 */
+	if (crtc_state->active && drm_crtc_vblank_get(crtc) == 0)
+		drm_crtc_arm_vblank_event(crtc, event);
+	else
+		drm_crtc_send_vblank_event(crtc, event);
+
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
+static int mcde_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 	u32 val;
@@ -1462,9 +1479,8 @@ static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 	return 0;
 }
 
-static void mcde_display_disable_vblank(struct drm_simple_display_pipe *pipe)
+static void mcde_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 
@@ -1474,13 +1490,55 @@ static void mcde_display_disable_vblank(struct drm_simple_display_pipe *pipe)
 	writel(0xFFFFFFFF, mcde->regs + MCDE_RISPP);
 }
 
-static struct drm_simple_display_pipe_funcs mcde_display_funcs = {
-	.check = mcde_display_check,
-	.enable = mcde_display_enable,
-	.disable = mcde_display_disable,
-	.update = mcde_display_update,
-	.enable_vblank = mcde_display_enable_vblank,
-	.disable_vblank = mcde_display_disable_vblank,
+static int mcde_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *commit)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	int ret;
+
+	if (crtc_state->enable) {
+		ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+		if (ret)
+			return ret;
+	}
+
+	return drm_atomic_add_affected_planes(commit, crtc);
+}
+
+static const struct drm_crtc_funcs mcde_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= mcde_crtc_enable_vblank,
+	.disable_vblank		= mcde_crtc_disable_vblank,
+};
+
+static const struct drm_crtc_helper_funcs mcde_crtc_helper_funcs = {
+	.atomic_check	= mcde_crtc_helper_atomic_check,
+	.atomic_enable	= mcde_crtc_helper_atomic_enable,
+	.atomic_disable	= mcde_crtc_helper_atomic_disable,
+	.atomic_flush	= mcde_crtc_helper_atomic_flush,
+};
+
+static const struct drm_plane_funcs mcde_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.reset			= drm_atomic_helper_plane_reset,
+	.destroy		= drm_plane_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static const struct drm_plane_helper_funcs mcde_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= mcde_plane_helper_atomic_check,
+	.atomic_update	= mcde_plane_helper_atomic_update,
+};
+
+static const struct drm_encoder_funcs mcde_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 int mcde_display_init(struct drm_device *drm)
@@ -1510,14 +1568,29 @@ int mcde_display_init(struct drm_device *drm)
 	if (ret)
 		return ret;
 
-	ret = drm_simple_display_pipe_init(drm, &mcde->pipe,
-					   &mcde_display_funcs,
-					   formats, ARRAY_SIZE(formats),
-					   NULL,
-					   mcde->connector);
+	ret = drm_universal_plane_init(drm, &mcde->plane, 0,
+				       &mcde_plane_funcs,
+				       formats, ARRAY_SIZE(formats),
+				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(&mcde->plane, &mcde_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &mcde->crtc, &mcde->plane,
+					NULL, &mcde_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(&mcde->crtc, &mcde_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, &mcde->encoder, &mcde_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret)
 		return ret;
 
+	mcde->encoder.possible_crtcs = drm_crtc_mask(&mcde->crtc);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mcde_display_init);
diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_drm.h
index ecb70b4b737c..10dd79893811 100644
--- a/drivers/gpu/drm/mcde/mcde_drm.h
+++ b/drivers/gpu/drm/mcde/mcde_drm.h
@@ -4,7 +4,7 @@
  * Parts of this file were based on the MCDE driver by Marcus Lorentzon
  * (C) ST-Ericsson SA 2013
  */
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
 
 #ifndef _MCDE_DRM_H_
 #define _MCDE_DRM_H_
@@ -72,7 +72,9 @@ struct mcde {
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 	struct drm_connector *connector;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	struct mipi_dsi_device *mdsi;
 	bool dpi_output;
 	s16 stride;
@@ -95,7 +97,7 @@ struct mcde {
 	struct regulator *vana;
 };
 
-#define to_mcde(dev) container_of(dev, struct mcde, drm)
+struct mcde *to_mcde(struct drm_device *dev);
 
 static inline bool mcde_flow_is_video(struct mcde *mcde)
 {
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5f2c462bad7e..01787b923520 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -109,6 +109,11 @@ static const struct drm_mode_config_helper_funcs mcde_mode_config_helpers = {
 	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
 };
 
+struct mcde *to_mcde(struct drm_device *dev)
+{
+	return container_of(dev, struct mcde, drm);
+}
+
 static irqreturn_t mcde_irq(int irq, void *data)
 {
 	struct mcde *mcde = data;
@@ -186,8 +191,7 @@ static int mcde_modeset_init(struct drm_device *drm)
 	}
 
 	/* Attach the bridge. */
-	ret = drm_simple_display_pipe_attach_bridge(&mcde->pipe,
-						    mcde->bridge);
+	ret = drm_bridge_attach(&mcde->encoder, mcde->bridge, NULL, 0);
 	if (ret) {
 		dev_err(drm->dev, "failed to attach display output bridge\n");
 		return ret;

-- 
2.43.0


