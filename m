Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4C1CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohxWiDpU3AbnS+UuB5k3uTeLAdfv2H657D5P1upIvkQ=; b=MESjf4vm0AskfssoHBlP6PSDqP
	zjgUl/A6bWjtuqQo8Trba19HA+3k/YYBWmSnlNbFTBUI4q9+4fQB5mZ1Dlh6TN9GsZj40XIIKQAIq
	vh5TXE0EPS/zNV5z1SJ+gnGgXcWRytPTzm5/pc+b1oveY0ob0FoIISKxePYv6GyMXN5hEPa18ClW8
	ud2wwip33bln4gBuLHS1u/kAbalhvHTeXMZmIXBqUBqzpdoqA/vqJifvT3VS/e2mqWNl38DseNHOz
	yoeh13+7cQ6l9l4l0HH/2tMt/K2Fw8o24bbXegcS6i4q5CPIDn3/Da75XO8kg2RwxjY9XU3W83lw9
	PltlzTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1av-00000008lhJ-1fFv;
	Fri, 12 Sep 2025 11:05:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1as-00000008lg6-2t0g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:05:31 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fIiB019781
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 11:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ohxWiDpU3AbnS+UuB5k3uTeL
	Adfv2H657D5P1upIvkQ=; b=MW+FPQwl0WXbDItnUmSLSyc0GbmzLyjyN+1txKc9
	AT8xH8wJevXZk+3JGPM/TL/TeFRxNl3xa+KYO+gVkQJibvA1hRV14iyuYwuCQD/k
	H6TQpfFx6o9mf+cU9fgLeQWIvyXyz6gBoLqL44Lh7tsBn89d2vYo2EdJBDoMeqpt
	TT0KXvoKXXTNMHzTHYymhlwEPkYue4dvA1klpbeN+GBZIqZeU/yPXK29s1Nmj+NK
	lH2MLswbDAoOsfcI6fFPUnlcyNvueBJVPGA/xxt4gjfJXJRzefcTAKNoYcHr9XpY
	Bvy0I3PdXjtYA4YgRe7OaVCk+4JsJLwYYDlNZvhHIPwr2A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t387tuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 11:05:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-76a9a9327e8so8007056d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 04:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675129; x=1758279929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohxWiDpU3AbnS+UuB5k3uTeLAdfv2H657D5P1upIvkQ=;
        b=meJmsXrYLSizTqo63y05EPIZO4tkbagXEPRvRukuwIfmczQRYuHxYW0ZQGha3eEXG2
         O7fZxBJbD0GKdtgvF0uJDDIExzPXAvg0hfAkS1fXIhIY031So07aqGcSUvVqOgGNSZRY
         x16fZNprLh2cmHeEcqI0UU00nj8cmv/+t/u/32voUzWCRdKXdinK+NNOzIMTNcwlRSRj
         1OuUCcHMRoMNrqB8Ep+BsRpcQvPU8RRiNkcMd5OKuefXW7aILY3kggiqwrJwgOagppaE
         GU5HTTxOcsVdmM9NGmU1ouLmKuKBTZwllTZDA/dvO4Fbzrz0OcWvvyZmyZIrQXiVJlYf
         BIRA==
X-Forwarded-Encrypted: i=1; AJvYcCVPWnKav/qQYB/8/lGZ/pjgxRxiiDrE+qgBH0O+sNlfwfBUKKuabS/nAY7MepDHIG9UuEtqj/WKX3eYXE/k9aYY@lists.infradead.org
X-Gm-Message-State: AOJu0YySvlE9NKXht/WCh+LzNBV0/WmvFkwAHgfaLnIfhk51Ya60sNA4
	nX/HG7vzd7KuHFascyYa+3pX2jiDzQsNBTzxavSObTHFL3NyRWEa+AKEuzBNgSrzowH1tx6ANQ/
	Y8EubtvhJszfmR2fdzRLzOZX8heENSBFkCpCeCieGwJg/uzDY3aXqn5mxU9WfcnbvE/I5ZvXQEz
	9qiQ==
