Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6055BE6FE51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 01:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4f0Nmr1gI6kLHres3R4fEDj4W/LRmTszLklxKTrGmQ4=; b=TAfnw1XPwnEZFPf15cb9Xf9IY7
	UldVM9XoNu3z9O37YlUeNQuNw0qqUj6hwhbCK3yyAF7sU8V1yVPzeomcyeQZw8hWfrBgvFEoruUWE
	82nBx2VfSCudWXzlS1V/NNwanaWQCkVfwgky+kmuX19JYI3auL42NcQaFT/37LDziJTh19dB83am8
	PSYe7ltd20rcU+z+xrci1OfgkZ0uYKJClI74TlybGFZHONWO/Nk2eX+aAfRN//QKRzrEbEvoOKLPO
	QAhYH4RVFVtsEMtL+HPqzrSwrwMNwbNfunB3LP9YaXFZ6eVUjRCcx5U9UiTTSyJOuTBw7eqiVEaON
	b4izJMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDIE-0000000GFHJ-2lPv;
	Wed, 24 Dec 2025 01:03:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDI6-0000000GF5m-3Bd9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 01:03:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNEN8r8913441
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4f0Nmr1gI6kLHres3R4fEDj4W/LRmTszLklxKTrGmQ4=; b=ErF+H/k6f4Dblwc2
	LANGe5ae2oNPlhahyHIhRPTYaYKaFHMb/MEEOv5L8W1Cx6S5gq69elBe/k/Pe6Lu
	/yky4ZXwAYqHVlXvloZy89O8BZwBf4T1TOxl3iwTJYi21102jLVWuniX+k0hkDup
	o89Cc93Ubo1ofN2xw4eawieySUdIbocc3zdsNqKtQBcZC1pQtTzqacfAEUw/onhy
	FL69OY1x9icKegAtSariGEa+yEjvNqbsYGxvYXZqJEcw8do5udHCLdEry0e85rlN
	9DA52/6MSCy0Bjc/9RYu+Qrxh+vE5kgJQEW56QGt67EVXSUnTUpE01brcRfFaDH3
	SgCpHw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2hn1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:03:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1f42515ffso131885931cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538229; x=1767143029; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4f0Nmr1gI6kLHres3R4fEDj4W/LRmTszLklxKTrGmQ4=;
        b=iOtD3/6VBOmC9SvatwyGl0iMwziK2mcf5o9bUCMTJjcSLhWoVcyqkrLQ3tncEBdp+Z
         Qbmn6fPrIn8Qhh1mpAzGa33vYBx2OAojQJkt+21cERRuMZNUPlcbb+r7a2Zdrro0tZ40
         QI6U3UYWiJnQfK8JnEDhwwteXmndrci+6ryy28xhtKlsEqVrJdGRM3NsPpijgxDcYi6C
         mJEqh2q2xV1EEDSvHwcbYMrPb2TPqn+UT6b4LNweTgT7N5VZpk06pO0U9BYKSDVN2VUK
         rhrT5dyWrDDT7BKNIdNcTPI3/eT3Q+6GNC2GaBfaGVCIhEdEdzSsDr70/W/m+t/65vpQ
         WXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538229; x=1767143029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4f0Nmr1gI6kLHres3R4fEDj4W/LRmTszLklxKTrGmQ4=;
        b=ItjsgeJMVtGLTBL26isRTtllApKyNz9JhQFCfGOPYRpkPAI+LdYyCKSUW9Rb2E9PiO
         lykmecXfjtRj+EknS0gXx94K9ZWL8+fy+9tENPc5NqUIr1Helj7lqZek95QwjH4OmkSV
         k/HieJooEYz+fyZGl6A8UBJLH7pATQLDJni//FBdqdvKHBOSn45UlZrXTM+u3eqOfQe0
         pmSyoeVwhUjzVOlnG8AMPu67QbXz1qBAp/lVTHw/c3vEURn4+RlPpGpq0/mPavca4Ard
         +kgfCc+KJFdp7tnPAWzfVUfWf3w6bwModJWIlPIkfz/oMm0+OnaycY5oAAwt1YIFaf4C
         PYuw==
X-Forwarded-Encrypted: i=1; AJvYcCW0S/6JyXl7kHs9XXxQWMVylmpzRSG2SHpaZdgqtqEz38rGL+L4tQR1mOs4VTcHUX5bnSY6GOD9CqE5Zw7YKLgG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh7FxvbxWfvKqoidvQDbJaL5/nRW4zpZilL6obFmF9ZHs9i++R
	pjYgx3mGK+W77xpWQKldmrQ9+m1AJfVhbK89zKdwESYM6Xsl6dlyfnVwSbn2AkmFqIOo3LYwPD2
	Ws1ATJ+bHWeE5WzQywxz1dvhIXA2EfbFfN0iIML8IRZeyMd6ZH0T254f196DHV3deNv5xIimW2o
	KcMA==
X-Gm-Gg: AY/fxX6+nD8hkVCMwKLnPrOlBwHzmCrxyGzbPKiIrsMyG6+Cd1DxvTNbqUlE1Of44P5
	jCSd+BxQabRokYLI2vgq9NuTHkUjfHDd6a+nDBh+3QKeV5XVU6Xijcg6tm9r1P/c0cYUtUdOv3n
	JVISGaqiCLook1eg+HcrjRlnXabNS/3obpH2IE5fYEvaFOufUtA7hO8bRcEEfmfChIc+Xs7s7O3
	pNNuc1WqzldqtiRhjf9vC+Mf9/Xfj5htFHz4qRgHmLDqWA9WcSc5Os9eUkDxiECBd71vpknyQkn
	O1jhD0vwvL3P/To+pk5bCgk9nZUqf40aj+X4vZn2/6xZOOTT3PZ37kmHVxcahnkN0nz6Qf/l3g6
	gVuEftEE39vCk1zuyEmODVlse/MbZqqP4xcM0omWit9o7xe3yx8vcIhsYxduvppD1ywud8SE9dl
	Pc3HetZLPh/Zt8hiB77OWttmM=
X-Received: by 2002:a05:622a:1452:b0:4f1:c6c4:dbcf with SMTP id d75a77b69052e-4f4abd798d9mr222028511cf.41.1766538228353;
        Tue, 23 Dec 2025 17:03:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbTrd16vSJ7f7WUUSqIvAXX61qJZiWxMvCe/My3Edj08irC9mxXMsAXAYp29gClMerW3Fo1g==
X-Received: by 2002:a05:622a:1452:b0:4f1:c6c4:dbcf with SMTP id d75a77b69052e-4f4abd798d9mr222027691cf.41.1766538227412;
        Tue, 23 Dec 2025 17:03:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:54 +0200
