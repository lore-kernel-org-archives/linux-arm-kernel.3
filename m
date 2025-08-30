Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3391CCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFElURD5QRZmLsVqoA3hb8tqFcCE4wfhTZP2ZQz0do8=; b=C1wA5M8Y9UWniQ153QUB1QotpU
	x37iAcgf1/rKE+vAcdVnzulIHbZ66MC05rzFeZzjLgW4oRxWSUc3zVJmXqHG19sgEU55kMuh98Xya
	u9rzpaCY1OqvXVG5xBoKMLmE+Fcy0cGgXuEPO9/rF0EBzTpKCxS7cCrH5VQmoWiYK3EPY/+8/5Sa1
	ryUAeQQxu2Bt6NZQUy1T0H7SXDWvPU6mc1FHS7MXCuBEq3FlEoVClZwuucby58Skh1hBNIeoNVQmy
	zkFJ/TcIy6AnvcQlJrA8RqX+WCvnwn6y14auAA2p5qFurAVmlqErod6qiR22e1vKeFdvVUNfnvxkZ
	ypjvqCyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9tm-00000007FqA-2ijx;
	Sat, 30 Aug 2025 00:56:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9NL-000000074g4-3zj5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 00:23:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57U0NMht025839
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fFElURD5QRZmLsVqoA3hb8tqFcCE4wfhTZP2ZQz0do8=; b=gS9etg5kSlPjOI9q
	Dr4xZBf9qVgqpsTAtzWdD4ln9CuhebiznCcCdFYeV0IxD6Cy2TKTzSMoehX+04Zs
	VyASDMByiEtgL40oZsldbgzADMdmO8rZHMWIZPr9ccKOUx79Q6GzIw//z5WAGGHC
	9MnBfKrs+LVR1r+gODwfqHoePUJ5o5zZHDzFP7aqjG8+2pZrw3QRaol5+RKaPdtO
	vJW/GoCVmwWmMR4HQ7AROXAut5YFecrwigNnR82NxTb1fowPr5Bf3FpYQKDX0Q7S
	JTOflOOfgcIi0p7wUgTJEXN65tNUIEz3R2Kc2Lm+ZpaNVbRhtJzzsd4iokfMqUNx
	vQGa0Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w35dtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:23:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109bc103bso56211891cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 17:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513402; x=1757118202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFElURD5QRZmLsVqoA3hb8tqFcCE4wfhTZP2ZQz0do8=;
        b=nOyBK9HgSNjzXELHUDrYyLallxM9K55NINUdVReDMb1iASEgyter6f78ZgrdbO+EAL
         r1eHXAKVBg6U8cOFVLbU/LpE7SBpwXNw24LN0BCFqthZvBgRWY5RjWSvWCsqcanvI4jJ
         Gx3b6iW7Mp6RQaFP/rvs37d5AyhiqkGnIu1EqM5aKNsLqX3Pv0EuXVsgkiX6punY0wHc
         No9JIzlbc9RGZFWd0KAfY/Ijh2xDvnmbs8tNUrV+K+mA1UuxMm2f0uLN4DUJZeKS68od
         bbrI/KoECRbUJYwfCUpy6ryzzD4pYd2fpYQJQizYnT8gDh2kgzzf2/KBA7O/3czBuN4p
         g4tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx8FjL4WR51Z1yIXyDMtr/Zuy8MvIX1J4fV2aP8WkZ+iTUUKJRgmRErKa3UQb/f/1pEivP6d+GVC9bj+ks8Gex@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq3gG+xPiAUq23CBXFZZJMGsAOF5gCVdDi+qqp3s0EqOjWYGW1
	BfdbEW2dn4T3GEWvKaFqFbFMMmeuQ3jB3VqKlyKv1BU9lJyhTDAttDbNhahIayT/rmy0efcTuuV
	1VFohJIL8exEb9DG9XjdGlPIWXbxXnX1Maxxwh5Sp/WGehsy+iyqOj3BrdGbdoKmJDagTiqs0Tq
	RtlA==
X-Gm-Gg: ASbGnctbyE6dS9z9U6L8toau+Ckgh0wMQs2jSWv0YtPctRQ4T0JX82YHzB8M2+OrU2C
	BBXM6e7X2MzBqzVqVAcbYnBHXKKL/zz3wqTKQphYwRmqjtFn2tBbzL+MNhd8PngZfTuI+v/d9Vy
	hIpL61hybIaPoxij8CPaCEAcFi6vgXaMD7uxE3MWlcGbnQWs1UchaLcnPtQ3lLp5Ku0OHPDChrs
	Nypxtt2S7JFXNPSrPaKXDV+Crt0e9iU430PyG3EZcsPDfqdzy92eeQaXlfO7MMz38bDcgQ+l1uh
	E76+knm5SOFfS+E3pJ5ws9u+DFhxpfC/qoyYgF/4UwYFQakqAMlk3esYJVP4mJ+skT/jiQvAW3h
	vdwaQ9TXF+YQ4iai3EbgWKJopdBk/jAo1wbxrzlGFkRjSxAFLTEzU
