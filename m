Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08E4FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 11:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGyE7KsIgE1iCIP7BFttRF0tKByHvA43U+zOtPNKwNs=; b=ylqYpwdkUw0xfZINmWq29aSggT
	IYgw8zpcbi+8BFUH9LKzRkt5dkxoJbx1ts96Krkf6Da131NyLyffJ4Ggjisq/a1vE4v47q60+/CBz
	NeKgQxAdvvYstPou+GMbhMmINctav8do8eFZUMV6gfM5pZu4OQQJzgcLtt6rrZLjIQqhxR3h9jOOQ
	8MSnDTYy3lkqsK0eUqeW7huNNwXbhJQI8ycUfbWXI0yJvL+zAgnvZG3Dk2RDLSg1E4AVuSagvf2IC
	0fWqQ7zdYx32H90AiE10JJ5MkYl+1ysislPZkPheJFTWdUXkMOZiGa8uhCJpR6taCg5wbP2o+Vzl5
	zl264rRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGanh-0000000ENHp-0Ee0;
	Sat, 25 Apr 2026 11:03:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGanc-0000000ENGq-0H0s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 11:03:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P4llEs3843650
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 11:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NGyE7KsIgE1iCIP7BFttRF0t
	KByHvA43U+zOtPNKwNs=; b=buxnuiWLQj2/Up9fdROOm92md/+ciO6Vm5XkOt00
	bBiFLPIEta5evStIw1TWwS3cQox2DW8qE1rvDaOJ3G5rbEO+CPyV9uW/NqCy3rq2
	NxW6VyEUFmaZntlnlgL3G2iCEkfn8ynKqlQrPc4ut8FZQy7JPr+mckAf/BtohmQK
	G2MUjUwP5Ob1v2vgrr0AdKirLo0DrUu+SZsN/DI0JU7GX7k+FCrTY4JilBMmT4eo
	Nq/Wwav4JPuYvldw418/mpwjLsTyVhP3HP9LnjuLnD4kLtAyGyCb0x+PYbZkpakR
	2jPJXqZnLBhAWmJiGZ9wcieiQKA/SNG/XbjdMeRT6MtCHA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw98m86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 11:03:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50edf01172bso158740031cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 04:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777115026; x=1777719826; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NGyE7KsIgE1iCIP7BFttRF0tKByHvA43U+zOtPNKwNs=;
        b=ND//MgLsawdF2QgAHWKkSN35o6BhqJAZ3c/oPs2Ad8KWbkvagRO5k9hJ5c21BdyFcL
         qWxW2z572FTrOw90hPi+Z+onb8eIM+gHO9BW64mIhSJpqCR3O6Q9vZSRnGbFOZUU9PW2
         AiiZkXoVxeV3+G+kT5GQmJxtphJpJHc0dupbrqs+W7tExO87JFylLoFG3wv6c+wer+mi
         oyLievQECgCyQAZgDE2HwrSNoRawfwFVdZnUOAmxkU6O3UIbC/kjycqWk2H3JGlPn7I2
         zXGuojCfCphnKJ2hvmsASVekQTXV+tIDtE2wn+6RSPwbw7ApKLTFdO4iwEmykXhw3H01
         1dUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777115026; x=1777719826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGyE7KsIgE1iCIP7BFttRF0tKByHvA43U+zOtPNKwNs=;
        b=RR/htYJcw8c9GxHvztBXT8w9Sl3CAhV2zcPvRJgbqczERK70Pv+tVp7lEaREJtX5u4
         OGWJ8GKIn6UoRWOsuyUZxlghTW8mKtn6D99hZvWjfHhfSCrtbF5liuJckftoLGmqORv9
         IBWWd2afQZlBzgkHsW8CKLNSxWIehr6P8bqDFl9WV1Dfg7X084VTEGY4gM/mGvl9rMeF
         ommfr44xkpO9+By24QDHYd3yvtaLWe4c8gTbnOTubJUaT5OU7VgsSSZyqBKO5tqk2Mp8
         gmIabksPceCh5Pfe8aLU6J/cwoc8FftFyKcXW7acN1ikJ4IBRHOOLlAVt60FrY3BVtx3
         Og/w==
X-Forwarded-Encrypted: i=1; AFNElJ+IKaZnh+AjJTxtqONqR9mLyZ0K/Hl0/v43mOVNDo+YIDBFqGqrWOgE0m1nvVQd6fCdGTBhqUDhyJ7Wy1amaexO@lists.infradead.org
X-Gm-Message-State: AOJu0YzzpTWGvtPZFRUGtyEHEck0AXnuSmLf9Vd/JYGtNJ0xH99vtxUa
	KYiaIOn4xxTitJ+j3esrBA7T9nhLiF+Z9wvBc0qIRksvjrAABNqiQ8sHC7T977SAwSUoXYN5TKj
	FJw79HmHIC3Sip1WEfM3lyRyBs3nUS0oqsb6wVHeY5/CGTUm/nBCGQrpmhGMf8JLNUm1W3wz16I
	hkuw==
