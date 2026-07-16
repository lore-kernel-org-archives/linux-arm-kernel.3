Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70223C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2+SC8wnTcWyUocd5OZE0bKBPwgO9xMWYvTc4EEJHLo=; b=gJ6SaHqXE3J3O3QKmhXB0N9dXw
	SzSwSK/+HpVbdOuCrK7m0Hm6bv3HeXnCHyVuLAmPmMlbTNXaPudOsMZanf98TMnPXu3cLcjsJUbSk
	HDM86EC8xksyjXwDZDLXYS96JviYETxl4UCNb8W2IciYYOETy1OjJWVTXYjfEWFGXQ6KtG3CgEFq5
	Gd45ScMxm1MrB6bBhwxFDd6wnt7zQ3tY5E830W1bQDE7oVVXKy7/RHRT+M4zy1hrCVCzEoKYbzWfg
	fzqKQTGQ2FsTDLmiEaGSuh80HS64IodmAnJRVTeWAvMiOxA/EsLhRI6v3qs6FC+pQgY0RhLGdHOHn
	ih6mXEpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkI0U-0000000GoSr-31iv;
	Thu, 16 Jul 2026 09:03:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkI0R-0000000GoQA-2VCj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:03:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DXFe1892281
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2+SC8wnTcWyUocd5OZE0bKBPwgO9xMWYvTc4EEJHLo=; b=NTWCIvEikV6s+evA
	+JwWW2EBvb6KUmHZ8opJCCxEKSHFFkaBv635L+zgOFvV52cN2uFzSA7FA8Vn9yzj
	R8gzlEv3HglAidC/bQA7O7iDm0CP2xsSdhq+FK4815sH0XX/5PuvRqaL2yrqiKPb
	zk6dSpeFX2ENutYTxHrGtg5kj2FewvD7TZq5/1WNZ4/bU1SXbPCchz6U8S5Tewc8
	CUaHVpxismyN3yf7ha8vbpaAi0JODc7hFLYAcmhamonOLzfAFWOHsZ+sbUCvxOiU
	3hm1FkQxR2BRm6t4Ki9Kn3U3CQNaeh8mqILAdNfYpfaOAm1/YYoTp6PIdLGsIvPi
	PHd54Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fecnybj1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:03:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8952346bb9so5456986a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 02:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192626; x=1784797426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2+SC8wnTcWyUocd5OZE0bKBPwgO9xMWYvTc4EEJHLo=;
        b=hArsJj0t3fCO8me0zPMxKl9WIuFmYNBBSeaQQu7VUL+mf98X1GwP27KiNCtc50JGJv
         rU4n4nfD8xrHImnswxmFengHQRdEIEQ+x/5z2Fl/Z3ZTGu7H2QsczoI+D1RGRrtANnr0
         nGHfvevd5Pmych/UMGYoJu0lfEoqTRyHLlFyh6NbLTAiFQk2VnsXeVz5yD0vVvqI3MCa
         3snbd8DXF4CpMaPvk6K/q9jE2jg5eWg647Wv/hIS6ehVEj3+ZA4nwQ1nj3UpIMp4zkFV
         Xpdp/HbA5YXtT59+LQPrHd85Me6QsadPyP9QOUroJzNgVbmEExV82n8DjbG2aL+Vz8RS
         7Bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192626; x=1784797426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2+SC8wnTcWyUocd5OZE0bKBPwgO9xMWYvTc4EEJHLo=;
        b=nehqjfRRRFTTVIHrkfV2wbWhB59OsazW5/rX+krxHu5mvxnlOb8HOWC74E0cY8HPAu
         BzF8fm82NKp5CsEKSr4LpuO1pCH75pyXBbcJ6P8MK4ihwxKCg0cVGtQW+rmYuT0JM1TX
         pXz40xzhzW/Yv4iTzQIcmKDQNff15XQzQhc/9S/Ri+gT1RUIcNvEiCK0HD6/Vv0V2zdj
         VrJh9JHkAbdjpNWQ0GDsd1MU/kA43m3uAeiYTsynUNN2OBXeGufxc0EQinPb8wNBXL1A
         MD/pclWwZVg6pHPrxearXX1uW5Ogsq2JMfTWoMwqSozsW7yCF6o8rCH3IY9rAoUDrw3E
         Vi7g==
