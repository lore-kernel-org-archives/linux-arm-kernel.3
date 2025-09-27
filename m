Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF5DCAC5BC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 01:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1ReRpPqrVzS8dYBiuFlXpsNAUSjSC7vdxG38yy4lOA=; b=lZPU8890FP1dBEZNkbgAGJdiZD
	e/2Z40KiEAIyti4G+yH+Opp+qlQXDOI5eG6tCXVZUqvdiZLPmp5+xbbgwSgUSngFwxVvxu8aydo7H
	b8WQeEEXQ9b+582ght/7384JQKR2g5ebjefTZ6kZDMnjwFE2sDVJvIf1OWD6u1YUNYf9NST58IhyC
	FfjrtdLeuqW1nuQYoc4l4JRLP1ZWjRno+1PHQPHWvFLh2FtxhbUfSD2Rlh4IX+EV8MvEMZ4tSWmvr
	QJ4RCXuxiNFxjVSKH9UFRlNQW+ap1SH5hCROsflFlE1yjp+Wii2ByXacvPYkEy0WwT+s0LcDd5+uH
	dQYo/7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JNP-00000005tOi-49Nq;
	Sat, 27 Sep 2025 01:05:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JNC-00000005t6O-1T7i
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 01:05:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58R0j2hH015847
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1ReRpPqrVzS8dYBiuFlXpsNAUSjSC7vdxG38yy4lOA=; b=QDi2iJBmOAe289bu
	ESavkYGg/aib9Lmi4hEjsKBuz55srjSA/nH+EQWD/o0RpTB4LmHnG+WlT2dECr2c
	7e3Q+8YlCBiZV8X8OFeXh9WeAB8nSENYypTIHGecs/5uNAYH+wJktkJuNz0cAiZ3
	uxtn8HfWJ4d13s8O/1/qw0X2IkKnFpu5ip0PgspkD8Q4wkAjrupE2l4jmk2QeAkE
	7xz3t4E8QQ+8nPaProcefTjG37VaYQSO1Yr4yoiytjvECdW7ztDMm/SO5IrAi74X
	JJbTzGOaBYsbyG7D0YuiqahtW3ZRIkwsyPJdTlQq1p0jUSVJcvIjQeX7HZXOi1Yv
	J6zJ5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mcg0uc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:05:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de2c597a6eso35836721cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 18:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935104; x=1759539904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1ReRpPqrVzS8dYBiuFlXpsNAUSjSC7vdxG38yy4lOA=;
        b=LyKM1RVyBqKnrQu6XMPaepCxdESShoz/+8zN0BC0aein2zsmSNt2FmgkJWEcf7fNE/
         FU+BrWceVV5lrUmDzwliFPUb9eNQcevhm1TAFRYJUKcJlhVDey+em18PgfzU0usXEUOK
         OtNg45GkqaGdY4Tewwg+7xmJVYnGWRc5+fMLEiQ7h9qkMjcO+UFNJtCBkyrnwsPn0gpd
         pbohYrbWaS1sA3iX/UlkAcMgDk8orkWVCtYiH+YX59McouvsafX24L8txGzfD5oZRvtp
         l9XfIhg4bQ9P5b35z70AEFoDjdPgvyLzV3XbLohS4TzT2stQkKHLJAs3rgTLCUIX70c/
         CPog==
X-Forwarded-Encrypted: i=1; AJvYcCV6zzapBD6QABcD9bnK2eSUFfWxBdxKVJ2Um6UYO/vsRxY+lS2F6BfbUS9MV6Kh7kzKlf4flbQlP26pjf0jCBQv@lists.infradead.org
X-Gm-Message-State: AOJu0YyUaFIgyqt34B51nOcsRa11HoXrx7JtpA362hQRXhv8+TS+euUy
	bV8aFvV8Quw9iK4IFSu79gfZPO+bZ3owHLwVpw2mMGsI4UyRvi0vnWo3/UCI8ohWxIRgZ898+wu
	vvzza/4WLxbZo0bR2IWfkNMp3/BUApVbvr+WeqhIZ5wzfWDa0coIgXQObiRxczOAsU3zeM9gHig
	T7+g==
X-Gm-Gg: ASbGncsGLLRhr+QkwpTEqgc1M1KqZ8GU+lYRFDiNIKQ6vWvbJKMeg8I/AV+5x2MU2EP
	B/2854pnRHjeZCaVwG5KVcmYwP7XVsuV+iN8jBkXcGMz4Aq+6QqCYJJbh3H20iUabR+TnCV7Ftw
	QrEUZSYC8iRqU0MIgrr/eJ8HTjW4jDP/BBZ/neEpOQitqOmWrUn+ahJvlNiziHoNRHYtWxTYQ3e
	rs0T4LpkJENgkbB7JP+gCkwzxGZrY5wJxwBqBBwjZGpPBy58wf6E31ki72/zl8vfhjiO9gMi0Tx
	Qw245uqm/9hxc5bWjjYPueItGn5/yhqkYNhwdCfyyUZJfTSAoI1NU9vo9W9KNH66EHiVVycCqLu
	0telmYz5B5pauPqWC+LPtNxdmTxtLF3Aes6M9C13qL08/qcDJM0p7
