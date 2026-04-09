Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E2EF364C0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 21:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hu81u8EXPjFrB34GvSJW9iQwsEy8qvlO31eh+EE0xPg=; b=E+22hHrNzbd0Wk3n+5fN8H8A4r
	5xOz5yohakeMfA4QYuyVnhuM5NAoRIpDA1WpadHZKaBEvgchJhrY4skmW76Xu2QrU3XeeUBQYUVVt
	4pHjCTwHlP7oXsa+9rryk1myAaEQItq0g8YkH/y8JxpSWVRZYocnxuPP9g/fR2c1SsU7i5OBjl5pi
	22jR93sEOhzgGXR/FifAMiEegCjGZz9C505YLe0oz7H0sOK0a0LUBvgGvPRCOcSbty5RUT6/vuzDb
	+6OaSfREpxZixJeB/PdgGTogi/oNuBm6G3BzkXBLD1Z2Cz9ZtXuKI5DPCd6SUwXfG9qs7aqGYgSPA
	ggHR/bYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxJP-0000000BFm0-3860;
	Thu, 09 Apr 2026 21:53:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxJL-0000000BFkn-3k93
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 21:53:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639JD3S32867026
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 21:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hu81u8EXPjFrB34GvSJW9iQw
	sEy8qvlO31eh+EE0xPg=; b=GmT673w0E/j1Q74yC99wb3ajRMSsRLbCbIHUvSVP
	uamrDGeWDu5NNk7G6tKX8jeB37nxu/H/C06C/S4yCJruDmrKx+ZLLLzPg3mclIP6
	mSJmy3eZbHxVhMTwbP7fc/ATus+LU4btxJZkNij0IJGfTBasR8eTPtdAYkhavNPk
	uRKgkE5/rQgpoYqNzOSkZrgr4DDhAZjoJYhMnELo5gQPSmcJA20p5gYGBIOs/rjO
	DxahXh/NChmF8HdNyZIHzJDRHWzU05YKF8KSlIsWptwTNibxjz92qddG+8mnXzev
	ypT8gPTdbW/WfZSg6miimVwvQCD63qVuSXz0MZsGx0OBcg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decayhwsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 21:53:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d812c898cso39254741cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775771594; x=1776376394; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hu81u8EXPjFrB34GvSJW9iQwsEy8qvlO31eh+EE0xPg=;
        b=Tl3oeSlhmTg7Sm9NSojnHbJjxjuYJD0Cc0EI6/Y2bg0lybLTymm8ZSo+D5LrKQKvFa
         JXAMW6/WDhXh5KzfRh0sVPJJ5gkTn5N9CoItPeykFATWZGyDEsQELmF1Jp6WFTm2cgGh
         YJwNOsE5Qhn7dly/O2Wnkil/eDNsgMJ1Kvgjng3HdnWg/RtdEpldWW0Us8EVoR6zGJgH
         /Yt9yHcPbhh6BzQBgMyFPlpmCEqCB3eQXYjb3R7ik8bViRTzFL9B2wnKZFK/ZnQT4BUl
         qBlzu6LRqlDsXXP3PZUG4APvYyB+fHp2FWMZ9fnun3U3HPqVuAuKMhDEt2mtphjG1Q7U
         KrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775771594; x=1776376394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hu81u8EXPjFrB34GvSJW9iQwsEy8qvlO31eh+EE0xPg=;
        b=NI+WQTGznTb/RY8OVmSYzCBs0C6WI73834GsyWpO73+iL1FUEZYuyu1tOCfinoEPFD
         zk/6qAmZuaGsPWmwYP6NPaVyqjTpNbj6tuUm2Zgl5mk4lb6FKHXLwbR8l4VmbMjuMQWv
         4ueUI2frEKLwmBPOZwFRyQNk/4r3C4KFz4lMISPAGYMJmKv9M/pFZpyYwKP3ATOyvx0F
         CxW1/OqmhHTa2JOhzoQFn8rS5RCMLCKryweczgoQKOm/vWpaiCsOgtO1a1ol6IvEQh1P
         ycNCnwps43LKbKUgsQKtnYIbYrVt05npEszT9nDtAlr/vJc9Y/NVPb36W0LyS32DP0GZ
         tZpg==
X-Forwarded-Encrypted: i=1; AJvYcCVG3vXehybtN8XmizHN0GgQHkvIGol1UE1uex6FrurcxWUiqlButifJVRrABlK8hvYHq02Mm12dbJ+TW6JdRLpH@lists.infradead.org
X-Gm-Message-State: AOJu0YzqTXU0cNkM6WDKHl1vpBFDCLyyF1AkXoZn7hrnShZIxFXORyDY
	LdIVSQJwDBoSL4JgIuVNNpZeGMr9TqBeljNEnRlk7m3NNSoAtCIiMMuiyVwz2xLI9+ImObrHniC
	aZmsVdUDRWUQzNGk3rt0HIZCXYlotXvvbx8eufapO0I3dOqYJ6/stmv78Qr+ifZdjDngXwga2C/
	Sjuw==
