Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A84CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZp+cY3PvWZ7AXX+8WUitd6YYr2WXghfEWf102S3Vyk=; b=xOWo9YQZoZzzBfUpMFW9lBi+eE
	4zhyeIOSOAciYEP0hFonL6AiG3lkZaSAzuIJeMkJDCquUyfVyFYLgLjesB8LIUM5eeRHt9+DdtH1N
	b7yDpUDnAsrxEJV7lenxTBUAI/zW0Inj0Lzj72qVh1Sm5/IrHljM4Bi+QomtvuRs5Gw08jFeZ4FCK
	R8jlwzveynQO+OdVP8d2T7mUyVCIyIGk/S6MPl3I7thjguiyiMiuI4w5+O/5yZ7SIuZFn+d3HmvXa
	9Q9rYH60snmh70jr00LNS9X1WOfWaz/Z0LpxlNKAUs6+hFwnq21uoABRRq1Wg4ZqrbIBD99DqtCxE
	rvis1deA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJZi-00000006Md4-3TOd;
	Fri, 08 May 2026 11:40:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJZT-00000006Mbf-1yzK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 11:40:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64872mpF1062270
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 May 2026 11:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OZp+cY3PvWZ7AXX+8WUitd6Y
	Yr2WXghfEWf102S3Vyk=; b=Ed/6gaIAZdihHgkd595agWOjbCz7EywPKc6N6jQ0
	qMZp7fybfb7YONqb322y1Wz0aUDcy11h/vBcHFuHIcCURCs0JOe9uHaO2j0P8nfd
	FxlbFeRXW31Wti7FtVQtiqp6ooaDQVk4MkwtnkDer0GnMMk6RdjRJytLHC0LScY5
	AdN/mE9Bw5piiSNoDhsTYhiUdw41dJhUeJO7NLslP14XSO+85oKtxwGsm32bYiAh
	+5Kcm0gtguOPxTE1y7K/FcJX/3bGfmCG144AU/l8aqgxKeBnIC4TnMB9CW3Xdn7M
	qn7wP0AXOfCY+sK7QKCJ1DiDLnPKbtbiN6wIMEY/CZseoA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1b3fh1b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 11:40:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8baa173eacbso55558636d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 04:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240442; x=1778845242; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OZp+cY3PvWZ7AXX+8WUitd6YYr2WXghfEWf102S3Vyk=;
        b=Otom1LMjU6iAeo5gIuCPbtf1079HxkPogciubnnHPOAx702YR+ww1aEdrTO4Ik5nUg
         LLPGqESZIpM1NjZgzHNFlR5Edz9mI4UutcQB6telUIB+Yv+pTj9RIGhjKzskBA2gtfNn
         Pn4Sxfq493+p0x/wyvBB/VZQfnh/DnNXyV0YPxY8Ybnug2KXqLVa3ATLfBohpHDjlSEL
         55vICdTMHeVdcq/Lj9tBXaYOHsFeLXP9rfeTD+F9FtHOBp/gVyvvCTcKub9ACIOaOliN
         i4cq8QngN5nDmuN2wAZHY6ZgcGe+mXm74qPT/tzxJ9dP3N30a4xvSDDLNiu0JsVDfHYS
         3NNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240442; x=1778845242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZp+cY3PvWZ7AXX+8WUitd6YYr2WXghfEWf102S3Vyk=;
        b=NIKQ4jcHpwsirZs/kpfzgEiZ5jRoDgmjrHrNubF4nxBaxxoDeSeghkICTcIlWv4auX
         5igoUNzXhViKKrDg0QGepsUDVYC3voHSBnvZpgVuyB7AR7R5lpa872VFU+YLm+M2nmtz
         ZZLaTDNeJc387UBV05+8tQXaGshE4CoT4PK1sUoDZ2nBqwKNkyEghCQVv6vYdL2KbE+t
         steMupqFb12Z2hZKIreYI8HOpFjN38ZtbOx8KGmeg/OklsQZlfk8EsEqXJOejvDLvT66
         EUYmT8JCtsrcv2/XFWClnAICLF062g6M7bUOTCE4tbF8vVVNxUzXEVvJvYM89ad6VjU5
         CS7g==
X-Forwarded-Encrypted: i=1; AFNElJ+nu8aJvx91lYbocWmeDixz4qZdV6XovCCwNn7e+UVXrxL5rc7u29T2kOd9AntA6koXdvYWjn5YlHZNBsoD3wGr@lists.infradead.org
X-Gm-Message-State: AOJu0YyfvaJztMN/DRweiD0Zzkg2CYSh6h8Zb994HsEPHNQIJkpLzNdV
	6Zqa/KBn/3ObXQHPb9Wfsf6oaQPAoLKZvWFzzaLLAPRAxlUQdmAj+o3CQ2SsNfCJI4Lh31kyWaz
	mA0Ma0It/0uTd8OqvpfdcAUMGj8R0gltX1qFZNXHyrNychJzVxK9XKpp7xsmo6/VLForbuSDrH1
	a7ng==
