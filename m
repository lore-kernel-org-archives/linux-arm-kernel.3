Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02207CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 21:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqwCeGiS55Vf9HMiIq5R7znG8Y1OhJ6NDQ7vMB6NUdU=; b=l9iHKbCxvu4m2x4NgPkwMSgyLM
	90qfL+b0YUfQH1FereWmYJ1BnmcZYHKh1JjevYXJbM6H0b/Ha+ADExj6DJbp8I56GmuLHFQP3lIWO
	50RjsZrKlW7JJe6NGXp1BvZy7u3joq4hIARcyhcsFNgPrfEOO2uLIwU+VF0KH939a1U+GJ/Nd7f8T
	jmQlTSACy4UFn+S/6+afEhpG9OI58Y0WsqmjQj2Qc1S+LrnVePFjaqznymXWztOKtsvK413ueyI8F
	R7SXo93z2bBV924l465rUSWJW/gkZ5bzd1oA0fUvZWgiNjri+itTJAzAraiKbQ16jP9nOgC0HDrBF
	rzTEH4Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7Y-00000002VVu-40YX;
	Sun, 07 Jun 2026 21:33:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7V-00000002VSj-3XC4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 21:33:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EjcRc436363
	for <linux-arm-kernel@lists.infradead.org>; Sun, 7 Jun 2026 21:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqwCeGiS55Vf9HMiIq5R7znG8Y1OhJ6NDQ7vMB6NUdU=; b=VZFyBLWNd/Q1/Gt2
	R/3Q0qddH8uIz4xr/Vi2dwaYYKBDTMYdvFLyKqfGmTVm+n7b3jJH2ZVadg9w37v6
	oh2t2/rZ/7+YtF+E67j3kAzm5mA+HdMmCv3vcKCY3oIFyZWYWuvQpoiDSa0h4Q5w
	CGj5YXzNnx3ltVgeypqCiTOMGXalehNIEhlnCzrP6Q/AOo5sHwwXvugiEY0+hbP1
	yBdyPbQX3JxgQoNIecF4tfvIBjtiKMFIE0mO34kHVtmPczqZcOweNY7XCAUDMwUG
	69UrqAZRwMiS9Oovk3Q+8cAfzjbDKul8OzF29C0OQPtMLOKc1QVnUATkfA/zCiYf
	x0rK7A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8vjgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 21:33:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51772325a64so50268881cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 14:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868004; x=1781472804; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqwCeGiS55Vf9HMiIq5R7znG8Y1OhJ6NDQ7vMB6NUdU=;
        b=c+9VDzpzQNgoR+p+PiT6NfrSu2sAT95zOMQe5Y+DNTc3X2u5s+b0cjcsU/eR8Cy73R
         WYrTqDITdfxcOBqoLt9XzsZT4CFfJcUDcXReGpJI+wHnHCEmb/Ar1cHwqMD+b0ieX1L0
         qZOZUZwjnVp5DJr12J0torLV+DhAajU6Xbt8uMu9cTyo0FyU4RWTkeoOjF4QArJC+Ta9
         UAoyjU1QWj2Sgrz0S87pRMAA/ojBYPixDuywEyXNutTCTeTDA+PzRoVdGZoAc2EG1KHw
         6EorfGWvp1fesKGJZT1JLBSs8Si4HnwC8dpIa+gq+Di8UKaBYUet1wD86+dDBKIYiP57
         TcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868004; x=1781472804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqwCeGiS55Vf9HMiIq5R7znG8Y1OhJ6NDQ7vMB6NUdU=;
        b=djxEaYnlkseQF71Psb/MRp4ESPDUfzLuhQ2f/iC111UfABvB40ay7iIkrbc29MwTr4
         OOiUE222+Y4WqnRgar57D7OqNklYq1wQDUGIkDF0N0bFa7nQeEOPXiHyI57rdvCum1Bf
         TSq4U5+pCHeifzh+92/wdSjIHtfzew5hpPmbsBlGENVnpBASnx01zF2EcuMP6dHu2MOA
         yMwzumccUvvuB935rFMRhb+gXsaAZgrv8HxmtjyFw/R3QHZ/QeM3gjTpdtSI0fDG2SaP
         bGxAE/KP6iKPJmToFAyeMS+I44RYMwxaVSb8/PShrenRDano/28ufgW84XwVh9cNHlcK
         FPwQ==
X-Forwarded-Encrypted: i=1; AFNElJ92Ss5sLQtZOpNRPWXPs7CO4M456e0AWtxzQFzUbmNIAGg7AnQxUDaym+cU9R7xq1RIBn4Q5HL/M0A38u5LQhCh@lists.infradead.org
X-Gm-Message-State: AOJu0YyUPPFXI5ikWRIQAhvKlwHPNLyjHfOJhhR86yYlJXnO5qyQUF8i
	1ZO+vR4pFs1Mcajs7FM5o0iOo3Nj1xucjoTq9l+ZTvBS5XebPiKujNDC5LKZwR7z+wuW1cmuf5F
	rPP9Di9NR0eq3CWmPWfs1gnzpXjD/W6yMTSJt6LAKtR2w71WYYKpN9UyzG7WouLqJ3pUok1+2Cf
	MioQ==
