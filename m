Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B69F588EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=; b=SRsZxoAH/kkKtLIWV+zM32TRmv
	nT/ZPU3OcqWO8tVIIIqCC5yNLIcKFdmxqLrNiUiMZxp9bz3eNf2W6xacNRoiEXG+vgtW2HQj9+iyP
	c0vZ1A4/5bTRu4pvTYFV8epvRwVPj0am9GMR/+RJ2yCozd1p4FSAzRJyVnvSuNiMbhQaPN7fZihxU
	gd/DBILTg620eCoUzvgUB0nwQyiw0PEEXnFBZFdRz7u7O3PGQoyX2Q7YcylWMApUtRE6zCMffgTHw
	oUAHHudvhANM/UlWJWHZPoZ/kxjsfPMQoqDaB+xWZv/BJM+K9ogFqnHPQIn/hCiDWsJn2G//iptwX
	I3sZLrUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqbH-00000007I4i-1VkS;
	Mon, 20 Apr 2026 15:31:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqbD-00000007I1H-0EYa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 15:31:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KEviM22281665
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 15:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=; b=lUIbGvQZ5qpNp4Gr
	QY6vrMBwk+A6tYOPjjoOHnbdSdN3EyYfSEgfbOzFlvu/aTF87y02bKmkxi3fhzyp
	ZLqsTfOcH7bUoEfoDkeQdsfcrL/2WeOKCs5wzHFizkFr1jcHuW/DkpzDvgs8D8TL
	m2KsoVMlz7UD+hSPF9Sjown2QTRx03z8jYu7KvlbH5Rqm6hn6lViKzI4O1Pl8sDG
	o1MP1usTGTfAD5l5lQuVBoCYh8k2z37Wbhvz6YbAXZy6BsuSJ6EDfL7lQ5RZP1Nr
	yu0VyVqqrDy56UkKqn36L/WUrK0SoUC0KJzEM78z0PIC2Y+hZ+8s4m24sKJIanIh
	Wnoe6w==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh599e4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 15:31:46 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-479d602f323so941418b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699105; x=1777303905; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=;
        b=V5V8OU2ZaY+YoF/LQZEMtDn8FAlXSgg/DO7OstabaYW03bRNOixLZJ8tP5KzcdtfOF
         MxBI6NEAXtGZqvUEtaGrC8btQxI0ILFbAKTxgnEya85+jftNJILhlqoIwujHYXwSx+qD
         UzSjfa/7F0cI8/RoS6LZOwrDA6eOvF2JS0rKHq88LzH6CviqzWdnYAKbYc9NJj42LIlm
         oq07eOqYAhsao4VERPYnewQ+yhPD7n1bef5OZxgXfF7Z8v+EA8DvLQBWM/v1K/UMiD5N
         rvFkVQvoD0O13YAeXGkxT3ygvP4cAtgfuc0X+DH0FWzEqkC0aS55ZFqoZ0OXAt1J5isr
         k0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699105; x=1777303905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=;
        b=Xp6C2I3wy2ZQj6zHxbw9wSHP0bLjtOi82Cchx5wJTTJ/oLWDP0E0yVMDqbiZ8g7Z7T
         EE7FS6D37N+CHsW+7zm8WyMRD8LjTYBWsSYi5+tB7P/7m2wF5bzEmnma+h8cxaaKtgZm
         z6NwBTITid7v//J2bI0EXGY5TycLB4Jk9JMyXYyUR6CJ6zx7kpN2/C20Ge+73OEY/0Hj
         xrSTkfjKdxjmunehNd68WB7n6n0AG7S28krNXLbrmbK0BPmG1x49/3znOXxqI5XVmeRk
         GVJoGwdWtgqaq/GyWzny5gfzmsXhJfGmHj8EIfOtBqKxdDoSSZeYNZrHU/+jC9ueFJrY
         3hiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bs0WuOtD+1x7hYuXpDjzM7cgjWs4UdMJcur2jHgBsCuE/kel1FzCzmcPX8sPIXVg37A/b5WBLAIsfely/k3Td@lists.infradead.org
X-Gm-Message-State: AOJu0YwcHZKzFcjNxCMg6JMHyp4q/NcTqjBJhedL/fKMb4GxUu5ej+hC
	4yI1r8HQCMnPMj8uByRt/f3GgtKnYOvPztBrxv+TPORaCMogrt7pdAx23TZDqydu6XXbF6JShCv
	ShN1k30oCg6uDrm26Ptcw11NiLzRQQRQwK2w4Tocoh/9wKkKOnHX7y38ylWP4MHWSSaFvP4NAVL
	EI6w==
