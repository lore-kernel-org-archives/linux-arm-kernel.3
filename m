Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1BFCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 08:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7oVTmK4jTegfS2LDYKFs2TDqZVMBs8llu7PGEMrxt8=; b=PiDQsaOmR12y6p2KP6pSIqIFbR
	iIwHCictiVFkS6OTwChiYw8aXBJdvubDgm5XrcwGjGVuYrTw7oSvIqkGix/+L4xZGaRlbs5fqp0CY
	eSr4qly+HuLOF0sjwx7h29sb2Xg99NGDWez4EOu/tBcOxwip81u+yppQd5DoUmorosTwlcA6IObzg
	jOVJW+RksDdM2LXxqIi7lO51U86HLQMxjGvjfLOKe9PI0UIeePphMU6i/zsfhXZsuuLggGFpulcgB
	VT9i0ExfoIPJfTxd7HaXXfrN5GPWVWnAQ+dkhhpdMAh51Ub/a1AZuPB4//Arcz+PKMALPa7T4zOPf
	+BBhgDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mj0-0000000EJuO-0E3c;
	Sun, 28 Sep 2025 08:25:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mij-0000000EJZA-0cF3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 08:25:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S5vICg028600
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z7oVTmK4jTegfS2LDYKFs2TDqZVMBs8llu7PGEMrxt8=; b=cxLU/nZVz5UWUibq
	ZG6VxhOTPNQsP2gAAYed3eAS3hPx2zdPmA6z+TP6CLhhgfpJcHe+qqgkbqAF/nF3
	GwyISE9aK7iqgyqPUeY5UTYNjsJlJF8BexHyQuGXwza/gNhtEwA4ub+t5dXwbb2K
	gWvAQhohtLv8z3vJ3XP2x+rk6DpUgEXK/b+XEVrzMycX/9iaahbZ8o2D69HB4vpK
	Y07PU4GSBFOXfMNkp+0W6zS5GkL3afys9aF//BG7eZp15nT/oTluCwaKbtBkqH63
	JPrAg2rMw+NcKCx8GgF+B5Xru08K/QkuwMVwfiL/h/wnt/8QE8FgFgh3afcSxOVL
	/FPurQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tjcwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:25:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d8b8c3591fso104286281cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 01:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047923; x=1759652723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7oVTmK4jTegfS2LDYKFs2TDqZVMBs8llu7PGEMrxt8=;
        b=vuKbOC58PyACvQ2UdQHwL1b0Fu6w0TPLPTTTnCD6dy9L0volJzVjLaY/475qaO4tKk
         Y4JDOFSjrq83m9m544LIZzWmvKKpiD/RhyLE3CQMtIPJsiPI5vdruoMfzB+6fJQVqA85
         I05bdpfC//f15yYAxEt8mtCGu7Fx9cmRqd6F/RMjFfTV9eHtaCsks+Fn9u+TZN+QoJJQ
         L7mb2038gK5yYL3CywDv8htAU530oYg+PnQjjhmYm9vEnbICSakQtQdZoGlsx/C6qWpJ
         XQ9TTwq3G/LPcBOyWljh8kQxa7SuuzuND6fx89ncu1hQ03+ZEBL1FW9aLv8drAzATqpd
         Ogeg==
X-Forwarded-Encrypted: i=1; AJvYcCV7dQA8Upf+MXVtuEufNZOFusH0Yn6+bJsxL+u2UCBiE0RN8U5UyPAM5DFz0GpBjzfwzWbBAMtYs96/yCq5xIMg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+MuFmmgaJvRtqKRwFj3nuBIr1Nbd3ypcUP1I+FsAKNr2O7nDY
	1o7vAKeeq7utNU6PAfs9/lHtwKmYL2PjODBLrPFrvD/iDcfaINKuzhP3II56nxlbsQS56e88Keo
	PvGrOk+BoLKXj5c9X8sPNEKoe/9hWvVFayn+3kp2KzBB22AH8Rr3HEBNCl7YcBJfsPmcONKFO/p
	8eiQ==
X-Gm-Gg: ASbGncsuH/TyLEr0FyNw5Gys9X9XPVtYGusQsKzyJn2UOXJYNv82Eu48kxKDq5CFmk2
	XKAPvE+DeNhxnHSeb8EvEoQYwGyg3IPVZcVhbmk0acxvTxzQTEQ7SqbaA7G2kwlj1U67TxcvsrO
	MwzWmghs2gHwDEGHy/8BDqOxCEMdbwXnZPNiu8xoOPxOKP8jR9T9DAnjE3McOKkapt6tdxtRFuA
	ySWmp8ItMYQPcqIG/cYjvDyBPo3maPVChBAGW7U5Yw9Zvpu6aXQ7Pt/gX4Uwf9+w4JJdXcNpXDV
	cuDGaYCTXInGrbjN5AvYIeyOV1tsbMuhsuYfRh+YGgaPFs5v4u/XxxQouwqzDi70iH9QOw4P65j
	V1qaOkeqktYnYXHqn5Ej1DdT2W/zW8K796EXpYFs6fAV6WydxJej5
