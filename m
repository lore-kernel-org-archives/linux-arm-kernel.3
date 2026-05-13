Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29700CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=; b=ze9EC6yh97Sg7cbZl0mZSPq2JJ
	X7GHzObAd2DyKVZQHgbMRTUReKsQnTsCc0l7QEP7h8OheAU4EDE6CvM0iHuy2+2zKrCobxynDCuiL
	gTkJPBNsMINBtxXiJbhDKXQjKKPjRPhUhV+JXPBM4cZnnHF1Q5j2zJZNrKpRuI8vs579grZ6yGZGy
	Vj/zuEBi1e3AqupUX7LZJFaL41QEJPTVkUbkqZU0EElHlB0QsG8P089ggaMYh/+rUM5CIbsM/h28v
	+t4zZPj2ky+j8/N3N/wnzXwurzaj5i4lmhsHmdPQ4BWVjCBybg/Hphnba4zGe10G7VfYW29vCCM4N
	xPDoPd5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFT-00000003SJL-3CkR;
	Wed, 13 May 2026 18:23:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFO-00000003SEd-1qAx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 18:23:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DG8iS53007155
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 18:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=; b=Rc0jFcRtiw+h55So
	zoTr6UzoG1TzenCRG2BQXvDfD6fxKCDKrQmyLxG3/4Wa1QnskXhnepcU30WtlDMR
	zz/9dkXLcAnffHFqLks3kors5Tm70GRjvq57IMCk3wa6L0jP8xr102vGPPnq8Iol
	3fAYLdgOU4sp/7uInRa1f7k1uShv/ddhwwPxFnd8B/6M5to5JtodKsLaHR7UAJC+
	wgUYdnL8KgQ7h/n/Xy5YnkjnuZi0CJ+2m1uQ7IoN8LuI1V38k+AuWwns8KAMNq+L
	NlgVMGdZH84ny1tN+npBtZROT80H8lbUDeHKYovQGMUtquWbdMEahR4Lobe0MK1r
	GjJpbg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0j0an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 18:23:53 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95ce07ddc14so8240278241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 11:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696633; x=1779301433; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=;
        b=C9fncjd98BV+qfpbxuweVI2UvGJkYuLKOiBrsJFG8rxj2fAfCRwGKBdgouhOR2XoKC
         bvj2IMrWNXBHQ79JfVddP1BwshimZdG5ePc2qSK7exCqEl562J3jwWUxJyfN0unCDHFg
         iNOciC4QtTSz7ieG5+n+JKfrUwNbpz1ZxSidfYPR0vOTW0qoHVMTfhNykRkvSSd968M9
         1lH7dGSAie2oPjdmvZARZSCUQ02S0trNz39KE/VXHgoIklWhveZCs8B5smMma6Er3i3x
         73HTWMODtPbtl4L0J3S3IQP7g0/GQPueP/PTp1kX4tjk2Ks7ySBWKHeWqcYwKAhjF19l
         Dxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696633; x=1779301433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=;
        b=rw2rL6kw3XDnztfe7jPflAfEb1sw+BdJP/vFMRIo8MX2ZnK3+KRBlIscw32BE1/Nv2
         KA2kwsh5dvK8KK1sWOPZn3oeJRdfM0zvmIDkAV+YZcjY1smsoW18XWNuKdhzHjqoT68V
         cbeQI1awgq534t2ZKLU6xE0E6CbRwgduPYgdiSBCEdFmsWq0bTQR99BqOYVhJs2tnHYI
         x1DxPUzvH3AyiuFBk1pr0h7jAiA1q9u2Y5eC7XGVH+CN1IK60mfl6eHJV14yKSyb7hiS
         ZNjGEviUTD2lt6l+gMbnY6g8MdnlsMi3fsx1SpMaVBBbtAi6qssHzGkej0PXqeeXvWi0
         arWA==
