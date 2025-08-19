Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31EBCA0EF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 20:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBBRBvbZmhS5MEDtIi65bqiX0+TlTd1eeG9t75hRPEA=; b=3CuZEm+PXd0Mj29HeoyP2xibIF
	zPuooEUW6ReLqa+Dw7aAf4KlwSfsdKYPM22EzP6+OpfXvftKP2CI9uwCmBUWatzhv9hSbUkHRkD7f
	BTdtsHDSblE+CyzlUo0oWOop38p0eIsuJkRMJd5fTTh7rAGZWod/alIYNVWBc81MJE/QbtwoMyY8O
	CTDW5ht0zudT/BB+aKHnmDRr8h/qMZT/finFTJxKGuqYoaurh/XB6dNMkQExmTQlq1uazhRA6TEit
	3CsyR17lWxNmQlPNHMHuNdKydpkjYoygEAJNeACoMQ8MdEhttQwkQwDoX6KWyjelYOh4iTcnzeXJV
	L7HYQf5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTAd-0000000BZCO-3MS4;
	Tue, 19 Aug 2025 20:43:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRWe-0000000BM0N-1zJl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 18:57:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JH8inN017995
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 18:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBBRBvbZmhS5MEDtIi65bqiX0+TlTd1eeG9t75hRPEA=; b=NzFJ13MhLvh6Bnun
	6DKGWugHWCVVrx8FpY/hRr8H1/ooMbiRryBJkFoSclfqlDk91UnqsGfiNXDhNija
	m2dBRb9dm3qR781HHpFFOnQKhQSA6O4ymbUb322SP3N86Lj7hKKOrw4Kayv1/CZ4
	d5sTz240KODEl/jAlbTygJaarMMgDohV6MrBxXBV4mMJ/PslzOhTMVEsVl343ujB
	TYvn7n80AL4Bxcmq1mHhKjg8KGNiSeaahC1cYLRb6z4unbAiAvEUVsaUt+csbqLG
	mnjCA6a7AD2M4pR2hNlAM5tABWKXAoQcRosMgKLT5HrxqRZoh7YC8PV//NhjIYNV
	X7Vhmw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhah1kk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 18:57:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a9f57f950so121855576d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 11:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629859; x=1756234659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBBRBvbZmhS5MEDtIi65bqiX0+TlTd1eeG9t75hRPEA=;
        b=jSjmmsKNamVKKIwzqwz4lYpktQDzpoRYE7+eJAiK3FVkBPttK4Y8DDCldGLBU+7iC8
         ucJNawl94ywXq4mns8PytQjVut7c6aaB5/nKgch8CLzLkMBSHWJcUE1GcSTSS1iAlfcm
         j4zzcGs3mB9L3zWJOaPm8dC51gZK2oL0YUSboL0Zif7vKnhhToAuah3iORbbZAFZ3oZH
         OlbDFbGknpByT1GA3+0ht98QIhMRDJ8T7oFqdC9E3OZzImAAPHBx75LAf0h1eX5Z39k2
         E8JU/FQF3SfLRUIeFCcDBTRTwF0s6vYMufO4WeJrESDRYvVhpwjhxYOkY3e1VZhrTOBM
         fU3w==
X-Forwarded-Encrypted: i=1; AJvYcCXGfCjbaTSj5GWwy7HRC7HR28iMW3CILqQpAY5/gAvJh1JLWXsVwePtbvJKNzEA9erh8cO5cH3PPAX8OMNntyRB@lists.infradead.org
X-Gm-Message-State: AOJu0YzoJoBPA0SH0XJgpamp8P8d/TIeomJx7lKrJOcYqaI/iTRbUPdn
	RA5CX9pWG/++cHTj4B0Ho9Z8xlnQs+htc9Su6e1G1+9h0WxntEwX8tq4dv+s9qf+WnTcrXwzWhI
	21Syx+KsyghnZpD96VlDyqjfomqixE/fvCcRmTms0VMzXX36f15Qufb+IJhvrLe0yegKSuTzGyU
	sIzw==
