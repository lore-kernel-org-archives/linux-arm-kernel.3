Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94096CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 12:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=; b=rJaeBMmXA0Vy20nlv5YzSfLR0O
	rHhDRXAVomBF/Zlm9P+w+8pOJo9GRpq+/pMGpmDmBAlG7cRI0a1Pn5YhpHlWhk6U9AfJHtzUa19S/
	qNjyO7kRxZoPbdjJUtWSXf40EGaRyRKMp0kHMPmmZoYm9ZwLKean/7re1A38YoUd+btJCodpjO66W
	9AX77Jzn5RRxClB++EpqvWguqxjBkqA9F9XFnd1PDpGwE1f68jUDSTtAitQwSYHsjxw5hPjJe9FlX
	+HfbdmNDUwKzm43JdElnWXkcWO/th1DhRoPnmxmNG4bjQchVXk/566dxG++Ddilzz/LaVS6/n9Dto
	rR4SNIKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unGUB-00000004eC8-2OiI;
	Sat, 16 Aug 2025 12:58:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unGDl-00000004cjU-2d0T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 12:41:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3PoqI030362
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 12:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=; b=ghy7ow3IhXPGTqxh
	rU4w33RBBu9X2DhL/a3zk5EKlCbeZqSqXPiDZgI+ZOqS+s/MpP9WCKD7YeKnB+N/
	NbgE/2btK/ESkOEbf+ABvy2OU8zm4qLvgDMwh2Up6tJpZlgZPcpnP1slSbCv4zTF
	IL6OiD80boGZjmdAZ51B+0tpfRVdyJNyvRuFQZHD/2EOyHaWlodp7Z69InLwRg0C
	+I2jjjAoauJeGmyy3hmJI8vJjoqWoCw9RQOxrToalLnQlO3R00jW1Bd4SBd1lY2N
	gxc6uYuBbls3UEoMtXdNXhBIDmfwpHCLedeIVi2hE+nO4WlpVwP+LOkoWoDnnGZE
	MEt89w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2u8mvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 12:41:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70ba7aa11c2so30030546d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 05:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755348076; x=1755952876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=;
        b=Ghp6ar64TiwhL1pXB98xuioCDlIDHXIXcAyW9RHVP2xTJ6OKBFv1546L8x+2PEfB5o
         Fc7nfa681F5PHElvpxo2MX4b6c8FxrFNVVmCaT1r4II3IU0oO5iSJIOX+bWPdnewxOmz
         UXSfuWeFUgcD/Erz2rskTx1jV2jEllV0oTKAbB4vU9IFO3bYEWnAvuttTQ6DQWwt/IW2
         FSOFmIJXci2G2sNx7qVf4NJ4YAMx+i7117JlnFpjWgyUjguPnqXNHMVd79PWmdn8YXvA
         W3TCJ7rmzLk5dm6u6eiCK6UO/J3NhYObgjOjtAvZfG9JGIoA9IZveDLd6SIp8Yhf1QVd
         rLhw==
X-Forwarded-Encrypted: i=1; AJvYcCXG0likSTHr/h9B4/b9k8qlNbp7U7ZrIYMJ4/M7qSj5TMyfefYjr5Z//B8qYB3NHNXb5obytAJbIiW3k/qevpBQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8mZlIbq0ffu9Xkhq1J/9gJbkTJ2own1dCpMgSWN6vtsRBa8yy
	Xtil5bxlGESlbyXvM5m175OOqW2I8hCNwWll4HyhzuEOU+hk6pXuOuUEUM8N8TAQi9DWnOVs+sw
	B7kVbNErXqqqZ87vLN2J9gBUHZ1IBlVlzwyTVfxZseMbLFetDbH6tl4B/5KrlcKImL0ySQs02lL
	SuQA==
