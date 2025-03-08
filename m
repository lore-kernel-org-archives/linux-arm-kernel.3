Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2D8C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 02:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjVkCifx/RSQQ8Da117ebd6rVOl6XM9uzHnpVWsZ5zs=; b=eCYvnutWEGSpql7KVkcwRh6cEa
	qcwRmds9UGLHqqH0Eqk33l0a5Ea7kpVT2D1g6IdSgT4aJrcNt8m1dezglZoMAfHYTtkvalGcWe35A
	10La5uaFAslynSmbP81XIM1YelDE7U31J7Ktm/dO4uCUFYCt50YQE0+Ji/LNLA0nNZMfKAJiFs4eS
	TxUHEVbGp1zPpiPYkKo7j/Hk2tIcFeOkay4LBwagDimN7Mb0o1jOFgzeFzWzZzRcj4y61IryWfCHe
	Azjnu04OTh4EsiUiiAX/3NzqhgWCONNO4Qe365ZIi5QJA6JVEMfZFOHwYtynU9Ia5e/CeWyebLpCq
	Jl2ZYjJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjXl-0000000G27R-4BNh;
	Sat, 08 Mar 2025 02:04:02 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjUE-0000000G1qQ-03wp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 02:00:23 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-549967c72bcso931716e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 18:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741399219; x=1742004019; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NjVkCifx/RSQQ8Da117ebd6rVOl6XM9uzHnpVWsZ5zs=;
        b=lt2agnH9ZzeX9w8133ZydZJtJskSnrvmphst0ILJ7RyJqNTo6KkEQp24H6WPJJSMkB
         XaPsJY/vlHFdoy17tMqsfCfkE3VJ5//iIrzTd+Wzzr9nQOPDye9cdS+4nosawmjE7Ox1
         WXCVyOtaVKzrKe8JbCsbt4amcaWruCig6nO3S5xJbxhjixGLpowUKkkCDfOIoUurO9c1
         f4GLjnrlwjGkRUA/9o3NnyieaFDYkioRNO69yVKhmPxsBjoLm2m8xYB8NCuTlkWPjDh7
         Z1Pf71FwlGQZ1DRBawT0t8GeimuGEDl0lLBRnkaQ1DlkPuwPyjotqyK9zQIrL5zg0W2M
         HMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741399219; x=1742004019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjVkCifx/RSQQ8Da117ebd6rVOl6XM9uzHnpVWsZ5zs=;
        b=PwZ0twsFGJOn/T1+P2fv9Jzv+CWy8TXRY5Wb/gJx8BpgsPVNfAAUndVBYaaziioXqh
         pie6lggYMs8IzKUEbGdBDG0pcQXfYV87KPkiYtMJq1F8IEEQ8T0bty6MIIFRWAkiGTsB
         ix8NmZ1Y/ebUp2rnVSvyGZVB+D463i9OHm8Oeq+3QGa35FOrjLZVdxO5LwgHomNac9sb
         6T327FkkHAyOgfYer/dYyV844pYO1JycBRDhvdjJiDoqjhTUrHOYsB1sw3ENq4s9/Yf2
         vRCCZhp/pnl7LFbR6EfsJfsdQ+bRKcQy72TEhC1qaiCe5OM3KbH+gmXPYwpauV9CQwDp
         x7Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUPv2kzTIIVIYrMSi+mI6dkSspaADV6TMaImptkz7Quy92gSZ2L2AAiG48k48OPjp/fYHQUnMmVQMr/P7zhZX0G@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7y5GYovGdrTJ1ODOThjtesHHTuZ04QCMucwAK3XF1kYuvJVaF
	a+jX8G0Wqzo1PB91w7piiDHYuLNguL8f09kNx4pwmf0Ef89MZ+4PcVOuKHdhgto=
X-Gm-Gg: ASbGncsVdx0fntX8y+gUr9ai1mz0Qnt9EdxsVzX+VMceP//QPZN7rut7nhy0pjhTbwU
	wOyfnoLukeowicB36xXfgI+OEGvr6ypnfzx5kgIdIonpH02kVVD+6L6HFx9wfyk9Dwdgt1DZY+0
	DiqXtBBHs7FTTLzQXdPWxfGvVrWP4zSwdDh2Yu4VTVtorrWz2HpJpvJQyPnc9fYhjHCInhLNLJr
	3GhU7vqlovtS0FngOA1tbslZrcxGFENe747yHD1/u2AyZOICq0RVHdsbqpbd8uoK/s6yRL3TeNi
	j3hUFssFl4hOgWUgN833ygEpWop1cNTy24M7NQXOXgOkp4aHdjM6N1mRGzJBst07+04PrGmZqSV
	UCwsnqKv2NyQV+kJCFVvQMnLw
X-Google-Smtp-Source: AGHT+IHD+uwBqwVOK6PF+JlAvIXYtVL34Ab2L2yfhLPX2xkxj8BVZbxw9BTY9Ei5g5385gK2RsIBIw==
X-Received: by 2002:a05:6512:3dab:b0:549:8ed4:fb46 with SMTP id 2adb3069b0e04-54990e676f0mr1813977e87.26.1741399219383;
        Fri, 07 Mar 2025 18:00:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1c33bfsm680563e87.236.2025.03.07.18.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 18:00:18 -0800 (PST)
Date: Sat, 8 Mar 2025 04:00:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] drm/msm/mdss: add SAR2130P device configuration
Message-ID: <kifzy754m7zygspknsk4a4aeuqxkt4bkyp5jbu6ul43gon7je3@yleqikfmh4lp>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-6-1d4c30f43822@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-6-1d4c30f43822@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_180022_067356_050A8CF3 
X-CRM114-Status: GOOD (  20.96  )
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

On Sat, Mar 08, 2025 at 03:42:24AM +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add compatible and device configuration for the Qualcomm SAR2130P
> platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3e82ba0885d03107d54eab9569bb4c5395454c7a 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -592,6 +592,16 @@ static const struct msm_mdss_data sa8775p_data = {
>  	.reg_bus_bw = 74000,
>  };
>  
> +static const struct msm_mdss_data sar2130p_data = {
> +	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
> +	.ubwc_dec_version = UBWC_4_3,
> +	.ubwc_swizzle = 6,
> +	.ubwc_static = 1,

This should have been .ubwc_bank_spread = true.
I have been rebasing the series from the earlier kernel and I'm not sure
why this didn't show up during the build phase.

> +	.highest_bank_bit = 0,
> +	.macrotile_mode = 1,
> +	.reg_bus_bw = 74000,
> +};
> +
>  static const struct msm_mdss_data sc7180_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> @@ -738,6 +748,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
>  	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
>  	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
> +	{ .compatible = "qcom,sar2130p-mdss", .data = &sar2130p_data },
>  	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
>  	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
>  	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
> 
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

