Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7706D58D50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/8c6DPu2k4ijNWg8lpFf2R+Gq1NZCkNmcROHAnplfI=; b=0nNAdTEUmU3FWKzAHf6r4RwLwk
	HIhCSsE7AO7o2lD4PijMTRZx68yIULqPYxYjeFEMG5dkas+v4+Mg2IxEuvIIB1E2PeDedIC5Zmyq8
	CnLK5/u9QtoMrxXFSVB5ta77yO8PzcybmNvWjtVwrnC9hacv53Jmk2QSuTkfglv0GhNlaPRic75kT
	UBxawlY2GJasOz6SPhdelhzu5yGBlKLxuFHZMxls/7EmogCBlHDEZ8+iTpyIhrMwm1gKFfUGR2XWl
	AlQK61a9KilYG1LA+09QXjtLRsIDJOJVmPSZkjhFIXaCwZ8d8f1zTcEv9C+FwGPvMQ/L4Ovn1bJZn
	xrcIULFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFa9z-00000008Jaq-3Pgf;
	Mon, 25 Nov 2024 14:33:55 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFa8K-00000008JF1-27Dx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 14:32:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43169902057so39801435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732545131; x=1733149931; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/8c6DPu2k4ijNWg8lpFf2R+Gq1NZCkNmcROHAnplfI=;
        b=hSyombAkmlYqhfQq045zVuUXhQWAHCoq9ZMISlItaZQrslNAiOHVeNCb4CRFHDKpeo
         nmSbyTYgreJLhtSmuc8mceIhjkfJw0vczddISVeh1eJkiHiysXcCrg+H+Q1G/S+mhO6V
         z79H9WBwV6GyST26mj1gUhsiZuqMz8AgPQUbsquecaVY0DcaRlahIxcXn8/rgDmFAg+x
         PB5VrZL0wQW560ZDsCSX/YeFbCPgnw/MShZLbLQhMJUKYxg8nKucKcxkWwrc8hU4RRy/
         lDpwU+jpztk98xh7X9CJWr3lutcQyzspPym7LiK/VaxKPH0Q6A6a8j6UxZ3fOKRBPaWX
         md+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732545131; x=1733149931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/8c6DPu2k4ijNWg8lpFf2R+Gq1NZCkNmcROHAnplfI=;
        b=gJH9Z28zOLJIgg9ZPZH0QbAdIfDiMjjlOVYqRH0CNqq0lqBlQ8s3roF/f3ksFiyt3V
         dvikKLt+PlsL8Nd13u+5sWJCgAft+cnMST95yEN2zfCw51I4HmFtVBF7LrkDBh97mXYN
         WbEtKF1o9vH78ODv6gCCe8IX77QMp2lwn8g9vVw0FCsMsM6kKcS5gmsuzl7t/2W8SRpl
         A+VYfT4V91aZ4Ho0o+0VjrBYD2tRE2Kg9DG5M5jvOYL5UQI0FRv7AmxWSrY1lIMpFDxw
         o7Md0SPEJFTpfvqGm0xew7q4iPOP/qnptftZJQlHScOkEAXnDBeS98hujr/4o4T5GeyI
         s9mQ==
X-Gm-Message-State: AOJu0YwfG8v6MJaXVSxC1MTsVHI1gmOe40CVOPcVOBbE/zA1JAvFRWZW
	hCEmPwVKMTTeWIJoiVf3JHfNBI0sR6ZJh0rTjx/AzDYqLRx50lZG+xApf9deR/E=
X-Gm-Gg: ASbGnctBW939gpCUmRphSEMKDqTFYUtDf7YiIA9hyIuBq0U/EiTL6adZRt86VBQfEZD
	7Ii+uheKVTDb7FrUCi9KZ6phYTu6JkeNs3Gywdcj3c8Ae5KZXj7LtsCrLSZNomv9RP6qvGFdO9p
	XKvjYsKqLvh/ZOPR5Gsx79+MrtAIlPUAbUfKQwdtN3V11k/t/StJBIGJG/y4XdbyoweugOTS+3f
	bCqTKe12LehW4xU2AiEF3cEoSFjJ3T6A04m0pm/bYzgrSWbs8d9g6PAOoP5jWQ=
