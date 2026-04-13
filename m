Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18389F34C5E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 14:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00DJSzTx4OYnNszTMCzO4Ng7MXEjLPxiBpeE0uNJD6k=; b=vuH3PhuPRcr38kpgOHIdCsMCGw
	7Bwo/RnHJg9dlBsYGDnybTmMTs2mfeEdEGIYafat3utc+CBKHnJp/WqLsAz4aawtNcIw0v29em4Fi
	QnldcdYCddhWo7efTAzeBVJK676cyp3b5wM0oAjbUu17TmI6DUAwBZRXbFnjhl71Mf6+GQGOGDR3J
	c/HTadpmvePt1nt3p7vOBKi6H6QTZr9SDGCcCKr8Uf3Xa0W9WVQUivr0AUuCY0g40H7gLJ7Xa9NjB
	uUUP/PtYbFTzxG8QbUkWa8CawBNEKvIFA/Btap8yv7eMk5Lfe1mE40Z++b6ZUw6mjzBtUpefU5/rM
	C6SG5nzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIkT-0000000Fugn-142c;
	Mon, 13 Apr 2026 14:58:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIkQ-0000000FufJ-10dD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 14:58:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DCZEA63989205
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 14:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=00DJSzTx4OYnNszTMCzO4Ng7
	MXEjLPxiBpeE0uNJD6k=; b=mgwDecpGYk1IEbv5RhvjNBijJN3DKbCFeO9mk0mR
	6xzlx0jWn9lAgIXzn0rwYWUTi1IvjJZxN6AfFsSzLvgXonH1dAclmOsyoUHZG1jT
	KFHWpPF7aGkxofgz9GpLSxtQqmZkGWXfLzIPsaAnuOu+LS0TCR8w6juXFTdQRMIP
	r93NkAOrzu9m9PolKDcdIKcA+/qWJCPSQuGpztJw0woes1OdZL0dQLH0K3BXz2/6
	2bJXcHlF2XWia9JsPoYk+MQOW9XKwW/EXuPxmjnMP2Pa0vKje/IJuSoQmtE9Aggz
	wLJzBC6+bCcgp988cc4NJN9oCe38Wxa0bLaMqAByNOa8VQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh0mfrk39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 14:58:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50df4c130dbso33656831cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776092324; x=1776697124; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=00DJSzTx4OYnNszTMCzO4Ng7MXEjLPxiBpeE0uNJD6k=;
        b=J+cfyZz7tt0QB/99TDZZ8BcAYZQXNKYsDVWpgzzyYspMzsGI2Tg65X/jxR5SKhg/hy
         nQ64y4dI5dPj7sSn2Pe5P17bXB9q1+esO7gjNKPEd9Tx/nAg6Xvxja1AjiV0kEGPttCG
         /rZ/W/9BDGQH3DxJ0rGLFgjaAutmnyTLJlbiKWcWdw1TL3NhG7CMeBWJbTRyj/3FQPUf
         wKJSh+CxBaH9qGYYQrNXRz7oc8JmLI9G5sLVz6W4cwg7fJKNwSOcJc5X5kZ3UEh0+wKK
         K7HnOtKqxJmNYc0GaCIeAVIAQI+ntsleB+LPvOfWanmJPIuB/LcEy3aBIhE6W5xQrBKS
         Ixrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776092324; x=1776697124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00DJSzTx4OYnNszTMCzO4Ng7MXEjLPxiBpeE0uNJD6k=;
        b=YM0fqp0fRrR6xo15cLcXpUcyIKnr76op8D7bxKprZzvkUm1U9zLARjaHO3cpreKtsY
         bv6hf0yUajP6Dk3Hf2jsLFy2BN06fjX1KkRnIBrApCx61XRty5J6qAWHK9SESHB4TB0c
         9x4MDFTwROAnUINg1BW05SRa+AL7I72ErBoOYdegKs0s35w6ceAkjqYfTN8gUKXDG2G4
         tCCAZOXTSmo5M5bKS3qLdCojJcTPAOVqAvd2JtUAYUh6DqvuNpxKlGzJfPv4X5ml6Bnw
         unPioiaFFBmC2o350L/36+sPgZuQYiSD+Uqd6Vmh4ry5MW+buRHEyJ/2UvEoLMDbLQUU
         QEBg==
