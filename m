Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADDCD58CD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 04:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqeC/roitS7lz4atrPMGBHkGfv3MPIQwtd12I+kF8Sw=; b=Cenv3A2Te/151pC9TG4m4FlH4X
	1ixc57E3NOHm9o/EHBxiIf3mLTpcxT01Ck5b8yOa6hfBqe54NomNJ/5Aa/eshJ2vGPIFshpnhEUXI
	NgYQCuwTELlsuFHWXmv/wlbZaaqDqFNzgKbQFpc1eUP+44aEZILPXm2rRoKSTabQiwKWnTP4Sb3gB
	IhNW9acmqADsU0EsUOsg6AXfX5xlSYNP4tn30ELuRpttL5F4Y74c/h+G3YZyVhWqagz+apap9TUCL
	+Jfy47G+pzI8zn769bXZkNj+sFH8VaT+4iuDwbqnURXcQpvY+6y91HeDnXKT64xT0pDTfQ/fiCmZ5
	cdOXvjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WaS-0000000FzGp-1Lcq;
	Mon, 23 Mar 2026 04:08:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WaJ-0000000FzBf-1Vfr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 04:08:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ML1pvl900480
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AqeC/roitS7lz4atrPMGBHkG
	fv3MPIQwtd12I+kF8Sw=; b=d1R5o6ScrRpvUSm5twz1BpFPnyTr0nJI+3j9WZjW
	hauYc6RhhGiqd+eNOVlzr7CAZVGa7x8+3pn0dZP+a22f64h1IVM2t7WminprqPl7
	RHOpEQS3XEmmJiZ4Z2+lqufwyhESST5agXuk8EfBE00yytBbnZnQ6k0u09eo/Ic9
	3qVS96LHmLZFbHfSXr5GM6ssgvlgL8Ayw17+6O2sg2GqQN7jVjhYjs8S3NwJYO8h
	BvmS48hH80OR5xzCb7XjLCdOEZUQQgCGVIYKKrTpOREmP2onis8Dz3+/TUkzNarq
	szGpXPPh1RkCsb+Y0Z9k+UKIRga00lpmIy9X+lEYgm0crQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9rbp53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:08:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b323c43fdso25008441cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 21:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238890; x=1774843690; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AqeC/roitS7lz4atrPMGBHkGfv3MPIQwtd12I+kF8Sw=;
        b=AqHR8VWL1Wq44CC3dLNSMk/DxS9tkPtl8xXj3pd8pjcMGo44Sk3APLmBxwn6uWnhPH
         xZOydwVIECXvxsWxLQf+slNEr1DsJ16u7fHFEYFRlbCTGBIRFMg2AWPjX6amCIpzLPmm
         Pq7NXYotavFF5yLfWjLWY/xPhquQHNqxMYEAGEgIfGNhJTrtjB9TK9WzZe/ayYbZp2G5
         N5p74PnC2fOLnl//68bjU3ZklbN0Vt+sfYk/CO0frzILnglt3HQg6Zo4hm51k8HOwUlL
         LhQdig9tg0sK5hDFuHAYAURNgVaA2MnJWWpZGdGtwNpGRZvw7F7Qz29twoatxyHcgRQU
         NAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238890; x=1774843690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqeC/roitS7lz4atrPMGBHkGfv3MPIQwtd12I+kF8Sw=;
        b=ajrTDdCCTbTGi7qQMZnroUqgIwYrrpE+oxBhoAdM0r8sJ/FATYT/bjEJMZqGs67VO9
         PzEPEPngYshlGkUm6V4U/NyJ500auxH+US4vHVIXD//kG4B4LNmxEYRPcqluL5paJTaW
         K7+HMTkxDgrHCjEyOASu5mLnUs2xNP6YsAbKOh/Lnxr5MabSdwdQY1yTkZYVwzcqrgWu
         PooD1TLj2oZUx7Hq+FyoIBpxHP397t2ZTkWGoAR4SAs8yP5eH/pX2xSjTzvMlZ4By4Et
         mP45gxqItOTktqJ0m6VAkPdatN2UHSbURDGSDTsXtKO9HQNqFlqPVTp08V+BAlENZK65
         xRpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCXxCTkk0FsUCl9YPmf/e7Y003kKfdqSS7UtsTTYtdWEHWHoyTNxXm8dVpAp4huezNFf7Jf+WpenMUMMdGnEEg@lists.infradead.org
