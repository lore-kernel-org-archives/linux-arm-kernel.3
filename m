Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231B5C53209
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 19:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSGeQRwMP4eO9GjmSugudIPnkFmlYP4r8d4tXRAJ/XE=; b=l5rjBPvBEe/cubZCLVs3n4aRF4
	sHnvH6ACY2iEsubdRdwHheGkb4zecSvetlVP+kbcHYW4JU8dwbc4FSE1NJd9pV13U5AJQTZMHkEgV
	gv77/QmrpFMZ7RBnsBVlx+3ukmSVL/Rlu5hLRIbXiNTBXO57tpHoTn9N2c8TxCIZhWlhwOacTzfXj
	KkXGLPu3ujPXXoGX4UyTD/TqH5IrTUdQhGZaqpwWidG2rC1xaloJMXlUQ34eSg5ENk5zHKBA8ZXsJ
	a5lznaOkX2vpB+vzFKe1CfGencMRbrQCNLTm2pUSV9cZsvl+0iMqNSuLSXKuHNA4dmvjHLIrbbpCe
	GgbG8g4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4oB-00000001Xve-1YQU;
	Sun, 26 Jul 2026 19:46:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4o5-00000001XrR-3FF1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 19:46:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6oSo720810
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wSGeQRwMP4eO9GjmSugudIPnkFmlYP4r8d4tXRAJ/XE=; b=KhyqLUahopd1K+8F
	/i7o6UN4Zy4pvwoukMXxUan1QmeEdB8UIb9Ks8LzYVawYUykG71n98l1/g4JQihk
	zsAB4zh6e/2qkEhaZ/XIaXpbmeevlQ/9AwssdwfNZfZTL8xE70i1bgSpzqNSvVGA
	HEiC9jox5mGm/z3/nHocm7ymikNfv3bMB+nzN9oQLceFfKRH5WE7KehG9KoAucVV
	X1A+rbGBCf2dwZFDvi1gJ8iTE2R/KtK/KrgnYxMpDPG11DrG5ZE0e0pnGcKAJLoL
	yykF0vrX80gwHl2keJetGHSUKwpA2Nfe6p6KfuBq/xXj8lQc2k4WfhcDE+U7jxlR
	7+79yw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajkckw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:46:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so3062067a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095200; x=1785700000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSGeQRwMP4eO9GjmSugudIPnkFmlYP4r8d4tXRAJ/XE=;
        b=YWr57l9eM3KEXx2PnmVM9eDYNijmj8eRNyJljEXOkItYhL+Q4f8lncF5tekQkoPq22
         M0nNue1ydUlTvzNLpOvm144KJF666p7KaPjaNcNPozJ98tuG7nnqQI6WKcWtYxCWDJEJ
         FTyIMcyPGltRXdqzA7L8nu8bUFXmY3NmJlfbmcXeTlf8iFZxVv/Msiu7bXze4IzpF3AX
         0NDd9Y53r/+/u81OWMGhXMTjYx3phTkLD8thyuG0s4bX5dW08suoROmgEyC7r7d1VNHO
         WPMLvJ6kLuzYF2HhsCx04kzVjxfljqQ6QwopEgGcLqgx1PPS3njkfKSh/2Bw3X+LTiSo
         fBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095200; x=1785700000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSGeQRwMP4eO9GjmSugudIPnkFmlYP4r8d4tXRAJ/XE=;
        b=r5rhKj+cPS/PTbo71jNu4TXPTV3mzVAvNofTDBW9Gs0ZUwn4QJcSrtbH1HOpnusA8K
         3hav5gbuKyr1XVwjq0CglBskbSSf8qg/10LTF4rp5N+1uAqnpT6VE+vam4ZYOD/HFq6/
         C20FME7SoqSfkU/IGnCUYQq0uEzXV0AW/iXm0YTAh12XfZEwiF/Lx9WslX37rmF2sL93
         Dlq9Bajy36dE/5S815A5BnyGYNq8jqlJbrHOpjPwxF4zcTBF91yYsjiz/UajnXy03wtr
         g0SB1DR4FVaTX5F69yHRTveI3lxNUsl2iwhueGjdCziLdmrAF4REOJzltli/QaaZu5Is
         Lnpw==
