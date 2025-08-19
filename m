Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3DECA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 20:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=; b=GOrEOfvD4RqccPeHApBOtzA9nR
	b1XrlEP64q3dwUdbUT8Uh5NAX1byCq7Yg4jOVub41FUJoK297vcr18CpLKRnQxalj3L1+HyXsk4sE
	gp4l6hhcJDS1sq2MBJS6fxjUSmxMQldQ/b1xWucooNv7jgYU+niEHTA+ar89X1DuUQ0gfG6sG+QFr
	vi4tCrU/xi5G3Y2PTdUstFSmQjz2zJlntAfMWec5LEuozbaf2E6MkNT4zFp0F9aV8Gtd5d5XrBxv0
	mZs2Z6kw1u5HLH/16ZUInHfs4qJ6nHb+6EMJf/nMKJ3PEAIG5cJDpfMbpAiGesTfYSz4PWAkKeh1K
	A6T8ZCnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTCv-0000000BaNO-2uly;
	Tue, 19 Aug 2025 20:45:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRWl-0000000BM4z-2fQ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 18:57:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JGZ2fG030484
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 18:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=; b=dl+mKYkavx9jfaMA
	pxQZjyuWy6ApkP6xIBIp2SMVIRICIp0wxmhV7nhMBIRSvdjopk9vRHt5CYN5D5Df
	gLqKGiedMLp/PZNbePG1dNhpJjmbMK7kCP/AxuSYpD4fXH3A84UzGAUCQdknE074
	/aRuxQLfPQLqG41ItAlcFxxtg7dYd79jkKqtRnTWPXY1cPLux/M7lHq17viN3ikO
	fah3pe4J3EGxoQ028nhZKqBGYXZlQ2dFzNPrmO0NhDDQ2SFgR7aHouiDSu4CY4RK
	PqERRwTfzdyLIeFEGJD2WRq2FNcqPVCrHM3Z2a1a8/x3vKNyHRonQvhoyckHbAy7
	Mf2yGg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunwwdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 18:57:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88dd04faso200361126d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 11:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629866; x=1756234666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=;
        b=M8cSNfx6qJTCeJsMoMYQlAijYB2OlDe+s0IJqBABU6CVpLWohdLYZgz+ID4ZscA2hu
         kVevtJ/mHvAC6wKN/fQGb32OsmYdu03IG8WGv5U3y7eOAyOGxsDuZZ66CIDRlEKcnEAN
         4N3mQXbkwtFtU0DTt19jMyOt9psU7fMRQOZqcXfFjsv2Q374IXlqtxGL7yQkEo4kdfpb
         i5hu8wDJBsDQPiTxJUz70nt90XUvUk2kwyVkhs1hluA8erw1Xro5ZvVulJBOsXAIZ7BW
         v0hYNuF9UUUCHwaaidVavZahiJIDlgMi3YmcjW87Wn6STE8HWHZGz2VWfD7RDO9vL7de
         dHMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvy4wer2idwSYXRsXnKGSvacwEvCBDu1IEGlS0kEmVd06LlCNOIjtcXctEC2F+7G9V/XyFJo0SLRR4KVhY9F2K@lists.infradead.org
X-Gm-Message-State: AOJu0YwUyEtN6u3G/tF3A/xmXbGUG6+0idpatl80YIawduMmVGiO1qqn
	VnjxfUC0PiQi+BgKut+5FtsHtd8ONSJncf7LL6wp4L948bF4eKDHXhDdoTI5qV3kbiUJYJQM2QZ
	kjLDpMjB5v9rqSr4U9qL9uYt7M8+lrXUUgah4pkaTCiAHHQTWPRrsY/ZKzbw0cAXqumHA8HGDYZ
	ZYnQ==
