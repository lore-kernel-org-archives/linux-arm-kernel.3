Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBB3D58D50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwCdh/lVFSl+tyIgtOc72WNgOOnH15cv8cN3/KVwlSs=; b=UMgXFWwzKV8deDRPfZWz1yfK1M
	yVDWRwsvTMqBRm65YXCLbzoFOR3Gu5DKt+wp5p0b+9g9RXwkQcrznoaO/XTLwuL1xZA079pq3DyOi
	JxoZU3Bdx6jhAw2OO4GH9ck5Wu1Xa+E/a1S6flNZtEBbkwnPvgcErFqi4Myfn+py4UAL581r8CFEa
	a1edGZ4d6aV9CDMmV/IFDiBnd4k/ZYu1amOpYbnnKZs3/driUCzvFMe9ToICKmI8MLj5Vm64ScjXY
	IqNruVZo4NSRfm5Cc9dqx6y0vcpX6EgqD5luHNJTva5RQVvjZ9l7y4Ibq+NFH0habDSG7bGJrcgPe
	bEdDuPyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFa5G-00000008IbU-1lFy;
	Mon, 25 Nov 2024 14:29:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFa4I-00000008ILA-1YlP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 14:28:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4349e4e252dso10967605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732544881; x=1733149681; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OwCdh/lVFSl+tyIgtOc72WNgOOnH15cv8cN3/KVwlSs=;
        b=VWQXrshsw6DiW8jHWfCZduY65JLxHUCDe1428e0WEumiYK58faMXodpurGL+N+3/Uw
         Dab6CpqttnNIT0DzZhuQmPYgurNV+J1u0AyhoK2YOdCR+sPK0A/nEzog3nZ17paLCoKg
         XwMPuTmyRzYapttRn+G+Fy9J5HXRDhirAaO7hNwwpT6krV44ev3DqTBRXSi3LtUPHfgm
         6maFCC4EdyHv2yGhaanvTMNcAntmL1bli2z7XvCdj+D8kC0tmlw9t9mUckqmL9QuvgJf
         3a10ON2LiHmCEHXksGtRQnhTMvJf48YZEyjOnu6cbdGmfoYAVzgUYEo4Sf6wlkyBSLSW
         6RrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544881; x=1733149681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OwCdh/lVFSl+tyIgtOc72WNgOOnH15cv8cN3/KVwlSs=;
        b=RhpidaS5vM4V/73hddsNWri18LR1sF0DrA/inogY4AwVMRRRP7CZ6hB9BqIoc4x7wS
         CLux0Qugq/IGv8klejW2cqa6Z6z/sj9z86T6UOU3TmE73fH4sP4Yg6M5POG1cO5Nflq2
         n/lfMrqiWqPfa3HsVaT6fJF23yVPcneLLtZzoM6GRrgxMYrJnzKkJbqtm4XaL2IL/oYK
         0foNZTTE1V03yIWfJlGVZe071ignUe4XNakcM5Xw0/GftyiKCCPfSunCp6DpnWSlhaN+
         pCN1ghi/1ZxXwID+XAhmK0kAumUp1aHoT2RBZSMtMs51KFTX33P+KiV40dCuUjkDklvY
         WlEQ==
X-Gm-Message-State: AOJu0YyHS9SNwuz8K+AsxNAnk4nLOA0YRld0MLum4Bw/jnKT7Bbz3R87
	bZwg4XrrDnfJtUsQQoXIFosYbyHfjd8vlCUXaDMHbj7kmb4MMATnUGLSRjVgjyA=
X-Gm-Gg: ASbGncuaO55xCvCXYcNxvVmHaM76FidPboNLn/wBqJrl1ZwWXhdgM8/cYf3Nh5YOM0+
	17ioQKBybEbNhhzjieUt4k4/y1tNjJC7QjiB890yXqlue6jxg+7ig4XnQTEykM/i7eTdOhA137o
	44nT5ipCKjpH1reOdeqK6pufW1ur6txR+RK0nWfUeNS9HrumfXw8BHF8FiN6g8A/E6W49LQep18
	xDNIGCjFaOt+SRxaST2HAkNa5m6V7DN6t/6JzLWITVhq5+9QsBJXy7d3huwBcw=
X-Google-Smtp-Source: AGHT+IHKFtw2FkrVFJBqO69N4BGShQKgr544JrHs0mrkZfzSa0FQpSavaB/3c2ze4SNlzhuV4W4AWg==
X-Received: by 2002:a05:600c:3b94:b0:433:6cf9:5e65 with SMTP id 5b1f17b1804b1-433ce4af3bfmr106924175e9.29.1732544880864;
        Mon, 25 Nov 2024 06:28:00 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b0139b22sm198293355e9.0.2024.11.25.06.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:28:00 -0800 (PST)
Message-ID: <b2d34144-bad0-4d12-86eb-08d17d9f2120@linaro.org>
Date: Mon, 25 Nov 2024 14:27:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] media: qcom: camss: Sort camss version enums and
 compatible strings
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
 <20241112173032.2740119-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241112173032.2740119-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_062802_421683_FC299928 
X-CRM114-Status: GOOD (  16.17  )
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
> Sort CAMSS version enums and compatible strings alphanumerically.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 10 +++++-----
>   drivers/media/platform/qcom/camss/camss-vfe.c          |  6 +++---
>   drivers/media/platform/qcom/camss/camss.c              |  2 +-
>   drivers/media/platform/qcom/camss/camss.h              |  4 ++--
>   4 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index df7e93a5a4f6..7d2490c9de01 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -505,10 +505,6 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   	u32 val;
>   
>   	switch (csiphy->camss->res->version) {
> -	case CAMSS_845:
> -		r = &lane_regs_sdm845[0][0];
> -		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
> -		break;
>   	case CAMSS_8250:
>   		r = &lane_regs_sm8250[0][0];
>   		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
> @@ -517,6 +513,10 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   		r = &lane_regs_sc8280xp[0][0];
>   		array_size = ARRAY_SIZE(lane_regs_sc8280xp[0]);
>   		break;
> +	case CAMSS_845:
> +		r = &lane_regs_sdm845[0][0];
> +		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
> +		break;
>   	default:
>   		WARN(1, "unknown cspi version\n");
>   		return;
> @@ -557,9 +557,9 @@ static bool csiphy_is_gen2(u32 version)
>   	bool ret = false;
>   
>   	switch (version) {
> -	case CAMSS_845:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_845:
>   		ret = true;
>   		break;
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index d801275228b0..f9e64cbacb20 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -334,11 +334,11 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   			return sink_code;
>   		}
>   		break;
> -	case CAMSS_8x96:
>   	case CAMSS_660:
> -	case CAMSS_845:
> +	case CAMSS_8x96:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_845:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
>   		{
> @@ -1693,9 +1693,9 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	int ret = 8;
>   
>   	switch (vfe->camss->res->version) {
> -	case CAMSS_845:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_845:
>   		ret = 16;
>   		break;
>   	default:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 12778846b2ca..2d8efed51912 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2692,10 +2692,10 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
> +	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
>   	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
> -	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
>   	{ }
>   };
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index c50cf7dc81f2..bdc11d6d2203 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -77,13 +77,13 @@ enum pm_domain {
>   };
>   
>   enum camss_version {
> +	CAMSS_660,
>   	CAMSS_8x16,
>   	CAMSS_8x53,
>   	CAMSS_8x96,
> -	CAMSS_660,
> -	CAMSS_845,
>   	CAMSS_8250,
>   	CAMSS_8280XP,
> +	CAMSS_845,
>   };
>   
>   enum icc_count {

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

