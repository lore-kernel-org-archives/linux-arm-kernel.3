Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFE4F8FA97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hto5MsLIcmZUVCfT6iG1LCNfXNnKxNxx4T+khh9MBY0=; b=DrxRHGOcLo8+pa+V14ooRKX/HW
	BAFelzmvr1QBJH8V0A76h8jW5NrthQcKwHj7RtZCa+QzpnVkuY7FLRaKXXQZKnBrQu8yhSP0dgfCk
	08RHhCXCxglJ5WnJ9URW/u11Id15qRXdJFU8dbMi3IjIil07ovL1QI/XRf868+uFBgEC0F+d1M0hC
	szgEM3eff4NZKCYmYMRadeAjKGfAn18zx67Q/jKaFk8D/dr1Rj/Dru5/SIwx0126l9Z0MS0YzKe1T
	QGMJDN1FeUXACVvIncwGOeo/n47ZXyO7yNFLErA7MX0K4HpAuyYxwa3sW+oBMW0UunqohY6UbPwOR
	17HLh5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDMs-00000008qwi-2QpY;
	Tue, 21 Apr 2026 15:50:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDMq-00000008qwC-32Lu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:50:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LFbLCg3337167
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hto5MsLIcmZUVCfT6iG1LCNf
	XNnKxNxx4T+khh9MBY0=; b=oK9RP7f8lu1aYiEjyHk0aEqVOStaTYP8ae8V/J7A
	fzg+ethVOI9SKF2wkvXHoNExyOeQHiKBw03ubwQ0ZkxOuxchLGZaDFZD/6eke1ER
	lWh045Gz8CLO1BgAQernTvNiezf//bRho1r23hw7uvbfJWka/ZD7lTQ/l3Nk+3K5
	fsBJ9vLY6luVvAD3o3j6arPyJnsZmRPdwdM1yA4Bxa88vQleeuL8u+64rbv8TAog
	uyjMUw9MZx7XXEO7S+8paqmukDnwv6a9YWK9iQ13GwdEeWKUjB9WG2TjV/FvCe1T
	jdultxl8/v+ktl/VbRYH0wCB+VxraY7Tog1iwrufH9q4DA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpc1jg1gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:50:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d812c898cso119614201cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 08:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776786627; x=1777391427; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hto5MsLIcmZUVCfT6iG1LCNfXNnKxNxx4T+khh9MBY0=;
        b=HPxkXkeLrRwWypTLwfd6HXukkJHu+bFF3uoHS2sEjBvqI2OApgYGEFLI7A7kYwTlER
         iTm2GuSPhIXQZT/uAsrx20IHtKR+I93aqVxd1Y/2g70cP9RM1ajg30/QcnMWnmu1tuIq
         6iroNzlWPmIhAuskFko0qUtJJEHXSIQ7gn90y5GuKDKcBRyNeT+eT1/sgYj0npRHORhr
         AOR5u7eJSn1vnleC6tl4mcrsFktCES9WGwoHnRGZ6qyrhdnZoTtXrmW87CYzSrlJh79A
         6lcjw2C5WifgyW2rcttndGThLaI0rd/Pm61Qa/EIH+4OjimgONyDp4NCez3Veg3H7kDR
         4ELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776786627; x=1777391427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hto5MsLIcmZUVCfT6iG1LCNfXNnKxNxx4T+khh9MBY0=;
        b=NrczOgk1mh7SR60lra9GQRv1FKLi81r5myL4Bx87GGEmpYN++Rn2vSsmKHA5RvKsam
         +AEb3zyWoj+mRhajQPpWRT0VjTRBqNryanOsPbXxmXRM7XJC2EcqX/4inWLB4AykdCBz
         mFGnqmwTxSkbTdcXoxdWvgtaSp/sxfczGDGmeuhmEBUzPT65o5B5AjDjXsfjvioP1/bp
         LtR5UDW7XWIWNyF9AwOVjs0/eK4KnDNMwyjuE4IIgsgVOkpSVCQQ3ucC/DPz85ANyktZ
         jQuy8XJnKYSFs8b7NlcK+4dKwZq7tEdCUNB1PgbB0VmR/mVEP+JGBruCdazYJworyVel
         klVA==
X-Forwarded-Encrypted: i=1; AFNElJ8lCLi6YVTIz3PO7pcK3e+dx2TjAR9JwdXI4d7ktmffkpu6w7Qtr3clXWWcprjEr4fd3D9cjlL0hw6l/MQBEOZI@lists.infradead.org
X-Gm-Message-State: AOJu0YyV+xkUE4Nih2KpLo83XlP7WbG0Fp8wc0vdTdiPZOc0ZNql7eaG
	M457YLPYco3LOufW3tQq8HoujgPAlLGMv8AMJ5xK3VQJ5/lKYCAlrtXXPUoiK497cItDDbC3KYo
	x/a4/fLa57I9BzIaixGPLrOFdR21ws+HXDemWd1C9FxCBe76uK0olfOq6BeQ7EeMR/NMmqhcsnD
	10jg==
