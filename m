Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B08F8FA90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mo2f7WcLf3osCcteJk9O/SCdaTHE9e4ZotSTHgD8zF4=; b=LX6iRb7vhLt/1ELONR512RB9eN
	b9CNZJGCCk55LzOJUAC/0S6kXgRTUQ7WNER7QgF6wGZ/az1l43wUpqld3iTxVPBUWSg4sgOjblf5g
	qVqPPr5Iv6uf4437H6x2hERnyBunqzuetNdlIlnMVg/2WaTgixKK8xVrCT/rjfoWFq3DK8IZofPxy
	f+EmjqXjNXywqdNqOcs1wjvgzA79674ndhag/58ZfbQx1jLZAAF8fL/oJw/JYQlA6ni7qRKene3qM
	tWbhHixxjchYd3/wk9dS0EBhGqTseyABeqoljETrZDeQbz9kev0U03mvYvEBfrfeWWc4hgvJS7osB
	PQhbVCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDMd-00000008quK-11Na;
	Tue, 21 Apr 2026 15:50:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDMa-00000008qtz-1qBf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:50:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LAVIOg1510936
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mo2f7WcLf3osCcteJk9O/SCd
	aTHE9e4ZotSTHgD8zF4=; b=T3JfPtk/F9qTRPbRfkl7o2BZSzyv+JBhAXxS6ttT
	MOSjxvRnI4i77iSapmiJCFDnVsEq0QW/Jtnw0oP+13HCbJQZsbIl4o0nBZ7BM/Ak
	dIm5WQtrFpcHBrWUTfX0DPJz2/3k1CpYkjeUEJsBotxlqW8cHl4C1IzB9EukfqBJ
	WziBCJ4gy7miFoopX+oh4xsVOQF0GNzaP2l4PhxJYGlrDMcyomR8Wgf+5BvOL2B9
	dB4LcWEqOCSN3Mkne/6U/Pgvif/ICIcmjzDdVgPKjCyZVEtz3mctUrd2bbmrhx6Z
	XFkpDlnDUmrRcpSLJdCXg+25TftEYna+RLl4BXLJNiiZyQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp2ak2d5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:50:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5ca8ffe7so40776851cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776786611; x=1777391411; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo2f7WcLf3osCcteJk9O/SCdaTHE9e4ZotSTHgD8zF4=;
        b=BMRK7NnfayN7EGJUz0i6uFYcdFpGTUkVCKKiI20AsvfSt/xW9WxbCAZHyN2Ets9jqn
         5SClvhD0CBa0j2s/8aMIPpocuCDXSl8fOqVL+72r/ju8HyW73EzeSr37jf7nNaqfrIfT
         sBXd4VTHwC42OHRm3g10qt5eFcG0V59OuwNw5pd5r2lauGaPBTkBvUXJR9xo3bGIVgnq
         QlnijNjgSqrQqP9XTXMw2FkFF2Q7T50vRRdeoE2k0OMHqfMpRnzmSuOoAqO4pe+RifTO
         F8qYCKTLKeA67OPmiNtB7oJah/T3L7sZeAY7cCW+UHqehEJ7wh5Ji06WT9hKxM5cfiME
         ntew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776786611; x=1777391411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mo2f7WcLf3osCcteJk9O/SCdaTHE9e4ZotSTHgD8zF4=;
        b=GxOZx9mvjUbHzGFLGDrvU27S0v0stCbXwPiYGzB60Ymr7n6YV2xRh659/cqrrbz3Pi
         M9Q1GGtWcAN3+2w2es344vmQL44/1HS24ar1xeJeXw6jMdMb4asFvbdUVpEFV5u4XGfA
         3pNxdlVXeB65Nc5ZNvFvJHeXXPZWYI6iCrjYrEbqcAIiFEKYmLNnB6I/XxIUpWC/5WLf
         CfV9FkqDTp05AekHQ5YAQC6FjbB7EUur7y1x5cAnuaWDgqFPhNBHtU+/1qJGXWr2acMD
         LuFWBEm2qtkFU8jXH4F35om6AzWKJ6/heq4MSmK3YRVr9nNmHOv/zT3I66G+AR5T4zbG
         f0IQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Z95blEEI1wkLrKjfbqLDTOxP+g76nLpGWNo51g5gRIXucTY83hChekt376Vv3qptkU4bXu4lNcfO0fHlClXSm@lists.infradead.org
X-Gm-Message-State: AOJu0YzCSoMIqrpCIsAHwUv9DZoHOZty8beEkqd4faBHPDjnKY2qgZXm
	BNz+k8VNRvXa893ruVDe+nqW++BCp89E1bPhOSFKJ1UuWXlEnctoH9auM8LkLr4xOHIezkA3NWI
	GaEpDaPEuAm99V2azof9sNYyIVuuZp/dvu651+dfm/yCE+PlR1wZjNjgmVL9uKrkVXQ3BOVbd/+
	lHuA==
