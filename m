Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4955BD0D15D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDMa/3+oiy4vVFgOo69jkSU/S1Hmln8yfU7tzvohWvc=; b=FgDwERfZdR4quglzuSaBl1OiUW
	9l2IUyiMvqfHC6181PKrXRQwkb2Ua8lpNZEURJaVIncvYR8pc+4eDzZBI8/uUkD+VhTPhiulNkfrh
	Eyb6C9FSHWMjN7xuh2GkCu+VEYcWO3vIwYJwQDPMeGekgBNIUcuUUksYgcY292dAwP/5Hft9Cqnow
	C1yoML2XuofxzxrUMM7rO/lsDZE6i015M/2fm/ftwXjEUAWJJS9CnmCBTYAjigPuXomn9lKQ9jXe+
	MJZCAe+BHeuwZaRguATyz0floUxuDqpn8hyOZh9d9y9VV244bNMSzv7QjeQ1hSxCRPgtkTbDRm7cT
	RnbOFLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY4c-0000000FRnC-0N8Y;
	Wed, 07 Jan 2026 18:15:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY3z-0000000FRQQ-3eab
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 Jan 2026 18:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iDMa/3+oiy4vVFgOo69jkSU/S1Hmln8yfU7tzvohWvc=; b=etX/3UHuzMBIg0D/H3y2d4qWnW
	j8BEHjq8L+jRsLTpzw0a7luJm4Mz+nYivCKFm3sElbKRtWh6JHB8XMGlDquTcBtMnn3fMwz5yp8P2
	cEcTGdLcz8f7pVRr4Uu/mf37ns1GXRL9nRIgUz4co5e7fYAVIrXn5cwHe2jgu0dAmM2NU3LXy8AwV
	0oaXzPXNmuxzoncdPbAxyKpfkTYy/kTsYrtrYtiQnd3EH6EykUtkE4yRJ/GiQj4jBV1etEqI9crc0
	7hug0OfrIMI1Bva5nuuzYYp53iFCAX+YyInQ+kSvXon3fqgeKKmwYtuCGi4hxnhvuaEoeliZD5ljV
	wx+KI2tQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY3v-0000000BtD0-3iLG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 18:15:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607H74Tq218393
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 18:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iDMa/3+oiy4vVFgOo69jkSU/S1Hmln8yfU7tzvohWvc=; b=Md2EzqvuQa88+NJo
	eO9CT6W6zNA2/mmL8bAXb6GdF2TgbDZwRiPcGhExvC1k/rcBmLe+40l0vu3MF44S
	QoUy/eggghWay8HBTYciFmcK5g2Aaf1FDZD9rolR0ZkMC1fbK/4XwkN295/ny6OD
	7Hj8ZpUvDJbaSgxgOTfCtEZ/BOyzVnuN1jYl2TiJ7O858oy/50DcJLZtCL/98fOS
	wCygVIIJJAKqG1PSF668wIDMDoHtjoc5LvKMAp7ude/wxjONNzUeXjIqQCv44rac
	XA1DZJ9KsfhFk550JzlbWRLh4b1Kazpk8gIsV1iwDBjhCZWAHHgTWxHTv9A6e2dC
	QiQ2Fw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn809mgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 18:15:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e235d4d2so911650785a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 10:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809710; x=1768414510; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDMa/3+oiy4vVFgOo69jkSU/S1Hmln8yfU7tzvohWvc=;
        b=ZkinMfWmJM/ui1zu+Hhykvl2la52uP6U622lt7Z0Dlf22ZzbodyEj6wfCS2xdELkq1
         BqIrDyGfs4rwO2hiAuXhCPGfAsi9gRUk+i83cRgQLorHCD+vsqclDG6RC+yOZeJn+YWA
         MROSwtR6pZ1qJ6vLIebUcy8QV4izp7pnPObSzxhf55VcJOXDH+Ll3covNz+C8hQQ781T
         w45DLNXK5YXgADlhDdUEJe875XkHz5dkAKLWbw5RKfYmQ1jgOZTXqMgdCysmqFxlVsSD
         7ds3oY3qG5fVAyD6F1/y5LkoDV4y4cWycpMKAI3RkWylijI5ch4VCkeQ18s5gYCYgozg
         dryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809710; x=1768414510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iDMa/3+oiy4vVFgOo69jkSU/S1Hmln8yfU7tzvohWvc=;
        b=Gjutmm1LDBxwdzB0Q/PQ+4Lz46d72NS5gCfCXW/79bW5xehgw5zRbtsRAAuZKpyub7
         L22fenv39ynhStseu2VYEv+SGMvSQSTr81m8WzIcrv8EzEk8W5KevZgUF/sFcTvDGQM6
         gMIPwiROvnJcHcdU0lSs6lFeEAduU3/waDaVzAsPSTGkutA5+MTk1c2Pkl06U2ioL7SR
         hCZTfN5ybChXrq5Wl+Jog8jjet4iw/TPOc7CJfIuhiNV9NNQ+2ReXYtpBD0lHJ0FM26z
         Iw8dm9r+ymX+kjk9QGWJVS6xbbupzfeZAUajE4VegBdEe2C/vhx7eSxIwAKXNgpg4FE6
         rNpg==