X-Gm-Gg: AeBDiesGH1rPOVixuRxhO5Wo8ga5mKoi+NboGmANP8qfiTf805QUK2dXDtE71vyGeMR
	/sSiHbOxFJByGHTl55sqVg6fXKCS3osnfEWGRFyM4gb4SbxLZj2h5X4yuZLzFJnh55SJ+NPG7CR
	P9riDN7e8ea29TDIZVWImJvROkIpfdXvWCfP4XPoneeY/7xaXGVEEJwVyxdzfYshS5eyF4qLyA3
	cJfHWDaXYjFs/08bI7zsW96iddniMUtHIFyNuRyWZq99YMzByn2ZSP04XUviBpLpska4zheMBmn
	Kw/5mlT+33HPeohFAxbXQpjUBGb5i4DEH4v2QNK+8hNghaJ98pQOfry+6AxA6Rjm3tznH9c5OwK
	YK8pR8+T5H8z5D8Qjwajfjk/VnnUrZKezRTBgUkgyJZvKa0fSW8CmbM3LAAvmSttxKqsVxk5e5w
	Lwma7lj1rUt+0QJBxpk0ZMYGNarZTXB1WB700=
X-Received: by 2002:a05:622a:9:b0:50d:7b0c:35de with SMTP id d75a77b69052e-50dd5c74756mr15755521cf.44.1775771593984;
        Thu, 09 Apr 2026 14:53:13 -0700 (PDT)
X-Received: by 2002:a05:622a:9:b0:50d:7b0c:35de with SMTP id d75a77b69052e-50dd5c74756mr15755051cf.44.1775771593478;
        Thu, 09 Apr 2026 14:53:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49298f1csm1971861fa.12.2026.04.09.14.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:53:11 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:53:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        Jesse Barnes <jbarnes@virtuousgeek.org>, Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH RFC 09/12] drm: Introduce drmm_connector_dp_init() with
 link training state properties
Message-ID: <gmaxonri7y3k43pxsnxfnd23mydgrwsw2322v6m4yjoksqm7aj@4ehgvhzg2ubb>
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
 <20260409-feat_link_cap-v1-9-7069e8199ce2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-feat_link_cap-v1-9-7069e8199ce2@bootlin.com>
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d81fcb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=P-IC7800AAAA:8
 a=E-m9dlAQy1ysB7IIWEIA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDIwMiBTYWx0ZWRfX7ay0mqs2C43G
 kJWEb8MlSfZudu23JYHBKRmZq8N5eMsUgVOBFSLUHdMW9JWsFXGOXzGmtp2ok9R4ZkTOc9Pzd8p
 ku137iPUrGBQiUhjURGfD2KmaC0RhJkkW9UdO8JlXl8qsMtoPMtLnXAYbCBrL+nYKS+7DM+064S
 zk60g5DrwRjOw2BzVmrI3N9uznKHQBp7hYZyHxADnG3aj695JYJDPd1gU3eCMO6gtyQu/oKaiut
 LOJBX80oNjO2TDkpT+BJIJMPZuFHZqr7olwCnddcH6EzZKpSBz380f3Oy6SW3K26kFEoFgmEhan
 adltJ8HxkLUtyZHronOj00eaX8UbrBNc30jjaLreIjH+jAyXBj+zLVKhDo9Hv+6S90rra8nHEiw
 U6YJtvwizVC+WpJ+IliSYS8iyR4/4OIucqYUOpDAicTeJmUoM+u+BjFmy9O6m9cBJxeN+oRP8NG
 ayC4BTCur77ivRUcTGA==
X-Proofpoint-GUID: eE62KaOHn-AXfUdN134OYm_AIUJctuqT
X-Proofpoint-ORIG-GUID: eE62KaOHn-AXfUdN134OYm_AIUJctuqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_145315_961113_D6247562 
X-CRM114-Status: GOOD (  27.75  )
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

