Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F67CAC5BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 01:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHBvbs6wVCtvxZAx2wHIzn0cwgfPtQSReWo4Noc9O+4=; b=UuCeG8TRXQsyMaZTjDZGV/Zaj1
	WXVJG5yrag3a/FFymhmnuInMJqqkUYoch2gl6Oo7l32TOUL0LzKjwvZQnCVXf8siF0jLKrY+IXpcl
	LeijAX8BdLIADahDGN/ZDlqyc5pEFEsY2k8x8QMT8dX1Guz3zo56NJzY+zLH/3Wb9gl7aQkJkgS0E
	YNYRAJpAwLNcD80boxcW3knQjSz5fvWZytWRgXUDuc+g3ryFmgFQACovilFDTrdd1Efx2erqdhW6g
	ZbB1XtRnUQ9CJbhp4vo3Waf28N2ELGFyxcNoKH396czZzuJzmrStAwBvG2hjC2Hudafj0uW9zHGlz
	KUbVe5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JMs-00000005scX-2vOW;
	Sat, 27 Sep 2025 01:04:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JMn-00000005sWL-3HsU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 01:04:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58R0gqxC011889
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHBvbs6wVCtvxZAx2wHIzn0cwgfPtQSReWo4Noc9O+4=; b=iB0NPyKzQp9RO4/b
	NiUXUNjL95SnD6VCYC2k7DHEXwm+tErDbCYYEpxZk1PGBnrfOt59d7H6g7nRmYoL
	BmNhvjHiVdK5EQ7VMkDkLu1MFx3iMTtnUVcyOjXHy1S1KceI/8/zJim9fzkkXSxz
	9Heb2J2vhyGp3HaFE35jg+nhzBles9TZ809gOX4xZ62XfO5nweoxK6mZfHlQTqiS
	/8Lk0vJn/Ovja2ENhnXLkTeWkzfbe1jQpc93dZ4Q9ZYgM5WfpYG2XXPGl8/pHH7Q
	Lf/dfoi9jcixGh95tqcKkkTLSvfxoF/n/ARMhqiz3JCqI2kGNEAlPKuBWewgPWAf
	miLiaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mcg0st-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:04:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4df10fb4a4cso7697971cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 18:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935085; x=1759539885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHBvbs6wVCtvxZAx2wHIzn0cwgfPtQSReWo4Noc9O+4=;
        b=xLNnRgVlA2qYz50yyqWsExGyFSHrv7jNp1tKJ1yIY446xLGmCofSTmrqtF4dg/5ghO
         okTDNn4pYQJXfPcqTpVDMAYzAVVY7LGy2CRcWPu+s7IRBZTxi/93ujFilFA5x4s//BRy
         2El/AbJtn48I+BKKTtV+l8Iav6v7eznAWczmo4wxxH9NK5zj903+SjUu79j+NsDMkEZp
         x/VWydbBvbrARNVwruIYHnFM2L7FXXLdKNYIYjmJaeO4VsFlmTRMUUngev5i/vu/rtCq
         yREzaq2xaDdGSxgtZuPhsN1HzCsJm3939eQGx5a+vC3KzkekXhgPsI1DH5f9y/YBelG5
         8eMA==
X-Forwarded-Encrypted: i=1; AJvYcCX60HTWWR8Y5/aGUuahTtjrb8PkXa1OzWa6G9ghGd+fT+xlMB4quGVkv4B9tO+sVwzbSuoT0pdYQ3CImD0QngPr@lists.infradead.org
X-Gm-Message-State: AOJu0YxxQx2IoJMpOVCBf+Yk8eLtApXe3Z5vP/an0HKQtP/EKUAf5R7X
	maHcSyVuaLTd7EiKlZyq4+r87OVKxc8/Wkuytcy9zl4dP2YD3BX3/2iGXJiGUDdFgur37KNORba
	PibAorsW9YmiBg2T606PbC3rlof6U2F/MkloVYaRvrCaNXVm3JOBa9gXOckWc1UPhrK5RcCS5/Z
	IQaA==
X-Gm-Gg: ASbGncvPOoceEi3INtMgbxCjBbm5ia3/glvYaQzL3Ea8DhMJ+Z9ixZgqM5/4PdmWZx2
	LE1VhycU4EdM3vwJhD5ETe+VJgVmlhnHURYRd3SxvrwOxbxiC2ct77XB3D63Ggu0dd5s3Wo0O8L
	FniV0wt+8WRaux+hOBNr5f9dPlK2Ic1QE/+6VOp6YQAW6PSAd2s18u8w97Ij5c+g6sv1BUnW+ts
	gb2gdW/1AS2BMGbMxociF2EC2urHAj+8vnQHpBZYcsKpxuGVILFE/Ag0LP5qUJZqniBtxJAJUIb
	raM7LQsuTOeLbIYkxBunB/s6LSTMfVSVDCRPkJ6K4pEYRJZKaOX/xfNth/Hc6EZ44fUQ+3zZPue
	8RUzSh5sQheATV1mJVkzKsqEnJnEqjHCl0NOwNv+JyyIA1AW/MG5f
