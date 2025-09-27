Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3EFCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 01:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ep6o8PRzDpDpN9BCPf153wSzeohtk9bx6s3tbhjl8dM=; b=nrrhjcOCrRrJ6dYTBg4rjZZJuy
	EHb3yyC/bAiyVQjlZJR9Q7Vc6H+btuKIsYD3YOw1GLLbKUy8TICbPjJZkxgvdDaaws+nK9fqM8w3I
	YcnssiMdyn8ptMlR8V7jFD0d4WHz5ekkcOShn6ys0OWu3NWKN/o7r5fYjy/BODA5ciKxnn0x2dNgt
	rZ3VkzkuOLrJyti5vpOaO37mM3wZwW9p5aK8W7EBnqKKYbUiodZwdGgOG8xJXBvQZzuz34EDm2n/z
	BIybc0dH+VecMv0ILwYfO2m8q8/bhm60g4Mg6Bvy4nH0LmHMsv/IJ8UyGUplruYk6nxzFdQDnE+1E
	f31WlcuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JNL-00000005tJl-2rX0;
	Sat, 27 Sep 2025 01:05:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JN8-00000005t1r-3XoX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 01:05:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX3oh016299
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ep6o8PRzDpDpN9BCPf153wSzeohtk9bx6s3tbhjl8dM=; b=UOTli0M4CsntoZrE
	7T1c1P0BhQ3Qki+HUpNz4BE2hfj8yF1BkmCLcVTjSWAXEHqhLuSRx3HwWjkhMrDh
	BtPqcZ8FF+/LyCWZdF1VUiaZnVfZ6zojoQD8ewIkLrTAOu5rMjNFvChKjxM0XN5h
	N6g36shxoOSY3S4x4TtW7e/OSp9M1EDkD84rkuRhY1PDPSMCkrymnxt8pUnS+F3H
	31QMFsC9TnCD7cQexdfzx9Jjh4m4E/nyPb8UvuJqpKERZgGbD19aMh1M7GKv4gtv
	CzDyQ1n0bRCxaz32uZYXYv/yVxdY1Q8Khfuu1AXGqFm6i/xee8Z6+u5E649uR32m
	0l08lg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u4h63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:05:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5f31ef7dfso71829081cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 18:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935108; x=1759539908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ep6o8PRzDpDpN9BCPf153wSzeohtk9bx6s3tbhjl8dM=;
        b=Uam+wWtYwp41ibgOtU9ePDHXy8N8EhxVogIlVgKlxPO/ubHk+angO5kYd8OcUFtLme
         SpNV2guchDbEJkB3lsX4x7nhffQb7wG2BFlrUzhwx0GLwH8bfZJFxgaiXFr4tfAiL6fm
         ylg6HdSL1qnRxY0kSjOLAySI9IDrhEXDtfzYbmrlYXsrQA2k3uogrk/HvKW1yXRJQCHW
         b+c4NsOnc+OP57kAIXhjnnXMaBQN21ITRYCoOSW5lEH6YxykwhIauQSLzNCOsoT5tBdw
         Z0yc1/4Zq1Hlfrnslq/txENR+51aGcuuzWg0VuxCRCVUmtSS0Xh8sfudsX4ao/49sxOC
         yZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCXdfTRbvtvxlaDoa9zAznOG02QWeXFPRoE2hAQ+Do4IGX1lcRHt2F6YA3LDRyObKi1TjNn/OOMNbuRwtIOaKlSR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz013GwfJj3QPEFGa+zyHUNRtC4EmfobJ6bEzLKYFu+zz9H6EPx
	XUTGgo5llTmYCoTlkbj2ZoeMsIrXZWORPIZkOhVROf5U/k3vjvguquE1NTQu3Dm4h6MkHIFK2Zc
	f/wRyKMTV5Ddg7vQXtKB5aezdAF4+HVAQaQFTLeIgOhj5gOLLo/qb09w5KFel76wYpVOeSf6OT0
	Qf9A==
X-Gm-Gg: ASbGncuCKMqMKRfNXQqdS8StnBUpuQUhHmxXXbW/2y+usam0ETRSLKi91e4vNC5wSVT
	gTgvrVIoBWdPIbiSdyXbRfMFlx3ohtrkC7/rtNNHq5YlhOcVxjKfUbwABtXnOtwnrWeQTnlUwVT
	Pe++qMKYYVjSHDNUuwZjwuH46TKxoPf3489IT77hUKdehzEgFoPRRFHeHsOlvbeKAZSKruE92Q+
	vwBQpwjeptCmOieJu7iRezdPKCMrIHugIZvFuYJWmp3zSS/cHpeZNtK8uhI3xJvoD3FFK236ZCq
	NOEhXvu0IxlsTHMKNZXbFBaSNWy5zXSZ5Y/Vw86K6Qc9wybZqGup41T7RqdsnzjrW7pJ/KzQm9n
	0HfLEITiqLbKR531LqdzyMnh7lukaXBWmtP5mL6mHUIA3fT9VIYW4
