Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EACC3ABAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=; b=EtA+XitqSlfe9IzHScJO/r8PxI
	YK6p7VDePkf3AMxf3bo+syK/JnWxcFkEOC9UW2dkQghL+IDv602N7h2qnKCFh1IiV8c3qqwAI9Ad6
	y0HQXoyiFrC7gbkKQzHpK3EWAzLwk2G4sANHCWvBL+2B26rVDqbN+CHHvn5h7iNaEnzydOR3/Q+ld
	CYcUqMUe5tzFmKfHgkOdisy1GVT0rlxJfXfdOs8M5jvkpxSlY3EEJSF3IUMhjmo5ehSToqwni8ZXG
	WyDuSWbFR8sHHKl5j4eT8qInkmFTtTIRobT0HA0DrZr8D8HjzlUAY044o28d0js1lQMO3gCY2xcr+
	UUV3EZiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lhr-00000009rxx-1wjk;
	Tue, 29 Apr 2025 14:13:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jmU-00000009cCB-0fp3
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 12:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=; b=qs2zS1YOosXsExvOOmS378/Ded
	13vlj348iOrfp1SaA5Cl9rt0tNukCMXEH+ZwRPbWDjMM+KUZHUVTe5mk8qbKg6gpUL5AWDhbIph3o
	FjpDcgQ7tp3ejcmZ1t08x3ba5TglVQD2L0nau7GAn+78v/tNPQ1jy3Ti1z5eO4euPs2wha/wdduo9
	AmeELZKpf+f9ABF1jxHT1rjIQdHr23nT/goe26RQkQThkkBzfVkI/LdqdcQSOyxozz8Y0u66rqRmL
	Zr1yDCukucUe7dPRNZyQLGOJ01ePjfg3o/ZgY/K5n4JEMqTp8kbA+OgD21Yz9maBlZ894atOGpOBX
	U45E0RVg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9jmQ-0000000DJeU-3K1U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 12:09:45 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9lGBF014390
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 12:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yAp0LdgXVQkJihbVytViUFNy
	VYiIbcoCGNDRQ8jMoF4=; b=KkGLmgB1DUQVYWqXwzauECf/oT8pq4VmjVHlEunk
	60PS2gs7/H0DESvhb9ZkWdajJVWYBc8XZJ6+r3VBlX/PrWCpiVFsMOKOjWwsLZ4t
	sXQTvabHEZhXvFjTVeV6ojv0tXyQyMf+4VwIdfW/+cvhKbD2+Cptb0qLFNbYBKOV
	kCgjxc0jZnxjzNKDyp8jynZy9R89u8Wrt01rbIVpNTIlJHDyWm9hQWyDs49ffJbI
	SEEtVDUFdikzuWOxvPwun+mTwUweeuxz304qGFE9FgTXReqbnwaHZSozHf/PX2XC
	DS17DjEVCDPYU9BhBSG7uHOMyzzuv/3KfNKxuKl89G/dGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9cgn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 12:09:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c9255d5e8cso1036862585a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 05:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928577; x=1746533377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=;
        b=K+ZwbkCEb34qnXc4QXxn/1CvRlUPOoAwjS+pi9zcd1oDfmuk8FU0URMYS3UsHHKY/V
         0LvYbdeWmtLxmWt0NK4biKm6sdiri9B6ecV9HL5EhUducT1xjBDoJ57uwusKAzj9Hlk7
         I2ej8sGh1CL27u0WdWnyNnEBwqmHtXfN8zN8n1JnoIPAzMzYhaRq0wlBknRQPeeBZhRk
         20R+MPvQfXKbIoGTJdrjEW0++lHxUOsvjqMLMlVqN4MQO6J1TDl2f+vT/5eZloSVAmAc
         ry4e0mnp4cipq1O7J+qHmAkFGBMVU70mBcEBK2lSKzL4XTKOwG8Z6Oc0umx/tjfWUGfc
         RaeA==
