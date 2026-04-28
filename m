Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC98FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 01:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9m9p8k8igO9mcKqpM8R3r1LN43MMOEZgkj/ZwEMZ0vA=; b=CeBqE/OIu1QAI0FXF/Vb3fjYnV
	y9ggnqchTj7I/AvZv14dEBBEKAvTYukW0hYwnyP1c1NybA2vQkz0ZLwTN2nOeCKlE23iz/bbGGobr
	TobSFSY4rtZJZEXmW4CuF7NeKAX5Fm7q7aoC8xMT7wdXbQpxoY5MJDvi+zzIUQfZdTnBEF9wKtvel
	uwEe5TFUuQzGItPt4YkkyXCwHxRXPvf1zCSlq+0a83xRiRetoc+4smXX6LjrKWk36ZWiA8PIfVkTX
	V9tHML8YWGlSrfswnBIImQU6jMmEoLZOkxwduZWhz/xXgXb3F7LPIKpOrC1gCM5AP6wEyb7y+i0H7
	nKJFmGLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHXQz-00000000OxH-1jAm;
	Tue, 28 Apr 2026 01:40:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHXQx-00000000Ovm-0sIN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 01:40:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RM3Jxi241590
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 01:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9m9p8k8igO9mcKqpM8R3r1LN
	43MMOEZgkj/ZwEMZ0vA=; b=UZaArr+ZaWYpiX9gsgLyMDjQLtxwvv8e5gqil9Lc
	BJrvIQVaGRgGP/+SWlFiRgpJbu9q3kAT9H6P7S+wmnCQWY4bB19PG2D7RPKeEpT5
	34iXPMXgsZXy3yGqIbnVQYKm6jax8/QFNU9NpkXw4CPM01OmohSAZW4/Bv3h0GVx
	yMNTwoCvV9mgYVjnUnsJPOk/x5tbD+RZ/iTQiJre3GRb6KSY1dnlTIbG3Mnkxr+4
	YUBvifD5McgbN37KQmQX6Ezfv7GC3ziuAY44DdPpzIdZ7TjAeQe5rxOXfbZ9cx3N
	246Db2GiaFwjNKOHJiTLnS1g5WQBgViHuV5mirTiYITZaw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946td4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 01:40:18 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5675cb317e3so8326337e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 18:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777340417; x=1777945217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9m9p8k8igO9mcKqpM8R3r1LN43MMOEZgkj/ZwEMZ0vA=;
        b=XjHXAZHGs9sdsatYK/n5Wg8a+Bdmt4SkXo7K0QMwtkXub7gcpEfp2Aq/Ezvddr1Lra
         szVMAM32587/J9y20TZ9w9rU/gGnTj6JLY3KVQMtZSxoVdg2mxPqmeccqySYzYypkzs4
         Cx605JkUBzxrk4rzFAfvwex28tx8eAlhrjw84wRIt8lQDvOrTxCpCjMzJvDovSW7wnqF
         9uF7mIxN1SmT2posOF2LM0q23AY/tycNO1zAeGi2TNWOKquObs6EtQthgC8zXWcyBKaU
         DBHTi14nOoiDncHeW0SYX6dNJubv2gj2cjIS/bUzFG/hsHMHe0l6yEKq7kbOflRlsnWV
         xPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777340417; x=1777945217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9m9p8k8igO9mcKqpM8R3r1LN43MMOEZgkj/ZwEMZ0vA=;
        b=b1vgdlm99T5VRltZc1kscXtzkRSOlPyIPiSMQJbxyMNoLuc3diXjVsejEGBllw2TLP
         fyFNyuctvTLSM9MkIQCRWvf8PzleM95DuRTrbvhlB9rm1b0oVBV+zTSGB4IdOD4/ZH1M
         2gYANIyZOfix1FeMc16vTbnvPyJBTyN1CML9h2Q00kF8LXZdTDgXLvzLK8rAiGbL7lLE
         8zEOu9uoaZG7nTxQmMGaWKZnXSQXhnL9lCiVP961OxRCcCGTgeSZC+nWLApMkAWtMeYV
         PKkoj5xQ+NX6zBRcl9PLV7s82WasMajvwTvqd1P2korIoJUMPRRGNEdVorgjVK6cvBdu
         rywg==
X-Forwarded-Encrypted: i=1; AFNElJ/gMoEbcw2Pbr9PhgmDaV0uGYvJX3h7mJuASQCIVSMeiApUs6XEu8wRWa1AUcwFInQUetuu61Qy2bxEPW1s1bhy@lists.infradead.org
X-Gm-Message-State: AOJu0YwVHheMXvf5hsD8jchH3bybCUFt/BtTq4FGpW6ndX8L3YMdu2eT
	p81gxjcUSIYDwVDQ6leVCjEiiUjlsLRjKmVK9588xlwWovyuJ3iHGemaYJRwyyMVT2eUB8FRxLF
	Tk1dHSfHFnk4Mjq5Ss86X7N2FruXcFvSulb7qyrAGN+8WwyQEnQ+U7/4FTRch6iSeQcsKHWPMLL
	TJDyNf6Gw/nA==
