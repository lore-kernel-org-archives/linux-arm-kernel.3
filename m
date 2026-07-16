Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E3EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iNA4KkLXptEcrV9SWqVHRxO4EssLZecMFzgSPlpRjI=; b=rS17B+a79jBOk1bczHXsRjlOOG
	e0FuTPGzx04yyiWMxg5WkTXMefhfSUcvoaCcKJ0559KIedrr0voM2P4cTtC/H9QlS900FglDIGF+t
	vdfC52AigfOPzDkPVjJXnpLZJ9P8DT3QBH12WOebPWaTHtrsQa/jG/xUYXZtKAS32my7M02rIgMkK
	mE4cbl7KbJa8/PXRY7E3NMXouhShRAqvui7MlEhFL8L8Fz3DaYxcBRv77zItIiOtO9Y4OIAbs/aiv
	AeLd7prE8ZXgU5hL2lC7eMdgZwaAYwmlFut1AlX8V/NtDG9QnJktcoeTrQEkD0MS80C5M/wziQxqb
	IatkNCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkI0I-0000000GoH7-0k45;
	Thu, 16 Jul 2026 09:03:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkI0C-0000000GoBf-12ba
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:03:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7E3dr1883856
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iNA4KkLXptEcrV9SWqVHRxO4EssLZecMFzgSPlpRjI=; b=jmdPtyHrCF2ywVB5
	hrIupyUZanurfxmEAAZZ9jT2a9GiC7DNBF9beXbCihI0oOgPiHl6BO02ffL65YC3
	Ml8DHtUml5SlEAFpiJH/Dtb/oMSdbQmCltUTV0UCcBQzR6i2nSupZUHzgs53gvpf
	0CuwKKNG6m/2oUZwVF1Fxj0qGjRKn+D5sauSFkjNF3N0YaT04xnKd2NO1uwOBkIi
	7jGDbMssRNsnFvcksJU8BVY0/XvgQQMlH4mgG3CboAdbQk/WVYgn+vnXsWdCZfnv
	1lr0LgmPqqPkzSGIBnWZL8F3BCDLwKEn+Jq16zrFVDveUw8Rq0C7x0JhFggTEvZv
	UBiZwQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvaxf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:03:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccafc5e82cso39850485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192611; x=1784797411; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9iNA4KkLXptEcrV9SWqVHRxO4EssLZecMFzgSPlpRjI=;
        b=fOzA+HJpWCVbMRewBZ4DRKXyTqW8GBtjLLkv7WCeBtJLECrgBPhc67zDmuwD9VMVCm
         w21xJPE8xt6SJcqbGmqW/TDHGXRa+BU1Zc4hng/SHvxCD7PMf/7Bp1Ez2KRR52dkHChg
         IEUX5zB+BcQOUBfeHkEk+bxcjwQtwp6PFnwk6m2ibx67ZWqtqCv9XwjVD2gLH32P16PJ
         9/UxlxeUKORmFlNsC9cjKxN70NbQcNok1gxnaV8/nYLt8yO5XU6d3KQMCoIuGdD0vVQb
         xuy4Y9CpHvFLLbPRwaPGD+rIB2O9jSUb7ZLeee+9Isqp33bZc62lo95IELkT+Hs+B9tx
         QpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192611; x=1784797411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9iNA4KkLXptEcrV9SWqVHRxO4EssLZecMFzgSPlpRjI=;
        b=WmJuOmE9UnhSDt/2sTe1SE77bX/4Pq8YVCpvUKt3VWvhGc/MrMYyFMBm5oCGlMQ50t
         bTzUBGImmuzEsnttI7kYKCT5kVeUgPB0gES81kD8isSn6gCf26q2PP5JKoqcJoRCEq4y
         3JhvM/kaF+pH8/lKxtqlektDScIYHeQmlVKnBwaCrv5pI42HRQUfDkbSd1WWDViITndE
         OKcKV5gpq16aSJfzS+RXu8Sp8g05OBZ9QIYAFA1cigHdxninxaMKovx/HXcvHGo5Vpub
         vmyq57BL2jH1dJUI2RbDtDySgm/ZFamgxwvtFQ+1Njn7KAtwQacFMCFGRnu86ofbqxd5
         9Faw==
X-Forwarded-Encrypted: i=1; AHgh+RqnW86APFK05LW0uT8o8V4NjmEaOEABgSAHf2sG/8hGw9UQpl+vskmQ7EZZXK+y9XVTIhI5SRJ9vY/OzhgDGF2a@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy0P6eHjV4Ii2yi2H9nxcs7nrBONSnGPyqyzLzvckiGY5mJUVW
	Ci6g20YvX8nQzWcGHMqRdO+NU84S+LlH0q4EUcftUpKctBtyYNC+aI9mphlk2S3XUgl3D/lbzCp
	dBlTxpwCnGFtAWO7uQkiW3WBBcvq3F1P6mM1majT+rIWMp6hFS2z67aVQOzRCCgoNmAD6d81vpf
	YkhQ==
