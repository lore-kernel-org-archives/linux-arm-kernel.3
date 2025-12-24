Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E5CE748FC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 01:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=; b=phrFs2cLQ+YewCbhmVLlyu9S/M
	m/Pa8XjyAPdnuBgu2ecSrUwSP0GZ9/FXTLjwDWceLZFdLR7ytOdA1q66FCa1WcXLPcMOqXJRxVgcE
	RygD2aMx0ZvPrngOiOZzthHoxk5heyuKBZf4rgQKw5tsXOGgZH0hGG4BWQ0aw4gw5jeMjH0ofTbeo
	03zbvJz1JOrq3KdyZ+PYDO7AE0ZxHOM802TQd6oc7F1SiDEkd5dQViqkxAiuIF/0X18PDBDk8Mnwg
	qhLEDpQQ3WMNCS47kbsyLQk2XKjIPnR7F8gB719UecneU3YI+jKzOLF3PO38hK7KncvtkObH52jib
	s+tuGB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDIU-0000000GFaY-2mh4;
	Wed, 24 Dec 2025 01:04:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDID-0000000GFEa-16vi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 01:04:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGO6wG1018062
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=; b=XfH2Ljc+dZzYTrzi
	pD5ysYGQfEwkhPa6D1pi8C2qbcfBhGuJdEE5Tm7axPuo9cDSGursj22LOxEqHeP5
	R9uBpaJ+4/sOsdjt2aULzxdHjQc0CHLodncP7N+ebgW+QzIgym8Fu/RIkEVIq0Jj
	jRDxvdSZXrLN5ge3caHHbALSV00mhM5U92CRhkAtigwUmz2f0w29lkiq9FqPE05j
	iEFxVpGxxc9A96yD8kdKzBFG2/urw5k637d0CrkxbijK0WRFw1tIvf767zHurFAJ
	1U1WFXX9uBnoE3GI5zyeTch4vmOF0P//3srIopPnVaZrtxW8W5okZ4R2ipkZ+bcV
	//Fs7g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs9ajw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:03:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2ea47fa5so149346636d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538236; x=1767143036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
        b=co1RvDi23lrzQNH79a/w1YmmBQ8MeIUVX/eVMHGZzmAjwoPNIueWj6eSo/eUh381e/
         ewJSGPwteaPUtSwYXiC18ONktkMvD2drVAWbIs7wH9CPKEl69dSe4Akcgkxu3PUxhi3w
         wo4pIRZUaXPgInuUNrun+6QoQoBTP4Tc2pJj3VBSrsN5z7f3kFKIvTWRkHWK8conPR94
         AZPBl5cYrHrQxfjn4ZF01+XIj0yfREv2E4tie+p8dem10t0h6isDwH0XtCJJZhNMtm4Y
         mGyes+JRfwVf+HLg+w1BuqwmlNwwoik8UWRUxJxGfMrPTHYuxEhbvw0qxuoj6kJg3rp1
         DNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538236; x=1767143036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
        b=Fu7AhlcCPm85b0xjQwdQAc1e6kiGkFj4yBDrtrIzMrm29lfaXGetDArWJTY75kelM7
         QdB2NoJxlCLECXn6Wp68zFsuZwXUp8x3badirf98a2KdKMlzam0Z5N36EfxBE4X+sRRh
         v/6hzJJE7wdAqFabH7M+NHx70c0+KIbSwO5yUJewrm7BzhEg+FqWF4lRUZCWm8vCPrpI
         tMc1Sk+HU1ZF9gqxR/ZqXv7j1O534Yc8fD2b73q7bJAQwN/sY8k/7IKt5VoM69gde0Cd
         qvfoeiKFoSj9P+yPD89fNFh3tWqBrz6IaqN7PwwGdZz8+7vmHht/wJ1UeVwTf8fqsnjy
         Mo/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqIjnzyCO/UVjzVw7t8WurJOKtXqBJt0I6ofyVmI+cCsqEUSDUp2ucnHqOT+g6RawJBnlyAELqDCMsIsMbh5Sh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5iMx1nNIq8uZLcWYsyeLvOmo7/EUljM2w0v0aiTlVSiLSnjcx
	7eDWseWTaj+xZRAcOEps4kGaZz7UjSVVkGBVpSMZgtmTOZI5g++UkosCC1lbV8HdqJ+vfU11ADz
	4svUFgeeE4Y6xETSZwrsIYpDLIBSfky1lGidKTI39ilMcuB/p7e3bikFg4OWa9p46sJXXGVKDDu
	Tzaw==
