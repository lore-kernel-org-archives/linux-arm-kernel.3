Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C8DCFD626
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=js9vOdGwDOtrz/HNGFuhKMtQ9O5QjU14j2FRmChcdtk=; b=uAABSvDbI+vr8yZ0agrXd/5N5S
	95eWomYSDVZ3Tjry062gevUOXhh9gUL7v3xcuDn5kif2eCrQP7pggpl5RrQE2OzIa5XM60o2bLvte
	h2BrLOgv02XZmGY7Dnb5TiA/pUpTjjXmECn7vN5HzOAX2GS9PrJ/dLE5OhZ6BVgLsIDQSEhJDDdPV
	2ZP/OpexrO9ySpr3ViCVN9kga6vHDCQcDhFNe5HgbDbkN573aiW4GFQlIq4t/RTcmuCqJsFjTRO9N
	VmDEPobbkSHKbAa4IFahWgYen5FyhndvXrr4kkjbbzi5XEgQ3GbAT7OaqQUdyMWl/vuXW8OzOty8L
	OLi4BoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTTy-0000000EzsN-0QUR;
	Wed, 07 Jan 2026 13:21:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTTw-0000000Ezrb-0JHC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 13:21:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607BMRBh3152513
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 13:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=js9vOdGwDOtrz/HNGFuhKMtQ
	9O5QjU14j2FRmChcdtk=; b=kG3/1cJ1P7ELpcYi4U9ELqLxZVjt72LrO+o8b368
	fi93VpPDiEfi+45Q2CtKwzWuPFKqWY+Mh2EiPw5vd8Vpm2XRAuWkxK31fv+YNbrk
	OSJ4rpTVpu9hHJ7SkXwiYFRpfkTeY9luQTuQ2KYP2RGa+UHizmcikgcC/Zs/WuwF
	kfShAdfmGYD4ImRzKeBScibWpKKQLsGDz07GG52n2IAAbm5UrKb3Ois9v/A5PYBF
	mcHPsICzCwQTnNNr+3AxzepT3h5cb29NlRt3Z5jjNDBDNULEmobYyiKrsOtWKWt+
	IOpcqT84fcn771H2LtNgspTmUV0Pw4g90RXS66kMNU24Dg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhpjar9r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 13:21:47 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93f5a368daeso2331276241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 05:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767792106; x=1768396906; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=js9vOdGwDOtrz/HNGFuhKMtQ9O5QjU14j2FRmChcdtk=;
        b=Mw/9wQztdhpnv2N7+mz/JFs/M/i963v84TY/ASZMZlHkoI3rR0b3dljwegpsN+eKWB
         RBgItYzxOSv8KFPP3DaoQjLvZIax2TaqoumBkXjuui6eElJB7q7nfd9X0Pb6Rv+6VDSB
         18D/SFZg6Ejxsi6+2+ps9xMU+JKLSbcZ+etrIa88IuM3MhCOon1mVyTEhl8vcCr96eiU
         phibJlAV29lANZ0AGFvh1vq1gklIZZlmoa0Pbi6FpvJI6k0zeZ4yI48EaONReXYcTBeV
         GS7nXDut07qnl+Jh4DO6DHrGfSyFpoU6+wjGtJt5nEIyEi8yFwW/gzDFwu6Dxlf9qr8w
         aIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767792106; x=1768396906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js9vOdGwDOtrz/HNGFuhKMtQ9O5QjU14j2FRmChcdtk=;
        b=fPphh9sd3qsFykhok4I/JhSot8wJyqeOCOFZ8xD+SHVLrtlze+bpiBme479fEmj1Gh
         Puq2AgYpi/Rob0FeOKySyeoiwl9E9bAvlhxdTT7fTLYgSGHE8n5TKm4VsX3/OevRgSF2
         PwWBzh8T2aKYotFBazpx9+e4Ko3xcbhDewoCOyUGvbMsuH0Z4HsAUu5KD9YseNj/Kh4y
         fvFH31By+shWDPtbUjGTiBU27NxSI2qv6PYM90LewtcdQp5ex7xARGP0nVs3F+ER4rAw
         L4VAyVbIc6zQiD6n9wF6NluJPYfScFb4tQe32JaVogvH8325dMYjzzool6IUTr0mE4sz
         0sZA==
X-Forwarded-Encrypted: i=1; AJvYcCUJZ1T9FOjsFYVijA2Pqdt7Oqm2agHmzvYoAi4x989rjs34ZG7SmyPnVDDvSuaAjsTG2sO3fkj2+nYQxYxk8GQ6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7c6hwyxbK+MmtvtwHMfGCDoYsq7Ux6I86pUYXxVUi3jq5Qa+0
	gKmU2rsWqj3a4N8vnjh9F5k8YJ/mRmjpbD1KTak10GhzGKs/JHqNnVyX2HMnhdxBWQnAd1sq5u9
	F9SsbxDwHulvyxsKTKOWQ1BoSXbaZquwnVWDKG/r8CukpNNI31f/7iqA7Sc0QnQmg90k8go6p1d
	KIbg==