X-Received: by 2002:a05:622a:5c6:b0:4b2:dee2:6498 with SMTP id d75a77b69052e-4b31d8607eamr5634991cf.28.1756513402149;
        Fri, 29 Aug 2025 17:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwgTkXP9pj85NxwpdQc0ae5nNZHcprVUGekqFYFf3riFk956UhGONyyTfF4B6OsdIgaiSMUw==
X-Received: by 2002:a05:622a:5c6:b0:4b2:dee2:6498 with SMTP id d75a77b69052e-4b31d8607eamr5634631cf.28.1756513401513;
        Fri, 29 Aug 2025 17:23:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:06 +0300
Subject: [PATCH v3 10/11] drm/display: hdmi-audio: warn if HDMI connector
 doesn't support Audio IF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-10-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DP8WKS09AQHIP1eUa2wMNyM9LpBbwdIRAz41gdvU1po=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRk2UNRsRCHOJKzLD77zC3Q7JVu5+ElSTKGc
 O0A/oyeiyuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEZAAKCRCLPIo+Aiko
 1d8OB/0RMEMUbmxG0SYUoq630dkm8bopfypsnF25uIBgBqc8fbR40rj2Z6O/aFjiC4pxNRKtv0T
 Pb3wXjEx8igMQQyVkYQs5YH9EizhVoDMP2qbMuQD83N2hhtJsjCO9NIG5nBEgGmQDZXWFDqU4gn
 NbRVO+Cz6af8mXjkexPYvOzEvQceTImFY/x9fqz5j13/z4q3QwePf13Pxhvjbi3Ggp4tvM10wqX
 jp4foOuMAal2wFUF9OzE9JeZB5Kuv5vgwi7qeNFxyo+/bSmE60uO0EtP+Ab9Yhdzc8D/TLSUHnP
 MpGBkAz8OvKT70KC2H3AaYh3YkgsM7FphRVhkLoXKB5BRL88
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68b2447b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Yc4j0DFJudTMt519TXkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8pfhXXizt/zC
 xpCWODoAukWMyxWxU2ZWXQHDRD5F+g3PiRBxQAqbTeDzg222ioaWWkCkjSAeIiZ8wce06kIj5eZ
 hyNePRY4lNp12g5NbbH2YWzVsz8BUbvg4/pyHpa8AqCjhjzmMVRy+DsJzFMDNmVCkAR7b2rXw6+
 O332dII/NP6kB6svc9Ye5jayqXl4y0IB4qvF/NEsCsdMdk/3RoXKnJJ0hbtrn48ISOepFyD/Qho
 ZaZOgQ6sNm7eNtq4okELXj3kGPgJkri5uxVGAFYE/bbd9XQRG0Kpwmu8IPPRMPaTNoDSngvEFa0
 5ZlyeEFG3NVYTcR5mVASob9eCOlvt5mNsPLKtCag8tC9Lijp7zdweNTdknV8I9Ls8gJRYfMR2rS
 u3AK4LDI
X-Proofpoint-GUID: OKuemQQCyWKOA46uOomIwh8ijUATOWmn
X-Proofpoint-ORIG-GUID: OKuemQQCyWKOA46uOomIwh8ijUATOWmn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_172324_001645_0D8613DF 
X-CRM114-Status: GOOD (  16.68  )
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

Sending Audio InfoFrames is mandatory for getting audio to work over the
HDMI link. Warn if the driver requests HDMI audio support for the HDMI
connector, but there is no support for Audio InfoFrames (either
software-generated or generated by the hardware).

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index 7d78b02c144621de528b40b1425f25e465edd1ae..dfcd0e3b4b0d7cd6adda78dbe9d6e3f65e8f7ffe 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
+#include <drm/drm_print.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
 
 #include <sound/hdmi-codec.h>
@@ -178,6 +179,17 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 	    !funcs->shutdown)
 		return -EINVAL;
 
+	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
+		unsigned long supported_infoframes =
+			connector->hdmi.software_infoframes |
+			connector->hdmi.autogenerated_infoframes;
+
+		if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AUDIO))
+			drm_warn(connector->dev, "HDMI Audio with no support for Audio InfoFrames\n");
+	}
+
+
 	connector->hdmi_audio.funcs = funcs;
 	connector->hdmi_audio.dai_port = dai_port;
 

-- 
2.47.2