X-Gm-Gg: AeBDievzpiSFvoNNdE9dKZXT8QRvTXNz+l7v45GFuTv9hoAWoxkYm1cxYYnR1VRHxFy
	wCTpD5UaXUTuzoZX7OBG03qkdBw/7SYp3bYE4LL0vvJ+FnT8xUPZ1BzWm94ac0shitlPqm//uiB
	2TD6MKqXze/+z7Oxw1iEZi0Q99mVHJE37zSTWfJzV7Welc1RMQTmTLSReq105X7wSuNCTPVlepD
	Dl9jLDRM4QXCWsJEIkGHlFUzxrsmiKuVrlaGAYyhyneThA8qqJ3jVdUEYkhhR1/dglRuMTc47EM
	lt4ohGyXUANz7rhTrtxDt93ww+J4zJgSvL2bCWg1h5CIxWVPfNtVQadGVx3m3diBjM0aocVq191
	Rgrlm0BkCYRU8gXILRl5WwTEqmgXRLIJu0BpBqXFhpZtdrltg5A4zcRr7UP72vzMPfXIUgdztk4
	+VKKA9idLfLzvZCcgZS3O+CWJVhgHbYvQN8qYaWfNwTxxBOw==
X-Received: by 2002:a05:6808:2448:b0:467:db23:25c with SMTP id 5614622812f47-4799ca83a59mr7243599b6e.46.1776699105199;
        Mon, 20 Apr 2026 08:31:45 -0700 (PDT)
X-Received: by 2002:a05:6808:2448:b0:467:db23:25c with SMTP id 5614622812f47-4799ca83a59mr7243507b6e.46.1776699104557;
        Mon, 20 Apr 2026 08:31:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:31:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 18:31:39 +0300
Subject: [PATCH v2 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-hpd-irq-events-v2-1-402ffe27e9e9@oss.qualcomm.com>
References: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
In-Reply-To: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lnVODOLTo2WpHrvqFht5FXa9gKD0IeWSjwE7+hKxwmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5kbc/UNMXpIQgQu+RMvj2dYIBCbr7675k+ZbB
 1bJy3KI4xuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeZG3AAKCRCLPIo+Aiko
 1ZEhB/40fMwfOsuT8UnELg06dXKJmgx9BwjiERV+6ig4vkQlD1N3pMzFrTpR7ZV19GcfER4uBAb
 mhH1u4t1lQPCH/rYzpC8djiuPi598d6eQCICO45jiYBrWW2m/5hWcc1ACFO6LwpEJNAMZS9AJTE
 j+Zl4yyKkFLCFRwPOIKR88dQp2S5TYCbs9dHrEQPeNXrhvp3LouEZ6NXq0xRvDGczDb4zKk4GNc
 a4TA9/WzbbmISLLs1bNG76+FGXHvATVLYt+Q/LC+/CBuA1b4WSZzkymfPFtaT3QUMDhR2DHmk9D
 4iKNimC7DYMtYIj+iG+/H2jJk00Ad7W3ys+v2IZuw5LMMjFa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: AWVR3JVyjT-XV-D78QqvUKL1UxAim08w
X-Proofpoint-GUID: AWVR3JVyjT-XV-D78QqvUKL1UxAim08w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfX+dbovTVYrmY7
 o+nk/ZYO4JgXN3tIQ+SRwJEgF4F+hBawotptISzHlezxypsROQTztqArTYY7rc5PXXYsEODr4Bp
 lW0CX0n6/O+x8j0336h9/wBa08ArVFvIp6iOUMGLJI3LSyxFfEF/IgeiymeuWVAvjPdABpCjqpX
 RiReCf+Ga9gmWUjmdHH3WV3B6Tq2ez1iUHxqe6W/Baj1+o8uDDsa/e71ra+SQABg1YDpWrrFjXY
 OrXZV4ljUfeG2sIR8fI+m7FTZVS8OMdb9oyKtR9fl310QIkVUIr8J2qqClfCPy1r5WGL/zF+0/b
 sHrcXx9CDsXMT4sAeURfGusAiklLOdh1SZ49973MVfcvCPE6unp5YgNUaYJNxfg5Jc/5JsBvnkq
 J3aBYbLVkLHMvqAZIX9s5mDbs+ogfbqJFoXm7+denaE8wdnWrPCTrTb6k1Pg1hZnpEiec9jKgzO
 zgE9A9Ip2DFKiqsNxtw==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e646e2 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-JEBqWJC5KD3P7x9m9UA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_083147_225462_10D20558 
X-CRM114-Status: GOOD (  21.61  )
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