On Thu, Apr 09, 2026 at 07:08:25PM +0200, Kory Maincent wrote:
> Add a managed DisplayPort connector initialization helper,
> drmm_connector_dp_init(), modeled after the existing HDMI counterpart
> drmm_connector_hdmi_init(). Cleanup is handled automatically via a
> DRM-managed action.
> 
> The helper creates the following immutable connector properties to expose
> DP link training capabilities and state to userspace:
> 
>   - num_lanes: bitmask of supported lane counts (1, 2, 4)
>   - link_rate: Array of supported link rates.
>   - dsc_en: Display Stream Compression supported
>   - voltage_swingN: per-lane voltage swing level bitmask
>   - pre-emphasisN: per-lane pre-emphasis level bitmask
> 
> Link rates are passed by the driver in deca-kbps, following the DRM
> convention, but exposed to userspace in kbps for clarity.
> 
> Two additional helpers are provided to update and reset those properties
> at runtime:
>   - drm_connector_dp_set_link_train_properties()
>   - drm_connector_dp_reset_link_train_properties()
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  drivers/gpu/drm/Makefile           |   1 +
>  drivers/gpu/drm/drm_dp_connector.c | 344 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h        |  38 ++++
>  include/drm/drm_dp_connector.h     | 109 ++++++++++++
>  4 files changed, 492 insertions(+)
> 
> diff --git a/include/drm/drm_dp_connector.h b/include/drm/drm_dp_connector.h
> new file mode 100644
> index 0000000000000..77d2f4bb6df68
> --- /dev/null
> +++ b/include/drm/drm_dp_connector.h
> @@ -0,0 +1,109 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef DRM_DP_CONNECTOR_H_
> +#define DRM_DP_CONNECTOR_H_
> +
> +#include <drm/drm_connector.h>
> +
> +#define DRM_DP_1LANE	BIT(0)
> +#define DRM_DP_2LANE	BIT(1)
> +#define DRM_DP_4LANE	BIT(2)
> +#define DRM_NLANES_MASK (DRM_DP_1LANE | DRM_DP_2LANE | DRM_DP_4LANE)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_0 BIT(0)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_1 BIT(1)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_2 BIT(2)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_3 BIT(3)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_MASK (DRM_DP_VOLTAGE_SWING_LEVEL_0 | \
> +					 DRM_DP_VOLTAGE_SWING_LEVEL_1 | \
> +					 DRM_DP_VOLTAGE_SWING_LEVEL_2 | \
> +					 DRM_DP_VOLTAGE_SWING_LEVEL_3)
> +#define DRM_DP_PRE_EMPH_LEVEL_0 BIT(0)
> +#define DRM_DP_PRE_EMPH_LEVEL_1 BIT(1)
> +#define DRM_DP_PRE_EMPH_LEVEL_2 BIT(2)
> +#define DRM_DP_PRE_EMPH_LEVEL_3 BIT(3)
> +#define DRM_DP_PRE_EMPH_LEVEL_MASK (DRM_DP_PRE_EMPH_LEVEL_0 | \
> +				    DRM_DP_PRE_EMPH_LEVEL_1 | \
> +				    DRM_DP_PRE_EMPH_LEVEL_2 | \
> +				    DRM_DP_PRE_EMPH_LEVEL_3)
> +
> +/**
> + * struct drm_connector_dp_link_train_caps - DRM DisplayPort link training
> + * capabilities

Those are not just link training caps. It is more like DP link caps.
They make sense to be a part of the DP-related drm_connector part.

> + */
> +struct drm_connector_dp_link_train_caps {
> +	/**
> +	 * @nlanes: Bitmask of lanes number supported
> +	 */
> +	u8 nlanes;
> +
> +	/**
> +	 * @nrates: Number of link rates supported
> +	 */
> +	u32 nrates;
> +
> +	/**
> +	 * @rates: Array listing the supported link rates in deca-kbps
> +	 */
> +	const u32 *rates;
> +
> +	/**
> +	 * @dsc: Display Stream Compression supported
> +	 */
> +	bool dsc;
> +
> +	/**
> +	 * @v_swings: Bitmask of voltage swing level supported
> +	 */
> +	u8 v_swings;
> +
> +	/**
> +	 * @pre_emphs: Bitmask of pre-emphasis level supported
> +	 */
> +	u8 pre_emphs;
> +};
> +
> +/**
> + * struct drm_connector_dp_link_train - DRM DisplayPort link training
> + * information report
> + */
> +struct drm_connector_dp_link_train {

THese define the current DP state. As such, they definitely make sense
to be a part of the drm_connector.
> +	/**
> +	 * @nlanes: The number of lanes used
> +	 */
> +	u8 nlanes;
> +
> +	/**
> +	 * @rates: Link rate value selected in deca-kbps
> +	 */
> +	u32 rate;
> +
> +	/**
> +	 * @dsc: Display Stream Compression enabled
> +	 */
> +	bool dsc_en;
> +
> +	/**
> +	 * @v_swings: Array listing the bitmask voltage swing level per lanes
> +	 */
> +	u8 v_swing[4];
> +
> +	/**
> +	 * @pre_emph: Array listing the bitmask pre-emphasis level per lanes
> +	 */
> +	u8 pre_emph[4];

Please consider following struct phy_configure_opts_dp (or using it as
is). Overall, please refer the talk and (more important) the lightning
resumee at this XDC. I have some bits and pieces ready in spite of that
proposal, but I didn't have time to finish it.

> +};
> +

-- 
With best wishes
Dmitry

