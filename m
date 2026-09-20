Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2158EC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 15:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXWAWnwnkyxJNop1YmIHyAiC0W2g9ZZFzjEZKgzs1qI=; b=Eu7Dx8XbuXHK2GL1Rjt3chdhnC
	Q4lnv2G1H/WTDfw3g1zOLZ81fBH4hjE+MI9n0oy/9+/L3M7nlpyb0i58fRbFT8x9Bp5ETz1sAJTXh
	Fy67yvwKAtrRri87IhH3UXOjUVHwnS1jvHLyMr3vFwWjzkTJflwAtr+xQDxmkpFFhs/eSfzAOLMRr
	c3Eex8eSUJpNFqsWEpBkjmwHoesgndEZyvym/PBerxiSw6Po3Hy74pGXzAnx1P9mHAOVuEUr5faSk
	fGn0xL2LQ5/5+JIOciKirZQBkWacgQk7dbzwHWG5x8RgymaIycp/h7zBYT0OQLbqJrg+Z20REwtxr
	hYJAIYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J35-00000000101-0V1x;
	Sun, 20 Sep 2026 15:01:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J2z-000000000uh-18lY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 15:01:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBo2Mj2761397
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 15:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXWAWnwnkyxJNop1YmIHyAiC0W2g9ZZFzjEZKgzs1qI=; b=D7CittKQZRPVq5UC
	NzezV2mRx7HM5unMGn4yWg0e9QyT7guxtZ2apeq28m24DXT5UVEUSSLkto3AZaoX
	RR6aTlY0GH1tuA9eBSBw49k783rdUKHLw2x9fhmdHVwfvPuaYkS/gcRs6S50dme1
	jd4Ue4hnc4uvbP4KiBFqn2EsF/7eMpG87+y9f7zUiJoEcByyQSzcu59i1nNfh/TO
	THdX2yS3N4edXwkhE7gYvpS2NuPU7zzwi9G6LEPPI1zVWTp0mXf7hi/cAFnMX6wr
	X37003zGJy0bCbxvWcIkiqQVzxhsS/fI3GomsRvVQu5lASoN1ykXMI/H35arImx/
	EA2SRQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshd63b2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 15:01:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98055f91346so1693692241.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 08:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916499; x=1790521299; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXWAWnwnkyxJNop1YmIHyAiC0W2g9ZZFzjEZKgzs1qI=;
        b=bu6wTfiEc+Ta5zpYQ43G5JXDUbdA4K2wLgNeTmpEMFRcatcPTYXQNRr7A2smg0Dwf4
         E6fXfjpH9JCmp7x67b0RjzCwAcKyOQSROrv89s6iYorx49wZFA6dFbhi75+AgIRxV376
         eikBBKVOJ3hOwFQbSYqq/QbUI2CMDZen9gSMqU3oxPuLrHWVDA93cTdV7GeHeTExV0RX
         hLNkxu2IKsKLt8TBCuw7Cc4MUuAvJ+J8kPWGLos6p63fBIgNcjGj1I0R+j0g8S5pFnhi
         6WR+dvjMhSexKXA3osUbCh8+jPd+196YiDl5kV+s/BhPw0l+OFB/0ZBD9RfmuhkNuLjB
         ltVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916499; x=1790521299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXWAWnwnkyxJNop1YmIHyAiC0W2g9ZZFzjEZKgzs1qI=;
        b=iIDlykxAQhyk9/6cv6z1nEYcEbiPsjAnvjsqfT9WCxgXMHkLjxicUK4MZatDM0TR5+
         qdjOeHdJji2caFwe/NEecmkTd7E6eqeqRcw53ah+CRF+c85p0ChfhH/9E2VbCvsYZaSv
         yqb3GHMSJoVO5+bYnZkoV60fluedQc968kgxdMua2NBJ/jWfDEoGHN/zy9GgbS70Shvg
         P6/HeuxPoVPj64qubovBvXR2AR1lORgcDjgfpKmH0YJ39w8H5CF/+7CE1PuGxFgnIbvZ
         9opw4pNpzwfz5LatMRezxUGSflM6ZuYdGlV30gsXr9D8CX8bYRumnGOodmrMZ+0zn45R
         kIYw==
X-Forwarded-Encrypted: i=1; AKwUvBymHfp0+5AGwJi68UmgHuyNMXGKYU8zXSNh2n1KmTYPQquUOji8Q1HAyEv+4fkd4FmMqlouAG0aoSGRvWwqb5dn@lists.infradead.org
X-Gm-Message-State: AFuF++mdqYjDhFY7bWot4xqIh/2ACkqfJZIXkatroV/2tzdnYyG16PYm
	Xs5/qr4vuSXbkoJN6JsF0ZoNHx/o/qMNePwHvilzMIeN7I3Z51cWky8AyitDiepNDz8PSst8lQW
	BhQjVG2IsrhVHJcdx/4vVge+xCQpS2mkVM4ZKYHs98/HvvT0Ejz5yxyE5GKzcPQe2lhZ76LPGb9
	Y8Ig==
X-Gm-Gg: AYBFou0GrXALlcAPIZrcWfd1k2+pKh4yMPt0nFg/PQSLJvm52T8ysGuQGVwlB0yuUZ5
	/KWiatI3ApAaWVIe25qsmblrqlZZJN7URmNC16ccUwXXRW7948HU54PQG8VQPXtg+gS1OCXTreL
	hpu04lJ1wrIAfP1imLQ7YBYt/p2EuYaBgQf6CYdIBOLD/U5J8csE4c+NiZ2bwnrn7wXvuG2xmwS
	K1/rfXP+B7WGdozM+Guvq3oMLL6IT6et7RdvH2ngUOSV6KzeW091mCUNLgh1I7IokfnGFCHU4y6
	QXGZ6RCi1KbHSoZej/UKcIb3ud0M4271ZoK4dvTDxfsFtWp20q8JQH33OvmNHEBjuc0E8Tpa9aw
	g4yolHF4nKTEXeUuT+MFhBiPpcxG+PUEN7zW7fjsZZ4keSJyjReuiWqsSl/a4ywLAhEP8I3nYjZ
	O4cBTzPBggXlcb
