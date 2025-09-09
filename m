Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3823CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PE+T/FZyuTmpvyf7ua/nvmZNTNQAEt/0dfhmApWw+vg=; b=dlXyLbwzOJWPavOuYIwHPLz8hp
	a6Belz/YIdrO0oE0quPXFHIJNinnXcfZlqdJXduehg5yKM9j1adU2Wptbo55AXt7zAhIYHdx3CArJ
	SsYVn9jSAFW0wzSCZIojwf+5SZYWhT0hC/t4ASv8cMfB1WTbxQYJ+FFfNsu/vk2ESwR0ju7Y5dqfF
	/q4dDYtA57LR8hQUtghrSPNFw2PXNOnKBI/cV9ZccPlnbF7rGER+IQg6gpqhOd3bOL98OAjXtuCHE
	h1/uZL9xED7hY0eWOokCeu75YyBUyfBnO8VVezPg+eAB6/kigXo8Wbgqsugqp7kRO2+GK5Nna74hQ
	tpZWzLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw22A-00000008yAq-07Ki;
	Tue, 09 Sep 2025 17:21:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvzhl-00000007sBd-2qTf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:52:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899M2Mo002280
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Sep 2025 14:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PE+T/FZyuTmpvyf7ua/nvmZNTNQAEt/0dfhmApWw+vg=; b=dE3M6rSJ5PgGEMhe
	RuFknfV1pMtgdva4C58/L5YBG0c/3x1O0gTcymygz9Jrj6ey0eX5G83og2CHnJA4
	zeqFReSVAgfm/ag1z76O9HZpIZgnLeoWsQ8cGKRRL8XnCDD2QZUPJ4Y8e2ekBcc4
	/4qdHhS39lfzHGuzirN4eUjrGBw8Yy/sceJw6boWKYFag0J4JwCzvQzXMpsOVrgf
	sNh36Gt6G3GjIBrqIaImqtkvdodoVnulx2qQdECLQmo40A/WFFVw7tByGfykIU0P
	ge0BzjmRriKxxYlX93ia/IEylKEnaLUv8Z2Fg0XxF5IEQGLAS0OQZPf2AQT3FSe8
	xiNMnQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg0dxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:52:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-718c2590e94so157519256d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 07:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429537; x=1758034337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PE+T/FZyuTmpvyf7ua/nvmZNTNQAEt/0dfhmApWw+vg=;
        b=Pjek66vEI4qhUcuGgsh3YpKjdcLkkpzYvQzw2Y+KtPVfz7pOCr2h5+cqdNrSf7su03
         EdceqIZ1tw8bxyC0Nadm2zE5rfH60lQs6N8m7we322QDGyUYjnykjPQk+Gna1WDGpMzd
         WNTtq8uQVcZl/Ezr2T9t9B5G9J+5f3IJpAgWgtT3sGyhLHXeSsIoF3l8MX+mXuwlxAY/
         clkLdl4PK541J7nLRbT6OyI5bmQRzsiI52fP/tEy2RayDzpsfDMTdm9H98YqgR6B+Mbq
         R3I7FqKQ0H54lhwAP6RpqlLy+tuNeP68VrXCWg0FBRiao3wrTGwUbDrfNS5rhiwK0ac+
         9zHA==
X-Forwarded-Encrypted: i=1; AJvYcCWYwR5IwXwYpWZ2BZGGyke9djBY7LGHp6m5PRHQ7+zdq+fKuaPL9B5bvdGAOmXxLtqIM0vvOvCOCUHowGzs4KhL@lists.infradead.org
X-Gm-Message-State: AOJu0YxlMIEwCmNIiVgoHgZ1+8J8U85vWxppQaV62S76td2XrixUoaAG
	II0eE1AZYDcwngO0D6h/25H8s7BcezzUfAxXfFx+FNArvsDJajkjJbKOT5VK4gdNq5dpr4PFuzi
	y2Uubp2Uox0C9FLggCweiU2DzTHD+ZGnn4i7saZ6JBm9Dns8ihdMkYZw2MFQXU0397RIy8xRZdM
	KL8w==
