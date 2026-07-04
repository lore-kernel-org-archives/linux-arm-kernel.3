Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAA5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 18:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhnZnblLCIszQtw+LJyheg1p5e5bbTPNhk3k4G3KLZE=; b=OiebgLsuUbjYhiE2u9oQe6bNN9
	uCktoPEB8zeQSQad/gpk7eu5yB3g88nye/J/xe1qL6h9aiw7ebeKLCYyhyzXm9g3D7TTLWdxj3ofL
	+r7EKLjMb0HgwJfCTtdzh9vSRS37x/WBw4XqVR+QytUb0mMA2hRPlq9qHl2RG1AISp/V4rgvRxdzO
	NkwRfPmHgscsV3eLvCpQZJUraTyF8EHsuejhTPcU78yvAvvh2OAFEH9J5UfyVTJ1Ot5b+vNi1xiKf
	KKmj74AjMR4FDdDDsX0cUk6xzwPcovvpDmEc1283hdz2eOybvlGs5oBlNbxdB/7/LPr7xXuFRwnpX
	w5BNTAMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5AU-00000008eyF-2lwN;
	Sat, 04 Jul 2026 18:32:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5AR-00000008exV-3fO9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 18:32:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664G8eaT3294384
	for <linux-arm-kernel@lists.infradead.org>; Sat, 4 Jul 2026 18:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhnZnblLCIszQtw+LJyheg1p5e5bbTPNhk3k4G3KLZE=; b=HigA/YvowAIAk3nt
	u90/giw64WMUkmqqUONEvT6QA+HElUmhEe9nMBPgMGXIiCsru/1th/i+26Ti+VPU
	VqC6CR+1O9aO7xlv3V2IfALvNs/JXPFhhXYQAmu8RnGmT3VXS/g/KZNAnMfyf63V
	Kxhyq+2qPDB+3/CZZhBC+/vDo6fJXQUA6q2doODDUnsQQbXtgKhPlWs1zZiIS+dp
	88CkD6YJ8VmeESdB3zsViZszqFk4ECq1XxJqVbJ3sQ/6CblyG65fIcGJ57s8eKMO
	zG7GjLSO340QWRV/QKuGOEVfrnh3WJSLZuI1zRXFhRyJJOBAPwB1Ox1/tpWOJhNK
	P4/oWg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txeh97t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 18:32:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88d7a75507so2523907a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 11:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783189962; x=1783794762; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhnZnblLCIszQtw+LJyheg1p5e5bbTPNhk3k4G3KLZE=;
        b=BSSw9FZfhF4uekOFOlOVmGSzz+ufZltB9PTQOKwoX17Z0k+NuVgpbbpekwEiXdDlMe
         zo9s+F6un5qSl64qabeFJagDINJZu/SPdWZ4rrdwHOxME9b1Mv+OJsZqyDfB2lv3jp/3
         hA6QtTIusDS/zD6vizzHxJefCVM5vuDbCSVtTKpvWGwQ1+gimG56FJliyEMPXsTMnBHZ
         D1J1rQBhvexdXZniDSFchNKbX8GZ6ZWltAC9QWMBDxqQn5rHzYCU9vp0k5UvWGAl6r1U
         9wTZEycGJPNB5haBerXNQG2LzwCUFHFFll4Y07W6Tlcap2Yn2nHo2rRB/m44FclE8yHY
         9auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783189962; x=1783794762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hhnZnblLCIszQtw+LJyheg1p5e5bbTPNhk3k4G3KLZE=;
        b=egrlkauwkGXgar5GHmV3oFk/yiHFiDt5Q+/ogFXh0KKq8ymxuEQQwucIl5816br8GK
         npnPzKup0oTZoX0sWWV1k5cwTp1PjAtd6XXOFovY8KrjWnk2IFvfT7txKFlNdpYp+Ys0
         lBiuVQuicHUdnf8y5zZPnBmX0fOOYqrNv9gFRf9Z8/WWnjhkFE92XlE3u6YufyU9maTN
         BDXNu+bGYNOoBWJomaKJe5rkiyB+h9OhCAaN3C3U7iEGL+dZmHoTX4mmBFagEDB7MJzI
         L7IXHmK8P5uXjeohVgmPHbVSozjgfamdLdPu7vC/aCrGzVG+utgpNjK/Pr2Xp20+IsK4
         WvTA==
