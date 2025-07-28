Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48C9C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 14:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jk6mSRTMsB/OIBvGlw4Rzm6kh4ycxWxzbNU2i/NsHgM=; b=osBM63N8ezi5b+viORgos3YODd
	1xH3qnRv5hmK2I2AP/82xm2McIXLdBXQi9/LaiEFohEpXRzMV6cfzhDLdKuwTRdZPv2dFQnTOVER+
	RNqRECcXXrmQL6lePR7//W7fi7P778BCpz0mA4AKqQbgt+O85Zgf56dJgtr1zkqpc6E1gnh7XECD2
	cj4YNDS8XVefB51y9S9kaJrsBBok99efM5mudXt9Hr74wDoG+IjXNITyJ2598XKHIIbFfzkaJ+b1L
	PU3n82ka/PNqS9NJgvAs7CbLm9P53dgaZUkDjPGxIgQuEv5zIPIeNrK42VT63x3eIAFVe+RIIyu5O
	9kMsKXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOfh-0000000EeLR-3UK8;
	Mon, 28 Jul 2025 14:17:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOas-0000000EdNZ-2sn1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Jul 2025 14:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jk6mSRTMsB/OIBvGlw4Rzm6kh4ycxWxzbNU2i/NsHgM=; b=Ho1fcOVcLHJhCwmuXFAMlQXUvq
	mS1qteCVA7BCWMH0/JR0042sUXMH4xkZBoPr8s6fPmXJtORjj6xAX9b69NZ5SVS1UlyX5KApBFKs7
	nFEYUkKxeOvMwOW8M/WQvvoBbYwn0EV3WqfzeFAzj3wQzfiw68pY30bU8nNHYeTTZR/snZF+nGkbe
	v94eOguuKSTsTlG7Caihuz4lGiKlRjTX5wUnBnOiLhg9ZY8jB7GbDjg6mrdRILEs3ZHWt1Sx6dEfd
	8PlTKnjzhKRloBfCvuUdQFTJy7H4xvS7lE9Eay/R0iszxEkhb3k3AG3XIKHcdDE8Lx4d/lpEvZCUR
	7ZgHQZjQ==;
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOap-0000000CUeg-2Vbr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 14:12:45 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ae6fa02d8feso680576366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753711962; x=1754316762; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jk6mSRTMsB/OIBvGlw4Rzm6kh4ycxWxzbNU2i/NsHgM=;
        b=obk27c2KQYul5K4Lqi7n9NGkfUNB59bK6kDli2UojtB+I7CbuwwErITIRsVhZhNS5F
         tgIhiZE9OKx7gPxrInIxHLv/9APU5M2OkdpNako5wAT+By67gyO+ID7s0amGZ+n0v8xV
         i7GxEG+yF8IeDwrZaKbFr7WbpXdxDC67pGKlFyDhhHD/0pVEEm50dy8m5LOeuKQ4wHRP
         UvP+LcrhPQGdfaCCjMEDNGRsVXgFfZphOhGFfO19lO9OrzrCkHHSvfPoQ11WH21flfIZ
         8FdYTg/8bAI1Q/m4snB4rQfkDo06tLyVIBNJPPbbZoZ8ebvujuwy0fvBTcu7tQzT3gKr
         Haog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753711962; x=1754316762;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jk6mSRTMsB/OIBvGlw4Rzm6kh4ycxWxzbNU2i/NsHgM=;
        b=Ql+JV8NxEnuEt5HALAd9DQb3aJcPsV/lM/vJ9z1BEksSovVvCoMzh8WDCYy5wBHbGZ
         TfBuqQuRSITuwrHgZQU6rO+JV0zAWzaqFWSeiK5vz3MTCRTcP+9W0nCRCzfLfXCzbcBB
         6xn0K4nXNx90GisOrCb6IYgFTYgNr+8yCo5W4kNnPyx+3bjvSlCRT1wreUw42utszW4s
         wDWrJ7NAcvUWqy5E9U3VyDs1kjVkqgwfPoc5vl9mCNi65C67EIec+nudPVaXZiZhGPw9
         Y3njpLJ9ZiTvxIwmPobWgj/koq5g/Pg4iwWUgz1qMhfBWJRsGtt3311Xw+CO8/Nur46T
         5HWg==