X-Gm-Gg: ASbGncvGmSvleCiSD1eIRih9NltPeWdtLnlety18Jx9bOqimJBFa27FcByybnIa2Om9
	5HTB6tc2yRetUCNDeiWjcvOptYnoFDmyGhTQV3xNun++cvx45p9+oGR12mrjZHb5aVc4nS/zMRa
	PIs5WPueCRJrPyUoVaRxaz88Y5Uobg8gO0QFsJ1EpNjS6Aoh6WEAX6sOCGgrodbR7FWYjjB/281
	+vkfMCTHbmvLhihoVi5jWh6+uGOLTLZ4eRHPmBOME1lkKfn7l7ASPYw50WCp4sKBxpVLAqxMVO/
	Be1xEIvaAQY4/Gk73zfeerVROk6hXYFANeJxr3vEufZ+r90lVqNLvf5U28F99zeUj0ILJiNw0Un
	5MxRd+hOsr1F6hNTOyz5nbdXLYg9hudatyAI5uGuj2cJUxd7LyJ5H
X-Received: by 2002:a05:6214:300f:b0:709:3ab5:b935 with SMTP id 6a1803df08f44-70d76f1b57fmr977736d6.3.1755629865666;
        Tue, 19 Aug 2025 11:57:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr9lG70O+e1XTcrpB3s7bSU3peWs1FenRfwedIgpf8VBr8B4XQM4LoKEEzgPGJdC9gGNvxDA==
X-Received: by 2002:a05:6214:300f:b0:709:3ab5:b935 with SMTP id 6a1803df08f44-70d76f1b57fmr977216d6.3.1755629865082;
        Tue, 19 Aug 2025 11:57:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:57:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:34 +0300
Subject: [PATCH v2 5/8] drm/bridge: synopsys/dw-hdmi-qp: declare supported
 infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-5-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Dfr1zh3DlBnrvVAtXMJg6eNn5T47Wh0MW2ToSAF+Qw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkc6uAxm7Nj8Fu5N7QPKSrbc88k7ZAuyOExK
 KQwTesFW6CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJHAAKCRCLPIo+Aiko
 1agAB/9o1aDDfIY8MzTByg+veg862UBNIr6XxQEXInLmnD2NrcHjkS2h3H6hWZ6N5ehfnvYt2OB
 IfENqfzAoXBer32q85PKjMZRz2rbnEV3Q5hRMl3Yd+cLZ+Bgggm3SizKnyEUVEsOPG5u5e/UWdF
 VfWw6fncj22N8fWN4il1qeqCWwQpuYq1BbuxcWHT893G7cCwr+tEkLGlXL+RoeEhTZ79FjIOWLj
 nrjOzHE3F9R212pGr8mYVpoQim3b9qZFOAq3qjoZ0iRNLnROElCCvPsDxxdDhCMEznPjF+Lh08I
 s2lsMKsTVzytn+1wHItHP0kXCQgdfhgPAMPhTPoQ6pC3mpbH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: p1NfnyuqLTIINwSRPCtPRWH0bIUu2VU9
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a4c92a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=oy62-DSxHemnvxnUzX8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX6m/uke+QL4Bz
 2P/Z7j4vBUklNLfXvdXsLNWp1/PBrl9jVT0BANctyXnOkIHNY3SzlglzLjSJP8PRrJxiFFB/R0A
 ZMxIQn8Wyxshld3tPraM3pzreb9JJ/bUiUx0yXiY7fMYnM6RI2VuXwVL/fJvUsy3d7j+JJvncga
 XQNxMu9+8GFTy/19Kmb5AFRLHmGcczc9NbXjM5js9zMEHKiQNm6FeNY1rGdMopw/JFBn4cyPuYO
 gkzIX2xcrBliGUENllzs9KrI1epydukUdE+cqurbQtLfw26goV1oxQcshn9QWnpZTNdu4M2de1J
 qO/l5uelVuvvZk/+IE/YzNBKc6BhegpjKkIjaMlzArfjyQHm8EZauxUrzQjgoNEic+53/sk2pDl
 INmjk+5U
X-Proofpoint-ORIG-GUID: p1NfnyuqLTIINwSRPCtPRWH0bIUu2VU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_115747_792377_11E42FD3 
X-CRM114-Status: GOOD (  13.87  )
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..b982c2504a3112a77fbc8df9a39236cb8e625ea4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1084,6 +1084,9 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
+	hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_DRM,
 
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2


