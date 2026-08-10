Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D78CC5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqPA7hXcyMthrwG82uXYojOfmSg9zyync4goyZRZBhQ=; b=xavh5+OraGT6jDCKgQatOQFoA6
	u7Kay9iPpdn/E6oRn3jSMUso8qcvH1yv5xM9B4QC2l9Ou/yaMeSo9vCTiDf2Sl5lRTL/1KvV+ycN5
	KuqONn1eNTT2MO7R0hpSMgAgbXAE0YkH6eBmJnzVoFPIdvpQrXkulUM68fo2rZcPkXVk5Yj8rbjpP
	z2/1v3bQn+eVgb2+LKl1fHu/rAjAmkNW4PIJdF6zFjcNrcKrsHID5EI8HqZ5Qv1G6p63AFY2GXgjq
	hXOSbp3gvWqXoTWMxKvFDhS4/FAVT9o4b5tOFPY4c2jFqSmdQRj0oYI/M3CxVCugJhCUKfrRUHn+T
	GmKk6Ftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRMA-0000000C6Le-11Uc;
	Mon, 10 Aug 2026 14:52:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRM5-0000000C6IW-21oI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:51:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACiv8k914555
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GqPA7hXcyMthrwG82uXYojOfmSg9zyync4goyZRZBhQ=; b=nbbvljsHFd8NaMv9
	60Ymbv+2UWGawpU++nYS+S9WZnBDLS/7oV14ocm8KpwPO4TDMCc/qcOXyrrG9D5b
	1miWShnWj0qWH3VQniFaVj5QfYFZN/VBH8XhOA/bnJ2b3wcObKT3Th6P8TMTTeYG
	3TGxGNJg9Qkfv/eNqg3wuVaRtOyvCLaVYargiDmRDg5U6+voU7YRysiwmC/hlJLP
	jvhwUDdsz0JSYOaxY9LaeSt4Sp0sd13XbMujRmBMiLD+NDqVKcJKBhwB4/ynaRuw
	UPR/joELBkeS626z5LSjRN0yqMdJbd0o1ApYpNRlQ7vISG3RNP1xSK9hTxTJmgzN
	5UthdA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v921mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:51:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8db414c7so28122301cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373516; x=1786978316; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqPA7hXcyMthrwG82uXYojOfmSg9zyync4goyZRZBhQ=;
        b=enxJxLKPIPtMu430UeKXXgorQWHfzSL+6/WEfayTLKeKKnXtOeqa7mWKZRkzqqdeIp
         k6mhAcD1AuCi7Xhai9pDE56DmgFgS8gzZS7xBFKe63iuhQ+V7CwXQIgRkq/s1JgbPQen
         N5ipLjkgWfiuBq1zyFEMJ4TAbl6DHu5xUjsiAAliIOLCjPdSNmuYEJDl4HeDdzK/y4dJ
         m8fpEgs2JBL8bcatMb2ikqdiKGyenuHqW7iNp8L82C4q/nF2h6ZYHKh6lhTaN748xohF
         BzbRDQfiDgIzW+SWVk7ynet+XVJevXgYV28m8KQww1I+HEIhHXmRli5gazvOClNzAU6P
         c9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373516; x=1786978316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqPA7hXcyMthrwG82uXYojOfmSg9zyync4goyZRZBhQ=;
        b=Pwyk2VfL1Oy5R3mBTcrqGlW5tmGAatF5bPLgcEsjbVzgyqCc82sE8xXb3v8jqhsu0p
         njAv0u4F4dO1oNje9zgnm8VJ3u8NKa382N0l3y/OjNnfDL53evN3+5pdFnKWTxiZOvZu
         WyCC5l2ShZKa0MKtdPM6kWMkPGmdomfAJrOD4riNTyzIbcbo3QVsZ8j8jDYVm6Q6LZGQ
         kN0ec7/o8MZialD6tXPxanqtP4YL2iC+wNubap2HCyZ14gLkr65/r5fh3NapLt2/n7Kd
         u62rg3u1kgJxZFZIoNeS+hzac9H0Svf8hyN9TfJf99Rwwl6XWz4IFH0FDOIBt+CSjFek
         pa+A==
