Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6003AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CY2/kYZwMHeTEPu+t0diQLOY++1sPPgUOB5KtcADCTU=; b=Xmou8EmObZKkFwbLa+luA0yzUl
	2GgCq049+52wfOs4wNg6t3FY4fbYYlFrH0le7SDNHhQJC0v2t5gSa/8TexNNdXJbME91PlEP3/2Vv
	cA6FfBAM9AyWsoC7sdS9i68a0xIeXTxtXiQLzSgdUW49KL3/n5t30iKUcNDH9uuyf/JIY6y83/zC6
	UsUHgGYjYUNWi8IgSge9qPCtCs38LCfe8NPojF1O58Dgt0h/ISjTrNGMlYFk2d6mOBTpGpGZHjwl9
	nuM2RWlEoOP0aAilQQamtPFjzfrMU6eo2SqFJBwp0mEyzHAUspzUKDWIVlJIa39S+8UVxS9AM+RQA
	d+xIg4dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDHs-0000000EwBI-3lR9;
	Mon, 29 Jun 2026 14:48:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDHq-0000000Ew8B-0lQz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:48:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT32W2646903
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 14:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CY2/kYZwMHeTEPu+t0diQLOY++1sPPgUOB5KtcADCTU=; b=WrcmkiIpDYknkEZI
	H+j2O7fO40qENvHj6R6oHycIx8MDrjWg2Qkq/8s7DWV29k64+lAn9AzTYRj31N2Y
	vQ+sN8R1BxmqGmR2GDUvLY/ZXrmCWye8DbhOrAIQ+luyLHQKsWv9OgKYatTr9BSg
	HxL9iTXwG5g7HmpNIYSadf5xaVHoBYYFefgH/Hw5ckX8GheKj6UUuykNJm2MFT5/
	Nqn2Snu94rZIUFsy8bVhxRPWlaAU40zBs/0dv1OkNu8iTIAMRmvPMhakqYarM6SK
	jsCILGRDadnx5edi2wkVcg95XyY0RJ9Mpko8wrkwVcb3kXeBZIu11DT7naqhBgaR
	vt4HXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tsu6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 14:48:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92158791d14so441247885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744517; x=1783349317; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CY2/kYZwMHeTEPu+t0diQLOY++1sPPgUOB5KtcADCTU=;
        b=OtsgSt3MinBNC7halufFryuW/ZiziVzi1x2HNCBx/3pkNEHi/80jEzC9JLnDrmVrYK
         wL490jlW9IAyXeEjXflyu5uScwVb19Y+qV6BEWtiSRzwjyFL7z9ggQUQZuHEE0ifdoXX
         I9Oc1E4SEvEuy83MbZevcu+RNODdYKMWgsOTCAVjHMuzzmVdBBo0iNl87LhCwW6vSh2g
         9qI3f1uoaB9b4I5mjbQnCCzmmjg7doDnpO7dBH/eArnEEHg8YguzKJqnUjRZRsebcapC
         Yx75O4/HQLJVh/9P5Jhde7Q8kkInCGWiOq/OdPMhrQOjZiG9gl8RMPqfFoI13onG+oty
         jvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744517; x=1783349317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CY2/kYZwMHeTEPu+t0diQLOY++1sPPgUOB5KtcADCTU=;
        b=b9zzTZNXpqoE6zbKh6Sd3sxnpMF3RUoEGMxM5t36LmqWbwbjicNZ1Pa8QT/DzoIL2N
         V0Wj2sxXjgr/DAnkocvH58ttZyAcDLXffi2OsU7LPgyEiZzbop7UGAMTcBVRK8tMfaXX
         LtXMrjhG9XSmemd4tORgEOdsosHr8JorEVi1EYHZSta2UKwFQGUgg3vNHmFLl5CiWk6m
         OceGL+EtmaXSjM7igvRehBcMwdVWes24cxS3Rzdtgc1Mk5/lufmXwnJDtiwSJx3T46hO
         Fak/x6oOVTRh9RWEHKW7jzNiJHHqww/rBR0k7DxtEaNfoTp5JvJrybvK0H0nFKXVKE0s
         Zcdg==
X-Forwarded-Encrypted: i=1; AFNElJ9Jyh9DYHVJ6asIfermMSB4HR7C4gZItH79SMYJVsxg61dnU0SPN3/I7DoLDCaI1zr2QtbY+rUQamVlAfrw3pZb@lists.infradead.org
X-Gm-Message-State: AOJu0YzDTbgihbQW0cSb+JTEhzR5AqgBzdznETDrtozXUxONvE0HuQeR
	odvbpZ2HGP13zjdbWmSgXLQFVNP2+m+IInJAuO1MsgzQnMiwPyUVRp+cx/PIN6AglORpFSw3FdV
	/JrGx+KIIMOmzK9Di4HC6e/c0bQKFCPsnC+gJ2G3jXHX+O+eCxx7Cy/HB1juusF+JfF872ZSVW1
	5XjQ==