X-Gm-Gg: Acq92OEvRWS4C68J6viEgNt9IT9vVtWG2VS9kZwTcBviGPIbFGEtmDAW1347aEEmHir
	qYsZe3Tu2aA3DBm4/13h6JgUJ3wJgS1c6qxAQIQlblG+oJYBw3LBHjCwZ3oKEJUFwPmlQ9FSqXf
	NxNZtl7OR4HuCPcrvJB8zjuEbWrh5jy46mL/ZervLGECQb4HF8ogQ3LJvgUYZgIODiho+/HZ5JU
	m4p5/6DYNqkzZaT/TaS58qyNq3WdIqVhwR8qpSDznvn1+szXQVOMR0LqPd61E1Rx84UdJdL04qF
	Vq6P3jt2LaeroFftYoahRGs1jhdxnnOt+4QEIomYQQc/GQPZxpXvccC6Hq8pGpRClPwKTtrQcuI
	xTN0hRyF3XweaNvR+XC990Mc/WWcFHlBi2q4n66lyT0fDbL356Zs+0laVpsnp+/gkGtkRSfChsI
	4RYZP+OZwXMUQc8IoXy3I0y82ZbAlFZ8v9mtrAxTZIOLUWZw==
X-Received: by 2002:a05:622a:20e:b0:517:9157:ecf3 with SMTP id d75a77b69052e-51795be129emr193812221cf.36.1780868003996;
        Sun, 07 Jun 2026 14:33:23 -0700 (PDT)
X-Received: by 2002:a05:622a:20e:b0:517:9157:ecf3 with SMTP id d75a77b69052e-51795be129emr193811791cf.36.1780868003426;
        Sun, 07 Jun 2026 14:33:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:05 +0300
Subject: [PATCH v4 4/8] drm/bridge: pass extra events to the HPD callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-4-30b62b335487@oss.qualcomm.com>
References: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
In-Reply-To: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5547;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xv8OK5b4aegzohrbDrEYK2LgkMwGQ21VRNuRHpj/5us=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQTkKDpqt97cyPjjeSFT2syRbXebSWwlKv3
 9mydw2N4yiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1QKhB/0bt9RHhoBHoeWzG982WH5dV54vogSpgf/IUDHcvtgk9lubK9mayJlYBeFGJ0ZIBUpzcs3
 jSDS3jSHxob1NPQdfrE4CuJxL1ttAWQ2ltEvFK8DPvdxL3rlQbWb+3vJ2wBhU7qo/SpXd5LyLzX
 z3dy6ikv1Xe0oxmdeOoeE1pztaMX9L2npVlthrH8PJeArW3Ge2WMtvQkWZiPzykgD2tNH67fE1F
 Zv6WdqrGj1pz42HnAvlRjEQ55aEtrGQjtIoM3K6dDw8hDMs1LUS+1536p77CDkRB/FUNi2mmaXy
 YqZSic4Y4eDW+mUWyoxgu1gPNfex2LX4ve6q7jqYnwxwmFhU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: q6dwTNszKiDZhnoanaQqreYo2gydw96V
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a25e3a5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=x0urvBsf9yKnxdYdiaoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX8WVk+mCsoXAM
 lMAk+PfQfl2jyQ8/OAae7akPr97UiC73UitleYIi14CT0ieOrdLmAhn7YCr7PAcqi5/ruP2U7jM
 S9R6ZlqIw7epQQbnzPDBShSXnD6u8/Hf0zqrY7PqKSntA/e4h7/+QjVz8C5ocHpD9u7u1zVsfGB
 UwSCvEWRTfVZ8krYW16CAEXRc/k5YYa/chtuyjXXMl0Fvj0fZjM8eOJLUdbhmcKZLBF/SQBVVmQ
 omLQpBBO95vO6kOJT6zxxFJwgSwdIOIaJktUe5aJcXVLGd56176cpVDeWdjZQ3EdvDcOe1bWWoi
 dZ9HjjMcHWpvK0fLgKIeFa2UDAHfr/BUCeTqrdFJUyYqaFph9yzAuTug8uothzUfXFG3T/WVA6l
 WIso23wBwBPz/bbLP8jux6faOBG9RTCjUzZ4zATrW+lj+8TyTvoZfkqALRdGA99KZ+WPDdMw1Dv
 QaUDLF/s/CO92u4+o9A==
X-Proofpoint-GUID: q6dwTNszKiDZhnoanaQqreYo2gydw96V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_143325_887541_BBB72E15 
X-CRM114-Status: GOOD (  17.85  )
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

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Bridge drivers report these events through the
drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
callback, specified during the drm_bridge_hpd_enable(), letting
underlying drivers (e.g. drm_bridge_connector) to receive these events.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       | 3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 5 +++--
 drivers/gpu/drm/drm_bridge.c                   | 5 +++--
 include/drm/drm_bridge.h                       | 6 ++++--
 6 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index a237c65ebd69..35df99b02c9c 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -258,7 +258,8 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
 	.best_encoder = ch7033_connector_best_encoder,
 };
 
-static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
+static void ch7033_hpd_event(void *arg, enum drm_connector_status status,
+			     enum drm_connector_status_extra extra_status)
 {
 	struct ch7033_priv *priv = arg;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 729b12b67470..b8e643cf1d4d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -505,7 +505,8 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
-static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status)
 {
 	struct lt8912 *lt = data;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index bf4ab4eaf269..e2eedaaa3552 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -110,7 +110,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(dvi->bridge.dev);
 }
 
-static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status,
+				enum drm_connector_status_extra extra_status)
 {
 	struct tfp410 *dvi = arg;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 046efd913064..a34643d3ddef 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -171,9 +171,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_status_extra extra_status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+	drm_bridge_connector_handle_hpd(cb_data, status, extra_status);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 84e55db5c1fe..3fd3e7bac588 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1445,7 +1445,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_status_extra extra_status),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1513,7 +1514,7 @@ void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, extra_status);
 	mutex_unlock(&bridge->hpd_mutex);
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 78b0d83ef2aa..6a5edfda2ddd 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1260,7 +1260,8 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status,
+		       enum drm_connector_status_extra extra_status);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1578,7 +1579,8 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_status_extra extra_status),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,

-- 
2.47.3


