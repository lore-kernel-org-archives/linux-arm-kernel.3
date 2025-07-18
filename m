Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4353DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=13kqIIhvX8G/h4Zyb4Bf0SsyUcZjDX5f8XV6NFySlbc=; b=hdm/hXiQVgYLiI
	lKvVnU+XcvFR5/rkCZUS8aBoOKWOxVJrJ85PUUAlXdkJCjRCnEOu+VHMVYwdZFcTbsdskP6q4NDKs
	Mq9AN+0lWBS5nJXpRk09AzNORSZlV9ca3Q5weZnJpdAzg/ul0tz3GNivOXJaz1bBrKXAdKtWhcshu
	Jj8QksJchyZQuVJTjtP3iKYsN4Tx7UhMJiy8nPsE/AaQL21oUE9sfUT8IXLGYe70lLRiunhRPiHZX
	0P8jtEBjrrp5A/mrn4dhNar1U2CTNIOpgN6VNEr6PDyFCuv/ibU3EB0X+pPVg5WH/+cDy1z0cufNy
	wiFCh+2vdrm8k8dYAwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmyQ-0000000Cw8y-1C5p;
	Fri, 18 Jul 2025 15:26:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmtf-0000000CvAo-0LD5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:21:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I9qlQf016095
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 15:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=13kqIIhvX8G/h4Zyb4Bf0S
	syUcZjDX5f8XV6NFySlbc=; b=VxzhaWjNb02Cs8EjdF4CxETxfROq7KxpJOKDej
	O6tpWw34I4DPlGeSwh4Qd1BIo9mDYr1T7gJRVU5YgWJ4kmPPioSGGcjIwDuzpu+I
	1e96n6+vXNBe8nSenamcEpnvcxsicaUPjkA49MnC7yU7PZP/bEuOns5LXepDdje7
	TRVsikGQJVp65LX162On9HMCJB4b6OJuCccRsW2hfP3Kl/qr0UZK1ofmZr+c4Fob
	dFJQmjF1qzZ/8AlltQzUMimLiLZeEfDHc+fuF1V7OdNweBDpW3VyMnn96TO87FiG
	Hcb8gLSt5ZxVeKkV6IWyMwNk2Q6Pu+5TsRfE71zFBMm51W5Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47y3tc3xmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 15:21:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e207330a45so332379085a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852073; x=1753456873;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13kqIIhvX8G/h4Zyb4Bf0SsyUcZjDX5f8XV6NFySlbc=;
        b=ZnqTpOjtB9Eejrkw2ioiu0AKrl5ShdWpIBobKIS/bRFvtc8dKkCA0yq0jdkol0944B
         Qcj3B4WyWZvd/yCs8wIOQATiGDnU6qDGyjiEFOPByRt8MkH74iyOkqYYhpjqTjbKPcjc
         hQCw8zhzy1AdTOUKOxKayP8ZZrGRophbfY5p6KwAseYPQn3BbEvzraX++1AaNguFdmxG
         kmKJyb7LpLW5+Fo1JDZJbE7ncU0uxPVKT7ZiuRNxhszswb9Wwj3PAgppIpQYKt6zvhcz
         cZV7oIYr0BKB3XThAXYj7VRtnmTF8IRHnvxyCTI3dJ9uEQkQBvvTePzDTKm8Kohwy3qe
         9FJw==
X-Forwarded-Encrypted: i=1; AJvYcCUbSZEm+0VjhD17Qa9GA7ZYeYGyYoRh/FXVDoBWawrDBTU3sVwjeY5MRHPFhPl00AfBf9tLpXaV4zwmsobqmm+6@lists.infradead.org
X-Gm-Message-State: AOJu0YxiLCrB5VDqmvXfLdXfcS4j10CiL1ly/oIX3i1XnsI3q1S2izaQ
	jwS+O+oEtVEjAPvy7PfX+N22/zUtszXS486zFJ1siS5Qe8MrWZwcqzWZrT8+QQT72Q5+0sCNOoS
	5a535BTkMTHNmsrEJqYBBXaigqyuaRQ6wTwQNCoo3OhGwjwJTuQDE4SUa+D3iiI0QRoa87Bvirt
	+TMw==
