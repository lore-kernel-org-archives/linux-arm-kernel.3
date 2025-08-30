Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBF4CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IN6pTMVXIP/HlenGwHRNNUK4pAbKppfkJLc5GQ+V4dk=; b=RO0IopsHyYF0+S
	bCLSAYXEVTHH1k4rJkJ0gJYRTdAfYVDWCQnl9WxN4rFRHwcfvlZ7gxMnmuTpPXUU3u7Dyf3fYQscJ
	twaw9qate9oXJjAshzOLz7w18ROu4ZvC+npMiS64UElOYym+1vDAh0n5XyAHNIKmhw/K9Nv7eq7Qs
	U55Ib4eD4hMsaWUBURFJiCkqRbCg14ELtOPD1ahyw56KXi5a0MkkY3P2lqDYgzFofzcG9VDj0FObt
	5X6kMnrLvHfxEAyfmFSmsiSghYFKBA/XaCQANEo1yr3L2crvoaMf2E51CGN5yi/jHlY/ypO5twJnD
	j+rvx+y4biB9F3mnCqtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9pt-00000007EDh-2eLN;
	Sat, 30 Aug 2025 00:52:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9N3-000000074UW-2Zdt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 00:23:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TAxZh8003041
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IN6pTMVXIP/HlenGwHRNNU
	K4pAbKppfkJLc5GQ+V4dk=; b=o12dTTKNN6jLOc/Zc9GjC8QFtOr6OY4ayJtqWF
	61qJNUDD+dOZ47GtKiiRoD+XQgjX9sMYPTblN1Zf4TxXQPGKppJKHrOs6KB5DY4L
	fx6Ijclr9LavmQFUfv/1GFOE70+UWHBbODZ7SaRI74d1o/bo7XvlidvgiF/bXv8T
	9hxDjVEg1zj7O0Usu1c5UiOuwELRndortQVlB4HmuwKPFbVIjVt4zagVjBshNMLa
	4RKRTer1RKfWedqgaZ1QnifY5NpK/agukFqwcCeZxZy0TwZ2xvKdKS8IrUO9ZBMy
	Tf/gnj+b4515XWSkMIRArLIBJzhHhG3p0ZCfMdYfwT3dr2fA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5vvnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:23:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b2ecb8e64bso33279261cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 17:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513383; x=1757118183;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IN6pTMVXIP/HlenGwHRNNUK4pAbKppfkJLc5GQ+V4dk=;
        b=fo2KrIGpilGuflLviR7AdnaEk0RU4zHKVh7RTvfizyLWy6E04NE6s6OPAxrGw2tvZg
         fmFmV6RLJGqAMtYUza4V3NBLl60rE9RM4QNOBpjnzlcPZ5QekX4Xkfdm7h5dDSvBKZ5x
         whJkabAWwLWCdwhyrMfpA66zECxGT20OuuGCbXwLegqiauj7BsXBzygb5RsbOrlzqxLX
         +fbZLDA853L5eb8jSr/lJDNkTJzObxuVX8R8zW0QbNu6+xUGNiWRNbEBHXb8lF4YTi9a
         ROh5jL0an0gosnZzZYP45KMjATMYyLpY8PN/cSwYLTUObnpKhV8vg9D1wpIyx4EOgyMJ
         OTYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwYKT0HLnMhhgW4cwmL7L6B+EYLHyktqlloPt6mRVDwjjF8LF5eNxhOd9C1Zwc+vRbkDYQm/E9buXhFjiutCp5@lists.infradead.org
X-Gm-Message-State: AOJu0YzBmNTThhQP/FoN1n9FEzonCIStavhGtR8MpQSBIIv2EbohcaAV
	AQ89r8lWhFnud6K4d8hwkbc+GrZwufn8rD9U4AlKa72eOgl99UIYfy+A5qkxPW76tWil5DVQquP
	/iuCklMvpb9CAFe4EOxvmmR06h2wrTY7a/3Bm23J+jZbkAQmoOHuFlfTuyFYbsyafCsOcnaqCnA
	o6nQ==
