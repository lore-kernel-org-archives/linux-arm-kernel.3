Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C27CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DJa7R2QHaJhhfx1abJv+FW4NHkh9fI+yxSQ5uteT5y0=; b=wOsKUVS2NNliHO
	7vDJRphqt8JYFmigLz3B2f6JhOMU0YnNMuq//vkkJkq5iWPCZv8dtcKA1npMeonXG36N9zT6Q6a2h
	2hCxDrABWhC2LlLVZIDKfiiYTbViNWfilxticXOsaMF7xiFzTgbSRVuT6pPD6amNNgUHaB3x9tIUd
	r1HrocQWh/ilT3tTyXCWAeBZuUgDV3Y46HlVtNgn2tsyh+e8u2Fe4+18psGgJGs4xz2u4qg1hf4tQ
	arwtWI1hIeI/R81uViCvCQsbq025vNkTiquBdZxeIx/s5inLrRgAVRCEWa+n6jO1lqL8gEDGost0G
	OpZB0D7z6GtaBkhpyk3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unGGO-00000004d4K-2nyd;
	Sat, 16 Aug 2025 12:44:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unGDc-00000004cfw-1rTY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 12:41:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G4BsJF019872
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 12:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DJa7R2QHaJhhfx1abJv+FW
	4NHkh9fI+yxSQ5uteT5y0=; b=TYAQaqdLTrxEbLSRC85k4O+GgU0kii/k12kbpM
	j9Ad4msHSHl1HaZrZUmg4NdOwSx01AkfeA1ZEKnIgDJ1vLFiLAJoXdxSvJRFo2D1
	38C6IFsp72fjP8eGc0cBLoobWIXnCh+wZtNWCE+bQis+zrPco24nE9vO9faV6piP
	p+eNVcxzYTaEYUri7fu81LmZSbD/aLS1X1NtPAo9Q8bLG1COM9iGF069/5or2gEJ
	C6q8XG7Szu6XKREScdJ9MFSyb6cRyjKrvpMb2CDJVy0GFarIOk3U52SwuzVVH4Hy
	VysuPJ+0cri59lAwWdogBmH5S2gRO2KOPyPXY4fmdE5psMLg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfrk03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 12:41:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b10ab0062aso69979071cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 05:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755348066; x=1755952866;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJa7R2QHaJhhfx1abJv+FW4NHkh9fI+yxSQ5uteT5y0=;
        b=Ps8ybNd+v5i8RD5p3fZ9z5rXKiUnVuwxbg8PegTkbqvT2qHF67BIVx7LNu0tv49MrE
         EN92ZhYw30n2BevnUa1BUtW11zXC+VCAAIvvnfrvyGKbReSKggJn13XRfeciDsVKcVYX
         MrEQi6S46X+N8LzQn5koNkG0rshAVP8ZbIm7fw7aA3oK084nZTQqFaWcVfBpAFmQ4KIG
         HUMLsHhpVmB5c4u8Hypu+hAmczCh/cCPm9vGVWxNhBcxhUof3aMB6BFcDyhgywNAU6V0
         T0UzXSW3MrkHWLgDvpWhIxpWzua6kjGlR29dxW6hfNGsb0MUdG1DKwHGCWy11JtUv8l4
         BqKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6Jx7OL15q2XE/NTIX98cwV0r8LrhScqblQRGWnKnlEz625NzLhlsUUbp/IORhmPwxynaLGcs6LQLiBLVm9fFe@lists.infradead.org
X-Gm-Message-State: AOJu0YwFpCOT1szBldP3piiv1CX39dWIctbafVtaUveSXTA+5SHXzm5F
	zhBFgCSzddjwtPhpaD+f9VRB+gmbt1KLTsgiyMhBKl2wJqkfuBB92j4vpyGaTshJ7SjhV40WylN
	NBnY7hhVOy4tZ/LRjkI2J8zOmPpM+L1Ha7tfW4psv91Da99r6iscTlvwz4UYBLx8+aBsRI+e9oF
	SG/A==
X-Gm-Gg: ASbGncsQXoZ6YT9lw27iL84PThrPPDomqxW722Q1Hffg/h5/kPjnmOyQeliP8QHNXYn
	ChXyV1s9Ei0q53zKGGZdcGHcrr4IkgtvN8cXbOar0sdz16+GcEDxj9S+19OuirFEL21I+wckU2l
	A3sVuv27CJfCzFtiwaKfAJse4CKKQ6AkXkbNafWlAWV83UEqGiChAukJxeeVzlkpESaYAYbEkUR
	Rq+Nn49f3AN1dJ6XUCI5I1cNbCez8aR0v3AwD+U1SUXj1+zRH+erK05qK8p7eUqqaQhfzjnPTAz
	0IETEbzULlmDI/Fqmu/SKeFl9eqUBFo+ZdaylCBac+Ezn1m+Siy5e+wKcUShPjBUOIQ1Py65xGz
	FKVdANlju/5q6aiiN+UTkLSNyVD3vf369czQ+0W/e7IAss1GT+Ag0
