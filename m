Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4145CC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 11:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=13kqIIhvX8G/h4Zyb4Bf0SsyUcZjDX5f8XV6NFySlbc=; b=YQWndqfyYNksd7
	FzV9shz2OCmThiXh1/b0T4T0GJ4oSaj+mrNEf0pV+Wg3nMzDOUvesQ14pEVorrLCtbbvgPTnBkKIA
	oHuXsPn1d3OggEsSdkswHrb/EW2TpwSkDlDNUKMTvhZKcL124JgYYmnQQTyZvS3De3wp7yQ8VKl5s
	bTcscg4Lkh6T4mMF30t25LPQY1sGudEKEV9j53daB9P14K6VKT/Y/i8MNUEAIbGq3FT3CtbEsXZRb
	r+ybFF7m+lFJyKByUm8GAIjho8pNpYSwLUxfM9qHTw8tdA2Dpyuftux4WLc6TxGSLCrsq8gveyZsQ
	hOTdPQCqe0Fz+yd+Cplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiXKV-00000008g23-1F07;
	Sun, 03 Aug 2025 11:56:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiXHv-00000008fkZ-3kBw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 11:54:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5739VJLe016492
	for <linux-arm-kernel@lists.infradead.org>; Sun, 3 Aug 2025 11:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=13kqIIhvX8G/h4Zyb4Bf0S
	syUcZjDX5f8XV6NFySlbc=; b=iQCEe4UBn+zhy5xKBcGEWlR2jONw9So3CdetpX
	BpfErIOkkwKR3hQkvFA+8niFS1/e73tzuV9Vv5XKDWEnXeM12hoo7HG9ME02InX+
	nrmvch2r0vlubkl96JzBpFqC5ACIvESypeZVz0nNhvjLQp/OQxqKNbFX9/vfWGSH
	vGzTsYCGY3yUN8mg2ZUSQIlIeFCZJkG7yFlYKCHv8UrOgixZah5tM0awNZL4CHzJ
	Hi6h3RlmCX52GZYMlEwaS2CGLcgMjWsb5lRLeR+lmcjWNg68J3xXZbjFZWdfJT/e
	CLr2V27/e1xHmODW/9iIWMjIKcHRfTywKdVxCRasguey/7iQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a91t9nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Aug 2025 11:53:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4aedcff08fdso54258401cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Aug 2025 04:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754222038; x=1754826838;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13kqIIhvX8G/h4Zyb4Bf0SsyUcZjDX5f8XV6NFySlbc=;
        b=K97X6+43rPd6wtZ2JyEeBal4f+awetX+51AAB0aFEOwXy7lQc0RLSLViQ0Zp5SMRjS
         iKJVtbHMpfHQjUSwwM+wPagjQR8UXy0Qn/B3pEm+6qqV+npStFYfyEKr+LxbXmafrEj4
         VQ5neuIEZMBneVzS8hqPi3WSzY5bysQPnuk5Kvh2PcV1k0J9V7N3QZO2qNOU3Qn8BsvK
         XblBrAvBW5iZcHY5FAaGQpvWcpVDHP3GRPpxOvsbaiKrMYckLmh0lW/ZJ8wJX9UoJCFV
         T0hD/oTosqgpmXybvTW6PFHDCojVrHAyv5v5rrDcKo0wSn+CNvLDtn0y1+0776gt8dxf
         6Beg==
X-Forwarded-Encrypted: i=1; AJvYcCU3JdbkFbOH6vP5io4RB6MQH5o44OFVOtPaBkwV8grB1AA8chkhv+M7Ji4DCQAcs+VIeiPi84HsdtvXitKeEJO3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3DFilISQcnxJr0OZ7BhwicOvfYEVsPxYAHTK119PNMPfylJbD
	pxZx8HU2MOkfg/btLAFTjX7Schk8JnjEsIZpiSm3FfLaXFoYuGsJp/oizXlvCZhC2pJXEDZg8mt
	84K1tfGHtBv5oMEFajPsu0lUyW4PRAtHmCnpyBX7wZnS4TN9mCuCGbqTJn/frQl/WYPJeZ76DiI
	GPTw==
