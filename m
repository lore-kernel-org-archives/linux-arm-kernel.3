Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553CDC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 14:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zOZIuYmUiChxW6T4ALeyJXTvfsAOgbBQ0gteD/iBsA=; b=UX+i8xjJuXpDjI04/usw8/ucl+
	/qr1TTMp+wzUKgxxC39/x5csFg6/4xS761nPs2eYBqZ/86T3hAmC6oPUCYYqypTi3oSKRYWzxAeu7
	5mT1xIVFhDhXb8I+9L5FfIzLxlLD/JUF9ksfLZNWkm7Y8JPa9uoa5MwDdDqQzcRONfeQOMOQZzQCc
	qvbv+mjX3OrQPsNbZ9IHkp+4yOapfez1AJyKuxxypRBHFB06qXVMeFfwCQW92FX33DwgueL0Ab8+q
	apV9VxVkxjsOPcmm1zJiHZ5yr+mxBYHW0yEHsUyX9C7U1sjok4dTFJQlaIaXqvJ7hmpahQesz69Ad
	AKTS3vdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOpO-0000000EfrB-42oN;
	Mon, 28 Jul 2025 14:27:46 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOez-0000000EeDz-1GOi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 14:17:02 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso8680274a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753712220; x=1754317020; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9zOZIuYmUiChxW6T4ALeyJXTvfsAOgbBQ0gteD/iBsA=;
        b=Jaeud56vETGjh6fxszzKGuKOP0NzEn0Cn0gc37NfgRqbrZyQg7O0meRq85jsfB28TO
         Rof8dwk496sl64Q3U5p90dLvY4esNtJweBus7LUFZwQHU/ZXqZt3LaBrww7mGXsxGYHQ
         ylWhmMcLTl40IkIwSGOitVqkCTwjIZ6J/379mal2I2XpOxZFyKhfZh1AB0sNp/B/bJf6
         zfDHaqvsScc9Fn5EN9YDFZDKd/48LFey6alQLb44W6MOUR/8PqBBCBpEN6WTA/WgQDP4
         5f7uabsNvt8cbozMw18ULsMp/11KvJ/KdLn5kvyJ2sjujtemKOeMo11hqKmUsqnSjwsm
         3tVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712220; x=1754317020;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9zOZIuYmUiChxW6T4ALeyJXTvfsAOgbBQ0gteD/iBsA=;
        b=wn6qCHczE1+CYk9PEQzCIybGHG74q4QTlHTCOPlkC48znQ/qgixRlon5EKhYOVaZ4+
         7mtGEQfpMjh9YXTxeLLlbcmo5+pWe7Zh0MCODB5U+Ip+6NaOwB5PkaycSGFPJ0sPGB5y
         TyMORNCE8hhiZvmduxm1nNK5mD1YoitSDW4hS1sw0DFwvwuiSUi1nqeLUPiEtwBx3DJT
         zgU4yF4IXOuIkZoX9u2qZvVrP4MbZPG/pEGQCAXVtRSm0OtZ9OdrujR6JQQhBNqEhgxM
         zGXeik5MI2522E3cDxrCpC/DMtaB19Ap67MPKE6n56l9m9PC4Lh7wKLP6uzHiRxxvo+9
         hJaw==
X-Gm-Message-State: AOJu0YwE9ZYiFN5NC0KvouA59xMPu37mAJqm+Og5zNTzohr1Zwjtn4oI
	qcG+R5vlOcKdLzBulSFFLqL5R3WrtH76pKs7cORuNlfUGkttDjFIE9CPZIa91waovbc=
X-Gm-Gg: ASbGncvDZvMpzdM0i5D0lC9O+T1UQQlk68C7W0fae9rIdgdBz0Jz+ErutrELHAy2heT
	qX7v+pYqREYCjKD61kYgeluRp063v18kXUvxksFN5AnvH0vAezh/hphH1dFqlE3U+tPW4nNs3YV
	rnIG0PhWV+Y11xnfbY7HR1NAKX1m8z9zdUlP3ENusExb58eLTcBfz5Rcx8annOnM9gdb9QQmJC3
	s/75yZ2RBThrpKT2n19d4vpyFmzIMbwV84sd2jSTYsQo8AOjkWbbbSi0Kk41nke5WD1LC4yPDir
	QLfkPpZhRBxyHAvMgn6L4fT2kXAJZnNBEOdfrBy0AdmtajVC9LKYIlHvO42iynNNGLrSCydH78U
	kAWhUuRNT06fcfDqoHOAaZrfA7/KdWrvAKDhnnRMuYy68Z04I2p6kQCGB520F83A=
X-Google-Smtp-Source: AGHT+IFF2jy8/UAzO9xj1temCnYhXpEOaVAh+jtnHHRa4ju0zBuFE/o752WTnfDGbuMr36P63jZ5aw==
X-Received: by 2002:a05:6402:42c8:b0:615:4227:3b2e with SMTP id 4fb4d7f45d1cf-61542273ce2mr3339176a12.23.1753712219586;
        Mon, 28 Jul 2025 07:16:59 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6153055f5a8sm1894547a12.48.2025.07.28.07.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:16:59 -0700 (PDT)
Message-ID: <4cb6fd0d-ae76-4a94-bbd1-ace79633c05e@linaro.org>
Date: Mon, 28 Jul 2025 15:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] media: qcom: camss: Enumerate resources for
 QCS8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
 <20250711131134.215382-8-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250711131134.215382-8-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_071701_345401_39B3AC68 
X-CRM114-Status: GOOD (  12.31  )
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
> Enumerate csiphy, csid and vfe resources for qcs8300.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 124bb56167cd..6cd6a5116f5e 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4569,7 +4569,14 @@ static const struct camss_resources msm8996_resources = {
>   static const struct camss_resources qcs8300_resources = {
>   	.version = CAMSS_8300,
>   	.pd_name = "top",
> +	.csiphy_res = csiphy_res_8300,
> +	.csid_res = csid_res_8300,
> +	.csid_wrapper_res = &csid_wrapper_res_qcs8300,
> +	.vfe_res = vfe_res_8300,
>   	.icc_res = icc_res_qcs8300,
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
> +	.csid_num = ARRAY_SIZE(csid_res_8300),
> +	.vfe_num = ARRAY_SIZE(vfe_res_8300),
>   	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
>   	.link_entities = camss_link_entities
>   };
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

