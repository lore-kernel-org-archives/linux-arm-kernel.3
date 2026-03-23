Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F71D58CD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 04:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxISgP/fl36GplI+JqnlrwsEhA6Bu39iBYyi3QEp08k=; b=y6VXpTOGhe+Zgoj52DlZ8paX9x
	Jrgwxoh9dZmQ8WvU4e4wWrlF7kEPrOQkNTb1QU1U3neDFMYjAxVCWJ3bCFz378zyQ9mOPpzt5yYp2
	P/KBgP5KPGRkXSdK0Kkn5okvRQ7W//UjkEKzS6+BDydov+gYLpjkaR3PAJCAsNeajxh0kzl33+kfB
	6P89CtOHT5NzcIk9sMi95hkV5HFG12k59ySsda+jhX2enK+uDDszWTkUkjAX5Z6RmvwXxsHllVirU
	iDXdzN3ptwmBVGMNS+CGFD14pDhDDyVLPXJIzfUnqOB7o705RLWsnyqft7kFXhEULzCnw5lsEnCK3
	bPHKlj+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Wa7-0000000Fz2A-0EGV;
	Mon, 23 Mar 2026 04:07:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WZt-0000000Fyww-3chT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 04:07:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7D4uZ3737826
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BxISgP/fl36GplI+JqnlrwsE
	hA6Bu39iBYyi3QEp08k=; b=YwKTM3sZOJdgT3TAFMPt9LNyf5/D4M6suM8CSNMz
	BYaBOWI6dfGkap/oTUuKXyHdTV76LQO+9/j0vAZQ0jswoAyN+MEvvvLrMyl0BQ34
	rnzQUQ8L9DpbxmTPRdcUV/2nWH5zyvxSxuM9D/36mwIzddifH1wH3axnG8ak2HiZ
	1hagwh+eOOrVVoWluYEbH9ssQiyUwKI2Y4YQ7gjbNiieW1uFcgjBv2EKwnC8zZIC
	NWDuxi4fdO4w/70RMll+U0fRHhJrl3n+AwdViEiCZjbssrUd2kLXTXBxf//VrTXY
	1Nlif3WY1gBVNQgZnuiCrQznq6IuNnSYjdYCxjR8ySPuCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghbh5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:07:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090bc4823cso68114511cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 21:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238864; x=1774843664; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BxISgP/fl36GplI+JqnlrwsEhA6Bu39iBYyi3QEp08k=;
        b=DJKYTzaIlomfCEdy7KxVd4Z1y8fDy49SuHiAfwIVhCYT0ftfAIldM893TGTjGgmdKt
         2N0rcfeViywhQnb4DhE5WWS51lCXy2ilTnSRtCmNLGmbWsgY9ltUu8lt/rZ35RHOLVVV
         eSFqjH9sVpynoscphLp81etuC+Ohfrm62FTFHZ6sREeV7I8tJpiYB75VmIerq6z0OZDT
         NMGOWQuHOQh4Fn9UUKfVtRUUZMMnV43C7jmXpUQp3i5pe8ZJdcMl735YO7SZyO+mnP3F
         h/q+DAYyh8yvk8l+ToVQPYy7KYtpLZJv/RV9L3P84B70SI3DFDVu8GFDguMRQyVRo4o3
         6NSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238864; x=1774843664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxISgP/fl36GplI+JqnlrwsEhA6Bu39iBYyi3QEp08k=;
        b=gKbsVcnYAqt+gsHpDy/xf7PxX2rhcknvtC1otokZ1cvvVIQHt+VLkKoUnRdMhMo84d
         rXSBBwBE4ralJ54hvx0snS+0EjKgKXS5Yy4GcJPR7lM3zkCFUtEumGqNQ1vvywpc/wY4
         hP9HbsWUqrGwEnw/y95VSH/SVvM3kj5Z6IMnmonO1vKHYT18UbBMOKb7/WhxnPmEnxNH
         6TWZbFLsdehjQsegaWCK9xAmlosb0eTgvuvMtEruGRdGlmakhtIOJjXjTjCeFP9KHoZP
         6UvPpJElho8QVFA0Ho7u9AIRWB8vsuHYRUg5zwJMNjHwNZk9qv4tlLJveX4/BYYyY586
         kCig==
