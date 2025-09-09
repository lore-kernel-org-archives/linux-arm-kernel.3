Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689C0CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ppe/L523pX1O8Slf7FEFSs+VXXiz+Rko9uu4CzdmWc=; b=KSB9UYtTj8DteNb4TaDch1R92Q
	jM2kzqfTFPoKdIXz9a0D1GwvYrN/S11Bl+U2K+ux+Nj8QWusqJj+L9NTrqcVetzGPLhcPCsGWYA0d
	zZcecn2AbFXN+t7SjJr+EfJRXFHDc2tsWZO2qED3CdD+DE03c2Z5RfPSjDiIU6TX8LseICKYe8lsb
	YIdSW9uAaxaEM/1qRi6XqGROz96MXuCkQ+6w2szo3sIs/ArKsmzKGWPhUs8l+8CPebJXjZh7alqFt
	jw8J2xuSrkTItOLiM9QaLE0uBmI5VADdpwygCvlxnvrNNlYB+AsAnrElrIs5jWtHNwv3qOUxL1KSA
	vsBrbxFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw22j-00000008z18-34FO;
	Tue, 09 Sep 2025 17:22:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvzi1-00000007sPx-1hXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:52:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LRdr032042
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Sep 2025 14:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ppe/L523pX1O8Slf7FEFSs+VXXiz+Rko9uu4CzdmWc=; b=LOVxT9wRqIMsdtxq
	cndOMoifYWVHpZc62EvmN7rj0LDQWAcqL3g7/Sl4DM4EXUog/Mxwe/VyUg0QzT2B
	z3MXkIFFVU1vvUsjuf2Q8uF46tuSQ2B8hUQoQZTMElD1fpy5TVBv6EfWoGO/86o4
	0adpamYkKQP5nECPo7ebms3B9bJmH3QuhNBuSAmhzI6LviBqhrZEuxVnF3eTVh87
	DvvYXvQ/4JxGujIctjPv2XB+Yo/1U1cQGa8IO9F894uEnE378XvCuYToH0angsNJ
	qOnafF9a54OBsWShEhA+PnaZ3Cs8DU0kqPeHqfR+38PTVJvvh+jNfOHZqhyzY7sU
	ii+zMw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m0f72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:52:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7296c012f6bso116936176d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 07:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429556; x=1758034356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ppe/L523pX1O8Slf7FEFSs+VXXiz+Rko9uu4CzdmWc=;
        b=PaPrlG/0Galwm6MiPQ44X276Ld32Uz18FVjw+KiJ9xtt73oPhpg+LU5AvCezVED6mI
         DW3lmcd1RtcEhdWm6EPefcR1rwZrP0kILMpuD6U77XLP/Io+gH5Ie4zHjbJW4xIrDnhe
         dmMhaO0vZWvSoEL7L2Tglel9qLDrPoFzy4QREpQt2rMyMqGPZZiKva3A8ZGRORVxzUMR
         rThFFnewHHuegOBN6brXnzCWGFvMLGlkev4hPv0jDuNEczmh9XycxWEXuyQ2BbpVX6DT
         P+PxAdaQnrv3LxY04lR48YHpkMqP+2sQNtqbg6aANe6+RMp1RYlBMDnQh26NzkALZctL
         p6SA==
X-Forwarded-Encrypted: i=1; AJvYcCWLUCuX47Zl7Fz8nALe6e/2lnoZDcfpV10LKWHWiCDK0H0FkqkojhjrmBCK/BpwftkgFdrTOWD3QhO0g/EJ4mDH@lists.infradead.org
X-Gm-Message-State: AOJu0YwLwcSW4J/LtcAed3xlZqSlooRFqcDr4YCzz1GOZP8Gf+J5g/tz
	UiB/lg5y5mHZO9ZLo/zYMU16eUfw/VdjwyY2WsOkuvZRSZsGoj4vAp+5muSUS15PQ917oxjKT4G
	wwdkcmuh1mixPsjqCDs4a68H2lyKDOG3cdSWc5RyP2BilyJkjBUMbUyki8wTdlKmeGAC9c2fGIi
	77yg==
