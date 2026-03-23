Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F20D58CBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 04:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkOlnsc0EKvOIhkAtLnyw5lmSHO8rtw4V09fAITZLBs=; b=pKo/SlRgvr8UH1Wpz5tFB4ta84
	Xmn/qEF1095lGgLH12EXHLXh+G2nYQVtTNIYyfM67HA87dNgvcgGaRJ+PsBqUN1ZAO+BNGenTRRki
	P335hjeO9EK3caeLQGhM1HpwqPd8yXNzqfb7mmFleDQzPmfA6ivACEfSDswNAi0X4sBNDACVostVD
	k329XvOYAZxCrvQd8cp+X1sXgHz/t+YXOD8zapjrrZjy23oYZXyKCCx3F4RMsZHzAyVBQV6rz7qD/
	iKN1D50HWNe8yvQQqZXU68gbKHkQ5sBLzxr0srPADjL+jhb4Z7RSsE8kkaoh0Gd5HCly4oIHtRoNZ
	L6ao/0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WZW-0000000Fyo0-45f0;
	Mon, 23 Mar 2026 04:07:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WZT-0000000FymQ-2h76
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 04:07:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MJxK6O774541
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FkOlnsc0EKvOIhkAtLnyw5lm
	SHO8rtw4V09fAITZLBs=; b=mkB7ye1ABcjRkiyURKA6wmiG8gu2qAXGJgZYQfvJ
	ys04tLxs4TicdQbJAnSx1QrGvOI/bS2qSouJw9b59PiEeMYFbBx6awIaPGFioOKH
	D9Fm4SNw7zNoaoz8bw5lDksOz0792gDPV4/hn/T+vmnCG0D+bdzNAv6vuNTo3Gfy
	yXK5x0dNxWoEOd+3l/QpN5OURspZ4R4/RJ7PIwIANXfMBzg8WXBs2kgWI5kPb8Cu
	Vgfxb9to87kSFRUIRwSqEE0/abOf7aYutz0S3EmGAEXZcKD/vhcAdUqinQ6hvxZP
	vzfZgAMXEsfq/dl1rJPcbYykgUoGgjt7H6UH3mx6Aq2Trw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9rbp26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:07:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090cc6a7d2so229577371cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 21:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238838; x=1774843638; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FkOlnsc0EKvOIhkAtLnyw5lmSHO8rtw4V09fAITZLBs=;
        b=iNBjJR4Spo7roQX4gggRL+Mz1Tv1QnV+4g1SBr9ecYAxTzlmHOekhKYuiPFkI1eEhg
         9vyza/nzlm1kgDMV0kiGW5b5So1sCOWss5A9VNZHYMCy/TnY0FCs/ddWAzvj5D8ntwyl
         2HM3IQ9wo9j7wmNnK4P7dZFOrRMf0bCKqNTq2THNQhFo8BeR8J39Jy0HMf88buYktg28
         xk8Dz1/c4LLYt+YNhCsNYIe1Ela4Of6p6Ghz/rTvVfnClwEps1Hmaa2O2g4jEJ3mULpd
         n443Qp8yNKCZJJfJne89DrgXZFTBlb0/+4h5ki+0Nxah0u+1qix+b81qd/47+wlvBUr1
         NGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238838; x=1774843638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkOlnsc0EKvOIhkAtLnyw5lmSHO8rtw4V09fAITZLBs=;
        b=FrY0lnixEFkKPbj4Op2JLAIfiI9y32EPPZowueojOmswuEd5kCUJu2BYoSN9TtwBkv
         rk1fsG+4nvKsnwUbVm806cz8HtI3LE4ckOlfsvd5ADEb/KZsauwO7VY5SnL4G6aIjXMU
         j7GJ/4WgY37hjfICS4lC6zyfjvSIDg2qMrObvetTVIVDklrkBqSbrKSHyKaAQvFBFSZS
         EhdiR8FEwQK3RLeUUpJsTDJyl5nr2wo0L1JRW+IywULzuibPIKKh/TAboWbWYxndAUlD
         5HSdhM5+bXy3JRwrXNcUAb+0Fiz5pAsXVenIvYB3qtUgq8UeBFgRxamML1RALrOtJLp4
         eaKg==
X-Forwarded-Encrypted: i=1; AJvYcCUYAbw3xqloMUbLCy/OWzIFKlKNO3uEew7NNmqxQWM9XAcKJS4w71UZ9vpaHj7deX9sTYCFyQolhjJFr+BoehE+@lists.infradead.org
X-Gm-Message-State: AOJu0YynGn5bco7JwyZ520J28TSWkfFxdkaEiaYLKPIKItcA+5XyaISV
	eS2AU4XtV1TNrIX7Zt7Fq4KMcLMm+wLuh3IgZqbZ4CZqVl1skmRxlnuo1CJLCsGiVxrpmvdZqgy
	deldvLquXdDIfCAsSYxN/zdOYyVntWUraIPmPe07aYiojOzHYDYHKzGIAM6maEJfWsjg3Aa2udV
	z9fA==
