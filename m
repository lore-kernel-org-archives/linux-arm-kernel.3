Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D7AC4450E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0bpK7inA55ypw9IyK4ZYF+yJtIn8h5ntrPY4x3zw2I=; b=l4MDQFOLslN/5vp6V308EXGqW1
	6H4GvovOPd4dSCr1nzYNlCIMxsN8iv59b05hW9VO92UewqSg4NWMdaDlw1zwy8ZoxX5giSYpK1D3B
	Ws/KFjMnGJo8ppOgDuRVioAbBYpjoZcLDPde6EhaI4Wbq4bddxp89nM6cu31axjKJ9hxnq3h7r4Q2
	SnS+svrsCcySphtRQuk6Bn92pAtb41ZJc3YCcX6PRZ9ANbUf23e5CnlQJql3MGdLRfbUVvL90q6/t
	vmx74LDrDzBucDaLX0EJ/EybfrmHMBkI1C5Ugmeo7azm2PSvUNq9515AH22lCUxaJM8ZkXfqpSUtw
	ECt41/yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHzg-0000000Gno8-0rsQ;
	Thu, 16 Jul 2026 09:03:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHzd-0000000GnnT-2S39
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:02:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G837vO2123239
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K0bpK7inA55ypw9IyK4ZYF+yJtIn8h5ntrPY4x3zw2I=; b=jtsMH/CiIg+IYyIM
	UoWG17o1MwtLWopLoZO3sy24Al2Z9sOFbaENN4AOVJF4xU+bpPR+d9C9787h4TwO
	tSi9Ly3o/bxKWOdhB2fUU2i6GLhIiOeLqh+axAMMQ1eq/rr8R37KUew+2z2OQOHC
	nepZjqnosLkUboNLZlbyuXUjJEuUwJmPnkH2LVpO1iG4PXZJbOh8GFxD2BcKMFn7
	41Czs3gRW49t6RwW8MVnxwacodggU7naT8AG19dTfVi+b1JqsixtDBt1+u2reMB+
	XBxXv62GBdx6j/TuWz2kjm07GxtIOsh5Py6VZY4wdDPyPKa0u7dUY310ccoTFnlq
	1cRjdA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex072u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:02:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso154816205ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192575; x=1784797375; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0bpK7inA55ypw9IyK4ZYF+yJtIn8h5ntrPY4x3zw2I=;
        b=IqKw8qM3FfE6zi+diHtkPlAMe5AvOiR10camDzhuM+03n3jOjomQqbQTXbs6CeuTCj
         lS48TsIYcv7rnB+Yliv/+A9Zc0eGD4dAPadlU/PK6Q35FEXdqvkn4VCF7fldfliugBKF
         UwCPKttkXM2TxolgSs36sH8xRXLPwQeUYcb0KsoFfB+DMS7IRCHIr7zvpkAY1/kR3bMy
         4ZHmRBzpsT/45cMNtuUnYOYFWBV51LcwHfco2Jf1K7qaGv6kSnQRZjjXUznZaevxomhz
         Eb5Fjv2rnjkVBamhdxNLGQYpR0WvlYdEovYwYMMBiCxf64GeWOP36mIjjGF6qs1QVvtZ
         iZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192575; x=1784797375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0bpK7inA55ypw9IyK4ZYF+yJtIn8h5ntrPY4x3zw2I=;
        b=WDxaR/PCPB90asHK0w61UHwUOiRdDxieEvu5FCsfGBmvcsDpVuQwpfVaUe7A7/bUCV
         DUuYE+5RBKf81Wr2l8qCgDyZrmd7gzpTIsnlXoudxC5HiDYdiV1Aydyv0DxuJ78X8ft7
         KehA3mj+VtQI/exZbFmbFLy7oR/0Eem1bf0XKT9/yFDvh8MQkZtwU2rXzxAIwz8tM07c
         d92Ka/vVePPLfGVh+VYsBqNSKrBEIpuVVnq5VbOukYojrDkHH7+ivkmxnywuUem3G9qk
         aPPtmio4YhdWdGOH//yrlzu/aOyTTpbMOliA6tEbpc1TVz9d/BGrRFRMuENG2NtL4mbX
         TLJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQLwFBtI3LU/BSZMCwgl8ERjQ2JRPWmK768jk5BJUfWS1n2f/szNF4ErdYjc7tiq6rjZtoX4Dn4X9eluAurjrI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4SKUxHBYfrwCuJRx0OghlrsKce0++U26Tz3I7t7TMdwcSttR3
	OOBy44fOsRLGrrwN3SOj4xhXOK55BpuQ6Sfo6MeoNdgMch78DNbtRUlstcBf4ln/LumrPmTtDYu
	66kTu3Jl0zzHLEdEYiFcxqVSt2ylo88I8nkVi9zdqtvoMcwFLcvCps8riMcUSBNymdd9ls1Zu3o
	BvthvMbh+BpehP