X-Received: by 2002:ac8:5852:0:b0:4b7:9743:6da6 with SMTP id d75a77b69052e-4da4d02b61bmr114903991cf.70.1758935104446;
        Fri, 26 Sep 2025 18:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwTmhqnyjZFBwp/HsFiMEBnuWPK9YLUS4DPznVcdyQv+I6YogfCDp6AQn+3SRx+7bfeXBXfA==
X-Received: by 2002:ac8:5852:0:b0:4b7:9743:6da6 with SMTP id d75a77b69052e-4da4d02b61bmr114903571cf.70.1758935103968;
        Fri, 26 Sep 2025 18:05:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:05:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:36 +0300
Subject: [PATCH 7/9] drm/rockchip: rk3066_hdmi: handle unsupported
 InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-7-697511bd050b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2953;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SRdsHNR0LO/SljNP2tmHd0np6D3Jw2olFDYhbWhBuVw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zgg5I6HgovfGNCnJrr9DZzOmlvr89IG2N7Im
 J1IzAHqkSqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1QseB/91TXFBZi0pEpfz77geu/ZrsROvcW7gOnMXI7ySzBuNlQ0kbfHKfrR1hUQKrPiz+7O3Jyt
 NG+3ogi0SSqQIhJWGu8FsrNLkhtixlNgVerOl1ZDM2aZ+xSH870nIvmmE1uPJey1/Za9yRjxka1
 kIELmhbciVh07+E4ejIJiDgMU/A1ybNMwnRww/7ZFXo5VNDJ4bE6RrOn9IdGr79W/444T+7Whog
 LSCWgGHlVq4g2bQ9RmPH0uGaOYeFpNQu57k5KoEvnqJv1jFMj7p/dAs8EyfS3UCh6z6w+UvR3Lc
 oq2InUo+uryQ5zZYarcxA8FBAO5BnW4QIvwhKBX0jSUfxpty
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68d73849 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3TrzcbQc_ont8wEUj9N1bbtwhakUkyaR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfX3A8IzpOiMLCq
 9EpSRN5ECD/HGpO+vzz06/vyLIH9fOM81qSjyF3jq1WbWPEyir9BUHaxVF7biZzEkJBsHW89AzN
 ybaU2vF+A8Am2GW8180XVnR6KkqhfF1Dtfpk/wxEmQHkYA1PPlgderb8nTNSe2fnUnMx7+g5NKz
 uazKiZjrrJ53ZzNzHcYP3l+Rz6nkgQ4CBKMsQcNpugNhNqM1kzUwmw156B3O5NBkhNTuvFmikiS
 ZOP9MFN15UwN+fZTOuDzt7Eah0m5QI02E1HApNQJqvFKx5KK1fR2l0mvQ9ks8cG3lTP7ZCoLrn6
 TnPr6qpW1T9AAthD7Yzd4Bty/cbuv+6mFwvQc/99q4dZXZkezcmQ9CJB1989S6497nAKQK8mDDN
 bm5Pu8hwECdd5MGDjiIqeh1SvIwoWw==
X-Proofpoint-GUID: 3TrzcbQc_ont8wEUj9N1bbtwhakUkyaR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_180516_554998_D5AB769E 
X-CRM114-Status: GOOD (  16.83  )
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
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 38 +++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a93a49f87df7604752f6b651c839c..cbae27e2443798d62bd83acc8b979cfc34df3544 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -162,10 +162,8 @@ static int rk3066_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 {
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	hdmi_writeb(hdmi, HDMI_CP_BUF_INDEX, HDMI_INFOFRAME_AVI);
 
@@ -180,10 +178,8 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	rk3066_hdmi_bridge_clear_infoframe(bridge, type);
 
@@ -193,6 +189,31 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int
+rk3066_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+				struct drm_bridge_state *bridge_state,
+				struct drm_crtc_state *crtc_state,
+				struct drm_connector_state *conn_state)
+{
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
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
 static int rk3066_hdmi_config_video_timing(struct rk3066_hdmi *hdmi,
 					   struct drm_display_mode *mode)
 {
@@ -485,6 +506,7 @@ rk3066_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs rk3066_hdmi_bridge_funcs = {
+	.atomic_check = rk3066_hdmi_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3