X-Gm-Gg: AeBDiet17KboRg+SXlrNAxXOS0djCY1/fyA46elVJd8zLvcbNbadHFEznzfnd5bHklp
	5HP8zU8RH7NoBlRML+3F+WTS4+KcpC0K3qEvD9YYs+RB1g5GiXRECkKow8dj5GB6GSVQXZjoqYX
	41a4UmlubJFyKo9m7KMD1fNVJXiuxziiCeYVUDG7w7tPzjYkAuJBCgXNZ+2vv3Zcxbn3lCcGySk
	AM50SUS3Z/nvxYchksIVT3euUr8orcDn3xKhqXRpWtotWBuRloNlRHRoxWAT9JHKGE4jFgQaU4a
	tVxhu98BYG0R19yCvjKeoweTObVQRk7Tdr8AzhqnGvKMIhkKdBvkgf3JyMtun9RXK2XeJzQqq2a
	yRNZ+k7IW0V7lGq2i7aAtLurPR2p1t8ei4AtijvMeOAcmPgCh0Uux1R0C0FNfybgsRqU5tBiSl9
	xlTSSn5sMnZ1Fftld1q1wRanKCJSkAli6d0ao0L+72sqvgrw==
X-Received: by 2002:a05:6122:134b:b0:56b:8e1c:582d with SMTP id 71dfb90a1353d-573a56ec536mr488128e0c.14.1777340417161;
        Mon, 27 Apr 2026 18:40:17 -0700 (PDT)
X-Received: by 2002:a05:6122:134b:b0:56b:8e1c:582d with SMTP id 71dfb90a1353d-573a56ec536mr488106e0c.14.1777340416627;
        Mon, 27 Apr 2026 18:40:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f55f0bdsm2693041fa.30.2026.04.27.18.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 18:40:15 -0700 (PDT)
Date: Tue, 28 Apr 2026 04:40:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 07/10] drm/rockchip: dw_hdmi_qp: Add missing newlines
 in dev_err_probe() messages
Message-ID: <6ud63tddjz6ztmnifaocerrowml6ut75ciakaj2i7t7be2r7is@dsgdghnieyqs>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-7-d778e70c317b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-7-d778e70c317b@collabora.com>
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69f01002 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QX4gbG5DAAAA:8
 a=yOO0I3MQnx59eK1zbP8A:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: uZTsJAY4I7FwCTEZei5oET0vNfqvBGKk
X-Proofpoint-ORIG-GUID: uZTsJAY4I7FwCTEZei5oET0vNfqvBGKk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAxMyBTYWx0ZWRfX6DHaQXIlDWJZ
 tqMPZdx7u+hYr8a/8YTU2n3La1D4uO5uKhNEF+3+A8oaQkzIjKlLL5SFjktEckb2cC13tVZIH9Y
 TGA4shOc9QIn0yjItS1f/69eNMzQL57Dh0f1nJIShhd+zhsrQ1V1rZXSgoS/ZhoGbUdC0Rmkigl
 S+8aKemHjGkdleBJQBbPfmIhBZ76+lQAqh+Q14xNwGxpq27O2ci1xrxLqi9zS+mmGEthzqhGUBa
 a7GxJHFfnl7/ZXgFvs1/0rPG2l8i8iOdfYm6Gi2qVn4fwpuliJ+7wDCbkMxcCUbfRvv+D1NwfpI
 SaiujwQmnOvTTBSCGgSaULa6a5/+J1Zoo1ugahlFgFIKVI0Z+fAxTyIQ6sicgImMted9PpXLE0s
 yiRPzyR7BENL3x7X7J+bFsbSK+UKPVZKwTdbVUnFpglPsVikbeaofgi42LKV3aEoHSvsIAwIIML
 9ZFq9tVbRxDbizgRayw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_184019_361798_6E357751 
X-CRM114-Status: GOOD (  20.34  )
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

On Sun, Apr 26, 2026 at 03:20:19AM +0300, Cristian Ciocaltea wrote:
> Add the missing trailing newlines to a couple of dev_err_probe() calls
> in dw_hdmi_qp_rockchip_bind().
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Missing Fixes tag.

> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index c78db7f8ab6c..d9333ad8996b 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -589,14 +589,14 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_funcs);
>  	ret = drmm_encoder_init(drm, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
>  	if (ret)
> -		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder");
> +		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder\n");
>  
>  	platform_set_drvdata(pdev, hdmi);
>  
>  	hdmi->hdmi = dw_hdmi_qp_bind(pdev, encoder, &plat_data);
>  	if (IS_ERR(hdmi->hdmi))
>  		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->hdmi),
> -				     "Failed to bind dw-hdmi-qp");
> +				     "Failed to bind dw-hdmi-qp\n");
>  
>  	connector = drm_bridge_connector_init(drm, encoder);
>  	if (IS_ERR(connector))
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