X-Forwarded-Encrypted: i=1; AHgh+RojOVq//WiuC60P4mVbFEdCkDsOperFCOw2ZiBmTsLvTXQ7kJXa28y6JLiz8TFgf5n8EOYwIr5bq/srYFzEI7oq@lists.infradead.org
X-Gm-Message-State: AOJu0YwsvYmjoaF32QpegxMib/4T0KIJdcCGD5zcECHXguTLIizinXG6
	VGQcCO0HyDjET3n7eT9wLlWiRNxtppb5kPKxI7DaLR1bbU/uqFBwvmDVYoGRQXXEwQqn+UTiRBr
	+rr82bBBuktaO0/DGFiYINgf/zRLxvL/BlFi+s3edAWZJ3qObTBRp1C6e1wx9wRkBoIKX6S87Rr
	qtOw==
X-Gm-Gg: AR+sD12keDhBTFE5uT5TijrlKmUvoNOPtZjzzXiEZUEQ6ozQ61hRqUzewQxhB/nWtBC
	JcdSc+q5vpSamwyN8zkl4J/Z8eQyUeohwmZag0Ifq4ihmbTVn4TA4yna2LZORj6H53mDPmxwI8k
	wHBChU2J4B4qL/RrObADI+aCjBBYaS37nUKp86x5KuJOXQGqCpzC2VyFSk591QdiwA3JPPf7UI3
	xzJF7333Xbj1XIQdhypj3wND5z/mARUhN16nOfHyzB+Zf8GVA3nNhFISQX+OVJ83l6Tk38G24eO
	uSdB+499vtd/llZJwOJvfKb8FRds7MgeZkmjoOXe6zHXtAHRVm7P3wd+5q21117C3TkEhubdlpQ
	V5MPzy9FXbQL6aQaOue5Y2B6ylNAcJruyvbHq/8K4teja8VSqGbMaF/qTJTYX6753LuNZyN7ziS
	TCjWKsay9QnRS1Mg==
X-Received: by 2002:a05:622a:1f1a:b0:528:3142:d466 with SMTP id d75a77b69052e-52d20a920d3mr246432001cf.41.1786373515724;
        Mon, 10 Aug 2026 07:51:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1f1a:b0:528:3142:d466 with SMTP id d75a77b69052e-52d20a920d3mr246431491cf.41.1786373515360;
        Mon, 10 Aug 2026 07:51:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd6a796sm22489661fa.36.2026.08.10.07.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:51:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 17:51:48 +0300
Subject: [PATCH 3/4] drm/imx: imx-tve: probe DDC before claiming the
 connector is connected
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-imx53-fix-hdmi-v1-3-fff9b1b17f25@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2249;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7lyUVLekb6zlqpOSAGMVtbpV+Z1fQct7CYaiDbqLUpc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeeWD9jjTXdp/CoYzaPsKhbyUM9+TRBy79PDfc
 XNO7eehHrCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannlgwAKCRCLPIo+Aiko
 1WPOB/4hXVGf/LzwhsVzCfMkzOBW4qjN/Ris2XQ255uOOa/LZjSJgMWkQVFfI+0aN2uCQGqzWHH
 4YQDal7J8s8zS30byb3gcc844q6FobFk+COFnofwcmZdJ28y2Vi0A2D1V86Frfq1s3KamI6jzdO
 R1Z6W0tynrioBOWxrcHGooKizE4yYiDsE/ExS+An0PoigjfeniNSsW0CGoYCRBbk5omAmriH06B
 V3CcHqMmV3ekT1hTga+WWyuEBPwqDuHrriCHNVUMq4jRHuObKlh7var03UcK2QaSbUpDjH43HPx
 I6eFwO/UtgiAybX2jJSdJpn4PJ10kpXUz2Utw0BgHGbFrFcd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfX7VgQbEYj56Xx
 ojWYpAlHgmPxr77RDAECqIXCLf8zrBWZY99bBs0B4D5cefcSl5AfsNRHxmv9XM/hOvYlVsHkDv+
 tKoSOpOF10e8H41XaWeP6miCIkJ2cwA=