X-Received: by 2002:a05:6102:689a:b0:7a7:3485:33e4 with SMTP id ada2fe7eead31-7a7348549b8mr1492108137.33.1789916499553;
        Sun, 20 Sep 2026 08:01:39 -0700 (PDT)
X-Received: by 2002:a05:6102:689a:b0:7a7:3485:33e4 with SMTP id ada2fe7eead31-7a7348549b8mr1492036137.33.1789916499090;
        Sun, 20 Sep 2026 08:01:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:28 +0300
Subject: [PATCH v5 3/8] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-3-ff1de0090c72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7277;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EVgrHj1tZBs51ETDgVLuzBSX1Fd5Ddi56a5fYfUb7ro=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VHviHGAAVv1soXfol+wXO8U14A018aUgzNM
 6gy+9RNhzWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1VhPCACAVzX19JL6817I0MNCd9lLSKxJ0lJ09Zepji5qaM+gFtbZqkuEDfCk9lzBBeE1X6ktlRS
 t51CPFACafuD37D5RZzVdDqLyEYtYcK4HJdPVflqA3dVEKSCohuSN+uNHVvii1pjZML2RPYSONb
 VlbGrUki/IQDwoEwHkWg4fymUWBCWxDy2y+AHxLgOdNKQPm9hVhvIzGFt7poSRLbd/KzEjDBAJX
 AN45X6Ux5Syo5KWeuqXn5sNIyKi5cT0Jgwgj4vfGR4Z+pAcLdFp/TvTOnnVb2GKZiJB0xiM2OBS
 IiE4j2cUIW1hJsyQTkWakDw77VpN9/agr7urnRFJFnUhD9Hf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX3fG+gHFHzCPp
 IcNWYvln0G6tTbU+0CGuEGXRYcgKKfkKrRsH2PVbO7oedl+aO49wz+cP2Ez2UJNOOTGW3ckdH14
 fHuf7wDJvWM/flynbOFjsWjMIpNuTxyWa/q3pOKu5BwUBONHxcfCpbUrZe7BWYA842NlsVgcB0x
 om73A17kS2nSlqL1iMWq/2Z9gjKihMUrx+62bmfzBLSe1dNxqGZrOJjVi19UgRGBQE6p/8glvkl
 oqPmX8yzK2gah+PvEzqi7ntikfWo3mkGubJ1hMJeeYThU8HVQK5iMBylQtN0WiuQbL7HIRe7HFy
 9JBv9rVr9ioO0qq0qVuaLsvfLC+OhR6+46npsvZf3H4vXM+5+5g03Jec9v3KgbhepGRLiHmWMPz
 Xed/hPxdyiJnibFzdOtd9BxAzA8tuzZsQxaKvlRBYyyBxRTuMUcXjMgHLwsashLNV7K13rOvAji
 txl69rhH1QvhDH8Ox6w==
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aaff554 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=sF2-0BiPaN5ps1Od_V4A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: bRcq9WvjtQCvRSUJYoyc17L_fzABd2ai
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX7+oAOBrzTzXU
 hxCrjTf6tLzpqCHJGhS3P8IMdp6R5GwtajhUsZMdZ3H005khZA6qeDN7TNDmy+p2hhEOzZnC+Sm
 rb9i5cSOWHzVom7v+Po3FdZ6uBw1qoQ=
X-Proofpoint-GUID: bRcq9WvjtQCvRSUJYoyc17L_fzABd2ai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_080141_438255_D7C68195 
X-CRM114-Status: GOOD (  21.23  )
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

Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
events to the DisplayPort drivers.

The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
preventing extra cross-tree merges. It will be removed once all
drivers are converted. The drm_bridge_hpd_notify() function is kept for
the drivers which only care about the connector status and will always
pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 11 +++++++----
 drivers/gpu/drm/drm_bridge.c            | 15 +++++++++------
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 include/drm/drm_bridge.h                | 22 ++++++++++++++++++++--
 4 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index a2e525aa5788..930a03496ac5 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -137,16 +137,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_extra - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @event: extra status bits like DRM_CONNECTOR_DP_IRQ_HPD
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_dp_event event)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -154,9 +157,9 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 	if (!data)
 		return;
 
-	drm_bridge_hpd_notify(&data->bridge, status);
+	drm_bridge_hpd_notify_extra(&data->bridge, status, event);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_extra);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 649f6b6ab5c8..58927e0d0191 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1607,25 +1607,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_extra - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @event: additional status recorded by the sink
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
- * enabled by drm_bridge_hpd_enable().
+ * detect a change in the output status or when the sink has reported extra HPD
+ * status events (like the IRQ_HPD in case of the DisplayPort), when hot plug
+ * detection has been enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
 		bridge->hpd_cb(bridge->hpd_data, status);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..233ca885736f 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_dp_event event);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 }
 #endif
 
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify_extra(dev, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 58fff047f43b..d64a0ab02c90 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1470,8 +1470,26 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 				      enum drm_connector_status status),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+static inline void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+					 enum drm_connector_status status)
+{
+	drm_bridge_hpd_notify_extra(bridge, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);

-- 
2.47.3


