Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0755C61CE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wJLeaP03mtDtOblkkOxViMj58IHsgZlwwzUdCNwkkI=; b=BR37tUP2iF14KnoaWfF3W/j7pp
	kPXTFwDJ08F6Y1+vOE2S3bXtcOw1XbGA6qwV/TzrAEL4xx5pHqFDBeUMDLnyPzZa25zKrEtr3fa4F
	ntluV6YQM2WI0+dHUMx6lSv8GRnKYqfqCfd+aueYaO1aa1K5XuXg7/qMGkMsWV1Pw8SmqlywVO4p7
	T2KIUSOztIv9n7k7GDgdf7ThmGdb7hcUZpC28dbntmUhKv4mVMejvSPPg9Zs6IFMnyXtWkDb0t2zG
	05/L5O+Yj7pO2zOxRi7G4HA/M8O0yg2cfyn1l9lZRt1Nw66anStlo4RKdcmvSGf7lxhVsYix/OWup
	jbLqiOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTZ4-0000000BHXA-21ig;
	Tue, 03 Jun 2025 15:28:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSNP-0000000B8xo-3HLl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Jun 2025 14:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6wJLeaP03mtDtOblkkOxViMj58IHsgZlwwzUdCNwkkI=; b=mo8pZS8MCgo/ZJQ/oR8/r8ZbGx
	yTsZHd1o7BmR5skagdUvHTCxdKL0bDYs/VdtQqNs7pWzESXnyOnSYUnEMa6/v+CQ++6rfL3sOoxik
	gSl5gKjkojLEp6ykf6vgAm55N7SkJAE652Vuz3HGPcIAUQowMs6wqkJSIycFMBSuISLfH85f4ZkYn
	98IOiJZG+Mj1mnj1fYrxHDyFvJU/caQSjyDYQFXhpD2WlKLpryPG06pglbEKWxCUBfkD1r6kcDMjP
	6WR/i4PxPLMmnG+3SiMf8nMi/Vp/FEIIv1H4ogX410O6BwBZpjnTcuGqSku3BaRbasu4OCRD3/2a5
	+K72uwgg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSNM-00000000mO9-2VoC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 14:12:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so36552875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 07:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748959941; x=1749564741; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6wJLeaP03mtDtOblkkOxViMj58IHsgZlwwzUdCNwkkI=;
        b=nuzgVDCsXbk1KvRxyhk14tfkNp0xDx3hTbtoa2eXQAPvRWn5l52idWDIo1+eb4pdLb
         XjhlEZaUG0fz7is+GzSrdLcyRoR2emvrAeE+rgIu/66j2QJtKTUU+/3GeZs7ZUZJmj4O
         QoE+KhpJdN3UkIuwQL7SAu6863t4Wl08CTR3lfzTqti8y2SLpB9ialVhcP5R6OKepYPG
         zfynaWly7jPO7mTVsswlzjpOGKusHm2+G49H5BvRHgVxRg7bF2I/uPL0nSvgJVwYlgp/
         L/Mcr1uMcGT7wuti2F2oacGImAhSeN3rR6YZASYKER05huE9WcRaYNYQ6BROmHZGeSt9
         TFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748959941; x=1749564741;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wJLeaP03mtDtOblkkOxViMj58IHsgZlwwzUdCNwkkI=;
        b=o+GONRnyoSF04g7aIkPlPZmHl6aLVxUcP+eYR/e78It9gvYrsfvXbOjZ2k0HjA5i7k
         VqEcomhQpF+RiKXQhXp68PLCWwwunEU/6g2TooTCAs9NE+NmoNMuS4H8c+lIaSM43kde
         uTqbXPolFdVeQM0047Rab0UQZI6dVUAnLeR+DHmMd2m81qC/H82m/AVz3vuCvck41W83
         a2vfM3CQcA3o4pXSGNVVhwlR2Xh/RsqKbToFjVkm9D4ztGrYQ70C9KcKp/M6Q8KkzVDE
         Iu92UYfsNNGuoMdUppRRQKHQkDPpEZTl2kLV36X9jmeW4XGRgxj5ABBJH+Ms8QU0e7TH
         aEVA==
X-Forwarded-Encrypted: i=1; AJvYcCXjb77SIiV1q6JZ4qHb2n/3yWBFXy7RaVapodcNJ6ornVigEyvoeqAOTE8o8gqyEwv0KBKZZCCal0iu4GnFPyJN@lists.infradead.org
X-Gm-Message-State: AOJu0YwAr8JH2HmZadBq4q/D+yUCQHm+ac6nfcJPxpvdZ/SI6N3a5roD
	Xt+JvUkpeAwxH2dwcvg4XdPz8KAAsWoRU4qBGCfMW3SKkMOARSns8vNLPfMl3IePTrQ=
X-Gm-Gg: ASbGnct0/LzxKx4rpFI6eEBRXaTxUXXVBno2g4hNqnovDXKesyS8Fc7iWJ0JyE1pB8P
	V6CoBN93zDSH2FqU2CSvLt+5DRq1ZKgryQm1qt429DT/K8PEUfac3QWpYpjJkV/TFIPDJuY1ggf
	RhdjTb3p8xeqUNVQILPBl92plj/lxCL3qm1gLE6iakyiBExqzR/fhf70LmsLYGHpn5GwqoEGbiA
	gaeCSrtsoP//MMn8BC4ImhPY4fhIiohC8cQrsD8hkMhy93ZKk1iEPCO935tycrybG0DrNeLxny7
	DKBHmppO1owrAwBWFPSlQ/ed57SRY+/tkESVb0c6hQEcEQUMpVtT6inF