X-Proofpoint-ORIG-GUID: VgFSfJucaOOII6vROq57c2BohjcnCtyC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfX9xZ3GlRAZzIu
 iQ26zxORVd1bHw+spYDNV6dkFVoyqYiyv1jRPdca6JPhZo+hzEnCGoXGp+XdFx6kYpRqhwyhRZ1
 tv8xsD51OibRAuRdzEr1Lf50EA8bvWBouT+ra35Lej5Sww+eaNBtyOITbpIdg6Wbq5C+2srhPqV
 oskJ6Rz2JdC4jhvWKcCLU2cUB282hZOPY32MKDud4N2dBEE8oj9v8xEWX6Mt2Q6FwDdKyrBxmeD
 QbTJRNRRMmDufNfAEPMcHKUkm2NOOQgX4EK5L6luvZiorDdeXj1l1alkFNiTgNTY/acV7optYxW
 vIqsCXkAOwECZqCN8e6L0gK07ouRi9xCOX7Kpy/xeI2O8M5ldkxPSCKA+2YmTGJHrRI7S8b52B+
 mdTgv+gX6e+3YBrjD1yr5MXQRaItuw28r2zn4S2KZ2wbJPYX+/07cMdGaDzKzghlRH5kip3pZCg
 q4Cxv6pPb6xiHU6uVfA==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=6a79e58d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=f-i-my0U1ELCb1aI9soA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: VgFSfJucaOOII6vROq57c2BohjcnCtyC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_075157_530529_3268077A 
X-CRM114-Status: GOOD (  17.68  )
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

imx-tve provides no detect callback, so its connector is always reported
as connected and always gets the drm_add_modes_noedid() fallback list,
whether or not anything is attached to the VGA output.

On an i.MX53 QSRB with the MCIMXHDMICARD fitted and nothing on VGA, the
fbdev client therefore lights up both CRTCs: HDMI on DI0 at its preferred
1920x1080 (148.5 MHz) and the phantom VGA output on DI1 at the 1024x768
fallback (65 MHz). Both DIs are ultimately clocked from PLL4 - DI0 via
di_pll4_podf, the TVE via tve_pred/tve_ext_sel - and every link
propagates rate changes, so the TVE reprograms PLL4 underneath the
already running DI0. DI0 stops generating valid timings, its IDMAC EOF
interrupt (which ipuv3-crtc uses as the vblank source) never arrives, and
every commit waits out its full 10 s:

  imx-drm display-subsystem: [drm] *ERROR* [CRTC:40:crtc-0] flip_done timed out

The TVE outputs have no hotplug detection, but a DDC response is decent
evidence that a display is attached. The connector is already registered
with its DDC adapter, so wire up drm_connector_helper_detect_from_ddc().
It reports the connector as disconnected when the DDC bus is there but
nothing answers on it, and falls back to unknown only for boards that
describe no ddc-i2c-bus at all, which keeps those working as before.

Fixes: fcbc51e54d2a ("staging: drm/imx: Add support for Television Encoder (TVEv2)")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index e861b8b9d8fa..11ac69561eb8 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -322,6 +322,7 @@ static const struct drm_connector_funcs imx_tve_connector_funcs = {
 static const struct drm_connector_helper_funcs imx_tve_connector_helper_funcs = {
 	.get_modes = imx_tve_connector_get_modes,
 	.mode_valid = imx_tve_connector_mode_valid,
+	.detect_ctx = drm_connector_helper_detect_from_ddc,
 };
 
 static const struct drm_encoder_helper_funcs imx_tve_encoder_helper_funcs = {

-- 
2.47.3


