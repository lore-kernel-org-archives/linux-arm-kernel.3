Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1243C5B56C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTJShaQ8ly4nCUgfAoU7CUotG9qknpirLcGSxiDk/hs=; b=S01LPu/s8ZlqFngwaYx5z5t1kB
	GiUGPyyDAkbo+igsPnZX2nsDiDrGqtExV7FnO9rcVXlPMDf+BAPv43VC45kcLPJRedITbARQnqYDd
	kOkXBY6xlbWjaD453zr6hSb7pA3Je6Uu/ahihIGkMw5pmDGccynCh2liPZw3Ap5FD07AQ2aMMgng+
	imCFGAFRfAkrvXPXNdtvyqrWSgTOA6Vm3yRq+UBm8YnjpCbh2ItYJXergF9KfYIR3+48BUHNU8NzK
	s/SJKh5sxd8TaQqRA/oArG8sJlM3EZEO9lRPsFOKR14ycB8tvUo07GbXFKjpQoyOR2fsPgbyw+AAX
	7vCMQ9Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRM6-0000000C6JI-0G4K;
	Mon, 10 Aug 2026 14:51:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRM3-0000000C6Gn-3KLS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:51:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACixSS2206263
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTJShaQ8ly4nCUgfAoU7CUotG9qknpirLcGSxiDk/hs=; b=RVQ1ypgp1BFX3scU
	OT8O+riaE4uKn+q9KFborw84tavN8QSApDN8x2eRpiIOghrkb2ntcXm+05j69IcK
	8rJv7zuF20n5XQpIvlu7SXMHz+3Yz2OipjwZVCGD4QIC61fWtcDmY9hwwz0oX/El
	UsvHaZ0nV6GGhgGz92PMrUzyATC87tcqln32NwrwP4zt/gqHDJN4d3PgtzlO/9eY
	LkTExkVvxFBGHi8OB5hpxq4KbPb3hQI2Ixjny8yme8MU7U0Wpdhlw4HD3cei3O/g
	8pUDUCm/XtnNqdQIwABalCd0Bsc543e4yy5OQuNmWYfK8gI0AA9GknCy39NYMjjr
	iQa4sA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v3t2ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:51:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d28f8737eso38499421cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373514; x=1786978314; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTJShaQ8ly4nCUgfAoU7CUotG9qknpirLcGSxiDk/hs=;
        b=Wfu5a76/PMbnz6kPEmEMR6PlVp7ck6gFjrJfn8DuUo5n7iNQVqXxyfESkQ7ZCoXD0c
         dT6ENDD3dfXa0hg27aUAOuOlAz3M1CasN1twtUcn9o+yJCgAKnSIMCm6cdeFNwrwU6R5
         PuQLU7E7l28ddBHA4MU8hYzqtbVj369wco1me9Js9AfPxYRJfoc6812Bsu5X/1UmzII/
         lL1V6VLeEhshH3IF4rMLDRfYsFF49OB3fiibdUI9NNGGq7Qp/eQBJMP3LjpbFyobxFmN
         gtLNIbZZc/HilprdKx1V36hC/MC7B0a2oJrpf6ycJ2j2OGBjNb7E79dwJX2TFgiZCTma
         XQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373514; x=1786978314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTJShaQ8ly4nCUgfAoU7CUotG9qknpirLcGSxiDk/hs=;
        b=cYB1/u9WBNROwCnmqRHZV58Pbiwmey/BfLb0efX5kjkDoaLcYOhEJKDiv3Yf8ZnRQv
         U5iDwidM2dlf4DFY9h1IKOeJcQ2bzUB6q/k3t/P+UPw3Pfaeo1r0BWulPONxFTwTmy57
         hL8PqwMBZ0wrSMwUhMKbU08LUGqtlntb4oVZ++lQncx4GhxEuVd52XjxjmmRAHkki8jx
         Yyl43LYJRktRzm1nRuWrz4XshhpoiCqbHTuNNoUBppFapLDk5tYwQr+0RLGl2od/+zhx
         uLPPmvw0GxKDNG+5nJF8nNGuw8MOQk+FrUMG+ThaT0Z+ff+FdyMZkMWrjjnyxFgMV2og
         x0KQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5ncOdLVya9w7TfRiTUyNRfVNrvpx3jnC9BXR/OAqVrByxD/sD3P9b8qeY5T4BWUmeDCTQJ3xjWdBI+FEKbPXm@lists.infradead.org
X-Gm-Message-State: AOJu0YwkvnTutj1+RWFSKN4cm3Ivjz6YzpPOMEEEryjyDuyaqOfKrXKH
	Pf+KPcuGgeE5PFcb9k0yil5plCfXe8O2t10gHyhZUuIC43C6ZburIEEKGL7vwwz7aAt5b7rhYon
	VJ7AJG/ltIGK+GanuAhBmiwmxvI1iSrKmy0grakm7Ou8IQcvJHOAwRHSW82w+VYB/FEB4jRseIs
	B1Ww==