X-Google-Smtp-Source: AGHT+IHvFWTGeuZ182YZQhvkHJraCRt6UEtAMR/W9d0QgcV1PITYVqpQK3Xa9vSX5dIa4gL2HNN+JA==
X-Received: by 2002:a05:600c:5124:b0:434:a350:207c with SMTP id 5b1f17b1804b1-434a3502244mr4736765e9.23.1732545131003;
        Mon, 25 Nov 2024 06:32:11 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349d2de6f9sm59791285e9.20.2024.11.25.06.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:32:10 -0800 (PST)
Message-ID: <68ec36e4-78c4-46e3-85b8-18f6e1e4361d@linaro.org>
Date: Mon, 25 Nov 2024 14:32:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] media: qcom: camss: Add support for camss driver
 on sc7280
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241112173032.2740119-1-quic_vikramsa@quicinc.com>
 <20241112173032.2740119-4-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241112173032.2740119-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_063212_560939_5CEE050C 
X-CRM114-Status: GOOD (  18.70  )
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

On 12/11/2024 17:30, Vikram Sharma wrote:
> From: Suresh Vankadara <quic_svankada@quicinc.com>
> 
> Add support for the camss driver on the sc7280 soc.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         |   5 +
>   .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
>   .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
>   drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
>   drivers/media/platform/qcom/camss/camss.c     | 309 ++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |   1 +
>   6 files changed, 323 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 7d2490c9de01..f341f7b7fd8a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -505,6 +505,10 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   	u32 val;
>   
>   	switch (csiphy->camss->res->version) {
> +	case CAMSS_7280:
> +		r = &lane_regs_sm8250[0][0];
> +		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
> +		break;
>   	case CAMSS_8250:
>   		r = &lane_regs_sm8250[0][0];
>   		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
> @@ -557,6 +561,7 @@ static bool csiphy_is_gen2(u32 version)
>   	bool ret = false;
>   
>   	switch (version) {
> +	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 5af2b382a843..3791c2d8a6cf 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -103,6 +103,11 @@ const struct csiphy_formats csiphy_formats_8x96 = {
>   	.formats = formats_8x96
>   };
>   
> +const struct csiphy_formats csiphy_formats_sc7280 = {
> +	.nformats = ARRAY_SIZE(formats_sdm845),
> +	.formats = formats_sdm845
> +};
> +
>   const struct csiphy_formats csiphy_formats_sdm845 = {
>   	.nformats = ARRAY_SIZE(formats_sdm845),
>   	.formats = formats_sdm845
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index eebc1ff1cfab..b6209bddfb61 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -111,6 +111,7 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy);
>   
>   extern const struct csiphy_formats csiphy_formats_8x16;
>   extern const struct csiphy_formats csiphy_formats_8x96;
> +extern const struct csiphy_formats csiphy_formats_sc7280;
>   extern const struct csiphy_formats csiphy_formats_sdm845;
>   
>   extern const struct csiphy_hw_ops csiphy_ops_2ph_1_0;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index f9e64cbacb20..152ca984663c 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -335,6 +335,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   		}
>   		break;
>   	case CAMSS_660:
> +	case CAMSS_7280:
>   	case CAMSS_8x96:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> @@ -1693,6 +1694,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	int ret = 8;
>   
>   	switch (vfe->camss->res->version) {
> +	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2d8efed51912..e1cda082a3b8 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1266,6 +1266,300 @@ static const struct resources_icc icc_res_sm8250[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_7280[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy0", "csiphy0_timer" },
> +		.clock_rate = { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy1", "csiphy1_timer" },
> +		.clock_rate = { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy2", "csiphy2_timer" },
> +		.clock_rate = { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy3", "csiphy3_timer" },
> +		.clock_rate = { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg = { "csiphy3" },
> +		.interrupt = { "csiphy3" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy4", "csiphy4_timer" },
> +		.clock_rate = { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg = { "csiphy4" },
> +		.interrupt = { "csiphy4" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +};
> +
> +static const struct camss_subdev_resources csid_res_7280[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },


Please move the regulator defintion to CSIPHY.

I'm OK with regulator name as-is since the match sm8250 which this work 
derives from.

Then you may add.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