X-Forwarded-Encrypted: i=1; AJvYcCWdv3OkA/Up+I8LyidkPARDyiwy0HdomRyhtEuxZZBY9Xr3dxFBX6DkiFaC2GEPHtIhb5KigtsUVES3WtkF4Bos@lists.infradead.org
X-Gm-Message-State: AOJu0YxL2GJfuHl3q7xFeHM+neZSXlNGPRzDAZPhrm3GQknzUVBejhq+
	pLORgupAfKiGVkWLuM1Par6fMdXwqZckDshq0OkNUGB+MiiaXIZrCJKs6CwtTRRe81jpSGX3mW9
	goDMDwA0r1s757ddPGZwQQf+WG1oWxm4kyxzBWBTfGNg9aumQY8rPUjNvGYUcijOZFmp1w2a6gw
	==
X-Gm-Gg: ASbGncun0VxczKnNNE9bsYPRnTuAkZuFLhc6X6N04p/+GCZv/1ILnwcik2xrw5QlgwG
	KRdFmm3//52oLYKkVMr7xlBtcJzmNMvj8Lsz4EL26zKYwmklZ04LplfBIAq7KnEHOQKJqDbgR/3
	SY1Ut7LfRiyl8T5YSmlMjF+PnLKKEYTKniQAZ24L/+/xAUXVousO/sQaD8b7lOdaw7EATv1EaFy
	UMmIhKyQs/7c1gCcnw/ZTgJn5PGoFCbjGoBabmY+NS1Qq5C2A+gUP8S6M3wmiuHgxWyTfSCn06X
	KzTISAp1C9/p8h4tczRyzDqEkUBS/HqFCUMjtETXBzZiGRP3AqmvexEkrN5WkOVIVv2a+/w9zYg
	=
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556718085a.31.1745928576934;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+WiBW2dMdMKjL5rCtckyag5tI3q0y87zTTMxYAoMUgZTNEX197tRyQ4loVEQ9A423pNGqNQ==
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556713685a.31.1745928576612;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a85ecsm24278761fa.72.2025.04.29.05.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:09:35 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:09:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <lg5hhtncppqy2vreut2z7h36mmnuzn2xhw7asrjmftqg7koaqh@as6jetr3pw3b>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=6810c181 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=iF-wyJFYdUVxq7VKmwgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: dAbUM9eEkEjz6iESnGlCGc7yB6_QgDTy
X-Proofpoint-GUID: dAbUM9eEkEjz6iESnGlCGc7yB6_QgDTy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MCBTYWx0ZWRfX6Dvi7c728Em/ +2585Vv9RWt7pRPvCWsTBs3dqtAHFLPjZT03IloRg4R3/5DMHOxYiXWSTlx0ikVHzcQux3aTh1L GDtpT2eEdjOjdrsr9jqzJVvAUhk5pvIvtEmKbeupgFZAQ6D1n7kK6qTFuwoxAVj0bYC2j/MA7AI
 v4cykUtrFD465OA8dXVgX5MyXWIRiUavGa8vXS4ntDMqiQeGNu1HHuowt/J8UAt4gpM+tOkdNCX iw41x7+/bxW79pPJBIYLk71NafJ51tqVddDGYMB5Ajsh7sclcMDpzBkFkM1PrcbJoHIcUt3GOWZ yu3XPZXvvW64xzfdftzMBvwEENkp2NiIXa9K84wsmGcLpcFor6BJu5p5RNP7AoUVbVxzW7X9n9c
 SXj9BaA5TJ4GP1dZu5cHR9zTGi26y5MfErRPUahsFu/uyKcAZvbA/N8mEsGpJ7M9SqbtCjnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=874 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_130943_182913_BABD1F83 
X-CRM114-Status: GOOD (  15.56  )
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

On Thu, Apr 24, 2025 at 08:59:14PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

