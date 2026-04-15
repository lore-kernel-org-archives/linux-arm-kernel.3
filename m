Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB71F433D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 23:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoYO/dltykYoPLKNW3ahMj9QZ/WW1GzPElSF85LROqY=; b=RmtzmitR1NhiFQzfXhNSjGs14b
	bW+zLf9Yqf0nOUAhdAhqKeTJqw782Gz7BDembbsj+ObvTjQTwrxFzL2oaIRKlsa2VtvhsyyU0n8nR
	bIC43HV59TAJdi+kwQTwrQemgc+7s4nwxaC7MWuC58XyxEGYHft0RoyOGfDz1/43rwUWPp59Hccqb
	uea5QAE8LKtKKRXMxqDw1POpsZ/yztJURZL3qR+A1iHucDIabyxfdPoXPDP/VvXkYmW/pqBA9wblu
	0HB51TEZ9Re5bMMDHb3+FY05kwJCwgu4gG7Xxpoa/95Ynwj5aFiAzHZRb8mr7bKf7BB8zzz3njbBg
	1pZkQvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZJ-00000001jmz-3KnZ;
	Wed, 15 Apr 2026 23:22:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZG-00000001jjr-13CY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 23:22:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FFQEpu1702416
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 23:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZoYO/dltykYoPLKNW3ahMj9QZ/WW1GzPElSF85LROqY=; b=g09MrNJnRHLdHWgi
	9uj2h6yUKloyNbKSypu1vYKLlUIHqQS7Bi4IEwXxUAFFtp/U41fOCBx0PeUPlDjk
	ZLuctqZIDW84MWPIHmyXbkAZpeW3o2KAslECftGynDtxsy2c/ZsH6yUcG6kWG5c6
	e/RM4Rs8ajT00PdeJWYAgB8ZbgIjD/ptneM6WOeKWAgQmdAPqYjhwszd6ikTLinG
	jGpo0JK4NSEz2NH7vNS3egm7j68KbxhnsWEtX7kbeIMZqBvq1NQUH/vi4VFx2pHy
	pNdeDrPY8KG2k8Cur6igphFAKaB1vIZWL4CkzquNlUBw5HeSookC/a27pm+rGLQH
	KKgbjg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamhd06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 23:22:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d76f460b2so197417221cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 16:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295365; x=1776900165; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoYO/dltykYoPLKNW3ahMj9QZ/WW1GzPElSF85LROqY=;
        b=JyfBO4hr1DGwqXFF5mUgTejwFKNXDG08lFYh7MZYVkwgVyHT6JrYjFNktWHQFcH8tP
         a4jLf5ttT51UsTnKhYFSkuYOOE3jiau10KRSWus+IFCA9F+HPH6xvwbwI5qL3PzIajrN
         RobxW0J1Rhai0wSrxRq0CVqyqdo1F/s0E+1tQmKY2kXpG8MVA2akukxKfs5tJXgFE9zJ
         hak7hI3t5r6ujuKH/jgIk1RJ/udQUJwEYUJmz2xCEtsncZR36wcy5WVZuSCzSKfgNztc
         UZXc0pMjOqcc8ePNiYnAM1CkhOrr7lgm8G2S/MLbPhdmDBLFe2xAfyo6cr9DA1Ge9m44
         YV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295365; x=1776900165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZoYO/dltykYoPLKNW3ahMj9QZ/WW1GzPElSF85LROqY=;
        b=asEggyhNwCg25sFjngJBCzVYDL9XW54qPTu7kzOVnNirSmZmposUsi0MCgxxdcrfpD
         whOodr6oTT3f6NKoPwSkCBrhDvUWrasqChhB4Z0R2vkCctoRHf74OhGaX92XS+W0Wesw
         GCWlT9g1VxbfJdmGzfEa+qEHFgp2NdPhvbHbI7uqaVEt9jCpZU+u5RuMi6n91s6vCvJf
         +gpV1RUxeBE6dKEy/EC5LNBtyeWj90DVEFaPotuqI79tsgoY9jii7YRovl6QdKVCRqIs
         qKn0UkfxrKzFaNOTU05nFfNhQySXsgr3wMjSFE6GIMDopaGX8AvppuKw0kkQyOV9vGcb
         VKyw==