X-Forwarded-Encrypted: i=1; AHgh+RoXSvBWqtrYzN+RKH323KnVfZ3pfRju3ceJfpfHz966QcFdN5B2V582GNCNjLmV8Luw6O9QUuPwNe95QVX37lRv@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgxp5dnYDm9b6SaYhYgQJqNg6HmW5qzKFLfkbcUWyZUoatGgc1
	tPeDaMXzwkdp5merBJGHoyCvupQfsU+dtJKjamSYl1eBDgp4b6kGpX5RFuJ2d5m3T4s/KjWu4gZ
	B7+ljiQkgu3EbAlKLbt20G9/qb4scMK/kmXiu53SVN7rVSqxzTA3jBxBWQtbHY0Tj46jwlELjKj
	pcuQ==
X-Gm-Gg: AfdE7ckSyQ9EbdItchsLQf8O1HBR8QnDsNLeWH6tutTvCv/sdDQhlh5ALe7/ruvSKIx
	YbOPHT1lyaQCsXFHip47lxyDimDdffxMUPtbsCFq1rXKQoGbTZf7ADi1Fe8LLQJuEiCCEesgUy2
	sg6KZsUCzgaYArQtF0LxmV0Y+fFzv6Tr4rSQez3KTrAiwgUYXYMU3geaJvKqaNgMl7NMgCi0Rg0
	Ss5+U7cbU/hpEjh35tlpe8DOy238Da9kUuMCs/I+RcbGzg+YifVpX2A9VKvh2GpNOGIrP1Zx6vu
	MrynnylteGxTzd7D133R8U1Xt7yf0xMikTSqrnHI5LLp85HFwF5vUSIVENgA5oxKYj50i8PcGXh
	zBm7olFv4pHmrTipmr8ux
X-Received: by 2002:a17:90b:5906:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-38e29ff97bdmr6389543a91.3.1784192625546;
        Thu, 16 Jul 2026 02:03:45 -0700 (PDT)
X-Received: by 2002:a17:90b:5906:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-38e29ff97bdmr6389504a91.3.1784192624999;
        Thu, 16 Jul 2026 02:03:44 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:03:44 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:02:00 +0800
Subject: [PATCH v2 8/8] drm/xen: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-drm-simple-kms-removal-v2-8-1133a8fc3785@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192560; l=11771;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=7XOFYlYAlSV+ozAl18A522abXND+69x4cTAvNkGYHmc=;
 b=GX2ZCGixdNsbm2dBAUjK6OkStWwzedAdHGWUe6gP5dpu2NfD1Po9grA6MgTJQZLa9fCVl6Nx9
 7qvMt1rcjWIADy/IhoJ5BQYdNhix/jd8KvBJH9LhdvnhvaUeaGWR/3m
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfXztpvQagiLuAI
 /sHXZDWpyz5fxiOawMXys3FTQhy6zOMNK50Z3wp9ViFowXbvz9LpDiCjqWKW/Tg4vK2/NJKlZVX
 S4ZNXOPMCW7sD8A9heyazwYIorLB7U8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX9CiaO93+Y9Vm
 XPyD1b51D+lyYAujKgsgM6UjvNOavxutNl4abXAGT55MRDvX22RriZGrAsQFkco9q66+73ZvUck
 qxjQiZRuUQr9FQZaDBWkSVGEkmVgqKHBSnxYFzrPZhNMvlS0T3JtZowMZU/RTWH8Fk6RThTLpWd
 vJg1vpTeyPIKFrhh1HPyMgQqKUmPM7h7vsMBAwoup4q5j2RMultr/yMtn1dCMdlA4bRl6PXA8ot
 gIb+G8jS/I62hmGpYApQGaN3MLvPoGjqOfPCLCFQD87B/jd69eHCVUpU+ouZxtF7lyqvubSOVCf
 JK0gwMckMGyLTY6+nkcYE02iJFj7O4RCeR8g9cURYOjEfPBxK5SZVlPKGbn56k6QWYmT+X+Cdg4
 kFbaTOrHuvLKZwzihq2K23f9pwnDMUclNFIHAIc58kT6l9iU0reyqjtf+sTfi2bOL4LNfbTG0Rv
 KpWneUwjE/DGUWKLHkw==
