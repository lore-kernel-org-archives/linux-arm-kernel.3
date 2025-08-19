Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0DACA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 20:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oqOjX77awAS/zrhT5FXwno4UdMuKMxJTGpgJwd+TfEc=; b=ZafvlJblDTBeiN
	wTKBBUxQYuDk+RNehAAP8a1ll2Obw8+lK81JEfINEcLL/xGmTxc8eNHtiVco5RyICSIkW0MhxMWYM
	2Gp9FkrjoWJPXyGuZywH/9rJQa8sVLnJ8I5HLYQWRrB//HwyuD2ewNYI0V+nwdHAgIACD1tcAojon
	mt3xwHtwUxAf9ja1RqJM1ueMgjQArVDez8W2jCvosyZKDbxW13kDEx3McphXexGvpLVFJOqAiMNfi
	CQUi9aqBGYlt8Y8+iCtgNU01tZ4jUPC7PuBmdZ6SijuHKkpCG406mSizedNOZ7qzdtoe0Hnwh4nuw
	sVRuezOEIDSSDfAjac+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTAb-0000000BZ9Y-4Bfi;
	Tue, 19 Aug 2025 20:43:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRWa-0000000BLzU-33xB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 18:57:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JGv15F032349
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 18:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oqOjX77awAS/zrhT5FXwno
	4UdMuKMxJTGpgJwd+TfEc=; b=mSV4tk+CZ+IF6h3GcePTADtySr/5lOcA4Z0Vxg
	i88WmaFoiQfjhN+BqKpqtADYy8fmfQ8qF3Lh9npdQSi7PHPHh1e4z8jozFvEkIb2
	pA5qQ+HZfvSgq7T9uV1UVdWI9J0LIzaS1i2M666WcsPa1XHIFj+nkEh+pJBFPKME
	bkY5LvKayarB/Qn7UReaoyXqaCMGK0VgZIAre+nwNYrcGTfjDJt8hhZHXD5mtJeP
	I8uXyM5USpCbBXikoTxtkfpVrXHF9/kPPv/uJWDB+FO1+RoBcnV0y/p1Zr+V++pI
	tju3D3nWmAZU0GbqmXEtwj+ZyIWkw0fr1jbo0xlQ+AMsf2qw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2uhq9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 18:57:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a88dd0193so128558246d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 11:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629855; x=1756234655;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqOjX77awAS/zrhT5FXwno4UdMuKMxJTGpgJwd+TfEc=;
        b=hqlwf+DtfLM8bQzRjlcsgS7oWxS4NGTZmqoVczXQBZyTSb8rvvReam/YO23A6STcOU
         BzBgbiIR+z7gkQRukUzW8rg+8MOtA3EkCrB3mocaL1sSRF8A9CBzv5OqtYrDvCSvSeWa
         EAd+VWLOIrQfpFKnoA9h90gQy4gs8KLfO+1WU6y5OiMYpCtaSiCHuB3cUImt1MGWn288
         sttAKKi5A8ZvZ1YEs2E2IQQktJqaZrwCLskjA8+UJgs2vIbdsicJeoM+Rb+iGy+HKK+u
         dF1RhTSPTHgQMcOM4gxGgmCBMZoG00XznTnXP0qNc2blesm0Vngf+47FMKl6y80qAjxw
         y2HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkO9eawUZFnbhFUE9zxVsZ25tByVWh5JSRVUznJWUk+Purpgaqrjei1tY1PAzukkWVSbEbRVVwQDUz5aJCIdK8@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfy0Dn6nCun66mcuUsmEMpObYOxdJknsmZd3qIMF4p357rEpgI
	NpD3UYYMtqZGOZHPY3E2WLW74QMKFcS2Jiw/iZ7L5IAAVnuauW7SBz8jrDncJmOlq/3JPWYw5GH
	tE+dclqxgulilVqY061NS6GDxxtAaY2UYzqP5dPO1j/ztbXqNVBd9H8ud7ej9uhQ2JN0ycZEhka
	WNMg==
X-Gm-Gg: ASbGnctGc0iaFDJkJu8+QXXUmzZZ62Gk5O/MC5j4NKF6YKK4ahrb9teHYDWy5wcVtZG
	cGadrEjxgVU4Io8qVVzwbb+oVbsw5zNO4C+DqxJBTZAAFe26xFPy88P9vHzG8NMirB/nbrkcLd7
	x9zWY+rI8LOp3y/zVYc0/OaI+1jTtcLSlfAfgdTHYzZzG5Qo9PS3EqnNtNRBKrt6/WpzExefNQi
	Yb7xHMJaEWhgcQMJUpBk7hQEF2aViEG7Hlol2GOVf2MYToiXKf7C6NRUqOVPPujAq49QtOVOt1R
	NFWUJhj5Kaa/tun1UwwlQLrEm8K+TmdvlvRyMbDCGUGgjWA24cjGDkecGkwkqppe/N/FZ7bWtx1
	F5MdHp6RXERae20QDE49OMSCcndUoX/HN9cfgWpF1fodhRQNr312g
