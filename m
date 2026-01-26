Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F602D19513
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 19:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqfsakIPHTwBzETcZdpTqje6xP/4nMqp2xVshRQ/NMc=; b=ne1Sb22uOpaa9y6FoRyajZ6WYY
	Jr4KSX8kmz6tCbAlySrKV8TDdlSeiCiuJ1IuQWdNU3cg3UAoLPhPaWIEVxZLZ8H4AL/PdFkk0rv3f
	tO6TQMoMdhD7bQQl6pEwlNrqznQl18rPL5Woo8kzEi3JsWvLNewcPhFDUyDEB48G+7QnK3+BFD19y
	ORkCVkoMnsWMayQRcwNBe7JPP7Wih8pALWAb6zjVtbdHX8jQhCsZXdkXNN/qqFS6Ot1gBrPK5dadM
	gcvYub7KnJtnXjEg4UrqmPFe7nMrvPvrXvoj0fDoAvdwrN7y3x/Gk+FJ8w+B3Eqyq6Zr3TcPNQNdt
	G7jVQOHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRpX-0000000D79i-1Qc0;
	Mon, 26 Jan 2026 19:00:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRpT-0000000D78W-2YwQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 19:00:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QImDaX037350
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 19:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RqfsakIPHTwBzETcZdpTqje6
	xP/4nMqp2xVshRQ/NMc=; b=lpmTm/e6ix4LNQPm1ErA67hrm5bi0+CXYTgXGVEB
	5F0JLpjpAhOtHSCDG4vdrvqC2JGo3hCvrEr5e8iZ3F9xYh0FL8olLDjrVQF65e6G
	Jz6c8yof4G15xtOR3MjHdtgW678YRnjlvURa1upnTFISVavfQoASqCblKnTtGXk7
	CM+kgUBwOBUVdSilX3vK7TBANL+8OdtuZXecKObrWvfEeMHye2ytT0PANsdqFpf3
	G/BnHS+NdT/I+N3PgV+FfLkKiUCRrcH9g3LwvfMgqxShe8x4RRsXcgAuNqSE3d4c
	oTGRdGsnap2WRIrzi5qf71AfbPBKQ8X9VO3abyLsJLK1AA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdva013r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 19:00:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a289856eso1488135085a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 11:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769454049; x=1770058849; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RqfsakIPHTwBzETcZdpTqje6xP/4nMqp2xVshRQ/NMc=;
        b=CedU7HQkOr28u6csHudmqEFr6rRU10XpH2Nw6fbp1kBL/ZBy5rQVGR+rxGP2oabA+2
         gr4t013ly1MyPaMIYiS3I48TVTdDnW4WnQ2OKkSw1LkMIzMcEFbAb6RPynJWndn/yt+C
         0wN+uwTiWf4z/e/NfxnKMdaHe1DIw4Q+Bg/raSKhV08l3I/J4qCB5iHaa8Lp4abr/QJC
         NlZKdDLyu30mIwuyyjnaGcbLhV3EotcMXbJ6NseLPfKxfQog/r0JuCU1m7g7S5h7z73k
         8YjZ1OIHUXSHAmbULKa6fNwADhSlIBCp2UlMD0o5zfqeK6tDbZX9gaTqbSxwsDY6tkox
         zi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454049; x=1770058849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqfsakIPHTwBzETcZdpTqje6xP/4nMqp2xVshRQ/NMc=;
        b=CUmSyf24dtMTuuoCAPN3yOItGesLJwFxDPxm27KxnOOKEdSYBaUrw64khrrtaS9xZo
         +w/d+Azesb/FIT5tz4zCanL0Hp4uALclRHtJ6C5j730PrLds+RxbOnk3KH8OKD13aox0
         8ar8LIL/xut7gdU5ODTjl4mOr/BiBc6B1PLKcZJu6Jp2L9qS6BtY9HXnqkiZ0pm3RfDV
         Y/rB5DMqxSgtYape4ECx/P0aKQQ0Ja5Xx62CIA2+Ws7MUhlxo7L8eLoUJde+jDnK6o6V
         D+khVvsKGFPm7DfG3PujFQIvG9gKWuToq/wy0f3m82ohPPJVRJf6i9CX/yTTIL4gxFK1
         p32A==
X-Forwarded-Encrypted: i=1; AJvYcCVOykKaTRS4BE0WxySu8t42mSLfYsY1PmbeXzqhDMM0TMJCl/muWn2xvWJBWPXo1iw0WEMkfSZ+vd+k6l9kS4iG@lists.infradead.org
X-Gm-Message-State: AOJu0YwK2prF+SPQh++4/DF9PL/hPfCRV7XPt+uu8zY/yt5wY4ylJpPl
	JLV8JZyEUWApCvcAFWibqB3MefnsuHPkDXbolPwRfgEZybowmYgIXALp1VIkzcS/2flWkl7XpyV
	zCIGSfvswzz6WLtX85YOzRN3adprffs4qqmkwxMCDvV4EwJEHESnXYWLNdb9T1YmYlYntUolm1d
	fDrg==
