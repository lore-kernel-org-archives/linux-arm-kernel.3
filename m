Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C49AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0839DbdluWzWpmaiM9EB2MAfOdwxjWy1MJ5estDULzs=; b=BALvACgjd8eJOh7QN5qvJ2ikHJ
	MNyPFVkW5ruDsmL05wphuXsYcz5//exmLJXKddsVfkx1DEC9/Qac8T0QzFyyFSZzOYgx1J1BgUUaz
	dgjh6BrtxggCKCv+wVKf3x34g9EAKTWIrM7iekAtYyWXTwe9wuC7d/6pS9Kx8AYEGIqqiATQy7Sm2
	1ZyZzmxrvnYxjUv1A9W3Pz0IN83ze/NUTwvs479UURO+1L5q87lFy5eC0HmXfDQY77KmE/NbiobIL
	GBcwhfBH1CAy6Z2VKJCInvkO8sZ5OaViHy7RUmU3oBRjPGL2Pk/qDf71+Yav0L8Qq9YpW4aSgRQuc
	VppKEsHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKgu-00000007idV-0ikS;
	Tue, 18 Feb 2025 10:19:00 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKRx-00000007ejB-45JQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:03:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38f378498c9so2564310f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 02:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739873012; x=1740477812; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0839DbdluWzWpmaiM9EB2MAfOdwxjWy1MJ5estDULzs=;
        b=keGv8nVyJ4emTLjGxolvrtOPeNFfOUZ+DwVsbhV7Icx6KWss5gFK/FAcduvNy+LsQZ
         cks2wLcBQW0rGP3QhIg749XDUszxYSEVoN2NtEAWEglRZY3LGTi2xAGdiC7lAqc5bcJb
         sL4FrHJqy0Q0H0RtbWfsdzlZqFS1BKnxDkaZ4+2fmjN5mY0DfOUudqp8B4Nlwad4DnlZ
         bxMQq25xChZniDJmXGvjKmd2IfzTijVFwuMkUBqnddwz8D9Pp7UOEhwzM7psnK8szokH
         2eBjZD2/kkBydRI4OfzsJgBPZiA6d5EfZYeTUgyWfeuyQd1k/GzYIqmlIKrBthbss2MM
         XZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739873012; x=1740477812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0839DbdluWzWpmaiM9EB2MAfOdwxjWy1MJ5estDULzs=;
        b=p4GtPcXbfqNzgxDSsaFImy5F/Rzur9p2DhUMIY1oLjZQACzwCi/CijmyZCA9UFEHtg
         QsmzibU8tOjGifGSJvNxLY/llI4aRuXoCW2+kpny/vdJCeC2vr7sM4qrgQIxPlO8rNH/
         zESUO1+WmVvazN3R8GLJw0Vi0vsWM3Mp2ArBXnby0boWHrg2SodakI2FJln2Mdtp4PwL
         am+ueOD+2Z+4zL4ihxKmlJuK2mDg5szaM6GhsVvrMwdffFo8t0jsz3DAEXyKRvRQQjqX
         t1a1t6oM48bQPbWDZQWWpe3htJdbq1WxuaduJjv13W8R3FDRDGv15kbB6YD8DtClIfD3
         Nvcw==
X-Forwarded-Encrypted: i=1; AJvYcCWfqQ9XEFKuXnsqrEHXaEQUzv4Spx9AYimcPO6wQ+dxjGm0qvX95wEAsAZugGYftvw0DlLo3A7d6tfa+cj0rs7U@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ6Q4OiKRgkpvuZjpZfMs5qRusyf6pKDrhgY/QSv5ysUrXTEgO
	znLZa0h6htnVIXRLZPxNnhzVOwRQmdSHAyx2x1EFg/dG19AhmO0o1Tr1P9Ljc9I=
X-Gm-Gg: ASbGnctehMH02fXU51layCgmEez5oEb1geguQninQ54hmtA0y2ybfczo1VPsQA4Gdz5
	m9xUloOT7IMbBzeIde62pJqHMq+q47wpv/bn0t14XSgCLaTPSyRua/K5i1b2hcEGSHIdkvsioAk
	JsR1sxFJUA4G3bpkDOeTGylkXp8OvDzKQM1tn8QPGBnD2Nobl/TLzyrw6DZVDu7lnvuOfNp0tja
	dJg7SEYVOYG9/vFjGwcgFdBfpbembf0xPaX/QbDpTfymy5DG2b++/ltJmkn7/iusvqcvDVBwjBr
	vzDhhHrGHou+zFV/Y6AgOqn+hA==
X-Google-Smtp-Source: AGHT+IGWbXagYwqDWRSF8X9rCootz68CXEnP/Ij/n5wLMpuiaoorUGPClGjqgWRNOLdoR1bU27EBOQ==
X-Received: by 2002:a5d:64cc:0:b0:38f:4fcf:d295 with SMTP id ffacd0b85a97d-38f4fcfd742mr3216642f8f.29.1739873012294;
        Tue, 18 Feb 2025 02:03:32 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddbe0sm14730522f8f.39.2025.02.18.02.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 02:03:31 -0800 (PST)
Message-ID: <9adf9f13-128d-4ef0-ae31-4db4d295e2fe@linaro.org>
Date: Tue, 18 Feb 2025 10:03:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/7] Coresight: Use coresight_etm_get_trace_id() in
 traceid_show()
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
 <20250217093024.1133096-4-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250217093024.1133096-4-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_020334_030111_379DC82D 
X-CRM114-Status: GOOD (  15.68  )
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



On 17/02/2025 9:30 am, Jie Gan wrote:
> From: James Clark <james.clark@linaro.org>
> 
> Use the new API, coresight_etm_get_trace_id, to read the traceid of the ETM
> device when call traceid_show via sysfs node.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 3 +--
>   drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 4 ++--
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index 68c644be9813..b9006451f515 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -1190,10 +1190,9 @@ static DEVICE_ATTR_RO(cpu);
>   static ssize_t traceid_show(struct device *dev,
>   			    struct device_attribute *attr, char *buf)
>   {
> -	int trace_id;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	int trace_id = coresight_etm_get_trace_id(drvdata->csdev, CS_MODE_SYSFS, NULL);
>   
> -	trace_id = etm_read_alloc_trace_id(drvdata);
>   	if (trace_id < 0)
>   		return trace_id;
>   
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index c767f8ae4cf1..e5216c0f60da 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -4,6 +4,7 @@
>    * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
>    */
>   
> +#include <linux/coresight.h>
>   #include <linux/pid_namespace.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/sysfs.h>
> @@ -2402,10 +2403,9 @@ static ssize_t trctraceid_show(struct device *dev,
>   			       struct device_attribute *attr,
>   			       char *buf)
>   {
> -	int trace_id;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	int trace_id = coresight_etm_get_trace_id(drvdata->csdev, CS_MODE_SYSFS, NULL);
>   
> -	trace_id = etm4_read_alloc_trace_id(drvdata);
>   	if (trace_id < 0)
>   		return trace_id;
>   

Reviewed-by: James Clark <james.clark@linaro.org>