X-Gm-Gg: ASbGncvSFbr6Y8DcdfYsEJSE04MjF2R8u9Aj5pKdZYtC6qmH7eLLPmiBJDTd46rjzEP
	zso297Smm+7m59Bduk1Fho8pGCaoZ+5InkdZZfyPMB6hlCQD38fBJ0kG96nVEYXKhIq3ERQLz6L
	Rmmf6hd4NqRQp63Gzyx6SxP1J3n3Xehd4OgeNbD63lMsNhSH4XW9SpbqAMAlZOtZZU8Oar5kSI+
	jUNsut1147AGPqE4XLxK6AuqLF3NghQdKTF9pghOXcfOYOyDuji5zspB8IZZPrI1kn2gyRrC1y8
	VqPk3MPeENT4aLfgYGgIcB98kpLV2wZYWDBVxBW7tqTzAFV5ngwCept5KVnIq/WyCSG/m8hw0QY
	xpuRjw7z7/iWs1QGkVVmv8dmwRr1OBfh2zbU1Ehf7j5RTUNyy9tiS
X-Received: by 2002:ad4:5fce:0:b0:702:b805:276b with SMTP id 6a1803df08f44-70ba7b0fb72mr68628026d6.20.1755348075966;
        Sat, 16 Aug 2025 05:41:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3UdiNBmKcbNBSZ74rRqQydXtIbuAXtAkdOOj4dUPQcZFQgwFXOOSXEuXuI37B1EPLUu9GHg==
X-Received: by 2002:ad4:5fce:0:b0:702:b805:276b with SMTP id 6a1803df08f44-70ba7b0fb72mr68627786d6.20.1755348075573;
        Sat, 16 Aug 2025 05:41:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 05:41:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:05 +0300
Subject: [PATCH 5/7] drm/bridge: synopsys/dw-hdmi-qp: declare supported
 infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-5-6dc17d5f07e9@oss.qualcomm.com>
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
In-Reply-To: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxfF817cuWm0x9Ld7mSI9y3aEDv6yVOAaz6B
 PUV1yKfX8eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XwAKCRCLPIo+Aiko
 1YeJCACinc5gTz7egfGIB6yk437KFDLl0hTcWhDnfZD9zWOokKCZsuwjgqgvP++oHdIB/be2QcT
 Zp52KAZ10Legd6GZihS8hapT4SrGoW7JbJeeaLydKZcWSQiqGGw8cj0ORAXsTvnFGhql41oNCAu
 AyHGwl+aAB38jVvd75yA/n7qZRM6iKDKeQMJbQm8Xo4EEXg0Vu66iCDPWSojU6TBTNeJPB8qk6+
 SUZJhUXTFUN48tRXFM7oHP/Rp/1AvxRedsNDY/trIp57DbbpxwgD7NVyWe+Y1LmlDm91m+TTX0/
 158PCZIFuFMCsoNY810tLXPPkT1IJScS1Xraf8Nuc82coAtx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a07c6c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=oy62-DSxHemnvxnUzX8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: UfjZUA2YJYMCrz1VeCoYM89Hf8DqvQrC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX0ZjNhKhZ1ysA
 NpJj82A4pUgYapa9PGzd9G4y6VPRq6v9qFpemQbFAAbzed3p3gL1y1XVCFVpK3JN0wPP9DkHUz+
 M9Yx3oD2iUi5cUecp4tP0hlrQ0w4UOOJMCQfgh5NjBzJ2tqxdhPLpf4IfDehpCWJ+DOVUTgfF+p
 Ef9GbvEUVPw7Xxx8exPZjMVfVAtJqc0TODQ31BuJsXx94ioTH+yM0Nb+Un0ug+R2DwhPhhTsAZJ
 lZqau56fqzSAhU1wA7qqaoXt89LM1qLwv/T+zyi9CRYelGCzdpZe1xGhzOQ8e0XGbKWJq7ei0TK
 jPNk/OmTaY/yNjkXkWvbjU0pqnycLCnIMMrX5Zssvf/OTx5WANEGs8C5AokAXlKwsGFeH9SWKiU
 Ctx8L2qZ
X-Proofpoint-GUID: UfjZUA2YJYMCrz1VeCoYM89Hf8DqvQrC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_054117_825892_19E8E43F 
X-CRM114-Status: GOOD (  12.63  )
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


