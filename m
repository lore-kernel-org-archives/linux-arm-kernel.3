Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29FDCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mker59khNl9LO6XVA193w6BS5zlp+w383B89UYOvyb4=; b=ROu+89jgzapIN58Q9DrhS4kHnZ
	d8E4rTyCRAVA/Y9tfvmeYaQcL/uKpxy/IMw/G4pziI1+vK9NZs4DSDoLnyQ3sYW2ZGp9xNZlcZU+p
	r3frmlOV2TPElSwKbdzr+lkJRqZ3GfrN2lGh98STDZLroSNlSeop4pda3TiLL00hzIB6wJYzN1Gt1
	Zws26AO+2eUgvSbqB1ImqHZHp/N82UYLzmnSn3+mK6smo4XNJH/BkxQ4OOQ2M8VXfbtGeS1Uke1sv
	p0W1DhWRaAsZOLjKSC6Z7SXMMWGb6nUB03WCvzVhyCOjRh3A3fuCkryZCXYfk2k1ecTDHy5ZqDx5S
	h0X3yUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDzn-0000000F9xc-2W0O;
	Wed, 27 Aug 2025 11:07:15 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urCLP-0000000EpUD-3tqv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 09:21:29 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3cc3600e5d1so1244690f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 02:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756286486; x=1756891286; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mker59khNl9LO6XVA193w6BS5zlp+w383B89UYOvyb4=;
        b=ZxM+Xu+rXQXp2bvNkHnzvMFIelS6uFy686EPxeKBKFlzeb0Wht69ovmMCWlyrCf86O
         b5Th80Ymq1s7gM9kFXioFrjbxISIwsxKs47uWrj/Pcahi1Dco8FJfUDiezw765miwNtU
         qjNF2R5gGyBotTV3b4tJKRJkaTz0T9R3bHJRawmiaRaB2QprIHR4riWtQswDY+fcztI8
         Zm5C5w2MJPIxFN24ZZu6A8DItzsL2b2k+hsolCUS4G6FE/Xv6Fft56R2JOCSQPU2macF
         UXfmY4uQ38oTKuXAtFNzln9LcSK+uGeU0WmXUAO3X//gB26U6uBR3eMfXu7Yv9qS8bR3
         IWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756286486; x=1756891286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mker59khNl9LO6XVA193w6BS5zlp+w383B89UYOvyb4=;
        b=BJpnSXq1OqvDSz7sSjBa1Goxu66z+JR8GiBbfm8y0ptvQr51YFQvdgX7Tx2UflyItB
         aIuBW9BNbbm7Qt3v/g4FX/sXbJ1hE5spDZzdj94XvK5RCgdBMrGFCnldDiLo+ADaRxYY
         A6ZJksiMN9UwFw8YIJvv65wuvLPhejtCJ1es/5e0Yg3bXT0+oDFbjkXt9yld3ekYqp7Z
         UCqMQehHFi8Q7keNOT5IqGqV2hzsnrcZUHUN7EodvxMye2veD6bsMntsLGJBaGaUTN28
         m2apprENmi0va9vUdM3c4yrXDin9XrN7a/yOc3Ksthy+Ml6le8jvNPGL0GgIDOIuNOQo
         nCCw==
X-Forwarded-Encrypted: i=1; AJvYcCUzlfmcx/4ZSlgQTzSO7GeG4UXuK2KRWykv9F1+XxkmPY9sQ+ca8VkAS+iPfcMiePi0B3Z56mXE0lEB83VahJOH@lists.infradead.org
X-Gm-Message-State: AOJu0YzoIQJPoKbCU/iPKkbvMUT2YqniWgEucQRjozLXYJ1kYC5f9Eul
	nCgSZjLIyupHTKFoBrEfe0ckeVDoAEVFR+2udUEkyFV/9qCklInQmD4CGbi7x50BYCARE1Mg77b
	GyRpB
X-Gm-Gg: ASbGnctu0iIxHJnK1QQX2rxfjBFD1W3qJ1mnI8ZkochGU/3V5ObjnoMceXeQ92PeCHF
	9TplCrW0p+To5Xpzulx1qZOszQrAUngNoakU4UqlyZ0Hk6Pw1ztiBTVT7okDCTNvdkYirGLAbG8
	jGoUNWNmVXumhMsB6Xo8GNQvHQ9R/8zpRrPNxtE/1DzNeHGOAJZwYhXN/RfASopVzAC1Xf/7Bfc
	BZFKpk/qC/+NDGa8A0zh3OW8OUcqKNvGQNnrIaBqOcBP8y+K7MQMSJo24McTQeSNGN756DkrhEi
	9WF6BH+0JQZ/S6mtm48af9npvrO6eq12NO7W/JcesxXzqrUPdT0/H0xKCqy073STDNJq/BPQH/k
	aDlSzcxTEWQkDcWNTNqqOdm9vxsQ=
X-Google-Smtp-Source: AGHT+IFvRqEa1ogDaSXzE5145n6AsbEdzn4jkuxQuGsQWp+ChfJK8nOqGUjd3LT9Dxkf37baNqI9Dw==
X-Received: by 2002:a05:6000:26c8:b0:3c7:6348:4089 with SMTP id ffacd0b85a97d-3c7634846admr10821566f8f.11.1756286486239;
        Wed, 27 Aug 2025 02:21:26 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc7b699d5dsm2665466f8f.48.2025.08.27.02.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 02:21:25 -0700 (PDT)
Message-ID: <4ca657cf-1c8e-4d51-aba9-c894c32a23b3@linaro.org>
Date: Wed, 27 Aug 2025 10:21:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] coresight: tpda: add logic to configure TPDA_SYNCR
 register
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
 <20250827042042.6786-3-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250827042042.6786-3-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_022127_991973_3122525E 
X-CRM114-Status: GOOD (  19.44  )
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



On 27/08/2025 5:20 am, Jie Gan wrote:
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
>   drivers/hwtracing/coresight/coresight-tpda.c | 7 +++++++
>   drivers/hwtracing/coresight/coresight-tpda.h | 6 ++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 647ab49a98d7..430f76c559f2 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -187,6 +187,13 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
>   	 */
>   	if (drvdata->trig_flag_ts)
>   		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
> +
> +	/* Program the counter value for TPDA_SYNCR */
> +	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
> +	/* Clear the mode */
> +	val &= ~TPDA_SYNCR_MODE_CTRL;
> +	val |= FIELD_PREP(TPDA_SYNCR_COUNTER_MASK, TPDA_SYNCR_MAX_COUNTER_VAL);

Just use the mask directly if you want to set all the bits. This makes 
it seem like the MAX_COUNTER_VAL is something different.

val |= TPDA_SYNCR_COUNTER_MASK

> +	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
>   }
>   
>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index 0be625fb52fd..8e1b66115ad1 100644
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
> @@ -27,6 +28,11 @@
>   #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
>   /* Aggregator port DSB data set element size bit */
>   #define TPDA_Pn_CR_DSBSIZE		BIT(8)
> +/* TPDA_SYNCR mode control bit */
> +#define TPDA_SYNCR_MODE_CTRL		BIT(12)
> +/* TPDA_SYNCR counter mask */
> +#define TPDA_SYNCR_COUNTER_MASK		GENMASK(11, 0)
> +#define TPDA_SYNCR_MAX_COUNTER_VAL	(0xFFF)

No need to define a numeric value that's the same as the mask. It also 
opens the possibility of making a mistake.

>   
>   #define TPDA_MAX_INPORTS	32
>   


