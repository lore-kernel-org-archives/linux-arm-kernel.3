Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8AFF8FA99
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTGT9dVHn9ZD4VlzKf8b4LWlwJ6q97WIUZp+d0WZsqE=; b=PKYFMGDlyEdiB7MIHhTq7XCb6m
	R+bqdXsMl9wGrAuvGjnbjbEyZmJT5yFvLSfXmM+ztr7svfJIjb93GGdsY/ePHmSfhXRzJuwaOANwu
	V+Y0i4OkKCB/+J8vyPWUIZAqRwbyhI7Ep02EDM3G4kl66sKtShXJcrBqvqeu47PNiiQKdblu8ZJYz
	BZ8mE/DrX3SBtH8SnHpXE35I5N81nTQt+s2tOzeTs7NEeaZ5SFyZadlvcEXYRJZItsd/QmnsSjIk/
	0ZXlYA/Ny8oIWA+/i/f8wF8VHJE9bOEZ1e3xCTfa3BxtVQ99HH5AhMKGQliTS7M4hyI0wUmBV/xue
	k9TaTj0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDVp-00000008sVp-3qRn;
	Tue, 21 Apr 2026 15:59:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDVn-00000008sV1-2ISg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:59:44 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCtPTa1538502
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qTGT9dVHn9ZD4VlzKf8b4LWl
	wJ6q97WIUZp+d0WZsqE=; b=blC0KCuSqm9wlc6YuJb5fJBNdXfodybBI8mwiIpG
	cu6otodaBirp60rUNTgROxukDQUGZiL6De3HJPM03wiuePdz0xSeBsYSBoirf4PT
	qoLPdE+pPdkw5yTbWy+PGdRwzUBM1+HV++fY4+Q+ZbgP0RdOMBRXxnbSIjPoBKgc
	hF5Uyg91dwehoFyGu0H2aXCfOynF8KmbWq8KKtVGWSE5p7KJpLFXx+76GAYxak9D
	p94Xm6IMiIlV3m9FMlfL1EKhpkJ0NfmkV80pk1th44BQ7+TPFCpqlNJMiPj9eL6T
	se3Lg0BuYQoLayAbgATtnlnbdQjBs4NA+YoK2kDwBPuY7g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp4hahy1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:59:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-950bdef305cso2662115241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 08:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787182; x=1777391982; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qTGT9dVHn9ZD4VlzKf8b4LWlwJ6q97WIUZp+d0WZsqE=;
        b=ORxS/JzuM2BXgiPy4SA93Kz0nAM53DJywwtNk9TSWXWdudndrXCwuIJpY+I9YDjJdK
         hiaXTgkcgTWs1F2gqeOaHnlkT3iOhqATSzeJoywDfGmLstTRewUevcpwv8kKvQpwf5jb
         kMqqNm/22A16WrOLHlrkuVYLXFW2OLYCKfjeKS51eQkojAmlFx4xhlRj8fZmsX9xRo4g
         fe4ms23uDIviG1dvzeRah8r5y98g6SuBeCrXcYfko1/GrcRbkCoa4yDvldvO22n6wWUD
         uGgVpNv0inUa/8jtoC+Jsdv1mVVhOSEfBEz9jMVS6u4MefJTK1zztfZwa3mkpCnLDkH2
         BKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787182; x=1777391982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTGT9dVHn9ZD4VlzKf8b4LWlwJ6q97WIUZp+d0WZsqE=;
        b=tFnPpqIw8PUp8gKCDIv4lK2Uq4EpTeK+Of4Ib1dEVMzWQGn3IGXYJ2pNlo8L+ORDdg
         Aqoc8MjHlNCx7cxJeesiOBFV1FsdYXHwMqrrr1OKjMqBjs2SqPU7jqkCpVJGq5LYFm3Z
         lOdHzVlXDwUUHGuA0iVW3yqVmewvuYBxJzdgoNPiqJMoJoPoN7Fs3cbxbGNWnG6dT95i
         bHItgbI30SLTvz5Mat5VZ6G1tKTzzGiFmAEokhXNfdsQaq7rY7Cp0ijwfTOQfZieWwLh
         o/MCz43+vQPOsVEgeya4ZH0TjORT0G9J9yiGYce0jP09CIkkIQxHY6+M2zbZhzaplp/m
         FZvw==
X-Forwarded-Encrypted: i=1; AFNElJ/igVNeWHHiu2Hs3dhvXyMKiO19/HYU9AnNrnqewwxuYP7kU43xirE5QvfN02SiNX57R65EIQ6hFLJJCZfaGpPa@lists.infradead.org
X-Gm-Message-State: AOJu0YwBSpAHVmLTg91HJyP/yC6taReeYMgnV9jkXHO0hpx8FzLaWBMa
	Oz+dIyyZ0t2BgABwZg194mehuP2ph6I4q8Bqs/+fxe7+MaXz/5RhrbuuzUtvXpiZlYBOTjs4Pge
	bcm09BjpSegB6NojVrkUTA9NILCAAaSjO1wQUfcBD0ICp0LDAgxRHw2NAQ78bL+o8sDizqfC/19
	3Pmw==