X-Gm-Gg: AY/fxX5SfvTa+cyV7K6Etmreodo4LrkXJqNhro21cYinur4CwbkjyvltI/DP1JBsgfr
	ZmyeLOnfwsoiWjUQSLffNwIZez9wiyQpHlk7o/SQHVg34g6+phzuYcm+JkXH38v1GxrFplJFG2+
	vgdWzgyklrbMlpI4M9uhkWECLLGaNwKwNQRSfQTA1NoW/qu7UpQzVMtq0ApP1F+/e1JlQoFRYlA
	Zj5f6qUHHVnbPf00+BYgkRFhjBnOSYB2Fb2Bt/QuZxgVMbAwXsHrKKuGXBmfcLpdJ1W/2fRHuhQ
	1VFM9FPB4Bf4TqIRpHMH1LPnJbAkyjXb9svGq8x4/tAyHxF7a1jJfA0IH52WK+ZtgX3gCCWln5A
	yq+rqweN4dTjs4OvYkjRRd2CeS4Bf/gzhBty/Mn2Sy/20M3IhEu7ZPlNhtG7cw/oBdPvinoE9+4
	1m6CKOEMtkypbMViOjLVZq+kw=
X-Received: by 2002:a05:6214:4686:b0:880:4cfb:ab57 with SMTP id 6a1803df08f44-88d83c64e72mr214392576d6.25.1766538235596;
        Tue, 23 Dec 2025 17:03:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaK542l9xmzYYsxqdNmih3a3J+cADi7DGuEWQ94lgYPMK9IxHSj3e3msfodcDCfxK5YjzPVA==
X-Received: by 2002:a05:6214:4686:b0:880:4cfb:ab57 with SMTP id 6a1803df08f44-88d83c64e72mr214392216d6.25.1766538235179;
        Tue, 23 Dec 2025 17:03:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:56 +0200
Subject: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oV58YVZ6PqGUocr9XjdKTVXla4jnp1WcJhUj/fGMzJo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvZGVPsohAMKCXOdz12kIPkrJMlkOnHo6hb3
 HWobYyhg7WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72QAKCRCLPIo+Aiko
 1QKNCACqcQqgJBRBcg7CRb0dfX/GGsMyAFAip0dgaqJtDLf7ApFonc0Vo0fA+NhcV5j0Nx8Ti9U
 I3ZV4TYzf23eOcnZCdm7rXhqmyxWKpftkt+8hIkJizIcSP+w7WDLeC2a6QEPQiGVuMei4kWHGnm
 o85bmygfh11FQZkX2pCCQNJlyfTByGtP4Y8JpLUrRBIvBMTYNUGhePLY9wL2DAFLPPW6ccgE1wi
 X82GoCEVaLpslRdu4Y6qY0DXtzUr9H7AOhKf8Hucv3GM83Xm/DL5TfDXh/a3uK8yiLTMpc8RB1r
 OJlOJIJ4Pu0i+HpaBnRzjUWikC+VvVcYf/m/QP/ndRhcoX39
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX8QYik+qjCR56
 LUo4W6nKC2pHfSnnCMC//3Koz78GhsFb88as4rlTSXMtjDIF4xnk4GU7jleD9BOtcojkNDN5XPE
 nbvfKYTVBSLmFzdHaAAvpSqqeMWofMoAqWfawTa+Sgi5p/8nCDEnuA/NamkVOZgeul6EKz1qGDn
 uiUqjjZvC9dmEK6O5VkwXhH/UWevJrBUfFwm98qvWow6y15gfmTB9u0YknEXt14MFtJisMgD65c
 iQLBmFYHJNtmF4Z7GrkdgXSRue1Y/ghuPkCoOZH/MoIkghmpt7V74jILYF0jFGaWgLzbJOf7EQW
 uTZ5Ho1WYVf9ktTurailypj7DDlOjVUgWdhL+i1iFiCQaNReisViH8u6iAzWi1S4r6YrKm7zVfT
 atwX/TRHYfKWIdgCs0SGtBPh3XtKJIVYu2OZeyrbl0ouqnUvhik1h86WzEwqjgXfT7QwuNNmKbd
 sSHa6fKb7Vt9hrKvzSw==
X-Proofpoint-ORIG-GUID: cfCXLrAXz0pJjj82FPte4fhimR_S6xHK
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b3bfc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FWtRXCEnrA9oX9MUO7wA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: cfCXLrAXz0pJjj82FPte4fhimR_S6xHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_170357_460396_237E00FE 
X-CRM114-Status: GOOD (  17.01  )
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

Updating the InfoFrame if it can not be sent over the wire makes no
sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
an error if Audio InfoFrame callbacks are not implemented.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 5a3817271d91..e8556bf9e1da 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1061,7 +1061,7 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!funcs) {
+	if (!funcs || !funcs->audio.write_infoframe) {
 		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
 		return -EINVAL;
 	}
@@ -1102,7 +1102,7 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!funcs) {
+	if (!funcs || !funcs->audio.write_infoframe) {
 		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
 		return -EINVAL;
 	}

-- 
2.47.3


