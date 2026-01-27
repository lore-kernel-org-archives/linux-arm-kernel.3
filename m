Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5096D2FEDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 20:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7u/+GzEYAjioDYmkQxOY6xsCw+YDBbFVfBMYmE+PTU=; b=k0VUmByJ0/f6LeekqqlnJWfLFS
	UcX8saVu07ZMEzrjzd0QcZTS3T6GAmQlTFhZPCVQ1kBAPyhuNq7Xbg9Paq0k6oYVcM4xsgcUbZZUw
	ni0lydbKkTubeAUDX7rAk2VbvDJ4wEpVEiowUZ+kHMX0zyr7s9NBYHA8V/MpxIh0BGo7Xr/qvRRln
	08c3HLOnUbS2MMmpCG/EZkmVD1rOQVBGtAprsgEYNYjJMFVlGkvtoHDI9QoYnmO291zLc8lqC1rhN
	KugxrKnOWo9cG2lEyUjReiHz1vZH1Gcz5N2/yMHnO7BH0xN42gxeBmFIkZLrqFf9W/ODhshSwEB1T
	kSmqBjgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkpeS-0000000F06U-41Pf;
	Tue, 27 Jan 2026 20:27:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkpeR-0000000F05g-0RVT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 20:27:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RHVuh21268748
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 20:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R7u/+GzEYAjioDYmkQxOY6xs
	Cw+YDBbFVfBMYmE+PTU=; b=OlEJLz9Jts4JCKDA2sUywDbOlEwV13u5StSD37uO
	3jZ2LqLmnkOlj3tENXxxrto0rqSvazhIxACvFa3vg9Lr0LTfmIGoBSKKWVw7oxiA
	Ygi6pAvHAHWzb6RO4xH6d0S62SdvBx5ZYlidlKngSSWsM9rethdRC2pSYUcDiBTF
	T5FQSQLRcDQhV7oEF8GYAH9Gbn9OVoQhUGC0n7DrBSDA+jXZdZ2uyp0KnpDgA8Sm
	dROwvv75q9PROWNOhczfWpFsK3gmh3eR87eCfuCL8Yc6qCOcag0QIWk8bnEMl7E3
	7ZVSIDQJjUzuMcn7KtzSEzu5NNF2rO7f5YkXeibASpI4Sw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyau8nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 20:27:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5eea68151f3so5866422137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 12:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769545620; x=1770150420; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R7u/+GzEYAjioDYmkQxOY6xsCw+YDBbFVfBMYmE+PTU=;
        b=COyVm6HKJIkaRjXee/0oh/tc4FEoAaCSOVMYqqeR/Yd5EWj5E/VrYdRQlFKGUuuugq
         2ruty2XK4NWTHSz34LqeWDfN253JDx0N8GNwGEsJUHH8qU2BZePX17l0F8evr5j00qYy
         KZOCrovn6B7Zj3ZYQgdWoeE1NJAmERqlt1BrQaJrq/xyvHrQhqaUaF5/ToVoUs9eFuOG
         jCtvTVpedO1qDkWHyZYy/VUAqPKMBYDrxAQ+ievRAMidTK7UTaq1T1bLS3ekPxjByUTf
         ep2/c3D38LRbh8wvxMs5P/jn5cFrlQ+jV+Pj+VxRMK2H2FjxDH7hI3CQskB9KavkP5qH
         0Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769545620; x=1770150420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7u/+GzEYAjioDYmkQxOY6xsCw+YDBbFVfBMYmE+PTU=;
        b=RBpXbJsS0ZUGMyZbTfAibe82CPvYvErhDFbjTBTsRv9rqdOvhKgUuS6QXplsrr4nLU
         4Jumrn3vdBEvqqdkBMDeJovtrroQ3iBY8foSX4b5/wz4Mg7ZfiU2OdFTUbm8XJSDVD7b
         /IPRYXBDauSun5lxzaiV0JvL4qcc/5ql2CUnSdAXczAYMoI1a4eGDGidTXENKzGVFU6o
         t8eHXUyNJJ5qPKTKt/XmpMWWa1oQ1zA5Y418MsYNVHOEG7zEy77p2Ni2O+fsBRMB7Snm
         GCmyeHL3Rtsmpn3AJh+9PSr7HngQjWcMJJl97hFBW+BrIhVWOCxU1Jb6UiGjMMAedS/7
         FjWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyxqObygRGXsjjJsm7FZjow7RQRYckEiFyWiLD0lf6q3Cn0SeRb8XPD4Muq5V2p0Dy6ruvNj+fuvrKJp4tbBn0@lists.infradead.org
X-Gm-Message-State: AOJu0YxZBhL2IY/W/ZL7GQWMOmgu7GNw3LA2CCrSmktvj15yRBxvWaoC
	Y8iOISeRZGa4+47ANZpmJxlgKrHjKMy5a7Ukg72JsOeq2fVMgJ7FXbMyuCLf2Eky43BYZjGdRd1
	S7iDaHceO0uWB4wm1K5njtBechk6RiZ+CO4t2q6zU0lDcHDNkKKcBg0CQGkG15s0OyK4x2gn++o
	0ycQ==