X-Gm-Gg: AfdE7cmI/U8Y7AYt9FRlW8yBTWISeO6dUW7jV4LKLY2VAx73EH8MM13P8Co4yKk4Q5x
	piSkM08hvyDBNl7UmGbD46KxmrDIJFBL4FvDwr0rGhfz4lbGbGWkDrCpG3tYkJJFoK11zFaWmKQ
	/aumlcXt97LmjngC98RUwSZAeM3aLUvujLzdPjhUmYGdwc/TQR5ljnY7s6M4XwVWFLlLh4pD+lo
	cp/0xtjVvMEtrIOXsPaJ+V1gs2dINEqaXVpOZZyMT7JJtOFRFTf9ogE3RtaCO8vgxPEE2KrBtMj
	SAyGHZzjl6eVwPf/L4dZC1P+tzKi2OjCiKeeHiM0SLMM+ht1Jm7HdH6dd8QotKkN1cd7f4bNCzK
	R8BDZ0Zp8VADY/RqVfcR5
X-Received: by 2002:a17:902:e787:b0:2cc:7c36:2c23 with SMTP id d9443c01a7336-2cf03d6be8amr56675235ad.43.1784192575392;
        Thu, 16 Jul 2026 02:02:55 -0700 (PDT)
X-Received: by 2002:a17:902:e787:b0:2cc:7c36:2c23 with SMTP id d9443c01a7336-2cf03d6be8amr56674695ad.43.1784192574779;
        Thu, 16 Jul 2026 02:02:54 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:02:54 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:01:53 +0800
Subject: [PATCH v2 1/8] drm/arcpgu: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-drm-simple-kms-removal-v2-1-1133a8fc3785@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192559; l=11611;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=mhZuZpvxlw2add5yFJofNe/qRYemwKr9KZXWIRbaR4U=;
 b=bKGcIBRbY3DWlMj5Cf4cPqNMuGZMGDU6qKuQzX/N11LATYpXjJUNET/zATFlfhoW3+9trVitB
 aYnklaVV/K+BCQCTcDi+FqGjUSBjW456AT7fVFNvbJXR15fJ9ZpoOgM
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a589e40 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dobV-df0kVLvunOko3gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: rrGBHry-MBMQJpXdj7lCAIrOgVc6C56W
X-Proofpoint-GUID: rrGBHry-MBMQJpXdj7lCAIrOgVc6C56W
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX9MTAcHbMnnlR
 0Cp3U51gnTzYgJha1mPXyvA/mXCqqKylSLByisX14Nlaef9eY0QaGEATHHQSczc8cEKpFpvcdRC
 x2g3IkrsCMSB8yEw/hbOzgrfW486MrM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX1W5AeSpOGj93
 5shinoMusak7/s/lR3kOHTbDz6zzAdz6eZswgOVJ7zdWF+ZppIiNu6EMUbraBikd8eIvgdy76R7
 WmNRGbqiXkCj5X1Sap7dFB533cWdgDqc9wtEf4MXeS3QRqcfGhtarqv0xPx5AQutRvcsmHe2z8J
 18jRZDofhoh6LIL4p9N9CXJgoUABnDSBPNh3s+MS6+ndreoCEGHTu/gCWjgXfWAJLhtWtkCOxKS
 xKsd0fMcfbpBP/kIqCGhdwEAczcHQLTQttKfKPpFhr99SYAT3bwBnq/uad5Qx5hYEXNg7caWhDq
 ndxu8Y0Gde2goHlCEHgHSUOQVxfWSkyykLp6gn3f1Zlkp7HGuJ3zZ4VLOfQ6w2qhBlneZ3U4zLJ
 aNs5cGLUxTrrMFm1X55KeLP63KXwvT/1+E4z8mVZd0dnLI8fkVB1jKwfFxdK4hqhbgFgabFRMFC
 MRVfo68BCR3e6oHYjkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_020257_754153_7BEFF798 
X-CRM114-Status: GOOD (  17.75  )
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
 drivers/gpu/drm/tiny/arcpgu.c | 179 +++++++++++++++++++++++++++++++-----------
 1 file changed, 133 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..e0cce4798f3e 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
@@ -17,12 +18,13 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/of_reserved_mem.h>
@@ -52,13 +54,16 @@ struct arcpgu_drm_private {
 	struct drm_device	drm;
 	void __iomem		*regs;
 	struct clk		*clk;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane	plane;
+	struct drm_crtc		crtc;
+	struct drm_encoder	encoder;
 	struct drm_connector	sim_conn;
 };
 
-#define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
-
-#define pipe_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, pipe)
+static inline struct arcpgu_drm_private *dev_to_arcpgu(struct drm_device *drm)
+{
+	return container_of(drm, struct arcpgu_drm_private, drm);
+}
 
 static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
 				 unsigned int reg, u32 value)