X-Forwarded-Encrypted: i=1; AHgh+RqgBD4ahg3Ja7S4D/jv6Exmh86y7LihTss5CqGBQnwruoxKlUcBZg3rGgKVx5DW+si97PziJVTVUU6qxi2MFb0N@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi/bK4+ihrsaBehDsZQZlsLWvwlvIlEdbYT3iLBEoGElx0fY8L
	+TchQ+910F0+db9/1InEaYO1f/YFO4Ym+rZ85eUN8Ks7lawofWc3RskHybVEgv9VrbzwcNwMFrZ
	638a3dlOHbRMoEFGgIDHVGE89jG3B8dPPcXrwvchtZ4kj6OIu92d69jsHZnt/Sxd2sBUZhY4mp8
	9bjQ==
X-Gm-Gg: AR+sD11iVWG7fQKFUlmKSoyGNEGGmHolHWvbUXChcvvYX9T5e+UmDgeZtw5cy9+644P
	0ZS70dDwIA2GsvU5+cAktimK1hmHkkweubVwWXq11b0FZcte7Ih6bYfO8a1sIntwPVw6ASpHha1
	Ui/TNj5CIvpRpKP0BfAiWF6vHr7r96mKJ6B0kdBPqd3Ug37vlYrUVdhREk9fwVx75THyoZC9sOC
	HtFy8i/n+o9k22MEPrvOsedfQtmzMqfG/SPMXwWaTuN7PpzXUjbkt97tvdzIWp7VwIRjFqI2+ou
	rrvcPZZ+pn8QdaSym/3WuBYOUtW6ffD0NFWX+GkW1P66PlMI7eLx0gx/HuKYA9IFsZavzCLsUx1
	yWYIe0jWTzC/MiI6yBceX
X-Received: by 2002:a17:90b:1d44:b0:381:28e0:624d with SMTP id 98e67ed59e1d1-38f29613652mr5757541a91.28.1785095200540;
        Sun, 26 Jul 2026 12:46:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:381:28e0:624d with SMTP id 98e67ed59e1d1-38f29613652mr5757521a91.28.1785095200078;
        Sun, 26 Jul 2026 12:46:40 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:46:39 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:21 +0800
Subject: [PATCH v3 8/8] drm/xen: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-8-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095129; l=12894;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=PBi4kPXC6bDPKtTGd5qKGiDifkO/iF7Wup738qwpRwk=;
 b=oinILOU2wbGLYnenfbXSKIYuY97ShWRNCMA98C159D9els3KvEJFV0EOtNDjwTl46s7UQU1oH
 AXM4ZR3zIj+Bsp+yxt1D7aR4Bdwl0q4QKSVjC9zIMUkDziqZf2vfXbJ
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-ORIG-GUID: IdgSYpPqSTMKCEPYHRSbvfHgWHnHFqup
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a666421 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ypIeFc3LJoL4UEiODvkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: IdgSYpPqSTMKCEPYHRSbvfHgWHnHFqup
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMSBTYWx0ZWRfX6ya51Qq7SGvO
 advgt8ERwrXgMsiwso6DnBo4jM9cPgQsePVj9Vrtbb0osM3kyW5bqMuh36I0EKeS6HbTRH5WdT9
 8o4gxmkChLTrDFA7TTxep7zkq307diQvHOxIo4thO3C45OIhNC1JKpWcBD6OvDqDpBmCofEc5Wq
 S9t8hl4SOlPMa/E7TvbwpmaAWiN+H03vI+irkXPJhfn522gbBoSo9q8l0oZfMfRaEBL1C5XPC5E
 1JgjHfvno8/AKofSPz8xzk/Xt3kSE3Ssg+nzPMFJDdtGWGVC5HNNcZcRqUEJibP/x+zrveqPo8f
 BtUsu5mfJW79lEAONJ/7TNJhTTuTwMttU+DtNaZYSGNN0H3y92TJF98YB6eL8bHAD0LecZEIZu2
 pXnyjKRvd9a1ynZnmeZdHEvPZtdx3i7RmVmB9xXDi+vpJoz/Cwk9/7buj8o9i9qeziH2y0asC9e
 jalEDlA5rC0BXkW5R4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMSBTYWx0ZWRfX3cklNq2FIHp1
 GChupdcsWw6JY3j36Wno77LS+mZ+Tlj+rayzQVmq2diJ+7GXV/fYkKTs040DO0kxmcC1+uSvDlJ
 AbSMNM2ZmvKdQ9ASoe8vtIEY4edF1Vw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_124641_842858_121A1985 