X-Gm-Gg: ASbGncuhpoaxHnY3k+FfrdxZmI0kBJ0YvVf7p48Ts9KR8L/tVSNNEp7oPF92bo0zPDu
	8/d4pHxmSAkzT5zK9yti6biog3kLN6dO89KSx0sL0KX0VWvM/7UIohwBuyIGogswxaAgB9PMR4v
	raFIaTHzsSv4gGhr42nrMwfuH8pE3IGtU+osJujralbmzGti74GyQLnNljs4SZKfhqAmwlgNxOl
	Yd+6W8JbAyHbsfb5q4UiXxC1d7/wujpiFCJUqmeCfKd0yF95dr5xxsdc0Gmdw2xso0/99Zgsru7
	TJcHFFFKNe1nubBTZkuh/CNXRqAORSGSYXlqcvzsuvptLd6rZWIannCqgAAqQVf/7gXrGjHgNSu
	6BZBS4dWyv/gTVGtM+0ydXhOuzCMKVymIsIAilXGIuWeseUSp4KJI
X-Received: by 2002:a05:622a:3d0:b0:4b0:8e2e:fd9b with SMTP id d75a77b69052e-4b31d841b8bmr6340831cf.28.1756513383062;
        Fri, 29 Aug 2025 17:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9LDaqfPkXcTKRcfc1aA44E7iMFC4s0jpuyP6SEvxDgqx16wPnVQjbJmp4eKUiP/CaJNa52g==
X-Received: by 2002:a05:622a:3d0:b0:4b0:8e2e:fd9b with SMTP id d75a77b69052e-4b31d841b8bmr6340331cf.28.1756513382427;
        Fri, 29 Aug 2025 17:23:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per driver
 capabilities
Date: Sat, 30 Aug 2025 03:22:56 +0300
Message-Id: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBEsmgC/3XQwW7DIAwG4FeJOM8dISM0Oe09ph1oMK2lElZMo
 1RR372kVaUd2gvyj+wPi0UwJkIWfbWIhBMxxbGE5qMSw8GOewRyJQsllZbbWoNLAY4UKAONPvp
 kAzKg2SpvjW+aVooy+pfQ03xnf35LPhDnmC73V6Z6vX2C7WtwqkFC64baOO2lwe47Mm9OZ3scY
 gibcojVndR/q3tjqWIZ3WnnrPryO/fCuj6WTng6ly/Ij83FzjLC2kS5r1Y7EA+fzwJGnHMZvd4
 ASbw2h0UBAAA=
X-Change-ID: 20250815-drm-limit-infoframes-e782fa7f3360
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3718;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j2WFIoiYZY4mvy1n1cE7iNg5twCtSflR486EGLADOXY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRjU90bIF/CWwFMn6YjwNwwP4vc6O+nHPJdM
 peW29wEpNmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEYwAKCRCLPIo+Aiko
 1bynCACiJto6tHqy6NRaMI9XSFtJjDhGG9NxaK8XYGS50rbbkRizcc6WRtsCcNv0x4E8tURgw5d
 xD/LGzTuMjBl03KdrIc1pxIl9YB6IabYmi8V1oapcB9mFf6Z9cA6B/nRxe1rZEppabTUE5N3/Ln
 AQC0I6KKebn5PuPQtJLUovBxSXnu1nIugsl8CK4KZ7Fp+0IPpKcpLvGQgm/eGjdw8scPgD/i8tm
 FDGJHbs8XR1rv3RDvp4P5QgCynMvltkRCGGPQCspMHPNY+A8PoH05xLW86JnIQ4B6Rrb8wy9Yrk
 jKR550siSDIxvPLD7lP43sT32WfeM+BVoBY2Ceq2X/kh56h6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/2qPMxw90uxG
 mdQEJpAXlozMBhGFvRwcZSmb46UFnLAUrTB775VWLTjqyL4wXqNm53ZyBd30B7FdNeCvE95fxE+
 qgrgb3agVErtsTSFvPDKkpHC6zi+scSEc2UOd0PFN9WXAz3aHT1B1N3sItIAZSA6LGqqB0WbAz2
 IpF6rFXdauasqxnJvb7V6ehS48z83YwNfkSE/1eRh6+XEcDd8G09N9ZYUQ4KhChDsLaZOpGGzKu
 bkQUT1mUTsS1fwKwOUhG9EtF9nIVeKYFZn2unN99xTiP77ry6HDTt24/3tcWfD5olIbarSBBllO
 wTAZZ9ehHz4tsWQCIE1PXbtrZm9oF8RmfTokAjgDdwm+jk+3iQztqROGJtpM4lPcRZ0eLrKG1YA
 k9ohEvI6
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68b24468 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9umpI5-D6xKxpy0QfyMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: zCGxmVOtAGoqVdjLh4tBrJDabj8bjPb0
X-Proofpoint-ORIG-GUID: zCGxmVOtAGoqVdjLh4tBrJDabj8bjPb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_172305_782452_54E2A016 
X-CRM114-Status: GOOD (  19.36  )
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

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
a model of ignoring the unsupported Infoframes, but it's a bigger
problem for the userspace: we end up having files in debugfs which do
mot match what is being sent on the wire.