X-Forwarded-Encrypted: i=1; AHgh+RrWgN/bwnAX0FaW4QqVAN4zcioCaczfz4owYA+fAPc+sOVvEUzvUR8KdjPM3C4zRmCPRB2ucC/+9GAZIjI/obdU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0s4o0x7gNrTYbNQdw3BUpk+9bMZPY+DH1JwdEPrOrKmigRlAs
	AiZuLJbWJqcgWpILIebGILv9DSdMKrdv/GgI6RMFBpKTsP+wlH39nqBGEi5WiPLEW9KpHpY72yt
	bsvYBkdGNiubkpfKytDJTi+Aa74vCvta6qIeMdJvheuY0ErypJ+YPOhhNMPF8iOpqz8bnOOS8Jv
	96kw==
X-Gm-Gg: AfdE7cmJTnrLS18iOcR39tvRr1QuE+HvcR14ezNKu0u1FNhpK/HKERbJ/MDZzhos+pN
	v03t8vzKxqszJet0S6xmeGMV2ij6vuOL0ZPAvHB1llnUTs+3OtzEqXlKTVZhTMTzlGBPwzgqjAH
	whxqDEK97NoMSKIW7LHsZTGWlIQrYif9Z8mf2FTQzHBWGa7Tsu3jPqgnu/SQTI6d5oe0jJrJFft
	hncUXdv3wi/wpwPTVlTIIQxSfu62be4SudeQxbDK12fAS3YoR1kX2vPrUfzMtd2/6xiV6rXAplJ
	uKJCiFgTR9zv/DPbVkpVrHcuAqaKmNsMcmiJv5tG3HNxET6cdXpxgk94rlS8zznmOB1fMkYo+Gx
	PXmmF2zmPiR71XS6Domq4MOQ=
X-Received: by 2002:a05:6a00:3409:b0:847:82db:9046 with SMTP id d2e1a72fcca58-847f6e23426mr3892398b3a.26.1783189962387;
        Sat, 04 Jul 2026 11:32:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:3409:b0:847:82db:9046 with SMTP id d2e1a72fcca58-847f6e23426mr3892367b3a.26.1783189961907;
        Sat, 04 Jul 2026 11:32:41 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:32:40 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 02:31:10 +0800
Subject: [PATCH 1/9] drm/arcpgu: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-simple-kms-removal-v1-1-b4e1ca053623@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=10574;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=8mMAnYSE2j9kvPoy0U0PiscxYaNacGiFej3sM2jbRJE=;
 b=txK25+zxNcWE7LzIDK50/Vc0ek9cJ1ZHZwndvZY/Gaj4xa5vBqoV/ECCeA+Q5X53hzG7BWkCk
 vsnaMg/njluBVTDN1MNDL31skfyvaUfXMg+jVWOC+g+y4xzRJwbd4JO
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX5KtVNXUSdex1
 ZDdSjpL3/kCNSGawp5srL0OCqTxzhjeeAk8fpShd2HtyQ1kFz5X8dqFMpb7ilHKXhwgKyaiwAPu
 dZ/YrLDDTI57XS7KdveF2K3BLc0F3Jo=