X-Gm-Gg: ASbGncvJfESPhlc4EQb7T1mRhrLkcb5TVGiQNadmg2r/qYCOCCfoQLKeirHNhWzCxQ1
	9pWkANnxr9Zm5gXXIJANkqY9wpK2Yj6kOOpJ9ifHolyRBd1eJOyzZycHOn7NJM9Poy6rBH+p8Er
	WuC/AGZbz/nkQDPcC5ZEDyxg+0hWMS63HiWGQqiXPzDYw2tlt0AnihQvQ53yFDPgAH99i++Nk02
	Yl+moux6v2mQ2eQTFNJ1kJw0z4d/QH0IW/GBCbngxf8gRgDxMzqapnustkFPlRuHVo0t77CNNu0
	MVY6Fgr4qipCmkssvc01XsX4sLBWhgb02pAlg9vaSzbfhoo/xFoFMLbK8U1NZ/6lpcFSbMb5E7d
	NXM979F8iwUxGgzxwEMIvh6DlQWkuM9+5JK8qhd9VDm43M8wMqkZd
X-Received: by 2002:ad4:5de2:0:b0:722:2301:315 with SMTP id 6a1803df08f44-72bc4f93957mr184627876d6.29.1757429537114;
        Tue, 09 Sep 2025 07:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6VRM/IqVRJKXO81d0zT+XPixBAwFdKLiapVJ34MeMBozB2in+dHoYjUEUQ6Ok2p00fI7S1A==
X-Received: by 2002:ad4:5de2:0:b0:722:2301:315 with SMTP id 6a1803df08f44-72bc4f93957mr184627466d6.29.1757429536407;
        Tue, 09 Sep 2025 07:52:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:00 +0300
Subject: [PATCH v4 02/10] drm/bridge: adv7511: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-2-53fd0a65a4a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HknzX0xAST5U5QLgNvfO11z5aVo3wOUQOzJF7QU1MaI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8aH5xYcnrhsuEgstp3NDxwVu4bKX6MZD2EA
 4Yu1jcDcBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GgAKCRCLPIo+Aiko
 1TL+B/9MGL4mOR5FQjVfkhA/rQpcknnZoUMUAO2Gqv9h5Cz3u4e16jwPuv5boINoPhZebsK2s+y
 BrjiL1vqNJBOSO/UTkOjx/0fS8qhkk3L5Yv+bNbRqKEfdkUhtA25C8oq5pcAK3F8syC7y4p7S54
 /gF1zO66ME26uY668yT5CVicNHoQ+CGhnN51eeDSMSu69RotLmN7ZhVaUrnI+eeCkKs5zbqyZKN
 NIip2uT0ZPB0mWKx9MTQae77WC4y68wdJUpmh7jQklseJFf8M2MUTedWFV6PvWAs1vBjl3henPA
 rHDVrA+r1ygL8hZqca9H5UpXs3QjLHc65unr3Y/miZKmpJ0n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: cl9N8zoIw5B8LZT-0c_esllh7vdH88DJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX+C0aR+I3ZQi2
 Tu/FdGmzXIa109QAJn56bqtb0qDRdI//qqpJ73mJ+//E6UVmzNypT5fU00X7MOCSOqUiq2USi9n
 QzmF/scc2amJd6F2+OL2QinfLDIa9FeV/qeYsCPXgUP0HSv2xw1F9y6xAjcDIvfnq/KrSFUO+Xx
 UzgOR82y/quQXVkw7Wc3lCDtR0iZocx0TRBu3Gwb31ur5VU9SQFvtRZtms74teaEnWCGYm8ct5q
 3tfWJhfnfMBX3ywfhVdJDe9dAMlFaCOGzW9YWssKXKmq1r6YuX2GnQmOksrCEceMt4bC/FpDe5g
 StHdJHbGt77GF812Y2laRFlaJzc2JFuEnZ6lWKmdEeLdqxYhTn1XvUB3Fzfd19wwUFo6cbYZDP7
 NKlmrSlA
X-Proofpoint-GUID: cl9N8zoIw5B8LZT-0c_esllh7vdH88DJ
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c03f25 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=2sjEEKaKrRP40jhUrFQA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_075221_727267_2ED3150F 
X-CRM114-Status: GOOD (  14.94  )
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
interface. Return -EOPNOTSUPP if the driver is asked to write or clear
the unsupported InfoFrame.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b9be8654130758e69ac7ccbc73a82cc25d731a5c..280a5f82ebb0c792a0667e9f55af103f29ff2948 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -907,7 +907,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -967,7 +967,7 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -1328,6 +1328,11 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.vendor = "Analog";
 	adv7511->bridge.product = adv7511->info->name;
+	adv7511->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;

-- 
2.47.3


