Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9636F8FA99
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 16:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laMpQ/PEThA++8VKoCP5uoEGKvqMhipe1NJOiXj6OFA=; b=aZEJDm2SMNrAMhkYD7TF2jLH4G
	KgaLxykDiCqLIvmU+heZ/FgKRoMaRqxfYZfoPJrj4tRFp/bwUlx0sgTXVgmqq7HduPxoa0sj2ylJO
	0SytaGMrY/UOOq0OwxIAx7nArjas+5R7rFlBcnpDu+N6i8QNxpvOJuzI1TRcmpWuS0wbj2xNmtWr8
	NKKAJcR5bZMzSL4xx0PpbBJNrBZE6lrjoq8dp/VLCI0QTe2wea4Ww1mtCa+Kh/WI+TgNOi21AnTMf
	i2DJFwGRk4T9toA/rD6vQ4dNHDAFOr+Wd6iaTqI49+ExBK+QhdNzWXL2o1YZwxtTBfiCasszblPgB
	8MK3GRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDYD-00000008srk-0hnt;
	Tue, 21 Apr 2026 16:02:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDYB-00000008sqf-03LZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 16:02:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA3On31085680
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 16:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=laMpQ/PEThA++8VKoCP5uoEG
	KvqMhipe1NJOiXj6OFA=; b=DoC4TJD1tox6cQCMrbUYn1E6UWT7nQKw64cl8O7+
	NPINHQmS86XXE01DFnSK+4Iq8z/cJ9md0LTLnXSvwDY99fNJEnGBBEtU2hXt8Tns
	X/oZu1q8unPKTYt/aULiBdGGz4oxZot83flyQIozJYQI7cHemjuH9wj7Nid6f/Ul
	8YZSwK+xIBYxPGW368kAHIHy3ICmMhIMt4BK9nnyTlys1W/VZdyVlJkg4HrkGdVW
	z/CGvbjYIFmHKcpRDrDGBTGKC+OKGu+5hx+6iAc8n9bZY8VbLIYiyeQRd+HhqlTi
	y+Afw1j0QBfYxjVU8jsbrX3BtzHQ4NhIhObbJwTXckxD3w==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp75a96nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 16:02:09 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-467e8ec004dso5763766b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 09:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787329; x=1777392129; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=laMpQ/PEThA++8VKoCP5uoEGKvqMhipe1NJOiXj6OFA=;
        b=Fo1/ty8vsT1v+IVtdJ2iNte/nYZLaV+bSjpWjM0ugtRAZIgqQ5/9awIJItGS4pJtt8
         qPcQCUkwWEnvGSGTFxnGp647NYSCtoXSUEWCtDEtSKfreHe0lvv75LSneeg1NyfB3Jb8
         VS20AZusOconUWKJIbA/WCh0olm1RjjDgTFyjJJ/r/3zHn6CivudjtAYpJwjxJkKRX0M
         ofG7tZw6Gk8qm3PfKTVcVS9E5wLo/3p9lQYz72NfQsXYFUB++u9PIhDj65+Nhhlq+2jt
         bJeMMQlidNsiYdEDiTuBeqxHTWbzYetvSltA4Dj6t1zdjsTMU1W+Rw0PBDdlKY1QFSz3
         xRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787329; x=1777392129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laMpQ/PEThA++8VKoCP5uoEGKvqMhipe1NJOiXj6OFA=;
        b=ohA8pb9Q6T47ikIfzRLgcDwyDr+SFLuZ+jDYLeQAiZkibKfrFuXIaUFeDPQZc4U6Dh
         Y2utVEjAUUhjAlG1gxy4F0rLGpuBnzAkhO2XIzLRs5UDcLthZS5sW2rLcDP38re4Q6ix
         A9z2sXiwFj67l89qp3ZHvp+Dg29YbI2aDgMKYHMFkRYMfGMsPsL/tNuBJb8BKUxY2qIs
         sHO0WSQ3kG2kxHLLRTxLCEzW9dhNROrCRGkA0XsQ2rOx4qGiRosAwaNPydYF5TCvZh0I
         lKb/ikQb60+fROu7XaA0cDcOc97kuxUuUoYiVxtusvd5UeS7Z3jUumuzKzmeHg6NpEMm
         fthA==
X-Forwarded-Encrypted: i=1; AFNElJ8XkpM5xmIWI98kQ4509zlRdbVxVHkf4FLe43qjqI599bn47tVFkogeoLmwjHKhMW5Svltfm8riCe1DSgIgpCNb@lists.infradead.org
X-Gm-Message-State: AOJu0YykOKU4WcP+PMD30tCnULn8ST7SKjZbJls3RQX6eWPA6haj24Zj
	MWYGjELfiLV6GHhCq5Tiz0Vm28VxLmdrjID45ZrWgZa6APw6eWMsRIjVYQRTXb/IRk5TuMsHx9I
	RkBvSa17f/GQ5j9XRr1f5PTwO5ruKCIHxk4IF9QfKtmcEoBW1JCsCoGE4KfBGNWuX4kII3vgrJs
	n0xw==