X-Gm-Gg: ATEYQzwV5EuWAg1WASdu/6KnK015Qlgtw/0U6KDx5fAOu0opUMKrEJw5YdEk7UZvihy
	G5qjE5rp+Hil2SbI6Q8gbpzUsFflURd2zvqhrXX07L3NY6k93oI/CzBwekrZYPt36+tuFiDU0UX
	XNTeN5pPKud563i0m2yIsbFP0cttSHyb91zPQjbsPDgxciNBbn8ByKgEF5Qm2q1rASlnUY3lZqg
	PAO2EqCGgSmRPGWYI8JpsH3a4dvy9HsHJ5JzUWW9mLOZZGGXWfS7U06WdJAp8IBTEwpPUlRL/DF
	akjFR1O6PuLfJ1qo0HN5svjbpIbpm+8htykeIogF870uNPK8qHCz1e7dq8jtr786ly7uuslhlc5
	1kaJt7Y+v6ErRVbpDBSq7gY/URya+00WREHMeyLyOHVUFEJbdXfpij2ze7Jj9ZGeQMxPPF8LOhC
	+4thTsSpXsORGLOAgHcH6GLT4qKjTYD9/pHsk=
X-Received: by 2002:a05:622a:2611:b0:50b:4e65:95dd with SMTP id d75a77b69052e-50b4e6598dcmr84026621cf.62.1774238838059;
        Sun, 22 Mar 2026 21:07:18 -0700 (PDT)
X-Received: by 2002:a05:622a:2611:b0:50b:4e65:95dd with SMTP id d75a77b69052e-50b4e6598dcmr84026151cf.62.1774238837540;
        Sun, 22 Mar 2026 21:07:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9ac2661sm22658351fa.39.2026.03.22.21.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:07:16 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:07:13 +0200
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
Subject: Re: [PATCH v3 01/14] drm/connector: Introduce
 drm_output_color_format enum
Message-ID: <mvur5pb6jjbvssdhvbzoekfy7hq4h5vketlzembwb2l6fgt63i@a5f43tecwecr>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-1-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-1-f3935f6db579@kernel.org>
X-Proofpoint-ORIG-GUID: T9Db8xSbE-_N_rio1zh2mP_0pJtclJU7
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69c0bc77 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Myhj0e63kkGcRKXW9oMA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX4aW7SdEso5eh
 4Hkm1YoG8e7uUY0zdydnyFgTLv+KqBcrwnRHOqDW3s73r90OYxFDWIcGwxe2LKRVYrU7PevNa8z
 yhN6VAkYMFAXdy/f25YJNrgyxY9afpabKnshmf1cxd97jyYpnG9WILEEG+03B+u3TpG9NpKbQKX
 JhbNTLoC2V4tyet6C6wwG8rTExVoMx7fdPYH3Ln5Hm3c89RuDZ/LjlSJ4GbB0C4+K+Nzo3r7koz
 7mV5VbUWHAvbXXsVLhH3/eYE78XFujrf7veNHxDTeklVd5fWnX+jnxEhy+VPtke0WmtwufGPxgq
 OeB/8ivJ8T30QN2kLdqaTBAsaNfO7pC7pelucLel8n0A+T1lHTJbrxAASXX52+r0KPZ7j4Phhxm
 5gTPSpBXaTZCUDpBVSshWZIAG68XeyO7UUebaGeEZWuz4ssHb13VX92tIsMNmPEH20uV77+/5k2
 vLDQlQTdKPv0h9p3fWg==
X-Proofpoint-GUID: T9Db8xSbE-_N_rio1zh2mP_0pJtclJU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210719_680833_D38E73B6 
X-CRM114-Status: GOOD (  20.14  )
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

On Thu, Mar 05, 2026 at 10:04:53AM +0100, Maxime Ripard wrote:
> The EDID parsing code initially introduced the DRM_COLOR_FORMAT_*
> defines to represent the sink capabilities. Since a given sink could
> support multiple formats, it was first defined as a bitmask.
> 
> However, the core and drivers have since leveraged those defines to
> represent both the supported formats but also the current format being
> used.
> 
> Considering the latter case, the more natural, and consistent, thing to
> do would be to create an enum of all the possible formats, and then list
> the supported formats using a bitmask of the individual enum values.
> 
> Let's create a new enum following that pattern, drm_output_color_format,
> while maintaining the DRM_COLOR_FORMAT_* compatibility to make the
> transition easier.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_connector.h | 42 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 34 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

