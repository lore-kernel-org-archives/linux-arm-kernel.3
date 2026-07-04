Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F676C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 18:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeewdBY9B/GoXx4wh8GHCfZpl3Bn2RXn06zKpHrow0s=; b=RU43PK5pIY8+nFqjl45R1yMswt
	w2q52t6a43Vrd4wSIwbedn1iwwFOEBFnpvoVwd+h9eKsi4jx8Hs43unEkU+rIScxHMzX7PGLNE9m7
	0sXBtzZlN6R1ORlpexNpALDlVfMq+F2kZHkfz5wpQUfbHjRyi9Fb915zrxm3SYS7t9aP6NcUaJsLW
	cvmFd7i/B9ghvEtxF92cUGL+BlJqGv1y93n7QslEXK9o5mwmp+GJaRVpu0tkMoSIUSX/0t7Q7eWln
	5kldPQ2PDYRFnD9DwzKAJuX9CVCMzl/4128PUPwJr56VP9pFPawSIdrisP4zmBKBjCbcIzR9bH4cG
	yOvrnnuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5Av-00000008fB1-1Mld;
	Sat, 04 Jul 2026 18:33:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5At-00000008f9b-0NeE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 18:33:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664G8Z273294266
	for <linux-arm-kernel@lists.infradead.org>; Sat, 4 Jul 2026 18:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qeewdBY9B/GoXx4wh8GHCfZpl3Bn2RXn06zKpHrow0s=; b=bLvR58BKlqOhSmYR
	GWZwh7RAaMqMue255wp2Ux0Os9VOxeZTTKB+ZxPySU6eFiW7ptjT3b3vdgETw6Jd
	5I947fjxQJDg/XrP4LXewlGPDfkNLfXj7mTxRKCdL6xeN/5VUZXXu70dBIH6VF4M
	vEAqNimBJaFsBPVH580f4bNI6/oHvXzoi1q5GHo/74VpLiQfryAKkNpALUWKrKKi
	lvjTgd7dkMAiZOSDtM3dX1XAgaypnJoWr9VA7uycRiP6EF2yiseN2j1pALBmIuq8
	aSzmjLQ8i3hGYowHvMb9Iz2eUDnGL8p6GAbRS+lTM2RvEbLelhiecOA5MlLsGH+5
	fsNVbA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txeh992-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 18:33:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847a483ea41so1838143b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 11:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783189990; x=1783794790; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qeewdBY9B/GoXx4wh8GHCfZpl3Bn2RXn06zKpHrow0s=;
        b=VoaRuN7a3orxeDdfFFbVoVyMEEVQK9TY7FER8mwkIy8cIf2+aDxJqEhBNZzCzJVl1R
         o8anXt3sBGA6GOdvU0NYOMdP34IKS65ZnNUcd3rjsn2/cD/nPOLI783b96cXfNxg5CVs
         1q4earT87O4BNe1M0S9JCY1azcnvyIz1TUppnrVbixD/QTzb8fzbxudLkTmEe5T+dTbL
         aN1iciVHQTylBz191/esfZCHBWrMDN/Oe+bqfFJn9mhAPQa8mZMuZhTiD1jHapCwOALf
         kR79RPVCiODuVES6tC6FMiLfN4RUpBKZUZiV1h1olpw1NBTB7nVyrRIUNheh08YgWAH3
         lEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783189990; x=1783794790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qeewdBY9B/GoXx4wh8GHCfZpl3Bn2RXn06zKpHrow0s=;
        b=afN6wgzgJOATX/FNwt4QgjpWK+k/UrQQn8z9vwzxjHK3IR66Odm/2b9DrqK5bNjCCC
         qgfUx0msi5fcIgQG5VAo5P7CRe0lly3Emorab626bJivvFJadGF85xbjm+W6arEPUR7E
         j7rnAnWjxLWYWh+kzLd0K5/AR/pq2dXFrLB6Ifn5XywiPR87YTbnV1ZYMoJdxGVwKcF+
         c+OczZ8McpttB5qkZAUmRy8uiEjo/RqzHkfYfXt/11An6C9xKPPIp+SJfQnZ/i8LyoDg
         wNswwKaZ62acSXGKRilpWttOnhXlnPSclvRiDEpR9WG2J5kN6B70w/kZzA5zaEheTley
         AL7g==