X-Gm-Gg: AeBDieu3CSN/JH9AkvrR7IdnXxIvFqchvkDJdkx6rENWeiU3g0bGe3JZdP5GU6ELhyt
	+37TS4OsKXBjhq07jOy604gBVPZwS1viKe92gea50wvN4zto7J/2HPYFZpnm8GXCVMN5gWARoPN
	FW1MVylBf6RMEHthKV7bkfbcH4H5pZPVBawF6AzQv/6cZOPItvirDi3a6wVwjz7tiMPFAD8L1uU
	325UDLBun252RhWPjNspBEEFL1h7ooVpcvlI3zsXClvzTpu/+eD1FdUbFCrAuw9UXngqoqp8lsQ
	5G8syuSCbfebco+rzLq+FxJkW2U+oru+Kt43vrr6tpng4Sy0Kv7bR04tgMvPGq8e2mrLLM8ZsBB
	HWSjduVbfPToZ7VEHRh9udaVz6xr2QF0e71zzO2nJYSJ0uUfvgciO1LbjZCjSM+7wk9eZksq7fF
	YPsU1y1She4i288zhN5TG+40jHKui1fKYik0IX9HaG0ETdZQ==
X-Received: by 2002:ac8:5f4d:0:b0:50f:135e:d68 with SMTP id d75a77b69052e-50f135e1259mr360464751cf.58.1777115026564;
        Sat, 25 Apr 2026 04:03:46 -0700 (PDT)
X-Received: by 2002:ac8:5f4d:0:b0:50f:135e:d68 with SMTP id d75a77b69052e-50f135e1259mr360464161cf.58.1777115026099;
        Sat, 25 Apr 2026 04:03:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a6335ce587sm2078590e87.70.2026.04.25.04.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:03:45 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:03:43 +0300
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
        intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
        wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v14 06/28] drm/bridge: Act on the DRM color format
 property
Message-ID: <e3lpzsodpfemx62ye2rshiq7xnexiihzwxtj5ouqddxip5xnxo@q75ujeicb5p5>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
 <20260423-color-format-v14-6-449a419ccbd4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-color-format-v14-6-449a419ccbd4@collabora.com>
X-Proofpoint-GUID: I9WrWyIfX4mpusBMOujzC7Plrl--RSXi
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ec9f93 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=zO9H7474j3G4b47APuEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDExMCBTYWx0ZWRfX2Hk6POo3/t6s
 /jtoitoJCcAlM0mbeqV3M79jz38LrZGyjvMQzU4nWXfWEGYlhplNww+pmlO1r9fhUjJ8dn63nvk
 oBz3hIVRhdiOgaE79HGc3wH1sDk5WGmfiOMN4TIxgO2NZ8W2f3jsfof6oNg3ka2BRKfAjY+ggAe
 DRrXL0oDZbFdYLtFgUCcoTwsQDzMJYpK+19BsAFK2jb2pNf1DiDJv7f/14TUW0touZ7XHDxgxIp
 QK3JlaFFnhKShJjwGOSzMw/iu3MAi4DiZK6x/evPB2uXxJ3FsNgo29Egx/1kW3tucRBbHOfVMLy
 IthEu8LeLkFJg28UmJ2nnQPswk3Cg7RmyNPfWFZiFOtnHBMv/shAMhUh/PqIeafKB4e+Gi9wPYt
 l2/Mh3XlkSZH142XHXLBj5xoHgqY0t+HLwuZ1eC3/lSV4E7WC+RJiZA3rMVhQakMtFbF1bSG1CP
 g1exj2oUZnQF+UiM1pg==
X-Proofpoint-ORIG-GUID: I9WrWyIfX4mpusBMOujzC7Plrl--RSXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_040348_125244_2675A479 
X-CRM114-Status: GOOD (  19.86  )
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

On Thu, Apr 23, 2026 at 09:03:29PM +0200, Nicolas Frattaroli wrote:
> The new DRM color format property allows userspace to request a specific
> color format on a connector. In turn, this fills the connector state's
> color_format member to switch color formats.
> 
> Make drm_bridges consider the color_format set in the connector state
> during the atomic bridge check. Call into the connector function to get
> the connector state's connector color format. For bridge connectors
> including an HDMI bridge, this will make use of whatever the HDMI
> implementation set as output formats, and AUTO will never be part of the
> rejection logic.
> 
> Reject any output bus formats that do not correspond to the requested
> color format. DRM_CONNECTOR_COLOR_FORMAT_AUTO is always accepted as a
> matching color format for a bus format, meaning that non-HDMI bridge
> chains will end up picking the first bus format choice that works, as
> has already been the case previously.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 64 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 

Nice, generic and easily reusable for DP!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

