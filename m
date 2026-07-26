Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F236CC5321C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 19:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzBRrJFfWf9nuUSk+Umahe/GXjmEn4PayMptDA8R4co=; b=n3A1SVZ1EtygYRVoYraQAnTkm/
	8luK2TTBzXDvZDxGtp6B/YPLUcLw6KSH4xbuZzcKHFWd/X/Fo9Kcn0CsjjH2jaupf5YLvhnPsTHgt
	08dBewTwTPVxXm33bBP45+223LMX2duaS1m2AiBKywtPzxEk3Ii6YUjEHBLYbxUvNJ+yNI/58lhlh
	6Hp26P2iehp8Q8pgDQzWrLkyCEjn263zj4HYV6BAsX1T0gO4+ruzYCzd4RTcMmUUM4bpKeGYY3KI6
	oHI5CCBoF0VMdmpq814DLbiQxE2Nl54IFKJiFCrZT+18M71BozIf4+7FdnmRIimWMu9WTl1/25cgT
	A/4xOsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4nl-00000001XeG-23Bf;
	Sun, 26 Jul 2026 19:46:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4nj-00000001Xd8-1rAM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 19:46:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH70nK1365912
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzBRrJFfWf9nuUSk+Umahe/GXjmEn4PayMptDA8R4co=; b=eSrHRae+4KBJsqzq
	PRmZQmIoQ8J6u9+blj/zwfOFX54m0IOTPrB/iPVShNYnvFDCwzhSKRSqlVKDvuNs
	vA+xR14w273BsD0kDwfefgw+yW4p6AFSBDFMfZ3fpzle9yt2Oi+Vu1hfg1fsXazo
	XKci7DdKH9K+o7gJuy5xA9SXDUa4hrbLKzEXBbgkDODDK679rHG83Fb0Fbcnse/E
	5w82A7Vg9wzAvkzCIPc5pcIvNVdN4FGPG2Nht9vykKbwX1mya0SDeoruIsYgk+FT
	gyUp7CWEzdUcjSXQsYKq2OJwLOpZ2lCCliBingET4Gpo+AiMNbuYYtMb0qCDIR7K
	xDewrw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqybn1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:46:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so4222260a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 12:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095177; x=1785699977; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzBRrJFfWf9nuUSk+Umahe/GXjmEn4PayMptDA8R4co=;
        b=TIrdA70BQ092c9LU70to00HI50AV4AmESbHp6A0mG90X4ne22kfk24Gp1sdSlA5oMD
         SQT0pxQS0gz89++131bD9d/4LM/8g8hvBfE7GgVtknq+Ck8LhrtCvAVgSMFB0pmNQvKQ
         3x+C+VwFdIgFNoDXP4yf4DFSfnfjT60jwBgQ2RLBH0zacvG0VbrwNGCzsGvaulV6moTt
         HjY/Cjtoc3dXHy7DEUqHMJfGcpByqEBjSXaV5Iicv4z5jgKR5dSeysk5zobyQEHp5puk
         SyxR0uKDb8S3QvzG9S39t03JJJr9JeMFNglKVv/U1k9Q0lYsVHhXlKrROZaSH08+Z73w
         cGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095177; x=1785699977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzBRrJFfWf9nuUSk+Umahe/GXjmEn4PayMptDA8R4co=;
        b=Q1G9ZNc4mQ8B0/odKXLnI2Gtz5RGeN0DW3SCwTdtFghtk6WBS0VIElaYcXACQXP6x8
         oOlHGsZnoSDE2NehGlXNUNZgr8lyV8Xt4t+upQQ7iSyYgZOv+p8Lk8hW7w8lTHgdD0BE
         1hxY8XsfrNOSTnU6tRgftO9tyWKXpyzqEAleZ92AggyzZ7E9dLBExGJofdm4eZPku+Ez
         wbrMbvYFnEsYMSECMelxHpzN1FnLTeLY3vx+Xl/sXf2wBKRCRJvGc//mIkob39nKnnG7
         48J2YHMHsVghwTDhXumfLba9DalLWX38e+ldtBfqfI5iL1aFYfu0SBrTDpX7DIlvGdVL
         pqFA==
X-Forwarded-Encrypted: i=1; AHgh+RorJ6W3JE8khHz35cVopJYPhuz0rzYCIN4x+RdqMI64Pf3H8/856kPPNHaxCPf7hgPGMvZPZnBizEfWChDfGTlK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl0G9qTFzzx7gOMmpJSKceeYCgoTxbN5AzlxtAgzP3GoefyST5
	HRzWmmYcf+YdiGQQ3iBJ1RP1sdLsANwuynOyFCtMtSsOYRP1uCM91ehwjz8oRg/DSUg9D2BtPIx
	JGBU6eiLwcb9Krhv9oJ9zYEhLT5y6fPkFPG3fwz5lTOsPWYao79C1F40fDXNquxSBSPyWNzKvTn
	77Dw==
