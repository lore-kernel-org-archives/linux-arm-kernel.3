Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F72CC43602
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 18:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9o/IQZq06TE0+/STQz+x6iRc27qZ5OMF6+HG6X3OyU=; b=RKsxqS1RPh0ZaFGEkTo6uSTaor
	h3tFLBg7xjN2iJ1KOAIBs/GQIS3VtJ7/2pvBgzIs727nVLNtNokzSt5AydzERpe0+0mTbnsMsm7B8
	bo0G091kLQjuFEIuWmLyg4lk173hpsW0xBLY5cTOvX9Rr97T3racd7i8lE2LBk2mCsSalHJH06tVn
	0kn9MMJywtutw6uBKDF4/T1f91SvIdDAknyxcZjwfwAKE4DQwElNv2nKt7OXwYWF+srFMo4kAHqhf
	A9sXgeKDBSZ3fwxXJHerEgpPnfyaRCI51i8OBVvEUlQ2uXDYlqA9JXZrUtPqUc2ITUvB2Ac799lcR
	YcDofSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5B9-00000008fKT-0roQ;
	Sat, 04 Jul 2026 18:33:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5B6-00000008fIR-2Kd6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 18:33:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664G8Tle3294156
	for <linux-arm-kernel@lists.infradead.org>; Sat, 4 Jul 2026 18:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9o/IQZq06TE0+/STQz+x6iRc27qZ5OMF6+HG6X3OyU=; b=JAoIYFLieW2sulob
	8aKS9YKc17lyfb7CkmeQiYpno8SQEG5nYVlB2llF6oJ6jwMVnyQ3d+KGfvB4W4DH
	GZyHLai4/8DV1JBbnmoHe90LsTRqlQS3Nu8VfpFis3FvhONuKHSAhKid03HvVmcF
	BR7uU3TTQPutgDXECfOEHCyox2dbQiV7g+MKxnrcBmUQcur2B8CxZSmdFWoJJYmG
	TJB4Pk9pQPuqNJlT9bQxqfANLuIW771S6dai19iy1YU+s2AVfvymkJk6qipOrE1y
	b1+ByW4lEXfIKKI6m+ZVxSF5QLjt831FP0iy6aX8qC91V0Td7yh/ILPUkmBNWF3A
	ykGHbA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txeh99p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 18:33:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8478e9c4bd2so1568913b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 11:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783190003; x=1783794803; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9o/IQZq06TE0+/STQz+x6iRc27qZ5OMF6+HG6X3OyU=;
        b=kNkzZMmZs8eVcrKgol+QzXJf27ZtEk9pJWq3ad+6bF+QC9ahwJhdcH3cL2j6FuR2QP
         JFt2DaD8XvGmjD5O+c36TIcoyft8cKTw45JJzZhhJVW2cyiE55rFfMW864y32Pm6fOCv
         MxPiOHCSwIcYSV6W0ulX9hJwV1s90WjWD2MH0IrSpc3SBxXjB9wSz0g30CmVuUFzrETy
         6JuE4ikZCtpIIixnaVI1qiX3ZfAeibcGEmg4N+c+0sVEC5hONOS6fG3N1tdlwmdcKtpt
         b3fChbO/4zzsO5xUCiLK0qvkaVEmclZa8ZU5CMZKWupwIwmsj3N654oLO3l7npGZusm8
         H+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783190003; x=1783794803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9o/IQZq06TE0+/STQz+x6iRc27qZ5OMF6+HG6X3OyU=;
        b=NkC6ZkrcAV7t8gmCc0TLqC7BGdsgBW1Za5cvSniAKfYpm7NCZHGT2lyeRLG0wuvzhl
         jFuSJsXfiv0oc7tghNQyuOrRueHw+S+SjLopqjWD9qiJbCeGjyG3SvSHfktAB03loTIH
         w4gmOvqi4cvNNn09YgpQbz/4IaVmZTKSIlC90zLAeQLYM7AzxhiNbEgZ2IbH+j3rqLgW
         Scd6vNmrqMs67X6eCb74T/r5BReTurvt9KoULaLCDwswh2rdF1hzx20BsjUg33Z00u7J
         dC2NZdZeaVs/Q4THcxekYrOQNW0dv2zSRznGpbJG6GZQ5ajwmuozw2QwjwnWgIKT7KXt
         4z5g==