X-Proofpoint-ORIG-GUID: S1M0_lmt3Dvq0EDkG9Y-zpBygZFicLpE
X-Authority-Analysis: v=2.4 cv=Lt2iDHdc c=1 sm=1 tr=0 ts=6a589e72 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yt2wVW2Sl_HzNKkdQ3QA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: S1M0_lmt3Dvq0EDkG9Y-zpBygZFicLpE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_020347_777944_BC5FD11B 
X-CRM114-Status: GOOD (  22.74  )
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
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 175 ++++++++++++++++++++++++--------
 2 files changed, 134 insertions(+), 47 deletions(-)

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
index 48772b5fe71c..f869da3f3058 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -31,9 +31,15 @@
 #define FRAME_DONE_TO_MS	(XEN_DRM_FRONT_WAIT_BACK_MS + 100)
 
 static struct xen_drm_front_drm_pipeline *
-to_xen_drm_pipeline(struct drm_simple_display_pipe *pipe)
+xen_drm_pipeline_from_crtc(struct drm_crtc *crtc)
 {
-	return container_of(pipe, struct xen_drm_front_drm_pipeline, pipe);
+	return container_of(crtc, struct xen_drm_front_drm_pipeline, crtc);
+}
+
+static struct xen_drm_front_drm_pipeline *
+xen_drm_pipeline_from_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct xen_drm_front_drm_pipeline, plane);
 }
 
 static void fb_destroy(struct drm_framebuffer *fb)
@@ -94,7 +100,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 {
-	struct drm_crtc *crtc = &pipeline->pipe.crtc;
+	struct drm_crtc *crtc = &pipeline->crtc;
 	struct drm_device *dev = crtc->dev;
 	unsigned long flags;
 
@@ -105,24 +111,21 @@ static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
 
-static void display_enable(struct drm_simple_display_pipe *pipe,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
+static void xen_drm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *commit)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct xen_drm_front_drm_pipeline *pipeline = xen_drm_pipeline_from_crtc(crtc);
+	struct drm_plane_state *plane_state = pipeline->plane.state;
 	struct drm_framebuffer *fb = plane_state->fb;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(crtc->dev, &idx))
 		return;
 
 	ret = xen_drm_front_mode_set(pipeline, crtc->x, crtc->y,
 				     fb->width, fb->height,
 				     fb->format->cpp[0] * 8,
 				     xen_drm_front_fb_to_cookie(fb));