X-Received: by 2002:a05:6214:5011:b0:707:5ff2:ae87 with SMTP id 6a1803df08f44-70d76fb03ecmr1180356d6.18.1755629854718;
        Tue, 19 Aug 2025 11:57:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5UH/CsaY1tu+iFGGIuXK7C4OrWbOsLF5EbSr4M5CMsV+dCVwfAZTb8EJovJissA5wfj2R9A==
X-Received: by 2002:a05:6214:5011:b0:707:5ff2:ae87 with SMTP id 6a1803df08f44-70d76fb03ecmr1179906d6.18.1755629854186;
        Tue, 19 Aug 2025 11:57:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:57:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/8] drm/connector: hdmi: limit infoframes per driver
 capabilities
Date: Tue, 19 Aug 2025 21:57:29 +0300
Message-Id: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABnJpGgC/22NwQqDMBBEf0Vy7koS0die+h/FQzCbumBMzVppE
 f+9qdBbLwNvYN5sgjERsrgUm0i4ElOcMuhTIfrBTncEcpmFlrqWrarBpQAjBVqAJh99sgEZ0LT
 aW+OrqpEiTx8JPb0O7a3LPBAvMb2Pl1V925+w+S9cFUhoXK+Mq700eL5G5nJ+2rGPIZQ5RLfv+
 wc4eO/LvwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2828;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4snEPQfJfU4oBtKfJvvluAVI10o6iuDrs8O3eQOi2C8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkb63HDxqJrxIQYe1NyexPzL9xIHdWdRrTXA
 Fyvk8wsxq6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJGwAKCRCLPIo+Aiko
 1fF2CACeVmUe9+BfdVASI3ZBc7dYSjYTv32FsbJb0wBdBiQ33bgUKXg7CUEUY4lzQ/Ej6RXQR+6
 tW6bD53HFX14S9dmZ3NLffKRyDYjECDps2zvX33zgL6VRulVaQQVEBICIGjgPzFVtxOUONgWhfF
 TOuqp/AVZTNFF/ZAZ1dROMQctWzPTfMTh5LJ4MVzogwY7q8+pDks6SUFop4idL7K4Ueqvus+ZWd
 g/lyjbhqqYB2b6A91fUC86essJ+mg6xZ9ni9Yo/OMHcQwdPEVTai0WuNOJfEe78kI37R2uyLzn4
 JB+AND2NaG77Gfk8DRYzlNZRV5s5JXJemZXYvg31cNBuUQRM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a4c91f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lTUuHy-DAZNZ5WD40gMA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Nzn7Nfy3eLmr9n6Xx1ONRpOM6VvxVtwd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX6EqtnFjU7Mjw
 XoxEFSC6FuJlo0kx9OE63n2MtPlEv86+aAqSM/zuQRRmwU2fwaya5PHqn3g0q6LkjhBWxFcWSvb
 u7ElbReDHPeur9x24fyr7DQdhElIpfMO/i2gRBtGJvUmOtEyHJyyBCjubO4rEiQ2sd6AsqzKHYc
 2UzEJF3tbQjzufuWPlu1Zwq35laLRKEADeZD5Bg3pAeJLReKGpN3TmGorJcvyjyMPEJSD8gPPKC
 0/gGmv5weVCsYDpt+Ez1NB1CUrR/7eQfXXLsS9bbSPObYX3fjM+20wKtN0KE4rL6QFMRviBUsbS
 2Rr3txYrtHXcztDnABFbnxnbWqVnS2WU9zSCxTrKoBt0S8DCHb+uB8DIpzllM1EPX2MCEMcWvYU
 Nx+X4z1X
X-Proofpoint-GUID: Nzn7Nfy3eLmr9n6Xx1ONRpOM6VvxVtwd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_115736_893560_EB007808 
X-CRM114-Status: GOOD (  17.85  )
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
Dmitry Baryshkov (8):
      drm/connector: let drivers declare infoframes as unsupported
      drm/bridge: adv7511: declare supported infoframes
      drm/bridge: ite-it6263: declare supported infoframes
      drm/bridge: lontium-lt9611: declare supported infoframes
      drm/bridge: synopsys/dw-hdmi-qp: declare supported infoframes
      drm/msm: hdmi: declare supported infoframes
      drm/rockchip: rk3066: declare supported infoframes
      drm/display: bridge_connector: drop default list for HDMI Infoframes

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  1 +
 drivers/gpu/drm/bridge/ite-it6263.c                |  1 +
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  4 +++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  3 ++
 drivers/gpu/drm/display/drm_bridge_connector.c     |  1 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 37 ++++++++++++++++++++--
 drivers/gpu/drm/drm_connector.c                    |  4 +++
 drivers/gpu/drm/drm_debugfs.c                      | 16 +++++++---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  4 +++
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  1 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  1 +
 drivers/gpu/drm/tests/drm_connector_test.c         | 28 ++++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  8 +++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  5 +++
 include/drm/drm_bridge.h                           |  7 ++++
 include/drm/drm_connector.h                        | 22 +++++++++++++
 17 files changed, 137 insertions(+), 7 deletions(-)
---
base-commit: cb640b2ca54617f4a9d4d6efd5ff2afd6be11f19
change-id: 20250815-drm-limit-infoframes-e782fa7f3360

Best regards,
-- 
With best wishes
Dmitry


