Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5124CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ujv5iDRR/UPV1fz0cyEkNiBZUtwrZ71AsQeEvESnh8=; b=dB3/MhMbDpgjgyPoI8O4sCQ8L4
	aeZZY7nHSoAHnBQ9SGWSf7wSNKtfcckdvkeWH7C6C4DehvHShu56UkisTkp+ThnBRY4T9ITgwDoBd
	LMp+JiBJkXgVOa+Xn/ens74LZ4ycwSZy0V78NkjC7GshOR0yGSLPiUfTQmImONZVHTDk971aPGPQf
	JLuzAIkVaq6CChpBI5wepp8VEymAuE+XFnzxC/o4sHUhEZuVU5MBH6PXPYcPHo9esdQBLuwCiqvLD
	XYHeXTAkOmCSntDnSGomVRfoSybwRoqjFUCfPOEgkuIwXizUu2a8EQ8pZkjOJX9gPF7O47Yqi4ylW
	edDdJ3Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw22X-00000008ylT-0fyY;
	Tue, 09 Sep 2025 17:21:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvzhy-00000007sN6-3Q69
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:52:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899Lef2009820
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Sep 2025 14:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ujv5iDRR/UPV1fz0cyEkNiBZUtwrZ71AsQeEvESnh8=; b=e6TqS0/ssnGW24VL
	j8HX5wKhyBO4sXU9zUir2ZnJHrVMlNS9axjvKQUU5CtMNGYCXedC6vV84tyvOIA+
	JK0QHyo5ulNlBcwusOcfhes5nCG28AB4L+FdQ0RfNAo9VUvdV8n9d5pxvH+T2jPQ
	fywkM9O728VyETuFjOtXkcS67+njKXk9bb9i7prOjA+2W8ChQvUb6xKCmiN1jP/A
	N/a8zlM9PCHCdc1I4WO3ax+fjXcGUWD1zOmIOrgbQfpVHzoO7vQe5TBdR/GGV039
	ilu/g+4fG7gVnFTOsM5UHbqO/miyayN87A9dvsx9NtJtLcfYOynsX+WZEbNsFQ+O
	G/d05g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdwcfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:52:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-724ee8d2a33so121202786d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 07:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429553; x=1758034353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ujv5iDRR/UPV1fz0cyEkNiBZUtwrZ71AsQeEvESnh8=;
        b=SbaKJlsyiGwpruPD2KEsO4nnbPMNJW3UuDep8CA5SPyZVpkxsWXSDHd0qap6XXFR6v
         Vh1t/r37jdjNFsh7tjhei3QTJ27IajgPjFUk/okUC3dJaLd6TwUrIFMZjb4WgalpqGyI
         gDCY5S0d9L7LsNDQrIioFZJsdjwnuPf7YjtwIh7vgUB/TuQoGS4MdseNap0sQvR6QT/O
         mmTz+LaEgsqsy+qrXs2+pOudnPJKBOyM5J0HKOuzprF6gg/83uTmkbQddD0xPPTejjVj
         psLpekpaEi5M3AhJQXgrWiWOPYYh/9mkta+tsGgqYORu6NqUU8lbhBfapIt1PtbZ0xFK
         urEw==
X-Forwarded-Encrypted: i=1; AJvYcCVHkCjVUzBTZ3mZGh46HcsMuBNNk9cXZ01TOmGP3+LULvvG2P1SIY/wW0ZzjrSMc8A3gWaM/aSSg4OL43QYesQ5@lists.infradead.org
X-Gm-Message-State: AOJu0YwBdiVldTWgotmuJKljJ8YETBf2InaXcpX0g6jNLtc8r85MfDS8
	IG5QOAXqfODpGvaXgAAHD6Uc/tQizR6A1grKYLsES/rMINho82CnV0pLpy9xaZi43tzPdZV8Du1
	enGvl03ZLZGh5jebb2JWEXVxFXzAhzBNE1uDQcGQYqV36zNpfU7l65/yQzeR7mFU0XC440E1gyb
	KSmg==