X-Gm-Gg: AfdE7cmvPrOHHVibLnVNjJPjAj/BLB4qpo8gKDKY536smNZk43PVWsAMV6cnGIpWeVg
	MOdntP+TSFtwcJivVRHsXVaxEyGUudeH0DH2VecNOQoSLIZF0xT8LVAAvGYVs+GNOHa5Cioohl7
	H+S1xsBE/z/zH8yYF+nwvwGUbbSnTB+eWWGE4pelf7iOGcAdApy3sA4zUaZW6spiRJPY96O3IpM
	NzKXiwGqBUAfyN1WvvErpODMl7CxklYZgtuRXpmVXPZxfMILQDUS8Z7WMzHY6M1gFGZEs/157No
	VSiIYCnk9W1NEoMmyWwZT5XJ19Pk8cLFKt5NuVRTBEwy8Lue7v616VEOm2Ij1GtekVSCfRwqsJY
	hWZNF85JZ6y+mMKFgfSX1Yvbhu2JWIX3ZiuL6Gv+SmMWsrOJjYc/3jiJwYgFejrmyTly6w9LZOg
	==
X-Received: by 2002:a05:620a:199d:b0:92b:67e6:8ac1 with SMTP id af79cd13be357-92b67e68c82mr1371994785a.59.1782744516572;
        Mon, 29 Jun 2026 07:48:36 -0700 (PDT)
X-Received: by 2002:a05:620a:199d:b0:92b:67e6:8ac1 with SMTP id af79cd13be357-92b67e68c82mr1371987585a.59.1782744516014;
        Mon, 29 Jun 2026 07:48:36 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:48:35 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 22:48:04 +0800
Subject: [PATCH 2/5] drm/bridge_connector: preserve connector status for
 IRQ-only HPD events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=2538;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=zCPPIEotdSUHd8PwFgThC89TK/453vk/QVgAmXnjK4c=;
 b=EFccj6BHEEeRrzlWUTbw8BogiRwObxZsIqPHY+e7jjnG7UU6Nl4UC2X3L1RNMqKmEJgNMp3Fe
 JQsCWBXPtSOBQ2IDWOHleokIGMiYwdCc2UgAtX0nE8b8obM54A+uwE8
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX3PJYoDONq9r/
 3VgQHhS6tecDB7wpcjpHcwtWXAFUKAlfGVQcvOBIPYoWKE4GTONqRDm8az0shu4Rox0HBw5GeYD
 Wv6gRII612V9ofMzzZ5eaVf0wQIg0CmToYbhWN0awHYe/H9ZUT86dm6bBI1pKjm+tIsjbZhiQwn
 qex3vKTYBchxPvkOJHhdA/FDPlyJqXfaHqeiKbetCQZ8p99CK/escnJh5qbgQr0zsV6KPJAFd37
 uWULYOAQGz9Wwk2kH8Gpzw3GHBmNYA3OSPwOncfo6kqUBF6WU4QTbvE0943F5VNKRQ8rvUeXI0I
 vNL5L2ONw7v+AapxdaT328kYMQrkDpE/EBcsVwPDwK0u1JEgP1daMxBu2fiAKB8wCPGrpxQ/doo
 ZkRYycZir8LrpaFcbmM9RbeNVOxjyGejGX+hR0vyZ4Zb3lq/H7WbQPvIihEq0Tee8j/WUWkmveW
 nwo/LpmCgWD5hTiSBwQ==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a4285c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HhJCdNca9OzhlWWnlXUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX7ljfnqSTWWVM
 tiwJnhhnkiyVfCWUEIz7StnMS3dqjSoFfMu1GGzwzAqdRT+1ELpUvRZtIUcdNkJx8+44lJvMecv
 rvcJpWuqn0OluY01K9x7jpnQSxyiUXw=
X-Proofpoint-ORIG-GUID: 1w8chnFm-bquvgo2ox6jKtRFR1EJc0oc
X-Proofpoint-GUID: 1w8chnFm-bquvgo2ox6jKtRFR1EJc0oc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074838_229243_411F358F 
X-CRM114-Status: GOOD (  16.22  )
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

The bridge connector HPD handling path currently updates
connector->status for every hpd_notify() invocation.

This does not work well for IRQ-only notifications where the event being
reported is carried by extra_status and no connector status transition is
associated with it.

One example is DP MST. HPD IRQs are propagated through
drm_bridge_hpd_notify_*() so that bridge drivers can process the
notification. During MST operation, however, the SST connector attached
to the bridge connector is intentionally kept disconnected while the MST
topology manager handles all connector creation, removal and hotplug
processing.

Updating connector->status for an IRQ-only MST notification may cause
the SST connector state to oscillate between connected and disconnected
depending on the notification path. These artificial state transitions
can later be detected by the polling logic and result in unnecessary
hotplug events being generated. Userspace then re-probes connector
status, potentially triggering the same sequence again.

Treat notifications with status == connector_status_unknown and a valid
extra_status as IRQ-only events. Forward the notification to bridge
drivers without modifying connector->status.

This keeps IRQ delivery working while leaving connector state management
to the component that actually owns it, such as the DP MST topology
framework.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 5edca47a025f..7334d6677604 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -163,6 +163,18 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
 
+	/*
+	 * IRQ-only notification: extra_status carries the event but
+	 * status is unknown — do not overwrite connector->status.
+	 */
+	if (status == connector_status_unknown &&
+	    extra_status != DRM_CONNECTOR_NO_EXTRA_STATUS) {
+		drm_bridge_connector_hpd_notify(connector,
+						connector->status,
+						extra_status, NULL);
+		return;
+	}
+
 	mutex_lock(&dev->mode_config.mutex);
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);

-- 
2.43.0