Subject: [PATCH v3 05/10] drm/bridge: refactor HDMI InfoFrame callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-5-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=56672;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+QPYF0Tug/JCmoPzh+bFm4wK4F7oGHQUQ4VMfR5uVQU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvYuLFaXxScuxNF1+0/TKkFs1/KWGCWOp7cZ
 tktA5DxF2SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72AAKCRCLPIo+Aiko
 1SReCACElWIaoH7XXV8LOFGe2NwhAIEnuRcV4R5poA7xyil1ylOzsHV7RBI5ZN3FZCBGaBNZOxg
 lLZoHZf77SrGqo3AhKy3/ePXwlP/aN4dd3Ypqi41/2ikxbsaQ4uTPtH8EhA5Gp+3l6WjB8RW62R
 xpHVQyYx6B0L+BdRG7n3dkbNw/dBAlxouIHbpPJ5r34fLnmWyUO3ad4W2njO3iEhSuh/Y3q+LmZ
 SbR4iD3tPzBCvoj7HjVjNqlf2TtgUo7y4m1RJc169QxgtXkZo8j15gJvAP2GAWE+nXaOM+WPaVk
 EcbeNyb8wd8D6hDWY4fZX3Mo1ab2v6gGXGhnNIeQlFSXR9+w
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX1nOAvIBVF0Mv
 yiB7IIz3LP4r0kP1QkUrrl7MtZoQzl6h+MlaWX7RHa053X6avqXuBztrVAeii/3k7BXRGyW/Rzg
 ocLv0m0QcaIGbNx4BB1vyeZ/5N1TVFygTu1a7SXKMweIFSC6XIgdVWxeW/+bL5+GFPnndNnELgX
 E1Jt+9aN+thQqxh7302w+aFjWjOsq1vxxhwX/uHY2HGRBIot4k2+S/w8LrpUta+KMFSa5GW6CG+
 NfG5fz7w2m48BpPik1DG8GkITZuOCVD2pKALX7NxP6DC15Cch5rD36ZTNAhQZrgv43J2Iv7CeK8
 Cjt/10asTKBLu12fEGGVEtNeu/GCFSD3UFTRx2+nh0LD9Y1TNKP69NJGZDzG0tYNm+tgDYrvH7F
 5eMOgYOfvHItqa91Kl1lr2eCE+3LxAa1s28yZukzQuF3N9CcmfdcHgB9suxDUoCW8p0QEm4c1WZ
 k1xBs4hv7xFUKeLLaXQ==
X-Proofpoint-GUID: -T3I3uFPuoMzMqFTuIqHAQlK4JyOw-j5
X-Proofpoint-ORIG-GUID: -T3I3uFPuoMzMqFTuIqHAQlK4JyOw-j5
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694b3bf5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9DOczjz_NQof1JSYJV0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_170351_141119_EA2B2DF1 
X-CRM114-Status: GOOD (  19.57  )
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

Having only a single set of callbacks, hdmi_clear_infoframe and
hdmi_write_infoframe, bridge drivers don't have an easy way to signal to
the DRM framework, which InfoFrames are actually supported by the
hardware and by the driver and which are not. Also, it makes it
extremely easy for HDMI bridge drivers to skip implementing the
seemingly required InfoFrames (e.g. HDMI VSI). Last, but not least,
those callbacks take a single 'type' parameter, which makes it
impossible to implement support for multiple VSIs (which will be
required once we start working on HDMI Forum VSI).

Split the callbacks into a per-InfoFrame-kind pairs, letting the bridge
drivers actually signal supported features. The implementation follows
the overall drm_bridge design, where the bridge has a single
drm_bridge_funcs implementation and signals, which functions are to be
called using the drm_bridge->ops flags.

The AVI and HDMI VSI are assumed to be required for a normal HDMI
operation (with the drivers getting a drm_warn_once() stub
implementation if one is missing). The Audio InfoFrame is handled by the
existing DRM_BRIDGE_OP_HDMI_AUDIO, while the SPD and HDR DRM InfoFrames
got new drm_bridge_ops values.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c   | 180 +++++++++++++----------
 drivers/gpu/drm/bridge/ite-it6263.c            |  95 ++++++------
 drivers/gpu/drm/bridge/lontium-lt9611.c        | 143 ++++++++++--------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 110 +++++++++-----
 drivers/gpu/drm/display/drm_bridge_connector.c |  70 ++++++++-
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c     |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c         | 110 +++++++-------
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         | 195 +++++++++++++------------
 drivers/gpu/drm/rockchip/rk3066_hdmi.c         |  47 +++---
 include/drm/drm_bridge.h                       | 127 ++++++++++++++--
 10 files changed, 682 insertions(+), 403 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b9be86541307..1050bb62280b 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -887,88 +887,111 @@ static const struct drm_edid *adv7511_bridge_edid_read(struct drm_bridge *bridge
 	return adv7511_edid_read(adv, connector);
 }
 
-static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
-					       enum hdmi_infoframe_type type)
+static int adv7511_bridge_hdmi_clear_audio_infoframe(struct drm_bridge *bridge)
 {
 	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_AUDIO_INFOFRAME);
-		break;
-	case HDMI_INFOFRAME_TYPE_AVI:
-		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
-		break;
-	case HDMI_INFOFRAME_TYPE_SPD:
-		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPD);
-		break;
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
-		break;
-	default:
-		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
-	}
+	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_AUDIO_INFOFRAME);
 
 	return 0;
 }
 
-static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
-					       enum hdmi_infoframe_type type,
-					       const u8 *buffer, size_t len)
+static int adv7511_bridge_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		/* send current Audio infoframe values while updating */
-		regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
-				   BIT(5), BIT(5));
-
-		/* The Audio infoframe id is not configurable */
-		regmap_bulk_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME_VERSION,
-				  buffer + 1, len - 1);
-
-		/* use Audio infoframe updated info */
-		regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
-				   BIT(5), 0);
-
-		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AUDIO_INFOFRAME);
-		break;
-	case HDMI_INFOFRAME_TYPE_AVI:
-		/* send current AVI infoframe values while updating */
-		regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
-				   BIT(6), BIT(6));
-
-		/* The AVI infoframe id is not configurable */
-		regmap_bulk_write(adv7511->regmap, ADV7511_REG_AVI_INFOFRAME_VERSION,
-				  buffer + 1, len - 1);
-
-		regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME_LENGTH, 0x2);
-		regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME(1), 0x1);
-
-		/* use AVI infoframe updated info */
-		regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
-				   BIT(6), 0);
-
-		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
-		break;
-	case HDMI_INFOFRAME_TYPE_SPD:
-		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPD);
-		regmap_bulk_write(adv7511->regmap_packet, ADV7511_PACKET_SPD(0),
-				  buffer, len);
-		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPD);
-		break;
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
-		regmap_bulk_write(adv7511->regmap_packet, ADV7511_PACKET_SPARE1(0),
-				  buffer, len);
-		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
-		break;
-	default:
-		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
-	}
+	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
+
+	return 0;
+}
+
+static int adv7511_bridge_hdmi_clear_spd_infoframe(struct drm_bridge *bridge)
+{
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPD);
+
+	return 0;
+}
+
+static int adv7511_bridge_hdmi_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
+
+	return 0;
+}
+
+static int adv7511_bridge_hdmi_write_audio_infoframe(struct drm_bridge *bridge,
+						     const u8 *buffer, size_t len)
+{
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	/* send current Audio infoframe values while updating */
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
+			   BIT(5), BIT(5));
+
+	/* The Audio infoframe id is not configurable */
+	regmap_bulk_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME_VERSION,
+			  buffer + 1, len - 1);
+
+	/* use Audio infoframe updated info */
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
+			   BIT(5), 0);
+
+	adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AUDIO_INFOFRAME);
+
+	return 0;
+}
+
+static int adv7511_bridge_hdmi_write_avi_infoframe(struct drm_bridge *bridge,
+						   const u8 *buffer, size_t len)
+{
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	/* send current AVI infoframe values while updating */
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
+			   BIT(6), BIT(6));
+
+	/* The AVI infoframe id is not configurable */
+	regmap_bulk_write(adv7511->regmap, ADV7511_REG_AVI_INFOFRAME_VERSION,
+			  buffer + 1, len - 1);
+
+	regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME_LENGTH, 0x2);
+	regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME(1), 0x1);
+
+	/* use AVI infoframe updated info */
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
+			   BIT(6), 0);
+
+	adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
+
+	return 0;
+}
+
+static int adv7511_bridge_hdmi_write_spd_infoframe(struct drm_bridge *bridge,
+						   const u8 *buffer, size_t len)
+{
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPD);
+	regmap_bulk_write(adv7511->regmap_packet, ADV7511_PACKET_SPD(0),
+			  buffer, len);
+	adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPD);
+
+	return 0;
+}
+
+static int adv7511_bridge_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
+						    const u8 *buffer, size_t len)
+{
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
+	regmap_bulk_write(adv7511->regmap_packet, ADV7511_PACKET_SPARE1(0),
+			  buffer, len);
+	adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
 
 	return 0;
 }