X-Gm-Gg: ASbGncugk92NKek0AjDCwF2cMZyWJ2Aj6cNab2Q/eJpqgOgLsBaKaapzowg2AFlgS+G
	wRlgfeGlK9RrCG8n1apSf1QmlgmAzrXQ4P5cF90XKOs6qPSOJs0LfFF5NhAggmfGhxlZ01x8oGW
	ZLCIiJMb5RL4DfuEOrmrkZN9VyHJ/IzHCY/gDXxvRcUKnb4i09VFIai/5ofd5XJAnAUbw4yL1I5
	I4XvN41kOArJaN2WFEXnShjCNiAZH/v6AGcEzfba1YcZo9MsgOFT/0U8rnHDoPVpQS6CvLT/td8
	m1z2nGwak3chs2+x2+lJSh1E+BZgqUjBO2VnmMrThaQtPXRlNJJwMC0OEZDH5ffj7/V5lTjTjAI
	VOTzdDMfRGukPInlciRWAWbdO3yXOIXcwW71oT2RG5jCSURh2Id2p
X-Received: by 2002:a05:6214:48c:b0:70f:a42b:1b60 with SMTP id 6a1803df08f44-739313a7cbemr151872046d6.19.1757429552600;
        Tue, 09 Sep 2025 07:52:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDve4l6s2YkUOUAaxLOpnngg8qoLHCn/KPCMWaHyS1kbKSqT06T75VdGjHUIigW6oRqgflOA==
X-Received: by 2002:a05:6214:48c:b0:70f:a42b:1b60 with SMTP id 6a1803df08f44-739313a7cbemr151871436d6.19.1757429552086;
        Tue, 09 Sep 2025 07:52:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:05 +0300
Subject: [PATCH v4 07/10] drm/rockchip: rk3066: declare supported
 infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-7-53fd0a65a4a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HjpahnDv4iWzcOH6N/sbIkmNRnbCe4ETkSttnmvYk9Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8bgkGL4BPgsdX7XjtFIfmizuOXrBZvFf/Oq
 7lX1p+1YEyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1VsPB/4iLFY+wAG/K17zLiP4t3HSa+MqZcXP5RqO4a07Z/ru4qsPjYHy3ln/Unz6WWtPUuxNx1G
 wC1tqMHE4jiYFw1S2EgG8AvPre4CoyRzfdUgObhEzKFXnQw/ykVIDEfhRDa5WEWOwilzd/fuaFI
 dS962/TSUBWayf/8939BWRGiFgvjZWtP9QZXMfAOx/19jbhCudCNqXC5rMsqIs6Mf1mOjK7vaB3
 jBj3G75QXeNwLmJR0vKiteTYq8y/JCicP/FVXezBdGf23AznSXJFG12fj6irgs8H3H02MFBoKWU
 kzOW/5U6TFokImtAkLdGpgoG+/2BrclzIiqxM7qKl+sHWghC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: VJzDEdD-4M18gvcYNvMsCVM7F67VkYAW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX+OPJFeDEfAhR
 X7qA60+uNbJd2A2ry219VqGFzs45w9XOxx+Ny7s2SLHE4zJSF+d3dGNqvL5NvPITKYCcUUZIdpc
 eMbbgZ/LpKVnuexOXWVCGyyFJqS6cOHIbWNfjYxnxUwtzLSblRdv5+8LZsZ8g5ny1bc8oHm/2iP
 vi4DyKImeWqM3BlGb8jPsBk+lUNyUKNfucaQ++hxY3z/KxZggEleN32XLP6yz4BHYB1sXoYbP52
 BoUc7G3NP+4qtnjumsLscORNB1EneV2mQG7HyNPCm302E5Lm9nIEAbGIvAXDCkwbESQIwOaFvNW
 qYPVkCT7onepdDSWR/fRgZHYKjygRm2RqDjHx2A2g0m1l3eQs2k3kqfnX4fk4XWQDei06WayTB6
 uJ5xHgX5
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c03f32 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=jPQHZD_Wlk31EOZy1E4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: VJzDEdD-4M18gvcYNvMsCVM7F67VkYAW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_075234_854028_E30ECC25 
X-CRM114-Status: GOOD (  16.12  )
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
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a93a49f87df7604752f6b651c839c..6ac854c0fe4d155b351821782a6d8bbd550de656 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -164,7 +164,7 @@ static int rk3066_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	hdmi_writeb(hdmi, HDMI_CP_BUF_INDEX, HDMI_INFOFRAME_AVI);
@@ -182,7 +182,7 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	rk3066_hdmi_bridge_clear_infoframe(bridge, type);
@@ -696,6 +696,8 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Rockchip";
 	hdmi->bridge.product = "RK3066 HDMI";
+	hdmi->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AVI;
 
 	hdmi->bridge.ddc = rk3066_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.3


