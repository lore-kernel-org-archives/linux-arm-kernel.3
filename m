Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E98CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+gLmc6QIq1Gqbex22CG8o5k/mKnyADqk7w+J2c1oKo=; b=Z0NuM2KMfbHNKNnmLqw47yDrtG
	jkwkzjMVS3aVy2X+NV/sGbyfCXcXH7W1PdgGvf3tvMqu0EGmk38jK6eAOyV3W8ynvlZ8MLtSGIZ5C
	Q3An8zp+RU2F0mU6cN8gKXuLZazTdbsGzigfAHorhga+/lcB6t3VipFqG4xh4qU1ulXoJDRf6WiKp
	6XGeWbVWEWjGXv0fTy9ttZH601I5mz4WpBLKb9bepVyDIrvFHeQOGbWtB+UxgbOi0UuiwdWpykbNK
	/ghPn2lpk4mlHfv4+h9R/DkqntumQUklpdJXSOUt4Pq7s4q4iVeD/ArbMqy35gkR1hAxP65EDAXM2
	Q1n1kJ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9r0-00000007FP0-2iN3;
	Sat, 30 Aug 2025 00:54:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9NJ-000000074eU-44RC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 00:23:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TNt070003230
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+gLmc6QIq1Gqbex22CG8o5k/mKnyADqk7w+J2c1oKo=; b=gTwPRJSrfbEm9ova
	UWH2HD2Kunhls692qcidzYuT+0FPL1Hut7Izk4SNYhYxkwYj+GAHqbn/DMOk6rHY
	K2ZaKRaLERT6IcpHP34r8q0BbJw8klmUbV9uoO1L1ZZQEgBQFIfFHz/AlF6S3Ljn
	O6kLlLkctUIDiz4vNXtDCk3LwN/z7sEDlkuRByJK2ty+F57Ab2me3DuDjoj4M47b
	3bFE8n63VRAjlacoruEGPR8gp4J42cRdkxk5f42RZXTBG/Y4PT+f6D7Tlr82DGlZ
	pOn/CG7TpV2vmKKK9PREYNtSi+ng+KFlag5FB2GhgKaJwBh+RxiljE10+FXiTSmE
	Z6mMtA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpgpvku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:23:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70dfcc58976so35919446d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 17:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513400; x=1757118200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+gLmc6QIq1Gqbex22CG8o5k/mKnyADqk7w+J2c1oKo=;
        b=Lvsm9isW+uqLsO37Cbh9lA3iHcOBy9Oy5cqDgtUa1+5u60mC0x/Pl7Dov8R4K67tHT
         V7KZUHXlFDVvNYdrJu8VK0iI1LGl4JLzUPecuJBiLugRsPJNDMK3VOkysgCoJIIECwUJ
         2xbeOvqtdAWFju3eImRirgJiWpfuijYzLwO0JoPf4kg9AiV71VMSj3fAhBUy0PSpICBB
         37MvRb51t8Z6Id3VR27iTFdXpY5m17J1G6H4zNqQhn18v+5AGLhxT7+6L/hsJZ20TrA2
         rnT75VtXtL4qYzECQnBTEv+rYHTK5OSULa/2F0ZPkhC3/Pj/I2+keXcDUkk0aak0yL8c
         rY2g==
X-Forwarded-Encrypted: i=1; AJvYcCVV06frfqHIUSTPnWmZvyqv1qcqeNcERXijJPUejEhxb+SVfZTWXAvd+zxRLAjT43hDgzVI01RYHlDLG0SIw7S8@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj6qJRFVOKHjG8c77aArQX2Qo5lmOanu09g1hyZT9HfVIeFHxO
	IQCc/F3ElYvuKO48OvdW2fXNQ7EgjvLMI2Wz36KX2fMIk8vgqM8Z5MiXQtkC8k1Xr/+5r0qLmvk
	f6QAUErh8pKWIxIvY2QM1aVd4JMwAafH6tDTzBcsX0R2AXobrSpyris66ZRjTDzkKskc8T68n6/
	oE8Q==
X-Gm-Gg: ASbGncv1Af+l1FeAqpAIF9S6ZscJeW7ts7B2Rn1LwVrh9ZM+2DhbrCoofNDmzaSLs1j
	wFIqAoi0hdclcvLcsvrkjsh1JCzI4++4Bem7TIHDXaRoDIxEp7oTQnv8b3ig48Pm8+Y4EV1o3U0
	cD7VVDuWJUOacJQmK20+lufVoUJSKMUz4a5kv3xBGsDJAdKjGGwObshEty2Xj4GBAHMo+O8+N+Z
	JVbTU9+RWo9xMTM23c5jj0LGGk2EBF8tW8juF2DJzndcW5YUxJcuPAI0l6zEWq+apPaNCp3AjFe
	1ksjenwTxUHLkZMg1PuavpHngE0fv2oyMDW04+3uyUimqZPpZdqHSpp4LTTgZQ+Pes2gpDr6kuz
	6BQhe5d9d8hbp2dM2pmk2DuPKHIYXOOv3EtOdss/rbiISk+4L5PzJ