X-Forwarded-Encrypted: i=1; AJvYcCXiwyORvKGk0tPUyQYLgPmli5UcyIDSJ8EC6+W3k04Pef15tFDA9EE3LH/KIIHsSm32Oo9S3FZ3HKSH5OLbFyz+@lists.infradead.org
X-Gm-Message-State: AOJu0YyUJKApRLkOEzN7DIvyXqWD9hdQzQB0S3CYXbQH4rPeG1WxXi8I
	LXPTrk/XDFJ1Pq3Dx31333kte0LJlMH8YqK9SRXAy5WWVHH6Xb12P3b/ByR9DEsE1PoEAWgMhtU
	jVo4ca0ixVN+QKQfX1AH5JQtHOIp5INIzFIILkLs4mSYepWyDMG8hFZ95sw1j3hwN3Ut1hNBpmu
	hpcw==
X-Gm-Gg: ATEYQzylbj0+ZbpUjXSGzw0LT/aos4orfVhc5JIz/SSaGzb8Ci9v0TFusUcd7hZ9Iht
	D1mk6n1yOTiUzfkj13Cdu9/kGnpF53sHWhXEVqCqiUjMjQAPGSbRpKNxCo7zeAG86Ley6SNCv7K
	6RGjz+yI2PLvojR9i5Yrr1B5JItAs/Icql1MI7t+fZ8n/BVo2YLoyBEJv3K63O1oVMI/Do6G8V9
	CmuHMK2LaKPDSysdRiD4iRbvRbGJ2CZKETCsSvjpmobYgI/M7Nc29+M7GI2Is2XBwEXdPBfVPFp
	Um2gMfITqdKCiYN70r5BZo2pMmsoqsUbaymK9nOygTP+B70bUv68oO1//rGFxDJhsurWUgDIVmV
	y6enMEU2C/nrKvwRjmExXvCmnBG0dnru+M9NJu1fVoGZYPtc/AZwfpGHvAxAo/R0U0k5ikRcHln
	+V3nDzufRIJWa8cLhgjRUS1RbboZ2hZ/dB5nI=
X-Received: by 2002:ac8:7f0c:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-50b48e34b2amr101886971cf.18.1774238864362;
        Sun, 22 Mar 2026 21:07:44 -0700 (PDT)
X-Received: by 2002:ac8:7f0c:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-50b48e34b2amr101886631cf.18.1774238863896;
        Sun, 22 Mar 2026 21:07:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f73sm2204203e87.54.2026.03.22.21.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:07:42 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:07:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 03/14] drm/display: hdmi: Convert to
 drm_output_color_format
Message-ID: <7duzhocpjyhpvoiw4xy2wlxmrld3sj74rqhozbnlpv2magmbta@c4rlwitio7p6>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-3-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-3-f3935f6db579@kernel.org>
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c0bc91 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f-rPyQLBH6VTMeScU9cA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ZO8Wb56MdR-h2QXIRWmcmYkkAohLFk03
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX3gL/fLx39aBV
 RANHNyQyMLTWbN4qHC2eRP0d8bpVOGFdqom6LiHn/leC3w2C8MplRqZkE8RQXJqClCsqPFeQ0jK
 TBDKdVpR6Vf9lauOr5JlEiKsTbsZsVBatlSH7gvySHCpO0T4bCWTGI0ZB3UenDwUCg999zSCaQN
 Gi3ehel+xC9XV2Zhmqgq0IJwvumymCQQgB26tW2YGkmn2PV7HPxLy1MYXSkpaVD+MSm8GgOGFVh
 gdV5IFDcx4+RHjOMcgoRQEsqSXaA8uynZupxLeDNLhFI1FcXcFjXIK2DE4TMJ93hNFIXRJTNmnB
 pBrMIn4ZHOZuEM8jQiCeXWocRs0lAoDh534Bo1Ju/pVkUmQEVP+Z45Cdj8kx6ddaSceT/eJAwJt
 +EHFTqFjrRoMU2FTgwO5LrinA+4V1uoGePTa2mFWMSbWtCv2/z8pVpFD7O70Gs2KGE1tK13LPrs
 9WVYKHSiaozfUUVfpOg==
X-Proofpoint-GUID: ZO8Wb56MdR-h2QXIRWmcmYkkAohLFk03
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210746_025339_5FC0E097 
X-CRM114-Status: GOOD (  22.06  )
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

On Thu, Mar 05, 2026 at 10:04:55AM +0100, Maxime Ripard wrote:
> Now that we introduced a new drm_output_color_format enum to represent
> what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
> enum.
> 
> The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
> drm_output_color_format is a proper enum. However, the enum was done is
> such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
> the transitition is easier.
> 
> The only thing we need to consider is if the original code meant to use
> that value as a bitmask, in which case we do need to keep the bit shift,
> or as a discriminant in which case we don't.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

