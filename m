Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F87CAC5BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 08:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JW7b0AYTyN594l8jjE7IU9Ox23Y6YfPpI2powo8DyoE=; b=O59g9TF/6Nhhxgl0n6FhkrCz4/
	N+XUq2cYtX7SS2UB/O7b9bayc+uH7boZhsHW8+DBIHYop+M9u7LlSYl9Ra575dZ9A1Yk76Vifc5pq
	JFdAk/HSB7gVaxRt0CDMrdscicHTJvPuEW/5XnWcCfQgxjZeTdKgcSpMjf2IxALhAQ1t4WaIQhLEr
	CDmZE2e6pjWH97nlPtydJ3s/Pisa92ek/KgJJgaiXUJy5DCQOXvcKPjatb3LMwA0QKiZWyAdfS+st
	VcMRRhJvj0h1QWGVK88O9lZWhQo/SAVXDsmxNB+KyncNE1SI+CX2TWtFa+0akCM6c4LZjo2Zl+NKS
	9eqdXWuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mjK-0000000EKE4-08tC;
	Sun, 28 Sep 2025 08:26:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mir-0000000EJkV-3jFb
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 28 Sep 2025 08:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JW7b0AYTyN594l8jjE7IU9Ox23Y6YfPpI2powo8DyoE=; b=njHavhDfBDzk5zb8iutO7uwMR/
	Fao26xAkPnC/FV7UVbPS7fIz4Lk3ENV/vfwdYpMDTReIDbNaRFyoL37+IvXuqd/Bfc8TJcOOXzyCM
	8PUiyZnzEyCg1EckYj00+x/f9BQzIZt9f6bXJm248Jz+E3lTuXE6+xJrXhQ3SHdN42ifE9BW55QHM
	cKCPxnA3k81AlZsqaYMDmWIICKsWh5Chp/qf0s+jBh22ybrvR+a0hUgcHwh6QUKFUq7j/Mo5MkVA0
	kOS074EMXFRiNUf9O9bwICEPaWXq8il/iNYXylCy2JFLtJaPwyjBKlaEnDwRbSYhfCBLEbFBfngEM
	FFsOlfYA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mim-0000000BAIY-04zn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 08:25:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58RNlBG7007716
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JW7b0AYTyN594l8jjE7IU9Ox23Y6YfPpI2powo8DyoE=; b=mp4uYkh3my/rx1K6
	uqOwewezFIOGTfAWBC4LJiqXSiJqYkSyfHxq24uRT+mIf4ORRgXxNBO1vIH47rSy
	tykT0usK7356iAfJwZYeMFnpv/zxwfiN5BCYkgwenWnIQrDjUdM5DD9rwaYu+6Ch
	ZIDGImYyjvsPMV/ckGhwjS23Mfctwxrt9E/To+vfgSwYazOG6VG/JECbyWiP7v3n
	jwJIAGaAWGWZHrREK3bkxDZt2+JJWyueAGlml6EDioGbF4aiBkiFEP2jbhEKUTNU
	nQNFfiLxGlXw6ViWcpjGOMoK+m9MCrUa+ob3FPzOl4zoUkO9p3LJC285H4tXp7rQ
	Dtscqw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e7gxjdpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:25:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dfe8dafd18so24758101cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 01:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047907; x=1759652707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JW7b0AYTyN594l8jjE7IU9Ox23Y6YfPpI2powo8DyoE=;
        b=RpaMJcil80NG27O+56A5OmXHa8A/dUX4GZlJpWAYxUE/Gnp10DjlRtgIi4lVzcSc2G
         JpNiDyBu5VsKfurtlmQxmSzgNigLDPDbV2jC47gLdkDEIDV69yqptF4vA4UD8gCpDGrv
         xBxBuPzrAlcRa3Fov6ShWgR4BKhq1E6TQSO4pJ4haq+OOt006yYaCMK8mAKUDMFMw7ra
         ojgIBe7WomwT+IFesMGyetlwwbgPqqkPtWhInIkz4C60+dod2GQrpTYeuhdPiPfx+qIo
         5t+1CW47UmPS7QWYFPKKnr8Zww9opVkPME3SW2To5YLdvwm1XvCk9bjCmGkXMiz382oE
         o7NA==
X-Forwarded-Encrypted: i=1; AJvYcCXBHieNvjDu8Ht+HRBpUDbLJSz5X3WhDJJhBE3Qv7pKuw5KwIqj3z4/8MakKT1ZtOtMg2p28JK7BpxnSriW1MzD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3CMZBWeaG6es7CcT1c0Y0s8bZV3tbDQ/TAv/0Phurh/zPsEo1
	JljEoaiYZFCUIEV9d09RLwGtMl8bYFgX0CHISyvFlzcWjUxj6/4agf8S4UQj7uE8fgpRUE5joDs
	yjkgwl2Rjut9X/xxs8Bh3ezFYXRAuraOLv2tzW1+CAb0nnG/dDHDhrgHk4ZOc9fIb2bIYrr8LoW
	KTYg==
