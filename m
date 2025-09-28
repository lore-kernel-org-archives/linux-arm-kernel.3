Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBC6CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 08:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rc2O4wz2Xp3rHoz8/mUbsMfKLduyX74HJKpJIAxeyFQ=; b=sAXFWhs0mJvC42
	5gvUq4Rbn/Pxgwjf6i0Tr6KD2nHgZt61jFg9VhtthNjfJ0aHZss759VQLYOE5v9lqnEWgYHgwrQcS
	St1o+fj07l6ezmbeS0B1VPnma4ZIuHbbj0oN74hGMwWdLfOT1+9qVoE5v3lXO8xbgpILcMSLC5Y3C
	KNdvwvUH3bA1B71dT0ejnrm4mthLE7ZUVWeHKGlPIVnKQ2FyFAMRJjTcszsoJrBfiq5uU5ke20hj7
	IZnlxERr3Sa3cf8TpUBLGGTZhe0xcnY7uwWu0+LpOD46oxBGwj6Ir9UGDfEGTsRKozN67EpEx3aK8
	t2MTUcGhlktzdOPfR3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2miZ-0000000EJJs-22gm;
	Sun, 28 Sep 2025 08:25:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2miJ-0000000EJ55-0hKe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 08:25:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S5D1Oq019049
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rc2O4wz2Xp3rHoz8/mUbsM
	fKLduyX74HJKpJIAxeyFQ=; b=IMqOPF2RwTNjYzv3tzCtFIDfj53rMbYzw9zi5a
	Y9LeTo/S+tjjGF9oJRxXAfKeFY3aIlPfVF7ujyjbB4MuT9rzcb703ByiNhpuxby1
	qY0pQRVdJB2gbPUSLPeC/V20uBZlwzoVbN2DgFnVxwXKYzHQnBqoXB+3wj89AXTv
	T5iQOHTFezAh18vkMe3bQuChogXu+EPxkSeoMcBmKrv1gVIRYH6ojpNWd/7URQAt
	HHBtgI5Qh0P598ZSc0tiu+zecOUipf5VdRGswtuO7JomOBiXqVek9SRrPBZ1H2MM
	5uJMjr/0yRfOhNGRl7NkImgXclV789e+a33pyEW5mTgSz5IQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5jfph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:24:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d9a3ca3ec8so69428041cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 01:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047896; x=1759652696;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rc2O4wz2Xp3rHoz8/mUbsMfKLduyX74HJKpJIAxeyFQ=;
        b=Aw3GTVPpmtZ29HaEZUtnyqTvMR1fiVMi12jNDIdo6xyEx7mS70Xk5XJ+H2md2Pg8Kg
         nbjQJ1TjvzjKtGkTclRcki7/mWsWM+Pm8vDJ0ucv+N19ctgS8qMXuGWxVSjEZAm29bj0
         lw8vC5U9EKqPEIAdX9LI3CeTDWP4k8uw/ejhLWLIAydt555TXmkPx1VfWmiJQ7qqjHfz
         s+2iNF8zAOaU/cKddYwzoy2/c4jhiRL0T/h+k+qJldAvgaJ5jR9yme2Z7H3aDd1UHwmg
         EPWjeDiZWpa3rF5AQ5rnEwLmGBvRp8stb8pEZOIXCVQwbkJ6IiuhMbJw7dQj7LZ2Rsu2
         YytA==
X-Forwarded-Encrypted: i=1; AJvYcCUiC6FU0oK8Kb41Ikx+X2bTp8tdpOYpr2GqBkYFJbqUsKZLw7GKQieo8oYoGDDGRWk2+xKnWRiKaVdY4GawiTFV@lists.infradead.org
X-Gm-Message-State: AOJu0YxOB6xeQRm0CYSBMfk9IXZxYPty9K7tcoAHLHmuQdRU1EO0y22B
	cUofutUzKW8XFyfT+RZhS5YeAhHLBQieWwCWfYkzn5j7IaH6r9J5VUB6/HhVfqusXLr3jGdSIsK
	xMLMFmoxN0Ax8FJvo7Gt5yOgRrETYTqP3BOfjyaEaqklH+OOe2RUl4kXD1Kt923jFemPImpm5E/
	NAQQ==
X-Gm-Gg: ASbGnctEGpNivC3I/KSz9nMNKa/6xH/8E76SpQgE7/sitxg2dzINsIfUCEytiyz6Pq/
	A8PPOGClDjXI3IuQtaa51ZVmAqrwad6C0I6xLzNa84lRlbKmIxuTuK72f+mQEfVSfacuYI1HtgZ
	9JdrBlOQmCi2+Z+WhtxRwbbICaHckQ5DCFtYemCGIElXPDEpcZCJ16O9RDnGv2QxMJ4yJfCkTgH
	eGa/tv5LR92vszLJMcorqqwKfEImBYGXrDst3lnaMLZm2L3y61Sy3tNvvjtTn2mOZT9bvJT/L1H
	nwhcDGIi/uySG3qZNpl4gCgro94cTUFzEXIF2Wj7zu2y7fobEMVIp432EF2wAhR1IX7K7VCjkIK
	oVg/TllJzKNLy80fHMmw5tvcmaSg23KLFchMRinuSyJXvk2njfObY
X-Received: by 2002:a05:622a:19a3:b0:4df:194:b46d with SMTP id d75a77b69052e-4df0194c12cmr55269021cf.80.1759047895993;
        Sun, 28 Sep 2025 01:24:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSQGqS4aJ7VDAivVQk/ANpuwQy7ctS7IE9D3fgBdrHjHXtkW+JEen25AcKMFhLLPIqmo1upQ==
