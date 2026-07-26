Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6065C53209
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 19:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYw7YOevf7R1VaLGJE434uj9XUAJ+efhiT66MYE6HgA=; b=1t3y23kVaBXfSAEvVQyirtOab9
	zX3dN6oeAhkQ8nLibjSkmxghM3fXr3o4Ea0WfOf1oazbUJbQhxls1qqQS1EHM8OarbHB0pEfZfHeL
	qOczVZeSDPZpdTIyhzGsfa0wn7pnNcxjUR2qxdinEZ+jcRhVQHRZ2Iz6jdJopCm96FBa1PS4600/+
	qtxTrhoNGhePX9zmkZV2uK3/LhDrhbAK/SzNH0CncY2nyJDOFkUMebrqBFW5iRbPqrkJIn8niLN08
	NMlMi6NwIsqFitiAa0U8yGEv7p8Gzyhfkfo92veeKrVnPEaPJerzTb+5n8JXbeHLXrJDXqJ01WM43
	TL1q7/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4nv-00000001Xko-3yqP;
	Sun, 26 Jul 2026 19:46:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4nr-00000001XhJ-0JHK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 19:46:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH70tv1090696
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYw7YOevf7R1VaLGJE434uj9XUAJ+efhiT66MYE6HgA=; b=JFD2x2i6i050fq5c
	bDN7bgFtTZ7Sfm5SqUnqFm5eluW8Vk6cS3DMjgDr6v9VexxI+t0aU4tSBtrcAvT7
	I/lyXA43IaigZbmeOXdLWxxGDY9+DlgVAjoGjG+ObeQ71Y69u+RPqFXcUWZACs5d
	c28BQkTmfH5Y82NI96ySJY/gycW7qY2IkWbtJyvXyYN2+cYzvFFY4Ctmw+cn4o5h
	0vPoCRRSR9dkSFYNJLGTKliq5XHgo9Z6fNUAVxOzNPxuIHtTJAoSNL7353yWnify
	EzhMbvNba5KKY0r7lV7Ta4kUeMp5Fw3+4oUSiBQY9VPmf6gsV9dVj7v/URc5Zoe1
	UVJbkA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7uj7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:46:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e667368f0so3319268a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 12:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095185; x=1785699985; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYw7YOevf7R1VaLGJE434uj9XUAJ+efhiT66MYE6HgA=;
        b=FdSk6KO3yF+GGLqdKgx8ttGm06WMn6xNML/M2nTC1HwJPmLrkwVLwWFSSMpLiu6GX4
         2QkiV7XjLsYPa5AhNsG/DeFG2nl/NRHp4z5kdhMC6+Wo6nP/SoEO+s8JgyvNLquq3ZZI
         DsdhKRRTggDnxSb4e8QWSdWivuSZXred7l1SA4l7UVEoo68FmZpfLHTyRMZ4p9vsuO2D
         +mjLK3+t+WPXtgHQSAedRFIZiywc6g5ZtmEdX3Jv5/lXdLrZ2gxAaRwBVjeGhTBaRyZn
         rf0wWH0bpJAlvhT/DS5aHn0xfWAWdqRIVlYzjfnrX0JkaFRs5HWQEP87yFIBu9pFOdpu
         o1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095185; x=1785699985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYw7YOevf7R1VaLGJE434uj9XUAJ+efhiT66MYE6HgA=;
        b=HMZY/W3tQAn/3TmpxaBiFtm0vC9U3cX358fEs/a+6HmGffHVyRYn0+5rmvH8FXrM+6
         lyMKKWA6Hki3CWWYVPQ50ZHJftRbFZ3mhWMP47aLq/aD8jZzjeF+4jXwp/FKWzDPEEnM
         kJJoDXfKt3MJhSBWF8sT5gXLDtimBiqEStnykrYWlu/Z/DPgDTSJZh1Lhvrg1gVKFiN/
         QzxQE7eERakGnzCTOU/Ls/Kusim5KP9dvRTlP16GiCVzFol2UQuntobsowh2PfaAUsGw
         +jo5X2w+dHBxGvGLaXeVpqc3xF1tv/9G4myowwv1Tumb7y2Q10TbAlbfPQKsaZCpG7tY
         oVBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpseWsYyiSRAJbRXVTWH26wEm2642SyGYdlHBZaunvtZisqAfUSmomotIjcPVkfD3GkZgODVX+doli8bZCTbZ2g@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+gKeQksISK3YyUHWnkPqzrBnm7kRSmXWq21kXWF12UzgTdT4r
	+EureYVHgQz+I2qT6feQaUvn6aQABCComSxz3WgocootxyGamqVot8PvGJqdl7rbzO37rK4f4NZ
	HATcbSH1rX+cK4hGp8yNqWDyxDGayMv0OFFuGe7uao8dibirLsnv5aCO8ft/fjrkFVeWuxr+CV3
	Ex8w==