X-Gm-Gg: AeBDies27McBMONNnAzKmBCJ2GuFHSuMio3pO4sQkuz1xksToxeZIYNmS5J5bWlyCcu
	iBMiOo60VIFE559ytp0e5xaESkO9UaPA1v0ajZ6y4AtfCjx1U+tmFcslnU0Icerh7z8qxzf19oS
	nu0UuuJ/OdsaJCZdkT3313Mkr7i0kBAdpFxo2co7CjGlCWJ4ciV/eMnZ3xe/DLB4Kv1DhMPNi84
	8ios1hzDoVtutycyMwk2X91w6oP2QrrlZ1Mc27GdyBFh/Vu6NDmI/rpJhcf2ZfaLLA7mopE1QEh
	CqHKTuyBtUkP4sDxfPDr67e+9MUENd9OoXh6xzACaQSCWARYOc/fc4dWtlxmUwz1UvANnery7km
	IHxcb0fysr3eR3obOO4czNcZfH77wC2xH6/ckZ0zBXNfbgnfG5E+eQOwFwc8PsceQyaii5I4ck+
	76C70D8lJMjjo59tP74SfLK4O/uCvV5U+MQe5OwfcvBSqLlQ==
X-Received: by 2002:a05:622a:11d5:b0:50f:b732:202c with SMTP id d75a77b69052e-50fb73225a9mr33343471cf.19.1776786610356;
        Tue, 21 Apr 2026 08:50:10 -0700 (PDT)
X-Received: by 2002:a05:622a:11d5:b0:50f:b732:202c with SMTP id d75a77b69052e-50fb73225a9mr33342531cf.19.1776786609679;
        Tue, 21 Apr 2026 08:50:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm3824506e87.36.2026.04.21.08.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:50:08 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:50:06 +0300
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
Subject: Re: [PATCH v2 12/20] drm/hdmi: Rename
 __drm_atomic_helper_connector_hdmi_reset()
Message-ID: <5me7yklungth6sss5okogfwtr2ed47fwaq3rxnfbhjqgauefis@h2c4kbfk2sqe>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-12-c63f1134e76c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-12-c63f1134e76c@kernel.org>
X-Authority-Analysis: v=2.4 cv=KItqylFo c=1 sm=1 tr=0 ts=69e79cb3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=P1BnusSwAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fOc9-Nj7kuNS0fQUIscA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: HwpUrzyldB6kXIWQMNEolmffsvMbPnIn
X-Proofpoint-ORIG-GUID: HwpUrzyldB6kXIWQMNEolmffsvMbPnIn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NiBTYWx0ZWRfXygLTiepfDrYR
 xLGYXmmwkGDqu+MKKTugDNAsdTliGLXhu2uXBPyYcELNbLUcPzpm97XRnBiyfLPybiZJebUs6N5
 H02+BXLeacy4C3z3OeI8nvYJUDK4nD3ryGkIs5uwyBFmgY0eIPrYrU2AVTWyo0xcl7Ag+z3jvdC
 wqJoZ/EIC771Zo0/ScRPCAMICNKxOri2CCX0TIy1E2gn2wZZo7buKlG+gDdpGlFhtK4uIwd+U2Q
 avspKR/FOiGIfPBNWaj9YM7sSlswJsJMdoCHd4eZaJdiIk4qjdmEbWDmAoWh8EjG7609Q5wN0Tw
 vXu1DEbMYgLBfmUjn9lHRztnVddepycKEkhSp++GsrE97ZZy+odXEKwWLVt5+qf/drLvi167gBh
 eKWKCv4koNFGPvrO4KtsHP6CodKIjr3kalcxGHx0gH5z8AKBdI/C5QCpXWWzvsYOM3vaANzgQ/D
 t7dhbuT4RRwNVllbfjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_085012_595201_F0528AB9 
X-CRM114-Status: GOOD (  19.78  )
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

On Fri, Mar 20, 2026 at 05:27:19PM +0100, Maxime Ripard wrote:
> __drm_atomic_helper_connector_hdmi_reset() is typically used to
> initialize a newly allocated drm_connector_state when the connector is
> using the HDMI helpers, and is being called by the
> drm_connector_funcs.reset implementation.
> 
> Since we want to consolidate DRM objects state allocation around the
> atomic_create_state callback that will only allocate and initialize a
> new drm_connector_state instance, we will need to call
> __drm_atomic_helper_connector_hdmi_reset() from both the reset and
> atomic_create hooks.
> 
> To avoid any confusion, we can thus rename
> __drm_atomic_helper_connector_hdmi_reset() to
> __drm_atomic_helper_connector_hdmi_state_init().
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c     |  4 ++--
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 14 ++++++++------
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  2 +-
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  2 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  2 +-
>  include/drm/display/drm_hdmi_state_helper.h        |  4 ++--
>  6 files changed, 15 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