X-Proofpoint-GUID: UxUs3APX3WQlceTVkJFl69-5ym4SnJ8p
X-Proofpoint-ORIG-GUID: UxUs3APX3WQlceTVkJFl69-5ym4SnJ8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfXz6S0YhEkM00X
 SqgE3xnPM0AV6e391BrbAtI1EGuEEj+1K1JA4+9DkAtYLWmnTQy9kdwMPHsTTduOlsc3YHuhpvq
 dDH4KhQWMGhkLg7w5JRcnKj4iGXb4LhqeZN+JV9EMsz1TnoqOxLz7SvCWZGKNjTTjY0ty1W3D2h
 IW9zpv1baxAsTPNLWUZyyhqRgJWOIuzW5VFTC+08M6vKfh71j0Awbx8wiVf849LMKtIQB5ZSK2u
 1ZlhmSyA5GmHewlMrzeLvezZyOH/uHGijDhQy3RW6Vdc5EtGg8OUt3rIx5xJP/UUApQ5GUu5GBI
 fRWtrXyGeijoPRCWfkFTeZIW7fOgQ1cldKopETCpkwKeZ/mMo/GVJiglSncAnOFZayV4V3Lv/0z
 hX0gnjdE6D+DrYNAX3IWPBOtY8CasO68Q4ZHUKjoxa9u+Ym2LvcQcdMSi4Vhu0hj4ycfh6sQx0A
 /70wrE4UwMVqQ6/MrZQ==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4951cb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GdXnK45ANdTc1KOwPkkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_113243_927721_F0EECE81 
X-CRM114-Status: GOOD (  18.58  )
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

Instantiate plane, CRTC and encoder directly and wire them up with
standard atomic helpers.

This removes arcpgu's dependency on deprecated simple-KMS display pipe
interface.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 165 +++++++++++++++++++++++++++++++++---------
 1 file changed, 131 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..375cdb79e4e8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -17,12 +17,12 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/of_reserved_mem.h>
@@ -52,14 +52,14 @@ struct arcpgu_drm_private {
 	struct drm_device	drm;
 	void __iomem		*regs;
 	struct clk		*clk;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane	plane;
+	struct drm_crtc		crtc;
+	struct drm_encoder	encoder;
 	struct drm_connector	sim_conn;
 };
 
 #define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
 
-#define pipe_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, pipe)
-
 static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
 				 unsigned int reg, u32 value)
 {
@@ -117,7 +117,7 @@ static const u32 arc_pgu_supported_formats[] = {
 
 static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
 {
-	const struct drm_framebuffer *fb = arcpgu->pipe.plane.state->fb;
+	const struct drm_framebuffer *fb = arcpgu->plane.state->fb;
 	uint32_t pixel_format = fb->format->format;
 	u32 format = DRM_FORMAT_INVALID;
 	int i;
@@ -139,10 +139,10 @@ static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, reg_ctrl);
 }
 
-static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *pipe,
-					       const struct drm_display_mode *mode)
+static enum drm_mode_status arcpgu_crtc_helper_mode_valid(struct drm_crtc *crtc,
+							  const struct drm_display_mode *mode)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(crtc->dev);
 	long rate, clk_rate = mode->clock * 1000;
 	long diff = clk_rate / 200; /* +-0.5% allowed by HDMI spec */
 
@@ -155,7 +155,7 @@ static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *p
 
 static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 {
-	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
+	struct drm_display_mode *m = &arcpgu->crtc.state->adjusted_mode;
 	u32 val;
 
 	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
@@ -194,11 +194,10 @@ static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
 }
 
-static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
+static void arcpgu_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *state)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(crtc->dev);
 
 	arc_pgu_mode_set(arcpgu);
 
@@ -208,9 +207,10 @@ static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
 		      ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
+static void arcpgu_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *state)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(crtc->dev);
 
 	clk_disable_unprepare(arcpgu->clk);
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
@@ -218,35 +218,106 @@ static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
 			      ~ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
-			   struct drm_plane_state *state)
+static void arcpgu_plane_helper_atomic_update(struct drm_plane *plane,
+					      struct drm_atomic_commit *state)
 {
 	struct arcpgu_drm_private *arcpgu;
 	struct drm_gem_dma_object *gem;
 
-	if (!pipe->plane.state->fb)
+	if (!plane->state->fb)
 		return;
 
-	arcpgu = pipe_to_arcpgu_priv(pipe);
-	gem = drm_fb_dma_get_gem_obj(pipe->plane.state->fb, 0);
+	arcpgu = dev_to_arcpgu(plane->dev);
+	gem = drm_fb_dma_get_gem_obj(plane->state->fb, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->dma_addr);
 }
 
