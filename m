Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAEDF364C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 22:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HMFaKZjpgyXaau/0X9Mxm/wGN/42VWp/aAAASGyGoc=; b=Kb4RF5qKZbcvUSYot6GpGBIM3t
	Gt9eb4AyVZAWZBSJ5lV6SBfHA5NW6CxbRSn1WeNUpr/In7MsmCl4yR3/5CM1bfrUNBdCIXefvBwY6
	QBm9GMmOIf1KJ3UpvTEGy9xobTAL2OPSrcaop9ePO1KDcAiOnXxiNva8J51V5saXJ2FXX4z4m1RKr
	PEV1A4bltB4PN7N3uYAeQhd1wWwAPp6kHNeoAU34sV4eqqDeqZThDIvcredhRWqk3f5jS5JThLV+3
	Q65ig3N1QIUGStUMWOCfcX7daUEr8VUIHjmBksdnxVVJh3CwPQ/5lv5zxTsILFz59DUVDmp7n38GY
	bdYLOUUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxYi-0000000BGcj-0eIt;
	Thu, 09 Apr 2026 22:09:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxYg-0000000BGbJ-0LgL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 22:09:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DbxZ03935245
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 22:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0HMFaKZjpgyXaau/0X9Mxm/w
	GN/42VWp/aAAASGyGoc=; b=kNv/mPHEw/tFjVBnkayEOYmjoDA8xsri9s1Fx5AI
	j1rghVQSftnAm0tVvn+YyX5kR6NxS6O3dSqWEcQ/9lSZ+hrdwdG1+gilPhovXIoD
	gNr0mctsDpiBtOOepvYk2JQV1iPFChb/nlhXUGmm85iCETuMErjbBM/gwSw4nRtJ
	TuhcWuPxw7Wm3KU5go4mRE9Jh4bmK3YUSGd4dmcq9UXo52BVx7jxPFeFAqhdLoqA
	hqNgGZhxbOWpGXFD2ueRY9MHdyKwFe7ReAxa1BSeJFtvdMjnD+rEtIyQTkwTnTcs
	gX/v09P9lvNyi4ZmJgZQgtoEGgqdjnNr002UF6Z1Acb45A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5s9nxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 22:09:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8dacf883e77so277437385a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 15:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775772544; x=1776377344; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HMFaKZjpgyXaau/0X9Mxm/wGN/42VWp/aAAASGyGoc=;
        b=dgT/BtmDwOpaadg36T9vsr4aWIO48cs7HEqdvVF9DmqwzWxJWKjgNzFlLlXyamL6B5
         Ux5ZC5N0baj9Kx5W7eM7TqDZg3Wvss8Y8aNLX5zvm7/iLOirygLcFP3h32ddXpvcPdws
         3XSJnpe60sa7rjQ/bmc6HJssxk39P+mAv+352XdVNILHlBrz+fijXkSnDmCbVDxGJkvB
         Uz05PFgzoPHVUFr+dkceO7Io68LJrggFUXOpLGTd/iPIkkN/QDcokVWpnc0QZgsvNhjG
         hXn2AZr/Gl/PsZRBLaWHMkfXsaDJkjETgqDMkfLgMgTCpdk1DkhEleVsTtJQWSgfjPP0
         hoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775772544; x=1776377344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HMFaKZjpgyXaau/0X9Mxm/wGN/42VWp/aAAASGyGoc=;
        b=qK4hgbLTJV+3HKbG0ZlG+Dy2Hd6pJMg1gkPeexJ3FBfAPxgQ/FbIaOEZ01fVX8JJhQ
         Y1sllm+hnJVlPHExb8oCS08Q+WQGRxgalTObu1WU/xqhlYBrXair3B5hL+/SXkzMd2JW
         1l244gmhAys/HzT2Q/sU5IFFtwfsb55Kl6cLB7DhToYkr5LV+cvda/Qnf9G9JWyM3/9Y
         o/G5ljVmG56lYsZsBY44dltIZprfUCwukodX5L74SXY1lSdiAXVC8bRmGbKQih0ITOEX
         ixlK9J2nPJfkIj7T3C5bCeSk4rHmbnkZtkSIHO/sKQOwoNDrR8BOtt6O1BAG+2s3SjDv
         dSDg==
X-Forwarded-Encrypted: i=1; AJvYcCVUO2o75WTvKnIM/TZXxICEAWCAwQNz0Wx7WLz6tXS12/8yaKRbxkkfQmiH3y+Hn/eZ+BLGRhx9zSqTbgFg3X/v@lists.infradead.org
X-Gm-Message-State: AOJu0YzexNBqfMcrsC+n6qd2xh0PvEPJub4HKeFssHngGfmqiGwn7kGK
	ieJ3ScGtIYOcF+8nAq/rWYjyLsBF6sWf+nibO+S2r+S5oRYdDEqrn05071xk0tIPZkNrJT8SKB3
	XGRiTzFgrKStltr0fUYaQvYBsNclewnx4cIbfsWzAX2ZBUM/usdQYmceTWaBMoFugRwBZHK4+Hv
	iAJQ==
