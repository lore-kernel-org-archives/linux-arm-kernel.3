Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D2FCCA468
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 01:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1h6uYkRU8WeCjA3UtG+kTiDMnhzyUWryuidxMFQmEgU=; b=GpQe2tpBox/o4s6QewCHCintWo
	GagqoGHScTWzTo1reUvYRsBEywvN+6b+tVYWJAbqgh4JoxO96jbuRSvveXwgynvN+Jif88L4CtPlX
	aEVOdp1RKdiJWsnj7HloY4amRKLV0jQBs4miMvn3AsNsCzgYdAbsaeC5kSkrHn9A9zE03StIfJFvd
	Ln2XrYaOpRN1Uf9sKQoOtvPEqwvnfwrC8rDrGGCECqG+3+5aH8bfV9+mWNdoDcdBfIvK9rP5HwVYA
	CIjaSPhoeTBker3qSrg6DP+RT2d2RZMIBByW7k1+4FpkrUdePPeOx61hE9Nla4RwQtfeQ+jDAhe7F
	7kTE6EWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JMt-00000005sds-1Zuy;
	Sat, 27 Sep 2025 01:04:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JMq-00000005sZ0-10fu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 01:04:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58R0gS5L011617
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1h6uYkRU8WeCjA3UtG+kTiDMnhzyUWryuidxMFQmEgU=; b=OjikmTZinC1bxTvY
	kl/UT/wbjuAVdi1UqckCvylVhh1eIhxX9LQyV2OHpLr1m4A0O4gnrNjnJhuvmXOx
	gGE6PXW8sZD/CH65sLfsFKcOdWg4OIxU+IpiT8dsg1JTqBVuOOWIlq5ZX1ZZFuRI
	61N3Q/rnyPO4ty/GGw9ry+5mxU71+Qk2PKRWfsJuublN5++8LcrzzNCLD0b3CtI7
	hLyRF+9zyky8GHiMrrO8cOr2tkLqsO+S6jfcMWhQ8VqMSyM6/1kNsJS9zN4O5Owr
	HLHi7ob9piLSOOwlbOw3Pce/ixBHPDB1brV+Wx2PZ7hSP5dtibY3A+uLHvuS6tBz
	uVDguw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mcg0t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:04:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d7f90350f3so58682351cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 18:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935090; x=1759539890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1h6uYkRU8WeCjA3UtG+kTiDMnhzyUWryuidxMFQmEgU=;
        b=wNr16dDDf3amzfj3i6sX7STVMaQloiFNxcylk+uBUm9Pm4EZYmtv0r7dW/x8igoiiz
         DEt/ROjLEW9XzOZFnDoNFpy6oPDGCL8McFDxQpyiaEOMQha5GxWHiYrWhEni83pexbJ4
         VcAVuJTKyqyf5JtpMuN0bETYuiCmg6I9UiyrHJGwc9UQJqHGFtEB+R90SwyVRA57uZMz
         dHW4DEcrIIFt7oAEqE9sQBHhhrCOhxbb2XHRMc4vmXH6XZKBPa9fjp5b6QZR9cyDdcmI
         bCjN6Fqbi2/1c91naILxHEv2kASs924pFvev99GPhIP7uRfkHi9qF4CJ++N3ehWv+1GV
         E2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXHA0VcqF1WMfsslHEQEqQR4xwGso9qjHV19Bx30b5zER0NYPCX/KvZgS5KLV7knWBk6G40ha9p2L6bAOllDr9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3iTQZgnXYkWc6uEjTzvSbBblsq7r27zSlMI9YrAhFTYWC5tIn
	VtpJKvEEhOztbpaHOVRSbBkNaLWp1Hk1bH/nMm1Y8nsVxyYOEzSU2tltAeM7MoTw6knlszKi35Y
	3//voZft/7JUGE4vt5AT9yggu1UjCm+AwFK0FHwTmtTXOkzftlqBBcTOOS+oDdNfmTPJXHWizV3
	H+wA==
