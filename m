Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E39F433CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iT4ySHxd8iMiHVjfS/Pg8NfDAUzunyhUM2tZEku061M=; b=bzLIbkzcJM/6D5EwE3H8wlWaw8
	UlTwG6ibbo3ZINTNsfKyMER2te6nMpQsJoxnf4LirHCCc+1gxo6+Iz5HGiV+3CAaHgN7R9ccwTdEn
	U9LAm8I4h0DPGpv7MUC8ogh3+2yUhC5AZ429sA+9yA6m4pus8r3liIA5d5ipzXCGVONpx6s/q3KHV
	NFICSWT0USsUacev+GysvJ/kMhYUsE7irVkNcN6M4NahcE8u5BtMNQPLz2J/Yzokyzj4ktRrrM6KT
	Ij/lOtILi1cKbFHIFF/mrVyKSwyyZ89sTsivpbNCpFH1E8sIh2f/ny8oIm/eMQKfjY6JH+Lxl1noZ
	afmvHeRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZG-00000001jju-0iSU;
	Wed, 15 Apr 2026 23:22:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZC-00000001jiZ-25D7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 23:22:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FELDaj2972602
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 23:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iT4ySHxd8iMiHVjfS/Pg8NfDAUzunyhUM2tZEku061M=; b=HN9jqGQmz0rOg6qq
	gM7Ah4W9Y7kaF29tucblX1H2+R1u9HMVdLhD4pohGhFPwRkMBxkDz43FDkLMQoLN
	jQkAjCv5F8SxaZTZS/FjIzwzRcQHO4DByVL1mJ86ZL/F/QB+5BBEnAXmjnYKsKJB
	VgL0Bgi15wvGsmuL9cz99m8I2UoaMBaPjB90kxh+yJGJDBwcQJlndgmNoQSOq5lG
	MwNjxpGuAyTfHllF3pAV5L5yZc0RF+gc9AXbHSbIFskv2VOaQ2sbmiiSjOIyl98o
	JrQLvEZy2eW/FpHX4FJwnaEiJzTKcmiavrDodZqk56xfxpH7na6bVJRXKflYmCdf
	FsfsIQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj74gaxb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 23:22:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d63962d83so179342341cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 16:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295360; x=1776900160; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iT4ySHxd8iMiHVjfS/Pg8NfDAUzunyhUM2tZEku061M=;
        b=FMO2GR39uyX+YdJNMeOMQWKmyc5mg2ecUxeo4loPOkJAy2dlXRlHOCLVRZ+uwkjbSg
         kJ6bmhuuSAuOIpvrmzo5FbsGHFtYZNzs5fxzz4KQecNns5bQKmsZQtxngeLLlSjL/2bI
         JVCXu04p7hso9Yl+dR1nY3j3g4Bxkj/gAJrwAWJ65IRYaL3CwMCCeuxtnD8qwART+H18
         S2+TN9AjL6WUXfZGpYtDBMV+EaQghaOtEOGRspGGh1JNgE3YL0g+B6CChwG5KHTHnzhy
         IglW+K20H3iCGn7ufDZKRh3wcQI6IyfGKAlk12Axbh7E5JxVWUcJbroQe+yMUKta/Ovy
         ADCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295360; x=1776900160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iT4ySHxd8iMiHVjfS/Pg8NfDAUzunyhUM2tZEku061M=;
        b=fi7+i5k7xwwQ2nygTR5NjYGheNUtwfVuBK+gT++9OlbmIJhtBOAgufsZSLb9mWlCOi
         bjKfMAmQCakO+p4Lf03eR55hjM5uEUxnj8Q8uuOjDATRO6r/slrYvNeRz0F6cjh9cCwt
         Dvq01P1AZm7OZmOCxXNT0/xQqz1e5IwlrCQFScdqitx+hhb+WFNtoV8jzCAGb+tj0iz4
         9IH6JZ2xsCKlLtu/APe1RFKtLcMvuf2v1sJN0/8R0I/BPOmMQ/WNPCPC7TfDv+jzfRfy
         r0fa/Lh1d2uEjf/32Hl71HUq9z3GOLpL1PW2w5Z+FxYPjynx8YSUAABy2w3VplKP7VqB
         UVJg==
X-Forwarded-Encrypted: i=1; AFNElJ/HfnvoybvMpLums925WuCGfdIkXSvdMruAgWNakJBZNXMzD30AG0uq6UElG/iXhB5QQ8cL0TVZoP/WRrfGiEVl@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq/9E/sDqnf57it1HUGfrnHIv8zibVeDzBeq06wEx5FOv04FCC
	pwUs82vduA0cid/R7Q98DxUqlIEwOFLC0dn5n4byJKUxnxeUY6WXOUgyr5tybdqpCT66DWix0SM
	E47/bewct+QkIHcoOorKWjL6gPXsBzB6XUx1z5HgI46ab9pfnUBUNqSHUQ6SeeAkabDZXBnmcLi
	+n7w==
X-Gm-Gg: AeBDievrhkEF7XCXEbXTtfNU7Ug2YxeTLNer8i2iZOfBYub6xEH8NCWcvl3pTUS9I3R
	V+ZtxSbW17DYcP1UUf4FEvb2CTYN11TrN3PEd5Q1Cy58awyZT02fqXkVGgXC4BWqvDYXQJKmfRE
	GrbxP1aE1FftQjbNd1kZIyLlnI1HKi3/azgdo79KC3tITv9DUdA1WuizvOuoNywgHOSUOIP/i46
	PYgi92fifQ4TrNa3U1k5YZ69jxYwThuQAMG2OxI7B0W31KTIFN0UrWA6TIZUzjri93ZBdBZd0zy
	btSqrg51OnM7aWDWXy+urk6ALJP7UmCrTpw2Gh/MaOa9hHpVM+5xeLPAKxNqqLLT5z95zpoeWge
	oRbCvTCobAlyKwc/xOtloIuayCa8MEXYouL0tKuEIY4DQSXEvdD9s9IN1O5pXFCGChFdeBDOKHr
	EK+PJdM1rv6iSya6jSSVvz+WYPNdURSbqYB+shgPy3Jm0mkg==
