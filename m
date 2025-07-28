Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A50C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 14:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n36b9ILb11wJVdUKrW9GQVceZTen+jKpbT7ykNbDKSU=; b=F3FipnbFrZOwEyL9PWhGi87hDw
	emHCuJrbJEYhrQ+c901EQtUVcTCY/YRFSztZzK0zO1+YcxFPX+9cxZOYrTDNFvSQXTPH1ZGjwL6Qw
	R32svsO7JkXEKdeQMBYTatZkJtNuO3QB4IYTPH4k06lqVAlszIcTCbbL+GklZPrxa1N5Z6f6VRTT5
	IH0UBxmDCOkmwrsuDvM27KdYLRH7sg1VCA3j9ZraspffI4/qRSTk3tEBUwx2g1iU+UVDEzJasCDiH
	3hEtlTbGdrWshvKrwBqNZwg8vQaWAC+yh6txycfBQ7vBy89LVo53r+Og8CzFrHAFyAYA42UQCkML2
	Xj70772Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOQu-0000000Ebab-17ER;
	Mon, 28 Jul 2025 14:02:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOEW-0000000EZ5b-0xYx
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Jul 2025 13:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=n36b9ILb11wJVdUKrW9GQVceZTen+jKpbT7ykNbDKSU=; b=VlKShZ3U8xlI+vFa+W/VtFfXul
	9oJcJdgUQa3bQEaJnnrInzqrz/1I6RRDHsVpTM5ifWN5bvE08UqBsoXTOp+P3YkY5NjPaMR4cLamE
	M9Ot+VL4l5jRJ3EsHHUgbEA+i+YQdjtE8z6EChfxLVGmIAkf9MxxgVIwwMShpwD2Sts5rHLDPXnoU
	Z+RvKvFTw44ohdvU3sj4TJr/yFKOot0sz4cXZR8ZXcMUp6jvuwy6nfmR8sycqPW8Qw52+dJp7xyTK
	qVR3FurdFOD/fXB99r4uhs2y//mezC5SCuri0hcfBCYwc9Jmj4Stne/tdaZCv5i5WlYBkyVTW5dqH
	Do6uARjQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOES-0000000CUQx-3GSm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 13:49:38 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3b780bdda21so2124414f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 06:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753710574; x=1754315374; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n36b9ILb11wJVdUKrW9GQVceZTen+jKpbT7ykNbDKSU=;
        b=Dj8mzvRVH1UqfyolRgm4TfbLqofADOiiG+AvruoCnbRWvJmfRL8tklUKNw6QU14CQJ
         kVvBbS67r/WWKaHZ3SsqTrV1skukmcksytN7Gt3WnBRHXZh2FnsyXx8kualPJVtagd1X
         V/V4jAqleD4SdUuYqEw/mwcbYChiynHC0vSUrLI1WFaq6o0T/taf+oDE3dqxgEhxwjX/
         qrVx6UZqckdPO7EVK/km/czvlonvyAJnq6qg1tgRii1KNT7f2fbzaJMhQXpgwrAWjVr9
         4KrJnU0ojRBxXocrVD2ORfcCZEYYASaiofAKMZGOkV9kVl8mxf9Sd3qq1wh+m+8tWsnD
         qNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710574; x=1754315374;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n36b9ILb11wJVdUKrW9GQVceZTen+jKpbT7ykNbDKSU=;
        b=l4w89mQNBdpfkzdWqRGvKWr7GfsVMvqti+XCmFtvzQ/zMJh4EHuTecQDj/gHonQ4ri
         OnJ5k9N+PmQufIMjs0Kgq7OoIOd3fpcn4wMLZX4Z+3ALhuJEwsgNHwX+EwqtjiwHcXc3
         SHQj1so/My4E0gAoPcPJ5oNaXQLkNXy3tK5bUs69gpCq9RhXAUSGuDi3MqhSpVWrc/dd
         zlIBRPlSb5jtNHiDF75xe5IlRbNkQ7EcI5b2XxpOHDyMhl/f0CofoWxn0Y8tgYYU0lj7
         NajRWFzYjcogVzPj3/qRqvybTa5x2wXW2mlHSoBkjhmJhSTW9ADZuRKdA7NYTOCOzh+X
         0SJg==
