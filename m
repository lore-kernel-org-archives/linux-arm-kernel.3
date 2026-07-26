Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F676C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 19:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFB+5HFwxjcBF8nxAOBQAVq/5co4FpjrWYEcC8BPX/U=; b=Tu5DEef2Sf8YJNkRHTgvMHhyaE
	6tnFYpf7U2URYE242+xH9t9rZuQ6Gc0MXZ0jcXfZsWkCBooZmSsrQK2wYe6x3e+v+4Y2BHWpFeoec
	wQ3qSUoiDO+T9V5KdQZEADKpNXnGb+4gsYyLziFCeGh4YNk3ClhjIWxM7K5Vnko9oglxGwaocSB8h
	FqWWeuA0wgK80RRnpwjSjwRz0zf35s1AqQ2/rynH+jJUizoYneMQgGRwm35dHIRXdjmf0ekHiPy0A
	jbKdlo3pdhHsq0FSzgFtXNm+WBUO3RjU+qLJiJVaiDNuxgHXeWoVXhAhFd22QI364rY+1LtD7L+hX
	66vDDE2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4nN-00000001XSO-2u1o;
	Sun, 26 Jul 2026 19:45:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4nL-00000001XRA-1Wji
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 19:45:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH765b721541
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mFB+5HFwxjcBF8nxAOBQAVq/5co4FpjrWYEcC8BPX/U=; b=RYq92HbspOx5vU17
	JetxowafCZlDu33IKFNBayiGfASH4BIJAd7ogNrCV48QtcRGjPMV6j7Z2Ck1l8em
	Hl2Kp6HG7maOo13EA/TcCaIaaBAIzaxUmbyyNehNlG8Qv7nruPAhoWqeH5KuyCWg
	8siiNh7/Oh4ax6PSKaDeB9Ggg2CgO5J2g3/yZWVgtEgvYKoAPjbCpHueMQ3eYacg
	G3CC9BgwRJQCu85Zzrvazf0v42Gr1CFogUir5XFlTYSrcrLesOjiAKoyWpMMfhtE
	Ibj+gzFzwqIBBzZQ2lVt18UZisWcVxOSHjOftvOvlxxN2ObJ1jtXqKbV6U7oSZ6H
	xKZ+FQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajkcja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:45:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso2828426a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 12:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095154; x=1785699954; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFB+5HFwxjcBF8nxAOBQAVq/5co4FpjrWYEcC8BPX/U=;
        b=FoO/YDD2zkO0dyVPz25/2+iKQhzOP+TVPN6mjq1RdM72gietQd3EO4S5D34M/tfk/P
         8Oc/1e4qW/5D7674MJT0Hl4yIRO3V4jnSLLCki+X6OdOddzbl/dShpwWC5hiw0GJ/xC2
         QlQOnZdLTuFf2Z20uxMizyFATZJFDbOCxA3VygoBgM7vdjrnnr0rAYl27eracZ1Bo005
         WRDO38ToArdChxRhPtJVUudgjOgZnZwrMusFUCW/5yRZA8XLYaVLPhwgA8SCLRtCNgUj
         ZkMGT5cHvDp8ePQA3d29d0x2lEdiYzya3AEk3s1yLVdu2QW+bY8gy8F+F+GcY6zHHfaX
         tKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095154; x=1785699954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFB+5HFwxjcBF8nxAOBQAVq/5co4FpjrWYEcC8BPX/U=;
        b=A1aRnUCXTtj1eCj4RXuu2AJWXuDiymkife8Kpi6orbdy/Z9rcd75KMWaqLbDDD8aNZ
         xhgN1vkhMyQWjD96sJW2U60ggSEU+zzcUuzXGZnfz6d5XTlVGNi5xbt9ky/o5QHX/lTF
         Wagj5Dk/BpoRsuG2SdKL3anZVZdNu/JPangfI783IbkNrE8ugC3NmvC3ml6G55Dm4l8m
         Z1PdF6FT0pEtVyupn72ceIoqZhMCOOAo5Xj0z3BZfATYBBcajnHRBbnv14BGOsE6PlYH
         6arjJyuaEU9WcxJVo+DgIW6NaKiSiTH0TLWY6pJ/VGWw505Hy687cVyBElQ82C2u6hmc
         FHYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyJ7W0XHlxr2ECsBw66XTiHqnMLXxjb3soRE8nuUWS9E4b+rMC28ZYjTMxFqJ8WOkJ22h3eQGBf2D1mKPsml7A@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrn9HyWqJUQ9bUQTCldJjZWer9chmEt3eqJefO+YBgaTqag4M/
	d6rFDCFjVyFWbHCQ7j907JdTjL0Xur8wVa16iAYhqRx8nWeDSS5Kjy8RFMFAiND3lIlbP4l781o
	5mvfabBKVc489pCXinrYv0DcNNyj8ygNBwGbNRZ6Ne2JLfngN89iIBkLD2ApvulTvjpEankysIQ
	D1OQ==
