Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B7BC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeSqLazRYgr33B487FeWpWmBWUCKqNkEYXob2j87zRQ=; b=qnPMZV9sOFCgTPayaCOYPyGo9A
	VjTWdYWEbGcG36GFa54cDUkTryeesEiF43Gl9ROQFniyzjvHOuZkFt/yLJ5p22spkKYQRksOVpNye
	tqeVRPx+HhLaTKCo/fqaOlKetKRRXN36Fitq0x++z1rNIrYF+7ZZcUnz+d5pYizu5ukhBEoZ9LUSF
	ztXtKdGOIJx7AyudASG9d/wRG6ZLjTY/qMXoH+ti4V+gXw5K7WvPk8ajdr254TvEI46JLngOkTx6Z
	psLIBCcClZ1gXDEqIAio8VM/ZmSoWQb9nL7mjxmHoEPWn6lGLT5t+US/wvVGhyQoS23E76mQORHjr
	cbEtpNZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkI08-0000000Go93-33SG;
	Thu, 16 Jul 2026 09:03:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkI05-0000000Go6z-1hhu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:03:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7Dwjo1849055
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MeSqLazRYgr33B487FeWpWmBWUCKqNkEYXob2j87zRQ=; b=FXVHZpAGJedoRTh8
	n3RpC40OMzwvSPs0hVWwrGEzYyj8qIUe/ElinbQoYVKUsjih/3bJr0JspEfwiHkT
	Hv/bd0/PKRu0B/lwGk43bnVxZ/sfaN/AkKfYjGhdDh+NH6EgBvQXIjRt/ihZNyEW
	CwM7Yw1OwPFp7rmw44bTwGXrmfddtvT/X6D+PRlQHfbk8X18hGykq59dMxKQjHif
	PVH8MGdgMNItGElve/sqSJW2uUH7S6OEIcwfZfDvhvtGQAf2JJynU6mT4tiMyb1U
	/kl3+u71Qlb7J5NdtCaWqSVRb5DG0q0y07ik4skRubojZqf8kd5kJd51wT3oVoKL
	yNwKmQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7rghm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:03:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6823efcso59670865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 02:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192604; x=1784797404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MeSqLazRYgr33B487FeWpWmBWUCKqNkEYXob2j87zRQ=;
        b=N2TlP6vJmnGcxvEpmkquPxOTxSCwZ8b0QGZ9cmnmA2SzY39SKD2Q5iFET/fnCMioE7
         qYt4/bao1LYZsyx6kX9pXA5fCWtp7c3tUwtR/NlLG6sVcobUcDQtGvL31oTdtmeQi+5l
         IJ86sE4z8spr3Qy+MNhn9qTRszLaqiQasmy5sjljcOtJ5mtuiQDh6cM4ipQqdwGtzpXM
         TFj/I4VOpNO7lE8OELYc18xOCEHSQjei1U7hrOnpdFyhLI29rpjwdti/M4Q5o926z72c
         PuDJ3dj0HSTv68uCQYbaE42f+qdKGmamM4Lcwtaz0a8DZweToLHZwiMK2EOF+qAgxU29
         dDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192604; x=1784797404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeSqLazRYgr33B487FeWpWmBWUCKqNkEYXob2j87zRQ=;
        b=sRKy3hsktn0m8J/H11ITb90XpdGLo5xLCoq0+FgV6vOt6Mn+BCzKq8x9SF754LvcMb
         fsbk0CtNR8cbAdi6yZ4A92U44SyTrD7P7/kfTwABKYxU2ZaZPbTjTZvx1IsWvk+kcXWJ
         IopGfmHt8S82dVLoQXRnIxrO8moizKnnFaBokL5s/tqq+OHcgpQsBBUzET6xdcc1bK/t
         S0HB/hEkvRhdG4fz7CRU6YUq2Nj+HJ6FWm7ZPwc+Ne1RKnXw95jGGwh3iBxr3dxf2Dtq
         djQ/pzfMcw8gZ/PxvrdEyxVGdlclK+olW97+z9d8XMFyqkC4F5I4XgTyWqMz2CEOuO6H
         ItWw==
X-Forwarded-Encrypted: i=1; AHgh+RooP7EVn4SRUOKjDROYOKnUgOV/dQA/veNfpEO/9hR3Ba0V4PBF6RnWBPBm5Z7XGJbcu0DTfzcbU2kNIXklp4Hj@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf0dipTlpfzWxS6satMg8OrLNiYu/o9Hbx9ifsSX3akUARG5P/
	h7lvNM2XbHUuhSrtz2KaFsMF7DvTF5CvzXlY3FQk9G5A/P52Gynz5EWTNdeaV26i78zYMLtaKAE
	Nl8JKjol6jZEWuM0aKBogNQVHalcMFq7Yh6SHwi/3YyWLP5cQF/ie5VlhGptz+kXPUE/w/PnQ5S
	Libw==