X-Gm-Gg: ASbGncvYrhXTn9nJh9syoKvoIbuolQURtpogJWy96ONXAhh/W2LlSzNsRAjQxBsAD6v
	MMXfMgOrpqBqip9CwIcqqivagWL/E83yC7/iWJ4qNzwEOYfzp4MDg8gSKC8tV+BYzSzhtLokIgi
	7ib1m1+K1BTo47+7pa/h2mRAxRcwkCM+hmdIlurDFbwqaUu41FfrxxG2fm8xQXRlJeYUfZ1Dhsx
	Kv0WqoWQvn6p0ibhvJrEM7+jWM2VJn6qkfUxA/QRS7uhP6a60dKphBqnlbUWMATnEdJpi78TaAV
	80mZqyYjWoPEQNqxsyjERtfbcISnk3IABrmQmATHS8h6YkkIbkjgXAuTZYT/ejXsp/npLBCZHCp
	DKa/8P/oAVIWph3oIPhKeanWb9SW2o1Xflmtjkw==
X-Received: by 2002:a05:620a:2145:b0:7e3:5550:22af with SMTP id af79cd13be357-7e3555022ffmr475410885a.16.1752852072315;
        Fri, 18 Jul 2025 08:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGih5HUBirffAz2WZL4QKYwy08DDOZqNQMloXSzP16EApN9OS9U886pytxqNhKO8kzqfu4L4Q==
X-Received: by 2002:a05:620a:2145:b0:7e3:5550:22af with SMTP id af79cd13be357-7e3555022ffmr475405285a.16.1752852071615;
        Fri, 18 Jul 2025 08:21:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91f09a9sm2515041fa.94.2025.07.18.08.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:21:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Date: Fri, 18 Jul 2025 18:21:07 +0300
Message-Id: <20250718-lt9611uxc-hdmi-v1-0-0aa8dd26a57a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGNmemgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0ML3ZwSSzNDw9KKZN2MlNxMXeOUFEszYwOz5JS0NCWgpoKi1LTMCrC
 B0bG1tQByS41fYAAAAA==
X-Change-ID: 20250718-lt9611uxc-hdmi-3dd96306cdff
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8QWEbzhz2HbUL5CsjbPmWgU/3XJPnqot8B2ZA16nFWs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoemZmrEL2Zztp1/d85i0Oy9Zc2oZaO+hb0CQUZ
 ZBKX+ii2zqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpmZgAKCRCLPIo+Aiko
 1Rd/CACs4rPc7tst3TZYIDDeEoQX9zKw6b34Lk1QY82wtNiwp1z7kv5KTqL+H5iB5gH9P1UDiSS
 nw3HcHcejQ5xrn5NDQRYCAtIh+Yk8v3MYHW1UHNxSPIHyMS8SbNufXY3ThYqJMcFkJ5OF+mVlVe
 3nQcukkkQUAj59qsqfWFJsN70YCDBUQIe9qu1Y9Sx6orOgASt4ws1mGKpBEx0TTwa/F5j8cSk1v
 y1NqCttIgJc/n5GDXUbDDzKXUJxU16RWjIDq+u8NnSu8N2+u1+mtGdsTKxEh89zBNGgpILUZhTR
 ybERI466cwrPMuVeppkJibCtOrWqkLHbQsc6qCw9J4KcJ+gV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Z5PsHGRA c=1 sm=1 tr=0 ts=687a666a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=viR3P9R_XIStfHs_oGYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: y6iAwJD6gfQ12iz0Q-PSL4YValxygIDF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDExOSBTYWx0ZWRfX59928wxjIrVf
 pDCoGLZpm2m6oqnyvu1XX/2AKlWV/B/B/s5/1UBYEMOWM18hBlhRyBTh6tnw9Dwfq+UnqNNE9Aq
 S+nFKvrxzEhboyKST3xJZtPoPGS7kT3lgtvpdEKSr44pNq7iqMAbc1j/fJXS0KcZODG3asBWa47
 /Lrb9LjRyLL3VX54NtX4k0HpixmCZ5lCoNAT3BwETrtB5jnrMNbMRZJqxmSE9Z155umfGH4IrL8
 GgYVbsDC5kxYNVX6v5kEl3EHme8RjKGrv6lLSInemHNFblUEgOB5E3wMri9J9wDBggel5OUu3vs
 wjACkxF9SZYTi9hs0qMhRJ5jDCpKHBwyDltpa4PMZGtqqujmALu5cTnXShpk/qMnFnumRjzjNFm
 yAJfxaCGarV0dge143LfrxoHHI/v0d0BvOyHHe8iPhQgAZ14sTrnNL4epMLtgaavEze14YtA
X-Proofpoint-GUID: y6iAwJD6gfQ12iz0Q-PSL4YValxygIDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082115_146378_40FF937E 
X-CRM114-Status: GOOD (  11.57  )
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


