Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4254CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Ph9fpMKwyVh1QpkoJDUD9CEJnYrcgjdCLeyqaq6qOo=; b=RA16pUHCFVNxrMVD6NNXOz9Mcc
	qvGIegvy3jTXyFDUrc5pjT1LK2sJ1ZNvB5d7yJ4xJWvf2hmGzEekQgmA1ByVEm8imdE81elrCE9h8
	AhpBo8QK5Id31O21pBLNxfF/dcdsuT9p94AvZWkGFAokQrmT+dyVw9TDYXWrFXRAgqZ8xip8XgBmQ
	G0bcwffZjcalHaxtuCuCs4t2WZmNMpV9BUb61DEaSE5hiTIVnxn58uG/6c0yoW2zVfJlWvW74DhBr
	C0rPFLL3xp9ylmvmkHIkmTjcaCUN8gktfmJGz/CJKk9w4U8UkzV32u45cl4y09ALRNWSdz/imXGfJ
	50Rxablg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9qI-00000007Een-09dN;
	Sat, 30 Aug 2025 00:53:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9NB-000000074Xr-2CW1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 00:23:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TNVW5U032595
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Ph9fpMKwyVh1QpkoJDUD9CEJnYrcgjdCLeyqaq6qOo=; b=UMrWNzqMYMrZjeNx
	lYnPwFSM1DlBJnTfCbOVORANqwmE5ZANTNLbCQxA5h0Nihow7ScdskL6QJWkOmuA
	vnTrj/HyOKDAAoCio5lvtPu2sVEiE6uo+b2Oa+dSqVYs8/PdXmgfmnbY/2CVWKu7
	au00EnICgrvEGxh90n950pV+jSVJxRMi6paAXydM1QJMZxlHRArTP5rFcL+zkMET
	eCRlTP71YCJ9UQ/aErsHTmz9dI16r7nTObvARC+BLZ6KlbnzRfMcOsK6wEfqjWA1
	u+1Rhv4VrkJ3tnGz7xDgal9Bh7h+5oliTjISg7i5WV8VA7v91eEL/Jc5u68XCOZ9
	ClPVBg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5vvpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:23:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b31ba1392fso6666551cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 17:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513392; x=1757118192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ph9fpMKwyVh1QpkoJDUD9CEJnYrcgjdCLeyqaq6qOo=;
        b=Xip4WHKEDBGTZXsYEKm8RjAh+fUfTWph7/AFnARogA7cL31k0waGtn0hSoQpO5TfDq
         8CoP95cnfLO0+HfbnSMx7VkG1r9bJZFi/ak6QzhnwLvQcXmbQKCD1vABeHneCePUMkDU
         XSFJObtPPHLido+/Y/RvFzxQE4+4etSU9xQY+nv8kc6lUhEUcHn0gN3J/J+HlVF9KoGG
         id5TBybHh5FVkFM8WCQ8tc34NOcGTauvxVbZFHPEBbDsGp0gNM2IbdKr5jqVZoKwSj2F
         IbKWpBaGIPIFGwYIgs3O+7VLX2NriVRwi7FnQ3AQr6nDNWQt/u50cR7bC7tjQov1HXoT
         Jp9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2jTL2iywJx5XgW5+b08Z87VvROhqRVn5/keDFVqOfD9Mvp7qWb/YfkgrV8tiDleL3NEE4w4bqpycxgLFbiFZM@lists.infradead.org
X-Gm-Message-State: AOJu0YwMgqV3h7+U8yRUEquT6zC6YTWY4T5viNoYzthbECNBKJWG/kkk
	P4pcWsmWIUf/3lcTPFJFM8jI+vd8+NOmT8vwzaqHAXtpiTbHSjwVKnCV1PdunbddbUAJod9KcNS
	0VOUddtEbOWQAm+RfzUu6S+ZRyAqq5RBrIX1Oy07DyPymHgJA38VO1llprxc6LPLImxVhgLM9PH
	VY5g==