X-Received: by 2002:a05:622a:4d4a:b0:4d1:6bc9:8794 with SMTP id d75a77b69052e-4dacc7b3838mr95542691cf.23.1758935108396;
        Fri, 26 Sep 2025 18:05:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4GFghpOB7X5hfVz4Kb96HCFDTN4uTdC0uUTICAAv034gi7/1wnQGm5inpTe2Y4vlchBVykw==
X-Received: by 2002:a05:622a:4d4a:b0:4d1:6bc9:8794 with SMTP id d75a77b69052e-4dacc7b3838mr95542331cf.23.1758935107900;
        Fri, 26 Sep 2025 18:05:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:05:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:37 +0300
Subject: [PATCH 8/9] drm/rockchip: inno-hdmi: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-8-697511bd050b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3126;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Lc2tTQYfaN7zqRa7FcjPg44+fL+8LeTUVnX4T4zpQNQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Z1C0V9TUOdBzd53hj9kTaa8f96WMDi9NcP7Le/9/e9w
 poYpaLdyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJbHvMwTBN/K/sz53FzjMm
 MaXGnrPvubO9r9f2X2Tc6j3Fmps9nohc3VX4Zf6GuQmaUWWzpZ3lTKZs+n3FK7zAeVJm3wMOY/1
 rPBwCa3oSOJXPxC8+dHRdnPrRWmm3iKTQUtnMPAUT1ZBZaxhZP8R9V2F+wbjaZq30LqHTyoL7M5
 NOyNas8f/mJhH9aAWvf/Img/NfVvt7MrnL7L6yOLfZ8tsKV4uiyVNiWU+eWS/NsEGiPv3Einxex
 doLLRL3Np4qkPCtved913RyeuiNj3a+U63nyChLF0rlTHQ8sF4x/eyBnEQ2tZV9tVcOXT1uwa4X
 MaXv7hO5IFG17R5X1zVqWsnuZ/+mwBJ7wSN9ldbKg+31AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 1FI3dCGLWLLPvXqYSJx7LeekTU0Hc0ra
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d73845 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Uj443JZPoyhSIAxeSSAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX1IMfnTwVYSYs
 m+BkcQ0GGkkoOprxXgz48QrA/a8vLvR1S/AS1UcH6NqkAnWG1w/sRnTTWuC/ACnWnFlb0/MAgxf
 Oi95vzDRtAEJ5IRE1vsxnbBpsiP86ni6ZeoDppfWqARgNoysFSO0QcBE08tGjbi825J2Hi0ZIbe
 O/qtjj9a4RKuRUACKC0kCyco0cLUCdJHCppR88PgPdFQQ/MmscbFvWosL9oOQyh224HKNniQVw2
 gpZLdIMh5Pve6uUVlg1nYVkPXwhKhVgNGvHTPUJDc4vMy3UTn3ohFzSwIYYL3la2riM8iFVFcJb
 ZgMv/IxE5KmwHr427XPdIog6vxFV1VzNTu9BPrSq8eeiISgy9FEOGtAdoB6dLRm+H0oG0pADhcd
 uSyTxJNDcTU9K8gDebf0r3IIlunyRA==
X-Proofpoint-ORIG-GUID: 1FI3dCGLWLLPvXqYSJx7LeekTU0Hc0ra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_180511_062528_FCB94643 
X-CRM114-Status: GOOD (  18.12  )
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

Make write_hdmi_infoframe() and clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 46 +++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index f24827dc1421cf5e0c1be63a80da23d645cf3f24..dc2d68b9c87f7ae7b06ecbeaebc82b9689c1abfd 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -641,11 +641,8 @@ static int inno_hdmi_disable_frame(struct drm_connector *connector,
 {
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
 
@@ -659,11 +656,8 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	inno_hdmi_disable_frame(connector, type);
 
@@ -673,6 +667,36 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	return 0;
 }
 
+static int inno_hdmi_connector_atomic_check(struct drm_connector *connector,
+					    struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	int ret;
+
+	ret = drm_atomic_helper_connector_hdmi_check(connector, state);
+	if (ret)
+		return ret;
+
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs inno_hdmi_hdmi_connector_funcs = {
 	.clear_infoframe	= inno_hdmi_disable_frame,
 	.write_infoframe	= inno_hdmi_upload_frame,
@@ -1029,7 +1053,7 @@ static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
 };
 
 static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
-	.atomic_check = drm_atomic_helper_connector_hdmi_check,
+	.atomic_check = inno_hdmi_connector_atomic_check,
 	.get_modes = inno_hdmi_connector_get_modes,
 	.mode_valid = inno_hdmi_connector_mode_valid,
 };

-- 
2.47.3


