Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9F3CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 01:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=; b=4sJ7RONoakUF74fwLsIa9BFryX
	44xELPE+PP8rQwS43Kyy3e8DEGv+Mt7U5mXKs06recqpLF+Rvv+WWOp1CQD9CTIjSn6IWvlXEesKt
	GXa9WGvivwnJQV28K8VqPuDu+fY9GmocKoj566a2AnCffA7EIatt+5hJl802Q8zo/rFX93vz70/h6
	a/tLXyewGew34fu/fgrR38W2c2yKf1l7KIJBFiGe4Qgpiil9cHyEJ8rnZC/4pBLwkfVQz0Wg72ZSS
	hpr9AVnryIC7Mq4zmdbPp16iG9ujGgDrBTQqtKy32Bnwyf0/NrhGvIOlJASXcl6Y0zdvaTtwTXDY/
	ElssSW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JN0-00000005sov-09s0;
	Sat, 27 Sep 2025 01:05:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JMu-00000005sf4-1C5H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 01:04:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX0X0032033
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=; b=gZoYnt7hLaHJQoqC
	JzECZ9VqglR5tUGGs4UytufnXaEFhcqEIOVgGTs6aK/wVfcTVheCoRVFKMt1Geja
	pCYDwBoVZyNB/MTNWPvGz/JtmJtccddO1DRD4GHyZc3fihkOr3V92U37E8AwS8/V
	pREkBaIAeavpXJuywT1ToGIBhgkw6dNqB57uX3xS8QulE/hETBH5gRJNgOU2HV4C
	9qEBY0P8djpgRXoi8ZjNMXAtP+egDkzAcKHd2dzh8gITc+SEQL1bvZ+muizjnf1Y
	bj1ZCsEGwSy74lxYjUj7FW66XN496M6l4Qf06WrdPR6A7mca74UYrZDzl26JfLzh
	Ld8nkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rmh91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:04:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dbd8484abbso33383841cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 18:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935094; x=1759539894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=;
        b=XosO9GUM0hBahDMKrvrgt7BDkV1+FAl8Qo1/aBTR7oJqFQsQeXFqaGgO2MfQgHEPhK
         ACUpQPs76QXjElUnsx80LKUAjB8jjqxdyGFTzSoZATyuKT44o7UFFtfTTncIlhLYSTnR
         w8orWgc3MqkdM0CjIi5NuW91Vol6Q4k26E1ZS9BywBHIYepwHCej/O75KMITopGtBt0u
         kaZa32Ca2Ua4JU3/JmK3rCzH0lDSnWcgL7nhw7SByAFVuqtoHsAUP7iwwoMAZDmpBnxF
         JfUbYQY4YNufcoZLE/Lc0XqkNW//3AbkJX+ipyb/yikdsGTUBEyw04k9YQfNPcezhF5g
         p3/A==
X-Forwarded-Encrypted: i=1; AJvYcCXxCx0DX850vq9QZdVBtLn7FNDW15tsMBrEX62kDHIIZJ5VYmbtb71/rJY4Uh7O36M7CAIihwkYPULS/7KuD4tY@lists.infradead.org
X-Gm-Message-State: AOJu0YzozQXTh50aSFonfjfV6BVoEikgfIrXaITTepSsXZ/TRgogVlBN
	bTFQdYInYi08szlqd2qkl7WGDu6pbnrih9xiI0FhA2DqHGJmAWcsanNelhk8+KI8gFEWTOAHfxa
	xEtLc+yCFi4jCa059f4Ig/5XAw/5KRnR/r8SZ9F24lmypXf0HN2Hdj5DQ8ApQfNrZu+6PJc4T8V
	bEFg==
X-Gm-Gg: ASbGncuO8xDi0Syfza8E0oPW75sV7dlgI6en5e1HeLCo9WRVr5P4XtPo+RQPIhUN9Xn
	zjlM+LE3wpfVUbcuXq2s2hhSjs4mpssbs+J46eD6Uu1N5N8iS88rX/cc4xdEwTsVZ1wd/7Lpfiu
	pKbwS9VL+YzbFlCVgT9rT2tGpqZ20ue0B405js+TzwsTy39cQC0+XWKHpWfNmYMcFrZKwuxbrRc
	TP1ZSal/deib+auotIngxeBjHJD7fBEhTOz+4QQ6AQhVw37aS8hCWZCZX2ekklCsvCKYT4190YW
	8VkNh6pHCucHf5nYwSxNUXn5peX7jie2lJuzhWb4ny3/QQzQsKB8wipkcrcrfKqjznm2pRgmhPa
	EASUFcuhMuOMjELzpduuGznn9x7nXR30hvRlZfIwievE/QGFuDCWp