X-Gm-Gg: AR+sD10RpDpOpvvnzO5BwajynzaAhU57H4YTy8PHCAKUM+ftjbI9SPyARCUOmv+lX4M
	I7LJLtLsRrf+UC9IJClcw//iZYwiee1w0vDo4igByJq4hOYbktVKykxbtAgaVcJsrcltF8KBCg9
	N9EHb0YzsTTOe/fV82DiqCZPI8mA8+FFUeOdKwRYVV43QKaHXKJZ/rPYX2XcO7tx3ONiBhhrG0r
	7LUrk9FYc6dqHhhgtPrtt5w0Av/TkW8EkuAkU+rZvuvcR+DQCANmCLivx/Flr4/DIUllvHUp1gF
	spVO9NxXnR/Jf3MC2BNc9b7FV13C4cu/WI/0NhBTuYgzHmY2ypNpWKnqYtmRV4I8ZplkdP8C1wf
	XZJpO1GEs4X0TegWZb6uB
X-Received: by 2002:a17:90b:2642:b0:38f:1e1a:5141 with SMTP id 98e67ed59e1d1-38f29620a7emr6222278a91.28.1785095184890;
        Sun, 26 Jul 2026 12:46:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2642:b0:38f:1e1a:5141 with SMTP id 98e67ed59e1d1-38f29620a7emr6222251a91.28.1785095184441;
        Sun, 26 Jul 2026 12:46:24 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:46:23 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:19 +0800
Subject: [PATCH v3 6/8] drm/repaper: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-6-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095129; l=8123;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=AAx34gAM0g1XJvks56BpyKPpL86hNGfHkaqmTZ6w6/0=;
 b=0wLxQLCaGBQoh2NRb3mNAmGNnyaRnCPadbrAOaKKC67gUQV3goDlvM9OKxsAyvDatXtean6lJ
 GxRtATgRjlEC7duzu8UWemNPnKENa4bCZTwGGNjQcIYvTf3lN+2t4jy
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-ORIG-GUID: b3UXYU49S-0CiQYfkY8yZOYB9HAcVYlk
X-Proofpoint-GUID: b3UXYU49S-0CiQYfkY8yZOYB9HAcVYlk
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a666412 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pkK3EMrqy3vWcbFnmDwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMSBTYWx0ZWRfX6O8FOSzvM0pe
 wWzN98o4iUplKqXPEVGSqoPdGuotzQHTcdYliGuicZjUFJoBlt4ta+Uc9WzU74f4RsJHbDXO3g4
 thoORbKZTPT3dUjLfKt4co51igXWsjhsMhggPLyafGBdtFIUrDc+57QNRzlNjGBG4JhsSmam2UC
 PXSINsusKMv/lEAQwsEd50+L/yNbaVdEV5feOaZSgqePThqlUMGxHP11fm8oEu4R+x6Qq5pdp5d
 9nBQ4eQUDyyQ7ymiVxWisOitDokAqF3uSHTKCYD6wyg3CwNgh/0awxvriqGzf64siIOnx78LIoX
 xPj0pocGdVVv5JyyZ3ubONFkPliTrz8Z6+3oy20Jz5WmY9KdSRNbmcCNA9LCQ73pGP/PE/8ZQfJ
 DdrpFAwd3dacrML/Rr+J+64amzgvdxUYgq3eko4T0O5i/nP5LiGDrIo3hZ3gnNZAQfabIh0N/cU
 wUye7kmG34Oz2MtslYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMSBTYWx0ZWRfX9C52SkdXzbmy
 5+tJqXeZiW4cCD1roi1NrAqacdLGEiewv/smwRlSCoYZWOdkykzoqREeRZg75D+HITHf9PYS59Q
 CqplrUAxL82rMN5aYpCzEZ4hn/hh9Ik=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_124627_251898_26A61651 
X-CRM114-Status: GOOD (  19.72  )
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

Keep the shadow-plane helpers, framebuffer access handling and
no-scaling plane-state validation from the simple-KMS path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Skip damage updates unless the CRTC state exists and is active.
---
 drivers/gpu/drm/tiny/repaper.c | 138 ++++++++++++++++++++++++++++++++---------
 1 file changed, 110 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index c8270591afc7..f225e38fd404 100644
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
 
@@ -827,27 +828,90 @@ static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
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
+	struct drm_crtc_state *cstate = NULL;
 	struct drm_rect rect;
 
-	if (!pipe->crtc.state->active)
+	if (pstate->crtc)
+		cstate = drm_atomic_get_new_crtc_state(commit, pstate->crtc);
+
+	if (!cstate || !cstate->active)
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
+					     struct drm_atomic_commit *commit)
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
+static const struct drm_plane_helper_funcs repaper_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check	= repaper_plane_helper_atomic_check,
+	.atomic_update	= repaper_plane_helper_atomic_update,
+};
+
+static int repaper_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					    struct drm_atomic_commit *commit)
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
@@ -1102,9 +1166,27 @@ static int repaper_probe(struct spi_device *spi)
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


