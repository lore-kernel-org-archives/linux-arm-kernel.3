Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F84CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 18:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGXwZHbQah8WajNXtsa2tZqdRDir4hma/P5IIaHQ79g=; b=ot6+WZRb7BV+58Yn2wnLiL03KP
	/cmQX9f4krszU+YUdEBG0/T/XQ1W+KJWHJDaoDNmGF/6W/SHqBcYTyl84KM0dZNTqB68JvyLUWuBB
	PIkClcEXJZxbT7bohp/Oby+QzQ/z+TQaMGbx1kWW8YhNYEzWQpcfdQWgw97GCzkkyMKJKthIFPOc/
	FZMLH3btaQgzLei1cC4O4iSLXvlj/5n2GZDZOO1FdzcGbLWR13jWoArsenCMx9pHutJvrm6Jy8zdW
	s38xAq4kZaAATBoyHQDXVe5xX6zNjn4WklwLwyNRyX4pq0AxRQCAJRGtr0c7nRva7xI+g31mzhoe5
	sGa4mSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5BK-00000008fUo-2uBH;
	Sat, 04 Jul 2026 18:33:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5BI-00000008fSt-1hko
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 18:33:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664G8kqG3294483
	for <linux-arm-kernel@lists.infradead.org>; Sat, 4 Jul 2026 18:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGXwZHbQah8WajNXtsa2tZqdRDir4hma/P5IIaHQ79g=; b=ECvd+FOX6m7m+uK6
	znPdHfToJCGz5vNdP6tV4GzW8+gWG/emNUZmGO/Rxywzfrha5unEY40pl2LXO59h
	7JXv5BMnvdyYquNsxkHqexO5Aqt/ozoQqMvQZkR6SmIcjSk/KX09cknpXg/SmD4y
	hP6befM9yAWltSsaHmCWvED4/fNXwWB77sN5NX05AUqZLG70NP16/tIDoYPnLcE2
	EH04DJfiCX6/0wgXIsEVPx0mePP3/mRq6UkdeWFfub4bU+t6MlFqgUKWB0nt0To0
	f3F3hcil7VXRNQY8Rzd+7aj/3W2ujxhjIQiNl0U335fTz9dmXSjkNMM560EDCcCr
	drpp9A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txeh9ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 18:33:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8478ff5d801so2820459b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 11:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783190015; x=1783794815; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGXwZHbQah8WajNXtsa2tZqdRDir4hma/P5IIaHQ79g=;
        b=HNGQ3s0yeHF7t0dXjwK9W7lbBrYRtDGvpDGIkHK98vWvpreXVVDtdD08Yx1dTl9FWZ
         Qi6oZ6Hzgs+hi2EDO1llCeG2WRGWfctrxe02H01cmYtYpTLkGUiloF1WYGCPgqJevq+q
         GoKzUj5JXG2CAFZbU+13A0vmkhp79qnAh6IWLCxYWGI3/Ftnfhfb+eBUcNYRXVZ8JJy2
         ntNqX/8aqNo7uhBiqDslI/NPVykZb5zr1h3SKebBEvSVr0nv8sIs+pBn/CfZYtru7iWn
         bMLKckqMOO5wOYWZI0eCNMeugHuFt+Wb0L4Ramns/vHdiEFf8YN271k5DQnpGmnlbVLx
         oPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783190015; x=1783794815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IGXwZHbQah8WajNXtsa2tZqdRDir4hma/P5IIaHQ79g=;
        b=ZJrk6wNLRfA4tQIubPlo/5SF9Zcm2+NBUibI+sj04lDHfpONV6ET6HViKBCyzB5D7L
         wBWa2zDc6mb8iGEpEhXzL73AfnZY4jKrs5satWa9AT+UGRf7z+Y7VJrkpP63bz1XEMVg
         FS+ZjpVqo0vhnMc4dn47gl4AzuruPxROMtPTBr1mUXt2/CCOkcPlnc3WoqWqzrEdk++y
         f+rpNSe8G2Zhy/dZSH282trqjhSw0WaMGDhLGXosIjkX1+wQr28C8ad6fpvJ/a760QTX
         rNYvHuPk/gK4zNeGhDD4I2MZD8PnMLRRd5O/D+MjDEXD4FddE5yTxTHx45EN+urXl1Qa
         uzrA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9W6GQY2/sP5E/jLsSHLiaCVYCEBUZAHSfI4N0aMT+xo98Ez0IvUSien7L3kNrOau8wZGJWzMkeCJ69YZFt8zG@lists.infradead.org