X-Received: by 2002:ac8:6f0c:0:b0:4b7:964d:a473 with SMTP id d75a77b69052e-4da4b142f90mr128891601cf.52.1758935094020;
        Fri, 26 Sep 2025 18:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCRYZFPLybi3qgiEc4tJcxO1VyFYbxX33ezwhqjsW3+EcQSWcPI5GdH+++nldPjNtBnOGTzw==
X-Received: by 2002:ac8:6f0c:0:b0:4b7:964d:a473 with SMTP id d75a77b69052e-4da4b142f90mr128891121cf.52.1758935093547;
        Fri, 26 Sep 2025 18:04:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:33 +0300
Subject: [PATCH 4/9] drm/bridge: lontium-lt9611: handle unsupported
 InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-4-697511bd050b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vK8TFXgm/6X3TSi0UvfKUVov+3NPXXiYH1OJryZTxNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zggUzK2RvlXjuBJ58sQp0MZK2qxX9MXwdZgz
 Jxz9w/I116JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1cOFB/4pMZYQgMm5haHVkWCLHoQ9SVONscRZipQty6kqJqyPqWCaV98QNX91eGvhLm45TmM66lW
 UMSazUEX/mcxotqCXzoNpmP8i7D7KtpC1vBVvSDWSgqVuEq1fV1mluRLvnNgiqkwrWc7qQDjVUQ
 bdhwPL5nXbF7LBtbDCZZptQZ6/tJdk3JGtKzlP8oniHvtNyoRiLPZSTuhxFMrVZAgPMHJktdfrz
 j0o9skVk6q910jOxpvy5ZrEXRcgtdZmdXW1d2vY2BUUrt7dTu6TFmybylrGkVpD9i7KJuu/q8YJ
 LD/SCriTfziUQ7jdmHCgSyj7zlO/IZIBF6loTp1XcETV+Ejc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d73837 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: KJ3tlc2OTn-lnzgCMAODf6jEbKxB8Ivn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXwfaUD3AbXYPp
 yNn+1d+zeoQ+YndYMLdIIZkawmWTkmHbK1sTKDTt6ep41Z96jYJmxZ0yipu6cyQkoJWcxdKQgPx
 TScErMX+1YX76YSx+Y32B9oZQL12RQZYhdz8g12RwEaQ2ErHUFvsY5wGAI0VPe+VNdWGq3Y83JV
 MGkGFQ2qvur4hrSwaJyi0X4O5gjriJ/t4Y67WbAf0UDucpb4QYMLTf71ywh1xfGng4T875IkSrb
 vqfk7zgeRVfiWjV7S/qzEox2LGD1gnUa/OtRRg7pdX3pLq+F5wFdVcKyPrkphMlF8RyWL5BI2Th
 YvBw4tcEYNtLBhPu3VAVdbClh3Bf3xh4q1qVGS17eETyy4gUDJKfO8Jr2TZ4WcTwxDMofv0m9JS
 b7tAFiit0vstO/aEPTTLfzO6dDr4HQ==
X-Proofpoint-GUID: KJ3tlc2OTn-lnzgCMAODf6jEbKxB8Ivn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_180456_363378_41EA4AB2 
X-CRM114-Status: GOOD (  15.65  )
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
 drivers/gpu/drm/bridge/lontium-lt9611.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..9c2c9887d2d66968eb1d50544a257d5999bbdded 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -869,9 +869,7 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask)
@@ -910,9 +908,7 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask) {
@@ -925,6 +921,19 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int lt9611_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static enum drm_mode_status
 lt9611_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 				 const struct drm_display_mode *mode,
@@ -993,6 +1002,7 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.edid_read = lt9611_bridge_edid_read,
 	.hpd_enable = lt9611_bridge_hpd_enable,
 
+	.atomic_check = lt9611_bridge_atomic_check,
 	.atomic_pre_enable = lt9611_bridge_atomic_pre_enable,
 	.atomic_enable = lt9611_bridge_atomic_enable,
 	.atomic_disable = lt9611_bridge_atomic_disable,

-- 
2.47.3