X-Gm-Gg: AR+sD131g2KX1meIXLbSi9iRPCL1UzA5yiMisv4f5IOPW3W+QAvVkD/KPNwiERjrDrw
	n+x0wOCBgESajXLSeI5PL3kcjXJzF7u9KEdtn6p1aCj4lwytLNQ+7P3SjckKAuroFD7vKSYdw6K
	buScsm8RxbbDO8rbNnYmvU4vX/vKUsQLfZuteHjTY1qHAKD+VqX/T72eF1A0DcF7QHctEySWA3l
	s5SzkmB+0g7ZB9vkZbAbk5VL6C7x+UK0N7nLsmihMbs5h0aDqlVxQV/F4rPSOPSPgI6z5x9PuRh
	cCzuZltUEIDeS1lLjfnsVIaIc++9OucnbUxQhv1Q98x+n6ExiT2Znz7Knd6zqAmRUaLQ636Qecx
	u3HYEwJrY86RolXOIpv5y1N3Z5hUHa/JbKbMHFZTbLRBY7r9wOuAh7TN5qgqU/0IBL+k1vrN+76
	8jvUOXLiofEA1tPA==
X-Received: by 2002:a05:622a:58c4:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d20a50c50mr250088841cf.33.1786373514107;
        Mon, 10 Aug 2026 07:51:54 -0700 (PDT)
X-Received: by 2002:a05:622a:58c4:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d20a50c50mr250088001cf.33.1786373513541;
        Mon, 10 Aug 2026 07:51:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd6a796sm22489661fa.36.2026.08.10.07.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:51:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 17:51:47 +0300
Subject: [PATCH 2/4] drm/imx: ipuv3-plane: add the pixel blend mode
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-imx53-fix-hdmi-v1-2-fff9b1b17f25@oss.qualcomm.com>
References: <20260810-imx53-fix-hdmi-v1-0-fff9b1b17f25@oss.qualcomm.com>
In-Reply-To: <20260810-imx53-fix-hdmi-v1-0-fff9b1b17f25@oss.qualcomm.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4122;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4QNydV7spsaEfA/iL4Q6QeiitR6lJ+BPeYG4Ij6Ga+0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeeWDajN8HOrxXriFLb5kPXKQed7DBCYPlTJEJ
 6eIFR+YSEGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannlgwAKCRCLPIo+Aiko
 1WDVCACsjxkK997hWtj+NXAjCYxxBz2W6w7JaFqnwMTnQ/6a7fuwFDQ/RDQt/KSf0OCi2oUXplT
 o0PnrMFfRFPX25OQ9sxayIMVGb6M6261clcl9AQbWCBRf6vXz36soQ85Ip9v0Gxct33+c7IQ3Bd
 T4QLf6tDW4GDzwdFAlizX/BwMnM1k/7zjHyFa2W/MdTkm4TNJbmRzRzeO+V0b3GtLikKxebyiQZ
 t9GIeGES4E+xy3S7VSDpw0F9/ZVmEKhBA8HRTYl3QBmR6hQEsVakMphFpuqW1Nl5SJd3CphA32T
 V94et7o/IiGBQPQYmnDf0RZBiz4tmOooj6n8LGfkK56WHvkn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: spKuBxNnnIzk77M3V7ngyHlZotfybbhz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfX1Wx02EcZJnkF
 QYfas3tR/NrXeqGXuqPdAwR9okdKVy2ioBvsF9DmY/SHL2VUcjYeN2ZQXYdEDBQZNEY4uEvS0xx
 5s2DSu4lYhIXr/3CQnht36BA9ucTlLpo/sExgBX1ckg88Wv0WTg47nTL+DqxYK+207wK5FSxG1n
 FL7KKfpcsVlt054S0wcZjMUiYQvIUm8XqS2844nhO3BFxYws2Uk0KyfDSQxDlJDED87SUtev1+9
 P9jdpP9PUlyYNJzttukv6/UKf9ctlG5E8MZMQlBKpPpJ5Q1Gt5KFRBbBiePt28yW9WBK/CxqRV7
 FfF3Y5SUxLdI3i8K2CBOWvj9YAz3RPGJ4/t4bxseowWiTbQZVxN5fFr3yr0g5VrZV9kslTW/RD4
 lyD1WQetG6DgmXI4Dd8RachmawJjPMcrwZand4eOOpuAvuhjNCJjLp66OoC0HHfNQnjLI0Xvqb8
 ENn35kC9VQ7ueXDiBTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfX2ml2huMPyBf4
 8gkFbiwMJ+EbMvbw4nN0rPMm8hnooU8Dln3BOP/KXZ9A0jpYy1KnDjMD3Eb0Nai4ZynFzCRcLCq
 ytb3CQoLoMbhs433su7XL0xCqRlCHlA=
