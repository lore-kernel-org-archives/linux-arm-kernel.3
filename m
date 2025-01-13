Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C366DE7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zQksN/TTsX9vOpJ8MEaX/p+hq09whruB8W4shax6NM=; b=W03JW1sxQby/EsQu7bj1A8Rkiy
	twamPQMnAAhh+CVnUervRuLUkMtUwjWU++GxPVsD1gpQNh2eQ589dCOcll41uK5s4ubeGbgQds0FG
	2hy8fo0pwiPQpjYByEnVPdCbWhK2W/qPDdDveKgkWfrlg2xqoAxuKECwJ1SD8zMzjslmO0j8Fk1LE
	/2ryAfcRBBSYyWj3c1nbLGRpMu3tpBVYJ5gSvmwsz3FWqcOmfW28E/xrARWSnxi8lBN2NJT5NYcvU
	VzxIXu07vAzsb//13ShEpiisCZ6MHPMaoxqffwQePIlPo9RZJBJkjiBPykFhyrLE3djPkamtsKquJ
	ptCGr1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIih-00000004wYQ-0f42;
	Mon, 13 Jan 2025 11:34:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIhR-00000004wEg-3AWO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:33:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43626213fffso31438865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 03:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736768019; x=1737372819; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zQksN/TTsX9vOpJ8MEaX/p+hq09whruB8W4shax6NM=;
        b=P04a6tBnyIeFBZygb+mJkw4eBjVdbQERHQa+Pf5zKoAc/cvOaByD285aqzxFAuUQum
         fBudR8OFzCnZN07MkWcsVzQSFlZfMHhydA01A7Gd96Okr8YIIT9/c0QXymSNjXsyptBt
         pfHEOWRhsRKjhcv3mXywhx2xkiwb8kebCIyXiGbUwwQaDrMMsTvsDOLygWQnpPf8BgCc
         /CC8fH0BGIKmoj4b8XfJsCBbdq2Et0ugsq/p3WeNhN4xWL3Tz83fViWcPWecLtjrZQqj
         CJ7lJYj6AevZgY1t/wTnv2n6Dp49smDTKZEIfiyX1a0itciIWBf6UXZ8NwKchIf+aBOy
         Z03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736768019; x=1737372819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zQksN/TTsX9vOpJ8MEaX/p+hq09whruB8W4shax6NM=;
        b=eM1NZFYRE++6AlicEv+/u/ycXSDg1zKDv06C+eRcD8t6gOW8+AAObcFWskGVF9ppKg
         X5NUEix0SLxyhlzd2QDd1g/bj4RcqmTowM6T8V8S3YQwjVMBfFzt228UyIXcPqSu9QFj
         2jQTfauSiM3YZGyYsmw1/2uoi504pQB8DeaNsk+r7iWhuYZiRUrz63UQTsH1Lcx0wtAD
         SuKsc1O1NXZJsCcZDqtkC8gqnTKhs2bAlt1kf1umpZwuYCqDTt3GfS/6emfPlp+cpf90
         41ffjrchs4ZhomrBUToaKMsrihWKn14nRhYoYRA621YFPihtZlp4mtjQkBze6eCefcQm
         G5Dw==
X-Forwarded-Encrypted: i=1; AJvYcCX//b8mAoAfKl3G+peVrN5AqY89Pb4NYjC61QdpiW4gdqltLuZB51SilJprfzJNogFMFbST78/3A8cR7ASp/xcM@lists.infradead.org
X-Gm-Message-State: AOJu0YwpYtuZnkUNMx93dS+3uYqV/d2md1eTvEkYo0H93SCHBgD7xyJ5
	BSAA9sFgBZCW8kcvwpruzMI/3PgbOetoJBWGe6F4nalDZ5YMgCsceqo1Oiq0CE0=
X-Gm-Gg: ASbGncsWagb16WQacdox13v76PLFFLEdrk2vcvOn+7MoryRS7u6olJMycTr4Tzo87am
	W5+kgjK/ZcMrv0cDn66bXkOqEp4SKGB3no2jQFdOgyHwa5UQmTxNcPskXMa8q7iy30Zndn7bTwE
	W/pGxFZrZXumU8vSe0tb+cana3+Jfej/ILJGl7Y4DpTU5lEd42AW9wYdNjC4oFGU5mdPRBgGitt
	gQ65XgmRBclKcVs2dA4QsU2Mn/fYNP3q9vyILDuvL5cbpjuI6B+/Z0iPAcstjV6ewM/
X-Google-Smtp-Source: AGHT+IErNZ292W88Ml7JDMJHkUe6E1sEG0FgJvIY7MzDkFid6VFTjBJklMQW67SGtV9vc4HOI/jALA==
X-Received: by 2002:a05:6000:45a0:b0:386:3327:4f21 with SMTP id ffacd0b85a97d-38a8b0f8507mr10910143f8f.27.1736768019544;
        Mon, 13 Jan 2025 03:33:39 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d01dsm11832630f8f.9.2025.01.13.03.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 03:33:39 -0800 (PST)
Message-ID: <7f342ebe-6c82-4ae6-b59d-399ec3018838@linaro.org>
Date: Mon, 13 Jan 2025 11:33:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] Coresight: Add support for new APB clock name
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20241226011022.1477160-1-quic_jiegan@quicinc.com>
 <20241226011022.1477160-2-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241226011022.1477160-2-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_033341_805844_69885735 
X-CRM114-Status: GOOD (  15.40  )
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



On 26/12/2024 1:10 am, Jie Gan wrote:
> Add support for new APB clock-name. If the function fails
> to obtain the clock with the name "apb_pclk", it will
> attempt to acquire the clock with the name "apb".
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   include/linux/coresight.h | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 17276965ff1d..157c4bd009a1 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -459,8 +459,11 @@ static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
>   	int ret;
>   
>   	pclk = clk_get(dev, "apb_pclk");
> -	if (IS_ERR(pclk))
> -		return NULL;
> +	if (IS_ERR(pclk)) {
> +		pclk = clk_get(dev, "apb");
> +		if (IS_ERR(pclk))
> +			return NULL;
> +	}
>   
>   	ret = clk_prepare_enable(pclk);
>   	if (ret) {

Reviewed-by: James Clark <james.clark@linaro.org>


