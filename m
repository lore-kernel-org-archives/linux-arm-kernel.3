Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103AEC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 15:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=; b=eyOHl3y23JEZJaYyap4EZgcEer
	AxD02DK06+AWJqLlqryaxuwz5CjhoLVG0cHPA2La13c+8Q2iz9Ky7ExN23R2Bm9H2rZsRkIzLtmPI
	C7p1ShSgJ+IaXoq0639WuInoaSv6nv1ycWb1T6b2/RB11GGGDU8opPCqqLFcl55tJfXvi0rYvxfo+
	T+jLg6IUSRSt2p6+SI+madnzDd6nhHrQoBes3tc8srAJcAzn754IWuuqpRLUC3l2zHBAxZOYcsByk
	s7mN/ivRpHV51wjJ/5UBIEosiUgogra+vjKr7tZBdb37C9mb3BLw1Fxccs1ALYE20ZblZE9bqvYUr
	WvWIZ4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J3H-0000000019u-0V3r;
	Sun, 20 Sep 2026 15:01:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J36-0000000011E-33Hi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 15:01:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBoDZG2570005
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 15:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=; b=DXC/ueKzIq/kzAF9
	rFYqtVTFD/hrOYA2YzaXtLkcnUoXM2sFtzvQtwmd/9/ZSZ6Y/3CFQ8sg9RUnOeiZ
	RFVYdj9zMPsAnhI8p9o0mGPf/Wjr70Pl3ScG0L/EVdMNh78/beTatZcT9xf7ZxHd
	yD4hZW/OZLFu8g4dTZs5GmNjUuiDIqK+mWMecon6ao0P+rvaBAPtwiXz0wzLzBsU
	EthYaBSLNRtrODbJ8MFm/30Yo8KRbDC+8YVsY6Yr1m8vDa1DCBDIAx+ZhiYd9mwY
	rN3XRbVxjKOVnk8EYpA0uXNwGP3mMuf+mfD9AGoK5uhIrsAwuuf5AHCBxIbAp0Hv
	R5evsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfuk71n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 15:01:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so68173231cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 08:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916507; x=1790521307; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=;
        b=B0X9G2bsODtHcBc17ho+0CzcbRlwSPtSLqXVPm46G0iQeBNZ7sH4gmO8ecLa+faeSG
         fTUbm+WaWO9uusyDXMdZqqYbtwLfIvl4Alxe4xiMWClNLe/s/b0JtAwsKeOda6axSZJ/
         nNXwxojtrbCl72THVX/ZM7ORhVxE0Wrb5A46OF5LnLit4aeBt6BX+3IyDKbGwfqii9Oo
         VDOqu39390aFxRE/90YsFszgGtcvUiQMiG3+B0pVA4uV/dRRBDJfm2vF5HFrL9uzq52k
         XSG66OvtOUSp+1ASwbJ8YKLCfQAlHtj5vWZoII0bLXAQEzVABaizIKCYsyj3dAIh37lq
         jDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916507; x=1790521307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=;
        b=icxzPtErmeB+sicIVzfRtzVb5gOQvc2qarxEehq0ryTKYynGlSboXyyZDqHUh5rcP3
         2ehkm+DTkfqtk6b4GS2/xC/Q+yMj1i3BoU1D8OhFTFNDBSy87vymG+NusuiJQUnx2e0J
         u+S9xOzGlSlMHT2jncNpNd3/Ypk0sLD9B2HCY9QiPXvOIBrbm4yuIegj4DzvDtgu5dQU
         FKCXPG42xHGGEpcbi4hSLvHUsMw8keABU1dkotjecFVz60dxwJM4m4veGpznREFw6yfu
         2v9R8P/jdl2lgQi706JvX/KRavv/FwedNPCFEpgWKpdeu7TPULYh8HZLfQGkWDnmM59K
         K5qA==
X-Forwarded-Encrypted: i=1; AKwUvByWGQDuCnCrU5R1V6tbl3bhbpYN0yv0L5T8RW/IhV5D0yvL5B1vYJ3Vh/By810UxvwXnDMrF2yCAI2Qj2bRRbDU@lists.infradead.org
X-Gm-Message-State: AFuF++lbZ7tv7jwfmSpy3OR9ez9CS/lRaKGGRpZxhEiRrJxwIPxQjFBn
	YobZUv8iT7a4mJngBVFSXwmTEN5lPv4IeHCZBGuR9gYqE8NuBTk5Ckp0h1oGo2+Z0b8yQZmPHUX
	fmQgQZweRkflrDkQefUq5ODXgeSXIwOikOlrH5XWjUueDA9C2TfNTyNPNXj2CER9XXGvAkcqPps
	9jrw==
