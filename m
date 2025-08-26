Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034A3CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaOTCniziyeazJJYkYE2FSNDiQRbUyarefsu1PbqX/E=; b=J70/9T6BG5X66U3G2Tn2/Rs5i1
	K8s973eWhLBG8W5l9lxXD84LJV0r8jbWXP5IOBmxGKIL7jy5YcU/wVyWBtIyXnxBvhjpT+10gYrYl
	igCs1xNIIfvPGxxOq3DMGYKnWYo0ugFiZ1fAWDtgNGRtGwuRNtA4rkGnenwaE4NslhgLmkxgyap6q
	ZPwMqgb7JcGmsWQgy3Vu/GgxxZZR6R5O+v8H2DOB1BbGeleoRneDWv/L25oyId5eBKyAw0Lh14J6r
	zl4+IJn4mD+Yyv91TMWckSGrgUn81hUPPVwzpjWtxM9+MoMBawTzNduCK84X59AJdUQqgbiyTugsu
	tt5mFBkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpyo-0000000BOOC-1Co6;
	Tue, 26 Aug 2025 09:28:38 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpqb-0000000BKkF-3wlP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:20:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3c7aa4ce85dso1513378f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756200008; x=1756804808; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eaOTCniziyeazJJYkYE2FSNDiQRbUyarefsu1PbqX/E=;
        b=XeVePUoF91RQggTnOfsOPDmPHr0aTZnpn5J+1IcsfLIHCLK0tPNQZVAQncWqfRfsfw
         TqyNW1KlvDm0YfVcIGX76nedD70gTyvaEwiI1wZAjxwIrZoOtGh9DT50X08NJW+128d1
         NLmT0Mpb0jOEh82QavpRNpcizQvj3Jw53e5enSxV89k5kn5DOIovcT81/Ie4QUYWMM3M
         DWPDgqhM08JO1TOYdm1z5pIBF+ZPiH0zlC1KwrDVH8Bc1wwtqgzHHasgOPW2M+g+iIWS
         /1dl/Oz3atuPIUezEeUB5OFGwOWkcyFAIk4kvfkvTepqlktfyZ12/KWcDCyuX3gw6X7y
         O8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200008; x=1756804808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eaOTCniziyeazJJYkYE2FSNDiQRbUyarefsu1PbqX/E=;
        b=RfsIwUIjKYvidZwuk0hyavlZFrtXWpc6uWLJ62XlQahk03HfUh0Vogzdd+Slgv8DpF
         1OC5cv2LXmmAGlKxev5xWjy6NLcFd8pgSpxwI3Mhg1plQaHEgI6dAqayCO0ilDGamNcZ
         rcqkgxJ1zmg6BRlk2Wt+wNmHv8B/VGsHufgv92P4bgYB8nOIMoFzGWOLiiSmsOyzXysE
         aVAUjPM5Rm6YyvVeuvuGAR/UUMYagWKGuUaLg0r0I+RVKQGWmLgq0oGf7Rfd1rVMet9t
         2t8qHGWyjV1LuGIISgky4c2SOR0LvXB7MPkMtay1D3LQ26wxqc8kCD81K2mDsa/Y9Hav
         fNVg==
X-Forwarded-Encrypted: i=1; AJvYcCUvr9UtmpalY7+M/AEW3zVDuLW99CqfuFRbOkln/EhmUj1OTZK+rcCxUfA/WEob34CBNVF8EooiUNYJW4a7Cjfn@lists.infradead.org
X-Gm-Message-State: AOJu0YwaTktz1sZEIGPHFinQYklUYxSGBgmSj4hiDyudhp59U7oUsxPt
	xupRMrvCzILiYdXtKj/XpGT0c5o/54MigPGSvfREciWCLMtANLB7PqwDLk8Wn0zsM6Q=
