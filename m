Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743A3CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqxjcA7v9kQUHsW1dWHX4LPd+nTqAg1ssnBO5hXevIc=; b=s26Gd27k51zsg4WAMyF94ljoWZ
	aTg4yMrp36oJDjr6scK5Bi31YPgCYT63daNxomnCQITW5/AI85xG0mDE6IPK7qyFnmCWK1OjwjI9V
	T0Oy6DTNTRbPWThx70q9OPv1x6PeH9D5hA+D44ovyOvpNsNpww58KwTmZzAHjgvf5FGx8/bGDYFvb
	CITO+DprmNwQOGZPVTefQW+TzRA2HNFo0C+w4Capp614nt3W2bFaPnlmhdMvADzg2VG0AGN/ZRPIO
	XhKLw+G4yuk22e732t/SjsqinFnVungYphkZ4WvAakU3VXo2rU83ST/vomLT2ZANkTkqn7pbTrwrq
	e4Ubsp9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw22d-00000008yrg-1Bqm;
	Tue, 09 Sep 2025 17:22:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvzi0-00000007sOC-0jU3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:52:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LRfE023879
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Sep 2025 14:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AqxjcA7v9kQUHsW1dWHX4LPd+nTqAg1ssnBO5hXevIc=; b=DlhjBKE6vXrJs7eF
	/Ui+StvzdUKZ5fYxSLyNpcJxGo+zkaXklrif3Nr7+EgoHdEfNgbCcj3VRKDSBngm
	NwGtpxq1eUc5oJyMJcVnhydxdcWM9UCv01QJWRMHrAJnWGYd+tQ3KTqQoZlCv1KO
	L3HlGgYLVuvx5i/B62w6ulRsPYaK/4BxjsXISYjXwg0T/wwdC96XrP3jptrwWy2M
	aIBLZGVh7YhQ4mQeenJdK661KOiQ4sToqjxDOZy48fj/i1bpTZ/Tb94+xt+Psdss
	oYgcc+CsvngX7nnMSzqby8cYWdZahm3SUZ/vAccW19867zrbmO9G6Xtr+IRV9tiS
	MOoJ0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by90m5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:52:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-816a52d9a6bso318639285a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 07:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429554; x=1758034354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqxjcA7v9kQUHsW1dWHX4LPd+nTqAg1ssnBO5hXevIc=;
        b=LRlrxOds6ddIjTx1qcoKs1bARBUR+rK4fM3V/vGlnC/UjVgI/mcM2ZmTqTsYnKvKCE
         5v/ZmJidm25TmvvPz2KtEbphjiT81rRF50vNOgDFquP12wpkwSvkZHTtOaiMK0yquAaW
         SmmUQoJ9T8bSvnYkedFgibERgdbAO8cz9yHa6wc/TPfThvSW9xmh0IKmQiK3HW9X9kdD
         JtOnwisnwLyT4e/9QTOqvTlfztbeQR0XQeJp+ffXXCtHKY+j65IveT9e9kqId+SUz0Pm
         4TbEwYv4gVloo+tYHuhsHh7duPCajr2f7E/J2MOClBHY+QbYGtRKFrwZN50LyF0vLhjq
         Iafw==
X-Forwarded-Encrypted: i=1; AJvYcCUmnADptr/pjckyIXIJcQYjO1qvWx0NeVaVjs/ccMZJVHwdV3/+bPLUnl7Zf4oz0yxbyXgLSQC/hmnSSp423Utk@lists.infradead.org
X-Gm-Message-State: AOJu0YySwtr+h6FquhYygwFVtniAcnXFdUHVdXQkMYPMoxRNd7IyIWuX
	zmweNpMlOc8ndqD1UDZQhcjz70mjcCktzmPf7q76HKx62pklHiP7N45dWx/TBBqXlFROU3d1Epf
	YnHHEaAzJtydg/Lt21zVQpwKMBt6YjFovyVtBcFZJ+C+CoJMeM5d9b/iVAroEDiQ6eW8HuQjRJM
	jpdQ==
X-Gm-Gg: ASbGnct/1Zd4jippQR0jFHErx9nggWm1L7XLq/IoIsnQNhiToRXYcB1JRVrA8d7tCh1
	ahi2rpfwMRssndvczR6KrTc7fStXxkoZMhQAorObr66l9Y0YBXLBM1XhcQB2C4+nwnuDY0CzGw0
	XofcA4GLm+0bfVs5m+YJiLr6rkqZj5+nsC5ggyvhS5HME1yvr0py61lTLJMxQ8SbZS53W+YnpTg
	eN1+8CQ/KJ9/34IYFRZMoYtSaOe1KycmNeR2JRpknGaFM70iTeQPZTU602Z/iw1rpUOZs9VbzEW
	ZsLW1l8UOvbrm3w0OcmEp3074VdrdNRJ/PQzRm1UBdVXisk3vkDeTqvqKdYfOO4zGqxygU+Pnmi
	bGXgVlgltvELSMvHL2NK/Wpx37CV+PrkgHhOPgW7448Gzan3Gc2hq