X-Gm-Message-State: AOJu0YyGF787nFpw3eJz9oCqUTfvprSTL2cG8HGRHTbT5Z3Ux1WVpeTx
	MSWY0wvHMmVdZgWix74uGzl8MnKrjoMozg9SGtG7N/Af5soOAXYyje8LA1fIueJCf83/6MMHw0E
	r5TA5uSvQ5Saezn5qJQb3SEEHhM7BdYCsx0WmWdi+nh8KDLHpISVt3YC3WhdKiZwbclAY0Cp1/D
	82rk9fi3W793w1BJY=
X-Gm-Gg: AfdE7clx1QpA/sgJwbiXMkM3dxzohwGGb9/Z/lq4IYk0/MGUO40mcZl/6YKNW5qFNJK
	U+fviRav3moExJnhnqX5iqrRJSKUhEUmpnyRMwAQhEwEsS+3fXhrg4rQ7iomcWRITs+v1EJnJ+S
	NYS6al636iP4N36IUZgXPGOMVPn2YEeQY1x+3rmQH+aT2y/xp84eIvR+EZxlbxqV5eqiOpt10In
	JJiPO26JK8PPjur3SWs4TEgx4zKBLIM3bfE3f7zDiyqmrAf/LTFa8XVVzOlUxv1IePKbwyQ1vZo
	Am5AG6kGmEwSa0CZvHab4AkRPrUtu5ezPdnVsDzuva1DPQIvV1PxRnLBiEp0a2QVzFzRnKIbrh0
	Rvt9kb4HbTjzMeAK2UBCk5aQ=
X-Received: by 2002:a05:6a00:a16:b0:845:e34d:f226 with SMTP id d2e1a72fcca58-847f6da5228mr4452851b3a.16.1783190015057;
        Sat, 04 Jul 2026 11:33:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:a16:b0:845:e34d:f226 with SMTP id d2e1a72fcca58-847f6da5228mr4452818b3a.16.1783190014533;
        Sat, 04 Jul 2026 11:33:34 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:33:34 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 02:31:18 +0800
Subject: [PATCH 9/9] drm/xen: replace struct drm_simple_display_pipe with
 regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-simple-kms-removal-v1-9-b4e1ca053623@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=11508;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=jES7nUSVZBQKhOgvari+mSaMEA9hK9OzE4xbZwzc1Wc=;
 b=naeMyylZbpop3bZogsF4t3ncusoDzSV5MAr4bFahQ9OZoV1nX45pewAGKcoP51qwspHbJK4qL
 CrLEMD+vWkoAPiK+s51b/vLkl6FeLtlnVwJdSWw0mdLqi6JOcjJSi+K
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX8dk3LkOP70AA
 U5siTEv92rOUcGKzQbl9baSM94ZdkdHPWqSP00W5WFI2FKCMRGldX+iSOvnkmx7W0A+Kz/YsS7m
 d3B8OtrH5OAWgqiwg+dvNu9KRlUe6SI=
X-Proofpoint-GUID: BJrd5K1CMY7fbIaeRViNhIRxIuCPHeyB
X-Proofpoint-ORIG-GUID: BJrd5K1CMY7fbIaeRViNhIRxIuCPHeyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX1eEvg2Dh8IP9
 IQ8M7yYsSM/IeJMI9N82KJSXZqx1LNeou0VJ1RMDzu1vriLK2W5C5XJppoXLBAzRv5Nl6dJIYFd
 ZWAhWorFjIlZZssvv2oyGoId9Va9WOwmAfxozFTORZUbFGih2qfiTCSjYQtDEiwcaEFz9MYpxCt
 RPdXT1OjBW2e96Q8cidn0AnqeKTQdmvlHv8putM+akSTsfvu3IbXkaw4TVz0UJCt05AufWGWGI9
 Czndt6tqjwl2n6hUKsloQgd4X7ITF73Rl6qeXqnmz362O7VnSZwjj2zPQYxlBYyocd7PuLDn7T4
 8m26yDbRIgLan0qc8l2y2CcFWInj+A5ZmzlsOyv6wpcbgiXPpLmzr812rJoCLSCVdo8Hwi0549F
 dxTtn60kKptlF6T+nbe3YbHwSCuitZZM+Gm12nN3T2SyKQoJ4xRiWSBHj9BC2xbucmkzrBdWG6n
 92GWNpZZeXhFOamnYkA==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4951ff cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yt2wVW2Sl_HzNKkdQ3QA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_113336_460776_5D4DCC5E 