X-Gm-Gg: ASbGncu+zNmkKgInezPaxY/sSyhO3PH6imMepOYxs+M5pCuBaWfbmwH235REmc3j2Ao
	aQtZcaSr3C8qne7Eqf6Yr27ERqq9VZPzSJGdyuWI4xcUHz05//Iz1k//vevR4xqB7d9+wiW/PVi
	rIyc3k9l3KQt0I49w/X9IvVvaMBD6/MPuu2a+5788SC3j0TvN/DrCAnWj6pryog0ZFu7dnpe5FT
	3qDMf+9tpoLJyEwje9kB1UYZg6BucgwSWqU11+dbuXXV/z4I+9UUIC4haOdAYgy2JgGW7aKJOIb
	R16Nifs2O1grthyv69nj+JrP2jOBdK4PBcyEDqnu+RW3TKFbu60LEuiBzSTyror7r/iQgIa3LVf
	YZTxd9NkLXGkIvEZjX4lEA899mQsDZan5ZFLX36CJ4H1TmHFa+08G
X-Received: by 2002:ac8:5902:0:b0:4d5:eedd:6882 with SMTP id d75a77b69052e-4ded345283amr20741931cf.12.1758935090311;
        Fri, 26 Sep 2025 18:04:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/5DU/0QdkNd+pBR0ra13vIQRrDSgTQ5XS1w2ffZ6W1gk3zIeIsUearoOIFjHzJrN0PYiLPQ==
X-Received: by 2002:ac8:5902:0:b0:4d5:eedd:6882 with SMTP id d75a77b69052e-4ded345283amr20741511cf.12.1758935089690;
        Fri, 26 Sep 2025 18:04:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:32 +0300
Subject: [PATCH 3/9] drm/bridge: ite-it6263: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-3-697511bd050b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6wZNLqO8X0rRBnfpuMFvBzesvvV8mTr5AH0r8q+zW0A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zgg6ekeEVANunszOEPzosgM9q41mN5rMAyiM
 sKuwjfeMyWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1RYrB/9NvDpIpnndk8/iwFBBsLioH37Zr2qZpkOdcBqGQFXpakstTEHsDq9kYmk1BhFrWzvOnSt
 Wz95HZugwxczRUr2xpV+CYq9mMKnRX5c/BTfHXqp1MXYSIz4V9nqS/u9/DY93Nw29BTgRsl/ADz
 k7ZQVsQthFAglDBsyn/v4QadarI4Zi04elOdMOkvemdmyPqiRWzjJK0RjhJ35Nuyd60XrC3wG+Q
 m1fG2fh1RbsPsFOJCMSg6OwochNbOsE6aVz66Ddn7z0SpGH4m99bXpVZiaTNTCUUdr2Auw7kA6P
 6lNNyC1Ru+1fsOHa7S4qi4AD2uvRRGtjsI8LYco9Ol/RYvUm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68d73833 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yMgUBx0mNp5KM1AuerMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: d49ME6Wbfy_mg4tSkxKk0kx5uQMJWYU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfX3KddHT1r6gka
 bUPyuSECmmUIUKrGRi9Z91UrrtodP+txbvb+aJhJTz+QRlBZBYqs80Wn1EOOIgGaj8MIIU3vE+r
 PvzhlxYSq8uv4haO7OpoPX8PWxWa4S3QViwqjTtRdYulfiCnpaAJbEAx5lKpZowIRh81NE9/JCQ
 aTShXCMHm0J8MqGIyO3CIbaFxSbsG09NZyyKqLNe0GU4z8gCVvG2Olgay2wZitcT8VgHJoM8Bs7
 EGmvd47aspt3SUz/hz2iyrT9oAGZfT7qA0PCO1xfUr08b3yIwxGK4eLcFnjNbWOwtlXch13y1zU
 GXyLaAhH49cQgPBk/BFTg7j7Axd0FcMX+1HvsdeS+VqerwxvDuM0GryiSx7/wFaf/MY5F//0EA6
 drLV+PwZRNYJf+4cotAcj8AA5algWQ==
X-Proofpoint-GUID: d49ME6Wbfy_mg4tSkxKk0kx5uQMJWYU-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_180452_289071_2B9551CF 
X-CRM114-Status: GOOD (  16.92  )
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
 drivers/gpu/drm/bridge/ite-it6263.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 2eb8fba7016cbf0dcb19aec4ca8849f1fffaa64c..ad331e8dd4e815fe51235e672798bb2732d5c7e0 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -26,6 +26,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 /* -----------------------------------------------------------------------------
@@ -772,7 +773,7 @@ static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
 		break;
 	default:
-		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -812,13 +813,35 @@ static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
 			     ENABLE_PKT | REPEAT_PKT);
 		break;
 	default:
-		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
 }
 
+static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs it6263_bridge_funcs = {
+	.atomic_check = it6263_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3