X-CRM114-Status: GOOD (  23.68  )
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

Replace the Xen frontend simple display pipe with explicit plane, CRTC
and encoder objects for each pipeline.

Keep generic plane-state validation before Xen-specific checks, and
install the GEM framebuffer prepare helper explicitly.

Use commit-local plane state in the CRTC enable path and pass the new
plane source position to the backend mode-set request. Handle pending
page-flip events through the commit-local CRTC state in the plane update
path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Use commit-local plane state in the CRTC enable path.
- Pass the new plane source position to the xen_drm_front_mode_set.
- Make the container helpers static inline.
---
 drivers/gpu/drm/xen/xen_drm_front.h     |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 188 +++++++++++++++++++++++---------
 2 files changed, 142 insertions(+), 52 deletions(-)

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
index 48772b5fe71c..9896ea35b743 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -30,10 +30,16 @@
  */
 #define FRAME_DONE_TO_MS	(XEN_DRM_FRONT_WAIT_BACK_MS + 100)
 
-static struct xen_drm_front_drm_pipeline *
-to_xen_drm_pipeline(struct drm_simple_display_pipe *pipe)
+static inline struct xen_drm_front_drm_pipeline *
+xen_drm_pipeline_from_crtc(struct drm_crtc *crtc)
 {
-	return container_of(pipe, struct xen_drm_front_drm_pipeline, pipe);
+	return container_of(crtc, struct xen_drm_front_drm_pipeline, crtc);
+}
+
+static inline struct xen_drm_front_drm_pipeline *
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
-	struct drm_framebuffer *fb = plane_state->fb;
+	struct xen_drm_front_drm_pipeline *pipeline = xen_drm_pipeline_from_crtc(crtc);
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, &pipeline->plane);
+	struct drm_framebuffer *fb = pstate->fb;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(crtc->dev, &idx))
 		return;
 
-	ret = xen_drm_front_mode_set(pipeline, crtc->x, crtc->y,
+	ret = xen_drm_front_mode_set(pipeline, pstate->crtc_x, pstate->crtc_y,
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
 
@@ -224,10 +226,29 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	return false;
 }
 
-static int display_check(struct drm_simple_display_pipe *pipe,
-			 struct drm_plane_state *plane_state,
-			 struct drm_crtc_state *crtc_state)
+static int xen_drm_plane_helper_atomic_check(struct drm_plane *plane,
+					     struct drm_atomic_commit *commit)
 {
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc_state *crtc_state = NULL;
+	int ret;
+
+	if (plane_state->crtc) {
+		crtc_state = drm_atomic_get_crtc_state(commit, plane_state->crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+	}
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
@@ -242,16 +263,17 @@ static int display_check(struct drm_simple_display_pipe *pipe,
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
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
 	struct drm_pending_vblank_event *event;
 	int idx;
 
-	event = crtc->state->event;
+	event = crtc_state ? crtc_state->event : NULL;
 	if (event) {
 		struct drm_device *dev = crtc->dev;
 		unsigned long flags;
@@ -259,13 +281,13 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 		WARN_ON(pipeline->pending_event);
 
 		spin_lock_irqsave(&dev->event_lock, flags);
-		crtc->state->event = NULL;
+		crtc_state->event = NULL;
 
 		pipeline->pending_event = event;
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (!drm_dev_enter(crtc->dev, &idx)) {
 		send_pending_event(pipeline);
 		return;
 	}
@@ -278,19 +300,17 @@ static void display_update(struct drm_simple_display_pipe *pipe,
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
@@ -301,12 +321,53 @@ display_mode_valid(struct drm_simple_display_pipe *pipe,
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
@@ -331,10 +392,37 @@ static int display_pipe_init(struct xen_drm_front_drm_info *drm_info,
 
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