X-Gm-Gg: AY/fxX7VCZNCLycctNfcdhGRS9WGLdXm6ySYpbd6mdGVxwmG4wwbmaz6S0J16UIHij/
	gfFekJcqTehDb+JLQXnrpbCLCgmwp+SwKE2iqnvH4SSx7MxQb6ZK68orEbIPyeQ+Rc/rtgUH1hR
	Sn6fZuyiu8ElGJ5gPh9AcmIFoJEW8wXpaY9RrF20ZfmjGvfacbnkb4aqCzqr10LYgFc/kWTy8Y+
	UdbmpgbNtCkr2tpFEVZSR8scwrcu+oLnIvhmBzSxWKX7mIYw8nrG4/Gldw2+t4krLn7BVBWg0Iz
	VqG8yLjVWvVYU2E5G64Hp206gtNqrh2WOW2Chka4gyu8+MvM41s+rObdgOGx7P4dBgm4MZsg1z9
	F+EnOjmTl0nwIAkWyHtUjnBCvYD/ebNPD+PYTC4o5FrNOnFPJjfkGw1gJ6FFwfTXJRetPIK7hdA
	YXaOS3l3e1UhSNNpSpXK0ou8I=
X-Received: by 2002:a05:6102:32d3:b0:5de:a2d2:8076 with SMTP id ada2fe7eead31-5ec752dbfd5mr2097444137.0.1767792104915;
        Wed, 07 Jan 2026 05:21:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2NXBDg7wVXP/zTsrowEn5NsyiVqeMK7cDHudpgAqGMWRN5e4UR1GPSBvYkE7wBgLCTq0Y4g==
X-Received: by 2002:a05:6102:32d3:b0:5de:a2d2:8076 with SMTP id ada2fe7eead31-5ec752dbfd5mr2097376137.0.1767792102812;
        Wed, 07 Jan 2026 05:21:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8dadd1sm10295211fa.34.2026.01.07.05.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:21:40 -0800 (PST)
Date: Wed, 7 Jan 2026 15:21:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
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
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
Message-ID: <mccxwmemwxp4fcyjiu3zofuydk5ahmhnluqucwau5a6aiw67xr@52gynmrblml3>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
 <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>
 <20260107-fascinating-boa-of-fertility-1886a0@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-fascinating-boa-of-fertility-1886a0@houat>
X-Authority-Analysis: v=2.4 cv=efMwvrEH c=1 sm=1 tr=0 ts=695e5deb cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3wq6KaL0rsEoTcXXugkA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: MvWn57V04oNJ44ayhRC4UWBh_4iR3izt
X-Proofpoint-GUID: MvWn57V04oNJ44ayhRC4UWBh_4iR3izt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwMiBTYWx0ZWRfX2onItd0FXGy4
 uDOUstuJIBt15RXKK/6NkWYPFy+hWpVXzuLhcgl/09poPRFkFgdWt8LScJgmFbifG7BjKMz3J6Z
 12jG3vFsQ1NPvP/vUicgkCTzVyDKMrpzXkncYC05CSdIQ7Ai2sn2FdNzZmBc0OLh5UCCcjTDKCf
 flRMFsnxdkgbQUZwavwvGiEmvYSPkdWnymuggMDRYDBm9b16dy9MXpijOo3lpARVu6qr2f2eT3w
 ofd1j4p+yGktE0heePCka3YAPt9d/V81BJZMLSDJowHQFizuOa5LBzwWwhX5ATxRUSKbP7jscPm
 zWkle8CBCnoaIrtc78+BqSDOTOK2nKR4aHW2/kzMMQIzV0WygkilXBaQU8yyP7lX7LMcwp2c+mS
 D6QHt/vS+kSuWV51JNKYoFtYmj3vsdJSA86UklFHYKpqG1iNgKRqDPvAo+W85GBRvESoesYAJEf
 ib9oXuUPRJ6sVowokvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_052148_111451_06BEBC8F 
X-CRM114-Status: GOOD (  20.62  )
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

On Wed, Jan 07, 2026 at 01:50:51PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Dec 24, 2025 at 03:02:56AM +0200, Dmitry Baryshkov wrote:
> > Updating the InfoFrame if it can not be sent over the wire makes no
> > sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
> > and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
> > an error if Audio InfoFrame callbacks are not implemented.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> IIRC, audio infoframes are mandatory if you send audio over the cable,
> so maybe we should do like you did for drmm_connector_hdmi_init and
> error in drm_connector_hdmi_audio_init if we don't have the proper
> write_infoframe hook set?

HDMI hosts can be sending Audio InfoFrames in some other way (think
about LT9611UXC, which manages infoframes on its own).

-- 
With best wishes
Dmitry