@@ -117,7 +122,7 @@ static const u32 arc_pgu_supported_formats[] = {
 
 static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
 {
-	const struct drm_framebuffer *fb = arcpgu->pipe.plane.state->fb;
+	const struct drm_framebuffer *fb = arcpgu->plane.state->fb;
 	uint32_t pixel_format = fb->format->format;
 	u32 format = DRM_FORMAT_INVALID;
 	int i;
@@ -139,10 +144,10 @@ static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
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
 
@@ -155,7 +160,7 @@ static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *p
 
 static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 {
-	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
+	struct drm_display_mode *m = &arcpgu->crtc.state->adjusted_mode;
 	u32 val;
 
 	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
@@ -194,11 +199,10 @@ static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
 }
 
-static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
+static void arcpgu_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *commit)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(crtc->dev);
 
 	arc_pgu_mode_set(arcpgu);
 
@@ -208,9 +212,10 @@ static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
 		      ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
+static void arcpgu_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *commit)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(crtc->dev);
 
 	clk_disable_unprepare(arcpgu->clk);
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
@@ -218,35 +223,95 @@ static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
 			      ~ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
-			   struct drm_plane_state *state)
+static void arcpgu_plane_helper_atomic_update(struct drm_plane *plane,
+					      struct drm_atomic_commit *commit)
 {
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
 	struct arcpgu_drm_private *arcpgu;
 	struct drm_gem_dma_object *gem;
 
-	if (!pipe->plane.state->fb)
+	if (!pstate->fb)
 		return;
 
-	arcpgu = pipe_to_arcpgu_priv(pipe);
-	gem = drm_fb_dma_get_gem_obj(pipe->plane.state->fb, 0);
+	arcpgu = dev_to_arcpgu(plane->dev);
+	gem = drm_fb_dma_get_gem_obj(pstate->fb, 0);
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
+					    struct drm_atomic_commit *commit)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = NULL;
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+
+	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
+
+static const struct drm_plane_helper_funcs arcpgu_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= arcpgu_plane_helper_atomic_check,
+	.atomic_update	= arcpgu_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs arcpgu_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static int arcpgu_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					   struct drm_atomic_commit *commit)
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
@@ -254,6 +319,9 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	struct device_node *endpoint_node = NULL;
 	struct drm_connector *connector = NULL;
 	struct drm_device *drm = &arcpgu->drm;
+	struct drm_plane *plane;
+	struct drm_encoder *encoder;
+	struct drm_crtc *crtc;
 	int ret;
 
 	arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
@@ -285,6 +353,30 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	if (dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32)))
 		return -ENODEV;
 
+	plane = &arcpgu->plane;
+	ret = drm_universal_plane_init(drm, plane, 0,
+				       &arcpgu_plane_funcs,
+				       arc_pgu_supported_formats,
+				       ARRAY_SIZE(arc_pgu_supported_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
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
 	/*
 	 * There is only one output port inside each device. It is linked with
 	 * encoder endpoint.
@@ -293,29 +385,24 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	if (endpoint_node) {
 		encoder_node = of_graph_get_remote_port_parent(endpoint_node);
 		of_node_put(endpoint_node);
-	} else {
-		connector = &arcpgu->sim_conn;
-		dev_info(drm->dev, "no encoder found. Assumed virtual LCD on simulation platform\n");
-		ret = arcpgu_drm_sim_init(drm, connector);
-		if (ret < 0)
-			return ret;
-	}
 
-	ret = drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
-					   arc_pgu_supported_formats,
-					   ARRAY_SIZE(arc_pgu_supported_formats),
-					   NULL, connector);
-	if (ret)
-		return ret;
-
-	if (encoder_node) {
 		/* Locate drm bridge from the hdmi encoder DT node */
 		struct drm_bridge *bridge __free(drm_bridge_put) =
 			of_drm_find_and_get_bridge(encoder_node);
 		if (!bridge)
 			return -EPROBE_DEFER;
 
-		ret = drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
+		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+		if (ret)
+			return ret;
+	} else {
+		connector = &arcpgu->sim_conn;
+		dev_info(drm->dev, "no encoder found. Assumed virtual LCD on simulation platform\n");
+		ret = arcpgu_drm_sim_init(drm, connector);
+		if (ret < 0)
+			return ret;
+
+		ret = drm_connector_attach_encoder(connector, encoder);
 		if (ret)
 			return ret;
 	}
@@ -342,7 +429,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 	struct drm_device *drm = node->minor->dev;
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
-	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
+	unsigned long mode_clock = arcpgu->crtc.state->mode.crtc_clock * 1000;
 
 	seq_printf(m, "hw  : %lu\n", clkrate);
 	seq_printf(m, "mode: %lu\n", mode_clock);

-- 
2.43.0


