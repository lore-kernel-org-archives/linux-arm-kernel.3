Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770D5CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 20:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+KCHHTqRR+QvQr7TO6S5/RPZnrNqLEy6fhDbfe+NhQ=; b=ocf75Y8MtfWST18xUiGaNwRHAZ
	VMcREtJooNZdx01HHXrMJpj7qkpbmEtdWAf+2ya3J8EaOvB3dEXxNMmoKfijDcwaL6jcwYLT3zFPT
	8cn/7IqZK78LZfwrYY/tCLrF6F4hQfFV4sCLNrpKiJfAMlUYX/EJTPn8ijW2NZ6aYA5hNenOnL0Tv
	XvRwm3/SLKm9W6l9Uvxfu/S4zIycIZLXj7CG73cFasuKsNpeuIoAn/X8zYzDUwj2dO5c71XlGKGSw
	MZHj5ir8Qxkyw+qoQHlCSoP1rHRdSy1JfzQKR9wvMIBBC7cuY29OPnDIYEmNWJKFuHdnPcYJF8c56
	+nCCo22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTKs-0000000Bb8x-1GLZ;
	Tue, 19 Aug 2025 20:53:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRWo-0000000BM72-1FbU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 18:57:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHGxJe019196
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 18:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+KCHHTqRR+QvQr7TO6S5/RPZnrNqLEy6fhDbfe+NhQ=; b=REYuRK7LpEaB1jrr
	Ps4bdB3jWVAoC4qC190kXkBmvfnqG6tuHQ5TkcYMSpo889j3DVi5EwJkdvGlgiLO
	tUZcMwpnap8pvBftk7CBGDXOo0Z3CBKI0fqwIT6IJ3UgCCM85AP9SYuaFgCTy1n6
	+pGK5/X9/bbSZdE5KdmSLXVHyJIdM0+CrlfiOTvP0VOmAYwjJMwi3gWOTrjT+O+o
	O4oSIuZTJxrGsokxzPk3IJ3fqG2vPApZEoTtZafmoLNpIORV6S7NilvqzGHbLVC8
	wE6NcKfhj8gpllgVo4BjXC3KkTcbZunp6iqHM9bwQZxN2wjMIr2ltLv5r0ToBMII
	wAVHVw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh079n4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 18:57:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a88de16c0so129312476d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 11:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629869; x=1756234669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+KCHHTqRR+QvQr7TO6S5/RPZnrNqLEy6fhDbfe+NhQ=;
        b=m47vHXdQjQnz7dKmib3v1EjK1yeLLcr19PVtVmGEtvB5r+HbNidP0BL0t1HTc0jour
         8JRfCOozbfHA6VeNyAT1lmUST9lX/MgIKeW+z05idTRbcq61PK1Qn+X50cwaMfElRkXk
         iOQ2bUXARiYgfRFR9uhFY1GDLawRlXZLAtxPdikl6VQBMzl2TAKgMRlWEH8o9CwuWkdZ
         6aqEQCJK1RKx0gB5E5xTwW2zQnMeFPjsCFvcjuF8+5pHqhbDa/v5x6Si+t9D3eAv3LjN
         TffJz3/iUTiBXg5i/QAPb1Rh7wyj7TdZt9F+Ib9RU3bGb3AgCZG9ihxi8U4DAcWin1oa
         4FQw==
X-Forwarded-Encrypted: i=1; AJvYcCUoaOD0FUmxAMhGOKNkuNXTECUIFd3b5ZccZ6UfYfMDC3YTISsu0SjVx9GyYISp/IuOT6HfGi5m6ySDIcSFx2hC@lists.infradead.org
X-Gm-Message-State: AOJu0YyTVFdUDo7LqR9Jr7SQWYvxFDCS/p9pr9o13acuRDGhX9ByC2Pl
	8r4cT4YklHpes/pJCrIQAx4Lk4XHoyrBBS/JHRonXD7GpTFrWBpWIpcnxbOR9EmoqCxh5NygVkQ
	qhpLneoEAVlugUEzjtNgRNUsik5yz9M2dPoVVz4hMZZdcRCVwlmNBBPt+b7qH6bcoKnV78vStZH
	Sw8w==