X-Gm-Gg: AR+sD12SUHdIgF/SaVy19L+BN1sB1pa+88HCzJyS3tTvyNRipbRaGoUQ44eUaHMnVOt
	EwdB1q3pCmd9nT4hH7aMVGC3Zmwxsv7auKH9zkuD8RB4fda2gR8SMIxI1dbKvFxqjdlyCE3yhxU
	6oY6AkmT0xw1HizLKv7CkYnVWzWh0kb+VUWm6O/agA09kJD4bmyhNvz3ev2qa5FRt0h7yxzRjYm
	rvRfVK4umRRtRKObp4auRjc6SRmBGXFLqA16XfI730x8NFLLuh8VwahZLfltDh5jO1/qo7uSmqZ
	162eHY9oWL2nrh7hdmF82oS8iUX14+5ekhrAztM3rfVikRp5fIpe8XkkNiuueeauG1Z7P2gJ/pZ
	xy2gptc0GiX6yCeOVZpqR
X-Received: by 2002:a17:90b:518b:b0:381:1fd3:e4ef with SMTP id 98e67ed59e1d1-38f2961f487mr6321258a91.25.1785095153684;
        Sun, 26 Jul 2026 12:45:53 -0700 (PDT)
X-Received: by 2002:a17:90b:518b:b0:381:1fd3:e4ef with SMTP id 98e67ed59e1d1-38f2961f487mr6321239a91.25.1785095153179;
        Sun, 26 Jul 2026 12:45:53 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:45:52 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:15 +0800
Subject: [PATCH v3 2/8] drm/aspeed: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-2-cd5dc89858c6@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
In-Reply-To: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095128; l=13020;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=mji0VO0E5cTKmqauubKhD1v5gmVwNBzHkgYjdhi1xOQ=;
 b=Pdz/RxBliFWW7g2zgcJFAc6JuqVRqfnPXUsLdCSgCusv8bQ4SI/Rs0Jh55oslFypTwzYKc3iq
 qZUWGagBjH2A+Ef54nOdUoqYdodVHwFQkoj/nA5EQoNcQtDkiGZzOpG
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-ORIG-GUID: 7q1_E1nLcyCi_ykW-AkPMVTa3M9cm3Uh
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a6663f2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=x2ZSBtIQfFjOxsfsTs4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 7q1_E1nLcyCi_ykW-AkPMVTa3M9cm3Uh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX5UEGFOxnkHys
 GU+UDU6I5D0P+wEnHuNSH+EFvKLCJEA+eG9TiP74Ku59c6ZrziI5c46tq2Ov44Ol280DnzVbYyZ
 Eb//HfN0wHCt5nfPdKHdnhdBoNr2QQZCbUKm3TEkRQPwEy0G7wjiUNflLh7/CDoYEDrY8rjrT+p
 UYEpj1DgCzOVsqiSvh2aGOIMg2XhCuJBjjczpmTNCXz/CBqU48WTBAe3cvAwtdcXgX1RzydFxSb
 EP2K8fzdN7J9OBUoj/pf8qoTMheC3ECjdMERKGSyzPPlWx9C/3pCgPm93yJBFDM3bicC2f0EtXM
 z24XjHRAR/wC5BxmxY3uPWiSmrjirnvi4VTlmev6IexJ8XutrSklzjlkwv4ssqv1BZNzgkkPAqb
 MtHbxJKL4jRLkvkUaFh/oWnCjLqYBkt+e7voGA5UkYidsmDmO0MI/xgufm6MJasgSNQS7fPJK8L
 7bsOazXMY4c+9Ur6THQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX1hAPdHFhjQIa
 I12/3Se/FJ8t+sBXjZTgcl9pKpVoVyJ4TGd45xgjqzN3nx9Y5RV1m6gSNHSLXw0mb69DO4gRrOJ
 PNT/cqK0SN8k3PGiQLr/wYzm62bWVio=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_124555_425277_A46F2169 
X-CRM114-Status: GOOD (  19.96  )
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

Replace the simple display pipe with explicit plane, CRTC and encoder
objects.

Move callbacks to plane and CRTC helpers, and wire vblank handling
through drm_crtc_funcs. Move page-flip event handling from plane
atomic_update() to CRTC atomic_flush().

Use commit-local CRTC and plane state when programming mode and pixel
format in the CRTC enable path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Use commit-local CRTC and plane state in the CRTC enable path.
- Make the aspeed container helper static inline.
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  11 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 203 ++++++++++++++++++++++---------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
 3 files changed, 157 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index 4e6a442c3886..273528d30b4c 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -2,7 +2,6 @@
 /* Copyright 2018 IBM Corporation */
 
 #include <drm/drm_device.h>