X-Gm-Message-State: AOJu0YyFuJQFsi+Zt3G/zQhVXyzAYNYDf0PjBV6vvg1FcjYTIWZMrdUK
	Y/92wUfi0+qEkYi/W/6wj1XC2lUWl/iEGx2WZTmBIJjiYWaoxmKAWLOqgQule2K+YMGlwj4hMuc
	I/U/EYg0lss38/hYkD+m3Zuw1D0SK0qWsp1Ic4y0q7R8bdLzd5ch+VrxB7M6vCoAbhGdQb9lRK3
	0m3A==
X-Gm-Gg: ATEYQzxNVSg2tyZMduVAuZZdPiTYrljW/O+AQ+zXsdGBIeTR1Y7UVd6qNYDWwQ+hj6Z
	l4E1AWHEwt3OgoBu0vJuA+gGWeXx7P8PdQt7zuzll/6RV8m8fQdjuqen00rn32HgEV2eAEihlOl
	Y2J2ssd5GGqxkjPLYoAh73iarxnesxwz4S1yfjJDs9B6NC1ySzBB4S+qOQf/M6m5z6NdmHcSp0y
	hKTwDEWmLoIll4uQtweim8Ioj2Qx0UuSvTpcQ7CzLdt2fax3t1XRqJpHzPNedjqJLsL9TqcCcG8
	cfU3WXWZRX+TyuHTffx+WXQkXf1GGdOmBcMQXmJwYMSzLsg1Xanth1XSBCpoQnl8kSbs5b5UU+t
	DAeX4JZKYV6MlrDh7wAca5hwtDxfIijUfp8LyAXUnU6KR/kzMlD8Nin0GCPMC7dfOF3R9VLJ+lB
	Jm1ZZrG5SKTiJVVrgZDbjzRjiMnRlFLzsTjqs=
X-Received: by 2002:ac8:7fc4:0:b0:509:2ef7:7034 with SMTP id d75a77b69052e-50b37538e75mr168613531cf.50.1774238889732;
        Sun, 22 Mar 2026 21:08:09 -0700 (PDT)
X-Received: by 2002:ac8:7fc4:0:b0:509:2ef7:7034 with SMTP id d75a77b69052e-50b37538e75mr168613281cf.50.1774238889243;
        Sun, 22 Mar 2026 21:08:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820ebsm21316001fa.20.2026.03.22.21.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:08:07 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:08:04 +0200
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
Subject: Re: [PATCH v3 06/14] drm/bridge: analogix: Convert to
 drm_output_color_format
Message-ID: <rf7nfbpyc7ce2t4c23melurn226egzqfhk35wt7q7yaurkgeeg@yu4qhmtblpit>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-6-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-6-f3935f6db579@kernel.org>
X-Proofpoint-ORIG-GUID: Mtax2olWVCla0i-RDuykgA-uzCBlhCWY
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69c0bcaa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O2P03feSXV0Fh_yUmGcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX4LNl+JbHO33v
 bVozu53A0heCggLw2V6Yi/TWpKFoXMuuoRAkVY84VhgZiGjhj6pmyUprU8ok0nclTbcpiLmOZzl
 eVtBzD+TZaDoscWABNKCJrv8WxZgUaA1PYDfpTsRAqsh3f4c0zohpvotcf6o1QUfwbxhrra5dX3
 I0gShraaNUL4sFn1OITx2o83EnFkpXfnIBPl/Vf9kV8NLNHA8dZYjGKAs37P5yq9u6jCy3jND2k
 nQ8oXCb2lo530tE5zOf77F7tHj8QCqnj/ZCjDqzLOH1IViSxDcsjcTHgZ0jWqTNqpAkabm0T+wa
 1oEhbAG2xaVe5DKqRtmWhWrqcp0fgJ9HHZjfAMsPLjDM9L0HaR+wBhKSQn1xknEkUEu6Rlg0T8o
 DV7Y+13k169gdn4slGY4x6rQTleWV90W3enw0cI2VtflFkfxzT/0TtUPN0389NSCdPKWtSuueGf
 PehpDlNQWY75etjgVlg==
X-Proofpoint-GUID: Mtax2olWVCla0i-RDuykgA-uzCBlhCWY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210811_437461_49E2270A 
X-CRM114-Status: GOOD (  22.19  )
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

On Thu, Mar 05, 2026 at 10:04:58AM +0100, Maxime Ripard wrote:
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
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