X-Forwarded-Encrypted: i=1; AFNElJ9DPQPMAMT1FF6rXybkW+O6ilqzehYoT4Rau90jrvcsj7yiThuPkQkL++AhuY4PEQ+c20xy5wI8/MKlbIMpwIaL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy81kqaWmz4uK9utfrfm9t6z+z8XlQTG6aaCcbiePP4Qdu+uGZC
	AmCIhO3e+13kHozGS+1cZVx4th5UMSATNEvZJ+aXuEfFJeqXq2DHvHxLEO3DCwtlAMM4qkIaRxr
	3tY8P2Ox4Ip5lp6BRyj/kq39xEEo2P4jgI5et4OkoyRwH73+lORKGb/JbgGbE2Nvtlzpy8MIk5t
	4O2A==
X-Gm-Gg: AeBDiestyJQRo8KhFpTz6HPNQru7cumClziKrJhXDWNm1HOVBIiSddKQaS5wmfpi/wM
	D2qrKYPhCqbTKXG1wr5gp+Sk4Xpq82yblZf6fg1ZtkJDKFnglKu/xIvz55c2DHmyf9eVayy9r6n
	oRpHKoNCS9ZNCmCBP9Odidju7Yw8yAq4zKhtPMN6aUpr5yRiaPLurLhzuxTP//C+shSgPaYztDv
	1hUGKqXT1sxGN0cEO1qy7Ojz7iu46ejM4mf/me5MItOFC7cBXgwAQLff674+UUI+BA4qPjY4utL
	wuGGG2YzhDLawLZLhF+CowRigxoo62bG56MpLc133Wh6lCblRvTIM1jS0Wn6QiYL2uADExZ/0U5
	hZmDOCxZmq8KfF5x+487DtOm+RoUgCUW1rLjhLbvZfL/vUp/qaay0OWT4dYzg9B5amL4cgqDAWw
	banz4vUQ/pY4IkwF/NzZ7x8e3VpPJaQ5t6ctEAGt1fTHc1eQ==
X-Received: by 2002:a05:622a:ca:b0:50d:e69c:fddd with SMTP id d75a77b69052e-50de69d0ab2mr290989561cf.36.1776295364510;
        Wed, 15 Apr 2026 16:22:44 -0700 (PDT)
X-Received: by 2002:a05:622a:ca:b0:50d:e69c:fddd with SMTP id d75a77b69052e-50de69d0ab2mr290989011cf.36.1776295363986;
        Wed, 15 Apr 2026 16:22:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:33 +0300
Subject: [PATCH 2/6] drm/bridge: pass down IRQ_HPD to the drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-hpd-irq-events-v1-2-1ab1f1cfb2b2@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=12643;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6rORaArznpSQQTKVl4Kfyi2yktT022Z5u+bODOjXSJw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B25qCkiDb9+iE2BeoGKl2Q1oeTgvlffW/Aa7
 0io9+1ZlsCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1QWAB/9wBep+eelol4BgqqokK0DSPhbOav8X1GICl2RUKLcA8yPvCyJ9cmsk0svCAZr6NKF3MEg
 yxJoc3jncoJbnOTBGdNrbmbj12uv5aRWod96Rf2kXiJnyYfQDF1A/fmKs5UNT1uEixt03Y6nZuG
 sLq1QU7oztnQFihmuEUByqKLnnqh1Ms5zl+ob9JhOrsFMEhhYVYGYjLwbsbOOlNMHYZyC9H39X7
 sO1pRBznlkIHboz340sLs+ohTehASX9UXtUpNlkWdEKs114OcoOhOp5H/U7JGN9pCzuIqNT/nGg
 HqnJUfKVj1oIljk2Iwek9QaprPCFVbuCf+nI51OkTr3o3GZv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: bL75WohVOOQPUGK0ZArRrKzgU2ifj6ij
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e01dc5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ytOayRieDpR7XCQrtqAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: bL75WohVOOQPUGK0ZArRrKzgU2ifj6ij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfX+P6RNuUr3+UH
 bnqe5C3+wVFafqhdNlEcZGxEaErQSotgYWTRoDGYMmH7st6L4qK2Givu11cwWSpN8GpxUyv2LtK
 T23u4bv5WXbrCXHkG0NE/qY7//ql9FeEnz4qF2yrPDQEtRDX3lW/YCLJkPCnVYME7lR1BzVvRy6
 NXsyu3dx6ut/crWTCs1MvXpi/dpstiofixeSttRRpFzpY5sxOfCtk7bT7kaQP31jNY1n3Vx+jNe
 SsKXC5uxpOMwy3VIMmf6pA68MTYa2M6XZoXZr5hPRvQyE7TNYRsSrv1wL1Ix6yg99yWb2SOUzpK
 CHOTVIHDdCF0/gNq6Xi+TYsemz77FWW+2QQnPcK7/+UUgj6Lh1GHrNHKXiCGLC7u8GtmQaZ+7fK
 DsaYXoKPSwkVPPNpbVqzJGvp+I03eq/3mxSV3oz8hYYQZ0ceBwtAqaHOLRoxloy+mDQEIhKvPVM
 ifk9OmJE/Hf/y88v9Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_162246_501962_E1928AE4 