X-Gm-Gg: AeBDiet5nTHjM7Yxfcb5orcRRShYmYdeIBwWPnUdREVkbyq5i8C5yUSbsF8wxRNt3iG
	zuKHqcX3Xf1p/5EkeNWXfIOdKSECxt5LASJxLE80zQG1L/nbkAdFSyddS//Bj5SkogODuME+UAc
	7ifA7ENLmhNwc0THP2PM45NDboTQ4u/NGICoNBzTqEk9IiIPsiOZgVEtKNHvSoZma2zua5Cpp7M
	G6UAyodbk96cHBwOyvLzKrar6BXP0xEB64XeE+wbkVbNlJCMpPEFalbPjzYmiU9d8a+toVwwXGN
	h5nrnxZNDqmGmmQPAZOWrGIBuU5XBFJBANUCfeuDJtY6zmjIxZAVnYplSpX80Sz4pjqHXQYl+i6
	gWs9q3gXoLHLm2D/jApxfS8Z3zU+QcqczRlavBjEeK1XoRTB86PaJYzWIit9dj7F84ZTusnu216
	xuhHct2i1HH9J+SXUS6l1qQIWV7Sz0qgqQiwiA5iDC+6VxdA==
X-Received: by 2002:a05:6808:4f1e:b0:467:1941:1f18 with SMTP id 5614622812f47-4799c951609mr10816748b6e.14.1776787329132;
        Tue, 21 Apr 2026 09:02:09 -0700 (PDT)
X-Received: by 2002:a05:6808:4f1e:b0:467:1941:1f18 with SMTP id 5614622812f47-4799c951609mr10816664b6e.14.1776787328396;
        Tue, 21 Apr 2026 09:02:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm31882641fa.41.2026.04.21.09.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 09:02:07 -0700 (PDT)
Date: Tue, 21 Apr 2026 19:02:05 +0300
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
Subject: Re: [PATCH v2 14/20] drm/mode-config: Create
 drm_mode_config_create_state()
Message-ID: <uzfggjuv3yfegfnzjd4jm5losp6zxtxzrhtbncappzekyrcdzs@7awi7qw4kchv>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-14-c63f1134e76c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-14-c63f1134e76c@kernel.org>
X-Proofpoint-ORIG-GUID: hBiqfneAZPvCrRAQiokInZK3_GCVNsac
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=69e79f81 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-GMv20tOWX2ILgXXLssA:9 a=CjuIK1q_8ugA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: hBiqfneAZPvCrRAQiokInZK3_GCVNsac
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1OSBTYWx0ZWRfX9iNkrAGyVFkz
 D3PT+DHMIuzHPRN2C0Gdjy+TjZG2Ul9UBYnSAguzd+ocA190KvlYxd3BQfQNZdkT59bSKEIshEt
 cuCp69F0xtyTrKN8pZ5JSV2+AGP2L6M/NXNRj6goEvrMhlZgOKwgWshfjOvwuc1UzC4or/xTJ2X
 iJtXZXk0+pV1Yjbv7fpy4K7sezjEGartZUkt1l6d/RoMOQpN9J35Lq77TQfKPkv1jXR3K6cCn/S
 RcyIAztIZE9D2Zl42hJZood9GjalNCj9F3VghIp7O66v166ahBLgL8o8mrx05iU1Jg3lORxXyCD
 n9dA0MQLKaGpnzQV+nxoIDxm9h/4B1D4Q85E4axuGM+vJk8KZWcF8JaTsUAs4U/VDXlTfEZPuPv
 odcmPfa0QTiqwZfR+KEz3LopeoSsTftETwAXG06Vz9Y2lu+UTt5amdKGnYraM3aLOfVzzG5E48X
 diz7vtzrBHyrh6pY6GQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_090211_165201_A31B32D3 
X-CRM114-Status: GOOD (  25.11  )
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

On Fri, Mar 20, 2026 at 05:27:21PM +0100, Maxime Ripard wrote:
> drm_mode_config_reset() can be used to create the initial state, but
> also to return to the initial state, when doing a suspend/resume cycle
> for example.
> 
> It also affects both the software and the hardware, and drivers can
> choose to reset the hardware as well. Most will just create an empty
> state and the synchronisation between hardware and software states will
> effectively be done when the first commit is done.
> 
> That dual role can be harmful, since some objects do need to be
> initialized but also need to be preserved across a suspend/resume cycle.
> drm_private_obj are such objects for example.
> 
> Thus, let's create another helper for drivers to call to initialize
> their state when the driver is loaded, so we can make
> drm_mode_config_reset() only about handling suspend/resume and similar.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c      | 12 +++++-
>  drivers/gpu/drm/drm_mode_config.c | 87 +++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_mode_config.h     |  1 +
>  3 files changed, 98 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