X-Gm-Gg: ASbGncvwqgvAoVUNKjEHuDl8RgBpj0IbnQOh76uSlVp3ttF0mdNenUX9eus6eArxN2e
	94hkXEIh4DP40aDkUisZeRN1CvDcGgpmJrqgh4MfzglsFz7oa2XFPmwNK2bCzIQ/8z4+v1Ndue6
	Ef8fWEWfXK76fda3bBzmmgqvKFSfWrOrI61ATFzFUFIx/OCrC/bLnZ3N+FTCdart5X4XYpJRrcc
	ogqpnG1EGkC0SgmVyB3HnqZvwJNxeDjADLKPYNbahpEo6blgWoJY96TrGqsQ+/VDnLc7mLYBKza
	AMU9m+YC49MmNDrCx1NuYxiHzaKfra8L9Td6BZ69uT013mnDQ4wD4xsbICklvQOuUNQ/vq7rQ7b
	xH1c1mj0k9y9Nk26VO6IWogAHaks6Ug2ro21NXQj3/bPEUOwgLv9o
X-Received: by 2002:ad4:5cae:0:b0:725:cd10:3d1d with SMTP id 6a1803df08f44-767bc5e525dmr30639416d6.16.1757675128341;
        Fri, 12 Sep 2025 04:05:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKv2Tcc0omb5IKgx/KH/GT6a7+rHlMbIBMJwADkJ0xx5dKz4aNr6q+JalITdK6SvCqNVjAPg==
X-Received: by 2002:ad4:5cae:0:b0:725:cd10:3d1d with SMTP id 6a1803df08f44-767bc5e525dmr30638416d6.16.1757675127615;
        Fri, 12 Sep 2025 04:05:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e65564946sm1077186e87.127.2025.09.12.04.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:05:26 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:05:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, dianders@chromium.org,
        m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 13/17] drm/rockchip: analogix_dp: Apply
 &analogix_dp_plat_data.attach() to attach next bridge
Message-ID: <2cu3ge6kjeibfznvt6c52xn2rp5zb3wk3pkb7gly34qrjlueem@7wqyowascpn5>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-14-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-14-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: _Ba_RCg3P4P2VfSBL_IfTB_KcgqIXz9b
X-Proofpoint-GUID: _Ba_RCg3P4P2VfSBL_IfTB_KcgqIXz9b
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c3fe7a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=Fz8SCyDB7bCRA1NsBX0A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX9dxOMBqJDQOe
 7uA/emOOtb4S+z2Q1mn7z7JeYnsGGDSOO/ppZdapFhMZqImOfbzyinmYr3nKQfEMymFYoHJKn/t
 KDM6/0Y1wXQIIwKlDxE38wIaunkyJerZ2D+lUPUSa2WzCzTZpWli+VKWBLzcLqvGWSKS1Yg1FdC
 cASF0TEFAWDjNmOROWngTvSgJ6WwHZTq0Y33Do8B+U/fX821vLWtpAcBwF9Z9yr3ZEfDkeln18L
 Gye7vm52Qu/n36krUD5RomKSq0hQiwLbixQdqRTcfKTOHzUJrbc8ufBpVARshhGfHy+cZJH87zh
 +WLbwOVykwxORHxZ5OYvksxtqDm4Bwz9gVXECARnCuOSJAzRGs7UxRTRg6kItrjlV4mjVjz3XS9
 Y/BwEIxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_040530_725924_852BD31D 
X-CRM114-Status: GOOD (  23.74  )
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

On Fri, Sep 12, 2025 at 04:58:42PM +0800, Damon Ding wrote:
> There may be the panel or bridge after &analogix_dp_device.bridge.
> Add rockchip_dp_attach() to support the next bridge attachment for
> the Rockchip side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index 0784f19a2ed9..39f1ed293c75 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -164,6 +164,24 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
>  	return 0;
>  }
>  
> +static int rockchip_dp_attach(struct analogix_dp_plat_data *plat_data,
> +				     struct drm_bridge *bridge)
> +{
> +	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
> +	int ret;
> +
> +	if (plat_data->next_bridge) {
> +		ret = drm_bridge_attach(&dp->encoder.encoder, plat_data->next_bridge, bridge,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);

Can this be handled inside analogix_dp_bridge's attach callback?

> +		if (ret) {
> +			dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static bool
>  rockchip_dp_drm_encoder_mode_fixup(struct drm_encoder *encoder,
>  				   const struct drm_display_mode *mode,
> @@ -452,6 +470,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  	dp->plat_data.dev_type = dp->data->chip_type;
>  	dp->plat_data.power_on = rockchip_dp_poweron;
>  	dp->plat_data.power_off = rockchip_dp_powerdown;
> +	dp->plat_data.attach = rockchip_dp_attach;
>  	dp->plat_data.ops = &rockchip_dp_component_ops;
>  
>  	ret = rockchip_dp_of_probe(dp);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