X-Forwarded-Encrypted: i=1; AFNElJ93FX/klncuiyxptanYdgxJjiyXPHky5Rf7rerU7lQY9sCXsElHTml07SSnTtw4tPTg9h6jED87qz4ycIyuIwb6@lists.infradead.org
X-Gm-Message-State: AOJu0YyoEE966uav1Uzb5WdMZXm5KjGwLWWysQfXChd8j+QbqWmQKrh6
	0fE+w2aQ8z86/1NlFi3AHzZCklJ0Gl3pyvPpkCd1WKfUOAeJLbc5H1gaBgPeZ7W3LVaR1HlVGXI
	P5SP6QhKG4bBMCr8R3V3HKx6a/4BVjHI9tcw8sJ5NRbJlK7p2reZuadXer7Fwz16+7aZQNmbqAS
	36GA==
X-Gm-Gg: AfdE7ck/4D3rhN0UoLFK8MwoDBKEDBq67VKNd+N2i1AOtRcY0JFp4voNn3hsaZBh1mi
	T/rZDCMoIddUcQEE+lhNRRxiJhGZZSLRSKotxBMjijU8567iXNYqgO6Y1+LBxppL6B/5Ydogtc7
	M9nO/XsRjD+pZETaKmlhPMnE5lD1wa0SDvDWHHbsaMvWdfa9dGbEsjIZZDLzWMmNOEdNgv2ro19
	0npROgZAG1IVchX4c+mxHZm7TVhhicDnwFb4klFwZz3vs8fcEBngFHVPfPiMVM6Hf4b3z26I65I
	vDyfA9mlYq9PU2TBZzd38UK+0aFuUkdFaWmGYJNQLBTIImX3PR2UP/4UZLn1vgqQqrxzMlPZhFy
	WxdsKGYVTPWUaBQSd8Y4CEeo=
X-Received: by 2002:a05:6a00:2e9f:b0:847:8791:f54f with SMTP id d2e1a72fcca58-847f86eaa41mr3109142b3a.29.1783189989796;
        Sat, 04 Jul 2026 11:33:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9f:b0:847:8791:f54f with SMTP id d2e1a72fcca58-847f86eaa41mr3109120b3a.29.1783189989281;
        Sat, 04 Jul 2026 11:33:09 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:33:08 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 02:31:14 +0800
Subject: [PATCH 5/9] drm/pl111: replace struct drm_simple_display_pipe with
 regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-simple-kms-removal-v1-5-b4e1ca053623@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=11040;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=UIMnAJmAsHNwzG3sUZoBE/LPKERzVi4sWM5J738IWxI=;
 b=RA4hDvGQcIHiHVgB2nIPn7/+tx2Alt8IiBFpU/Uf0g/qT5hFfsIN9rsVXLuWJcPpHLAeWBSzR
 q+gEaxP+EW5CPiUrPHYeBUiOXsCRtxFFrHUtMoJ7EySIxRCwYIyPTDI
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX/L5k7rTp/qft
 OvXpRNCplZiekPtqeoFZIzo4oSoo3KPsqi1v246BTi0wWpuv0mNHazMinGOCZb1Y7SDDcdQ/yX0
 EH0VRp0Q0SghgT2nbRoe2lRUq9tbekQ=
X-Proofpoint-GUID: wzZCqMlSnv82bzw8vsdz1G89kXq3af3D
X-Proofpoint-ORIG-GUID: wzZCqMlSnv82bzw8vsdz1G89kXq3af3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX15Lmg2STbe5S
 RnJFKRrb2vwCY1rnKrwotKu285N1qcnCrXSsbycVJ7RpOHn6890KFYhwBicIi4e4NCxBL0QaORL
 VEQKPYbQtmLIZeZenVowrqG/3tHZtun+yZtIyYQp48vP9WY+UX7jq0MBlajR5DDZ216bg6YQv2k
 Quv+RmQddlmpjch6p9hetxWwIhWRRg9KTqpkuSdEI1+HQPYnwLL1BWXJKphOHXvBP4o1juYfMVI
 A2WxIUiBLPjgslFMjhQjKNLf1MnBt7nfL10h+bebpuSeo6MFnNS0U5iSHEIG4Nz4eCHxv4Sx7HS
 +zi079SdAY1fh4jmYzxnAiInlzrUuAtD2D6bYnjR1zpoVd3hb8pX4khqn00Ial50qPbCbuh4fM4
 flsbIvKQ1+Zg4IFqMAebLauSEopCyRrNQl+Od+MHwdOLCib1Iv4eUgiKM3vuqmIrNBaJ30TTsaR
 lw933o5H0NPMTGzIR/g==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4951e6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zKtxPG1kur982WRNNmIA:9 a=QEXdDO2ut3YA:10
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
X-CRM114-CacheID: sfid-20260704_113311_145220_92EEFB03 
X-CRM114-Status: GOOD (  20.63  )
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