X-Received: by 2002:a05:622a:1445:b0:4a7:18aa:121b with SMTP id d75a77b69052e-4b11e11fadcmr70444941cf.20.1755348066163;
        Sat, 16 Aug 2025 05:41:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDu/rhFRVUxM6MMA7J2l6dXYr4ZCedu/K1PSwVZjoSHNuoLvoUjgkhh/mHkUAxjnQKCA+q9A==
X-Received: by 2002:a05:622a:1445:b0:4a7:18aa:121b with SMTP id d75a77b69052e-4b11e11fadcmr70444611cf.20.1755348065731;
        Sat, 16 Aug 2025 05:41:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 05:41:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] drm/connector: hdmi: limit infoframes per driver
 capabilities
Date: Sat, 16 Aug 2025 15:41:00 +0300
Message-Id: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF18oGgC/x3MSwqAMAwA0atI1gZqix+8irgommjAVklFBPHuF
 pdvMfNAIhVK0BcPKF2SZI8ZVVnAtPq4EMqcDdbY2nRVjbMG3CTIiRJ5Z/WBElLbWfYtO9cYyOm
 hxHL/22F83w++h3ZyZgAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2224;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rdcPrfCA8M3yJ02gdAYNdSPeQnvEBJT/WVjtw9rGblA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxel4gzygfQobSNeCeCVgeypJ9lKzy5dsSVX
 uc9QkQAbKiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XgAKCRCLPIo+Aiko
 1YxCCACOim4bCjHIWqX1M1bZiVMLzRI3Y8QTdbuiNgrmLKiOaXRYiFmSpaZRI5eGf0CarO1iNUi
 IQjq0N0dSpJFtGKIfadH9PJ8064ZG7NIpU68xmKG1OFzxevGRyfeNJZ7i4GhEi/tV6G96JOSs8H
 iwPRsqFRQrzhwp8qORn+7d2WO/i9IRJf/2vrpu6496ztu9HTv0ZNQjECzwcE8yDWeZttI0+4gR5
 LzTcTBEjoqQ/4IYz9y6hTrl+OeWEdnWvuOJ3FPXWNrBp/wJ3O5D8k/YbUSYRsDcSwrd/5CllFgA
 XVjiF+Q3Rz/QlzANj6UXQ7V7QH3pQwvw9ipP0T0b3jfjVNWw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: C2ej6KxCImcLbkEdIUpMHN3qm7ncv85r
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a07c63 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=lTUuHy-DAZNZ5WD40gMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX/w83USQuTXxY
 KmGrtgZ1wgPx6Z3dBlyqefvn234iM+/nmxoXxbp8eCKQPyzaIqtkkZxlc0n/eROXocA9/OOuFOv
 W/RiB2mjQVi9RxTz2JIw0tGdg8E0zR/rkjzfkmpapO4LOsGU34tLVgxFkoz8Eu+r8Ga7CfdFBCB
 4cV1CoVynds2JQxvBCoZMr7q/ELRm6UYiFcZvRCSD20U7l3G03YqQ+NOtlRIHBILxeVXUKzIcWD
 fEJ36mtlsIWgTYOOzSxHvySh5YRwC6lSHonzcoz1UlCM83+0x5Hvj2qt2J+oqJ9aSvK8hUZO7Ia
 qufs5UN22tjp3Yid9kIRzV8vtEjVcZWal9z7yAsJuQwxIgqz+lN97KCVBe1y+Np5Au44X5oEp2u
 dmOMsg6i
X-Proofpoint-ORIG-GUID: C2ej6KxCImcLbkEdIUpMHN3qm7ncv85r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_054108_495147_83219BEE 
X-CRM114-Status: GOOD (  14.48  )
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
Dmitry Baryshkov (7):
      drm/connector: let drivers declare infoframes as unsupported
      drm/bridge: adv7511: declare supported infoframes
      drm/bridge: ite-it6232: declare supported infoframes
      drm/bridge: lontium-lt9611: declare supported infoframes
      drm/bridge: synopsys/dw-hdmi-qp: declare supported infoframes
      drm/msm: hdmi: declare supported infoframes
      drm/rockchip: rk3066: declare supported infoframes

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  1 +
 drivers/gpu/drm/bridge/ite-it6263.c                |  1 +
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  4 ++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  3 ++
 drivers/gpu/drm/display/drm_bridge_connector.c     |  6 +++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 43 +++++++++++++++++++++-
 drivers/gpu/drm/drm_connector.c                    |  4 ++
 drivers/gpu/drm/drm_debugfs.c                      | 16 +++++---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  4 ++
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  1 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  1 +
 drivers/gpu/drm/tests/drm_connector_test.c         | 28 ++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  8 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  4 ++
 include/drm/drm_bridge.h                           |  7 ++++
 include/drm/drm_connector.h                        | 23 ++++++++++++
 17 files changed, 148 insertions(+), 7 deletions(-)
---
base-commit: cb640b2ca54617f4a9d4d6efd5ff2afd6be11f19
change-id: 20250815-drm-limit-infoframes-e782fa7f3360

Best regards,
-- 
With best wishes
Dmitry