-
 	if (ret) {
 		DRM_ERROR("Failed to enable display: %d\n", ret);
 		pipeline->conn_connected = false;
@@ -131,13 +134,13 @@ static void display_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static void display_disable(struct drm_simple_display_pipe *pipe)
+static void xen_drm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
+	struct xen_drm_front_drm_pipeline *pipeline = xen_drm_pipeline_from_crtc(crtc);
 	int ret = 0, idx;
 
-	if (drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (drm_dev_enter(crtc->dev, &idx)) {
 		ret = xen_drm_front_mode_set(pipeline, 0, 0, 0, 0, 0,
 					     xen_drm_front_fb_to_cookie(NULL));
 		drm_dev_exit(idx);
@@ -177,12 +180,13 @@ static void pflip_to_worker(struct work_struct *work)
 	send_pending_event(pipeline);
 }
 
-static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
+static bool display_send_page_flip(struct xen_drm_front_drm_pipeline *pipeline,
+				   struct drm_atomic_commit *commit,
 				   struct drm_plane_state *old_plane_state)
 {
 	struct drm_plane_state *plane_state =
-			drm_atomic_get_new_plane_state(old_plane_state->state,
-						       &pipe->plane);
+			drm_atomic_get_new_plane_state(commit,
+						       &pipeline->plane);
 
 	/*
 	 * If old_plane_state->fb is NULL and plane_state->fb is not,
@@ -193,8 +197,6 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	 * sent to the backend as a part of display_set_config call.
 	 */
 	if (old_plane_state->fb && plane_state->fb) {
-		struct xen_drm_front_drm_pipeline *pipeline =
-				to_xen_drm_pipeline(pipe);
 		struct xen_drm_front_drm_info *drm_info = pipeline->drm_info;
 		int ret;
 
@@ -224,10 +226,27 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	return false;
 }
 
-static int display_check(struct drm_simple_display_pipe *pipe,
-			 struct drm_plane_state *plane_state,
-			 struct drm_crtc_state *crtc_state)
+static int xen_drm_plane_helper_atomic_check(struct drm_plane *plane,
+					     struct drm_atomic_commit *commit)
 {
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = NULL;
+	int ret;
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+
+	if (!plane_state->visible || !crtc_state)
+		return 0;
+
 	/*
 	 * Xen doesn't initialize vblanking via drm_vblank_init(), so
 	 * DRM helpers assume that it doesn't handle vblanking and start
@@ -242,12 +261,12 @@ static int display_check(struct drm_simple_display_pipe *pipe,
 	return 0;
 }
 
-static void display_update(struct drm_simple_display_pipe *pipe,
-			   struct drm_plane_state *old_plane_state)
+static void xen_drm_plane_helper_atomic_update(struct drm_plane *plane,
+					       struct drm_atomic_commit *commit)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(commit, plane);
+	struct xen_drm_front_drm_pipeline *pipeline = xen_drm_pipeline_from_plane(plane);
+	struct drm_crtc *crtc = &pipeline->crtc;
 	struct drm_pending_vblank_event *event;
 	int idx;
 
@@ -265,7 +284,7 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (!drm_dev_enter(crtc->dev, &idx)) {
 		send_pending_event(pipeline);
 		return;
 	}
@@ -278,19 +297,17 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 	 * If this is not a page flip, e.g. no flip done event from the backend
 	 * is expected, then send now.
 	 */
-	if (!display_send_page_flip(pipe, old_plane_state))
+	if (!display_send_page_flip(pipeline, commit, old_plane_state))
 		send_pending_event(pipeline);
 
 	drm_dev_exit(idx);
 }
 
 static enum drm_mode_status
-display_mode_valid(struct drm_simple_display_pipe *pipe,
-		   const struct drm_display_mode *mode)
+xen_drm_crtc_helper_mode_valid(struct drm_crtc *crtc,
+			       const struct drm_display_mode *mode)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			container_of(pipe, struct xen_drm_front_drm_pipeline,
-				     pipe);
+	struct xen_drm_front_drm_pipeline *pipeline = xen_drm_pipeline_from_crtc(crtc);
 
 	if (mode->hdisplay != pipeline->width)
 		return MODE_ERROR;
@@ -301,12 +318,53 @@ display_mode_valid(struct drm_simple_display_pipe *pipe,
 	return MODE_OK;
 }
 
-static const struct drm_simple_display_pipe_funcs display_funcs = {
-	.mode_valid = display_mode_valid,
-	.enable = display_enable,
-	.disable = display_disable,
-	.check = display_check,
-	.update = display_update,
+static int xen_drm_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *commit)
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
@@ -331,10 +389,37 @@ static int display_pipe_init(struct xen_drm_front_drm_info *drm_info,
 
 	formats = xen_drm_front_conn_get_formats(&format_count);
 
-	return drm_simple_display_pipe_init(dev, &pipeline->pipe,
-					    &display_funcs, formats,
-					    format_count, NULL,
-					    &pipeline->conn);
+	ret = drm_universal_plane_init(dev, &pipeline->plane, 0,
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
2.43.0