Replace PL111 simple display pipe with explicit plane, CRTC and encoder
objects.

Keep existing hardware programming and vblank behavior, and install GEM
framebuffer prepare helper explicitly.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/pl111/pl111_display.c | 174 ++++++++++++++++++++++++++--------
 drivers/gpu/drm/pl111/pl111_drm.h     |   5 +-
 drivers/gpu/drm/pl111/pl111_drv.c     |   3 +-
 3 files changed, 136 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 5d10bc5fdf1f..b1bdd4c9dbe6 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -15,6 +15,7 @@
 #include <linux/media-bus-format.h>
 #include <linux/of_graph.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -37,7 +38,7 @@ irqreturn_t pl111_irq(int irq, void *data)
 		return IRQ_NONE;
 
 	if (irq_stat & CLCD_IRQ_NEXTBASE_UPDATE) {
-		drm_crtc_handle_vblank(&priv->pipe.crtc);
+		drm_crtc_handle_vblank(&priv->crtc);
 
 		status = IRQ_HANDLED;
 	}
@@ -49,10 +50,10 @@ irqreturn_t pl111_irq(int irq, void *data)
 }
 
 static enum drm_mode_status
-pl111_mode_valid(struct drm_simple_display_pipe *pipe,
-		 const struct drm_display_mode *mode)
+pl111_crtc_helper_mode_valid(struct drm_crtc *crtc,
+			     const struct drm_display_mode *mode)
 {
-	struct drm_device *drm = pipe->crtc.dev;
+	struct drm_device *drm = crtc->dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 	u32 cpp = DIV_ROUND_UP(priv->variant->fb_depth, 8);
 	u64 bw;
@@ -83,13 +84,35 @@ pl111_mode_valid(struct drm_simple_display_pipe *pipe,
 	return MODE_OK;
 }
 
-static int pl111_display_check(struct drm_simple_display_pipe *pipe,
-			       struct drm_plane_state *pstate,
-			       struct drm_crtc_state *cstate)
+static int pl111_plane_helper_atomic_check(struct drm_plane *plane,
+					   struct drm_atomic_commit *state)
 {
-	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *old_fb = pipe->plane.state->fb;
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = pstate->crtc;
+	struct drm_crtc_state *cstate;
+	const struct drm_display_mode *mode;
+	struct drm_framebuffer *old_fb = plane->state->fb;
 	struct drm_framebuffer *fb = pstate->fb;
+	int ret;
+
+	if (!crtc)
+		return 0;
+
+	cstate = drm_atomic_get_new_crtc_state(state, crtc);
+	if (!cstate)
+		return 0;
+
+	ret = drm_atomic_helper_check_plane_state(pstate, cstate,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+
+	if (!pstate->visible)
+		return 0;
+
+	mode = &cstate->mode;
 
 	if (mode->hdisplay % 16)
 		return -EINVAL;
@@ -117,16 +140,14 @@ static int pl111_display_check(struct drm_simple_display_pipe *pipe,
 	return 0;
 }
 
-static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
-				 struct drm_crtc_state *cstate,
-				 struct drm_plane_state *plane_state)
+static void pl111_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					    struct drm_atomic_commit *state)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_plane *plane = &pipe->plane;
 	struct drm_device *drm = crtc->dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
+	struct drm_crtc_state *cstate = crtc->state;
 	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_framebuffer *fb = priv->plane.state->fb;
 	struct drm_connector *connector = priv->connector;
 	struct drm_bridge *bridge = priv->bridge;
 	bool grayscale = false;
@@ -355,9 +376,9 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 		drm_crtc_vblank_on(crtc);
 }
 
-static void pl111_display_disable(struct drm_simple_display_pipe *pipe)
+static void pl111_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *state)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 	u32 cntl;
@@ -387,17 +408,23 @@ static void pl111_display_disable(struct drm_simple_display_pipe *pipe)
 	clk_disable_unprepare(priv->clk);
 }
 
-static void pl111_display_update(struct drm_simple_display_pipe *pipe,
-				 struct drm_plane_state *old_pstate)
+static void pl111_plane_helper_atomic_update(struct drm_plane *plane,
+					     struct drm_atomic_commit *state)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
-	struct pl111_drm_dev_private *priv = drm->dev_private;
-	struct drm_pending_vblank_event *event = crtc->state->event;
-	struct drm_plane *plane = &pipe->plane;
+	struct drm_crtc *crtc = plane->state->crtc;
+	struct drm_device *drm;
+	struct pl111_drm_dev_private *priv;
+	struct drm_pending_vblank_event *event;
 	struct drm_plane_state *pstate = plane->state;
 	struct drm_framebuffer *fb = pstate->fb;
 