-#include <drm/drm_simple_kms_helper.h>
 
 struct aspeed_gfx {
 	struct drm_device		drm;
@@ -17,10 +16,16 @@ struct aspeed_gfx {
 	u32				throd_val;
 	u32				scan_line_max;
 
-	struct drm_simple_display_pipe	pipe;
+	struct drm_plane		plane;
+	struct drm_crtc			crtc;
+	struct drm_encoder		encoder;
 	struct drm_connector		connector;
 };
-#define to_aspeed_gfx(x) container_of(x, struct aspeed_gfx, drm)
+
+static inline struct aspeed_gfx *to_aspeed_gfx(struct drm_device *drm)
+{
+	return container_of(drm, struct aspeed_gfx, drm);
+}
 
 int aspeed_gfx_create_pipe(struct drm_device *drm);
 int aspeed_gfx_create_output(struct drm_device *drm);
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index 7877a57b8e26..e8c9a6040d75 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -5,6 +5,8 @@
 #include <linux/reset.h>
 #include <linux/regmap.h>
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -12,22 +14,17 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_panel.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "aspeed_gfx.h"
 
-static struct aspeed_gfx *
-drm_pipe_to_aspeed_gfx(struct drm_simple_display_pipe *pipe)
+static int aspeed_gfx_set_pixel_fmt(struct aspeed_gfx *priv,
+				    struct drm_plane_state *plane_state,
+				    u32 *bpp)
 {
-	return container_of(pipe, struct aspeed_gfx, pipe);
-}
-
-static int aspeed_gfx_set_pixel_fmt(struct aspeed_gfx *priv, u32 *bpp)
-{
-	struct drm_crtc *crtc = &priv->pipe.crtc;
+	struct drm_crtc *crtc = &priv->crtc;
 	struct drm_device *drm = crtc->dev;
-	const u32 format = crtc->primary->state->fb->format->format;
+	const u32 format = plane_state->fb->format->format;
 	u32 ctrl1;
 
 	ctrl1 = readl(priv->base + CRT_CTRL1);
@@ -77,13 +74,15 @@ static void aspeed_gfx_disable_controller(struct aspeed_gfx *priv)
 	regmap_update_bits(priv->scu, priv->dac_reg, BIT(16), 0);
 }
 
-static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
+static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_plane_state *plane_state)
 {
-	struct drm_display_mode *m = &priv->pipe.crtc.state->adjusted_mode;
+	struct drm_display_mode *m = &crtc_state->adjusted_mode;
 	u32 ctrl1, d_offset, t_count, bpp;
 	int err;
 
-	err = aspeed_gfx_set_pixel_fmt(priv, &bpp);
+	err = aspeed_gfx_set_pixel_fmt(priv, plane_state, &bpp);
 	if (err)
 		return;
 
@@ -139,48 +138,35 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
 	writel(priv->throd_val, priv->base + CRT_THROD);
 }
 
-static void aspeed_gfx_pipe_enable(struct drm_simple_display_pipe *pipe,
-			      struct drm_crtc_state *crtc_state,
-			      struct drm_plane_state *plane_state)
+static void aspeed_gfx_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+						 struct drm_atomic_commit *commit)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct aspeed_gfx *priv = to_aspeed_gfx(crtc->dev);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, &priv->plane);
 
-	aspeed_gfx_crtc_mode_set_nofb(priv);
+	aspeed_gfx_crtc_mode_set_nofb(priv, crtc_state, plane_state);
 	aspeed_gfx_enable_controller(priv);
 	drm_crtc_vblank_on(crtc);
 }
 
-static void aspeed_gfx_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void aspeed_gfx_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+						  struct drm_atomic_commit *commit)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct aspeed_gfx *priv = to_aspeed_gfx(crtc->dev);
 
 	drm_crtc_vblank_off(crtc);
 	aspeed_gfx_disable_controller(priv);
 }
 
-static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
-				   struct drm_plane_state *plane_state)
+static void aspeed_gfx_plane_helper_atomic_update(struct drm_plane *plane,
+						  struct drm_atomic_commit *commit)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_framebuffer *fb = pipe->plane.state->fb;
-	struct drm_pending_vblank_event *event;
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct aspeed_gfx *priv = to_aspeed_gfx(plane->dev);
+	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_gem_dma_object *gem;
 
-	spin_lock_irq(&crtc->dev->event_lock);
-	event = crtc->state->event;
-	if (event) {
-		crtc->state->event = NULL;
-
-		if (drm_crtc_vblank_get(crtc) == 0)
-			drm_crtc_arm_vblank_event(crtc, event);
-		else
-			drm_crtc_send_vblank_event(crtc, event);
-	}
-	spin_unlock_irq(&crtc->dev->event_lock);
-
 	if (!fb)
 		return;
 