X-Forwarded-Encrypted: i=1; AFNElJ8vPsV6+/xq8MPyurRZc48n62PgBqoim/Heyc3IzWqNRCr+HkFhhMAzgbc1UdYnStMmmy2C8MrPkmkT+UO/L883@lists.infradead.org
X-Gm-Message-State: AOJu0YxyhNPgXMgoA/roY7aK17g2t+A/4QXRJ8XFfAL7ZcOKBAYKYgv5
	OxGbQNTWsmszAx4uZePFESVuvUglKDB53OxxJR5ZtyAt0y/Q1tsm+bcTu0o0o2ChMkzhcTh9Jpr
	UF3+CEbkbow1YpVvuDc+MYQtGm1ZQp+hTWvIhc44JR6ECU2k5pSAnyqtALhEMOiPYDkbuOMaizU
	y7dQ==
X-Gm-Gg: Acq92OEDVZkc/J0sglUAJ0JHa9vudJ9WwEBXcFxIrx5lTW9BK6BMBWDDx3GWSnpYpg0
	V9ef8RvStXwT9dDkc6WBRVLzBKrV0ARi5HIPc06YHMS7GcokYyYgBBYHLhZkyenthNejGWSfJOE
	pFtpY6Ayqe6jqhd0P3iSbCMi5s5pK1oDg06u2wqm5tzqlNt9oDEY85u1klK+9fZs4GI3nQ4KIGL
	SN1C+SjFCr/e4OCT894mD74B/GBE57xwU0gpEmoeS10GzvWMtCCB1qyWBh7degqgyIDvcSwy93d
	fOYYiOlQJ8i9gZ+Sdn+Vqvoy/b3iQSCtwXvp2YxyJuBu8zQiNTDZT+MUpXtqRK6j0IZzZtFcdwx
	tz79XZmG7uZK1SzUFY3M/R8GWxbDfngdQfsiXjD13H3AiR0VSsD8qb/jF6Udh48UOczXwSMDlu+
	+6Qq+s/Cl2paUew0xWfFLtTc1T6RapYDLNtXw=
X-Received: by 2002:a05:6102:3049:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-637a6c2f9bfmr2354041137.4.1778696632677;
        Wed, 13 May 2026 11:23:52 -0700 (PDT)
X-Received: by 2002:a05:6102:3049:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-637a6c2f9bfmr2354028137.4.1778696632148;
        Wed, 13 May 2026 11:23:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:23:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:21 +0300
Subject: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
In-Reply-To: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lnVODOLTo2WpHrvqFht5FXa9gKD0IeWSjwE7+hKxwmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG034q0WD1dU9zBBukSN63zwQflgiz212FH+
 aqfkZzELSaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1YnxB/9wgWldcqDS/btctLZ+d4WsAunvc9HMjgx3vDv+jWuyFXbuto6YvRhbSJRFl/bn6USOWD2
 w+hnbxoLs+GoJtRyQnFJYpcDk1fBoIczXXMR6sphI9KOwzaltd2I60W4bmVoFc5Wvsr4+nemF2Z
 pf0UegE91hmpbV+XvOx/ta7AUoZKVfz0FRc/R5JYhifiw+cSJQjoP8x/tu4Ncj6llXyPrg1oN2K
 eFPtDtsEXLMSMnwoXsQRLn3mVftP5QhLrFy41s+AfgyNdqoTgY07/GFwxWrUKJVCGP4hhGzQE2W
 AnzPdKdY/9NCJym/+SY3fUf2/aD8Ud+ZcUgSLRoY/KMHiWaX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX6JgoZQjXPT7v
 iiNNNESS6zog7rdv5xeYporJQ6DNGoRS7bwHUHfXM6dAZG3ZB0QKmUHU76LlWyeGOrwZ1UWuD1w
 z+NzlIgPOSRr/Bf+3/BSAzYW7/oS8ngGMSnH/oHkPIkMBQQDpDyMXw79768uzA/Ru9Ko/K8sQUj
 xldkxgzYVM+GffeZiVNaIXsCL+OtyiTVgcQBfm89t4o8t4jviRaf9rU5wzTKPzrvdhagFHvBNQr
 yZEjRbAhinPqic9wqWfsdl/tB3uqKgwXJyPoVIoY1U9eVsN7phf4kuINCbBV8HwOj+fVHxnD54f
 MDLNGAHqq8kK70D+JJWoIJBTcaG91KrGi3IiYaoIli9EQ+lFOtHxigO20n0/qoBzoYmJh4xUPLT
 k0ryyWJSmeKzgp1EKQnvoveH44shXvj9RlZMB9V7V3IOmspRPd5uQCswZ6XKRb7ZpS4vDRefdR9
 nG6xqSZZGSxdkKW4KBg==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04c1b9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=-JEBqWJC5KD3P7x9m9UA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: j7c36tAxo6stp5g2ZhWbUJdSCgbn8kY3