@@ -986,8 +1009,14 @@ static const struct drm_bridge_funcs adv7511_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 
 	.hdmi_tmds_char_rate_valid = adv7511_bridge_hdmi_tmds_char_rate_valid,
-	.hdmi_clear_infoframe = adv7511_bridge_hdmi_clear_infoframe,
-	.hdmi_write_infoframe = adv7511_bridge_hdmi_write_infoframe,
+	.hdmi_clear_audio_infoframe = adv7511_bridge_hdmi_clear_audio_infoframe,
+	.hdmi_write_audio_infoframe = adv7511_bridge_hdmi_write_audio_infoframe,
+	.hdmi_clear_avi_infoframe = adv7511_bridge_hdmi_clear_avi_infoframe,
+	.hdmi_write_avi_infoframe = adv7511_bridge_hdmi_write_avi_infoframe,
+	.hdmi_clear_spd_infoframe = adv7511_bridge_hdmi_clear_spd_infoframe,
+	.hdmi_write_spd_infoframe = adv7511_bridge_hdmi_write_spd_infoframe,
+	.hdmi_clear_hdmi_infoframe = adv7511_bridge_hdmi_clear_hdmi_infoframe,
+	.hdmi_write_hdmi_infoframe = adv7511_bridge_hdmi_write_hdmi_infoframe,
 
 	.hdmi_audio_startup = adv7511_hdmi_audio_startup,
 	.hdmi_audio_prepare = adv7511_hdmi_audio_prepare,
@@ -1322,7 +1351,8 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_EDID |
-		DRM_BRIDGE_OP_HDMI;
+		DRM_BRIDGE_OP_HDMI |
+		DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME;
 	if (adv7511->i2c_main->irq)
 		adv7511->bridge.ops |= DRM_BRIDGE_OP_HPD;
 
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 2eb8fba7016c..3991fb76143c 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -759,61 +759,62 @@ it6263_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
-				       enum hdmi_infoframe_type type)
+static int it6263_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct it6263 *it = bridge_to_it6263(bridge);
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		regmap_write(it->hdmi_regmap, HDMI_REG_AVI_INFOFRM_CTRL, 0);
-		break;
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
-		break;
-	default:
-		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
-	}
+	regmap_write(it->hdmi_regmap, HDMI_REG_AVI_INFOFRM_CTRL, 0);
+
+	return 0;
+}
+
+static int it6263_hdmi_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
 
 	return 0;
 }
 
-static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
-				       enum hdmi_infoframe_type type,
-				       const u8 *buffer, size_t len)
+static int it6263_hdmi_write_avi_infoframe(struct drm_bridge *bridge,
+					   const u8 *buffer, size_t len)
 {
 	struct it6263 *it = bridge_to_it6263(bridge);
 	struct regmap *regmap = it->hdmi_regmap;
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		/* write the first AVI infoframe data byte chunk(DB1-DB5) */
-		regmap_bulk_write(regmap, HDMI_REG_AVI_DB1,
-				  &buffer[HDMI_INFOFRAME_HEADER_SIZE],
-				  HDMI_AVI_DB_CHUNK1_SIZE);
-
-		/* write the second AVI infoframe data byte chunk(DB6-DB13) */
-		regmap_bulk_write(regmap, HDMI_REG_AVI_DB6,
-				  &buffer[HDMI_INFOFRAME_HEADER_SIZE +
-					  HDMI_AVI_DB_CHUNK1_SIZE],
-				  HDMI_AVI_DB_CHUNK2_SIZE);
-
-		/* write checksum */
-		regmap_write(regmap, HDMI_REG_AVI_CSUM, buffer[3]);
-
-		regmap_write(regmap, HDMI_REG_AVI_INFOFRM_CTRL,
-			     ENABLE_PKT | REPEAT_PKT);
-		break;
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		/* write header and payload */
-		regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0), buffer, len);
-
-		regmap_write(regmap, HDMI_REG_PKT_NULL_CTRL,
-			     ENABLE_PKT | REPEAT_PKT);
-		break;
-	default:
-		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
-	}
+	/* write the first AVI infoframe data byte chunk(DB1-DB5) */
+	regmap_bulk_write(regmap, HDMI_REG_AVI_DB1,
+			  &buffer[HDMI_INFOFRAME_HEADER_SIZE],
+			  HDMI_AVI_DB_CHUNK1_SIZE);
+
+	/* write the second AVI infoframe data byte chunk(DB6-DB13) */
+	regmap_bulk_write(regmap, HDMI_REG_AVI_DB6,
+			  &buffer[HDMI_INFOFRAME_HEADER_SIZE +
+				  HDMI_AVI_DB_CHUNK1_SIZE],
+			  HDMI_AVI_DB_CHUNK2_SIZE);
+
+	/* write checksum */
+	regmap_write(regmap, HDMI_REG_AVI_CSUM, buffer[3]);
+
+	regmap_write(regmap, HDMI_REG_AVI_INFOFRM_CTRL,
+		     ENABLE_PKT | REPEAT_PKT);
+
+	return 0;
+}
+
+static int it6263_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
+					    const u8 *buffer, size_t len)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+	struct regmap *regmap = it->hdmi_regmap;
+
+	/* write header and payload */
+	regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0), buffer, len);
+
+	regmap_write(regmap, HDMI_REG_PKT_NULL_CTRL,
+		     ENABLE_PKT | REPEAT_PKT);
+
 
 	return 0;
 }
@@ -830,8 +831,10 @@ static const struct drm_bridge_funcs it6263_bridge_funcs = {
 	.edid_read = it6263_bridge_edid_read,
 	.atomic_get_input_bus_fmts = it6263_bridge_atomic_get_input_bus_fmts,
 	.hdmi_tmds_char_rate_valid = it6263_hdmi_tmds_char_rate_valid,
-	.hdmi_clear_infoframe = it6263_hdmi_clear_infoframe,
-	.hdmi_write_infoframe = it6263_hdmi_write_infoframe,
+	.hdmi_clear_avi_infoframe = it6263_hdmi_clear_avi_infoframe,
+	.hdmi_write_avi_infoframe = it6263_hdmi_write_avi_infoframe,
+	.hdmi_clear_hdmi_infoframe = it6263_hdmi_clear_hdmi_infoframe,
+	.hdmi_write_hdmi_infoframe = it6263_hdmi_write_hdmi_infoframe,
 };
 
 static int it6263_probe(struct i2c_client *client)
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744..0628d8e737ab 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -843,84 +843,96 @@ lt9611_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 #define LT9611_INFOFRAME_AUDIO	0x02
 #define LT9611_INFOFRAME_AVI	0x08
 #define LT9611_INFOFRAME_SPD	0x10
-#define LT9611_INFOFRAME_VENDOR	0x20
+#define LT9611_INFOFRAME_HDMI	0x20
 
-static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
-				       enum hdmi_infoframe_type type)
+static int lt9611_hdmi_clear_audio_infoframe(struct drm_bridge *bridge)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	unsigned int mask;
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		mask = LT9611_INFOFRAME_AUDIO;
-		break;
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AUDIO, 0);
 
-	case HDMI_INFOFRAME_TYPE_AVI:
-		mask = LT9611_INFOFRAME_AVI;
-		break;
+	return 0;
+}
 
-	case HDMI_INFOFRAME_TYPE_SPD:
-		mask = LT9611_INFOFRAME_SPD;
-		break;
+static int lt9611_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		mask = LT9611_INFOFRAME_VENDOR;
-		break;
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AVI, 0);
 