X-Gm-Gg: AR+sD12lnwoQrdeAnj7DgD+RIn8/dfmTAUf/svQ4ffJiXiIS/gj8hjIRdJkLA9TC7Ei
	Eq98SCKpOoGupURCvrrIwYVaZ/x7/3nQjCD/GGDHMz8g5rnc1MFGVfh19GyZLd9qtUG2ZFBPayQ
	ShDhQOBajWRhQJuEVsM1FYyBSqjmYxt6ia5D+EmQjoM2uphn9LAfIGhvmz0a69/T5g4qnaiL+ZU
	XGz3qiiDBVOUKeSOAGaGSXWKyifvriFmq+4ES7cY2rmc7hHSRp05XPTTC8KxJYfvz3YtQh/MzpZ
	ZzUb1FmZFQEjb+TC6wKfiHO5Grvkt72ajhH0k/CxP7G3EUwzHHpmQHFmsFPnZP5KxJX53+uXUa6
	wGEdV5kfdphsJvGcygg1X
X-Received: by 2002:a17:90a:d607:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38f294ea129mr5919547a91.14.1785095177303;
        Sun, 26 Jul 2026 12:46:17 -0700 (PDT)
X-Received: by 2002:a17:90a:d607:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38f294ea129mr5919538a91.14.1785095176894;
        Sun, 26 Jul 2026 12:46:16 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:46:16 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:18 +0800
Subject: [PATCH v3 5/8] drm/gm12u320: replace struct
 drm_simple_display_pipe with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-5-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095129; l=8382;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=g+MDix2aoww8WVfrNbk1rE7PxKYObabHjKYvIJmxIMM=;
 b=mVZJXr+XmZgsHgsqa8wml/FP/WY7LcnwyXF2tb9+b/ejFt0L03u0D2Ll1AvyTMa4xxIz1ByxX
 qLo+sDvLyK+DfFgJTfsRiCYyQwCIqSBAsF6iNEqLbnHNKyQJtYM5yyE
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-ORIG-GUID: A-Qm70VOxotxCkzH7w6VPR4J90TOZLTM
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a66640a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cqCYvchtcWlsvxqGjdoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: A-Qm70VOxotxCkzH7w6VPR4J90TOZLTM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMSBTYWx0ZWRfX3XQ4dPp2IYKP
 2WlhZOAuqqDz6fyglZUiWTnPPKXoKpn/ouoER2krmjaw9RAJsOMVX3p6kLc4SGi57ZxcZaWPD7N
 pEu2SDJf7aoeBc1j6uQ57sKvr4ONpS3lxX6M4Jd4QHbGB1BmcTCjzgSWUSNxxU4uv3E+xgh3ePm
 bBfRb1PwZr1xj/4JveQjq3I7rCP+pObMlC7Cy2jBUoX2g53aCqISHWJi0ZLb/V7j+n8aapDiami
 W4tH0QmpEAL+svIDMgP2glnhx80JCu6+uM5YHDcoQOWqgkRkoZKlBkuUBqPnHguokvrLPmIDvJk
 tYTvRVftnJkZGV1asYOyngWn7qCwCfVCG0zI9vD4NuR0Np8Kg/bP+OPWjFql8RZXp/lLbV127hB
 xUTs7DJr4e0Y2iRsK6kAQUQbUfCHEwrXW4QieDnyspwWw3ZeyZydGG2bg8I64RJXJ8L/aihcCTj
 qm06Kesf/pNyKuG0PuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMSBTYWx0ZWRfXxX+uQpTkwM0G
 WqWZ5iEy2o58/ZwEOn7PXEaUIONkTurbNgekyqKsgzuaDdS0oBsHZNULH1Ypi1Wkzu8W/dCPNn0
 YdOvCyFELbJoJpiajPMvFxEXtyxW9AI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607260201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_124619_612537_CD437AB9 
X-CRM114-Status: GOOD (  19.52  )
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

Convert gm12u320 to direct primary plane, CRTC and encoder setup.

Keep shadow-plane helper state, framebuffer access helpers and
no-scaling plane-state check from simple-KMS path.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Use commit-local plane state in the CRTC enable path when marking the first
  frame dirty.
- Make the gm12u320 container helper static inline.
---
 drivers/gpu/drm/tiny/gm12u320.c | 138 ++++++++++++++++++++++++++++++++--------
 1 file changed, 111 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index d73dfebb4353..afcf0dfff14b 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -8,6 +8,7 @@
 #include <linux/usb.h>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
@@ -27,7 +28,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 static bool eco_mode;
 module_param(eco_mode, bool, 0644);
