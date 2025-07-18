Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7BDC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=; b=qr2hz6WaRwOEDxQXaXIWWGUv9i
	Yod5bEOCaUB5bKvjTQWGD9Ozrj9+3akp7ZZ+YR5YvYhJsqF7U5Qxs3ue/35DfPVFeE7ERCsXXaBR2
	NVffZ7wpp6e5ghCUoVn67CmPnvGgfAYb8Nhjf1FTXtHnBpzjD+BObXxtPGfROJVNbHHOiSNWpVQXU
	Q6Ra2nmXMkYA7Ty2cuc84Meewq+OrR9KtrOvN4ZuadTH6BbnZMXw4Laz0nbh7ZC3JEQT+I/TrnZtk
	DAl0uKolL8MQx+N0zSSn4NJXVkxVOXvqU2ISI9O9smcxis7Nc3tM87JwKqkp1CPwHLy+kmQaAZ8Fg
	TkxNaRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucn3G-0000000CxBr-2n0f;
	Fri, 18 Jul 2025 15:31:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmu6-0000000CvHy-3qH2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:21:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IEcZR7030518
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 15:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=; b=VrDSLmWS/fBuwTcb
	05J7LPH6Cz+belbs7qtt/Lx0NORZ1V/C/d6EAFXc1vIrQRBz0uFlwCeytXmlnP9x
	nxPjxBa/heOJFz4DAnvUC1JNx2OX7A9qoDlcg1RO1fnmfc/dFmBmSCfbN71NI/Gc
	Qc4LEolwTW/yIXHvha4V5MQO8v1TIDvYVq7qmN+1FLSWyj7aYAzfSEMfCsBBYePx
	reP3dV3zMwrn0cXXa2JI1W6JCcZcNQehVsf7HxqExk31n3MQLq0fkkqas/efJ1so
	IAZQ3O8LftQAJaHeYqbocS1/nW+ceBO579IkjZ/F+yezBxXdff5lbC8pNdETnyFr
	7gqXQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7rwe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 15:21:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c7c30d8986so627073285a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852101; x=1753456901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=;
        b=glB4bcwG6Bih2OgmsNIrW6J2WHoD1zE6Y557aBkGiEto05kjkR8DMwr5mfqPx64c70
         3wkN4dGhGme0StsK1zIyT2zDykIGMKoGD66valmjssPSeeQ/IGznXfB30Shij7eM4nHj
         WKTUjVvej0R3TmL0MPcwsK2uqRaEr9QYj4Pw4+d+tZZtG2ivYIBjS0+S/+KCnnfMvb6u
         z93pez7G0sYhvmkqaE8pSCD2N7qZnyD2t2v7A7TZ1InwxSk2c/5tfkXenLlvczGyJkMG
         0zVJMzpUhvBOJKI3dxICcOC6gLCog/INxHGZeuQqY5PzLA87w6/8uFJmCUm9zupjRhqk
         a4eQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDaVsxjJEKxpyIolvXx3HbKv73iHHioEig02mvjbu/KtO+xWL7bsuVLn29QBwG9d4tIIdkmyNV65+zFxsEAa81@lists.infradead.org
X-Gm-Message-State: AOJu0YxKcB3+zBnJT6RuZC4JCN6YnwxEkwjRydCG7e1Qtw9qRW2fztQL
	SiYcHpxL7ujMs/gQi8sN7qXOfq1LM1Sy1M6vUIOco3/Is3fBaIfO7+vy0EOctervWWDt6gIPZN7
	TwKBicGsYQSYN39NsNM27TJlEjJUD1Ry1nsxkHXQgwLtrMq0yje8WorGBpVY/krFFExZtoteSzE
	oWFj7ByqWpSw==
X-Gm-Gg: ASbGncsxL3q3K5ikYEpo+DrtpiKC0nkw58V8kyoT/QNYB/evGGcgyZDhz9DAT48dORd
	ilodsOzDmBL9YkOdHd5CRn78TUNbGjxSUv95kLvLV0S0SdU2m/EBjuPPvuxfrRnKL3X5cO+x9VB
	KWusCtzcpqj5L0tcq3YdIMTmAKXPuXD31RoxDBYckn/x4jp4xI9y0Qb3QlBaJlQKx8JVpalJAqR
	g4xhAP181C61oT2FcWiCwgp1vN0qqL532qykA31i0ECJ9yr7QTCfJIZMsUJxJhxEbAY2v3tOHlW
	cNXdMqLEbU6P86NVUqrb9UQbcdDVKntxtaNI/GF5nJvBQ/pzHvICEjBU2RjWLAd9xzHvEqZ1Jmf
	q/A5v/dHStWUZrvk9mXFZRDCUUEM8/GMERM5nXH+y5Xjv+c4shBWd
X-Received: by 2002:a05:620a:2603:b0:7e3:45ad:4c59 with SMTP id af79cd13be357-7e356b28e77mr406488885a.56.1752852100332;
        Fri, 18 Jul 2025 08:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXlyUsMs9U0U+O1wbUBh1xpkP1sDmfvcZCUKPqD7lL2WBQwooK09f3VjD66V4Apt17hOmKBw==
