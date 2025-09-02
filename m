Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D440CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 03:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFT7TaYN9yFmUBnkUS/DV54BAuRMajtXQdEYrtXcv6Q=; b=UUAlk75rpdlbZrG9dGWWn9/kII
	bJlb2bc3zx+Nxkjh8J8nvVz2Q0pxx9GGFJhKAJAHq9DjfMJ9XfgUTPiyhSxLIj5QI59qtCg4xw2Ty
	jwjSnvCoLQ0NwzYBF+AiJHiR2JIXN+4VplLFLsLqs62gXDemZZ75PTY5hUq6Cl6AgkrNwW479GM9s
	QowZDOdAUz+LV786dv3TikfvFn6wNGg95pf5t8QZR9d6mcUptdp+YoA93FqkWa3NxDcEFGqfPdWH0
	kokS7sgd52+pMET6js6B46GSSDLuSrMAGOUJadVo99lWGSO50tdR8iAwQqJFUN4JbzorTEEItWZfW
	OxEqzjHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utHXM-0000000F0N0-0nSw;
	Tue, 02 Sep 2025 03:18:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utHSb-0000000EzWg-1LgR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 03:13:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RoaH012377
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Sep 2025 03:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mFT7TaYN9yFmUBnkUS/DV54B
	AuRMajtXQdEYrtXcv6Q=; b=JWMSW4mD3PTluOAloZo2v2G5SpKLxOuXPtreb91I
	HO2B7mjqxjJB6HZTSE/JG8bM86XKEfm1+HRcRAGizJR1zv+x7kKsmGSkJCgDWBQQ
	hZuZfoYQgstxYme1EFXQuvAlb6T5459ib/NfGUUB/xYAxoO2tNqCndbAgmPKxE3d
	1oTL95XM0ElVnBpABJAOBFwYgig4M1fYxaSZKiEpR+lBWRrl8wbh9obSoNA22z1x
	XMM61AB5Lb+y2lYPLcYLOmBHqTufDM659xl+4Le2NcwcroQNpuDsU1XN0SCBNq6n
	l6IauTpkF2si4mrFHIiiGj1Vyh2HUa5m8BQ41a4jq74tZw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fe7qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 03:13:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-71ffd145fa9so8805046d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 20:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756782807; x=1757387607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFT7TaYN9yFmUBnkUS/DV54BAuRMajtXQdEYrtXcv6Q=;
        b=isBAzcO3TKe1/dKww1hN8tTuMaAUWbEOaJEwvqxo7u/k3W6OU2RPmKH9eIlHrbQYIb
         LY+qDgOHiYxlY4IdBxa1z8J0VetfSR5F7OcUkC61wS5xcxldlzI9n6slAuHinbpL7C5W
         kffUusIRAAk8DYo2DZfO+8+CFp5Gcv3ldrRmjxfWQCeaC9e149osi8FstN4uflJPSNFk
         EM4i0RdWiTuycRXgZgrZcLrpjdftLwwppVOAXeyklx/883J4/rjfpG9mXDfAVeYw+wq1
         7edeTKvsd1ePCQj4Hmwrt7Y7Fccv67UmwIzA2pYOJeyG1xKS14yg2+g0DaP5TxP5sCpH
         XlpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQsKDB1vxig7JzIkE7FA5sh9AifTDxX/fkFoyc648g8ZhIT/YT6TdeW4HXjDz5+0tvjFELKt+GvcpQLRg3LBQ+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp8astVlS359oiZ9VUgYG820jyH98wLxFTEAiP6eTZpAgMO0TT
	U3pDRqxC1/IwWoi0VL20/5Ws4kgoF3uNA7ck0fOJTD3kjjET6CbLwbepXqdW+LijDp3g8dgm5RI
	go8MVunXY/8JF8OQM/I2Cw5fSapMOinBVo09leBaRT05HI2zS14U+8qRYCZp++LcaVdtyAABEas
	B1aw==