-	default:
-		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
-	}
+	return 0;
+}
+
+static int lt9611_hdmi_clear_spd_infoframe(struct drm_bridge *bridge)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
-	if (mask)
-		regmap_update_bits(lt9611->regmap, 0x843d, mask, 0);
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_SPD, 0);
 
 	return 0;
 }
 
-static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
-				       enum hdmi_infoframe_type type,
-				       const u8 *buffer, size_t len)
+static int lt9611_hdmi_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_HDMI, 0);
+
+	return 0;
+}
+
+static int lt9611_hdmi_write_audio_infoframe(struct drm_bridge *bridge,
+					     const u8 *buffer, size_t len)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	unsigned int mask, addr;
 	int i;
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		mask = LT9611_INFOFRAME_AUDIO;
-		addr = 0x84b2;
-		break;
-
-	case HDMI_INFOFRAME_TYPE_AVI:
-		mask = LT9611_INFOFRAME_AVI;
-		addr = 0x8440;
-		break;
-
-	case HDMI_INFOFRAME_TYPE_SPD:
-		mask = LT9611_INFOFRAME_SPD;
-		addr = 0x8493;
-		break;
-
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		mask = LT9611_INFOFRAME_VENDOR;
-		addr = 0x8474;
-		break;
-
-	default:
-		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
-	}
+	for (i = 0; i < len; i++)
+		regmap_write(lt9611->regmap, 0x84b2 + i, buffer[i]);
 
-	if (mask) {
-		for (i = 0; i < len; i++)
-			regmap_write(lt9611->regmap, addr + i, buffer[i]);
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AUDIO, LT9611_INFOFRAME_AUDIO);
 
-		regmap_update_bits(lt9611->regmap, 0x843d, mask, mask);
-	}
+	return 0;
+}
+
+static int lt9611_hdmi_write_avi_infoframe(struct drm_bridge *bridge,
+					   const u8 *buffer, size_t len)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	int i;
+
+	for (i = 0; i < len; i++)
+		regmap_write(lt9611->regmap, 0x8440 + i, buffer[i]);
+
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AVI, LT9611_INFOFRAME_AVI);
+
+	return 0;
+}
+
+static int lt9611_hdmi_write_spd_infoframe(struct drm_bridge *bridge,
+					   const u8 *buffer, size_t len)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	int i;
+
+	for (i = 0; i < len; i++)
+		regmap_write(lt9611->regmap, 0x8493 + i, buffer[i]);
+
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_SPD, LT9611_INFOFRAME_SPD);
+
+	return 0;
+}
+
+static int lt9611_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
+					    const u8 *buffer, size_t len)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	int i;
+
+	for (i = 0; i < len; i++)
+		regmap_write(lt9611->regmap, 0x8474 + i, buffer[i]);
+
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_HDMI, LT9611_INFOFRAME_HDMI);
 
 	return 0;
 }
@@ -1003,8 +1015,14 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.atomic_get_input_bus_fmts = lt9611_atomic_get_input_bus_fmts,
 
 	.hdmi_tmds_char_rate_valid = lt9611_hdmi_tmds_char_rate_valid,
-	.hdmi_write_infoframe = lt9611_hdmi_write_infoframe,
-	.hdmi_clear_infoframe = lt9611_hdmi_clear_infoframe,
+	.hdmi_write_audio_infoframe = lt9611_hdmi_write_audio_infoframe,
+	.hdmi_clear_audio_infoframe = lt9611_hdmi_clear_audio_infoframe,
+	.hdmi_write_avi_infoframe = lt9611_hdmi_write_avi_infoframe,
+	.hdmi_clear_avi_infoframe = lt9611_hdmi_clear_avi_infoframe,
+	.hdmi_write_spd_infoframe = lt9611_hdmi_write_spd_infoframe,
+	.hdmi_clear_spd_infoframe = lt9611_hdmi_clear_spd_infoframe,
+	.hdmi_write_hdmi_infoframe = lt9611_hdmi_write_hdmi_infoframe,
+	.hdmi_clear_hdmi_infoframe = lt9611_hdmi_clear_hdmi_infoframe,
 
 	.hdmi_audio_startup = lt9611_hdmi_audio_startup,
 	.hdmi_audio_prepare = lt9611_hdmi_audio_prepare,
@@ -1132,7 +1150,8 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.of_node = client->dev.of_node;
 	lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
-			     DRM_BRIDGE_OP_HDMI | DRM_BRIDGE_OP_HDMI_AUDIO;
+			     DRM_BRIDGE_OP_HDMI | DRM_BRIDGE_OP_HDMI_AUDIO |
+			     DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME;
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index fe4c026280f0..f57307dd61c8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -26,6 +26,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_print.h>
 
 #include <media/cec.h>
 
@@ -933,57 +934,85 @@ dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static int dw_hdmi_qp_bridge_clear_infoframe(struct drm_bridge *bridge,
-					     enum hdmi_infoframe_type type)
+static int dw_hdmi_qp_bridge_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_AVI_TX_EN | PKTSCHED_GCP_TX_EN,
-			       PKTSCHED_PKT_EN);
-		break;
+	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_AVI_TX_EN | PKTSCHED_GCP_TX_EN,
+		       PKTSCHED_PKT_EN);
 
-	case HDMI_INFOFRAME_TYPE_DRM:
-		dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_DRMI_TX_EN, PKTSCHED_PKT_EN);
-		break;
+	return 0;
+}
 
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		dw_hdmi_qp_mod(hdmi, 0,
-			       PKTSCHED_ACR_TX_EN |
-			       PKTSCHED_AUDS_TX_EN |
-			       PKTSCHED_AUDI_TX_EN,
-			       PKTSCHED_PKT_EN);
-		break;
-	default:
-		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-	}
+static int dw_hdmi_qp_bridge_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	/* FIXME: add support for this InfoFrame */
+
+	drm_warn_once(bridge->encoder->dev, "HDMI VSI not supported\n");
 
 	return 0;
 }
 
-static int dw_hdmi_qp_bridge_write_infoframe(struct drm_bridge *bridge,
-					     enum hdmi_infoframe_type type,
-					     const u8 *buffer, size_t len)
+static int dw_hdmi_qp_bridge_clear_hdr_drm_infoframe(struct drm_bridge *bridge)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
-	dw_hdmi_qp_bridge_clear_infoframe(bridge, type);
+	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_DRMI_TX_EN, PKTSCHED_PKT_EN);
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		return dw_hdmi_qp_config_avi_infoframe(hdmi, buffer, len);
+	return 0;
+}
 
-	case HDMI_INFOFRAME_TYPE_DRM:
-		return dw_hdmi_qp_config_drm_infoframe(hdmi, buffer, len);
+static int dw_hdmi_qp_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		return dw_hdmi_qp_config_audio_infoframe(hdmi, buffer, len);
+	dw_hdmi_qp_mod(hdmi, 0,
+		       PKTSCHED_ACR_TX_EN |
+		       PKTSCHED_AUDS_TX_EN |
+		       PKTSCHED_AUDI_TX_EN,
+		       PKTSCHED_PKT_EN);
 