X-Received: by 2002:a05:622a:1f09:b0:4b7:9f68:52cb with SMTP id d75a77b69052e-4da4bbe54e6mr141708491cf.54.1758935085225;
        Fri, 26 Sep 2025 18:04:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDgxekAFYTmTTqmCZefeEPl+nSUzBiwY3LbANe6dbEILxpaj8AQRwYb+0/9qkitC+FpZtBTQ==
X-Received: by 2002:a05:622a:1f09:b0:4b7:9f68:52cb with SMTP id d75a77b69052e-4da4bbe54e6mr141708011cf.54.1758935084695;
        Fri, 26 Sep 2025 18:04:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:31 +0300
Subject: [PATCH 2/9] drm/bridge: adv7511: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-2-697511bd050b@oss.qualcomm.com>
References: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
In-Reply-To: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GDJs9stizfNvb2WVbvQCEr8SONIYHFgwY7yHLMQGSzY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Z1C4WwP9P/BahfUM7J/q38y+eoSdQLBoWi9c1+S95+v
 sn2RUOjk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT4f3B/k9v8b97bhIf9U8U
 rWn0L+vfdMc+z9ONLZFtWkd73NlfAtP52OZ9fr5zUayhl/rpazf/lhyvCPNVZLlvN2eaaEvRF7t
 M/RtdPk8PKW1gqT8RmhWS+fDiynlZNom/N/mnfeTKCb/hO+Ovzualbg1512M7InnKQ/p+9Qde6G
 vR8O0/s95ngpGb24U5mc0Vz67N2jhbrCcgpqDGsn7ZwbCKYleeUzyFj/lDhBTmSYZ5q75Wjt3Kf
 Vk1o2NBbWNF/IerWYqvNVZvzdWLWtXKv+is/+R5LVFN5o8X7kjexSmg+/brZ5PqSs5HffbavMEZ
 q1zs5186cY/dRH661Msb39SCc6bVOgZ0nkowVN1rOv0iAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68d73831 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: lDHL3z63zNbb6n6wlQjDNFxtszXte03a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfX2nLpBO7BEUiE
 M4OKgUR9J/HskPmPOcyMJ0Fr5YJ9rKiG2WXmrRuN6yaBaosDpjPrqVPa4NoCQyo58mLeLAS/bW6
 Q9b9M8F7i+wGmsG8cxvLfRgWNkgSQ3VsBisCZjJimXCJ38/QkGPLHeEVH4XZc2u0TVEcaeMVV0T
 yo2AZTmFdu3F5NlHi6okZA3t6ALeXMzVWpMex17GEh3JCF0s1HaEykysNMPMAbikPDjLle8K6VT
 GXuSlRSkOBrUoqEykQqzEU07bA7B9/eKKBHgiaVm9eeCHs4AjoYXmgYDsQmUtH5aZy8B2SQeg7m
 wTKomE1DqpJF/ob81+gXJ5QHXUrCL+qOFFHSirdQ4CiFlpDFVAGVgUhMIAKzXm4UsrkfNcf5J9Q
 w3wi2DxVM7qXhhSSfGDyCIc5f+BJnw==
X-Proofpoint-GUID: lDHL3z63zNbb6n6wlQjDNFxtszXte03a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_180449_833221_775CEAEB 
X-CRM114-Status: GOOD (  14.59  )
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

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b9be8654130758e69ac7ccbc73a82cc25d731a5c..452265c2d81269e158c83850279a3a58302faf03 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -906,8 +906,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
 		break;
 	default:
-		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -966,19 +965,32 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
 		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
 		break;
 	default:
-		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
 }
 
+static int adv7511_bridge_atomic_check(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs adv7511_bridge_funcs = {
 	.mode_valid = adv7511_bridge_mode_valid,
 	.attach = adv7511_bridge_attach,
 	.detect = adv7511_bridge_detect,
 	.edid_read = adv7511_bridge_edid_read,
 
+	.atomic_check = adv7511_bridge_atomic_check,
 	.atomic_enable = adv7511_bridge_atomic_enable,
 	.atomic_disable = adv7511_bridge_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,

-- 
2.47.3