X-Forwarded-Encrypted: i=1; AFNElJ9OF8R4483JQGlyiVJB7PJCiapzwRfkYDLrz/rCMsL0oOPJ7K3N1gp5tJ+/Ub6jejyq4cWcXZM5gYk/zM0FhzG7@lists.infradead.org
X-Gm-Message-State: AOJu0YyOZgKEfu1QLt6ceCUCKv19nqcTRYh2Zvkb6EvxebfPb2T64t8+
	mB9w5Wli8TTySSHlyCDbp1eIPnGYDb0T10tRK19Yp/Db/ltYap0J79pBykYo/2if+zxMnsO6yyr
	MB+MJFlqLFWdnUtsf/AYKJxtypvLdmKgeP1HwUWLsVAj+IDKhRAHsdSFYSutHF2DUYS5Xj88CQ+
	UmLw==
X-Gm-Gg: AeBDietAL4o7kPmewk+ombL/+5elL9UDORZ5wUeKK7tBHzmGPAWI4cnjwHE8gihw4nT
	+0IXKt92/xXx03lYCbADliAA0qd/9eP4lJxeBTWD7Os2KpNDJnuVT6HiRAFGCSIOVX1a/0SJNep
	LEyfjNEVVwcjtmudxgl/igOFXK/XtvKf+c8SazpGPdiDiFCkcTlw8o4urBpa5pEyBk5CxKnCy4J
	QS0RF763Os6+jm3sD6jsAkehkJASSD9Jwe/poWmOrUYlUoKh30rhGL8kJMm1T7VHngLJyN3oAk7
	fNiu8ZOVjishp5BAlHixdoBbsy8Gy4soHcKZ2gfVlgoL2aaeW4iRfAWakRq89wEaufMTkd1/jJM
	y/1eW05NGbouHot68oX/+xkKHwHpIhIY8B10aSCeUJCYMOlBLOZ5DYLl8vbMVctGlSaA1j0Acl/
	SmCy/NthL/rbBAxTXmqXcmulAHGpoLhP7kQm0=
X-Received: by 2002:ac8:5955:0:b0:50d:84ce:e339 with SMTP id d75a77b69052e-50dc1acd899mr255338581cf.19.1776092324096;
        Mon, 13 Apr 2026 07:58:44 -0700 (PDT)
X-Received: by 2002:ac8:5955:0:b0:50d:84ce:e339 with SMTP id d75a77b69052e-50dc1acd899mr255338201cf.19.1776092323512;
        Mon, 13 Apr 2026 07:58:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4956a839sm24467831fa.32.2026.04.13.07.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:58:42 -0700 (PDT)
Date: Mon, 13 Apr 2026 17:58:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/10] drm/bridge: add of_drm_get_bridge_by_endpoint()
Message-ID: <u2awvqh2uoc2acuuvyavwwtuvtiaidhbkkj5a2d2wwph2s7j7g@b4j73kwzblgk>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-1-acd01cd79a1f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-1-acd01cd79a1f@bootlin.com>
X-Proofpoint-GUID: yvxINCe5Z2evuF0mXJM02FCrR3vhUahp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE0NyBTYWx0ZWRfX9gX8Qa9E01sY
 6sMvIfN/CjS5nyqikmaZZiq1q9nyIYnK0Uz+Oo3ePA4O5Ti8iOJLJA/mgksymonQlNQT3FyyaJw
 8+yCGGUroxMd8/3F1PCA8/4FS+81rFyElaIXadY888Td4Zlojj34FVUDv7zgbw6G5zBWqN/LcHE
 KpPw2cUgR/YyisBAtS4hKtFrZHYhuIeMxAyYT9r5/FOQLHZsu2WRHvFUUOS+3bs7hOk/nLZDSff
 lwPjN7WsGmwweyOrkoPx6CR0T/Ljb6PGLvIW9xBvqeLXjMj7AcXC0KIfrdqZ3SkUGgMJ9Pbr6Ws
 5+GD0nQlhVtm8QBMBWTCEI3RHNTDeBbPRU6YVo2opYvLT4rUh6FdZG6WLbNaaGMzbyfvk0RD9Lc
 he4MGaDC8yobzT3c+3xqdpXdeSRhW6eDFacKQyPwpURZWNpLn7b6yHx9gUy+tsUymhKFJzz2knU
 nLt652QRVPWDAVMQujw==
