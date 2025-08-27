Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0C3CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LoLKtox6RZvVwzEkSmrYfJeFK5b2yBrCHAYLgeBH+8=; b=LA/XISe63C7Ic1x9B+PcBiiAiz
	Z9b5wKm19Eh4wTgKXsnThiWg/4zi0lWUfug6w/hHLNlnhWYbay9aOCRM1ymFiyoOc4uBNf/NfZagf
	9KoGQ2V/GItqExZQFpie5Sce+oc4Fd3GRYBgOFf8e354Y9tJixFdsEsA1+W8+PV0TsfGd6ki+oGxP
	jEUqzcc45HUmYWda8tq6wDZugxYWPMhGbiLhmAxJOh9q2YBkJKin1UUC5aNMybBOv/BBpdwIbjnvZ
	saOXFklE5fC9ra9MaVlhg+dHMQS2hBC3Ile/FLO+U+1JI4X/9ay/0hd/q41/hr+Ka6OhO67pXnvGw
	NjL8Jkbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDzk-0000000F9sx-3a2m;
	Wed, 27 Aug 2025 11:07:12 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urCHZ-0000000EoWV-2JkR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 09:17:30 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3c6df24f128so3235182f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 02:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756286248; x=1756891048; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8LoLKtox6RZvVwzEkSmrYfJeFK5b2yBrCHAYLgeBH+8=;
        b=Lqvjk/SWqFyuapaXJOML+9CQkvQrqrNv+mwgv6oTeGXco1vgrTJqZ7WMCML2nz49bx
         S4A+FNjNzV9dIgmEqLCc29f4OONQhQfi2euX9vybZGn592AslvldEyWi7Cg654pTWvFN
         xCwhuYpPQPl9MvLCEpqgzpj/2YwOijcCGhhSuUtvzuLuUlxlHNBuBsvKTa0voAIa3vdt
         qGeEbhnE7rjGe5vpCJ/doHKDW15FsqRwxNtBN+V6z1yiY9HVEFTW4fMPQ13RQoIfayaP
         TDiFIqTaq1nHCtigO+VJOXK8WVAs/os0lNLr1mJLltsxDySfhTP/M4YLRwPR5Odua2T0
         Fxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756286248; x=1756891048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LoLKtox6RZvVwzEkSmrYfJeFK5b2yBrCHAYLgeBH+8=;
        b=rfl1zGEw/FZnBB9rQ0d5GyLu60pGy37UWYLr9Lf4wWmDhmk1UdhmxV5//ugQXqVatg
         wvDXGz1cQaa9kqSnYa+Cw2a+EfKL2YTcvWVuy/Efvfgxu8S/bDMqOC6USAkrOBcy9MYX
         /GF/oMb3qW/HeYBICf9ISDyrYtGhYcFm9aPK9boL6eh6jmn1lM1S8cBXdsF9TMKiY8Pn
         kCWcWtmSnLYfBafwN4H75A2/Ydg7EZrTX3O/RhkyzDtxfTOV2F57VwFT4IMDSNpeRHM1
         HPUymtJ7llErKJY6++bXa2mq7ePQBLxou09rzQqS3gryBxUk+LptHqwRzOROV8XfPkwL
         DdzA==
X-Forwarded-Encrypted: i=1; AJvYcCUwzggJ7Z9+CwWdVZE/L7qditJieVeLnMutXauWbd+Iv8pfvx8V2+E7HHknEe1pSAA0lnHHRgubqQmfjXKqZcAe@lists.infradead.org
X-Gm-Message-State: AOJu0YwF2CqinzE5VxFWcIfDekpgNEE00d0nYvDw+I8zkRCYv9pnTgLL
	WWo6w20Mh77uo6sLPjSzjVVGlULBvb8/KrT3AcFycitItxO1B7YF9a2MAqwjaPyhiMk=
X-Gm-Gg: ASbGncsDFZGumLfd1EN86+h+lLAdYf1qg3gJDfwyzumyynRHXDhBDBeDtYPNe5BCz3Y
	mOxN6G1qd5KHVuYjbzxb9G+BHnyXvu3NfoMxpT7WBQm2BZKKYxFDqfWab+LuouPsJeWMuH5FQKR
	O9lPU06Hwyfjma3dG4mEKc+wMHG5N+V2DsETV1KJF8Ozip/wYazBTgQAfMAHKCRf/zqR1iGubAY
	s9tSiXuTXTDGyKqF1+94ciQO2iNj47aM1p5OcXWKSLOvp0S03h8XBZP18x7m3Q+aB4ZxJb3eTY2
	9vs8/npd4HAQxC6t47SsJumsJlcQWmudwGnF0zDYvSIM2Anp8m1LIw3BmTkzel8gQ1Cs/842Ynl
	/uuL3vWNlY00NiDz6/baN9mnWTCNL+miNXQFNmoGK0xHAHG7/