X-Gm-Gg: ASbGncsIrFqWVaJgXjHaZiwTXlwywbrENwc+LFNfN3ZJD1wHQBVBwD+67tATNzOl9Q6
	EZHxCLCybYcqn9d8hsJLSfdIHJLsz2lK5+H2byEXCz8u37+PkwjL7xgM9E7K+SJQCJZ6c9Ni33u
	+gUwzO9SvnhD3OCw5hqJ9d5EB7sDKIT0JjGYl8sENDUySVEziVdiXJykVKKxNgUbSU1EvAn8KuY
	MytJ4vitVIGNfIQS1UyPBj3NPAvhdFzQYUBYLPakHaxxYwKX3D7FhEeodOmrd2gxynQHHi9F6xz
	htDDuMgXoI5fZ/KkEBTtdGMZojcD2EPykAIH9YP0+3G7CQShDyi1nSWlKJ+pvcPr/SBHIc2NFWZ
	Wu+EhAa5CUI28BZd6d2EhDCu0ee5FCujBls42dzvzmu1HftsgeVhh
X-Received: by 2002:a05:6214:d83:b0:70b:a525:be29 with SMTP id 6a1803df08f44-70d76f5bc39mr1350546d6.5.1755629868674;
        Tue, 19 Aug 2025 11:57:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7Rup7AhSw4BJ9NwhIDAaqvNpzhK90eK4MaobbpgThtVtwvxC7zzjZweXs4ATCoIwbiBFBpw==
X-Received: by 2002:a05:6214:d83:b0:70b:a525:be29 with SMTP id 6a1803df08f44-70d76f5bc39mr1350296d6.5.1755629868153;
        Tue, 19 Aug 2025 11:57:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:57:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:36 +0300
Subject: [PATCH v2 7/8] drm/rockchip: rk3066: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-7-7595dda24fbd@oss.qualcomm.com>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
In-Reply-To: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7eaknZdIIVgkzyGpeqyWY92kXnNZwGkNmo13tFbwgVk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkcSLkRBvL0pMwSNLmEAMo80IQ6eKzuBYdmQ
 c/Ssrh2nvOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJHAAKCRCLPIo+Aiko
 1UjBB/0bEDK9goN07vzlvUrx4/uSf/QCLfLAHGPDaDSCPqe7Wl54y4kNyRCy+aLt4LJ3bP6rTlB
 8etPp+lpeftFkzYybXjLoha1F8bnExHGkttCagiyw/qETQUEea62dP6vYL+vczmXkKuzax9ChhS
 4njNZ0Bqe+i226T9H1brFHCpfAvuenLiOkFeu21UGrpXDSa6KvlzbniugRK53i7qR0MA1fdDfwu
 drLueW09uFn5fxOhbe2nFGWXm1I6T2bscZ1qs0XFtT+YcT9AeGuMmIXvMzaJ5Wd87o4kQzA4qQi
 /zKuVtV3uKZfeat3nHuFrrUfMmgch27HUc/CFJvruhmgfCS9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 7pLtfMGmPOXpnKN0xLEk-h4XgzkMsCXE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX/Ye9Itu1yMCe
 KBs6qme89xqHtB/UswoPOdRcWryBflJRvvnMJyMNPtCar6m0baD3IwR5PlcF8RTowj9GCt7AC3j
 b9B1Nt0neA8KUh/WfQowkuA3Dwcpv9gWRDdcPhrOZqhFnHCca6MdJMT5l9d/X9lNpw2GNCAsdyd
 XRVRIKF6BqCFa13vopG3G9GR61eGkrBCTQfXPdmKEyD6m0wm3h8hC/zk96s1eEZw1O1v/ont0Eo
 +me70le6cFiLcSnAlbjPIVVOrBG+MQ0OyfM0JKpsUuRRcHFCL4mlTyjvLR0KnxN3NyFFOHx5SYq
 BfVsZQIW6HgE7u7GZGfrEYfpNgZKjNT7zc1zzBL6EZ3BM8AGNMb53AI2++VQCmN416nMaQbNEid
 3KjjzjTc
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a4c92d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=iNCKscWTIkh_2y45CzQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 7pLtfMGmPOXpnKN0xLEk-h4XgzkMsCXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_115750_467262_31D201D2 
X-CRM114-Status: GOOD (  13.62  )
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

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a93a49f87df7604752f6b651c839c..75bf9a13d8cde1471e8b7e8a8f5f4c0457dd0a14 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -696,6 +696,7 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Rockchip";
 	hdmi->bridge.product = "RK3066 HDMI";
+	hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 	hdmi->bridge.ddc = rk3066_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2