X-Gm-Gg: AZuq6aIl7hfliled9t5EodnOV5KB++agncMLEyPqESki6r7oRQOKsJ1ejrqos/QhQMV
	NTRmynFg7DtqEvKb5eHir2mBSwccGzByFxTnKSln/hViNMfb4g6/LjX8y0NP0pPx2zru/CzjggI
	ZmGQuxOZ1jekZlxR6hHECPdLwmi1qKCvqv/GCatQleJJ0ZnragZcp5L2Trdw74L7M/dm9C3/Fsm
	WGyuVm5iVEk3jhv8C0s6l6PTgdc8GXzJLxtr5FFmQie06zzN17+0eyD+/4vMVAfhrqgYjGpwnLN
	VcfYyBj8KBJnnMPwnf2Uvaevzscf8m5ulQhRWfGzqoMDCdCViFvmMTbpEbAAG84RgBrqiPO/fbt
	KtQpPcd46SW5OMjTYCX3bnsr9zS7hJrcSjDp6X8ZPPnBwpk8TYH2wEzbBxMF9lvexsWzYG3merF
	UaG2H5nxj7vqO2zR3fCNZr7kc=
X-Received: by 2002:a05:6102:290e:b0:5ef:5387:ca85 with SMTP id ada2fe7eead31-5f7237d2386mr962053137.39.1769545619910;
        Tue, 27 Jan 2026 12:26:59 -0800 (PST)
X-Received: by 2002:a05:6102:290e:b0:5ef:5387:ca85 with SMTP id ada2fe7eead31-5f7237d2386mr962042137.39.1769545619368;
        Tue, 27 Jan 2026 12:26:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481b72sm147447e87.11.2026.01.27.12.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 12:26:58 -0800 (PST)
Date: Tue, 27 Jan 2026 22:26:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
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
        linux-rockchip@lists.infradead.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 05/10] drm/bridge: refactor HDMI InfoFrame callbacks
Message-ID: <6p52srrxddazxiwqfqmjpef7k4bbpzojxqiy57zmhqcpqa2bum@gv555pvqrige>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
 <20260107-limit-infoframes-2-v4-5-213d0d3bd490@oss.qualcomm.com>
 <47619a02-c667-4fd0-afa9-f6cf7aba8dd4@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47619a02-c667-4fd0-afa9-f6cf7aba8dd4@sirena.org.uk>
X-Proofpoint-GUID: ccE0LgkMQ3idJE-xDWRv9AeTRADuQ4WV
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=69791f94 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QCwxOkPKupwELJ-03vgA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: ccE0LgkMQ3idJE-xDWRv9AeTRADuQ4WV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE2NiBTYWx0ZWRfX/4J+xWO4/4Fl
 RBYmNFbmf/UiwkIaKQeWhurjT3U8MshYUabKdrOREl1BuCCr/DjRr8UNI1udY75BlEt4p84RcZk
 uH659jVkPRis/OdVFaUw2DmJzYwDp76LaaCHDeNjsHZR8avSxiMtkoOd9Dc111GI3tplqg/oHbp
 FZh28oHiOhoOerXAhHGYoNUlG8moFSg5hpRgO3Khm8OFDXe4yxPivOSTFrEqHYMbcFOCdI60RoL
 aAgtOHgFKuHClyJi334xkZCTWBOoS6PlaVm6Cq75ORhka40uEIhWk/8xK4nJ17/QgjQEVu0AIe4
 WW8jMtv1Gza4ct5acMoWr5p97fZPc4+ZT4w9w9iMKjyamJFTEVnRPWQrNU+/wbxGabvmfOtfk0a
 Q+wUXARBlpvsRqKz7hybw75zVtVwAQNuRVS8AxqVlbTfwms3gCJjwrLcTiJMDPxup1+IT8x3Gsl
 A/xK6ucLH4X3PNow1UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_122703_255392_B3754A2E 
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

On Tue, Jan 27, 2026 at 07:50:25PM +0000, Mark Brown wrote:
> On Wed, Jan 07, 2026 at 08:15:02PM +0200, Dmitry Baryshkov wrote:
> > Having only a single set of callbacks, hdmi_clear_infoframe and
> > hdmi_write_infoframe, bridge drivers don't have an easy way to signal to
> > the DRM framework, which InfoFrames are actually supported by the
> > hardware and by the driver and which are not. Also, it makes it
> 
> We're seeing oopses on Qualcomm RB5 platforms in -next which bisect to
> this patch.  Looking at the patch I'm not immediately seeing what it
> might be getting wrong, though I do note that the board uses a LT9611

LT9611UXC, yes. Fixed with [1], fix committed to drm-misc-next-fixes.

[1] https://lore.kernel.org/dri-devel/176945413960.1492466.3261759749688865592.b4-ty@oss.qualcomm.com/T/#t

> which is updated by the patch.
> 

-- 
With best wishes
Dmitry