X-Received: by 2002:a05:622a:19a3:b0:4df:194:b46d with SMTP id d75a77b69052e-4df0194c12cmr55268701cf.80.1759047895487;
        Sun, 28 Sep 2025 01:24:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:24:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/9] drm/connector: hdmi: limit infoframes per driver
 capabilities, second approach
Date: Sun, 28 Sep 2025 11:24:45 +0300
Message-Id: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM3w2GgC/32NQQqDMBBFryKz7kiSEiVd9R7FRdSxDhjTZqy0i
 Hdv6gG6+fA+/Pc3EEpMApdig0QrC8c5gzkV0I1+vhNynxmMMlY5U+PEgRfkeYhD8oEEDVatO5N
 1jmrnIQ8fiQZ+H9Jbk3lkWWL6HB+r/rV/datGhZWrrdZtr6xqr1GkfL781MUQyhzQ7Pv+BWNgR
 Ue7AAAA
X-Change-ID: 20250927-limit-infoframes-2-6b93e599e79a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wXdpgIK2nMReHeFFkBUwQqE/S6v5i1Ns3S0QQzaiDpU=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDTB73mP/OiC/2SDbHHGonN3evfKMNBf+mFV
 TAqz55+BLGJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw0wAKCRCLPIo+Aiko
 1QGaB/dCkhCFXM3rS/LZOxNFSLK33p0eqjXUwRLj/k1HSm4nPT5ACqB10fJ3tODSDVscNubP0oR
 jfmyJiJzo6t6DoZD77G8Nj64HnQj5ie1loe2Gq8taQC/i6+qO0ReHUV68PcRZJ4/RjIU3SFWYGr
 B0zT0V5KzHabbu+gztU9ddfmCS5QCau8INJXipea8RT1wLTnGNAWjHjycLW4akzsWGYMGmTD3dy
 eYpOMrWIfTBaRqxQh18GUkTypkJLT/cx0JwTR2Tg040mVGp2fCpVCbTwweZgCSWyuuaRHRVeK52
 pmZkVNSrt+Wnj6FEnoqFtN3ELK6yNEwAzYWXHwb2GyWEDPE=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: tv6KZSVrn1KE2PMUq8lkammwxBwzQKao
X-Proofpoint-ORIG-GUID: tv6KZSVrn1KE2PMUq8lkammwxBwzQKao
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68d8f0d9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BiG78YgtQv3mHEaFN1cA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfXykk8sWlSstxo
 uBS6+5ikKgpp2zDlhd3athWpjd1izixKKRcy3vvz6VkU9CCdDh+dZOgeXAQ6UxI7iRewPbQ+uSk
 X03RGwgUKdhIseTJ7ezsfJFcmNWnOttfpP8aCax3sNt3RDLLMjFDSvY/yDOhP55pntR5DFuj0EN
 Rs/OMzGeMXGsfiRdv9JpMb11Ipgb37iaQPJ9og2QsnD85QK2wkVEK5zCfUAXvDex/1U1WNxN50J
 VJH+bu3ckDiiftGRF9TawebqiomyYPGKTCt4AfS0AB0rbitaSlsXy51jOTwqb2ljPwQJm/rvRBN
 u9V9UnFT4Z/07rPbID5W9Q522HRE4hT5BDMGPbFyUJQ+pf2r8o0xRdmyuYCJQLcG6U5T8WovmMD
 LoRZ4wvoUChHAQTB39POCPuImMLyHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_012459_318125_46A0F1FC 
X-CRM114-Status: GOOD (  14.14  )
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
HDMI InfoFrames. Currently it's mostly ignored by the framework: it
calls write_infoframe() / clear_infoframe() callbacks for all frames and
expects them to return success even if the InfoFrame is not supported.

Sort that out, making sure that all interfaces are consistent:
- In atomic_check() callback verify and disable unsupported InfoFrames.
- In write_infoframe() / clear_infoframe() callbacks return -EOPNOTSUPP
  for unsupported InfoFrames.
- In write_device_infoframe() / clear_infoframe() functions warn if the
  callback returns -EOPNOTSUPP for the frame which is set (or was set
  beforehand).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Fixed build issue in common code
- Fixed comments regarding HDR / audio frames (Diedrik)
- In adv7511 actually check for the HDR frame (the comment was correct)
  rather than the audio infoframe (c&p error).
- Link to v1: https://lore.kernel.org/r/20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com

---
Dmitry Baryshkov (9):
      drm/display: hdmi-state-helpers: warn on unsupported InfoFrame types
      drm/bridge: adv7511: handle unsupported InfoFrames
      drm/bridge: ite-it6263: handle unsupported InfoFrames
      drm/bridge: lontium-lt9611: handle unsupported InfoFrames
      drm/bridge: synopsys/dw-hdmi-qp: handle unsupported InfoFrames
      drm/msm: hdmi: handle unsupported InfoFrames
      drm/rockchip: rk3066_hdmi: handle unsupported InfoFrames
      drm/rockchip: inno-hdmi: handle unsupported InfoFrames
      drm/sun4i: hdmi: handle unsupported InfoFrames

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c    | 20 ++++++++--
 drivers/gpu/drm/bridge/ite-it6263.c             | 27 ++++++++++++-
 drivers/gpu/drm/bridge/lontium-lt9611.c         | 22 ++++++++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c    | 20 ++++++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |  6 +++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c          | 19 +++++++--
 drivers/gpu/drm/rockchip/inno_hdmi.c            | 47 +++++++++++++++++------
 drivers/gpu/drm/rockchip/rk3066_hdmi.c          | 39 +++++++++++++++----
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c          | 51 ++++++++++++++++++++++---
 9 files changed, 208 insertions(+), 43 deletions(-)
---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250927-limit-infoframes-2-6b93e599e79a

Best regards,
-- 
With best wishes
Dmitry


