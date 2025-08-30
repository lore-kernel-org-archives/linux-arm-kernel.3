Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81202CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nf0+abWmGCJST77+Ob/lOwCJuYhA6HECShYvSo7oZM=; b=ARV0Pz1E3bMVHi4C30ZVvtjAqZ
	5vXE4RUkpteOJY7iY4SOcN3Em4ZF9lI8Tjg/4l2Sz82rLqN4fICK31ErmBfwsJygOs+GlUgygrLhM
	BFwryMYtBDCTtnF9cxDGUarpf/CmV+Pdz5I7NfFvYoli1nPlWWAzzvy987Es961haynPw/ZUhmgmJ
	HJzg8SfjIbqdOIafhbQUwdD+qqSLsdZCyiZtASJCnyBeQSv8jta+teH3VviQ1gCuaNADTNwW2Pv/L
	2PUbF0Npjk7FUqvoAKJcG4Cwf3hvdRdwO6ti76CT7QBS/FNchD4ttQy8+P/uUxjkDcHbdOBSazkP7
	nej/tQ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9qT-00000007Eri-0DpC;
	Sat, 30 Aug 2025 00:53:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9NF-000000074aG-0cIk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 00:23:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57U0AZg9017779
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7nf0+abWmGCJST77+Ob/lOwCJuYhA6HECShYvSo7oZM=; b=D7uh6kBbblxZW9vJ
	AQO8arjsTAUfNxLenI3aVXaXtb+11BbgrmB1CsxpHrPwQdS43XAwfzIrKq+kezth
	j0GQ7nGhM7SpUqwR2cPX+XWfVbC24Ib5B7YwoYmATkzJY4gh8J1rwzi3aFyH9Ix+
	tAJCELg4AuWIOal/7AXKBIFsw1i4bmBWQMFMxyji7h6Ae+XVjBEjjf29BpO64YmQ
	6Wxm2TSFNric0wtJAfepyQebNkRovHAZTKwmgsL8J3FPhz7g9m5WwjFRN1Y+peAo
	YCMJZg046hFPxkrKymnymtVULik4qmEuSipYKoKOjpZlJYnHLEzCUmqqjwjldwBz
	WVeqDA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615w3t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:23:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b2f9e8dca6so57549431cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 17:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513395; x=1757118195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nf0+abWmGCJST77+Ob/lOwCJuYhA6HECShYvSo7oZM=;
        b=KVqhZCfxXt8fNDXiCgpPLz/Dl7wCljD+u/vFWNgkanFmk/TUxk9NBixkpFsktOjbEE
         s3R48orQRChf+h8yXhsXcj59Kp0ieeDAS5Yf+lQVNKYmMdaWITk6d1QaeGxfMtCEwvpT
         33J9sUDzJ4JTSdu95ok3OiN4k6aC8Z2phEhBQ99DGiSl6RqoCTBGbrleAsQhBCFUHdTF
         hYERoO13x7MdjhDn+3tT5B/L7Oa8VdNLKpD9PEP8tq8cqvQ/5ROoPrJ6s5xEZ3vGFZAP
         rv+NxxyzIPTNqdVR42uWoD19vVhiyIqcBytt5YlGZNx7uC6W0T7TNlN+xyeIE6mmP/Rm
         imIw==
X-Forwarded-Encrypted: i=1; AJvYcCWOLjs6qYc6PyLCy7neZCHBX32MfdWANPKH5/63w7But7pxufO2IbOurT3Q0oBF0AaWDqeT2Gwla04+/k9OHB4k@lists.infradead.org
X-Gm-Message-State: AOJu0YyhpJwXRZMpcMkHxpdGNO5tYhafgjulcATXIQ9axv2E3x6XN3wh
	pxlGOluxOEDkMQscojojfoi2FH8rdJZKriZR6sLZTK+bmtR3xW7cN+frO6c8F4M0WTR/yMZ0kBX
	iyk379QD+fFlFYqYb5tU8hWqBc9oP4lfGYYTfnTIViRsNMBBJFLGAR2kf8jnDvCxh+drdWkJ1Ou
	wEew==
