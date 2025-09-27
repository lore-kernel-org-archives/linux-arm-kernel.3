Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20A5CAC5BC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 01:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAp39OMtIUlg6ggEgbLTpX/2Uyxk5maUiBvPyhN2y14=; b=XdRPIJ3pGlg3ZZvQeO/8abz3DV
	eUP5ylkC/8f1dRZpw561XlKJK0etXDxsyM5M+TmMGmzmIlWYjAskuZDkHDt3nAZDVSWtG+3OEUmnZ
	NQgNECsMJCWTzzoUH2/VVcaxBylx+MSAP0RLgqLaLUltxncw52dAwMPYE+PDNMdxgYT+yQXdsqAbt
	XcTU0+Tj1AlOS72NZaoy3ILW5wbMDvoPccU559iVqkylnBkEL26vQ5bUwbXtwY6K9VhuH/Lw790xp
	LSa9F8MpYlIPt53otpiWIVLG987qL+rMKtbtkPlAFZKmdAWCr6AvUGq2DojhQ08j3Ykl82zngiUgt
	r1inj1bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JNf-00000005tje-0QmP;
	Sat, 27 Sep 2025 01:05:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JNI-00000005tEs-2rQE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 01:05:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWpdW031876
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAp39OMtIUlg6ggEgbLTpX/2Uyxk5maUiBvPyhN2y14=; b=VJXreUEWNkUkbxEW
	gNTa3rc5Q7CTeCx3Aq8DCW61iUOKIqsBNZXCpS3MEpp1dGi/zwBqdBb5dQUximaz
	5JpKszi88v1jx9KJBibAug28ySUsa5uh0HhsW9mtfM6C/cxb3Oyg4CEzgEZ93Son
	lTi3wg/p3NCm7X60k3jBrMpnZ7Yg7+R9pCl4ssp4RvrIFTzt89vHr+NzOuL6Gtfe
	dAXqM/3K44sOKHDsEM9z8vEMSoCiExr0dXPzTg3tnChU+zoik/bL3Wce4FO5ZNQK
	xjcRGmXO2fpRAJy6HFEcRIdOAd0uTo+F/reFoWHLPlo/vyQh+zh3TA5n1pYXQJsu
	0jSE1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rmhb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:05:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de4fb840abso25084441cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 18:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935112; x=1759539912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAp39OMtIUlg6ggEgbLTpX/2Uyxk5maUiBvPyhN2y14=;
        b=kqZziiXpfmDWHa80VdhdkdS6tBg2yR9kUW64ZwTVUFjsoVmNzt5sPv09eSa+xIiSTf
         LF301S+DxrSdBzS91W/u5DBB8Df1/5ULG4amVUOPbVDcIXqLS9LOj+j0mm+0GgMzrT+k
         iEXwVKy27yvPfLhf+k5oS/Px6pr+rOXh8feXQAOZ8WpeQ0OqZEESaOjBGvD2XcrnWO0M
         Lve0hBhns1E5C0iU/PVxQr2erdxytLLeH/u37j937ZX7GMK1T8Ro+D2mIf9PgPDCcZ2f
         qqnGxjIaYU9/1tyuIompY/bo3K3BFeo4l1EzqA3nFeS/oJXJ0m2XY6Dm1bHX51PYuGDU
         ZGsA==
X-Forwarded-Encrypted: i=1; AJvYcCVJEgY1gAiiSyZRDmuf94sFfIvLQp1TbvoFEtkSvNsQyNFqS70PvEJB3cd4IFkyEJH4nJrnk+uYTeTxjTdOyA1B@lists.infradead.org
X-Gm-Message-State: AOJu0YwW5JCcnaex4cLYo8ZdZS26Ef7WCZbyF1Xwq+DjoN4S39X4OcND
	6Jd660E5cNUNV3Ka+GoFIg3EyvWASWBqx9Kh3w/Fq6uHkeXa7kkCkf4dXd5HZ6zx70wBM93nVyI
	nY9TdLApRLP3WLqn64tKl+BW4HwGOIimpiDRMYzLw3om6bwQT83LaClOiHJyt2y9llrC9KSUGsb
	B8nw==