-	default:
-		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-		return 0;
-	}
+	return 0;
+}
+
+static int dw_hdmi_qp_bridge_write_avi_infoframe(struct drm_bridge *bridge,
+						 const u8 *buffer, size_t len)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	dw_hdmi_qp_bridge_clear_avi_infoframe(bridge);
+
+	return dw_hdmi_qp_config_avi_infoframe(hdmi, buffer, len);
+}
+
+static int dw_hdmi_qp_bridge_write_hdmi_infoframe(struct drm_bridge *bridge,
+						  const u8 *buffer, size_t len)
+{
+	dw_hdmi_qp_bridge_clear_hdmi_infoframe(bridge);
+
+	/* FIXME: add support for the HDMI VSI */
+
+	return 0;
+}
+
+static int dw_hdmi_qp_bridge_write_hdr_drm_infoframe(struct drm_bridge *bridge,
+						     const u8 *buffer, size_t len)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	dw_hdmi_qp_bridge_clear_hdr_drm_infoframe(bridge);
+
+	return dw_hdmi_qp_config_drm_infoframe(hdmi, buffer, len);
+}
+
+static int dw_hdmi_qp_bridge_write_audio_infoframe(struct drm_bridge *bridge,
+						   const u8 *buffer, size_t len)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	dw_hdmi_qp_bridge_clear_audio_infoframe(bridge);
+
+	return dw_hdmi_qp_config_audio_infoframe(hdmi, buffer, len);
 }
 
 #ifdef CONFIG_DRM_DW_HDMI_QP_CEC
@@ -1168,8 +1197,14 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.detect = dw_hdmi_qp_bridge_detect,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
 	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
-	.hdmi_clear_infoframe = dw_hdmi_qp_bridge_clear_infoframe,
-	.hdmi_write_infoframe = dw_hdmi_qp_bridge_write_infoframe,
+	.hdmi_clear_avi_infoframe = dw_hdmi_qp_bridge_clear_avi_infoframe,
+	.hdmi_write_avi_infoframe = dw_hdmi_qp_bridge_write_avi_infoframe,
+	.hdmi_clear_hdmi_infoframe = dw_hdmi_qp_bridge_clear_hdmi_infoframe,
+	.hdmi_write_hdmi_infoframe = dw_hdmi_qp_bridge_write_hdmi_infoframe,
+	.hdmi_clear_hdr_drm_infoframe = dw_hdmi_qp_bridge_clear_hdr_drm_infoframe,
+	.hdmi_write_hdr_drm_infoframe = dw_hdmi_qp_bridge_write_hdr_drm_infoframe,
+	.hdmi_clear_audio_infoframe = dw_hdmi_qp_bridge_clear_audio_infoframe,
+	.hdmi_write_audio_infoframe = dw_hdmi_qp_bridge_write_audio_infoframe,
 	.hdmi_audio_startup = dw_hdmi_qp_audio_enable,
 	.hdmi_audio_shutdown = dw_hdmi_qp_audio_disable,
 	.hdmi_audio_prepare = dw_hdmi_qp_audio_prepare,
@@ -1282,6 +1317,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 			   DRM_BRIDGE_OP_EDID |
 			   DRM_BRIDGE_OP_HDMI |
 			   DRM_BRIDGE_OP_HDMI_AUDIO |
+			   DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME |
 			   DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index a2d30cf9e06d..8fd7722fe9a3 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -412,7 +412,30 @@ static int drm_bridge_connector_clear_infoframe(struct drm_connector *connector,
 	if (!bridge)
 		return -EINVAL;
 
-	return bridge->funcs->hdmi_clear_infoframe(bridge, type);
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		/* required */
+		return bridge->funcs->hdmi_clear_avi_infoframe(bridge);
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		/* required */
+		return bridge->funcs->hdmi_clear_hdmi_infoframe(bridge);
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+			return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
+		break;
+	case HDMI_INFOFRAME_TYPE_DRM:
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+			return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
+		break;
+	case HDMI_INFOFRAME_TYPE_SPD:
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+			return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
+		break;
+	}
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI InfoFrame %x\n", type);
+
+	return 0;
 }
 
 static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
@@ -427,7 +450,30 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	if (!bridge)
 		return -EINVAL;
 
-	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		/* required */
+		return bridge->funcs->hdmi_write_avi_infoframe(bridge, buffer, len);
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		/* required */
+		return bridge->funcs->hdmi_write_hdmi_infoframe(bridge, buffer, len);
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+			return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
+		break;
+	case HDMI_INFOFRAME_TYPE_DRM:
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+			return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
+		break;
+	case HDMI_INFOFRAME_TYPE_SPD:
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+			return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
+		break;
+	}
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI InfoFrame %x\n", type);
+
+	return 0;
 }
 
 static const struct drm_edid *
@@ -709,8 +755,20 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
 			if (bridge_connector->bridge_hdmi)
 				return ERR_PTR(-EBUSY);
-			if (!bridge->funcs->hdmi_write_infoframe ||
-			    !bridge->funcs->hdmi_clear_infoframe)
+			if (!bridge->funcs->hdmi_write_avi_infoframe ||
+			    !bridge->funcs->hdmi_clear_avi_infoframe ||
+			    !bridge->funcs->hdmi_write_hdmi_infoframe ||
+			    !bridge->funcs->hdmi_clear_hdmi_infoframe)
+				return ERR_PTR(-EINVAL);
+
+			if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME &&
+			    (!bridge->funcs->hdmi_write_hdr_drm_infoframe ||
+			     !bridge->funcs->hdmi_clear_hdr_drm_infoframe))
+				return ERR_PTR(-EINVAL);
+
+			if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME &&
+			    (!bridge->funcs->hdmi_write_spd_infoframe ||
+			     !bridge->funcs->hdmi_clear_spd_infoframe))
 				return ERR_PTR(-EINVAL);
 
 			bridge_connector->bridge_hdmi = drm_bridge_get(bridge);
@@ -732,7 +790,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			    !bridge->hdmi_audio_spdif_playback)
 				return ERR_PTR(-EINVAL);
 
-			if (!bridge->funcs->hdmi_audio_prepare ||
+			if (!bridge->funcs->hdmi_write_audio_infoframe ||
+			    !bridge->funcs->hdmi_clear_audio_infoframe ||
+			    !bridge->funcs->hdmi_audio_prepare ||
 			    !bridge->funcs->hdmi_audio_shutdown)
 				return ERR_PTR(-EINVAL);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index e78eb0876f16..c599ba767093 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -433,9 +433,11 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
 
-	if (ver_conf->bridge_funcs->hdmi_write_infoframe &&
-	    ver_conf->bridge_funcs->hdmi_clear_infoframe)
-		hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI;
+	/* Only v2 support OP_HDMI now and it we know that it also support SPD */
+	if (ver_conf->bridge_funcs->hdmi_write_avi_infoframe &&
+	    ver_conf->bridge_funcs->hdmi_clear_avi_infoframe)
+		hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI |
+				    DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME;
 
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.ddc = hdmi->ddc_adpt;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index c272e1e74b7d..d0e4440b7491 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -145,8 +145,11 @@ static inline u32 mtk_hdmi_v2_format_hw_packet(const u8 *buffer, u8 len)
 	return val;
 }
 
-static void mtk_hdmi_v2_hw_write_audio_infoframe(struct mtk_hdmi *hdmi, const u8 *buffer)
+static int mtk_hdmi_v2_hdmi_write_audio_infoframe(struct drm_bridge *bridge,
+						  const u8 *buffer, size_t len)
 {
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
 	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AUD_EN | AUD_EN_WR);
 	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AUD_RPT_EN);
 
@@ -158,10 +161,15 @@ static void mtk_hdmi_v2_hw_write_audio_infoframe(struct mtk_hdmi *hdmi, const u8
 
 	regmap_set_bits(hdmi->regs, TOP_INFO_RPT, AUD_RPT_EN);
 	regmap_set_bits(hdmi->regs, TOP_INFO_EN, AUD_EN | AUD_EN_WR);
+
+	return 0;
 }
 
-static void mtk_hdmi_v2_hw_write_avi_infoframe(struct mtk_hdmi *hdmi, const u8 *buffer)
+static int mtk_hdmi_v2_hdmi_write_avi_infoframe(struct drm_bridge *bridge,
+						const u8 *buffer, size_t len)
 {
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
 	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AVI_EN_WR | AVI_EN);
 	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AVI_RPT_EN);
 