Sort that out, making sure that all interfaces are consistent.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Fixed supported infoframes initialization (Liu Ying)
- Implemented separate flags for DRM-generated InfoFrames and
  hardware-generated ones
- Warn if required InfoFrames are not supported by the driver (Maxime)
- Changed drivers to error out if the DRM framework requires the
  unsupported InfoFrame (Maxime)
- Implemented DRM_BRIDGE_OP_HDMI and DRM_BRIDGE_OP_HDMI_AUDIO for
  Lontium lt9611uxc bridge.
- Link to v2: https://lore.kernel.org/r/20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com

Changes in v2:
- Corrected whitespace / newline issues & other small syntax fixes (Liu
  Ying)
- Added audio to the list of InfoFrames supported by the VC4 driver (Liu
  Ying)
- Changed drm_dbg_kms() to drm_warn_once() in the Audio InfoFrame update
  code (Liu Ying)
- Corrected subject for ITE IT6263 patch (Liu Ying)
- Added patch, dropping default list of InfoFrames in
  drm_bridge_connector.
- Link to v1: https://lore.kernel.org/r/20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      drm/connector: let drivers declare infoframes as unsupported
      drm/bridge: adv7511: declare supported infoframes
      drm/bridge: ite-it6263: declare supported infoframes
      drm/bridge: lontium-lt9611: declare supported infoframes
      drm/bridge: synopsys/dw-hdmi-qp: declare supported infoframes
      drm/msm: hdmi: declare supported infoframes
      drm/rockchip: rk3066: declare supported infoframes
      drm/display: bridge_connector: drop default list for HDMI Infoframes
      drm/connector: verify that HDMI connectors support necessary InfoFrames
      drm/display: hdmi-audio: warn if HDMI connector doesn't support Audio IF
      drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  10 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |  11 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  11 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         | 130 +++++++++------------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   7 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |   2 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    |  12 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  53 ++++++++-
 drivers/gpu/drm/drm_connector.c                    |  17 +++
 drivers/gpu/drm/drm_debugfs.c                      |  16 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   8 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   6 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   5 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   4 +-
 drivers/gpu/drm/tests/drm_connector_test.c         |  49 ++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |   9 ++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   6 +
 include/drm/drm_bridge.h                           |  14 +++
 include/drm/drm_connector.h                        |  39 +++++++
 19 files changed, 306 insertions(+), 103 deletions(-)
---
base-commit: f4028ef65dc4fe9010bcc017597fe0fea6479097
change-id: 20250815-drm-limit-infoframes-e782fa7f3360

Best regards,
-- 
With best wishes
Dmitry


