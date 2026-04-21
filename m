Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545C1F8FA98
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+TpPDtb4A8gF0EfZG351FvSa4dKKMV4oqQnvGwrL7A=; b=iG90ut1i7D54Wf8JAuGhtb/YER
	ovFQhn1aD2FMEUhD2zYD8oyoYqbl5Nr/eIIo7/VeN+o4dd1RM+3WKXgRGXcII15b2iOtXnKABwCax
	8ZhbX2/C5tldMHs0ERhuqe7DQ9Li20hOIGmreCt0x7+auSqg2ove0PPatGRez91lkjmB3SewADadK
	5oSaZK017ykMCJ2oz5U23NehlQDuR+QhrmvMJ0BnX7+JGZe+mXdCjfTh8FoyIblDL2O72W/S1hr5r
	ZQIpKP6J4eRLRg4Z/E+n04N5B4bpf4xS1GHpOiRIag4lMvUH+FknU0Gb1G4X0VZaC58AOGaBKDzfU
	ngtwvg1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDOp-00000008rFS-3VYc;
	Tue, 21 Apr 2026 15:52:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDOm-00000008rEz-3eUT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:52:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LD6xAT3574144
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+TpPDtb4A8gF0EfZG351FvS
	a4dKKMV4oqQnvGwrL7A=; b=FzMpBM445RAAHk5vR+lJe3EuQLfi6pcaUmmL6Xb9
	pkqyCdRuKRhZYAeqdBBJ2p1rB2QhDqfjc4uESrNlx8tLhu9mFxQavV7cIkg86e5E
	jl1qY50x6SO9v9RStaYY3lHz5+nW7bmI7NcFSslRK+7b+S/0C9IUrmJqcZATLUJf
	2A89t2dcihv7AiNmjqqmr/qGXD8xwxUGwSpTeLRoWZi2riO6PFahpYkrbwsFUpRl
	XBQZJyIiY/EUvf9DgVklf9v/P3PRDwS/API4JnlMpTcAHWX8nB71fgG+GogTQYds
	S5CZ8df8UR1qDGBLUvIErjMWyL3xS3pbyYK5gM4Kf7TSbQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465j1p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:52:28 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ad0ada31bso9115711241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 08:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776786747; x=1777391547; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+TpPDtb4A8gF0EfZG351FvSa4dKKMV4oqQnvGwrL7A=;
        b=et06E0BXjgGMsHNkgigpYvimPJ2CAbdQda/RUvjiN4erS45PZ8zeI80PMcpR/Iqlvh
         NrbtrGOzOlZU3Ulgs+VFWTQkeCfI3iTUaPQsJ5QJAx3h0+mdnXrWSwY7LoYC7FrxBUc+
         qkTDyAmnpVsXOf147K/79w+2IE32JVA3te05x5SsEuO//OcRK7a0+19Aq3TMFKZjycgV
         bttwyoADPeGu4F3UL177a0aTxifHcxfXZ6oK5imp4yXgjr88B3+LQUnb7/Os9AzTzXVb
         ZgGq9KOiy5nk4/11Qqo0Wmsbf9V+e2pzZa9pPoAB7/7OMzi7rtsuTwAPcwb305lcLb4u
         XMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776786747; x=1777391547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+TpPDtb4A8gF0EfZG351FvSa4dKKMV4oqQnvGwrL7A=;
        b=SuAD+WYVLXArL+ns9lPQCkBt6s3es7+Zm/0WSL5SDM1hyqWWpmXNXVEX0SMYAVKjU7
         RNgGxSXLKBTkabh3lQkw612YpVMtPpSurKbOKiUqh+42s8VR8WbwEhVJNH18q051T+un
         ttfJ/7bUbjiaxJuNYGDcpOJ0CMLBqnbiiMCulnKQiObVi0TeCyqyHnsuPONjQ45U+ADB
         /TD0dHTTmky02LVoJ8eN5p9xjh+cT4Y7m1zqZPFOSmvCOZ/93BY1v1ANvEaxqywKJ2+j
         eltbx8N9y8jqh4MKrj4TqHQECASrYmvQdKDE8aPQal8KN1K4twpNpH6lRcPk0MshGW5u
         f0JA==
X-Forwarded-Encrypted: i=1; AFNElJ8fzm44sN4ICNMFBsPZTBLlKfqFVhyYjPkR24Kd4cHxfwVTR84BbbfWOosPdfkPYLmUTkau9BsLmckEuIqaPVPh@lists.infradead.org
X-Gm-Message-State: AOJu0YzGOT/uFp8vsL+km11k08uRoqwh7jT9T3ZV4cdrzdSi3458nJK4
	PKHNIeJ0nY/YKXxa5t5r5R0FsSwI7KtpJ1Lj0FQS375puGLro2yRiidddlQAcUTUE18IccyHVVT
	t4l7M2pHiqcQusN2RY2d68xJVC/AOn3BRwHiHcCjlTGy7N6LjhMTjwInF5RFgNcZu/4W+77ctJb
	hilA==
