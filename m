Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC13CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLqmIwK8NZ6hSazvQk4aM7oVEZe5wm9tqFDFQ8D7Dao=; b=ffFtyyp1zJ+AhfEcsBD4gyzcC7
	TvvtqCUdsvyR6DmF1mATmGRX9qmXl8fyeijmfHXDa8y63gAPe9t+G9u8mws9w1EUo5gGgcot9GWBH
	uErxA1gIDS+oOJOqptUphtykOGTFTXjSv2HsxBgET4UodKjQYs7rC5TfuYteTllmd/X/sdzLUXuuY
	7Z8a1UnpFgSimXQxhL7OXa2dUcMzDgYOPhZF51gABmDsk9m893AcVWKaE/cMYGU7Gubw/zHVmleqF
	ay7gUbb5metmOje+BzSOR9PDF0LcH046JIRyUnTNrd1t1hFxtBVfYn9yJXKkIAqhhoX9cp0StLqjr
	t3iNU5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq6z-0000000BRmC-2sDX;
	Tue, 26 Aug 2025 09:37:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpy0-0000000BO1X-335F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:27:49 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3c79f0a5c29so2344717f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756200467; x=1756805267; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qLqmIwK8NZ6hSazvQk4aM7oVEZe5wm9tqFDFQ8D7Dao=;
        b=cjlBGjHxXgbhXPapvOgq9Kbr/pNSrw4lW3OSK1vlfZKX6manvU5+K16kgEt1TraGrS
         UPNJkl+YojczozUWXCqMg2IVonhLiJmBybY3xjaLLCfEdvAIsTztjvAk5N8HwAt81Z4S
         Wxi3In9SQEOq7mYjdLSte40RnkAdMmf6i/3HRhXLy7vQOJ1L8laWGV5lICJgdZp4iIgv
         UojpeBBOIx2U08crrnpbMsQpxaI8R5BeZPn7dlIat8n5re+uhIEafyI6YjTTIy/O7s+f
         u1OyPilPeymfHY8jrJzaXhnYZbDu6WfJ6RkHgkrQ0xLKkzqc7noeoGDVNx0qaPbUPiwz
         04/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200467; x=1756805267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qLqmIwK8NZ6hSazvQk4aM7oVEZe5wm9tqFDFQ8D7Dao=;
        b=aQTr19qwKgd0fWvY3zeSw7MTW/6iy9N1oE73OCE39yOpWdikZvksBvrJF1crzBZb+u
         Cj2Hf4J5cDX2GouIz67yn0DcH1U7C4UMaWd1BF2RHNHzg9lIfk0SNiA0EgzMZfMyKJ19
         ZUfsRdcy50jKIY6BY6KCh9RdwI49ufymMtCFLiB7S2Tw4istlKd8znum+YNbhdASm8zK
         X8FyW36YfPIlNo8jsJiM7LjRwfkmT5bx/b7wj7KD+PUwCdx1GlBclDBIQdI4U+bd0jRw
         2tangVMdf5wsp5qWfZ91qm2mSCDiUPhQ/HPSTXdZo2Dx9s7mqf31+nbl3lK0kcxy9CZc
         /BfA==
X-Forwarded-Encrypted: i=1; AJvYcCVTIuPmwyOL8hF059Yn9UnmWcccNbylzgQeEdgrFk4hj/QTRMb1G4+uH8YFcXGHCJNnhKSfmw/1b21XFT681Paa@lists.infradead.org
X-Gm-Message-State: AOJu0YxUsB9flP6Wi6aXlMgiQ/4e5htvPvaVwwASlUkD23ZtPTeP7JH2
	YKXIoFopAmA1+0seSE/Qk+3P0no++/qMAwENg0UdDuuhHYFs7H7Xa20nM1TntJHGF48=
X-Gm-Gg: ASbGncuF+hoLj+uUfWdT0Uyhr5VR+Beomn1n40iLT8RvKUu2Lf5nJPQaqaYv4HMIxtT
	l2EbRHyz+V6+xlwPvoIZWOvLluGU3Nd6h5JAXvuEviSuiF6mOEjFrm7Zu6bexH+50eKtbetofNj
	0gRNCbpynlHNxqAoVAAL+kbtwHzGTrncQ3a3CJyM6aQmWDt5HOQCm3TSrD2N8Ei6mPYR6uOBtw+
	yrT/F0QMTSxDr4+G5yHBXQSEGVrUZmZn+ke6Bws46K8G56J3tFP/5o62OVln56x8TrmbYJjTx8r
	gy1/LPilGbV2fofLfL+niN2pTkbl36UEQtdYp7TVFFfVRgUbHeTi1IoRKnY54X1JvivtQifLGKr
	+kPOF6EPTQ8NE7BX/ChlH4UtxABtLXAH0UAvJ1w==
X-Google-Smtp-Source: AGHT+IFbIYlKW54tLzTd2qlLQcjlN/Yji9BCemb4M6ZN8HZ69VKZDUD6dqfqBp/gsz3qgvx86VJf2w==
X-Received: by 2002:a05:6000:4011:b0:3b9:13e4:9693 with SMTP id ffacd0b85a97d-3c5dcc0c457mr10671415f8f.52.1756200467087;
        Tue, 26 Aug 2025 02:27:47 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5ef818d3sm86633675e9.12.2025.08.26.02.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:27:46 -0700 (PDT)
Message-ID: <3ac2954e-5663-4ea0-bc1d-a09e1992af5b@linaro.org>
Date: Tue, 26 Aug 2025 10:27:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-4-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250826070150.5603-4-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_022748_787325_D70DC7E6 
X-CRM114-Status: GOOD (  23.61  )
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
> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
> for port i, forcing the data to synchronize and be transmitted to the
> sink device.
> 
> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 +++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 45 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h  |  1 +
>   3 files changed, 53 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> index e827396a0fa1..8803158ba42f 100644
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
> index 9e623732d1e7..c5f169facc51 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -509,6 +509,50 @@ static ssize_t cmbchan_mode_store(struct device *dev,
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
> +	guard(spinlock)(&drvdata->spinlock);
> +	if (!drvdata->csdev->refcnt)
> +		return -EPERM;
> +
> +	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
> +	return sysfs_emit(buf, "%lx\n", val);

Decimal would be better for a port number that goes from 0 - 127. If you 
really want to use hex then don't you need to prefix it with 0x? 
Otherwise you can't tell the difference between decimal 10 and hex 10, 
and it's not documented that it's hex either.

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
> +	/* The valid value ranges from 0 to 127 */
> +	if (val > 127)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	if (!drvdata->csdev->refcnt)
> +		return -EPERM;
> +
> +	if (val) {

If 0 - 127 are valid don't you want to write 0 too?

> +		CS_UNLOCK(drvdata->base);
> +		writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
> +		CS_LOCK(drvdata->base);
> +	}
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(port_flush_req);
> +
>   static struct attribute *tpda_attrs[] = {
>   	&dev_attr_trig_async_enable.attr,
>   	&dev_attr_trig_flag_ts_enable.attr,
> @@ -516,6 +560,7 @@ static struct attribute *tpda_attrs[] = {
>   	&dev_attr_freq_ts_enable.attr,
>   	&dev_attr_global_flush_req.attr,
>   	&dev_attr_cmbchan_mode.attr,
> +	&dev_attr_port_flush_req.attr,
>   	NULL,
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index 00d146960d81..55a18d718357 100644
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


