Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D77D132B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lh5+3KGOkaelrIB4Nl2tEoQoHe7RgDBZJ7Oaq3ExHpo=; b=cVzBMlkrLAN8sXESJNXEZROgzV
	ksdeBZIN5WmSiypMiSrf7EIl8i18c3UoAHBvVZFytzLA0+hgTOPbGIb3nGvBCJGALxzYtsJ2YLTeE
	CELnhaJzFzT5o9Zc87r5qwOhoDKhVPH2ynLyjBeQqG9R1vcfcPSQwOcoe/Q4Q6lM9eZb3WpZW/IU8
	wC20giI7PhS8g5l58a+dVT0ejeUfEDZzNu0My7LJLz+9jABkblEWaNcU8yFlTslPkw1WfjUo8S2Ov
	9bnhbtMVfYpXLd2bu1Rv3+xwiNl4sVzmdUOezEYwbVthaRw6u944Q/95DstJJR6ouNqICL9ddgK8u
	TUrQFrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vhD-0000000Dc8y-2NCj;
	Mon, 04 Nov 2024 11:56:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vY7-0000000DaVw-1Nq4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 11:47:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so2729295f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 03:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730720829; x=1731325629; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lh5+3KGOkaelrIB4Nl2tEoQoHe7RgDBZJ7Oaq3ExHpo=;
        b=Eg7MgyjmCkdOr6LTKAXoctpjSS9o+qGPqc6tetFg83oj4dPMCvhe2GWYTceiDQyTee
         5jxDCUX1Hw9F3a3d6+aATZ3a2uj5cOdBifKd3Yh5VudkRJ2YVSkzqfKdvVN1ndtLXvmk
         6kTB+EaP0WhN69QCZim+QxVbYGMr/C6giIcZ2hlHf0QlX66ICsRcssM4meO6vnRtgjeR
         Pr3Avr2MCpYDptHYkqGqWOmFWGI3haPyHKpAZn1nZeubp+vVcjDQEhjQ0+Ifq6HuH4g+
         oGVoV8mzsJ5h0r9GwVfwUfEZ6mtuI5uoZIBoWzCBR9x0E/TJDPHt0wF7YcYxH2bjVh4i
         bdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730720829; x=1731325629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lh5+3KGOkaelrIB4Nl2tEoQoHe7RgDBZJ7Oaq3ExHpo=;
        b=vo3NVLR4Bt9OEm6bVFDgAC2sFcz3V4nYc/honBZw7dPs6ClWu0+lFkjSksKj3lLyNz
         s5GMmKYJ2Nwpep1l37YF56fDQYyc7T7PPDslEjh+yKo98UbjlAyaFxFtYq2fOaY+kK1g
         d7oQ5Xz1UqC9Bu0ERhsrWKpKds2wYP9+bkW6WoolJ1OzpIHCSydDOOvJXCbbCczqc7h3
         EnfK6BC31+TPPPxOwVImlWuuWBzJNL09/RXu4b1RmzdIG5Cw+1CKV9ynyLy8ZvND8Rb0
         zMgbzLJlw2rMIPJ9Il9NuvI+3Nb0OFaRMBeFGqbVp1qdntHzljPVEQ2NnPXsFN/Rbrst
         bPaA==
X-Gm-Message-State: AOJu0YxlF0zcgQ1sTfrAVHIbPv5Pm13hMZJNvHKtoxkBVTIb3KliKk+y
	+WNiXHH1xWS5fFrizESoV7hTPG8OOsz8nAzdqua76lBM2yfe/9rAQuY3jlDjNm0=
X-Google-Smtp-Source: AGHT+IGpbkSWgNkUv+H2MDavqFNOI/hX8U3WpCkkxEpPxrbnjPpDbaoC59i6YBF7QSDjt9Pl6iuLIA==
X-Received: by 2002:a5d:64a1:0:b0:37d:4fe9:b6a7 with SMTP id ffacd0b85a97d-381bea1c1f4mr13084577f8f.36.1730720828889;
        Mon, 04 Nov 2024 03:47:08 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7c13sm13193474f8f.13.2024.11.04.03.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:47:08 -0800 (PST)
Message-ID: <ed15526d-9b1a-4204-92a3-4d319b03b790@linaro.org>
Date: Mon, 4 Nov 2024 11:47:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] perf arm-spe: Add support for SPE Data Source
 packet on AmpereOne
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Graham Woodward <graham.woodward@arm.com>
References: <20241031213533.11148-1-ilkka@os.amperecomputing.com>
 <20241031213533.11148-3-ilkka@os.amperecomputing.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241031213533.11148-3-ilkka@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_034711_413350_50CFFB65 
X-CRM114-Status: GOOD (  29.89  )
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