+	if (!crtc)
+		return;
+
+	drm = crtc->dev;
+	priv = drm->dev_private;
+	event = crtc->state->event;
+
 	if (fb) {
 		u32 addr = drm_fb_dma_get_gem_addr(fb, pstate, 0);
 
@@ -416,9 +443,8 @@ static void pl111_display_update(struct drm_simple_display_pipe *pipe,
 	}
 }
 
-static int pl111_display_enable_vblank(struct drm_simple_display_pipe *pipe)
+static int pl111_display_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 
@@ -427,21 +453,63 @@ static int pl111_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 	return 0;
 }
 
-static void pl111_display_disable_vblank(struct drm_simple_display_pipe *pipe)
+static void pl111_display_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 
 	writel(0, priv->regs + priv->ienb);
 }
 
-static struct drm_simple_display_pipe_funcs pl111_display_funcs = {
-	.mode_valid = pl111_mode_valid,
-	.check = pl111_display_check,
-	.enable = pl111_display_enable,
-	.disable = pl111_display_disable,
-	.update = pl111_display_update,
+static int pl111_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
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
+static struct drm_crtc_funcs pl111_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_crtc_helper_funcs pl111_crtc_helper_funcs = {
+	.mode_valid	= pl111_crtc_helper_mode_valid,
+	.atomic_check	= pl111_crtc_helper_atomic_check,
+	.atomic_enable	= pl111_crtc_helper_atomic_enable,
+	.atomic_disable	= pl111_crtc_helper_atomic_disable,
+};
+
+static const struct drm_plane_funcs pl111_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.reset			= drm_atomic_helper_plane_reset,
+	.destroy		= drm_plane_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static const struct drm_plane_helper_funcs pl111_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= pl111_plane_helper_atomic_check,
+	.atomic_update	= pl111_plane_helper_atomic_update,
+};
+
+static const struct drm_encoder_funcs pl111_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
@@ -583,18 +651,40 @@ int pl111_display_init(struct drm_device *drm)
 		return ret;
 
 	if (!priv->variant->broken_vblank) {
-		pl111_display_funcs.enable_vblank = pl111_display_enable_vblank;
-		pl111_display_funcs.disable_vblank = pl111_display_disable_vblank;
+		pl111_crtc_funcs.enable_vblank = pl111_display_enable_vblank;
+		pl111_crtc_funcs.disable_vblank = pl111_display_disable_vblank;
 	}
 
-	ret = drm_simple_display_pipe_init(drm, &priv->pipe,
-					   &pl111_display_funcs,
-					   priv->variant->formats,
-					   priv->variant->nformats,
-					   NULL,
-					   priv->connector);
+	ret = drm_universal_plane_init(drm, &priv->plane, 0,
+				       &pl111_plane_funcs,
+				       priv->variant->formats,
+				       priv->variant->nformats,
+				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (ret)
 		return ret;
 
+	drm_plane_helper_add(&priv->plane, &pl111_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &priv->crtc, &priv->plane,
+					NULL, &pl111_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(&priv->crtc, &pl111_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, &priv->encoder, &pl111_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+
+	priv->encoder.possible_crtcs = drm_crtc_mask(&priv->crtc);
+
+	if (priv->connector) {
+		ret = drm_connector_attach_encoder(priv->connector,
+						   &priv->encoder);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/pl111/pl111_drm.h b/drivers/gpu/drm/pl111/pl111_drm.h
index d1fe756444ee..ec92a5a180a8 100644
--- a/drivers/gpu/drm/pl111/pl111_drm.h
+++ b/drivers/gpu/drm/pl111/pl111_drm.h
@@ -21,7 +21,6 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_panel.h>
-#include <drm/drm_simple_kms_helper.h>
 
 /*
  * CLCD Controller Internal Register addresses
@@ -135,7 +134,9 @@ struct pl111_drm_dev_private {
 	struct drm_connector *connector;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 
 	void *regs;
 	u32 memory_bw;
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index ac7b1d12a0f5..f649c266c33a 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -168,8 +168,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 		goto out_bridge;
 	}
 
-	ret = drm_simple_display_pipe_attach_bridge(&priv->pipe,
-						    bridge);
+	ret = drm_bridge_attach(&priv->encoder, bridge, NULL, 0);
 	if (ret)
 		return ret;
 

-- 
2.55.0