X-Google-Smtp-Source: AGHT+IEn2+Mqlva4eTiz/U9+4k0MFWsfnMZ4oB+8ctPeoze1Xi/Byz7VnuLxX/51r0/UZh1J91oxOg==
X-Received: by 2002:a05:6000:200f:b0:3c9:5df6:de3f with SMTP id ffacd0b85a97d-3c95df6e14fmr8753713f8f.24.1756286247700;
        Wed, 27 Aug 2025 02:17:27 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc18f762b1sm3948817f8f.65.2025.08.27.02.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 02:17:27 -0700 (PDT)
Message-ID: <b1f79a26-97e1-40f4-b076-51d5c2abe736@linaro.org>
Date: Wed, 27 Aug 2025 10:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
 <20250827042042.6786-4-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250827042042.6786-4-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_021729_601336_D27B0628 
X-CRM114-Status: GOOD (  22.60  )
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
> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
> for port i, forcing the data to synchronize and be transmitted to the
> sink device.
> 
> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 42 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h  |  2 +
>   3 files changed, 51 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> index fb651aebeb31..2cf2dcfc13c8 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> @@ -41,3 +41,10 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>   Description:
>   		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
>   		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/port_flush_req
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Configure the bit i to requests a flush operation of port i on the TPDA.
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 430f76c559f2..8b1fe128881d 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -487,6 +487,47 @@ static ssize_t cmbchan_mode_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(cmbchan_mode);
>   
> +static ssize_t port_flush_req_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (!drvdata->csdev->refcnt)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	CS_UNLOCK(drvdata->base);
> +	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
> +	CS_LOCK(drvdata->base);
> +	return sysfs_emit(buf, "%lx\n", val);

Still missing the 0x prefix

> +}
> +
> +static ssize_t port_flush_req_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf,
> +				    size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	if (!drvdata->csdev->refcnt || !val)
> +		return -EINVAL;
> +
> +	val |= FIELD_PREP(TPDA_MAX_INPORTS_MASK, val);

Using FIELD_PREP() now that it's the full width of the register makes 
less sense. Especially when there is no corresponding FIELD_FIT() check, 
  which is fine because everything always fits. But if you didn't know 
the mask was the full width you'd wonder if the check is missing.

I would just write val directly to TPDA_FLUSH_CR so it's simpler.

It should also have been val = FIELD_PREP(...)

> +	guard(spinlock)(&drvdata->spinlock);
> +	CS_UNLOCK(drvdata->base);
> +	writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
> +	CS_LOCK(drvdata->base);
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(port_flush_req);
> +
>   static struct attribute *tpda_attrs[] = {
>   	&dev_attr_trig_async_enable.attr,
>   	&dev_attr_trig_flag_ts_enable.attr,
> @@ -494,6 +535,7 @@ static struct attribute *tpda_attrs[] = {
>   	&dev_attr_freq_ts_enable.attr,
>   	&dev_attr_global_flush_req.attr,
>   	&dev_attr_cmbchan_mode.attr,
> +	&dev_attr_port_flush_req.attr,
>   	NULL,
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index 8e1b66115ad1..56d3ad293e46 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.h
> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
> @@ -10,6 +10,7 @@
>   #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
>   #define TPDA_FPID_CR		(0x084)
>   #define TPDA_SYNCR		(0x08C)
> +#define TPDA_FLUSH_CR		(0x090)
>   
>   /* Cross trigger FREQ packets timestamp bit */
>   #define TPDA_CR_FREQTS		BIT(2)
> @@ -35,6 +36,7 @@
>   #define TPDA_SYNCR_MAX_COUNTER_VAL	(0xFFF)
>   
>   #define TPDA_MAX_INPORTS	32
> +#define TPDA_MAX_INPORTS_MASK	GENMASK(31, 0)
>   
>   /* Bits 6 ~ 12 is for atid value */
>   #define TPDA_CR_ATID		GENMASK(12, 6)