X-Received: by 2002:a05:6214:21e9:b0:709:cf54:2cb6 with SMTP id 6a1803df08f44-73924e24079mr131513846d6.16.1757429554119;
        Tue, 09 Sep 2025 07:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELvHh+YLlPgh4Yd5dwaizGOKRDtwIRu4dOckQfLSj453ZKMPo3ZARJmUDs6l5WC0UTNyT2YA==
X-Received: by 2002:a05:6214:21e9:b0:709:cf54:2cb6 with SMTP id 6a1803df08f44-73924e24079mr131513396d6.16.1757429553493;
        Tue, 09 Sep 2025 07:52:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:06 +0300
Subject: [PATCH v4 08/10] drm/display: bridge_connector: drop default list
 for HDMI Infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-8-53fd0a65a4a2@oss.qualcomm.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
In-Reply-To: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SH5p1NXLdtPpRbZHLxmXRUJRNEhWUgJZ/FZhGKys6U8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8blvrwI5L8dQHSUz/xZ6GHVeuDdbZGULZMV
 WuEhl8+3y6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1TrPB/4iqW/Wm2SYljGHlxILyUx1w3ArHNHCeDStNLT25ZG6XUwvH3rLYMRzQQCcX3XYeP9w7/n
 br7LaRGkE7OOakFZ28SR+/IG8O9407EpzXyWAjNajt3AwRuXMI1ceXUB70WoQYyiQ2p86sx2sD8
 rk96tIGNTj+Qk3LLtNOfFhhU2mKk8vZ+7IJmun34/LLVdMgr6WGEYUI0HHvcXsWauvVUd9QcMXW
 48EwXLxeCxs4iM+SI02SHlOAp3svBZc/AL4f0u89V/Pxi6cQuvVzavQ1SrBcuQHP8kYGG5WVMlS
 yLTVNPBw8cDByk+YH6FlumiErNCqzW648OHti/7E+XtKyrw6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c03f33 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=uJ1-o3tuYwvhD5ZCdfEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: b03_OYL18mPLLfgKiQzzReAghujaJ9Z2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX53TFJeeLMyx2
 RAs0uCrbS+UBsLL6Xyc52QD10mbhSJYGE1J/vlTo7CixgNFnT3MpsKECJm/ptrew249LJKIBkku
 YYtki+33kRacSJj/sZPNVDHlCD/1rZygJ+UIOE87PLC+N6YALzOZMU9mC7AIPbQ5ZRoJRGuYR3m
 8kRI3I3x0PGwA90MYeRxFpkcrGWfLD/+sh8OFoFMcf9ZkSlguPfBYIqd3sjEUj3umOZrHL9aDOd
 1FYiP1YlhdbbzTzVz8IthXjnJLLWWu/wnXrr0Z5mAF6Mdm5FB8HLL9I9h7+wwKlATzNwrUibA/n
 ybK/sYJgpUPH6mejHSw8FeF8ootK9yjSnLditWbls6U5lZpnj9Wspf1pOq03yINzYOtExTJl9O/
 Rcf7Yocm
X-Proofpoint-ORIG-GUID: b03_OYL18mPLLfgKiQzzReAghujaJ9Z2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_075236_374388_0FDA2533 
X-CRM114-Status: GOOD (  14.33  )
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

Now as all bridges are updated to list supported HDMI InfoFrames, drop
the default value from drm_bridge_connector_init(). All HDMI bridges now
have to declare all supported InfoFrames.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 55bf5ac53739fda098be69a5c61e4934704ce046..05dc2b61643af5316df431a3cbf53b86139a63e9 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -783,12 +783,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       &drm_bridge_connector_hdmi_funcs,
 					       connector_type, ddc,
 					       supported_formats,
-					       bridge->supported_infoframes ? |
-					       DRM_CONNECTOR_INFOFRAME_AUDIO |
-					       DRM_CONNECTOR_INFOFRAME_AVI |
-					       DRM_CONNECTOR_INFOFRAME_DRM |
-					       DRM_CONNECTOR_INFOFRAME_SPD |
-					       DRM_CONNECTOR_INFOFRAME_VENDOR,
+					       bridge->supported_infoframes,
 					       max_bpc);
 		if (ret)
 			return ERR_PTR(ret);

-- 
2.47.3