On 31/10/2024 9:35 pm, Ilkka Koskinen wrote:
> Decode SPE Data Source packets on AmpereOne. The field is IMPDEF.
> 
> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> ---
>   .../util/arm-spe-decoder/arm-spe-decoder.h    |  9 +++
>   tools/perf/util/arm-spe.c                     | 65 +++++++++++++++++++
>   2 files changed, 74 insertions(+)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index 358c611eeddb..4bcd627e859f 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -67,6 +67,15 @@ enum arm_spe_common_data_source {
>   	ARM_SPE_COMMON_DS_DRAM		= 0xe,
>   };
>   
> +enum arm_spe_ampereone_data_source {
> +	ARM_SPE_AMPEREONE_LOCAL_CHIP_CACHE_OR_DEVICE    = 0x0,
> +	ARM_SPE_AMPEREONE_SLC                           = 0x3,
> +	ARM_SPE_AMPEREONE_REMOTE_CHIP_CACHE             = 0x5,
> +	ARM_SPE_AMPEREONE_DDR                           = 0x7,
> +	ARM_SPE_AMPEREONE_L1D                           = 0x8,
> +	ARM_SPE_AMPEREONE_L2D                           = 0x9,
> +};
> +
>   struct arm_spe_record {
>   	enum arm_spe_sample_type type;
>   	int err;
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 9586416be30a..700d4bc8d8ec 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -103,6 +103,30 @@ struct arm_spe_queue {
>   	u32				flags;
>   };
>   
> +struct arm_spe_source_mapping {
> +	u16 source;
> +	enum arm_spe_common_data_source common_src;
> +};
> +
> +#define MAP_SOURCE(src, common)				\
> +	{						\
> +		.source = ARM_SPE_##src,		\
> +		.common_src = ARM_SPE_COMMON_##common,  \
> +	}
> +
> +static int arm_spe__map_to_common_source(u16 source,
> +					 struct arm_spe_source_mapping *tbl,
> +					 int nr_sources)
> +{
> +	while (nr_sources--) {
> +		if (tbl->source == source)
> +			return tbl->common_src;
> +		tbl++;
> +	}
> +

Hi Ilkka,

I think a simple switch statement here would be easier to follow than 
the loop, custom macro and then having the mappings in some other place:

switch(source)
case 0x0: /* AMPEREONE_LOCAL_CHIP_CACHE_OR_DEVICE */
   return DS_PEER_CORE;

etc...

> +	return -1;

And the default case can return 0xfff directly, which avoids the if else 
later only to convert this -1 back into 0xfff.

> +}
> +
>   static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
>   			 unsigned char *buf, size_t len)
>   {
> @@ -443,6 +467,11 @@ static const struct midr_range common_ds_encoding_cpus[] = {
>   	{},
>   };
>   
> +static const struct midr_range ampereone_ds_encoding_cpus[] = {
> +	MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> +	{},
> +};
> +
>   static void arm_spe__sample_flags(struct arm_spe_queue *speq)
>   {
>   	const struct arm_spe_record *record = &speq->decoder->record;
> @@ -532,6 +561,38 @@ static void arm_spe__synth_data_source_common(const struct arm_spe_record *recor
>   	}
>   }
>   
> +static struct arm_spe_source_mapping ampereone_sources[] = {
> +	MAP_SOURCE(AMPEREONE_LOCAL_CHIP_CACHE_OR_DEVICE, DS_PEER_CORE),
> +	MAP_SOURCE(AMPEREONE_SLC, DS_SYS_CACHE),
> +	MAP_SOURCE(AMPEREONE_REMOTE_CHIP_CACHE, DS_REMOTE),
> +	MAP_SOURCE(AMPEREONE_DDR, DS_DRAM),
> +	MAP_SOURCE(AMPEREONE_L1D, DS_L1D),
> +	MAP_SOURCE(AMPEREONE_L2D, DS_L2),
> +};
> +
> +/*
> + * Source is IMPDEF. Here we convert the source code used on AmpereOne cores
> + * to the common (Neoverse, Cortex) to avoid duplicating the decoding code.
> + */
> +static void arm_spe__synth_data_source_ampereone(const struct arm_spe_record *record,
> +						 union perf_mem_data_src *data_src)
> +{
> +	int common_src;
> +	struct arm_spe_record common_record;
> +
> +	common_src = arm_spe__map_to_common_source(record->source,
> +						   ampereone_sources,
> +						   ARRAY_SIZE(ampereone_sources));
> +	if (common_src < 0)
> +		 /* Assign a bogus value that's not used for common coding */
> +		common_record.source = 0xfff;
> +	else
> +		common_record.source = common_src;
> +
> +	common_record.op = record->op;
> +	arm_spe__synth_data_source_common(&common_record, data_src);
> +}
> +
>   static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
>   					union perf_mem_data_src *data_src)
>   {
> @@ -606,6 +667,8 @@ static u64 arm_spe__synth_data_source(struct arm_spe_queue *speq,
>   	union perf_mem_data_src	data_src = { .mem_op = PERF_MEM_OP_NA };
>   	bool is_common = arm_spe__is_ds_encoding_supported(speq,
>   						common_ds_encoding_cpus);
> +	bool is_ampereone = arm_spe__is_ds_encoding_supported(speq,
> +						ampereone_ds_encoding_cpus);

I know this probably already works, but we don't really need is_common 
is_ampere etc, it will only grow anyway. All we need is a list of midrs 
and function pairs. That also avoids doing is_ampereone even after we 
already know is_common == true.

static const struct data_src[] = {
...
	DS(MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2), common_ds),
	DS(MIDR_ALL_VERSIONS(MIDR_AMPERE1A), ampere_ds),
	{},
...
};

"arm_spe__is_ds_encoding_supported" then becomes a direct call to 
"arm_spe__synth_ds" and we can drop the is_ampereone and is_common vars. 
Then adding new ones doesn't require changing the function anymore.

>   
>   	if (record->op & ARM_SPE_OP_LD)
>   		data_src.mem_op = PERF_MEM_OP_LOAD;
> @@ -616,6 +679,8 @@ static u64 arm_spe__synth_data_source(struct arm_spe_queue *speq,
>   
>   	if (is_common)
>   		arm_spe__synth_data_source_common(record, &data_src);
> +	else if (is_ampereone)
> +		arm_spe__synth_data_source_ampereone(record, &data_src);
>   	else
>   		arm_spe__synth_memory_level(record, &data_src);
>   