X-CRM114-Status: GOOD (  23.09  )
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

Replace Xen frontend simple display pipe with explicit plane, CRTC and
encoder objects for each pipeline.

Keep generic plane-state validation before Xen-specific checks, and
install GEM framebuffer prepare helper explicitly.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/xen/xen_drm_front.h     |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 177 ++++++++++++++++++++++++--------
 2 files changed, 138 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.h b/drivers/gpu/drm/xen/xen_drm_front.h
index a987c78abe41..02138b5abef5 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.h
+++ b/drivers/gpu/drm/xen/xen_drm_front.h
@@ -14,7 +14,7 @@
 #include <linux/scatterlist.h>
 
 #include <drm/drm_connector.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
 
 #include "xen_drm_front_cfg.h"
 
@@ -100,7 +100,9 @@ struct xen_drm_front_drm_pipeline {
 
 	int index;
 
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 
 	struct drm_connector conn;
 	/* These are only for connector mode checking */
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 48772b5fe71c..57e1bef452f8 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -31,9 +31,9 @@
 #define FRAME_DONE_TO_MS	(XEN_DRM_FRONT_WAIT_BACK_MS + 100)
 
 static struct xen_drm_front_drm_pipeline *
-to_xen_drm_pipeline(struct drm_simple_display_pipe *pipe)
+to_xen_drm_pipeline(struct drm_crtc *crtc)
 {
-	return container_of(pipe, struct xen_drm_front_drm_pipeline, pipe);
+	return container_of(crtc, struct xen_drm_front_drm_pipeline, crtc);
 }
 
 static void fb_destroy(struct drm_framebuffer *fb)
@@ -94,7 +94,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 {
-	struct drm_crtc *crtc = &pipeline->pipe.crtc;
+	struct drm_crtc *crtc = &pipeline->crtc;
 	struct drm_device *dev = crtc->dev;
 	unsigned long flags;
 
@@ -105,17 +105,15 @@ static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
 
-static void display_enable(struct drm_simple_display_pipe *pipe,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
+static void xen_drm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *state)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct xen_drm_front_drm_pipeline *pipeline = to_xen_drm_pipeline(crtc);
+	struct drm_plane_state *plane_state = pipeline->plane.state;
 	struct drm_framebuffer *fb = plane_state->fb;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(crtc->dev, &idx))
 		return;
 
 	ret = xen_drm_front_mode_set(pipeline, crtc->x, crtc->y,
@@ -131,13 +129,13 @@ static void display_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static void display_disable(struct drm_simple_display_pipe *pipe)
+static void xen_drm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *state)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
+	struct xen_drm_front_drm_pipeline *pipeline = to_xen_drm_pipeline(crtc);
 	int ret = 0, idx;
 
-	if (drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (drm_dev_enter(crtc->dev, &idx)) {
 		ret = xen_drm_front_mode_set(pipeline, 0, 0, 0, 0, 0,
 					     xen_drm_front_fb_to_cookie(NULL));
 		drm_dev_exit(idx);
@@ -177,12 +175,13 @@ static void pflip_to_worker(struct work_struct *work)
 	send_pending_event(pipeline);
 }
 
-static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
+static bool display_send_page_flip(struct xen_drm_front_drm_pipeline *pipeline,
+				   struct drm_atomic_commit *state,
 				   struct drm_plane_state *old_plane_state)
 {
 	struct drm_plane_state *plane_state =
-			drm_atomic_get_new_plane_state(old_plane_state->state,
-						       &pipe->plane);
+			drm_atomic_get_new_plane_state(state,
+						       &pipeline->plane);
 
 	/*
 	 * If old_plane_state->fb is NULL and plane_state->fb is not,
@@ -193,8 +192,6 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	 * sent to the backend as a part of display_set_config call.
 	 */
 	if (old_plane_state->fb && plane_state->fb) {
-		struct xen_drm_front_drm_pipeline *pipeline =
-				to_xen_drm_pipeline(pipe);
 		struct xen_drm_front_drm_info *drm_info = pipeline->drm_info;
 		int ret;
 
@@ -224,10 +221,30 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	return false;
 }
 
-static int display_check(struct drm_simple_display_pipe *pipe,
-			 struct drm_plane_state *plane_state,
-			 struct drm_crtc_state *crtc_state)
+static int xen_drm_plane_helper_atomic_check(struct drm_plane *plane,
+					     struct drm_atomic_commit *state)
 {
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
+	if (ret)
+		return ret;
+
+	if (!plane_state->visible)
+		return 0;
+
+	if (!crtc_state)
+		return 0;
+
 	/*
 	 * Xen doesn't initialize vblanking via drm_vblank_init(), so
 	 * DRM helpers assume that it doesn't handle vblanking and start
@@ -242,15 +259,19 @@ static int display_check(struct drm_simple_display_pipe *pipe,
 	return 0;
 }
 
-static void display_update(struct drm_simple_display_pipe *pipe,
-			   struct drm_plane_state *old_plane_state)
+static void xen_drm_plane_helper_atomic_update(struct drm_plane *plane,
+					       struct drm_atomic_commit *state)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_crtc *crtc = plane->state->crtc ?: old_plane_state->crtc;
+	struct xen_drm_front_drm_pipeline *pipeline;
 	struct drm_pending_vblank_event *event;
 	int idx;
 
+	if (!crtc)
+		return;
+
+	pipeline = to_xen_drm_pipeline(crtc);
 	event = crtc->state->event;
 	if (event) {
 		struct drm_device *dev = crtc->dev;
@@ -265,7 +286,7 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (!drm_dev_enter(crtc->dev, &idx)) {
 		send_pending_event(pipeline);
 		return;
 	}
@@ -278,19 +299,19 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 	 * If this is not a page flip, e.g. no flip done event from the backend
 	 * is expected, then send now.
 	 */
-	if (!display_send_page_flip(pipe, old_plane_state))
+	if (!display_send_page_flip(pipeline, state, old_plane_state))
 		send_pending_event(pipeline);
 
 	drm_dev_exit(idx);
 }
 
 static enum drm_mode_status
-display_mode_valid(struct drm_simple_display_pipe *pipe,
-		   const struct drm_display_mode *mode)
+xen_drm_crtc_helper_mode_valid(struct drm_crtc *crtc,
+			       const struct drm_display_mode *mode)
 {
 	struct xen_drm_front_drm_pipeline *pipeline =
-			container_of(pipe, struct xen_drm_front_drm_pipeline,
-				     pipe);
+			container_of(crtc, struct xen_drm_front_drm_pipeline,
+				     crtc);
 
 	if (mode->hdisplay != pipeline->width)
 		return MODE_ERROR;
@@ -301,12 +322,55 @@ display_mode_valid(struct drm_simple_display_pipe *pipe,
 	return MODE_OK;
 }
 
-static const struct drm_simple_display_pipe_funcs display_funcs = {
-	.mode_valid = display_mode_valid,
-	.enable = display_enable,
-	.disable = display_disable,
-	.check = display_check,
-	.update = display_update,
+static int xen_drm_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
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
+static const struct drm_plane_helper_funcs display_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= xen_drm_plane_helper_atomic_check,
+	.atomic_update	= xen_drm_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs display_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static const struct drm_crtc_helper_funcs display_crtc_helper_funcs = {
+	.mode_valid	= xen_drm_crtc_helper_mode_valid,
+	.atomic_check	= xen_drm_crtc_helper_atomic_check,
+	.atomic_enable	= xen_drm_crtc_helper_atomic_enable,
+	.atomic_disable	= xen_drm_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs display_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs display_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static int display_pipe_init(struct xen_drm_front_drm_info *drm_info,
@@ -331,10 +395,37 @@ static int display_pipe_init(struct xen_drm_front_drm_info *drm_info,
 
 	formats = xen_drm_front_conn_get_formats(&format_count);
 
-	return drm_simple_display_pipe_init(dev, &pipeline->pipe,
-					    &display_funcs, formats,
-					    format_count, NULL,
-					    &pipeline->conn);
+	ret = drm_universal_plane_init(dev, &pipeline->plane, 1,
+				       &display_plane_funcs,
+				       formats, format_count,
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(&pipeline->plane, &display_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(dev, &pipeline->crtc,
+					&pipeline->plane, NULL,
+					&display_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(&pipeline->crtc, &display_crtc_helper_funcs);
+
+	ret = drm_encoder_init(dev, &pipeline->encoder,
+			       &display_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+
+	pipeline->encoder.possible_crtcs = drm_crtc_mask(&pipeline->crtc);
+
+	ret = drm_connector_attach_encoder(&pipeline->conn, &pipeline->encoder);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 int xen_drm_front_kms_init(struct xen_drm_front_drm_info *drm_info)

-- 
2.55.0