X-Gm-Gg: AeBDieu2fu9QkNtxv75XmCQpFipNm2t/nKnNr8lNFq58ZNd6YZ0BsIc9IetOn4QsUvL
	0xbo2kemoE4UADzW06UfUxNeIl7Qtfr8x/rnLyUnLPC1mxTPtMQROVf0MV2ySMBsn3qwzGgrvTd
	B6QdU7WZiCVzfY6Jfe/A2/kQKdOf8ig1WKgC4DctSH/TxdCLNNHNaU1Z2LSEShy+DqM2Bb5ONSf
	CECZcMYXQ4VEp7Woeh3VYwkCEafv8C5uK+c+yNDfukWzGu8HuFi+yOklZ9qidUefPrzC6yHlP97
	NR5KHhlNX55k3M1Vc+TLOkpJcm90uJs0wK3u2BoOTWMbEqjQohWpJzzYhCmvxRW5PBpEZ1KLV68
	d/QPmP4zJ+0H4y93A//dlozintUSR/7UaxFaJDsVXI1Tpd/8/2JHJ62su4XI+V4fulv9anAQA3o
	B8Qk5Uetf3o5duRgjxzGWsPrCfsVtG940e/Xs=
X-Received: by 2002:ac8:5ccd:0:b0:509:39b5:a97f with SMTP id d75a77b69052e-51461f9dd73mr171209761cf.29.1778240441788;
        Fri, 08 May 2026 04:40:41 -0700 (PDT)
X-Received: by 2002:ac8:5ccd:0:b0:509:39b5:a97f with SMTP id d75a77b69052e-51461f9dd73mr171209351cf.29.1778240441234;
        Fri, 08 May 2026 04:40:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f613ed94sm3958371fa.31.2026.05.08.04.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:40:40 -0700 (PDT)
Date: Fri, 8 May 2026 14:40:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liu Ying <victor.liu@nxp.com>
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
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: imx93-mipi-dsi: Fix mode validation
Message-ID: <utzkrmbx3uqys7gfepoi3gasylzxid3oqrcvdte6hn63pd3a3x@huwqowsbjgv4>
References: <20260227-imx93-mipi-dsi-fix-mode-validation-v1-1-a9cd67991280@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-imx93-mipi-dsi-fix-mode-validation-v1-1-a9cd67991280@nxp.com>
X-Proofpoint-GUID: IsF44QhSTTWm4Nmp6KIZZbFbwif-UC-I
X-Authority-Analysis: v=2.4 cv=YMOvDxGx c=1 sm=1 tr=0 ts=69fdcbba cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=8AirrxEcAAAA:8
 a=ghoAkTYV6uPXXgQErFYA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: IsF44QhSTTWm4Nmp6KIZZbFbwif-UC-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX9oRwVCRGWae7
 0UIadYghk9//UJECi9YlcM2qrJhvrZoLvdh1btwmaF+Eud0R1trcY09xgaGp+jj9GFZkjNIjtQq
 bzUjY6l9jCfxoPevTIIdwmeR16vs4efBNjAud0vvp8QSwV6/58axx//vfniu88LopQHHawP7ZXX
 LOmg0eL11ienCgVVEHMGxtrLU4n28YFsrC7CslrdczJLtLP3cNAa6Xg/vyLsFQ5FYfCygkY1nsQ
 V7qOFY0rnxmF146DMXGEf8PjdUFpEd9jsQCbAiWjt+Yt3Pd32euvCsSgWm3jBva2Obwirnnne4K
 eq/AR77cOO5g/BkAQHLyv1DccGVgiSp2TXHJQgAko6Fj8DDR2pXoISHHUQliH+Huw9D8QdpCzAX
 b+ASga8rZrEl0iaaV3GHU+CU8I93sW6k4BQOAICX6lLDYMYMicqRP59+pMK6XaVEEJ2AUKsPdn7
 yLcI1uXevGeoC0bodOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_044043_540376_8A42EC13 
X-CRM114-Status: GOOD (  16.22  )
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

On Fri, Feb 27, 2026 at 03:36:41PM +0800, Liu Ying wrote:
> Instead of checking the last bridge's operation bit masks against
> DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_EDID to determine if allowing
> +/-0.5% pixel clock rate deviation, check any bridge after this bridge,
> because the last bridge is usually a display connector bridge without
> any operation bit mask when the clock rate deviation is allowed.

It would be nice to add an explanation, why this check is performed only
for these bridges.

> 
> Fixes: ce62f8ea7e3f ("drm/bridge: imx: Add i.MX93 MIPI DSI support")
> Fixes: 5849eff7f067 ("drm/bridge: imx93-mipi-dsi: use drm_bridge_chain_get_last_bridge()")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 33 ++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 

-- 
With best wishes
Dmitry