X-CRM114-Status: GOOD (  18.16  )
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

Pass down the notifications about the IRQ_HPD events down to the
individual drivers, letting them handle those as required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  2 +-
 drivers/gpu/drm/display/drm_bridge_connector.c | 21 ++++++++++++---------
 drivers/gpu/drm/drm_bridge.c                   |  5 +++--
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 include/drm/drm_bridge.h                       |  8 +++++---
 include/drm/drm_connector.h                    |  3 ++-
 14 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 54d49d4882c8..6d932dbe062b 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -259,7 +259,7 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
 	.best_encoder = ch7033_connector_best_encoder,
 };
 
-static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
+static void ch7033_hpd_event(void *arg, enum drm_connector_status status, bool irq_hpd)
 {
 	struct ch7033_priv *priv = arg;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 8a0b48efca58..3ffbb7346418 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -504,7 +504,7 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
-static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status, bool irq_hpd)
 {
 	struct lt8912 *lt = data;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 11aab07d88df..7e5a110cfa1f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -430,7 +430,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					bool irq_hpd)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 3b6b0e92cf89..4111aa104256 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -110,7 +110,7 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(dvi->bridge.dev);
 }
 
-static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status, bool irq_hpd)
 {
 	struct tfp410 *dvi = arg;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 39cc18f78eda..749d3d63216c 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    bool irq_hpd)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -149,12 +150,12 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status);
+			bridge->funcs->hpd_notify(bridge, connector, status, irq_hpd);
 	}
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status, bool irq_hpd)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -163,24 +164,26 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, irq_hpd);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					bool irq_hpd)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status);
+	drm_bridge_connector_handle_hpd(cb_data, status, irq_hpd);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
-						   enum drm_connector_status status)
+						   enum drm_connector_status status,
+						   bool irq_hpd)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, irq_hpd);
 }
 
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
@@ -223,7 +226,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 		if (hdmi)
 			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, false);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d6f512b73389..9c44e9b6c638 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1444,7 +1444,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      bool irq_hpd),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1509,7 +1510,7 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, false);
 	mutex_unlock(&bridge->hpd_mutex);
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 5fdacbd84bd7..809ce38c4822 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3531,7 +3531,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, irq_hpd);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b8b6d62fb275..524d6c67ca54 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6784,7 +6784,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       bool irq_hpd)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 1abb0572bb5f..346c4d2e26e8 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
-					  enum drm_connector_status status)
+					  enum drm_connector_status status,
+					  bool irq_hpd)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d2124d625485..45e14a0010c2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1785,7 +1785,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status)
+			      enum drm_connector_status status,
+			      bool irq_hpd)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 9eb3431dd93a..5a877655d56c 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -41,6 +41,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status);
+			      enum drm_connector_status status,
+			      bool irq_hpd);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 29b2dfb90b5f..dae9e464889c 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -429,7 +429,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    bool irq_hpd)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index a8d67bd9ee50..4eea124c7eb7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -615,7 +615,8 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
-			   enum drm_connector_status status);
+			   enum drm_connector_status status,
+			   bool irq_hpd);
 
 	/**
 	 * @hpd_enable:
@@ -1260,7 +1261,7 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status, bool irq_hpd);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1550,7 +1551,8 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      bool irq_hpd),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify(struct drm_bridge *bridge,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e8e7e6c9eb5c..e164b0dbaa47 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1704,7 +1704,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  bool irq_hpd);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3