X-Received: by 2002:a05:622a:1451:b0:4dd:e207:fe2 with SMTP id d75a77b69052e-4dde2165a57mr93280851cf.41.1759047923231;
        Sun, 28 Sep 2025 01:25:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEESn7rJMVdvgKDwuqV4pofk8SCks7ZTpp/nKrxlhNer6Wcz1kuf5zkj5btieQDBdmwJ29uJQ==
X-Received: by 2002:a05:622a:1451:b0:4dd:e207:fe2 with SMTP id d75a77b69052e-4dde2165a57mr93280551cf.41.1759047922745;
        Sun, 28 Sep 2025 01:25:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:25:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:54 +0300
Subject: [PATCH v2 9/9] drm/sun4i: hdmi: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-9-6f8f5fd04214@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3167;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SNmzbnw2SRpSDuHUMU89vGrNBx2CzM0VUWkNV9VkozY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDUVHPts4iT9DO40TpNVuDbiJgKbp9tiaTF5
 1h5ic+PbuaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1X1PB/94ehTdKMPnfDOQqb5MoKaN8Ah7FgUWp1xokcVcE+txfW6tC2jaIjwYYAAMg3MJu5MKqOd
 4PWONxLpvDmWFuvW0awSN19CswKo4/ryi42gY9MMgRQVUs1fvs0lmIjNQQmMh/GtJGpWRmGFZ1Z
 pFUgZysdcpoJqNHMmpRuPnDgdLsPdkrHk1iSNAdtKMHFHrPWMg4EQBxyTtppsBsV+NDtUojhffi
 xOI8LZwI15c1n9YOqXYsq8iXY8BHtBBCR74y/paTdp5/44jEoUPkdBhMZsbD2jB5l/oT7LqHFXS
 sXRyBWKd0da84pm5V/dCUkLlQgTe+nmOwJ0AI1Mec36mivUm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX175iV33zO1J6
 DZN4sbH8AfB4O/5E8johIcQlMmXArTh7bKMZCgpM8np/mnfIlgav7AYOP6lySHCYd2gtFraiAZN
 uKR+tIJPZu1e0wRRtAi4bW5Yz2Uji+FcRa4wzLWQEMhqIiild9frVudFgHMsde1yJnIMPfRnrT0
 R/Zn6baNGmaEQ+zA3XN0jxTMH3HDtJZpC3KrtX/0owvRKEtsosFm/zGAYmraptVv9dK0RV3++dP
 53s6ZCwrT/jNlsLqrMVqUIDyzRsY4ila8p0RTixvV9pEpHT+r4jblpT4ZcTciwfLpV8Z1dcUyV8
 ySj5XQBerExZR8m68tdnMyDN5HdHphuFfb64z+86kU1SXAGSwmpt0sB8fAg+6Y5MJSIQ3llxeK1
 s9aIeORCpeQww3ewChmJJKForWxTDA==
X-Proofpoint-GUID: XUBIoSbjOEwjiQY-Xv_D1PzR09jR25d_
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68d8f0f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Uj443JZPoyhSIAxeSSAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: XUBIoSbjOEwjiQY-Xv_D1PzR09jR25d_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_012525_307011_A275BC16 
X-CRM114-Status: GOOD (  19.52  )
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
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 51 ++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index ab0938ba61f7d75dd0bec473807a04a20e1cffbd..6d41207548386c0ae14ba0a9b7553fe0d3bd001c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -47,11 +47,8 @@ static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
 	int i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	for (i = 0; i < len; i++)
 		writeb(buffer[i], hdmi->base + SUN4I_HDMI_AVI_INFOFRAME_REG(i));
@@ -60,6 +57,47 @@ static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 
 }
 
+static int sun4i_hdmi_clear_infoframe(struct drm_connector *connector,
+				      enum hdmi_infoframe_type type)
+{
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
+
+	// XXX: is there a way to actually disable the infoframe?
+
+	return 0;
+}
+
+static int sun4i_hdmi_atomic_check(struct drm_connector *connector,
+				   struct drm_atomic_state *state)
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
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static void sun4i_hdmi_disable(struct drm_encoder *encoder,
 			       struct drm_atomic_state *state)
 {
@@ -237,10 +275,11 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
 	.write_infoframe	= sun4i_hdmi_write_infoframe,
+	.clear_infoframe	= sun4i_hdmi_clear_infoframe,
 };
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
-	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
+	.atomic_check	= sun4i_hdmi_atomic_check,
 	.mode_valid	= drm_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };

-- 
2.47.3