X-Gm-Gg: AYBFou2t95D1fnc3y9szyZ/pi9ze7a9SBgyUI3qkP7b618F3dh3XJkdpnmhqVyrI520
	/iLcSptUBjB926RAcLeYYhT3/S46/ckF7AXfrhCF8rGgnQ2Rcl79z+UOeObbW+aZQAHjOj3O6W7
	nQsrW6VQt5mKZggs/45tODbwxfxZ7AY3M86QPEw0XXWbvhvWY3RmRSeTXH5yF6sekbtsB1nIwcq
	f6W2HhY23q/a58Oov4i2lo5sEtfsLqbjPBNm3hh+f/QXankj3dfri+QUX86vSAlhgoCYQd1cQz0
	nkBIYzVvfdsAWddTDWzVCyKK8Va0AI5HtKpN/7f8CMBs7Pl+tRpGrUtUr+rhRvMWiolAtib7WSl
	wLNbtfKffDw2tGjVLuIBzpsUu0pugua1cheppjaqMtUnm5f6YCoVfdJQTki0JvY3stfirA4yMj6
	HeftVVIGezEa1P
X-Received: by 2002:ac8:5756:0:b0:531:10c:a525 with SMTP id d75a77b69052e-532b6f9c339mr59088361cf.0.1789916507146;
        Sun, 20 Sep 2026 08:01:47 -0700 (PDT)
X-Received: by 2002:ac8:5756:0:b0:531:10c:a525 with SMTP id d75a77b69052e-532b6f9c339mr59087721cf.0.1789916506618;
        Sun, 20 Sep 2026 08:01:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:31 +0300
Subject: [PATCH v5 6/8] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-6-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
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
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IHP/CEHKbEjbTAclh8cTAdfCEyItA+qP7FeirdUUoOg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VITghi4UzzRoE/FzgfbEnUTmORHJmboGa52
 XVMK6F5wo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1SAAKCRCLPIo+Aiko
 1Sv7B/0YL5DFJ/q87OBtIjQCInHBNjJWVturTDYh0TaYHFvNJxrU6AlpJU7OUMxKsZfCeqyUQTp
 CLdTznZPfsk0pHv4sgAH3ivr8voWJgY0gF9WW1EDhy+P4p+MTBHcM6fSGNNsIxaGRc7ZDzEWqYJ
 ZrusLtSE1bZYR78wlMziU9RHUX5W7lZPN+sZ/zgMF3FdhkI5Rg4LVp8wHKA3aQLQ4QWGBQ9y2yu
 PfH+vAfW7MsNUXcAVZ0L3QCDqaZCQ5D86IfEyPSfSumHYKRgKikqjEy9a27zrbpMhb99EoIaIMA
 533IC393BTUb0jdbU8nuR0DF7Xsw2gXSG4kvX3t3JpEU/nx/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXzsGthOS+wP5F
 2uTYSogMLP15mdVu/39qrX7pNq4QkV4NYQlB3vNIrS822uNuYn4J+KlQfUdiqIskWBHzRugjXeF
 aBStWN8ojPQleEw/VIC5n+IHQts5WoI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXxV35G/uWZPzA
 esFeVRpowClS4HopMfsHk2Pg52tRf8wEwGWWc3m2IDFdjySZ4lEeOd4LNNpcOx2TWeRu5TIJegW
 BLDCtp+ZbFCN6wOHxCM8tCaa/0+6i1iS/SC6QUQXjAEPH4bZSufSk6HI4rEb8V4PLo23/7HHtAf
 0QSBTGENq4Tc4pmeUXwePgJabkGmqhZelRZIU3t0dnGZ3JfrOH34LVjXzp06SlFjFG9K9+ncG8u
 BippgsNBcQ8lqaAWbknrCJk7VBNTxi/3e19w+9DwqahZohkLM5EvdTO1URw6Tos7gKcmn7M+bz5
 1G/wRAW2k13eoLldfeKy9H46lk1Zxtw+rj+vN2swtSQCyZMfDltF/ITZoClN059MpBTzFyeydtL
 /ew1YEhDaNKgPTOnlXeGDiagI2yGuJvMdkwCbIHqhuWjiAf5ug7XQIbx6CW7aJWnVMFVpT0sPrD
 V1wY18mQNj/AHnxi7dw==
X-Proofpoint-ORIG-GUID: SvMniufps-B2OXsSaLBj-XLlM1pEW3hD
X-Proofpoint-GUID: SvMniufps-B2OXsSaLBj-XLlM1pEW3hD
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6aaff55b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=kFJzCQJ8v3RGWcIHJrMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_080148_908432_0C8C0600 
X-CRM114-Status: GOOD (  15.64  )
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
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9308e373447c..a420e3d49928 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1559,11 +1559,12 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		   msm_dp_display->connector_type, hpd_link_status, status);
 
 	if (status == connector_status_connected) {
-		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
+			msm_dp_irq_hpd_handle(dp);
+		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}

-- 
2.47.3