@@ -175,10 +183,15 @@ static void mtk_hdmi_v2_hw_write_avi_infoframe(struct mtk_hdmi *hdmi, const u8 *
 
 	regmap_set_bits(hdmi->regs, TOP_INFO_RPT, AVI_RPT_EN);
 	regmap_set_bits(hdmi->regs, TOP_INFO_EN, AVI_EN_WR | AVI_EN);
+
+	return 0;
 }
 
-static void mtk_hdmi_v2_hw_write_spd_infoframe(struct mtk_hdmi *hdmi, const u8 *buffer)
+static int mtk_hdmi_v2_hdmi_write_spd_infoframe(struct drm_bridge *bridge,
+						const u8 *buffer, size_t len)
 {
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
 	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, SPD_EN_WR | SPD_EN);
 	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, SPD_RPT_EN);
 
@@ -194,10 +207,15 @@ static void mtk_hdmi_v2_hw_write_spd_infoframe(struct mtk_hdmi *hdmi, const u8 *
 
 	regmap_set_bits(hdmi->regs, TOP_INFO_EN, SPD_EN_WR | SPD_EN);
 	regmap_set_bits(hdmi->regs, TOP_INFO_RPT, SPD_RPT_EN);
+
+	return 0;
 }
 
-static void mtk_hdmi_v2_hw_write_vendor_infoframe(struct mtk_hdmi *hdmi, const u8 *buffer)
+static int mtk_hdmi_v2_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
+						 const u8 *buffer, size_t len)
 {
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
 	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, VSIF_EN_WR | VSIF_EN);
 	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, VSIF_RPT_EN);
 
@@ -213,6 +231,8 @@ static void mtk_hdmi_v2_hw_write_vendor_infoframe(struct mtk_hdmi *hdmi, const u
 
 	regmap_set_bits(hdmi->regs, TOP_INFO_EN, VSIF_EN_WR | VSIF_EN);
 	regmap_set_bits(hdmi->regs, TOP_INFO_RPT, VSIF_RPT_EN);
+
+	return 0;
 }
 
 static void mtk_hdmi_yuv420_downsampling(struct mtk_hdmi *hdmi, bool enable)
@@ -255,7 +275,7 @@ static int mtk_hdmi_v2_setup_audio_infoframe(struct mtk_hdmi *hdmi)
 	if (ret < 0)
 		return ret;
 
-	mtk_hdmi_v2_hw_write_audio_infoframe(hdmi, buffer);
+	mtk_hdmi_v2_hdmi_write_audio_infoframe(&hdmi->bridge, buffer, sizeof(buffer));
 
 	return 0;
 }
@@ -1132,60 +1152,42 @@ static int mtk_hdmi_v2_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge
 		return MODE_OK;
 }
 
-static int mtk_hdmi_v2_hdmi_clear_infoframe(struct drm_bridge *bridge,
-					    enum hdmi_infoframe_type type)
+static int mtk_hdmi_v2_hdmi_clear_audio_infoframe(struct drm_bridge *bridge)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AUD_EN_WR | AUD_EN);
-		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AUD_RPT_EN);
-		break;
-	case HDMI_INFOFRAME_TYPE_AVI:
-		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AVI_EN_WR | AVI_EN);
-		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AVI_RPT_EN);
-		break;
-	case HDMI_INFOFRAME_TYPE_SPD:
-		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, SPD_EN_WR | SPD_EN);
-		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, SPD_RPT_EN);
-		break;
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, VSIF_EN_WR | VSIF_EN);
-		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, VSIF_RPT_EN);
-		break;
-	case HDMI_INFOFRAME_TYPE_DRM:
-	default:
-		break;
-	};
+	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AUD_EN_WR | AUD_EN);
+	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AUD_RPT_EN);
 
 	return 0;
 }
 
-static int mtk_hdmi_v2_hdmi_write_infoframe(struct drm_bridge *bridge,
-					    enum hdmi_infoframe_type type,
-					    const u8 *buffer, size_t len)
+static int mtk_hdmi_v2_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		mtk_hdmi_v2_hw_write_audio_infoframe(hdmi, buffer);
-		break;
-	case HDMI_INFOFRAME_TYPE_AVI:
-		mtk_hdmi_v2_hw_write_avi_infoframe(hdmi, buffer);
-		break;
-	case HDMI_INFOFRAME_TYPE_SPD:
-		mtk_hdmi_v2_hw_write_spd_infoframe(hdmi, buffer);
-		break;
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		mtk_hdmi_v2_hw_write_vendor_infoframe(hdmi, buffer);
-		break;
-	case HDMI_INFOFRAME_TYPE_DRM:
-	default:
-		dev_err(hdmi->dev, "Unsupported HDMI infoframe type %u\n", type);
-		break;
-	};
+	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AVI_EN_WR | AVI_EN);
+	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AVI_RPT_EN);
+
+	return 0;
+}
+
+static int mtk_hdmi_v2_hdmi_clear_spd_infoframe(struct drm_bridge *bridge)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, SPD_EN_WR | SPD_EN);
+	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, SPD_RPT_EN);
+
+	return 0;
+}
+
+static int mtk_hdmi_v2_hdmi_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, VSIF_EN_WR | VSIF_EN);
+	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, VSIF_RPT_EN);
 
 	return 0;
 }
@@ -1329,8 +1331,14 @@ static const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
 	.hpd_enable = mtk_hdmi_v2_hpd_enable,
 	.hpd_disable = mtk_hdmi_v2_hpd_disable,
 	.hdmi_tmds_char_rate_valid = mtk_hdmi_v2_hdmi_tmds_char_rate_valid,
-	.hdmi_clear_infoframe = mtk_hdmi_v2_hdmi_clear_infoframe,
-	.hdmi_write_infoframe = mtk_hdmi_v2_hdmi_write_infoframe,
+	.hdmi_clear_audio_infoframe = mtk_hdmi_v2_hdmi_clear_audio_infoframe,
+	.hdmi_write_audio_infoframe = mtk_hdmi_v2_hdmi_write_audio_infoframe,
+	.hdmi_clear_avi_infoframe = mtk_hdmi_v2_hdmi_clear_avi_infoframe,
+	.hdmi_write_avi_infoframe = mtk_hdmi_v2_hdmi_write_avi_infoframe,
+	.hdmi_clear_spd_infoframe = mtk_hdmi_v2_hdmi_clear_spd_infoframe,
+	.hdmi_write_spd_infoframe = mtk_hdmi_v2_hdmi_write_spd_infoframe,
+	.hdmi_clear_hdmi_infoframe = mtk_hdmi_v2_hdmi_clear_hdmi_infoframe,
+	.hdmi_write_hdmi_infoframe = mtk_hdmi_v2_hdmi_write_hdmi_infoframe,
 	.debugfs_init = mtk_hdmi_v2_debugfs_init,
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32..98cd490e7ab0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -54,9 +54,80 @@ static void power_off(struct drm_bridge *bridge)
 #define SPD_IFRAME_LINE_NUMBER 1
 #define VENSPEC_IFRAME_LINE_NUMBER 3
 
-static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
-					 const u8 *buffer, size_t len)
+static int msm_hdmi_bridge_clear_avi_infoframe(struct drm_bridge *bridge)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	u32 val;
+
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
+	val &= ~(HDMI_INFOFRAME_CTRL0_AVI_SEND |
+		 HDMI_INFOFRAME_CTRL0_AVI_CONT);
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
+	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	u32 val;
+
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
+	val &= ~(HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
+		 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
+		 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
+		 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
+	val &= ~HDMI_INFOFRAME_CTRL1_AUDIO_INFO_LINE__MASK;
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_clear_spd_infoframe(struct drm_bridge *bridge)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	u32 val;
+
+	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+	val &= ~(HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
+		 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
+		 HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK);
+	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	u32 val;
+
+	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+	val &= ~(HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_LINE__MASK);
+	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_write_avi_infoframe(struct drm_bridge *bridge,
+					       const u8 *buffer, size_t len)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	u32 buf[4] = {};
 	u32 val;
 	int i;
@@ -67,6 +138,8 @@ static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
 		return -EINVAL;
 	}
 