X-Gm-Gg: AeBDies41s+pYOHVyR3LeKjA28i0en7xcgbDpqMBDc5XosQPG8cKbfUgK1nM32M7b3f
	r0rPjTpnRKBoJ3IH4wkaera3iKdLWMKtSSnbmp8m+DO1NTwZ9gbpmnWKee1WUAo7IZn+LKfmFuz
	q66HSkPomBWjhOmdV7pXqPtDklBDapdHe+u8T6m71nl1Gwoe0LUIj0ikGMq4Zy6+nAYvUXrm1R2
	RiGsQfHuyVef7ayf17SGnA1ZI4iQ+/eFEVIKAbHeFLJCaWtLSWlRpokk3oPuWvKnLuG4JHMXQEn
	c/ci1GO9UjAamn21Do5yQcfUQOiwcH2R89uq2z30Xzvy5Y61/1yAP5EV03mAZ7MOCcHIGKZTqiA
	u7/d6IE8OsfxK+7slS+p6yh+VzC5GRVMWKyZOA8J+dn1CzmLsMClE4huzmwxCblsqZAc+OtPs0l
	bVaK3hh+hvVTZ3GzUZ+4N/NuhF3sGHVtPLMp7DDZ0AVUVKPw==
X-Received: by 2002:a05:6102:6052:b0:602:8c16:b24c with SMTP id ada2fe7eead31-616f806992emr7568508137.19.1776787182055;
        Tue, 21 Apr 2026 08:59:42 -0700 (PDT)
X-Received: by 2002:a05:6102:6052:b0:602:8c16:b24c with SMTP id ada2fe7eead31-616f806992emr7568495137.19.1776787181651;
        Tue, 21 Apr 2026 08:59:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0bfdsm31472081fa.26.2026.04.21.08.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:59:40 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:59:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>,
        Sebastian Wick <sebastian.wick@redhat.com>,
        Alex Hung <alex.hung@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 16/20] drm/atomic: Drop private obj state allocation
Message-ID: <6fp5keyrgfic7x6rsopxpqdqfrbotkofv3vzni4bstphxwbc4l@5nlu63kpuwas>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-16-c63f1134e76c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-16-c63f1134e76c@kernel.org>
X-Authority-Analysis: v=2.4 cv=bOQm5v+Z c=1 sm=1 tr=0 ts=69e79eef cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P1BnusSwAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CGuZyk7pIeUWItkfYpsA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: t1cDxnCT6TvVgdlFUrHhJAOxdSuf79Vx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfX4VmmWZIBRH4Z
 AAy3EeOyZaauG4czemY3tm/xmxyUVsego662eSJsLPiolH+0ju4tlpcrWeKnevDltrRHt6iN7tN
 BJm/0HtV4wih2cwdBDjRuPPq2xxjMbX6UH8NExanP5FCNCHloGxfbHwnScyLDbLhqwoeM6baJ4y
 rCQDGpam1Krq46Bg63VeFn7TLptxOL8Qk8wQRQKshOVTxI5zC6FLRsFHsUpj9nR+zW6SRBc+BiP
 SVY4QvhotZGgPPFZ9P87T/uWlAa61oaUptxYdP4RFAqzITiqVvyvkPVMIhDXaQRZOF6GGhTPyGz
 8HcebBtQp+vICeTjWn4E1D5oA4Zntln3bkdPnOpk6LtjX9oxiF9vrxSwbik+OhR0+XOF4dOcHpu
 6oOA7TuzTXdKbDvyDugxyYk/A45UHse94RvU5eCK9OWA9bFDqZ44HrQLWlLBquUk67ac/2y8i0V
 9H/lAxwZ9gLzEV0jKFg==
X-Proofpoint-ORIG-GUID: t1cDxnCT6TvVgdlFUrHhJAOxdSuf79Vx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_085943_588117_305F6554 
X-CRM114-Status: GOOD (  16.79  )
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

On Fri, Mar 20, 2026 at 05:27:23PM +0100, Maxime Ripard wrote:
> Now that drm_dev_register() calls drm_mode_config_create_state() for
> every modeset driver, the private obj states will be initialized at
> driver registration automatically if they haven't already.
> 
> Thus, the explicit initial allocation we have in
> drm_atomic_private_obj_init() is now redundant, and we can remove it.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 7 -------
>  1 file changed, 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

