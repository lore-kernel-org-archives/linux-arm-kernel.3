Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274DAF8FA99
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLFoe4oGDCwTz6b0lGYMIAWTRfszp9f/hXCp89ws9Mk=; b=GKTv/RRcN7IHB7kTxWRxo/Lja1
	Ne7Cl0EeplvEru4uaIkNhoUgzw/AlV+AIDOMdje49rKtIUc8gIqNuMSzvBXBFJU7dCsaPbojlkwT4
	FXMXxQemDOkz6LcGSLMFlC2zzBXHm9U4GWB6cMy8J3JdRGdfsuu1pZ3vmVhC/2zZfMgYnyr778L2n
	NhgrhHuLYB8JC2qXxvkQxuv3gpPMR78FJmpdvdg9ajuRYeoTIm5FOdboHkrNRZ1evpMULV5rPBPhp
	NpI/XPty0xhyTvsIfJLilhDI/yP3zf4Eg60uXmYqvOzOokbnC9jWjCa3syKWomU1LYStQEzG4fFGz
	YpSqkLWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDXD-00000008sle-3Qgb;
	Tue, 21 Apr 2026 16:01:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDXB-00000008slG-2j9P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 16:01:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LFaxPM3335944
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 16:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xLFoe4oGDCwTz6b0lGYMIAWT
	Rfszp9f/hXCp89ws9Mk=; b=BzbnoL2g7OaAxndjxnbTnrQXShsD7Wz96KcjUSvZ
	6Tsi/MRp0ynlWCK3xvISh++rq4+7VR3d4KxiUGp5YwU1KKObEivtapREcPNEd0ML
	9LsVPbRM6PWULYn7gISno1YYB4nIyRkS5zUU6y7Qse/xBRmki1c+KmEc6x/PpNHu
	WpwMDahQ8BWa4r2R1VEQW7r9L5xiz5hClS3Lh8YJZ8Di1Rmn/uUoACo5ot7CLtQ9
	R4G/ylpBTDdx4hMXttsZkARlomwjggP3jXUOzeY0jyJoRb0sK7hxYrVVO9ptY/vN
	TbwIOOBIlm7oYSFE04tdIxEIYSrRnpR5Fs74YVyVMxMbpg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpc1jg2x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 16:01:08 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-42393e9b4aeso4186226fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787268; x=1777392068; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xLFoe4oGDCwTz6b0lGYMIAWTRfszp9f/hXCp89ws9Mk=;
        b=SFOE5gZn3E0GqwkFqC0C3yraVN4Tm2xnErq3o2kVzMbTO6sOaHXfsW1T/AL5s4mMxz
         QFb88v7nSKcYoUENnztESS1T2UDEnWtkDmB6OAsYL3w+aZY8SxWSJ2fI8QrIB3VBdCac
         lYn2tatIEN2Z56bLGP8tVhL5WZQenCXBNoVhaNUswL2FFeOaFNguAXrdtAJQRxe/4Pos
         Eqag1g8XBls2/MHrnDYRGRiINt5CPj2Z3nFZADoJdVEHrAvzHk11haU6ZDOqez45dxXU
         IbQj/IfNbC5z8ct/G8M6LTklkcwiHgkJI1A9+52+6UbeI23cOYynwfcuRv4PtjdkysPj
         tIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787268; x=1777392068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLFoe4oGDCwTz6b0lGYMIAWTRfszp9f/hXCp89ws9Mk=;
        b=eauRpO/18Mz4PCqN6sJew8yNKUCf8O0WYXFTkjgJbmYpnxZzLPlP7LVp57Wf3eG4CY
         KdbmxtIx2E7XEiM+/m1GRq0457B/tX8g715GUt+CN77N/TQxotLiGL9hRfEGEb8Yu20b
         zdP250Xws4cjKUm+kGyy3Ghckx5ESIf59Fw50W5ioUEWA6LVKaPVai1njj8I0eL84f6u
         KEb3Q3Xdb/pNDRJS3/GNmSPnuleudF9cRHzgLhrtIRQSqbTiwGhbbQAmtjaQhQpHW++4
         X3K/DygtX50h5OBDBTp2HoSB0nTsUjl9ScRpZypBRPwfg5UiSOcqM/T0gB7L0L1sunrP
         uYDA==
X-Forwarded-Encrypted: i=1; AFNElJ8ry6wCoMSM4yHIxl6WeAiaJn0jJ0Yb6fW5k8OBWROEK2M9q8SoZuuRB3NR9lN3cAtTjbbgcSDcGJ4tsEaRGf/n@lists.infradead.org
X-Gm-Message-State: AOJu0YzeMHaDCpbxPpKaZJgiH58IPy4DNbA3bNEVMVPb2RQuQM3wHidT
	KAX25EbDHYgGfaqD4Pci8lPfiNB4qK8E0nxaPDktMTbCFCG0iGKg6T0mckBB/Zd6cTVyAxfAvn9
	TciQmmv7WNuBeCAOKSi/JY6H3Bb/gh8IRLm7dXd6IChsicv7TI0rH7QHjNkLG4DU9yTwLwuReSj
	T58g==