X-Proofpoint-GUID: spKuBxNnnIzk77M3V7ngyHlZotfybbhz
X-Authority-Analysis: v=2.4 cv=c+mbhx9l c=1 sm=1 tr=0 ts=6a79e58b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=5XQbaQfSCqgvYuQxrhgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_075155_896279_A712E4CC 
X-CRM114-Status: GOOD (  20.92  )
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

All three IPUv3 planes advertise formats with an alpha channel, but none
of them ever created the "pixel blend mode" property, so userspace has no
way to learn how that alpha is interpreted. drm_mode_config_validate()
points this out once per plane at every boot:

  WARNING: drivers/gpu/drm/drm_mode_config.c:872 at drm_mode_config_validate
  [PLANE:35:plane-0] pixel format with alpha exposed but blend mode not setup

The DP blends the foreground over the background as
fg * alpha + bg * (1 - alpha), i.e. it consumes coverage alpha and has no
premultiplied mode. Planes that are not part of a DP flow have nothing to
blend against and ignore alpha entirely.

Create the property accordingly: PIXEL_NONE and COVERAGE for the DP
planes, PIXEL_NONE alone for the rest, and honour the resulting blend
mode when deciding between global and per-pixel alpha.
__drm_atomic_helper_plane_reset() defaults pixel_blend_mode to
PREMULTI unconditionally, so override it in the driver reset.

Fixes: e6245fc78b65 ("imx-drm: ipuv3-plane: allow local alpha in ipu_plane_mode_set()")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 43 +++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index a0fd39eebbbc..bde5892264f4 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -291,8 +291,32 @@ void ipu_plane_disable_deferred(struct drm_plane *plane)
 	}
 }
 
+static unsigned int ipu_plane_blend_modes(int dp_flow)
+{
+	if (dp_flow == IPU_DP_FLOW_SYNC_BG || dp_flow == IPU_DP_FLOW_SYNC_FG)
+		return BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+		       BIT(DRM_MODE_BLEND_COVERAGE);
+
+	return BIT(DRM_MODE_BLEND_PIXEL_NONE);
+}
+
+static unsigned int ipu_plane_default_blend_mode(int dp_flow)
+{
+	if (dp_flow == IPU_DP_FLOW_SYNC_BG || dp_flow == IPU_DP_FLOW_SYNC_FG)
+		return DRM_MODE_BLEND_COVERAGE;
+
+	return DRM_MODE_BLEND_PIXEL_NONE;
+}
+
+static bool ipu_plane_use_pixel_alpha(struct drm_plane_state *state)
+{
+	return state->fb->format->has_alpha &&
+	       state->pixel_blend_mode != DRM_MODE_BLEND_PIXEL_NONE;
+}
+
 static void ipu_plane_state_reset(struct drm_plane *plane)
 {
+	struct ipu_plane *ipu_plane = to_ipu_plane(plane);
 	struct ipu_plane_state *ipu_state;
 
 	if (plane->state) {
@@ -304,8 +328,12 @@ static void ipu_plane_state_reset(struct drm_plane *plane)
 
 	ipu_state = kzalloc_obj(*ipu_state);
 
-	if (ipu_state)
+	if (ipu_state) {
 		__drm_atomic_helper_plane_reset(plane, &ipu_state->base);
+		/* the helper defaults to premultiplied, which the DP lacks */
+		ipu_state->base.pixel_blend_mode =
+			ipu_plane_default_blend_mode(ipu_plane->dp_flow);
+	}
 }
 
 static struct drm_plane_state *
@@ -593,8 +621,8 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	case IPU_DP_FLOW_SYNC_BG:
 		if (new_state->normalized_zpos == 1) {
 			ipu_dp_set_global_alpha(ipu_plane->dp,
-						!fb->format->has_alpha, 0xff,
-						true);
+						!ipu_plane_use_pixel_alpha(new_state),
+						0xff, true);
 		} else {
 			ipu_dp_set_global_alpha(ipu_plane->dp, true, 0, true);
 		}
@@ -602,8 +630,8 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	case IPU_DP_FLOW_SYNC_FG:
 		if (new_state->normalized_zpos == 1) {
 			ipu_dp_set_global_alpha(ipu_plane->dp,
-						!fb->format->has_alpha, 0xff,
-						false);
+						!ipu_plane_use_pixel_alpha(new_state),
+						0xff, false);
 		}
 		break;
 	}
@@ -930,6 +958,11 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = drm_plane_create_blend_mode_property(&ipu_plane->base,
+						   ipu_plane_blend_modes(dp));
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = drm_plane_create_color_properties(&ipu_plane->base,
 			BIT(DRM_COLOR_YCBCR_BT601) |
 			BIT(DRM_COLOR_YCBCR_BT709),

-- 
2.47.3


