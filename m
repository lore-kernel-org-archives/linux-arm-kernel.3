Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3650FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 11:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gmf7mcPtQwX9tpVIZFfSi4yhDQ1AXN5DwMHqelwsOGg=; b=YwyeFWUk23ddhKm44/rUmW5zn2
	WMIfVK/boB4gzh+w9S4BhEGcjTokhKscHyUSAv8cmDdQdyuy/25f2tUWgp2uioZoQBp8IIxDK8i9I
	c6T95G0vIs9RcGnSCxTvE7FL9rnr8GP3+pE6g0rAk/u38bsz4/d4ShDn47O/hd67y8EtEvqvfTYKa
	+c9uMx2pQxUvs7sG+BX9oXQ6sXxuJWb0RexN8mithrczw8ypAhJB6ScIK6Yxb9JuTOzylc3nY9h8w
	sdKDUqMAJVHGj76tfXv+LSWQigWlp1gmB9YRYChcSYU6r/Un8bo6Kb2uhcCApkKJxI3R88eATLv4D
	RIPQxGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tckCZ-00000004p4y-0718;
	Tue, 28 Jan 2025 11:56:19 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tckBC-00000004ow1-34kV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 11:54:56 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38a34e8410bso2760665f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 03:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738065293; x=1738670093; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gmf7mcPtQwX9tpVIZFfSi4yhDQ1AXN5DwMHqelwsOGg=;
        b=NdOxB7mXMCWTXBHu1DSyNPcH4ZrwyzKhdX07/P62OmVH5Ov7dh+Y3DRK8+ArGgVpOR
         xpmdGAEXy1/ETpkT37BImUUg3rR5L4sAFfEwrczuepandHSevzO2mIhyVLTO28m1WiRm
         KaNiaF+vJn7ABE6iUTcVlSvvzIxbPf9v9qZi0MHSa4pEwIu9mgv/F2OUleyh1qUKZvey
         qISD4QfFv6U4erQ8iqymYRGIerXkpyCWpeTbs1hPPqNyY6BIumYcb+5GQT5/UMN+IExc
         1Dxf7fOjjEQxpSTQ7mIsXBhJ6+VuhUg60kaixI4GH7t6TCgOAUPTquOR2t8Jb04L4oIz
         MBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738065293; x=1738670093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gmf7mcPtQwX9tpVIZFfSi4yhDQ1AXN5DwMHqelwsOGg=;
        b=mHZg569NGAbQNquvn1UQxacDbC3psoRKCuS8SjFlQEUob/FTiky8fFTKFSLLgeIYUL
         kU2KaKaVNJ55R4pWkjTu9HGAb3r/CELSXyfxHVu2f6dA6hV54Upwo+skVVVta9oY8H5V
         20uf45CAu51Efj5KXxseQxnSdDqfLkcRNKs26q/UWXRyxN5sfTAoeOIPeMcjOI+nsfnE
         /TBJ183cTrZYnmpE9/z9rejI3zaf1UNimYKuwq49Rh8Dh0dKEdbLWa8HwWyiVgocHfUz
         wQULS0uar/WNKfJJk2zsEBfKlY4xXEpqPyfGE8gIGaoX/c+uQv4QrNmUDAzHG+DyDD31
         xRng==
X-Forwarded-Encrypted: i=1; AJvYcCV97qL2U/B1oWrrwvJOSpd6hJ68ewpQ+J0GZdCP7LN12e9xOkK9GMhgaEygOCxhV6hUzonO59x+qVyby5csmtjM@lists.infradead.org
X-Gm-Message-State: AOJu0YxdW2KlMw4sWLJYYYivJnyO0hpo8c1lmUMSJHYSmsSZuXHzf9CP
	Z9eS2zuh56DFscw/SU6CASyG3UwSw3fo2AiQbVZILxWhHykKreFAqDQR0gBhuK7JyVjKYHXWHJS
	z
X-Gm-Gg: ASbGnctqyd6l6vIq//Vmah57GRNdY+L2xeclACsz/mPYqlkf+uU2BMq35gsCcwMKK61
	qH839mmWpQarTruwnlN+V6S59GrD/gV9qderj7a2w3xLrNtReAMOfYIl4nd0c2u33fn5F0fQiJY
	9HimoNqRFWP1fwsuYHxvSRfCFqFF28O7E+0ZdZDwrrEMUXzcMaTpMJOKfxXxJLxzdS5vLaaLoSP
	2PUaVgYULUU9UFNw2oxFmhjDqHfU5x5UybNQ6IMBnSjhWybhp1XbG1SnCtIpvvJqJvdsQzCcfzM
	OhsXqY3yYkX2/qzdoUEohKTSwg==