X-Gm-Gg: ASbGncvXxDkA2Rhl7suunIgFfOSGr2uuQMm8A3VmtcNkII8x092pmBB82pVEZMiwusz
	TY5Fis29nKAsBYy528uoQ6uEWuHvn+e1Jujmr1Tn/RncNvohPctqhWvuuA8mfn9PRwFqLsF1rko
	NGPOnsRCpr/3GnTU88HExJ8nNx1o/Qak6snxcFTibskyYNXCHz/N3l6yD4qsOp0yFq7Il3SWj79
	x3OYfeF1UUdsSJteGjX7QXnNA/SLsIYz00m1o0hYr+Lj+CWjzU9MuTgx31jUVUOiHyfcubgnmKk
	W62Qh0Dl42//MKK2L1PrF2pMpgoxtNtKG9KX6E0GQ+aC5TIeOsvSjf9dEw4iC6h2olfV2u8Z+xV
	NDNZ5+NRgeSDNLvC8KIS25J5nQI6qYT3pGwS4uezKbgTVcxCcniV+
X-Received: by 2002:ac8:7c50:0:b0:4ab:63f7:9a80 with SMTP id d75a77b69052e-4af1098c10cmr109506331cf.13.1754222038494;
        Sun, 03 Aug 2025 04:53:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6F1gC3i9qNqPGQ2+U8UnWuUnVr8S0dL9Kp9yI/T0GmDv1re8BD8ymDZkfYLJgECcFcEOVzg==
X-Received: by 2002:ac8:7c50:0:b0:4ab:63f7:9a80 with SMTP id d75a77b69052e-4af1098c10cmr109505841cf.13.1754222037990;
        Sun, 03 Aug 2025 04:53:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332382a6f74sm13281731fa.20.2025.08.03.04.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 04:53:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Date: Sun, 03 Aug 2025 14:53:50 +0300
Message-Id: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8QWEbzhz2HbUL5CsjbPmWgU/3XJPnqot8B2ZA16nFWs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0a/76XO+afzL5QKXQqM/OCzeVVFxIPW+vrJ85d3iq3S2
 mJucD20k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT2e/PwTDZzds4TCJ3dd13
 K9typZKPcnseh78q7kk6VPCsvHrdXva/obn74nxnev78YTf/W9lKiT7Z061Olr38F3aqXL098ep
 pZcXG5eau1/hnKbfeyjl9dIlqhfsHjisb7SvunUiT7pSwm3e7b4afq/J88xIu2+Aeqy9hscq/Kh
 7JX2LNrvM7wf7rYP5pWX6HM3tdNaclzvMIa9S6brW/+Nu73a9+83ewOyybL1ywbbVSiKq24sk2m
 Y9VXCsP5ptdvmrka7avfYLBe+9HRxZOqeQ+umZ228ME37N6ApLPWtL/KPEpb0pvVug+7nae3fJP
 e5O6RbHJtFSzH5GqLmuzovrMw2bVFT6wunHexnRnlqceAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ctmkzukAO7wzg1wOwCawhZTRD4-OphJH
X-Proofpoint-GUID: ctmkzukAO7wzg1wOwCawhZTRD4-OphJH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA4MCBTYWx0ZWRfX4WART4dZGdkD
 XyYTToEpIOZamIPrKTWBgtAYIpHLpapAoOyAq6xpFdOabQiaOf5NxpioQwf0u3k8W55CnVDO2nA
 xV2xzEbaa6HgNMUpNMZqvsUYg0TQqTBdQouzxOynhXAmGij5cUWvsMT7F7jtamX8cmtsQhRUBEz
 nPpf9plDY6k1GrsoyFymbvgIpNWMOhSQLiYcdIW5CudNBN9pHW2fLg3utg6HyQMpkEFI05NtN1D
 PvOS5HouZlkFm62ZqlUPGHCgdvo0rDSKSAbqkCgQKvUBYL15U5V2FILVPxf5/Cw82aMYMB8Dy5E
 l2xpQYpLPBbZhRiRlPSXDVN++FI7yzUXrL40WlnHnIdtr57tdNJAoTXmD+gK5jqbkajG8Hx9/NW
 xbTN10qzs4Dt/oHRmZDnhfQRG0QurGICboKO3zmQZvRrprpypDSCX6Jnfu0o4LvXSs5+BeU1
X-Authority-Analysis: v=2.4 cv=UdpRSLSN c=1 sm=1 tr=0 ts=688f4dd7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=viR3P9R_XIStfHs_oGYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508030080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_045404_044928_98D3A356 
X-CRM114-Status: GOOD (  12.38  )
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

Use DRM HDMI audio helpers in order to implement HDMI audio support for
Lontium LT9611UXC bridge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/bridge: add connector argument to .hpd_notify callback
      drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 125 ++++++++++---------------
 drivers/gpu/drm/display/drm_bridge_connector.c |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c            |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                |   3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |   1 +
 include/drm/drm_bridge.h                       |   1 +
 7 files changed, 57 insertions(+), 79 deletions(-)
---
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20250718-lt9611uxc-hdmi-3dd96306cdff

Best regards,
-- 
With best wishes
Dmitry