X-Gm-Message-State: AOJu0Yzi5gQiYrNbb4AaJmOlOhYOUUV0nLNWDImt7m8FDE9Sat65uIVR
	XNRsNtji6lijHoq23GsW961ujag+lYiFw5ptKZW4MkGsYeZjzsf257S2TsNJ7W4nPZg=
X-Gm-Gg: ASbGncuWJLKq/6YO+iHYr9owxHrlsHO+dU1YugeRTq1QvNPqlHTyUrIdzme/DJwKgH1
	unRwjtFPnc7Km5QtX+vrbthnqQOfMTWqBoJlhhETCjqGeaI82f0ZKmebI+QfNCQE1G46ojMDFKl
	1qYkzshB4Mx2KCiB54tRL+KF96gWjmupOUtlXM3pOmV3ILmkCj4wUmn5mWwueu7/+AxBV2dAC25
	OuID6Vu0DUSOLnXDsF0xFdSltVmQmq3xuisklMKB8iMmr6UqzQEB2Sl1qu8BWpD6gBDilAP7zT5
	rT4/1frtZd08zfAVyK0Y+cUdKISg5Cy39Dqh0E68xeLlPMAWd4557fMCMiefyVEqkmZUu6MlTMj
	OyITLZrBitM4rsyAfxm+uJkjUCRpOkTmCq2QEHs1Lftgw7GDXBJkk+TO1E4Kmpbk=
X-Google-Smtp-Source: AGHT+IFqxJRE1QKHYBFZxQpyOgr6z9UdMOEOO88xTViMCt0rV+PU4AVbmvZ0211adT45N0kyk5+wKg==
X-Received: by 2002:a17:907:96a0:b0:ae3:7058:7b48 with SMTP id a640c23a62f3a-af61ce932camr1392836266b.25.1753711961420;
        Mon, 28 Jul 2025 07:12:41 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358a1858sm431613166b.45.2025.07.28.07.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:12:40 -0700 (PDT)
Message-ID: <dca47ca3-d5f7-4b2e-9611-dd195ee149fc@linaro.org>
Date: Mon, 28 Jul 2025 15:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Add qcs8300 compatible
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
 <20250711131134.215382-4-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250711131134.215382-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_151243_815711_36D0B447 
X-CRM114-Status: GOOD (  15.55  )
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

On 11/07/2025 14:11, Vikram Sharma wrote:
> Add CAMSS_8300 enum, QCS8300 compatible and qcs8300 camss driver
> private data, the private data just include some basic information
> for now, later changes will enumerate with csiphy, tpg, csid and
> vfe resources.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 21 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 6f5b70bcf488..5211367b535d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2898,6 +2898,19 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	},
>   };
>   
> +static const struct resources_icc icc_res_qcs8300[] = {
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
>   static const struct resources_icc icc_res_sa8775p[] = {
>   	{
>   		.name = "ahb",
> @@ -4180,6 +4193,13 @@ static const struct camss_resources msm8996_resources = {
>   	.link_entities = camss_link_entities
>   };
>   
> +static const struct camss_resources qcs8300_resources = {
> +	.version = CAMSS_8300,
> +	.pd_name = "top",
> +	.icc_res = icc_res_qcs8300,
> +	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
> +	.link_entities = camss_link_entities
> +};
>   
>   static const struct camss_resources sa8775p_resources = {
>   	.version = CAMSS_8775P,
> @@ -4308,6 +4328,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
> +	{ .compatible = "qcom,qcs8300-camss", .data = &qcs8300_resources },
>   	{ .compatible = "qcom,sa8775p-camss", .data = &sa8775p_resources },
>   	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
>   	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 345479f6feba..b5600a8b2c4b 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -84,6 +84,7 @@ enum camss_version {
>   	CAMSS_8x96,
>   	CAMSS_8250,
>   	CAMSS_8280XP,
> +	CAMSS_8300,
>   	CAMSS_845,
>   	CAMSS_8550,
>   	CAMSS_8775P,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