@@ -87,7 +87,9 @@ MODULE_PARM_DESC(eco_mode, "Turn on Eco mode (less bright, more silent)");
 
 struct gm12u320_device {
 	struct drm_device	         dev;
-	struct drm_simple_display_pipe   pipe;
+	struct drm_plane	         plane;
+	struct drm_crtc		         crtc;
+	struct drm_encoder	         encoder;
 	struct drm_connector	         conn;
 	unsigned char                   *cmd_buf;
 	unsigned char                   *data_buf[GM12U320_BLOCK_COUNT];
@@ -102,7 +104,10 @@ struct gm12u320_device {
 	} fb_update;
 };
 
-#define to_gm12u320(__dev) container_of(__dev, struct gm12u320_device, dev)
+static inline struct gm12u320_device *to_gm12u320(struct drm_device *__dev)
+{
+	return container_of(__dev, struct gm12u320_device, dev);
+}
 
 static const char cmd_data[CMD_SIZE] = {
 	0x55, 0x53, 0x42, 0x43, 0x00, 0x00, 0x00, 0x00,
@@ -554,43 +559,106 @@ static int gm12u320_conn_init(struct gm12u320_device *gm12u320)
 }
 
 /* ------------------------------------------------------------------ */
-/* gm12u320 (simple) display pipe				      */
+/* gm12u320 display pipe					      */
 
-static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
-				 struct drm_crtc_state *crtc_state,
-				 struct drm_plane_state *plane_state)
+static void gm12u320_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
 	struct drm_rect rect = { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT };
-	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, &gm12u320->plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(pstate);
 
 	gm12u320->fb_update.draw_status_timeout = FIRST_FRAME_TIMEOUT;
-	gm12u320_fb_mark_dirty(plane_state->fb, &shadow_plane_state->data[0], &rect);
+	gm12u320_fb_mark_dirty(pstate->fb, &shadow_plane_state->data[0], &rect);
 }
 
-static void gm12u320_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void gm12u320_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+						struct drm_atomic_commit *commit)
 {
-	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
+	struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
 
 	gm12u320_stop_fb_update(gm12u320);
 }
 
-static void gm12u320_pipe_update(struct drm_simple_display_pipe *pipe,
-				 struct drm_plane_state *old_state)
+static void gm12u320_plane_helper_atomic_update(struct drm_plane *plane,
+						struct drm_atomic_commit *commit)
 {
-	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_plane_state *state = drm_atomic_get_new_plane_state(commit, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
 
+	if (!state->fb)
+		return;
+
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		gm12u320_fb_mark_dirty(state->fb, &shadow_plane_state->data[0], &rect);
 }
 
-static const struct drm_simple_display_pipe_funcs gm12u320_pipe_funcs = {
-	.enable	    = gm12u320_pipe_enable,
-	.disable    = gm12u320_pipe_disable,
-	.update	    = gm12u320_pipe_update,
-	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+static const struct drm_plane_funcs gm12u320_plane_funcs = {
+	.update_plane	= drm_atomic_helper_update_plane,
+	.disable_plane	= drm_atomic_helper_disable_plane,
+	.destroy	= drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+static int gm12u320_plane_helper_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_commit *commit)
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
+static const struct drm_plane_helper_funcs gm12u320_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check	= gm12u320_plane_helper_atomic_check,
+	.atomic_update	= gm12u320_plane_helper_atomic_update,
+};
+
+static int gm12u320_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *commit)
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
+static const struct drm_crtc_helper_funcs gm12u320_crtc_helper_funcs = {
+	.atomic_check	= gm12u320_crtc_helper_atomic_check,
+	.atomic_enable	= gm12u320_crtc_helper_atomic_enable,
+	.atomic_disable	= gm12u320_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs gm12u320_crtc_funcs = {
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs gm12u320_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static const uint32_t gm12u320_pipe_formats[] = {
@@ -677,13 +745,29 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 	if (ret)
 		return ret;
 
-	ret = drm_simple_display_pipe_init(&gm12u320->dev,
-					   &gm12u320->pipe,
-					   &gm12u320_pipe_funcs,
-					   gm12u320_pipe_formats,
-					   ARRAY_SIZE(gm12u320_pipe_formats),
-					   gm12u320_pipe_modifiers,
-					   &gm12u320->conn);
+	ret = drm_universal_plane_init(dev, &gm12u320->plane, 0,
+				       &gm12u320_plane_funcs,
+				       gm12u320_pipe_formats,
+				       ARRAY_SIZE(gm12u320_pipe_formats),
+				       gm12u320_pipe_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(&gm12u320->plane, &gm12u320_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(dev, &gm12u320->crtc, &gm12u320->plane, NULL,
+					&gm12u320_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(&gm12u320->crtc, &gm12u320_crtc_helper_funcs);
+
+	ret = drm_encoder_init(dev, &gm12u320->encoder, &gm12u320_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	gm12u320->encoder.possible_crtcs = drm_crtc_mask(&gm12u320->crtc);
+
+	ret = drm_connector_attach_encoder(&gm12u320->conn, &gm12u320->encoder);
 	if (ret)
 		return ret;
 

-- 
2.43.0