X-Gm-Gg: ASbGncucywFwnqaVU7OQ4OdQ22guq7uZsQ79VYFE0jflIqtR+w43o0ZGBBwFM5yTznj
	/6pKLoUJBhDAEC0a2NpVrYGHl5bTw7omWZUmIoquM3CqAxxv2+XUj4s2sm0d3x05Vei5UndV5hD
	sr7y1A93Zw6N+/FHWwDZOufa5sIeV+HN0Jlrqa7/SeY7RF6xge4HJE47lcMiBsSA50ucmyhjuN7
	/JhxL/yEjPmdFybqsnjoiWwUjguKgnRhuKUH3TtsXMiii/Thr7/Hk3q3UYdrnc0BD9jZnORqJoU
	Ff7gpPJbia3WeXkQbOn3teM6BMlNYsQ9QusUk5dJz8zPdiTa0MYdj1LxEId1aO+CdNlSQ/3E+m4
	cPXEVlIIvB09UH72s3e/sk8TCDYogcEAq8A+x9ksjXVOf6P8nWXrX
X-Received: by 2002:a05:622a:4113:b0:4e0:3cdb:d1df with SMTP id d75a77b69052e-4e03cdbd513mr20512861cf.61.1759047906693;
        Sun, 28 Sep 2025 01:25:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4tHD6skIRR3PjbcrlwIurQ9DEwp1HfbyW5F+wYqRDoVlCeVHGTwgYk18z8akZBkWd0ey2Ew==
X-Received: by 2002:a05:622a:4113:b0:4e0:3cdb:d1df with SMTP id d75a77b69052e-4e03cdbd513mr20512631cf.61.1759047906284;
        Sun, 28 Sep 2025 01:25:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:25:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:48 +0300
Subject: [PATCH v2 3/9] drm/bridge: ite-it6263: handle unsupported
 InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-3-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
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
        Andy Yan <andy.yan@rock-chips.com>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1/mrVoFRRvpJKLVB9yIweMc38FlRgmbKvH5lbekmKJM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDTbRA2Db0kLZgBdJccCkRJyGWafvFK3UwlK
 Og2krTm2XmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw0wAKCRCLPIo+Aiko
 1XK6B/92TZdiTuBfCGlRC4tos6HVjULlKxbSlGenYR7KxEuZIHS4Dk0YnbH092fpCdLBVwu+HPU
 ujJ62abOk2Im0tkGhv2TcH17QXLGxsVHTeyqEaTyUrXZ6CY6h0NkastGwiYHf7g8QlADuFs1GxS
 lW1oQ+pI4hic2KPX/aJrg1zgAtNlypZ9RCJ68akVjorGwphcyKNLVN+zLiaMTr2sw721zRXl6Ds
 +du/mKltWJZ2dFgc9hP/NUj79ScuZN5JP25DmLz0AaFvVGCMmY3VVDSzl16zxQo/N0sdcQr0wd1
 8zhPxNihWZjFB9JMpn9yvj1d4yupQZF+el6CWN1CghvEARSl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: APpHyd1484UgBAuzKinZTX6ygY2mXXEH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyNSBTYWx0ZWRfXyRpaNt27TEgg
 dBSmYK5S465yTkPSTyyuMJ995fqh3B7nR+F/X0opXKZow2xBK9ls4TpcC0ex11vXYGvHlviD9jR
 r6BdalLs+5LFQ/NHrXrZiDdPbnDMZHfiEtES5xJ0sfOtLb9SiBgEB5F6pNrPX8o5q0blqdwUKLf
 5XEoaG4tEnMxDeH+7aW8dUv+FQNIRfjHkTo/xF83lG0N9RsbZkW4SmDEcAdKCk2tcrErj0GWQ71
 fJfrYQwpY05aydSZDJza+vnPeOmkQuu1HuVcLYArCqc77vQNNB5o8QDxsa45nwgbFRUrfOhFRnJ
 x0LamvC45ipAAlGTSLMNPImeSwFierKTlzOW6NDi0Qu/3yGx2EmmTdfM/q7EqaqmBXiBlM/bmJO
 TYP3L6tpDSCC7cHZc9euovzv1bUr/g==
X-Proofpoint-GUID: APpHyd1484UgBAuzKinZTX6ygY2mXXEH
X-Authority-Analysis: v=2.4 cv=dP6rWeZb c=1 sm=1 tr=0 ts=68d8f0ee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yMgUBx0mNp5KM1AuerMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_092530_390911_D7351D70 
X-CRM114-Status: GOOD (  17.26  )
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
index 2eb8fba7016cbf0dcb19aec4ca8849f1fffaa64c..cf3d76d748dde51e93b2b19cc2cbe023ca2629b8 100644
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
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, HDR support not enabled */
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