X-Gm-Gg: ASbGncs1018CsbfRzys3jxkI7Lt0rzdeeo3gx/gJSRJRYccR8wpjX5ZenvIGbl/u78P
	etHCyJaKbBmMOI1fl13XZXuNnCMxBiHp3xgXB+ZcQUwCtseQqcepNBN8AWYbat1v0Ekup1pk/Aj
	dZUWu1BFpWdOB3lzxH9dchq/VvxZ66gvesgoMX6ptKx5uUrqvKljfD++HOpv7cliYpGauMPUcUf
	1zdqdlHFFuW/stqp1dkMHLxb/JEkyYmoD7DYGOYeIft0+r/5JF7KkIoz9NyuwUw4GvMKQBRTr18
	M4C1vlEjt0DbV5wqYEk8cHgo7kpEJgg1ZMuY3nyz2jkiIUKIw4+Kv5a83zmgeHaETR5rD6THV8w
	GN6bGN9OcAtIhdiQJL+6DfYT2YFEjo3EcVqHuVyOiFAUpfrKw45Ws
X-Received: by 2002:ad4:4ea3:0:b0:707:a430:e01b with SMTP id 6a1803df08f44-70d76f864camr1093126d6.3.1755629858905;
        Tue, 19 Aug 2025 11:57:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/O/W7rZNwwvVUGg1YhZMXZwis1OZ4X2shsfzNvq0AeHMh3ORjwG9eDWtEMthq/2S8G4RA+g==
X-Received: by 2002:ad4:4ea3:0:b0:707:a430:e01b with SMTP id 6a1803df08f44-70d76f864camr1092586d6.3.1755629858342;
        Tue, 19 Aug 2025 11:57:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:57:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:31 +0300
Subject: [PATCH v2 2/8] drm/bridge: adv7511: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-2-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ics5UJu435PTkR3N2XAnDPkmPWB0LL/sCgBg7ErLZlw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkbp/0MMomngf1L19CchYk3PLIvKZT5b3Sqc
 f6uAOG3abKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJGwAKCRCLPIo+Aiko
 1R2QB/9n5FpX6DEBpD5aLDh4BlYRZz+O8I9IOmTSO5TVq+bDT1D5c2WLxzQ4Td4kBMk1+Uu5p72
 3Qxf+QIPoHmANeB/F9CQXl2GSb8D+EPFfAiTZGjv68fM99RgbuaegsAu0O68QJolHhicnH3oG//
 neaovHBHmAtObPBED/kl3uRy0BlRcx0hhOyLx9xzbQ4SBmRlJibWr9zwLUyZea7P7ab+Qm2p0zL
 McKbULlvp0OUS8K+3ajdL40S0JMbYFxygrjTMdABv1d7mveJyp3GI8I9mLJjT4KrSEvy7TxCTDj
 BbL1/CutAHVSKCOEN5VVNxy02M5cuXz0Umc8l126pp2h81O4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a4c923 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=BPUVXzEUzielt3HhGKsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 6e9CQDncfOmVAIdP3chhY6TRaE2sCVF6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX99mGJp8BmAoV
 1ukCafkp4guakZGFr3fSkee7N58z5+d9T9yJbgjqdAAX1WpzY0QHpSpjXYCt6K88oa6HOhsP73Q
 LvKpxMiKqvfsNDeFzoo8CazmfAp1sj35FAd0RheZLzp53MJEGELoe3MSfOXKjdljfBewtpl/Q51
 nTC+TYye4ZoQcfbHcyYDkZQSjZo85j/bzf5CE3BzGGePp/QTej+hM0t9WFNDxsjeEwisVuN7haw
 nU2SNVyCEUWvOt9JH02lBTQrUUnhWcmsdB75gNtuAA41K+tAh34gk1N2G2ultTrG5REWV6dpwH/
 k6Qd0DQBvp8XAN/BGmXrdz/vf0r80f1sW6N1zAv7MNxUcdg33vAunNFbRg5NcodHoxzplx23eha
 /O+x3Avw
X-Proofpoint-GUID: 6e9CQDncfOmVAIdP3chhY6TRaE2sCVF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_115740_635832_7EEE538A 
X-CRM114-Status: GOOD (  13.90  )
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
interface. Audio infoframe is handled separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 00d6417c177b430cb1a81118800588b90c692018..a9b2757d7a2cda1064cbc564cdded429056dde0a 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1269,6 +1269,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.vendor = "Analog";
 	adv7511->bridge.product = adv7511->info->name;
+	adv7511->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;

-- 
2.47.2