X-Gm-Gg: AeBDiet3nVPm5NCR/+dr/vyH9OhO+ML99UjXQEwk+nw5//3fbSchDL4JbwLdn34KlQT
	rQ6TVytM501uKv8sC0D09pWT1M6sfGegr6ZeMBdBGbnK6aWU5rfNJ+n5Hx5JDiX+Tx8EbD5UWU0
	j/EX+pnhsSEfDxyRIRVm35Ycv56CPkc2XY62AiIvicFIOwPClEUs9N2i3HYi0cfP1NBkBDXTplL
	A8we0xyA76rVlqykXmcVWfA/Ou6+tGm04ZVO1W7MpvWHMWU0tlZsaCGsOpV2HwCTX1eUGebhpLf
	9coJgLTgFG8TLZZf2sWuzYT5IuxXcRHmYnfBMtE2oTIhu/STK9rzRL93jzejfh0lo+rdATLbVLm
	6tRHP3wCahRTxkAhadB/TnGUsZr8PJhwUjCjle3G+wvWzoKXMDp2v4WGMCDW0o1wEuU5B8r6FMX
	AlXAwKgv6okMoo+Go7euFfOnBhRvCJyYSkFv2Zh2Fgobu2Rg==
X-Received: by 2002:a05:6808:1394:b0:468:2a6:e32c with SMTP id 5614622812f47-4799c914da6mr10924379b6e.10.1776787267344;
        Tue, 21 Apr 2026 09:01:07 -0700 (PDT)
X-Received: by 2002:a05:6808:1394:b0:468:2a6:e32c with SMTP id 5614622812f47-4799c914da6mr10924279b6e.10.1776787266651;
        Tue, 21 Apr 2026 09:01:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm3806113e87.7.2026.04.21.09.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 09:01:05 -0700 (PDT)
Date: Tue, 21 Apr 2026 19:01:03 +0300
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
Subject: Re: [PATCH v2 10/20] drm/crtc: Add new atomic_create_state callback
Message-ID: <bmw2xqyaam6rr4c25ccxonvd5nglrw4iihiy5naznozcevs67h@ub5ycjvfrxjd>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-10-c63f1134e76c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-10-c63f1134e76c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1OSBTYWx0ZWRfX4u5w8A/5GdxB
 NOBQ11uRIYALVfUE0IJ5cMcbnSysgv3cmuJBrfkpQJJP136j2QJqKK1y+Iyvc2gCPhmDPXs0RYp
 flcax3irUN8hRND5iaRf1UsxZ081lHl/jCATOCbR5/0xh+t0Mu9ax19M65p487BRgvE+y3hkei3
 0rtgPbYyqnYkRWA0R3TNmDZOSkLJVbONNwyk5VdzLE1Cm9Taz09IeW9jmu8WOt/xZlNnuWIy1eV
 0l/HTDNViG4dfdmB3quphnvKRcvYIiMVEGUQBf0h3gdYc4aMb299kdDfnHHfOUprjx62qnuj7jq
 xlWuwB3jdtkhmT0SUN6Xeo4E4+l9NL/42HDyZ21x4X3UjudFmpOM1Ir29a0hBxIOkMmrpD7HaWW
 uvIUVJswOBdzAS1dtHJJeknU2l+Q9CMQPs7lxXYJU+2k/kXb27Mie2P6VYJkCHuOaWhMrOmk4CT
 Faut2bgJ61oExxgTe/w==
X-Proofpoint-GUID: euKRHrQu4ZEqTH9Bq8P_owkVVMRsoZ6p
X-Authority-Analysis: v=2.4 cv=IcG3n2qa c=1 sm=1 tr=0 ts=69e79f44 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sh7rbVFwc6wKdXg0ZAwA:9 a=CjuIK1q_8ugA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: euKRHrQu4ZEqTH9Bq8P_owkVVMRsoZ6p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_090109_826760_67CEAE5A 
X-CRM114-Status: GOOD (  27.03  )
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

On Fri, Mar 20, 2026 at 05:27:17PM +0100, Maxime Ripard wrote:
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
> Let's continue the transition to the new pattern with crtcs.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 47 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c         | 21 +++++++++++++-
>  include/drm/drm_atomic_state_helper.h     |  4 +++
>  include/drm/drm_crtc.h                    | 13 +++++++++
>  4 files changed, 84 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