X-Google-Smtp-Source: AGHT+IGOABL0A6s8/Ut0eSuBhoQegZYqQ3rJDBlLOJLzhyugXv/RwodNod3mhDofSSo5Nx2xBcS3Rw==
X-Received: by 2002:a05:600c:1c96:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-450d64d5fedmr157189435e9.8.1748959941283;
        Tue, 03 Jun 2025 07:12:21 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74072sm18831982f8f.52.2025.06.03.07.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:12:20 -0700 (PDT)
Message-ID: <f50facc1-6872-4c6e-a44a-cf5f76b23208@linaro.org>
Date: Tue, 3 Jun 2025 15:12:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/11] coresight: Set per CPU source pointer
To: Leo Yan <leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
 <20250516160742.1200904-3-leo.yan@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Yabin Cui <yabinc@google.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250516160742.1200904-3-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_151224_781020_FD62F8E0 
X-CRM114-Status: GOOD (  22.97  )
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



On 16/05/2025 5:07 pm, Leo Yan wrote:
> Introduce coresight_set_percpu_source() for setting CPU source device. The
> sources are maintained in a per CPU structure 'csdev_source'.
> 
> The coresight_register() function cannot be used for setting CPU source
> device as it is absent info for CPU ID.  So this commit uses the ETM3 and
> ETM4 drivers to set and clear CPU sources in probing and removal,
> respectively.
> 

I agree that doing it in coresight_register() would be better and 
slightly less fragile.

You could add 'cpu' to 'struct coresight_desc' and then do the 
assignment to 'csdev_source' in coresight_register() if 
coresight_is_percpu_source() == true.

> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c       | 7 +++++++
>   drivers/hwtracing/coresight/coresight-etm3x-core.c | 2 ++
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 ++
>   drivers/hwtracing/coresight/coresight-priv.h       | 1 +
>   4 files changed, 12 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fa758cc21827..1503037662f2 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -32,6 +32,7 @@
>    */
>   DEFINE_MUTEX(coresight_mutex);
>   static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
> +static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
>   
>   /**
>    * struct coresight_node - elements of a path, from source to sink
> @@ -77,6 +78,12 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
>   
> +void coresight_set_percpu_source(int cpu, struct coresight_device *csdev)
> +{
> +	per_cpu(csdev_source, cpu) = csdev;
> +}
> +EXPORT_SYMBOL_GPL(coresight_set_percpu_source);
> +
>   static struct coresight_device *coresight_get_source(struct coresight_path *path)
>   {
>   	struct coresight_device *csdev;
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index 1c6204e14422..de62a0bb7faf 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -879,6 +879,7 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
>   	}
>   
>   	etmdrvdata[drvdata->cpu] = drvdata;
> +	coresight_set_percpu_source(drvdata->cpu, drvdata->csdev);

Doesn't this need to be done before coresight_register()? Once 
coresight_mutex is unlocked the device can be used. So you could end up 
with an enabled device hitting the PM notifier with the per-cpu variable 
still NULL and not disabling the device. Then the state would be messed up.

Probably another reason to put the assignment in coresight_register().

>   
>   	pm_runtime_put(&adev->dev);
>   	dev_info(&drvdata->csdev->dev,
> @@ -902,6 +903,7 @@ static void etm_remove(struct amba_device *adev)
>   {
>   	struct etm_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>   
> +	coresight_set_percpu_source(drvdata->cpu, NULL);
>   	etm_perf_symlink(drvdata->csdev, false);
>   
>   	/*
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index b12d59b89a49..fede0be5cd43 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -2203,6 +2203,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
>   	}
>   
>   	etmdrvdata[drvdata->cpu] = drvdata;
> +	coresight_set_percpu_source(drvdata->cpu, drvdata->csdev);
>   
>   	dev_info(&drvdata->csdev->dev, "CPU%d: %s v%d.%d initialized\n",
>   		 drvdata->cpu, type_name, major, minor);
> @@ -2402,6 +2403,7 @@ static void etm4_remove_dev(struct etmv4_drvdata *drvdata)
>   	cpus_read_unlock();
>   
>   	if (!had_delayed_probe) {
> +		coresight_set_percpu_source(drvdata->cpu, NULL);
>   		etm_perf_symlink(drvdata->csdev, false);
>   		cscfg_unregister_csdev(drvdata->csdev);
>   		coresight_unregister(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 33e22b1ba043..59f9ec9cc260 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -250,6 +250,7 @@ void coresight_add_helper(struct coresight_device *csdev,
>   
>   void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
>   struct coresight_device *coresight_get_percpu_sink(int cpu);
> +void coresight_set_percpu_source(int cpu, struct coresight_device *csdev);
>   void coresight_disable_source(struct coresight_device *csdev, void *data);
>   void coresight_pause_source(struct coresight_device *csdev);
>   int coresight_resume_source(struct coresight_device *csdev);