X-Received: by 2002:a05:6122:2982:b0:531:2afc:463e with SMTP id 71dfb90a1353d-5376473b9c8mr1645131e0c.5.1752852073027;
        Fri, 18 Jul 2025 08:21:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91f09a9sm2515041fa.94.2025.07.18.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:21:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 18:21:08 +0300
Subject: [PATCH 1/2] drm/bridge: add connector argument to .hpd_notify
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-lt9611uxc-hdmi-v1-1-0aa8dd26a57a@oss.qualcomm.com>
References: <20250718-lt9611uxc-hdmi-v1-0-0aa8dd26a57a@oss.qualcomm.com>
In-Reply-To: <20250718-lt9611uxc-hdmi-v1-0-0aa8dd26a57a@oss.qualcomm.com>
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
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4403;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DqScOxpZEjas1EiNHxjLEq5FN9iLRQvzJiWpGwrXHf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoemZmjN+Omvftf4kFa7jkLpiochHZs/3UCyjEQ
 KJocwTiOuOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpmZgAKCRCLPIo+Aiko
 1WMYCACXfUOHlzufAnv7BolBNMuOWQAeu8OseKQIIQ3KxLuNSMdFlg+PMVybvtBqqW6SAy/QCIM
 lCj8zp7+vQG7lcPnFFiHw3Lfou9u2k/+h5nFwZov6t0LG/8WCRGN2SVHr2eh3mMZPLlRB5NVPRL
 TnrsG/OQab8Jy2JDPyOaCFZu8+GjdYU5lDOJQ82IdRVZ0kGD3wKHiANCYz9UUJouAvEkp8igRyN
 b5GhFmELHKA9+Jlqw3HruviFWFQCo0IefgOAeq64gHFK0MJYaIAKduKw6tSd6U4xHoW+95qydOK
 MiOzZn+V5ZV3n3MBx3uYUNVRbpcaek2Y83IJJGVa2xJpB5+9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDExOSBTYWx0ZWRfX4wlqncSfcOI6
 1/YvHyv8dkALwjfU5YkuVPBxdLvDhB6mHSyDZ25STUend98tKgK3wga21GPBifGeW51jXVjKDFi
 CRAAS/ThgWglWShdIa8IgPQn0UHkEDpFeR0bO2tU5lDemG0y37NAO+X+pya4eI8gzIS/I0VVTPZ
 3ZOVj0bj5fY94lL1qyKDw1paOoGDj6fOHlGfP8pp6bpIv9xspjGGZXVkfZR3N8hVuDNKrN0RIIN
 6oWJYKWhJZS49iz89q03D5t6LQjKTFG+TTJBLHbCZXx0Qdx7IzMEogc0D/YEefujlPIeSDm5KAp
 BFIoZBf96OXGvzvj2sr2QfNvjdZduHqWK+Xx+++oAYHgWskkBjh1YM+dxBlPXaM7W0n8X4VPsNz
 SLhdzz1zYxtxZjphwE5qLyPN7I/F6a4ljRCWSkCyRJdnJpOakFz7u82FlbVhpPKdTWjDrFdJ
X-Proofpoint-GUID: wOfp3un4tCbR4cVVze_YqzZRNTn9QPsI
X-Proofpoint-ORIG-GUID: wOfp3un4tCbR4cVVze_YqzZRNTn9QPsI
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=687a6685 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=H7fCCF_eaumybVcuHoAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082143_120151_370C64CA 
X-CRM114-Status: GOOD (  18.28  )
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

Drivers might need to update DRM connector in the
drm_bridge_funcs.hpd_notify callback (e.g. it might be necessary to
update EDID before setting ELD). Add corresponding argument to the
callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 1 +
 include/drm/drm_bridge.h                       | 1 +
 6 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 5eb7e9bfe36116c9618cd3773f1c01e7ebb573be..f2fd277d694b8c959f913517ff5861b777d8a9dd 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, status);
+			bridge->funcs->hpd_notify(bridge, connector, status);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 8205ee56a691ee7d166b16cfce6932d0308fe6c4..a665c9036878c1e879b7bd88df1d523658fe8849 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,6 +323,7 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 }
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
+					  struct drm_connector *connector,
 					  enum drm_connector_status status)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..0676b3423abcb31ac3ea6e6269473764786133ed 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1774,7 +1774,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 }
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
-			  enum drm_connector_status status)
+			      struct drm_connector *connector,
+			      enum drm_connector_status status)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index d8c9b905f8bfb5abe47c1cb26d17bc605e3e1ba6..9eb3431dd93adf096f45b6d981967734bc8a2b0c 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -40,6 +40,7 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
-			  enum drm_connector_status status);
+			      struct drm_connector *connector,
+			      enum drm_connector_status status);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 3cd612af24498b057c33eaecb3d43c8df76cd23e..29b2dfb90b5fa3b137d05725d65a1cccb9cd1345 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -428,6 +428,7 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 }
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
+				    struct drm_connector *connector,
 				    enum drm_connector_status status)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 8ed80cad77ec4b40d0aa6159e802a2839d5b8792..1e73d72c55426ec21905070a13b44aa36b02e023 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -730,6 +730,7 @@ struct drm_bridge_funcs {
 	 * controllers for HDMI bridges.
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
+			   struct drm_connector *connector,
 			   enum drm_connector_status status);
 
 	/**

-- 
2.39.5