+	msm_hdmi_bridge_clear_avi_infoframe(bridge);
+
 	/*
 	 * the AVI_INFOx registers don't map exactly to how the AVI infoframes
 	 * are packed according to the spec. The checksum from the header is
@@ -93,9 +166,11 @@ static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
 	return 0;
 }
 
-static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
-					   const u8 *buffer, size_t len)
+static int msm_hdmi_bridge_write_audio_infoframe(struct drm_bridge *bridge,
+						 const u8 *buffer, size_t len)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	u32 val;
 
 	if (len != HDMI_INFOFRAME_SIZE(AUDIO)) {
@@ -104,6 +179,8 @@ static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
 		return -EINVAL;
 	}
 
+	msm_hdmi_bridge_clear_audio_infoframe(bridge);
+
 	hdmi_write(hdmi, REG_HDMI_AUDIO_INFO0,
 		   buffer[3] |
 		   buffer[4] << 8 |
@@ -126,9 +203,11 @@ static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
 	return 0;
 }
 
-static int msm_hdmi_config_spd_infoframe(struct hdmi *hdmi,
-					 const u8 *buffer, size_t len)
+static int msm_hdmi_bridge_write_spd_infoframe(struct drm_bridge *bridge,
+					       const u8 *buffer, size_t len)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	u32 buf[7] = {};
 	u32 val;
 	int i;
@@ -139,6 +218,8 @@ static int msm_hdmi_config_spd_infoframe(struct hdmi *hdmi,
 		return -EINVAL;
 	}
 
+	msm_hdmi_bridge_clear_spd_infoframe(bridge);
+
 	/* checksum gets written together with the body of the frame */
 	hdmi_write(hdmi, REG_HDMI_GENERIC1_HDR,
 		   buffer[0] |
@@ -159,9 +240,11 @@ static int msm_hdmi_config_spd_infoframe(struct hdmi *hdmi,
 	return 0;
 }
 
-static int msm_hdmi_config_hdmi_infoframe(struct hdmi *hdmi,
-					  const u8 *buffer, size_t len)
+static int msm_hdmi_bridge_write_hdmi_infoframe(struct drm_bridge *bridge,
+						const u8 *buffer, size_t len)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	u32 buf[7] = {};
 	u32 val;
 	int i;
@@ -173,6 +256,8 @@ static int msm_hdmi_config_hdmi_infoframe(struct hdmi *hdmi,
 		return -EINVAL;
 	}
 
+	msm_hdmi_bridge_clear_hdmi_infoframe(bridge);
+
 	/* checksum gets written together with the body of the frame */
 	hdmi_write(hdmi, REG_HDMI_GENERIC0_HDR,
 		   buffer[0] |
@@ -194,90 +279,6 @@ static int msm_hdmi_config_hdmi_infoframe(struct hdmi *hdmi,
 	return 0;
 }
 
-static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
-					   enum hdmi_infoframe_type type)
-{
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	u32 val;
-
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
-		val &= ~(HDMI_INFOFRAME_CTRL0_AVI_SEND |
-			 HDMI_INFOFRAME_CTRL0_AVI_CONT);
-		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
-
-		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
-		val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
-		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
-
-		break;
-
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
-		val &= ~(HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
-			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
-			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
-			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
-		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
-
-		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
-		val &= ~HDMI_INFOFRAME_CTRL1_AUDIO_INFO_LINE__MASK;
-		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
-
-		break;
-
-	case HDMI_INFOFRAME_TYPE_SPD:
-		val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
-		val &= ~(HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
-			 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
-			 HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK);
-		hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
-
-		break;
-
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
-		val &= ~(HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
-			 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
-			 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
-			 HDMI_GEN_PKT_CTRL_GENERIC0_LINE__MASK);
-		hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
-
-		break;
-
-	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-	}
-
-	return 0;
-}
-
-static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
-					   enum hdmi_infoframe_type type,
-					   const u8 *buffer, size_t len)
-{
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
-
-	msm_hdmi_bridge_clear_infoframe(bridge, type);
-
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		return msm_hdmi_config_avi_infoframe(hdmi, buffer, len);
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		return msm_hdmi_config_audio_infoframe(hdmi, buffer, len);
-	case HDMI_INFOFRAME_TYPE_SPD:
-		return msm_hdmi_config_spd_infoframe(hdmi, buffer, len);
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
-	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-		return 0;
-	}
-}
-
 static void msm_hdmi_set_timings(struct hdmi *hdmi,
 				 const struct drm_display_mode *mode);
 
@@ -462,8 +463,14 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.hpd_enable = msm_hdmi_hpd_enable,
 	.hpd_disable = msm_hdmi_hpd_disable,
 	.hdmi_tmds_char_rate_valid = msm_hdmi_bridge_tmds_char_rate_valid,
-	.hdmi_clear_infoframe = msm_hdmi_bridge_clear_infoframe,
-	.hdmi_write_infoframe = msm_hdmi_bridge_write_infoframe,
+	.hdmi_clear_audio_infoframe = msm_hdmi_bridge_clear_audio_infoframe,
+	.hdmi_write_audio_infoframe = msm_hdmi_bridge_write_audio_infoframe,
+	.hdmi_clear_avi_infoframe = msm_hdmi_bridge_clear_avi_infoframe,
+	.hdmi_write_avi_infoframe = msm_hdmi_bridge_write_avi_infoframe,
+	.hdmi_clear_spd_infoframe = msm_hdmi_bridge_clear_spd_infoframe,
+	.hdmi_write_spd_infoframe = msm_hdmi_bridge_write_spd_infoframe,
+	.hdmi_clear_hdmi_infoframe = msm_hdmi_bridge_clear_hdmi_infoframe,
+	.hdmi_write_hdmi_infoframe = msm_hdmi_bridge_write_hdmi_infoframe,
 	.hdmi_audio_prepare = msm_hdmi_bridge_audio_prepare,
 	.hdmi_audio_shutdown = msm_hdmi_bridge_audio_shutdown,
 };
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 997429115068..9066ee2d1dff 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -158,35 +158,33 @@ static void rk3066_hdmi_set_power_mode(struct rk3066_hdmi *hdmi, int mode)
 		hdmi->tmdsclk = DEFAULT_PLLA_RATE;
 }
 
-static int rk3066_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
-					      enum hdmi_infoframe_type type)
+static int rk3066_hdmi_bridge_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
-
 	hdmi_writeb(hdmi, HDMI_CP_BUF_INDEX, HDMI_INFOFRAME_AVI);
 
 	return 0;
 }
 
 static int
-rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
-				   enum hdmi_infoframe_type type,
-				   const u8 *buffer, size_t len)
+rk3066_hdmi_bridge_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	/* FIXME: add support for this InfoFrame */
+
+	drm_warn_once(bridge->encoder->dev, "HDMI VSI not supported\n");
+
+	return 0;
+}
+
+static int
+rk3066_hdmi_bridge_write_avi_infoframe(struct drm_bridge *bridge,
+				       const u8 *buffer, size_t len)
 {
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
-
-	rk3066_hdmi_bridge_clear_infoframe(bridge, type);
+	rk3066_hdmi_bridge_clear_avi_infoframe(bridge);
 
 	for (i = 0; i < len; i++)
 		hdmi_writeb(hdmi, HDMI_CP_BUF_ACC_HB0 + i * 4, buffer[i]);
@@ -194,6 +192,17 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int
+rk3066_hdmi_bridge_write_hdmi_infoframe(struct drm_bridge *bridge,
+					const u8 *buffer, size_t len)
+{
+	rk3066_hdmi_bridge_clear_hdmi_infoframe(bridge);
+
+	/* FIXME: add support for this InfoFrame */
+
+	return 0;
+}
+
 static int rk3066_hdmi_config_video_timing(struct rk3066_hdmi *hdmi,
 					   struct drm_display_mode *mode)
 {
@@ -493,8 +502,10 @@ static const struct drm_bridge_funcs rk3066_hdmi_bridge_funcs = {
 	.atomic_disable = rk3066_hdmi_bridge_atomic_disable,
 	.detect = rk3066_hdmi_bridge_detect,
 	.edid_read = rk3066_hdmi_bridge_edid_read,
-	.hdmi_clear_infoframe = rk3066_hdmi_bridge_clear_infoframe,
-	.hdmi_write_infoframe = rk3066_hdmi_bridge_write_infoframe,
+	.hdmi_clear_avi_infoframe = rk3066_hdmi_bridge_clear_avi_infoframe,
+	.hdmi_write_avi_infoframe = rk3066_hdmi_bridge_write_avi_infoframe,
+	.hdmi_clear_hdmi_infoframe = rk3066_hdmi_bridge_clear_hdmi_infoframe,
+	.hdmi_write_hdmi_infoframe = rk3066_hdmi_bridge_write_hdmi_infoframe,
 	.mode_valid = rk3066_hdmi_bridge_mode_valid,
 };
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index d2683846cc61..071e2f72fd0f 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -784,29 +784,113 @@ struct drm_bridge_funcs {
 				     unsigned long long tmds_rate);
 
 	/**
-	 * @hdmi_clear_infoframe:
+	 * @hdmi_clear_avi_infoframe:
 	 *
 	 * This callback clears the infoframes in the hardware during commit.
-	 * It will be called multiple times, once for every disabled infoframe
-	 * type.
 	 *
 	 * This callback is optional but it must be implemented by bridges that
 	 * set the DRM_BRIDGE_OP_HDMI flag in their &drm_bridge->ops.
 	 */
-	int (*hdmi_clear_infoframe)(struct drm_bridge *bridge,
-				    enum hdmi_infoframe_type type);
+	int (*hdmi_clear_avi_infoframe)(struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_write_avi_infoframe:
+	 *
+	 * Program the infoframe into the hardware.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI flag in their &drm_bridge->ops.
+	 */
+	int (*hdmi_write_avi_infoframe)(struct drm_bridge *bridge,
+					const u8 *buffer, size_t len);
+
+	/**
+	 * @hdmi_clear_hdmi_infoframe:
+	 *
+	 * This callback clears the infoframes in the hardware during commit.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI flag in their &drm_bridge->ops.
+	 */
+	int (*hdmi_clear_hdmi_infoframe)(struct drm_bridge *bridge);
+
 	/**
-	 * @hdmi_write_infoframe:
+	 * @hdmi_write_hdmi_infoframe:
 	 *
-	 * Program the infoframe into the hardware. It will be called multiple
-	 * times, once for every updated infoframe type.
+	 * Program the infoframe into the hardware.
 	 *
 	 * This callback is optional but it must be implemented by bridges that
 	 * set the DRM_BRIDGE_OP_HDMI flag in their &drm_bridge->ops.
 	 */
-	int (*hdmi_write_infoframe)(struct drm_bridge *bridge,
-				    enum hdmi_infoframe_type type,
-				    const u8 *buffer, size_t len);
+	int (*hdmi_write_hdmi_infoframe)(struct drm_bridge *bridge,
+					    const u8 *buffer, size_t len);
+
+	/**
+	 * @hdmi_clear_hdr_drm_infoframe:
+	 *
+	 * This callback clears the infoframes in the hardware during commit.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME flag in their
+	 * &drm_bridge->ops.
+	 */
+	int (*hdmi_clear_hdr_drm_infoframe)(struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_write_hdr_drm_infoframe:
+	 *
+	 * Program the infoframe into the hardware.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME flag in their
+	 * &drm_bridge->ops.
+	 */
+	int (*hdmi_write_hdr_drm_infoframe)(struct drm_bridge *bridge,
+					const u8 *buffer, size_t len);
+
+	/**
+	 * @hdmi_clear_spd_infoframe:
+	 *
+	 * This callback clears the infoframes in the hardware during commit.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME flag in their
+	 * &drm_bridge->ops.
+	 */
+	int (*hdmi_clear_spd_infoframe)(struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_write_spd_infoframe:
+	 *
+	 * Program the infoframe into the hardware.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME flag in their
+	 * &drm_bridge->ops.
+	 */
+	int (*hdmi_write_spd_infoframe)(struct drm_bridge *bridge,
+					const u8 *buffer, size_t len);
+
+	/**
+	 * @hdmi_clear_audio_infoframe:
+	 *
+	 * This callback clears the infoframes in the hardware during commit.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
+	 */
+	int (*hdmi_clear_audio_infoframe)(struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_write_audio_infoframe:
+	 *
+	 * Program the infoframe into the hardware.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
+	 */
+	int (*hdmi_write_audio_infoframe)(struct drm_bridge *bridge,
+					  const u8 *buffer, size_t len);
 
 	/**
 	 * @hdmi_audio_startup:
@@ -1062,7 +1146,11 @@ enum drm_bridge_ops {
 	/**
 	 * @DRM_BRIDGE_OP_HDMI: The bridge provides HDMI connector operations,
 	 * including infoframes support. Bridges that set this flag must
-	 * implement the &drm_bridge_funcs->write_infoframe callback.
+	 * provide HDMI-related information and implement the
+	 * &drm_bridge_funcs->clear_avi_infoframe,
+	 * &drm_bridge_funcs->write_avi_infoframe,
+	 * &drm_bridge_funcs->clear_hdmi_infoframe and
+	 * &drm_bridge_funcs->write_hdmi_infoframe callbacks.
 	 *
 	 * Note: currently there can be at most one bridge in a chain that sets
 	 * this bit. This is to simplify corresponding glue code in connector
@@ -1074,6 +1162,9 @@ enum drm_bridge_ops {
 	 * Bridges that set this flag must implement the
 	 * &drm_bridge_funcs->hdmi_audio_prepare and
 	 * &drm_bridge_funcs->hdmi_audio_shutdown callbacks.
+	 * If the bridge implements @DRM_BRIDGE_OP_HDMI, it also must implement
+	 * &drm_bridge_funcs->hdmi_write_audio_infoframe and
+	 * &drm_bridge_funcs->hdmi_cleaer_audio_infoframe callbacks.
 	 *
 	 * Note: currently there can be at most one bridge in a chain that sets
 	 * this bit. This is to simplify corresponding glue code in connector
@@ -1105,6 +1196,18 @@ enum drm_bridge_ops {
 	 * to be present.
 	 */
 	DRM_BRIDGE_OP_HDMI_CEC_ADAPTER = BIT(8),
+	/**
+	 * @DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME: The bridge supports
+	 * &drm_bridge_funcs->hdmi_write_hdr_drm_infoframe and
+	 * &drm_bridge_funcs->hdmi_clear_hdr_drm_infoframe callbacks.
+	 */
+	DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME = BIT(9),
+	/**
+	 * @DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME: The bridge supports
+	 * &drm_bridge_funcs->hdmi_write_spd_infoframe and
+	 * &drm_bridge_funcs->hdmi_clear_spd_infoframe callbacks.
+	 */
+	DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME = BIT(10),
 };
 
 /**

-- 
2.47.3