@@ -190,9 +176,9 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
 	writel(gem->dma_addr, priv->base + CRT_ADDR);
 }
 
-static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
+static int aspeed_gfx_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+	struct aspeed_gfx *priv = to_aspeed_gfx(crtc->dev);
 	u32 reg = readl(priv->base + CRT_CTRL1);
 
 	/* Clear pending VBLANK IRQ */
@@ -204,9 +190,9 @@ static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
 	return 0;
 }
 
-static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *pipe)
+static void aspeed_gfx_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+	struct aspeed_gfx *priv = to_aspeed_gfx(crtc->dev);
 	u32 reg = readl(priv->base + CRT_CTRL1);
 
 	reg &= ~CRT_CTRL_VERTICAL_INTR_EN;
@@ -216,12 +202,93 @@ static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *pipe)
 	writel(reg | CRT_CTRL_VERTICAL_INTR_STS, priv->base + CRT_CTRL1);
 }
 
-static const struct drm_simple_display_pipe_funcs aspeed_gfx_funcs = {
-	.enable		= aspeed_gfx_pipe_enable,
-	.disable	= aspeed_gfx_pipe_disable,
-	.update		= aspeed_gfx_pipe_update,
-	.enable_vblank	= aspeed_gfx_enable_vblank,
-	.disable_vblank	= aspeed_gfx_disable_vblank,
+static int aspeed_gfx_plane_helper_atomic_check(struct drm_plane *plane,
+						struct drm_atomic_commit *commit)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc_state *crtc_state = NULL;
+
+	if (plane_state->crtc) {
+		crtc_state = drm_atomic_get_crtc_state(commit, plane_state->crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+	}
+
+	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
+
+static const struct drm_plane_helper_funcs aspeed_gfx_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= aspeed_gfx_plane_helper_atomic_check,
+	.atomic_update	= aspeed_gfx_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs aspeed_gfx_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static int aspeed_gfx_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
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
+static void aspeed_gfx_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+						struct drm_atomic_commit *commit)
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
+	if (drm_crtc_vblank_get(crtc) == 0)
+		drm_crtc_arm_vblank_event(crtc, event);
+	else
+		drm_crtc_send_vblank_event(crtc, event);
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
+static const struct drm_crtc_helper_funcs aspeed_gfx_crtc_helper_funcs = {
+	.atomic_check	= aspeed_gfx_crtc_helper_atomic_check,
+	.atomic_enable	= aspeed_gfx_crtc_helper_atomic_enable,
+	.atomic_disable	= aspeed_gfx_crtc_helper_atomic_disable,
+	.atomic_flush	= aspeed_gfx_crtc_helper_atomic_flush,
+};
+
+static const struct drm_crtc_funcs aspeed_gfx_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= aspeed_gfx_crtc_enable_vblank,
+	.disable_vblank		= aspeed_gfx_crtc_disable_vblank,
+};
+
+static const struct drm_encoder_funcs aspeed_gfx_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static const uint32_t aspeed_gfx_formats[] = {
@@ -232,10 +299,36 @@ static const uint32_t aspeed_gfx_formats[] = {
 int aspeed_gfx_create_pipe(struct drm_device *drm)
 {
 	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
+	struct drm_plane *plane = &priv->plane;
+	struct drm_crtc *crtc = &priv->crtc;
+	struct drm_encoder *encoder = &priv->encoder;
+	int ret;
+
+	ret = drm_universal_plane_init(drm, plane, 0,
+				       &aspeed_gfx_plane_funcs,
+				       aspeed_gfx_formats,
+				       ARRAY_SIZE(aspeed_gfx_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(plane, &aspeed_gfx_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
+					&aspeed_gfx_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &aspeed_gfx_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, encoder, &aspeed_gfx_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	ret = drm_connector_attach_encoder(&priv->connector, encoder);
+	if (ret)
+		return ret;
 
-	return drm_simple_display_pipe_init(drm, &priv->pipe, &aspeed_gfx_funcs,
-					    aspeed_gfx_formats,
-					    ARRAY_SIZE(aspeed_gfx_formats),
-					    NULL,
-					    &priv->connector);
+	return 0;
 }
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 46094cca2974..b2d805f0c16d 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -21,7 +21,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_drv.h>
 
@@ -130,7 +129,7 @@ static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
 	reg = readl(priv->base + CRT_CTRL1);
 
 	if (reg & CRT_CTRL_VERTICAL_INTR_STS) {
-		drm_crtc_handle_vblank(&priv->pipe.crtc);
+		drm_crtc_handle_vblank(&priv->crtc);
 		writel(reg, priv->base + priv->int_clr_reg);
 		return IRQ_HANDLED;
 	}

-- 
2.43.0