X-Gm-Gg: ASbGncs6l4HCabMht0pQ7pE85hUi54MYARjey8Bvb16n1bytJvRHoUKSOmRIObeBds3
	Ssbp3ByR1MD9pX/z7He7kHBK+8vDlA7yhKtFcBkEWk71tD0lz/z5nqw23a1mf5NoZfHxoDBSuYR
	4Ep/DYk8VIaMVVCkHbIh5dgjMIhMPOq+/sSo5rgJH6HS9PN809lCKHBSwWVtKW+JY/eKKrjdGfb
	ZqrhtNHJRIroBgkuAFL4jCjeGMmBEOBYJLSdhuSQ4zfE5yEyVHPo/QwDl4Ysn3kyKcNH2bQ27Tl
	mVsyYidG5L6xXyBCAZ/EHk68ZerGp1rfMa+MxB1171ibtAe12D/Snlw47vWg0Qakm5nTG+ffDPS
	x4yjUrdQk/TvKW7bpiZ5YV8JOA5uO36SQmU6jI6PfFVXxwD/6Fvwf
X-Received: by 2002:ac8:5893:0:b0:4b2:967f:cb4b with SMTP id d75a77b69052e-4b31dcce3aemr6287691cf.63.1756513395174;
        Fri, 29 Aug 2025 17:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOls7IHK5n71gLOims9R5oXNm30OZQlHiNW3nK6iLa1qZum2ksrrXODlblb3ZuRNvP5SOgkg==
X-Received: by 2002:ac8:5893:0:b0:4b2:967f:cb4b with SMTP id d75a77b69052e-4b31dcce3aemr6287201cf.63.1756513394655;
        Fri, 29 Aug 2025 17:23:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:02 +0300
Subject: [PATCH v3 06/11] drm/msm: hdmi: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-6-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ECUd39xCRDayMF07yZPid7frZVCtdwJ1DNCpnou818A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRkadcPsIT5VtZsPUIxt4c7DuFRHVG0R9qPC
 e+hnmDKZ1qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEZAAKCRCLPIo+Aiko
 1XJoB/9uSIvkAkBHEdynP5Np4TmqF25QxdIHnyZDZRd2oMA6beg+0p2vmu4j8T7iBPLH6wuOfv6
 yuy3KGzqXY92I/wemcHThKBJhM3F9irEXV+pLwba1BFZ1tX4k9erRi846J49Ao7zWeEP/xfmaPz
 81ispd03TPnsUvWwua6/x85ON05f4ECTHRc4+QUmjqTUB5Do+4aS6kfHip8DmrVdpbiYpQEZcDY
 dyZgO9lEnPsSGc+YkPsQmyKeuNdrMSHxmoExrCm2VBYq9CaceiwABEYUbvXFk4YlFDv3aa3E0R6
 LB4x461C04PK5YUvWfKCdrT6vT5Mwb5jFjWe5xU7iIbWVh5W
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX72jgiMfG5eJK
 f/MIfiEFVvF0VZELKSyeIFqzPQs8pQxnFgMCtXwvQH9SxZCCD0NmmmGsbxUh0oxXnp3VYmCyGJe
 pwWesPhxkCTRSVjyBw/Iu8pPW1gf4pA9dUK/VtXU9wdkJ2jtCgU8USzhc8MKbKyccuG9ygJi/RV
 iBntTLAdrAudg/95Bxe+mGtE1STr6C/+E4lfzMdvS/xTPCTzrSRtfftY4+em5zyxojQCuZFxqIF
 fzFWPn9jpYZnijzCRaSYpyzBlQQzRux5/NWQGKuBxu9beodX2Yw6oo2cHCpuEkxVNdt8pNwvYip
 wf/7UciSqJSNJOiedIDypVo1T++8Ki2N07DCyiCMbzVp3XFP4H+8Z3HVvqBv2DesPwqRZdJlYmd
 MWMkF4Ot
X-Proofpoint-GUID: IZaaBvxwdzCSpI3Gi4X40y0WvsNYvSoF
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b24474 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=QemjF6U71Mh5n78GOpwA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: IZaaBvxwdzCSpI3Gi4X40y0WvsNYvSoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_172317_302880_9C3C1E86 
X-CRM114-Status: GOOD (  14.43  )
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

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..9dddc0e47de462212d42f3ff1012a073b98e3a96 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -249,6 +249,7 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -274,7 +275,7 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
@@ -498,6 +499,11 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
 	bridge->vendor = "Qualcomm";
 	bridge->product = "Snapdragon";
+	bridge->software_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |

-- 
2.47.2