X-Gm-Gg: AfdE7cn8WDNY8AHBsqW2uOA5pHSLNn2t4cit23WCPoMom1m2JJ8AS/E71DnAtWBisuu
	AgIFj/Ivj/12XHf4r/mtcFeBdBvjLmdmjbR1HmgKiRvCDshfCDp2V7TIxP/rLCGVU28BJhynHcO
	t4D2vAT5+/mztw0diIFotwbrgxg3NI7XmV4ndhedwbBCrFu6SaYJEm5OTAyyjxdmwjiXGkW1c4c
	tosUOQJJNc9w3HNyP6y93EgN3xn3ypAAxRZDptvLnTpgxYJF7LCAE/iFWvDBGZMtqRs8QuDY2Yr
	69CplICONxPK6DMUc3C4PGdTFEGQ4CJNkuk1Ca17T+IRdmcIUuQluGqGKNS1PnfpRCSnfG4hAL1
	JVIzuKAjY91iDnG7hPrgt
X-Received: by 2002:a17:902:fda3:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2ce9e9ada87mr215357855ad.19.1784192610938;
        Thu, 16 Jul 2026 02:03:30 -0700 (PDT)
X-Received: by 2002:a17:902:fda3:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2ce9e9ada87mr215357475ad.19.1784192610502;
        Thu, 16 Jul 2026 02:03:30 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:03:30 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:01:58 +0800
Subject: [PATCH v2 6/8] drm/repaper: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-drm-simple-kms-removal-v2-6-1133a8fc3785@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192560; l=7829;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=ERhc4h2BzyHq4SLA1KLZmwEBYZNamx9DmYFgd02zfJM=;
 b=BatRP4ZlOB9sgvvfbYOlQ/D1wW3PwwrZ6A1gMipy1O2m71Q4YyK+bKZTb/u3/NYEQiEn6Dhv6
 uZCR4AWmSRVD/lNWPgDwsLkctZsl2PnzSt6mINbJ4PIs6X8p3eiyZg+
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a589e63 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rSXZLFMjQQqjKu18WoMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX3vIcG+zjp049
 JjaLdvgvRpZvUx+DcXTsylqr8WelOXUSCibFcsTzAlOeeNkYNzwmW++Du2CeHxAvVY2AED+seke
 KwpoWke8BgfYLNXsObY9OteEm6JHgBBtBBRgw8DXlP3ZuosG64NKUR31hlSgqn92oMbRbt6Ly54
 hKVLZHHF22btOhnuum6wJTG+iB/UwQgUb63ep06veRxim2eQXp0SB3fGgpWhFcaHyVph089fdbW
 P0JKJiRONeWex6Loe9EPNScGQC+8jbB0S+y3RnQRWelI2Fih3zhYEMdd5cZFmhCGborTsxar+E7
 N7XfSpdVpIO+aAV+BeoDrj04Q9+egiU9VXaS+r6/kXPxBmzr934ssMv51mQyCuLm867KJGpBaIC
 KzT0i1nWPGqIb8Aa/lJc9NavolyszdlAe9UBczHRVblyhgg/j0THQ6XYytQQV61QhmlVP1t9XAo
 cYsV6xXTqiZLzikarKQ==
X-Proofpoint-GUID: DU-LpM51juI-eqIbQ1pRgrzJrecZq7AR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfXz50QPrT920YA
 3Z5dyStZlPD4ISwSq1yaZPZZZDubY8RYk1nt3aq77pvR2Hmgnfob1tC4TCZZOQ/aa1yN27U+Riy
 wjgam2r++TT96RWSCgR959vl9K3uHgY=
X-Proofpoint-ORIG-GUID: DU-LpM51juI-eqIbQ1pRgrzJrecZq7AR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_020332_342980_C52552D9 
X-CRM114-Status: GOOD (  19.15  )
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
 drivers/gpu/drm/tiny/repaper.c | 132 ++++++++++++++++++++++++++++++++---------
 1 file changed, 104 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index c8270591afc7..7057075161c4 100644
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
 
@@ -827,27 +828,84 @@ static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
 	power_off(epd);
 }
 
-static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
-				struct drm_plane_state *old_state)
+static void repaper_plane_helper_atomic_update(struct drm_plane *plane,
+					       struct drm_atomic_commit *commit)
 {
-	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
+	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(pstate);
 	struct drm_rect rect;
 
-	if (!pipe->crtc.state->active)
+	if (!pstate->fb)
 		return;
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		repaper_fb_dirty(state->fb, shadow_plane_state->data,
+	if (drm_atomic_helper_damage_merged(old_pstate, pstate, &rect))
+		repaper_fb_dirty(pstate->fb, shadow_plane_state->data,
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
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
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
+	if (crtc_state->enable) {
+		ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+		if (ret)
+			return ret;
+	}
+
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
@@ -1102,9 +1160,27 @@ static int repaper_probe(struct spi_device *spi)
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
2.43.0