X-Gm-Gg: AZuq6aIgSexBb7MPvIK46s09Mr/AJ/t8/enysmQHJp5f4eIOikyJM3vIR7LAhXWG3OJ
	rnII+N9jGP+GLX3AR9KJIGt/70Cqnh/l/1wrQ1pV/OMTS6nrhY20CBhlm/QPktcRsd44AkfzGuM
	twQLhuTUS/ReczkbzzROwd0DKXZELNqGrh6hLbSSZKmBQkp0dWbenF1i9QNsTofTpFbe2erV9aQ
	nVdBiZIX7AwHI05kOjyyAF5OkCuJXtB6fcGLj1e3WmM91OvUU2WWaxwjxIbtosdKFA57o7Xgtdh
	Ch7V5XLEYoDcHGWtI2+g9/NZ0T52/QWPv1k+FXNsvBjppEd5rFgHDDjkAuChuwQ62qmqHRsVfN3
	UKIbRIn39nKaWdBepvR+sw62RHITaOdq0NLiE87+qK11oDNGcHCOvxwc2s3LnJAylYEe3TTlQf5
	yAUWzRtNVCJJvFgbOOZVRnf4Q=
X-Received: by 2002:a05:620a:28cc:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c6f98c08bemr619839485a.39.1769454049396;
        Mon, 26 Jan 2026 11:00:49 -0800 (PST)
X-Received: by 2002:a05:620a:28cc:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c6f98c08bemr619828985a.39.1769454048666;
        Mon, 26 Jan 2026 11:00:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fae764sm30668421fa.8.2026.01.26.11.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:00:47 -0800 (PST)
Date: Mon, 26 Jan 2026 21:00:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
Message-ID: <jiq5ublhbfzuv3qsz3n6bve32wmto5hxc6mxppb2i2wagykafx@d235legi4r5o>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
 <20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
 <5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
 <CGME20260126174455eucas1p1f219202580a1033d3e881adc4f37f206@eucas1p1.samsung.com>
 <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
X-Proofpoint-ORIG-GUID: 9ltP0JApj4nyiNOgLqDUHG2ATrMrYqYD
X-Proofpoint-GUID: 9ltP0JApj4nyiNOgLqDUHG2ATrMrYqYD
X-Authority-Analysis: v=2.4 cv=I+5ohdgg c=1 sm=1 tr=0 ts=6977b9e2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FNNbUphbDgaJBy-ozdEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE2MSBTYWx0ZWRfXx/CcsM3CWFbO
 m+fBrzXUnetSrWr0oo95rH2wF/emkGX9IX1JYZqZZaekpieFLHm9ISwEGtlN8tAiVzPBzJBuvPm
 wNnxW/Ri/CiXot+zoseZ903wZN3OA+qnvtjg+P/adynO6ni0WcC3/E4R3DGert1IYk9QE/8tt2R
 mKoMtlwuSepIwmXFgehu3fuKxloIVMLDdQeqvImSM+rcmbON9KLeDWyuLWmHO39krHwV79jJSxX
 cnvxyaEUCImI4Tt3IRaT3PRTe5JP2k/xjLWZo+hX67URJ/LZSbgdge0VAFZIsPQWw8Sl4d+J+fV
 Bip9Xcf4LnOGwJJ0kvA3gCxcLMiI5y3irUAEpP8VVe+iHotqSMMJCjvD09hxtAuiUYbMl6kupFp
 QPBW22xspZqG8c1JDNxqRBo5z8BYY6f1M2fkNnYeE1VOjs0r0FlnoMCmGrWM5HpZdmIOB0s+7xg
 l++LOvgEnrRJJ3j9yxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_110051_782951_C7E8EE59 
X-CRM114-Status: GOOD (  19.22  )
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

On Mon, Jan 26, 2026 at 06:44:52PM +0100, Marek Szyprowski wrote:
> On 26.01.2026 18:42, Marek Szyprowski wrote:
> > On 07.01.2026 19:14, Dmitry Baryshkov wrote:
> >> Implement the clear_infoframe callback, disabling corresponding
> >> InfoFrame type.
> >>
> >> Acked-by: Maxime Ripard <mripard@kernel.org>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > This patch landed recently in linux-next as commit 3a4ceb89a972 
> > ("drm/vc4: hdmi: implement clear_infoframe"). In my tests I found that 
> > it causes the following regression on Qualcomm RB5 board:
> >
> Please ignore my report, it looks that automated bisecting got a bit 
> confused.

See https://lore.kernel.org/dri-devel/9ebc0582b0f7990d7df992a07ec8ef7f@kernel.org/T/#t

I'm going to push it to drm-misc-next-fixes.

> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

-- 
With best wishes
Dmitry