X-Forwarded-Encrypted: i=1; AJvYcCXFN9zzAt/cjVS6CLuCfsWs0MTE+qO9EjXRv9OcQCw9msYTiGUqkHaQM4cT0F2aTfnyXP19I5O2kTx5t+k5d3FZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7j6PS8H7k/+1r6QKdL8cj3dHT90PP4UtqZrAuaQKeVVOEpoug
	v4Ltca/p+zv9xnx0xLxvx4Pdi4EUHloWHsO9DSKgR1b/4hNJhWluyiHU63nrajZ7rJLp2IAET3Z
	CE1UIbupHOF2WDCtyBMtgbeG4OlmA39BBpw8a3BekV/l0phol2WvxVo6zfRUJNN01A6ckuJdyyN
	Uwdg==
X-Gm-Gg: AY/fxX6YioszsxME2NrFknOImou2sIMXGiLAOebZQixJ8RfRlrIvpbZN2FOshTreR9J
	7ha884+xQp7wBLSFWZlWgOgKwHJ7kv8KCIIHBqi28nBhsSFczTIsqiqTTnUUHwC4CKEcCUMm+uX
	heQMMszbSzONvOAEuzQ2r8NzWQIi/q+YYLieWkExOhWtdkn89B5tsxw0fJpLLFA4qUQl9G69YvN
	pmfKpQx2NI8VkDpeaU7X7G5ezV4bCkSwght9zBzgfra3gY3C+1gqLPvIa8TS1U5rcZJjTAuj3+V
	TXBWg5PhVUCLI0IJctB7Fphs3AyhBnLrJvUumCw2XvE4UGfKEPeimv0XIw3kDlYg1axmgWNX1Uw
	YkG82WDfNNZru8Y5lL6h9qBWJuoFXUybpwKlMMF/yroLuGiKCK/+1++5QUMhgd3mxgVR9GFSA9h
	JAvmIiOjW6phRAmvnA/3rJXX4=
X-Received: by 2002:a05:620a:284d:b0:8b0:f8c4:a5ff with SMTP id af79cd13be357-8c38939548dmr415671185a.23.1767809709935;
        Wed, 07 Jan 2026 10:15:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNnSAiO2TN35uowVz5nUxPTarPKtrJKczFdjq8YtoRDL79CU00FYbWgXjKjI0hV5LSFGnXqg==
X-Received: by 2002:a05:620a:284d:b0:8b0:f8c4:a5ff with SMTP id af79cd13be357-8c38939548dmr415665885a.23.1767809709293;
        Wed, 07 Jan 2026 10:15:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:01 +0200