X-Authority-Analysis: v=2.4 cv=cMvQdFeN c=1 sm=1 tr=0 ts=69dd04a4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=P-IC7800AAAA:8
 a=rZHl3HjT5p_iJrZpzTIA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: yvxINCe5Z2evuF0mXJM02FCrR3vhUahp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_075846_402324_50608A65 
X-CRM114-Status: GOOD (  35.78  )
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

On Mon, Apr 13, 2026 at 03:58:33PM +0200, Luca Ceresoli wrote:
> drm_of_find_panel_or_bridge() is widely used, but many callers pass NULL
> into the @panel or the @bridge arguments, thus making a very partial usage
> of this rather complex function.
> 
> Besides, the bridge returned in @bridge is not refcounted, thus making this
> API unsafe when DRM bridge hotplug will be introduced.
> 
> Solve both issues for the cases of calls to drm_of_find_panel_or_bridge()
> with a NULL @panel pointer by adding a new function that only looks for
> bridges (and is thus much simpler) and increments the refcount of the
> returned bridge.
> 
> The new function is identical to drm_of_find_panel_or_bridge() except it:
> 
>  - handles bridge refcounting: uses of_drm_find_and_get_bridge() instead of
>    of_drm_find_bridge() internally to return a refcounted bridge
>  - is slightly simpler to use: just takes no @panel parameter
>  - has a simpler implementation: it is equal to
>    drm_of_find_panel_or_bridge() after removing the code that becomes dead
>    when @panel == NULL
> 
> Also add this function to drm_bridge.c and not drm_of.c because it returns
> bridges only.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     |  9 +++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index ba80bebb5685..e51990b74417 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1581,6 +1581,52 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  	return bridge;
>  }
>  EXPORT_SYMBOL(of_drm_find_bridge);
> +
> +/**
> + * of_drm_get_bridge_by_endpoint - return DRM bridge connected to a port/endpoint
> + * @np: device tree node containing output ports
> + * @port: port in the device tree node, or -1 for the first port found
> + * @endpoint: endpoint in the device tree node, or -1 for the first endpoint found
> + * @bridge: pointer to hold returned drm_bridge, must not be NULL
> + *
> + * Given a DT node's port and endpoint number, find the connected node and
> + * return the associated drm_bridge device.
> + *
> + * The refcount of the returned bridge is incremented. Use drm_bridge_put()
> + * when done with it.
> + *
> + * Returns zero (and sets *bridge to a valid bridge pointer) if successful,
> + * or one of the standard error codes (and the value in *bridge is
> + * unspecified) if it fails.

Can we return drm_bridge or error cookie instead?

> + */
> +int of_drm_get_bridge_by_endpoint(const struct device_node *np,
> +				  int port, int endpoint,
> +				  struct drm_bridge **bridge)

Nit: can it be drm_of_get_bridge_by_endpoint?

> +{
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	/*
> +	 * of_graph_get_remote_node() produces a noisy error message if port
> +	 * node isn't found and the absence of the port is a legit case here,
> +	 * so at first we silently check whether graph presents in the
> +	 * device-tree node.
> +	 */
> +	if (!of_graph_is_present(np))
> +		return -ENODEV;
> +
> +	struct device_node *remote __free(device_node) =
> +		of_graph_get_remote_node(np, port, endpoint);
> +	if (!remote)
> +		return -ENODEV;
> +
> +	*bridge = of_drm_find_and_get_bridge(remote);
> +	if (*bridge)
> +		return 0;
> +
> +	return -EPROBE_DEFER;
> +}
> +EXPORT_SYMBOL_GPL(of_drm_get_bridge_by_endpoint);
>  #endif
>  

-- 
With best wishes
Dmitry