X-Gm-Gg: AeBDietp8XUh+r/GDz2At2hl4Ox4haGcdNO+MB5hXGwCGUjpSs15F4aM+7EdhFczLuo
	ZMJndL95BOvNgh1hAPqBtcFsgEQekSEI2EPjd24hcDQmdn/X0UjTB4UGe0/MUsVoW6+V/b7RKoa
	jm2EiGXHucfqck+m1Xq1rAH0CrWWWAnsx0gzBaeMwT8/Xnf9QMnBzVJlF5RyGcv+8/gt5C4o81T
	IK26hbKLJFcov3h+wtr7/Q5O+2ioKj8UkKlBNGJvELWKAC2BZKz6+04kCnGBqUuK7zSMaq6HAsj
	cCvARIAiKkgZzrJQiO4a+MFWS2OUB5B+5IIRJZFekg13LvYA7U53e2pty4G61S2x2fI0X1dtbEb
	4Ncj+XdNpTWIZvUuRWsyouWOLVRjoyHMN6gW+qjcqmZcy1qln+5h4HystVe4Y4PnPpTjwdLGjQM
	yqHUvnQ9OOTuDkvE79cXuWQEc2wqEJ1Qzh7Kpc/aaBG92Bdw==
X-Received: by 2002:a05:6102:5492:b0:611:959c:86b with SMTP id ada2fe7eead31-616fe259128mr6807900137.16.1776786747171;
        Tue, 21 Apr 2026 08:52:27 -0700 (PDT)
X-Received: by 2002:a05:6102:5492:b0:611:959c:86b with SMTP id ada2fe7eead31-616fe259128mr6807884137.16.1776786746729;
        Tue, 21 Apr 2026 08:52:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f66besm31845671fa.13.2026.04.21.08.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:52:25 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:52:23 +0300
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
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 13/20] drm/connector: Add new atomic_create_state
 callback
Message-ID: <kxp5j2tsermgycxq2wtxsvfml7etawwc7mew523rtkynp2x6oi@trsnzjwlnjto>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-13-c63f1134e76c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-13-c63f1134e76c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfXxhedSYwHLKFx
 oxL/FPmevg+d0UKOAyeH+/5v4Vmo5jqMBfJGHp4kC2BoUkB4Sslgb/4h0lSJfQS1gRe7Zgg1RsW
 RF4GRCAs3oXDus0sVzHozlifQhSA8ObXThOoiwxesgRjoButOOW+lT33yMbmI+xEPqgAN3KUIIY
 yCnGiZgRHJyUI/LxUPcf6rexDa0Eqk/6TCpInjwS01xbQZkgcVeLv/+4Fxd9yBxXmx0myZGkrMW
 iEcLyYLKGn7fMPitIzrtzKafMA2+qsOsMdvl92XeBD/yvyyJDTjc3s9npr+hXw6e/BZuzMsg+J8
 6Dti+IhBdHMhdaVZqXv9OLtx2xxB8dUcSL2vv5TTYjM5gXUto8O/G31o4r2nSdMw/kWp0VpUoJg
 z+9alFdJsebX/Bz2DG/MvAQLXyQF1k53KzwATHk3LKh9jUb0uQJJZMUndexx1MOwA6ZCV5ErNmI
 ycLDS35o+a0ZgacLEwQ==
X-Proofpoint-ORIG-GUID: tPSEBcX5cXOYIVQ0bMx9C0fcoVcBf91M
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e79d3c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sh7rbVFwc6wKdXg0ZAwA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: tPSEBcX5cXOYIVQ0bMx9C0fcoVcBf91M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_085228_914188_81A77E5A 
X-CRM114-Status: GOOD (  27.28  )
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

On Fri, Mar 20, 2026 at 05:27:20PM +0100, Maxime Ripard wrote:
> Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
> to drm_private_obj") introduced a new pattern for allocating drm object
> states.
> 
> Instead of relying on the reset() callback, it created a new
> atomic_create_state hook. This is helpful because reset is a bit
> overloaded: it's used to create the initial software tate, reset it, but
> also reset the hardware.
> 
> It can also be used either at probe time, to create the initial state
> and possibly reset the hardware to an expected default, but also during
> suspend/resume.
> 
> Both these cases come with different expectations too: during the
> initialization, we want to initialize all states, but during
> suspend/resume, drm_private_states for example are expected to be kept
> around.
> 
> And reset() isn't fallible, which makes it harder to handle
> initialization errors properly.
> 
> And this is only really relevant for some drivers, since all the helpers
> for reset only create a new state, and don't touch the hardware at all.
> 
> It was thus decided to create a new hook that would allocate and
> initialize a pristine state without any side effect:
> atomic_create_state to untangle a bit some of it, and to separate the
> initialization with the actual reset one might need during a
> suspend/resume.
> 
> Let's continue the transition to the new pattern with connectors.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 45 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c         | 21 ++++++++++++++-
>  include/drm/drm_atomic_state_helper.h     |  4 +++
>  include/drm/drm_connector.h               | 13 +++++++++
>  4 files changed, 82 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