Subject: [PATCH v4 04/10] drm/connector: make clear_infoframe callback
 mandatory for HDMI connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-4-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5425;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LT/feZw0CtZODegcFJ+4Vz9a++4eaSKUzh1MRBMJ8BM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKkh8Uw4zR96uxdfP3B5zJVi4OZsf/KLRV9b
 W7ObW3B+sCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipAAKCRCLPIo+Aiko
 1b8ZCACVHXOVdotvxgogUT3C9rJjVAwz5C7cHtd38CQCrPUocd+kYKlETxwvuPGlVJvCHUeAM8X
 5/dbL3WQ4QoPcR1iBb8oDv1v6oB7mJeoOsV/aJpocz5lRWP8NYncKNG1ePRkGEpeU3WHjpZqIFS
 kYhO2EzWmB1sJ9inh/CWFfZvf4ElzxfTYGmj/kCkM/z5sVjYqKRiqW7x7HsR8MtVNsWKFqCfk3V
 dVqKuC0OSU4IUdW2h3I1weh+JiTliULMhONr5eVnvaNom/JZ5QKI3oJK+lJB7grw4QWcRHvOVP2
 EkMSiWdtnpNVOEWxdQ2Q6yJ+NQAxzjfP/bYkeyAmuPwG08rp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OtJCCi/t c=1 sm=1 tr=0 ts=695ea2ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9fyoTQa5ixSHU3Y6h0oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 1e3uJQuFSFX6r0227rjOK70etwxlTKYx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX5YfCZgDqNztN
 S7rT2lX9WuUEfe303UZGFiVNnypSjgRpS4RFQ6uuAHxy5ZxzHs1N0tlODYGXEP7YqD19nKy8zxe
 sUJQ0//Wh9JuXfMKYQaV3JW4dy2JXMYxHZOFBLOUsoOnr33TPImveuEUagX7D1zuF/ZI8J8xIuA
 Qzs39gDHaKvuVVPYVF58KUKUw1xe65Pc1aQXVrJSx6N2+A5s6uxZNBXrZxL0I9LJiJfW/hF7kuS
 ZMeHniQIsVvw0RG6IMv3ER0CPu84XDW4ASTAXlt8zaJgXgrtan0pzNVTr6HY0Imd6O4SK/dErG7
 czTDtWEYYfCV8ud/TYoj8CNlB4iQYYxHLPNfeNk2GTrZvNBjRzUVkYm/zgQIWAyo8xAin5Yz3xL
 1WdGxS2nDR4mV9rk+ht4SlpRFgC6HF3MHvQrUzj26iKUKXwkCOO9lMnNs6NDOENChhYdRhcBBFd
 FyhmyqaADgo3E5XYtVA==
X-Proofpoint-ORIG-GUID: 1e3uJQuFSFX6r0227rjOK70etwxlTKYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_181516_285948_E365597C 
X-CRM114-Status: GOOD (  18.33  )
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

We already require both hdmi_write_infoframe and hdmi_clear_infoframe
for bridges implementing DRM_BRIDGE_OP_HDMI. It makes sense to require
the clear_infoframes callback for HDMI connectors utilizing
drmm_connector_hdmi_init().

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c                    |  4 ++++
 drivers/gpu/drm/tests/drm_connector_test.c         | 15 +++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 22 ++++++++++++++++++++++
 include/drm/drm_connector.h                        |  2 +-
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d6dc9ebfdb5..40e025712c9b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -600,6 +600,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
+	if (!hdmi_funcs->clear_infoframe ||
+	    !hdmi_funcs->write_infoframe)
+		return -EINVAL;
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 22e2d959eb31..f356ea695ae7 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -25,7 +25,22 @@ struct drm_connector_init_priv {
 	struct i2c_adapter ddc;
 };
 
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type)
+{
+	return 0;
+}
+
+static int accept_infoframe_write_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static const struct drm_connector_funcs dummy_funcs = {
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 80f819a9ff5b..cfa14a6eb97f 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -78,7 +78,22 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	return ret;
 }
 
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type)
+{
+	return 0;
+}
+
+static int accept_infoframe_write_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static enum drm_mode_status
@@ -91,6 +106,8 @@ reject_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static enum drm_mode_status
@@ -103,6 +120,8 @@ reject_100mhz_connector_tmds_char_rate_valid(const struct drm_connector *connect
 
 static const struct drm_connector_hdmi_funcs reject_100mhz_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_100mhz_connector_tmds_char_rate_valid,
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static int dummy_connector_get_modes(struct drm_connector *connector)
@@ -2441,6 +2460,7 @@ static int reject_avi_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs reject_avi_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_avi_infoframe_write_infoframe,
 };
 
@@ -2543,6 +2563,7 @@ static int reject_hdr_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs reject_hdr_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_hdr_infoframe_write_infoframe,
 };
 
@@ -2790,6 +2811,7 @@ static int reject_audio_infoframe_write_infoframe(struct drm_connector *connecto
 }
 
 static const struct drm_connector_hdmi_funcs reject_audio_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_audio_infoframe_write_infoframe,
 };
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..4543833acdec 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1253,7 +1253,7 @@ struct drm_connector_hdmi_funcs {
 	 * called multiple times, once for every disabled infoframe
 	 * type.
 	 *
-	 * The @clear_infoframe callback is optional.
+	 * The @clear_infoframe callback is mandatory.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise

-- 
2.47.3