X-Google-Smtp-Source: AGHT+IHDFuV7bbeobdH8NJ7zs7YKsojRKqZ82J0IkoSCP3pGxLQVoQ/0mthDOYphu4LwsfSwyMaGvg==
X-Received: by 2002:a5d:6505:0:b0:38a:88ac:ed10 with SMTP id ffacd0b85a97d-38bf5789edcmr34949134f8f.25.1738065292604;
        Tue, 28 Jan 2025 03:54:52 -0800 (PST)
Received: from [192.168.68.163] ([145.224.65.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb0besm14135821f8f.79.2025.01.28.03.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:54:52 -0800 (PST)
Message-ID: <538ae543-4c43-4df2-8adc-911096fe14dd@linaro.org>
Date: Tue, 28 Jan 2025 11:54:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] Coresight: Introduce a new struct coresight_path
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
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-4-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250124072537.1801030-4-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_035454_783157_9C539094 
X-CRM114-Status: GOOD (  28.30  )
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



On 24/01/2025 7:25 am, Jie Gan wrote:
> Add 'struct coresight_path' to store the data that is needed by
> coresight_enable_path/coresight_disable_path. The structure
> will be transmitted to the helper and sink device to enable
> related funcationalities.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 87 ++++++++++++++-----
>   drivers/hwtracing/coresight/coresight-etb10.c |  3 +-
>   .../hwtracing/coresight/coresight-etm-perf.c  | 52 ++++++-----
>   .../hwtracing/coresight/coresight-etm-perf.h  |  2 +-
>   drivers/hwtracing/coresight/coresight-priv.h  | 21 +++--
>   drivers/hwtracing/coresight/coresight-sysfs.c | 32 +++----
>   .../hwtracing/coresight/coresight-tmc-etf.c   |  3 +-
>   .../hwtracing/coresight/coresight-tmc-etr.c   |  6 +-
>   drivers/hwtracing/coresight/coresight-trbe.c  |  4 +-
>   drivers/hwtracing/coresight/ultrasoc-smb.c    |  3 +-
>   10 files changed, 137 insertions(+), 76 deletions(-)
> 

[...]


>   	INIT_LIST_HEAD(path);
> +	cs_path->path = path;
> +	/*
> +	 * Since not all source devices have a defined trace_id function,
> +	 * make sure to check for it before use.
> +	 *
> +	 * Assert the mode is CS_MODE_SYSFS, the trace_id will be assigned
> +	 * again later if the mode is CS_MODE_PERF.
> +	 */
> +	if (source_ops(source)->trace_id != NULL) {
> +		rc = source_ops(source)->trace_id(source, CS_MODE_SYSFS, NULL);

I don't think we should do this. Doesn't this consume two trace IDs for 
each session? And I'm not even sure if it's released properly if it's 
overwritten.

It should be possible to consolidate the all the trace ID allocation to 
a single step when building the path, or another function that gets 
called just after the path is built. At the moment the ID can be 
allocated from about 5 different places and it's quite hard to 
understand, especially with these new changes. I have some of it coded 
up, let me finish it off and I can share it.

> +		if(IS_VALID_CS_TRACE_ID(rc))
> +			cs_path->trace_id = rc;
> +		else
> +			cs_path->trace_id = 0;
> +	}
> +	else
> +		cs_path->trace_id = 0;

[...]

> +/**
> + * struct coresight_path - data needed by enable/disable path
> + * @handle:		perf aux handle for ETM.
> + * @path:		path from source to sink.
> + * @trace_id:		trace_id of the whole path.
> + */
> +struct coresight_path {
> +	struct perf_output_handle	*handle;

This is only needed to avoid adding *handle to the enable function call 
signature, but having it here implies it needs to be stored. And then we 
need to manage the lifecycle of it by nulling it on deletion. All of 
this can be avoided by just adding handle to enable().

Unrelated to this patch, but I'm not sure why we were passing around 
void* for handle either. It just makes the code hard to read and implies 
some flexibility that doesn't exist. It's always "struct 
perf_output_handle", so we can change void* to that in the enable 
functions. I also have a patch for this that I'll share in a bit.

> +	struct list_head		*path;
> +	u8				trace_id;
> +};
> +
>   static inline void coresight_insert_barrier_packet(void *buf)
>   {
>   	if (buf)
> @@ -132,16 +144,15 @@ static inline void CS_UNLOCK(void __iomem *addr)
>   	} while (0);
>   }
>   
> -void coresight_disable_path(struct list_head *path);
> -int coresight_enable_path(struct list_head *path, enum cs_mode mode,
> -			  void *sink_data);
> +void coresight_disable_path(struct coresight_path *cs_path);
> +int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode);
>   struct coresight_device *coresight_get_sink(struct list_head *path);

This needs to be exported otherwise the build fails because you use it 
in a module in another commit. I assume you are building as static?