X-Gm-Message-State: AOJu0YyCfiuW+kAvVtKZNZxuqlHYcHrQZ5wjbseCKw857CcHR3NVjWp4
	GDbriM2LsixyC0KaoIUWrHcFP3qlQFWFphbXXF4F9XXyMluMP8e79bUHeStWVlgMjn4=
X-Gm-Gg: ASbGncucIDyHeyzOeLdAmDfBYo0nyuFN/zmCPBDg3mF9br3ckcu0ZI0HQT2ix1KRds8
	JVr6u72tM08SmSpGeS6fDoj54/QgICkq+HdLInmaim7zhWOXhOCxtS718q65n+nafSeFR49MNc0
	wgzwreXVgxNaEuLXih/tIprJEqB94D4tYmRWJPNsiIfyC31PgZZzOqzQyb3g4u3jM3R3C/igq3L
	iKEhuw+OtcS7GWHyKhPFoMkxRB1QwDy2pZrGJNhn0/GOQZKWMArgRdSG+LWYmLah3ycHchgJdXN
	MZ/uZ2NPrfLc8OBTU/t7ySH1dikWhvClrl8FDFGdVwm+p2SzEeRgav2WQzMAeEVOylPDADoX9dc
	U7npRuSwoFXkHQPantNANZIa00JhPH8eAgJxXRYs5HmnwIqrKr9rx9GG9Anlhwus=
X-Google-Smtp-Source: AGHT+IGQ2KHXqDEDGEp9BnTNFiPQGdAVT8Ouj1BVUG/QhZCfM9UZZgtqTuoNYoWMo1tQOuCn7aFqvw==
X-Received: by 2002:a05:6000:645:b0:3b7:7d57:575a with SMTP id ffacd0b85a97d-3b77d575a53mr4407496f8f.29.1753710574286;
        Mon, 28 Jul 2025 06:49:34 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b785258135sm5093611f8f.42.2025.07.28.06.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 06:49:33 -0700 (PDT)
Message-ID: <3b0e880b-b85a-442e-9ebc-377685794ef1@linaro.org>
Date: Mon, 28 Jul 2025 14:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] media: qcom: camss: Add sa8775p compatible
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-6-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-6-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_144937_000445_C75996F1 
X-CRM114-Status: GOOD (  15.83  )
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

On 03/07/2025 18:19, Vikram Sharma wrote:
> Add CAMSS_8775P enum, SA8775P compatible and sa8775p camss driver
> private data, the private data just include some basic information
> now, later changes will enumerate with csiphy, tpg, csid and vfe
> resources.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 23 +++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 310b5cd8de5f..3122a29891c2 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2483,6 +2483,19 @@ static const struct resources_icc icc_res_sm8550[] = {
>   	},
>   };
>   
> +static const struct resources_icc icc_res_sa8775p[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 38400,
> +		.icc_bw_tbl.peak = 76800,
> +	},
> +	{
> +		.name = "hf_0",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -3753,6 +3766,15 @@ static const struct camss_resources msm8996_resources = {
>   	.link_entities = camss_link_entities
>   };
>   
> +
> +static const struct camss_resources sa8775p_resources = {
> +	.version = CAMSS_8775P,
> +	.pd_name = "top",
> +	.icc_res = icc_res_sa8775p,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
> +	.link_entities = camss_link_entities
> +};
> +
>   static const struct camss_resources sdm660_resources = {
>   	.version = CAMSS_660,
>   	.csiphy_res = csiphy_res_660,
> @@ -3865,6 +3887,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
> +	{ .compatible = "qcom,sa8775p-camss", .data = &sa8775p_resources },
>   	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
>   	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
>   	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 63c0afee154a..345479f6feba 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -86,6 +86,7 @@ enum camss_version {
>   	CAMSS_8280XP,
>   	CAMSS_845,
>   	CAMSS_8550,
> +	CAMSS_8775P,
>   	CAMSS_X1E80100,
>   };
>   
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