X-Forwarded-Encrypted: i=1; AHgh+Rq8SZA0nYEWWB3on5B7T0CtFwZd4/dbzpNCQWfvTVD3pyl7Ao0hWff4vDmchXGi9iZuqR13pY+Yd62eutTz1hLZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxvAj3MtDdNITM08OZo/vzTwN9mvip9vsB2lLLh5iT2rxXlJ8yV
	SE5oBcbdOtAYv72BdSeujio2r5GxbFCsu4nmIUQqBPK65otyKHgeHMsDTPEoPXdhWdEwVOUYnRi
	L/TK0Mct4b529XOo0YxJdCYIQ3wCCU51PyTG5+jwdZiP6o7DmhknCbrqCBN1dZYG4bBzHIvwcaj
	BY7Q==
X-Gm-Gg: AfdE7cmkY5gB/YMnZ169rqNOt05OZyHRHY3ycr7xh/QtaWoxypePC2lwLYx/fMqOZQw
	aL6FZIvLkzEfCPm/aav/YufkiaeKu3tTYvThYEbu7C0nylaB45waa8fQDGlIotxYWcijCdctnVy
	fEQg7E65OBr5EExBmISuDBuZhbTgziBly2TyUMW4Cihi+qsUEGl9Sb1jCrymKU64DTvoB0qb3RM
	Z4fG6STHPrhdKSVfhA3lM8N7tpZK2bYXcrunfruICg18G6O7qg3Yw5XmdseMiX23BccOUHOLo+f
	oUM3C2QIKQXEXyt0aFZROiRPAWnGv129ddhNR4/1IgDQTAPoCCANmo71/ibYb8cab9cG0vCNEJ2
	sTh0TpUmfxzTNpvMJ/XTCDVw=
X-Received: by 2002:a05:6a00:1399:b0:847:9518:a6fe with SMTP id d2e1a72fcca58-847f6dd54b8mr3903003b3a.26.1783190003089;
        Sat, 04 Jul 2026 11:33:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:1399:b0:847:9518:a6fe with SMTP id d2e1a72fcca58-847f6dd54b8mr3902984b3a.26.1783190002572;
        Sat, 04 Jul 2026 11:33:22 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:33:22 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 02:31:16 +0800
Subject: [PATCH 7/9] drm/repaper: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-simple-kms-removal-v1-7-b4e1ca053623@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=7683;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=X0UwoE9ZxeInLb/TsbQTXm8HFa5R2/0dvM/cIQQ4UA0=;
 b=3r4r5kIqIqgZijf/Kqr49p7Qlhtwg622PqfbalukoH6sC56FcuoGH9O2XainORoxzzo+57CBd
 48iBMIor2dOCYnCxiNIqiB3V0iSu79Fbb/lbiQqldwHfi0N4kpAgnXv
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX5kSVRly5JUYY
 bm+B5yhqSCBVRmjiTZFM7H8FhfYjdhhnIlP8o48OMF9hmFsS7O2hYn28jMkaLIAhZREZVXWdvnW
 zFG+i2SC7InAbsAh/NIIj0+T28JuCoc=
X-Proofpoint-GUID: PLmtHwqFh6hCKowmb_7ux2yjPNmoHmck
X-Proofpoint-ORIG-GUID: PLmtHwqFh6hCKowmb_7ux2yjPNmoHmck
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX6WFt5fqJ8fDU
 lNhXlm+r74YUk5V6FJpAEhwEsOv9HWnM5kJ+84IrxjRLj2XRf021m4eZH6Ha27Q+1eyRqJVq2Bv
 mNfL7gMAU5RIQvXVzIBdH+Pd5qV3mMCsKjM6LiU8tE/pnHRkGSYYQjO9WuutnadTYSwDm84Wwq3
 bXWAQ/aH5kCn4NNMFt7nksidYsU+9uDBWOwfEnR5jAZTOpUucVnVupjz07mS51OsRN7ZhzG0GAs
 MnfeMdwEAm9ueL+IRVNCOjmPVNmGE6W4DR/N4GIlgivXhajyJCiVZkxPlMugmBy1LmvH7BtPpQ5
 03ioiM3YCai8yIkI9Hre/71bSy8zchH37yDKN4SSBX+1xNtljid6czfQCUwv7ry+rPYFVExUucQ
 3PdRlNq1FaAiVpYxjUOUDDkbYRBVBzk3vkLl9q74qZw3K6lT6jLhTgQng/bYTcHleE8XY+SvStO
 OwIRWjgiwhWcM5qLOcA==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4951f3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rSXZLFMjQQqjKu18WoMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_113324_604093_FDED7105 
X-CRM114-Status: GOOD (  19.89  )
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

Convert repaper to explicit primary plane, CRTC and encoder objects.

Keep shadow-plane helpers, framebuffer access handling and no-scaling
plane-state validation from simple-KMS path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/repaper.c | 130 +++++++++++++++++++++++++++++++++--------
 1 file changed, 105 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index c8270591afc7..23be9c762803 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -22,6 +22,7 @@
 #include <linux/thermal.h>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