X-Gm-Gg: ASbGncvvJolQTeid+yeeIxEzoN46l3fAN3ooQwKlsFrbCdSeocpbZr1pVZsj8SCi2ga
	hBPKjT45ZiVgKA/4aIi/FhC9FxxqNZeU//vTGzvdQbY7AjDhimVhO1B55NmnGRnXGDk63u9WXti
	5n1MngOajoNK4++7FuKLThnZFfCZJsfjsy9/mqPdzkOYBw0Eu+plM35q1Mt6WDPMj4EPth5USXJ
	CruQSrjf5FpXnhL0nbGW6EXT+juggAsLW6R0+ByV6s9c91YbL+oFnyoCaFldqWNoIeJWfj4GMDr
	oSwaStu193DrNmEKo0RwdNcVft7MTjQpjuvMjPo9cyOBlr4tr/wFNFsuMST7O5XoPz88tSZD2QR
	JpNfMoNNRjIchDnnDmsAQk9sIMxcL/gOKPRfVQ+WQIZUboadyq1Gn
X-Received: by 2002:a05:6214:2425:b0:70d:bee7:22a6 with SMTP id 6a1803df08f44-70fac90b081mr99124156d6.57.1756782807487;
        Mon, 01 Sep 2025 20:13:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx3s/TeSWd/gD8+0Pzv1Eys9blTUBbEzGio/Yd+gCc0H1VU32BQyJUk3uEjCaZ6DP8MJyUzQ==
X-Received: by 2002:a05:6214:2425:b0:70d:bee7:22a6 with SMTP id 6a1803df08f44-70fac90b081mr99123866d6.57.1756782807080;
        Mon, 01 Sep 2025 20:13:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827a53bbsm309669e87.124.2025.09.01.20.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 20:13:26 -0700 (PDT)
Date: Tue, 2 Sep 2025 06:13:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 02/11] drm/bridge: adv7511: declare supported
 infoframes
Message-ID: <4rzkxynpbe7j5uyfiqscjt6l2yr4teothqcga3js7fn6e4tap2@s6npztjtbjbq>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <20250830-drm-limit-infoframes-v3-2-32fcbec4634e@oss.qualcomm.com>
 <20250901-tidy-auburn-tarsier-e7b1e7@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-tidy-auburn-tarsier-e7b1e7@houat>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfXwgv78aw04Zw1
 cyx2UIZFwH5USFENeKsLB1Of0LR9xWkCuzNobPEYK9zP2LsaHRCx/sWiLHon4bwBiU/UyfU4oFL
 BbNhI3kfgJq/HC37y88V6GUXI2JHB2/tzBsqXrdkDIfBdkRdZdPcEyShjkA7Fon+JiFGRCesWAO
 qmOje8OjHWNXpdH/kL50qh1DR8b3itkyrjmGd8GFg1k4m0s0JVqRebfsxnULyScfHfvTGZSPng6
 pxbkY72ZM7jldtmA+WTEGWFhUtODy3jQEIt/OwSp9FZcBjlginn4BVY24p+u9F7XDQ4AMpfBiZi
 LaT4ncuEwXCvcxU5H+rSKiRvui0SGNxcLksJ9R+aS5hFsO+5G7qO0/hfNAAal5KjfX5nJLu34oD
 dXkFkQAu
X-Proofpoint-ORIG-GUID: 67ChF8fNT1ymPpiX5SinJ71ek8tLu0ow
X-Proofpoint-GUID: 67ChF8fNT1ymPpiX5SinJ71ek8tLu0ow
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b660d9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=u7Ex-Lb6nDjXBYZR8i8A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_201329_372489_AEF4ACC5 
X-CRM114-Status: GOOD (  24.40  )
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

On Mon, Sep 01, 2025 at 09:12:45AM +0200, Maxime Ripard wrote:
> On Sat, Aug 30, 2025 at 03:22:58AM +0300, Dmitry Baryshkov wrote:
> > Declare which infoframes are supported via the .hdmi_write_infoframe()
> > interface. Audio infoframe is handled separately.
> > 
> > Reviewed-by: Liu Ying <victor.liu@nxp.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > index 26f8ef4824235a9a85b57a9a3a816fe26a59e45c..fe30567b56b4f600683f0545ed270665e692b12c 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -904,7 +904,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
> >  		break;
> >  	default:
> >  		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
> > -		break;
> > +		return -EOPNOTSUPP;
> >  	}
> >  
> >  	return 0;
> > @@ -938,7 +938,7 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
> >  		break;
> >  	default:
> >  		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
> > -		break;
> > +		return -EOPNOTSUPP;
> 
> We do need to document that it's what drivers must return though.

Ack


-- 
With best wishes
Dmitry