X-Gm-Gg: AeBDies8+2wOFs4iKItQ18JZjJ5UNR/cs0ZhRiSBj4IRmfQoHd5OUK6XX77rX0h4ZYf
	fC9SXf2Fw0D5LO29wxzCswPHNzi/DNIGi1kKvf69QDMUdFZc4C2tpW3AsUJreBo85glOczs+noQ
	MggJFG5KWwJyjIJ/bqaWo+Zs8FHNbxfLhH7Q9fHKOfqXliHKBjHY25A9EqAfyaEw6j1o1//Vis0
	wWzDihR3imWTRZEFzqho6jvCYPnaLIk+OlfHi5b8zhpf0ZvOEe0ziE2ZbU/jY6OEi6GoKDKdTAB
	BYyIrLawrqrq7CTV2HwrmW1LaC88GnaTCgkPLqmXpDVhQK1dL4JxILEcEtPSsUMnSXjbrgejDQB
	MDkYa5Son23Gbk5XR/lID6NccngOo96NiNkJhMenIQ5w3uexa4TKT8LMcnqp0skCvQIeqVOnmHX
	JCdFXKPY3/hpkwPO5OfAT900YR8WL12PmY05s=
X-Received: by 2002:a05:622a:2485:b0:50b:50bf:5bbe with SMTP id d75a77b69052e-50dd5adbf6fmr15604191cf.22.1775772544438;
        Thu, 09 Apr 2026 15:09:04 -0700 (PDT)
X-Received: by 2002:a05:622a:2485:b0:50b:50bf:5bbe with SMTP id d75a77b69052e-50dd5adbf6fmr15603721cf.22.1775772543912;
        Thu, 09 Apr 2026 15:09:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee864a2sm196421e87.2.2026.04.09.15.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 15:09:02 -0700 (PDT)
Date: Fri, 10 Apr 2026 01:09:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v12 05/25] drm/atomic-helper: Add HDMI bridge output bus
 formats helper
Message-ID: <47l6v3hxfnl75heek4o7fmhybafk44ewsrr66sdw55ahjv5oof@sku3nqbhg2tx>
References: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
 <20260409-color-format-v12-5-ce84e1817a27@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-color-format-v12-5-ce84e1817a27@collabora.com>
X-Proofpoint-ORIG-GUID: CU-yzvrdqJNIc-aEHGNLPFSBEamcUDB3
X-Proofpoint-GUID: CU-yzvrdqJNIc-aEHGNLPFSBEamcUDB3
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d82381 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=FnALt_FR2tA_ePdYDbsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDIwNCBTYWx0ZWRfXw3FZ3bdgUeEd
 dg7uMKc6+D58mTbivmyL90Ws++KVCXqE9nwRQoOH2lKIEGTMucDvrjAoz00sb6duxC7DD/czVo9
 C5qIlWHMH/bjmG+hCabxt9wIKS1+PSHb2TxdsvU0hN9LX6s2WDp+NjV6gU7bc0KtUhac0FLaVuX
 Mr129F3zoIn/Q+RQHG/n/VmsrYnPJIVCWoBwMvx8+4RfcRkjbp9YfM8YzK+6Fq6d4KekTN7Df0p
 pKe2wR9PX/Kb/UtUWbowBIaHSGr21KQwAMdHt6//QlCLATndFC5hvbQRwnlexHP6lnLKX1k+vL9
 udVL2I9khzAZ1b+MlgPE8Qadi+L2sK+ga5PzX+ypgECuTSoYmAjHxJHUryOsOH6nIaPcRXaVoZI
 CijRXsFhz7zlMhWyhnfyoNlaMy4J/AV3kLvsKseZTd83Ge0T0PEssGFO21j5TVDrVW/wGGytQfj
 M2QOlDBaRZmhBClDTKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_150906_236380_0D968F05 
X-CRM114-Status: GOOD (  22.99  )
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

On Thu, Apr 09, 2026 at 05:44:55PM +0200, Nicolas Frattaroli wrote:
> The drm_bridge_funcs atomic_get_output_bus_fmts operation should be the
> same for likely every HDMI connector bridge, unless such an HDMI
> connector bridge has some special hardware restrictions that I cannot
> envision yet.
> 
> To avoid code duplication and standardize on a set of media bus formats
> that the HDMI output color formats translate to, add a common helper
> function that implements this operation to the drm bridge helpers.
> 
> The function returns a list of output bus formats based on the HDMI
> bridge's current output bits-per-component, and its bitmask of supported
> color formats.
> 
> To guard against future expansion of DRM_OUTPUT_COLOR_FORMAT outgrowing
> the hweight8 call, add a BUILD_BUG_ON statement where it's used that
> checks for DRM_OUTPUT_COLOR_FORMAT_COUNT. The justification for not
> using hweight32 in all cases is that not all ISAs have a popcount
> instruction, and will benefit from a smaller/faster software
> implementation that doesn't have to operate across all bits.
> 
> The justification for not defining an hweight_color depending on the
> value of DRM_OUTPUT_COLOR_FORMAT_COUNT is that this count enum value is
> only known at compile time, not at preprocessor time.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 81 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_atomic_helper.h     |  7 ++++
>  2 files changed, 88 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