X-Gm-Gg: ASbGncs1nyntbI3WHVdRxQvIZ3toFFSynOQyjlipTztJp0GXdNSQmrpdyDLVBTCz7o4
	12dKPz/C7C2+/S6t8WkJmRG7g6xfwkvcPlGp+BnjVdq+8u1XlwX+Zr2msL7bSJfMaNaBS2rlbdm
	6M7SUPbEeGign8X2qhtAZxJLXTslqSke/nV7jVkbDNqTSti9K25T9ZFtzV9yzArT7GqtnCaZb6h
	7gbb/DHx7OArwfQGFl2zh+fciCcN6aTBfdyZ7fRBR0LMPmPfC9cHiKiWNp+LTzqDfbWXiyCBnTb
	e6crvKfrUW2bW+lpJ37dpgHAM/DToNWmWzZzeBOafpRBnLiqt/kLBfguO3ZM7I2yf/iRrmvRoHE
	w/8Ty0btNwZ7Melt+adtkHVrfTSV1ZNlrpxgAJrZ8xHthwNI3aQXD
X-Received: by 2002:a05:6214:5192:b0:719:12cf:50ef with SMTP id 6a1803df08f44-739203491camr137707396d6.28.1757429555488;
        Tue, 09 Sep 2025 07:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvay4HegD7TczvnDmBbJppLQ/NXiZM/9CH2gAkzzaVEPN2RKdPsH+OPvsw7n0MbNu3XwLaHw==
X-Received: by 2002:a05:6214:5192:b0:719:12cf:50ef with SMTP id 6a1803df08f44-739203491camr137706716d6.28.1757429554861;
        Tue, 09 Sep 2025 07:52:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:07 +0300
Subject: [PATCH v4 09/10] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-9-53fd0a65a4a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GCdbmTwssKDcXNKgdZbInJ/IsWBy3ZWBjV1zBKp4r0k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8bLgmA9Afor/SCSMBp6lvcMJNLH+y+3RLsg
 Edds4lkZH6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1bQjB/wIC+5fSLnstfGoZMGUfVuruiseL2SNqJJstUfTxGaowQkInoHQfnrNqiPYpowcSvPCRNl
 UHnaRFcqNgqF2eWsCXtVaCx10y4Xj3MtGesm0e5fNl/X47wnuZX1RlKVA+7gTnlshcZ1F1PyHq7
 4O3HqSqvwF+066FKwZL94tPSzVrV5ca4n9uB3H4tEJ1CodYONpSf5XEXIbVmBHdBZz6F5Gns117
 nYTWg54k1WItlRdXqTB1OhJ/BoctGr79fhRFb8LTSDBfGG/G7xLshm7FznkSl5DmrmqCsv9fJqw
 58UPBF9WUpSazqCvVhovhZ2tXkAQKvB4Xu+5lsWd/6WbhhXH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX6ZLYcDHeaGp9
 17G6i3ZcR/ebsffSeHKi9IJ4zP2YQQl257066SV9FWg7tet+Wped6lE7FspJWYjQWuodgyDVfAS
 3Z+v5yDdXX4scVZyCy3ZJBtTwTkP4HKG0IBSBk2e8B/2neUwEsSBLe1cx1oMydesVGEYysu0R+J
 lJusYLaVWCImCMFoisYZxGLDtBf2mXZpakgNcEmn/1K7qDDv0HuVqCHGocmbTN638XfhOzbhaK2
 s7k0W8Lk1p3ilxnFwxXFs+CxF3LQtj/2j/izATtSx2cc2hGjwT6W+mxmIg8viE157RWFiENTg4+
 MPSWg2ygp1tDkiC/ztARHStjw5dkgi7q7SUN/GR8/tM4mNiJhC6Yi2L9JTHGUajO70E7AHhAotp
 Bjsho0Gl
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c03f35 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=NnPSNIktjdB4Ge1gQTIA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: u4zhfTgmWW18JQLIX5kxkLrH44GL9jgs
X-Proofpoint-ORIG-GUID: u4zhfTgmWW18JQLIX5kxkLrH44GL9jgs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_075237_454118_423E2306 
X-CRM114-Status: GOOD (  15.15  )
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

Check that connector initialized by drmm_connector_hdmi_init() supports
AVI InfoFrames and warn if it doesn't support Vendor-Specific
InfofRames (HDMI InfoFrames are more or less required).

Suggested-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 92a75684a0f7375d3a94e8c666cb71064ecc8035..222a0ef66d9fdbdb56108ceeb40e7f369d810350 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -602,6 +602,13 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
+	/* AVI is required */
+	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AVI))
+		return -EINVAL;
+
+	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_VENDOR))
+		drm_info(dev, "HDMI connector with no support for Vendor-Specific InfoFrame\n");
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;

-- 
2.47.3