X-Gm-Gg: AfdE7cm43yHosdS0sB+HLOklCoNQmc1vDlaoULIP+5ihtHpAThkdSKq2Y1O4FpmcwK7
	3ZKMn3MGFB12JLHL+fbtAeanyU+++nx5+1BNlMZjMovn6RZaER3Qw1XKtsliVR9PuegNzCCuC/Q
	XU15bZA7ShL/ybuJIOzBFott82m1NT2hcux1akWdVOvsItpkbSRUu2M488H64zYHAe45yL/ShPZ
	bScQe6fb7nqrelkZNN2dARiCa9FNfTBFMxUXCDoT6nIwOB17Nr0AfSaVPZ6S5J9FCzS6ZcJGrRH
	/CmalLkwwvMvh11l8YDR3NtKwFb3imH0SaU7Wjn9lyMic21AIe9ModOi2MjwbHixsFG0lGFuLRz
	dn8BLloab/NF/p5AlU8ax
X-Received: by 2002:a17:902:ecc4:b0:2ca:b8d:e65e with SMTP id d9443c01a7336-2cf03dc62b5mr62673245ad.37.1784192604112;
        Thu, 16 Jul 2026 02:03:24 -0700 (PDT)
X-Received: by 2002:a17:902:ecc4:b0:2ca:b8d:e65e with SMTP id d9443c01a7336-2cf03dc62b5mr62672665ad.37.1784192603523;
        Thu, 16 Jul 2026 02:03:23 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:03:23 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:01:57 +0800
Subject: [PATCH v2 5/8] drm/gm12u320: replace struct
 drm_simple_display_pipe with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-drm-simple-kms-removal-v2-5-1133a8fc3785@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192560; l=7964;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=clrd2wPCUImRmnt9dUsqbH/TK0mbxMgUhxeWagkxE+4=;
 b=0oRyaLEkb6eanKq6iqSl6wa+hGMmW3tOf5ZzNUvdnQ1H3jNsbTzi9cLXyJD2dE3oAeyIW6luo
 TPO40xg3wNsAgnlI+cgNB4ljxIOqwV95/AiRUDhwKVkGVCOsCip/o0W
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX3kFTpHXzWOMI
 FEzQvGK/ZJfSI3MQrXxAkWaHBxjHA9wKm+GXlPZaMvXLxpzIgz5N4CH1mQorleUNUpGMibWZbSr
 71ceu/4kOSQqI3Q75F4CkoOmMKFRN9s=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a589e5c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=g95SU4BBbiomblFqym4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfXygDpsuuSMKfy
 yrIcuJvOLKezcB9Ec64OenqxcJF5OGNdakSSMlAgPIZ31MZTCqL0OC0sQANR5nMT/dq8T8BZOFt
 5gAK63iu6aXeliI1vdYnpoGJYkK1Ir2YUmFUPgRrsGNXH1dWwrZB4Fmn18n/vQYh13LS2ytHQy+
 dWGxa3tsnLtu2ay6ENcGi9aP9udhIH+gBs0HC8dTiyc+WG0ekcSzpviRKQGHH4NRGrIf5nTHY8t
 cANNxGmwL4R5/p+LiZG8cD7GkovkONe6R7mI1Ly4TAVmS+TxCIu/WbEItKQnGkcwHxsOurYjjia
 qcbEFULWUnpW0o2E7Z9gkedWKvdV5s9Uv98tSK+KRvwo20+Bpdl8mqt8KrI1o8+fsFBqFGs6nNS
 GVlbG9XsUrCm1+u1QI6WBzpYWpvlkXRiPQQj+zZOdehSptR/fiTvl9KJp4g88dyzBO9kmqEuCQu
 BHl8EETAOtNcp53Sssg==
X-Proofpoint-ORIG-GUID: Vn0OwPN35-oLygwINuhzUnHD8NuApm0R
X-Proofpoint-GUID: Vn0OwPN35-oLygwINuhzUnHD8NuApm0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_020325_480965_1AFA418F 
X-CRM114-Status: GOOD (  18.59  )
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/gm12u320.c | 132 ++++++++++++++++++++++++++++++++--------
 1 file changed, 107 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index d73dfebb4353..df60968856e5 100644
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
@@ -102,7 +104,10 @@ struct gm12u320_device {
 	} fb_update;
 };
 
-#define to_gm12u320(__dev) container_of(__dev, struct gm12u320_device, dev)
+static struct gm12u320_device *to_gm12u320(struct drm_device *__dev)
+{
+	return container_of(__dev, struct gm12u320_device, dev);
+}
 
 static const char cmd_data[CMD_SIZE] = {
 	0x55, 0x53, 0x42, 0x43, 0x00, 0x00, 0x00, 0x00,
@@ -554,43 +559,104 @@ static int gm12u320_conn_init(struct gm12u320_device *gm12u320)
 }
 
 /* ------------------------------------------------------------------ */
-/* gm12u320 (simple) display pipe				      */
+/* gm12u320 display pipe					      */
 
-static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
-				 struct drm_crtc_state *crtc_state,
-				 struct drm_plane_state *plane_state)
+static void gm12u320_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
 	struct drm_rect rect = { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT };
-	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
+	struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
+	struct drm_plane_state *plane_state = gm12u320->plane.state;
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
+	struct drm_plane_state *state = drm_atomic_get_new_plane_state(commit, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
 
+	if (!state->fb)
+		return;
+
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
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
+					      struct drm_atomic_commit *commit)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = NULL;
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+
+	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
+
+static const struct drm_plane_helper_funcs gm12u320_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check	= gm12u320_plane_helper_atomic_check,
+	.atomic_update	= gm12u320_plane_helper_atomic_update,
+};
+
+static int gm12u320_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *commit)
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
@@ -677,13 +743,29 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
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
2.43.0