X-Received: by 2002:a05:622a:98b:b0:4b2:8ac5:2588 with SMTP id d75a77b69052e-4b31dceda5fmr5331771cf.79.1756513400255;
        Fri, 29 Aug 2025 17:23:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiRVPCy1ZyvNRY0SxkmPtK5TdJ45H/D+mdd/nazOG8FE/zTJi/BBm8Fy800I1NQMGrZsr0qA==
X-Received: by 2002:a05:622a:98b:b0:4b2:8ac5:2588 with SMTP id d75a77b69052e-4b31dceda5fmr5331431cf.79.1756513399780;
        Fri, 29 Aug 2025 17:23:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:05 +0300
Subject: [PATCH v3 09/11] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-9-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1517;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TXVbDyYy47gcECct8bi3FdzY5XC0C+uBNPghEtpGc6w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRkOHE4fVow7vDWOUvmc/2iUcbcfIOqvZ6C2
 Dchv4veASeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEZAAKCRCLPIo+Aiko
 1YnWB/9HjDIWWBFOTM8HXaStc63uIk6SmVdJldXZsyniEFqPA35U6pxTvz22fY4ZqbvckumzrhR
 VzHrK4EaLNdvGVvpvzCqVg+lao3Ze8t/g8dHlSQUGz4uDNF9caS3kvpyqdRe/6MHFM1r3HC0Du+
 GKwPnh9RgBqznt7b/zoa44AB9KtgP/9LMftD22mQowgMWto5XI1N0Y4cPb6TL3PBmJkmQSvi63B
 fiTBoU6l5res5/vH2RuIug1cMVng+2t8eompix5jbFUnr3t9cm2f4SNOuTUVo6JZpap7J265oE5
 IBWsjZfpSptNolCOsELssC0lCC2aPYXd5tjx6jp63ntEd2vd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Aih_uCe4NHpshkNFo5TzNqduB5inZQ8_
X-Proofpoint-ORIG-GUID: Aih_uCe4NHpshkNFo5TzNqduB5inZQ8_
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b24479 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NnPSNIktjdB4Ge1gQTIA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfXwiSTCy3jhPX0
 hOrVLmHMwJ3DyIlGuSS01fSlT8z8beOvvzsa+3fBoX4yl/TwjtPXILXLcM0RSZMiDTG4kbRXNKz
 vuwBGStfaIQ22zu/mKIlX3SoQ85GjG1iVKG0bTjoL1opYEZ9XLvZ78c04dpktCw31d/qi1s0gY+
 vK3EOPYhUsrY589AytPM9+sVJ7LXrsu+LZ2lGta9/7w1k4cO6JajUSQ4hsmbwPS9eq0gZIXAmNv
 Oqqbk89Vl6B5UyJfqF3MUbC+5I573+2gQtKQYkuWNR/tEFm3teG5EKgyw2irdcp7qeNy8kj+x0p
 KBK8NULnxNknzDObo0SreUV077iim0PU80n7lN5u6+2fJZDldnPAJP9/UyXHEHZF4J5bmBFnoiG
 kCmCJ7Be
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_172322_162705_3B490F58 
X-CRM114-Status: GOOD (  15.90  )
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

Check that connector initialized by drmm_connector_hdmi_init() supports
AVI InfoFrames and warn if it doesn't support Vendor-Specific
InfofRames (HDMI InfoFrames are more or less required).

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index f031e8f8df57da15bb0f8fe21fd62f02a1576ebe..12ee06bad364183ad56a20b2bf9860491913a295 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -582,6 +582,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     unsigned long autogenerated_infoframes,
 			     unsigned int max_bpc)
 {
+	unsigned long supported_infoframes;
 	int ret;
 
 	if (!vendor || !product)
@@ -604,6 +605,15 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
+	supported_infoframes = software_infoframes | autogenerated_infoframes;
+
+	/* AVI is required */
+	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AVI))
+		return -EINVAL;
+
+	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_VENDOR))
+		drm_info(dev, "HDMI conneector with no support for Vendor-Specific InfoFrame\n");
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;

-- 
2.47.2