X-Gm-Gg: ASbGncvwbepvs7W5BCinNqU8HyzhpDZJXbquGEuvdzRDgPoMa+VEN/e9UAbLuDb4c6c
	loyRAbtPeQBlb1xgqtGjPkCM2pX0hSzn9eTU/8K7Okt0TdOgb+UAtmtv0lKMQHC9smkhCVSxNtS
	XeDTCbLE3a8YoM+vz668FM6GuoPh5ycx34q2itgGQOqYkZ2dkUjuzdOff3cwrIWB2aIZM/S64CF
	qVFEW15Mya8jxclTm40630nwt/14CH08WJPTH0FNgj3U1YFFZoUYU6xJJtxb5BmGb4w91jD8hWc
	pzABUleXd/5adc8c6J2PSOKbc961Fqx7AqewCNo67SoAWpUd/q2T6YIbhaG1xf622o43/RV8wit
	tD+bTMk02zdP1fNFiC23vRo3nknH4hut5GQdtjVrvNtA+rv2SgS7K
X-Received: by 2002:a05:622a:164f:b0:4b4:95ec:c830 with SMTP id d75a77b69052e-4ded642c212mr20148181cf.42.1758935112284;
        Fri, 26 Sep 2025 18:05:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDCP6BId/iczHUn0V/ClnhswRFso/twuHTYrKNlDcNcH1xOXlUNtsKYlqWIiCEk6/tz5NBGQ==
X-Received: by 2002:a05:622a:164f:b0:4b4:95ec:c830 with SMTP id d75a77b69052e-4ded642c212mr20147801cf.42.1758935111756;
        Fri, 26 Sep 2025 18:05:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:05:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:38 +0300
Subject: [PATCH 9/9] drm/sun4i: hdmi: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-9-697511bd050b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3103;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9CNqOjlTFRCCeiBZ+szAQcQNElv7Yqy1Tew0H4Yo4CU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Z1C0UxHct0YeW9rVGvqo/s5dsq/C+fqclwuc3P1ASLR
 tOG+g+djMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhIUCIHQ89JLquMpq2R5rUP
 pSeJawi84tGYrTyvZ/16fZaXs4/rxs3Qe+qwzlvwotEPe+erErdqpzDGi/UqxwjNvt6jw7320ot
 J19Vy1KUSzG82FL3+Knwkv/CF8hKm3c3m2UyOsmHxGs/3VyeubNmkyBwadXC9rsXpbXGVFsz887
 qPXm0zy67jOr5rd3LmroviXxdoNJTmzf/9e8N/D43VmjxM+RPmrfi07pAZU6C0uJWZ9jM9lTsPd
 LN7Mr/+cZGf+S7h9b+MDyV+eZsvsW/zWOKx987W6XsVWN0eHO2OC0hoPh75xGv675dHf0bIKDAo
 X1nLZLx9U53A7//+S7zuirZX5R/tUH27u8293XN1meluAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d73850 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Uj443JZPoyhSIAxeSSAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: v7U-QqP_u6TnrgoCDYjjf7NiS6dida__
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX2xGDhXObP0Oi
 OIlQ0+LB8pd19KJHqthSqPP4fO8pebg/gEbjsK7+hAqo+RzCCTujZgwDjaaHMlvDcYjP1+XNqwX
 DpfH5+Fpy4Mh8wymyhtt+EupsYdCRaYGmG80wNbI1btHrfngFTyYpCsQhQJn+wRw2FJJSsEX8mc
 faU1POzm2qptpIntihFCUtKzwSynDgyNb90H1tdXcUdBS9wRC/ebqus3ZrjKwuMn7oLckIEX4GM
 8TX/KPx1hAzFhM3JnK8S9rR1dba57I6rmMVT/kmzMY4lvDppiFRnHTQrH/PIqu1dJk3HMpDTbXZ
 YVNXj6FWiDe5nfJ2aCkE5JuJa8CabndxcvJbRQUXEDbG1sxulc/1ASVlR9eKhBRiNRHYuUFCFtF
 lyj03fsWrxyumMxt57FAAios+2HYOw==
X-Proofpoint-GUID: v7U-QqP_u6TnrgoCDYjjf7NiS6dida__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_180520_777477_07FB58A2 
X-CRM114-Status: GOOD (  17.57  )
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
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 49 +++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index ab0938ba61f7d75dd0bec473807a04a20e1cffbd..219d826d535eb82328260c631e8b41f33a2f4c2f 100644
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
@@ -60,6 +57,45 @@ static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 
 }
 
+static int sun4i_hdmi_clear_infoframe(struct drm_connector *connector,
+				      enum hdmi_infoframe_type type)
+{
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
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
 static void sun4i_hdmi_disable(struct drm_encoder *encoder,
 			       struct drm_atomic_state *state)
 {
@@ -237,10 +273,11 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
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