X-Gm-Gg: ASbGncsAmuBhXVgZNjU/yGyxZ9AyaHO7m7cPZPMgo549YnLzb6InGr6bPVlqEeuJ9yG
	DkhBnYwyEf1Hr6QPM9dPDQvH1AmxmLKpL/IN+TZzQg8Cdy00EgpNAPoBFvnWodNovKBLHn0QmXM
	iQHkXY+/QhGwDmGuwQvs06au5KP4xvtnRzgEI6+I9kh5yivTb+s34uq7KZfM+fMnNejUwiCpCMU
	Asl9i0+4XckKDrfHtcRAaToCyfpwvM2Fb8vsPV5km5OVKovz79K6wq6UyREU5Vo46rzPWlJQER9
	fK2wHs6vdydAqphmc0pRl+olDAisi6hK8J9Ew/EQwY7PF31VcUj10mXyh3Z57/2V57IawxRyb3Y
	+Hbb/JnFIxXV4n7Cu45TufWnDxZAWoQoqwEPqbrt1UtNZ0Z9qEooT
X-Received: by 2002:ac8:7d4e:0:b0:4b0:7989:13db with SMTP id d75a77b69052e-4b31dd21723mr4241511cf.58.1756513391683;
        Fri, 29 Aug 2025 17:23:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHd0n8qaUqx1S4BeHPfs6IpVe24aic04/cEgU1Am0csv+xPy83xFNb93VjtGw3hJtcKfrI7A==
X-Received: by 2002:ac8:7d4e:0:b0:4b0:7989:13db with SMTP id d75a77b69052e-4b31dd21723mr4241371cf.58.1756513391171;
        Fri, 29 Aug 2025 17:23:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:00 +0300
Subject: [PATCH v3 04/11] drm/bridge: lontium-lt9611: declare supported
 infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-4-32fcbec4634e@oss.qualcomm.com>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4s8HKYSS0MgM6zvdVaXPrA7S2HD2NH/k39knkirGVZc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Yml2SbZ896twlcmpFYdb3yiNI2XV4x9X7bfjcNlm3zv
 ms+vfKyk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATOSfN/s+U70GO8d2+Db0p
 /pN1z9m/2y0T0DMvz+NpxuZFXmJBn23ZPKsfs4svW+bYZGf3LKdbWyZn2nKFlVejZz2vP7r9Z/E
 E00Bj9pPP38rLZN7Tvp3K2hfeFrhHkWnmKekpb8/mXYoVCMt1+Bztn71ONMRryfo44T1JLy72t2
 33iGl60Wy8bMEafuegeTlLzM3L0y9GWe6c+N9EwnKpp7bm3UdPVlnL3nDd+b/+WJjb1GCZ9u/p1
 y3s+bO9rkc2R5mJrn+TnqR/ZbLwAfuupdoV7uu8bBZYc1hFTWANWLtK7OHNXc0HrV/U/p8bupdz
 16WmTMsyI75JubpRa48wq2S455fpPNVdaKP4xvHWk+oNAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXxswaGS7RvNHR
 6/8loNzNs6AXKxlkHJhfYTDfdo6AlGFQUtJTifItUdk7Lgfk9hdEn5HOZi0yy3/ia/kiI6R7hYc
 ZG8cFqeBTrQFnC1LdOMHfXGA858wHDDTrC95RaRwMO6YFYOtuZ37jCSe+7uhC7cWMU6l4hKVVAc
 5JGtoV7IiApuEjSdgP3st7/Mlp8I0oI6a+waz8d6xYLZ/SdY4snmSAucmqbuqf5+rqnJqzSftpZ
 Bto4a/cWZsubBMdpWUvq122Q0SZA3tC7STZSm2Og3B0AnVP/nui28gTN3wZT7/yiyWhornuQYy+
 uhIooo9I2p5sViBrIs58OW7yZOBevvV+GA12IhnoBQuBebzDOW0lcn+CHXu4d5k+evPh973yYgk
 MAlUtXWE
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68b24470 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=AMvF8s34Jxw15HKoVo4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bCokvZdNRLNqldNtezBtZxcfSAutY9l7
X-Proofpoint-ORIG-GUID: bCokvZdNRLNqldNtezBtZxcfSAutY9l7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_172313_709106_61BE2CD0 
X-CRM114-Status: GOOD (  14.33  )
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

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..271295e1549885ea054647b06cb95d483e352f4d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -870,8 +870,7 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask)
@@ -911,8 +910,7 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask) {
@@ -1136,6 +1134,11 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
+	lt9611->bridge.software_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	lt9611->bridge.hdmi_audio_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;

-- 
2.47.2