X-Received: by 2002:a05:622a:13cd:b0:50d:c0c9:c985 with SMTP id d75a77b69052e-50dd5b30efcmr356728571cf.2.1776295360525;
        Wed, 15 Apr 2026 16:22:40 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:50d:c0c9:c985 with SMTP id d75a77b69052e-50dd5b30efcmr356728031cf.2.1776295359994;
        Wed, 15 Apr 2026 16:22:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:32 +0300
Subject: [PATCH 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-hpd-irq-events-v1-1-1ab1f1cfb2b2@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4349;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=J3Awa0W9x47e9VDImgKb//FhRzSC+4krtGr/Wy12gno=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+YD2Z0/KxXy+84z8JxSP2aQ1M3eUcvU9ilBtXjR/aqj+
 2Z3LuboZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEegXY/0d62BYrmU3n/7zq
 w+ajokINzO7HGphf9f7u+KVYY9GZPPPd+dPrFkd72JYIiEYv+Cgyof3QC9HYhe8y7N7v8o55f8f
 3X2Ke4BGewnim+rd2rxrcf07ba/hJLfSBAqcl671TPhwNIbvfN0euXzJFsjR5bzDT9YdzJh+Ym/
 DrT8lMr/j1XxkOpW5ULS/5e7N5VoX432Vz5+0VLIppu617LG7ZrHzlp8d/Zss9j9FTmRRq5zq/c
 aVoRAqT3bZowYyZno1Hlf17Mu6zn+s/mVhZfvShDm/vs2P85XszgkUDjLKetR15xhyY5ufn1Hkv
 c23zbjeWi9birs2+dzzKg7olbd5uy6nRu3vQ1+Tx4h1/AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfX7GFkXlPiBprJ
 Q+FB0vVttzswvJoahcxTWPgqnhbTv2AX6+R+ZUxeym8AfuM51w0t1pkfor/05eqGx7xoUbJ+cJ6
 GL61chz89oAh6fLa2CMynpOpAI45as9FmTLMhYAY7vlTFvMjrF+FAs5v9oJPFKGd/lAT/N0tcZR
 ZlKDfe9tfWnnxA2dmlrl7r+4eoy4HuPisRaiWT8itRoDUwWwdIoh4h4Ig5wpbhwuRhUH5uqzH6x
 3uMoU13/YXJaE0QfcWBRxtH7m30DRlsIf+dqRmV6FJQVRj6GexWImfri2NEUNaJgRkisWXc3Rh1
 MZOuPcCtYIZzOve9YB/tK91kiIdckYXQ7S9bznX3GtFGuozq4ayz8OwxvTE8hY6u9J2IVDodF37
 RmaySYYJSbjaA4hrgwakbuZxDkwVs+HxkgGgqJzL4omPrxesBL4xS96nldDHTFkOAGoO+4kup2i
 HE5jfU+geM0nLNdREOw==
X-Proofpoint-ORIG-GUID: -wjMZMeyX3Ovo5LAv921Yjkc48BE77ZR
X-Authority-Analysis: v=2.4 cv=ZIfnX37b c=1 sm=1 tr=0 ts=69e01dc1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=TP8XqTAxF71JeV6NEI0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: -wjMZMeyX3Ovo5LAv921Yjkc48BE77ZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_162242_661034_8C465470 
X-CRM114-Status: GOOD (  18.90  )
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
 drivers/gpu/drm/drm_connector.c          |  4 +++-
 drivers/usb/typec/altmodes/displayport.c | 12 ++++++++----
 include/drm/drm_connector.h              |  3 ++-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 47dc53c4a738..5fdacbd84bd7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3510,6 +3510,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
  * @connector_fwnode: fwnode_handle to report the event on
  * @status: hot plug detect logical state
+ * @irq_hpd: HPD pulse detected
  *
  * On some hardware a hotplug event notification may come from outside the display
  * driver / device. An example of this is some USB Type-C setups where the hardware
@@ -3520,7 +3521,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status)
+				     enum drm_connector_status status,
+				     bool irq_hpd)
 {
 	struct drm_connector *connector;
 
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 35d9c3086990..0cade62da905 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -189,7 +189,8 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 	} else {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
 						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+						      connector_status_disconnected,
+						hpd && irq_hpd);
 		dp->hpd = hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		if (hpd && irq_hpd) {
@@ -212,7 +213,8 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 */
 	if (dp->pending_hpd) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_connected);
+						connector_status_connected,
+						dp->pending_irq_hpd);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 		if (dp->pending_irq_hpd) {
@@ -397,7 +399,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.conf = 0;
 			if (dp->hpd) {
 				drm_connector_oob_hotplug_event(dp->connector_fwnode,
-								connector_status_disconnected);
+								connector_status_disconnected,
+								false);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -827,7 +830,8 @@ void dp_altmode_remove(struct typec_altmode *alt)
 
 	if (dp->connector_fwnode) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+						connector_status_disconnected,
+						false);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f83f28cae207..e8e7e6c9eb5c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2521,7 +2521,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 }
 
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status);
+				     enum drm_connector_status status,
+				     bool irq_hpd);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);

-- 
2.47.3