@@ -38,7 +39,6 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #define REPAPER_RID_G2_COG_ID	0x12
 
@@ -65,7 +65,9 @@ enum repaper_epd_border_byte {
 
 struct repaper_epd {
 	struct drm_device drm;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	const struct drm_display_mode *mode;
 	struct drm_connector connector;
 	struct spi_device *spi;
@@ -622,26 +624,24 @@ static void power_off(struct repaper_epd *epd)
 	gpiod_set_value_cansleep(epd->discharge, 0);
 }
 
-static enum drm_mode_status repaper_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
-						    const struct drm_display_mode *mode)
+static enum drm_mode_status repaper_crtc_helper_mode_valid(struct drm_crtc *crtc,
+							   const struct drm_display_mode *mode)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct repaper_epd *epd = drm_to_epd(crtc->dev);
 
 	return drm_crtc_helper_mode_valid_fixed(crtc, mode, epd->mode);
 }
 
-static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
-				struct drm_crtc_state *crtc_state,
-				struct drm_plane_state *plane_state)
+static void repaper_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *commit)
 {
-	struct repaper_epd *epd = drm_to_epd(pipe->crtc.dev);
+	struct repaper_epd *epd = drm_to_epd(crtc->dev);
 	struct spi_device *spi = epd->spi;
 	struct device *dev = &spi->dev;
 	bool dc_ok = false;
 	int i, ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(crtc->dev, &idx))
 		return;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -771,9 +771,10 @@ static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void repaper_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
-	struct repaper_epd *epd = drm_to_epd(pipe->crtc.dev);
+	struct repaper_epd *epd = drm_to_epd(crtc->dev);
 	struct spi_device *spi = epd->spi;
 	unsigned int line;
 
@@ -827,14 +828,15 @@ static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
 	power_off(epd);
 }
 
-static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
-				struct drm_plane_state *old_state)
+static void repaper_plane_helper_atomic_update(struct drm_plane *plane,
+					       struct drm_atomic_commit *commit)
 {
-	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_plane_state *state = plane->state;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
 
-	if (!pipe->crtc.state->active)
+	if (!state->crtc || !state->crtc->state->active)
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
@@ -842,12 +844,72 @@ static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
 				 &shadow_plane_state->fmtcnv_state);
 }
 
-static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
-	.mode_valid = repaper_pipe_mode_valid,
-	.enable = repaper_pipe_enable,
-	.disable = repaper_pipe_disable,
-	.update = repaper_pipe_update,
-	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+static const struct drm_plane_funcs repaper_plane_funcs = {
+	.update_plane	= drm_atomic_helper_update_plane,
+	.disable_plane	= drm_atomic_helper_disable_plane,
+	.destroy	= drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+static int repaper_plane_helper_atomic_check(struct drm_plane *plane,
+					     struct drm_atomic_commit *state)
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
+static const struct drm_plane_helper_funcs repaper_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check	= repaper_plane_helper_atomic_check,
+	.atomic_update	= repaper_plane_helper_atomic_update,
+};
+
+static int repaper_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					    struct drm_atomic_commit *state)
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
+static const struct drm_crtc_helper_funcs repaper_crtc_helper_funcs = {
+	.mode_valid	= repaper_crtc_helper_mode_valid,
+	.atomic_check	= repaper_crtc_helper_atomic_check,
+	.atomic_enable	= repaper_crtc_helper_atomic_enable,
+	.atomic_disable	= repaper_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs repaper_crtc_funcs = {
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs repaper_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static int repaper_connector_get_modes(struct drm_connector *connector)
@@ -1102,9 +1164,27 @@ static int repaper_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
-	ret = drm_simple_display_pipe_init(drm, &epd->pipe, &repaper_pipe_funcs,
-					   repaper_formats, ARRAY_SIZE(repaper_formats),
-					   NULL, &epd->connector);
+	ret = drm_universal_plane_init(drm, &epd->plane, 0,
+				       &repaper_plane_funcs,
+				       repaper_formats, ARRAY_SIZE(repaper_formats),
+				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(&epd->plane, &repaper_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &epd->crtc, &epd->plane, NULL,
+					&repaper_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(&epd->crtc, &repaper_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, &epd->encoder, &repaper_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	epd->encoder.possible_crtcs = drm_crtc_mask(&epd->crtc);
+
+	ret = drm_connector_attach_encoder(&epd->connector, &epd->encoder);
 	if (ret)
 		return ret;
 

-- 
2.55.0