X-Gm-Gg: ASbGncu194OVohDJW+h+QfXC4gp1aLn0Rx/MmghDWgpDK7whQLHm4BA9UycC6HF3nrZ
	Pa/0DkLeYnNhlUvwFIu8yy8WzQgyXVqKY5At1VWM/oiQsk2rU9bQeYwmj54GxE6dcJ+LaFGS+/w
	2KZwH+ArK7zHPavYf68s5K3N+b9GCzHjiZqnoDR4faYuD0ufd7cKjDlkVIPSi7aV28PrLr2zBvS
	3KEu739JfRXeXbGjJP8tXf5oYkwPVy6Scj5SmVsoK5obdQF9Iv0x5vxYvy4ttLJeTq4DDz4jGmI
	Qgnn4nR0P8+Y5Ri22RLuUaRH3tFvAU3KoFbsQgy5t2y6OuAh6ZDrBLJajcQbSgn+EbsVd6Fq1f9
	mnr7v7sX+r5HOzmjzdQUxDejGUxg/3oHz1EuFvg==
X-Google-Smtp-Source: AGHT+IG3O4nYqPPZOTd55R1CACz78Gxy+VGwYkBeN2scTg38UYjMhu5WNHrdDEH4ezcSuJRTDw+VSw==
X-Received: by 2002:a05:6000:2c04:b0:3c9:469d:c092 with SMTP id ffacd0b85a97d-3c9469dc2b7mr5298437f8f.16.1756200008054;
        Tue, 26 Aug 2025 02:20:08 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211b19sm15708101f8f.39.2025.08.26.02.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:20:07 -0700 (PDT)
Message-ID: <66cfff9c-e0ec-4171-b62d-80d6139c42f3@linaro.org>
Date: Tue, 26 Aug 2025 10:20:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] coresight: tpda: add function to configure
 TPDA_SYNCR register
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-3-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250826070150.5603-3-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_022010_002608_6886AE1B 
X-CRM114-Status: GOOD (  21.69  )
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



On 26/08/2025 8:01 am, Jie Gan wrote:
> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
> 
> The TPDA_SYNCR register defines the frequency at which TPDA generates
> ASYNC packets, enabling userspace tools to accurately parse each valid
> packet.
> 
> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpda.c | 15 +++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h |  1 +
>   2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index cc254d53b8ec..9e623732d1e7 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -189,6 +189,18 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
>   		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>   }
>   
> +static void tpda_enable_post_port(struct tpda_drvdata *drvdata)
> +{
> +	uint32_t val;

Minor nit: this is inconsistent with u32 used elsewhere in this file.

> +
> +	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
> +	/* Clear the mode */
> +	val = val & ~TPDA_MODE_CTRL;

&=

> +	/* Program the counter value */
> +	val = val | 0xFFF;

|=

Defining a field would be a bit nicer here. Like:

val |= FIELD_PREP(TPDA_SYNCR_COUNTER, UINT32_MAX);

Assuming you wanted to set all bits, and 0xFFF isn't some specific value.

> +	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
> +}
> +
>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>   {
>   	u32 val;
> @@ -227,6 +239,9 @@ static int __tpda_enable(struct tpda_drvdata *drvdata, int port)
>   		tpda_enable_pre_port(drvdata);
>   
>   	ret = tpda_enable_port(drvdata, port);
> +	if (!drvdata->csdev->refcnt)
> +		tpda_enable_post_port(drvdata);

Any reason this can't be done on tpda_enable_pre_port()? It has the same 
logic where it's only done once for the first port.

If it can't be done there you should add a comment saying why it must be 
done after enabling the first port.

> +
>   	CS_LOCK(drvdata->base);
>   
>   	return ret;
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index b651372d4c88..00d146960d81 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.h
> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
> @@ -9,6 +9,7 @@
>   #define TPDA_CR			(0x000)
>   #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
>   #define TPDA_FPID_CR		(0x084)
> +#define TPDA_SYNCR		(0x08C)
>   
>   /* Cross trigger FREQ packets timestamp bit */
>   #define TPDA_CR_FREQTS		BIT(2)