X-Proofpoint-GUID: j7c36tAxo6stp5g2ZhWbUJdSCgbn8kY3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_112354_616031_4E6C3C5F 
X-CRM114-Status: GOOD (  21.96  )
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

The DisplayPort standard defines a special kind of events called IRQ.
These events are used to notify DP Source about the events on the Sink
side. It is extremely important for DP MST handling, where the MST
events are reported through this IRQ.

In case of the USB-C DP AltMode there is no actual HPD pulse, but the
events are ported through the bits in the AltMode VDOs.

Extend the drm_connector_oob_hotplug_event() interface and report IRQ
events to the DisplayPort Sink drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c          |  5 ++++-
 drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
 include/drm/drm_connector.h              | 19 ++++++++++++++++++-
 3 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 47dc53c4a738..edee9daccd51 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
  * @connector_fwnode: fwnode_handle to report the event on
  * @status: hot plug detect logical state
+ * @extra_status: additional information provided by the sink without changing
+ * the HPD state (or in addition to such a change).
  *
  * On some hardware a hotplug event notification may come from outside the display
  * driver / device. An example of this is some USB Type-C setups where the hardware
@@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status)
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status)
 {
 	struct drm_connector *connector;
 
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 35d9c3086990..7182a8e2e710 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 	} else {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
 						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+						      connector_status_disconnected,
+						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
+								   DRM_CONNECTOR_NO_EXTRA_STATUS);
 		dp->hpd = hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		if (hpd && irq_hpd) {
@@ -212,7 +214,10 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 */
 	if (dp->pending_hpd) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_connected);
+						connector_status_connected,
+						dp->pending_irq_hpd ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 		if (dp->pending_irq_hpd) {
@@ -397,7 +402,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.conf = 0;
 			if (dp->hpd) {
 				drm_connector_oob_hotplug_event(dp->connector_fwnode,
-								connector_status_disconnected);
+								connector_status_disconnected,
+								DRM_CONNECTOR_NO_EXTRA_STATUS);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -827,7 +833,8 @@ void dp_altmode_remove(struct typec_altmode *alt)
 
 	if (dp->connector_fwnode) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+						connector_status_disconnected,
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f83f28cae207..e05197e970d3 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -91,6 +91,22 @@ enum drm_connector_status {
 	connector_status_unknown = 3,
 };
 
+/**
+ * enum drm_connector_status_extra - additional events sent by the sink /
+ * display together or in replacement of the HPD status changes.
+ */
+enum drm_connector_status_extra {
+	/**
+	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
+	 */
+	DRM_CONNECTOR_NO_EXTRA_STATUS,
+	/**
+	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
+	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
+	 */
+	DRM_CONNECTOR_DP_IRQ_HPD,
+};
+
 /**
  * enum drm_connector_registration_state - userspace registration status for
  * a &drm_connector
@@ -2521,7 +2537,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 }
 
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status);
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);

-- 
2.47.3