-static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs = {
-	.update = arc_pgu_update,
-	.mode_valid = arc_pgu_mode_valid,
-	.enable	= arc_pgu_enable,
-	.disable = arc_pgu_disable,
-};
-
 static const struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
-	.fb_create  = drm_gem_fb_create,
+	.fb_create = drm_gem_fb_create,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
 DEFINE_DRM_GEM_DMA_FOPS(arcpgu_drm_ops);
 
+static int arcpgu_plane_helper_atomic_check(struct drm_plane *plane,
+					    struct drm_atomic_commit *state)
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
+static const struct drm_plane_helper_funcs arcpgu_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= arcpgu_plane_helper_atomic_check,
+	.atomic_update	= arcpgu_plane_helper_atomic_update,
+};
+
+static bool arcpgu_plane_format_mod_supported(struct drm_plane *plane,
+					      u32 format,
+					      u64 modifier)
+{
+	return modifier == DRM_FORMAT_MOD_LINEAR;
+}
+
+static const struct drm_plane_funcs arcpgu_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.format_mod_supported	= arcpgu_plane_format_mod_supported,
+};
+
+static int arcpgu_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					   struct drm_atomic_commit *state)
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
+static const struct drm_crtc_helper_funcs arcpgu_crtc_helper_funcs = {
+	.mode_valid	= arcpgu_crtc_helper_mode_valid,
+	.atomic_check	= arcpgu_crtc_helper_atomic_check,
+	.atomic_enable	= arcpgu_crtc_helper_atomic_enable,
+	.atomic_disable	= arcpgu_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs arcpgu_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs arcpgu_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 {
 	struct platform_device *pdev = to_platform_device(arcpgu->drm.dev);
@@ -254,6 +325,9 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	struct device_node *endpoint_node = NULL;
 	struct drm_connector *connector = NULL;
 	struct drm_device *drm = &arcpgu->drm;
+	struct drm_plane *plane;
+	struct drm_encoder *encoder;
+	struct drm_crtc *crtc;
 	int ret;
 
 	arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
@@ -301,12 +375,35 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 			return ret;
 	}
 
-	ret = drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
-					   arc_pgu_supported_formats,
-					   ARRAY_SIZE(arc_pgu_supported_formats),
-					   NULL, connector);
+	plane = &arcpgu->plane;
+	ret = drm_universal_plane_init(drm, plane, 0,
+				       &arcpgu_plane_funcs,
+				       arc_pgu_supported_formats,
+				       ARRAY_SIZE(arc_pgu_supported_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (ret)
 		return ret;
+	drm_plane_helper_add(plane, &arcpgu_plane_helper_funcs);
+
+	crtc = &arcpgu->crtc;
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
+					&arcpgu_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &arcpgu_crtc_helper_funcs);
+
+	encoder = &arcpgu->encoder;
+	ret = drm_encoder_init(drm, encoder, &arcpgu_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	if (connector) {
+		ret = drm_connector_attach_encoder(connector, encoder);
+		if (ret)
+			return ret;
+	}
 
 	if (encoder_node) {
 		/* Locate drm bridge from the hdmi encoder DT node */
@@ -315,7 +412,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		if (!bridge)
 			return -EPROBE_DEFER;
 
-		ret = drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
+		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -342,7 +439,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 	struct drm_device *drm = node->minor->dev;
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
-	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
+	unsigned long mode_clock = arcpgu->crtc.mode.crtc_clock * 1000;
 
 	seq_printf(m, "hw  : %lu\n", clkrate);
 	seq_printf(m, "mode: %lu\n", mode_clock);

-- 
2.55.0