X-Gm-Gg: AeBDiet5X72sQG7qQdOgxZMfWXLEgO844rQ66kbw/fUKgKDokGuRR7bKVxqGpJ5z+o2
	FJsvfJYif0N3CqQdIMDmWt0oXcpYfFJcaJ+DJK2SI2Vb1cG7dwV/42JbG4cdwmi2pWZAGL468/S
	sQfbWouS7Mr3LQ6ryF8ZMsKGvASDa3TAERe8NZ5Xlf+ghH5YEUeSpBDPaVityJtek3AkIuzrEeb
	BGD3bGKhvO1oGXhcnoAttx0Kz+xNNXCTeZXNa9CRs+V/OQU13+mvwPolZi85XBa6bB73DLUBNDj
	X6dMaQKI+XaR2P6XYNCOmRbtFM5w4ay5VAsBLtJHGDUSYdUBoIVkwNyiBHTDTBvcGxy+9pzjxg0
	ZoZHhhcm+ca6AJYHVDUWzzAo+1pS0KITwBZjHvo7VGU4wOcPmTLWQO6wjl/xtWlBKifYvBmW36I
	j7wTMKHBXuwvSab4KJdRIkkB8k07P8jQDYLElkb1ut6mh8Vw==
X-Received: by 2002:a05:622a:5c1b:b0:50d:a71d:810d with SMTP id d75a77b69052e-50e36e9c5bdmr268930151cf.28.1776786627076;
        Tue, 21 Apr 2026 08:50:27 -0700 (PDT)
X-Received: by 2002:a05:622a:5c1b:b0:50d:a71d:810d with SMTP id d75a77b69052e-50e36e9c5bdmr268929381cf.28.1776786626578;
        Tue, 21 Apr 2026 08:50:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad11fsm3739915e87.14.2026.04.21.08.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:50:25 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:50:23 +0300
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
Subject: Re: [PATCH v2 11/20] drm/atomic-state-helper: Rename
 __drm_atomic_helper_connector_state_reset()
Message-ID: <ogjitbayzgefsouxgwhjia4vzmmpfagupddmmoxokvdscjouqo@dyaz5v7c4lyh>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-11-c63f1134e76c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-11-c63f1134e76c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfX0rVu/HWVMR+p
 azN+YItgoNalQiNerkqfaQNPxez4SVDd0cMrNv51PS5ZmgyEPNVAWdZGAtCk18UNvkUcFboRAi4
 N0N/iKABaGqhPl1HO+g1hi4NM7tTzAh7Wz5D0x/XFPn7umQ3ptWo5n0nzNeR61BpfQhWJdOqC1z
 qAG3burDUV8+caDNpu7ENYr2L9cQTsjcFk9A/5CUoXWwIeeR7jv/pDyJaeR8dr007jRUzqmK9lL
 gWJPxhD6Qw37lhlCaXa9H8R/LbQnfcB1RDWsRiYM5zXkIxgux8ozs7w++bvWWsNT+IPIeWkBUpj
 +4+fOESgqTbNLwevDdHsjLNJaZOtFiAgJZPPUyiTJIwXME/nwzmySWpVTGHE+zEBdXyCqitBXb/
 QQwiSc16XqHzJemF9V/YD0zcl6GUmy3j244RBZ0q8bAm0UekMXdKXzoSAYBOt3XwQIsHPCG5pLP
 wKQ7LLEEEbGM/JfqItg==
X-Proofpoint-GUID: GzhwSxxStTx7YYtNJBA45vZVqX00IRnC
X-Authority-Analysis: v=2.4 cv=IcG3n2qa c=1 sm=1 tr=0 ts=69e79cc3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=P1BnusSwAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fOc9-Nj7kuNS0fQUIscA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: GzhwSxxStTx7YYtNJBA45vZVqX00IRnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_085028_882718_3B21A4EC 
X-CRM114-Status: GOOD (  19.97  )
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

On Fri, Mar 20, 2026 at 05:27:18PM +0100, Maxime Ripard wrote:
> __drm_atomic_helper_connector_state_reset() is used to initialize a
> newly allocated drm_connector_state, and is being typically called by
> the drm_connector_funcs.reset implementation.
> 
> Since we want to consolidate DRM objects state allocation around the
> atomic_create_state callback that will only allocate and initialize a
> new drm_connector_state instance, we will need to call
> __drm_atomic_helper_connector_state_reset() from both the reset and
> atomic_create hooks.
> 
> To avoid any confusion, we can thus rename
> __drm_atomic_helper_connector_state_reset() to
> __drm_atomic_helper_connector_state_init().
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 10 +++++-----
>  include/drm/drm_atomic_state_helper.h     |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

