Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A6BC18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AHsRBeWrg5AIl4T2vlSKQMrg1QVH5JjtnKAUlo99n4=; b=ulwociFC13t3tJHfD6qCnA+0ue
	Cts4x0/0oYjNwvvpqZHvGp2rwpv84arYCmHgHiQ5Ch3/PAW4g0Rl9AUJzm8sGjc9aNaERrAnK9kGZ
	sxhBMrQ5QYXltIVuRSELxmvw4836npKN+aD3TZgF1aaFG1ytnF7s01FNf0+Ns7uvhSqFRhD36x0F4
	JLK47LDcIlXq7d3FdGkdRsySmDOEh8SKL4DhrwrSizYZnofV3Dsu87o8L8Wg9JpLM5/0Z/q9Oj89Q
	kladGrGPd4MFNlLrcBs+TmgMLyKW5W1IDk43OIeay7wUnTytZeCvt1pNFRRHx3OFsXDovr9ImoR7z
	PRfg5Oxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHaf-00000003woM-2HZy;
	Wed, 26 Feb 2025 13:36:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHXF-00000003wZv-2l9Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 13:33:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-390dd3403fdso397436f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 05:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740576792; x=1741181592; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0AHsRBeWrg5AIl4T2vlSKQMrg1QVH5JjtnKAUlo99n4=;
        b=XnkDTFjnOLVylkVTstqyuQ6pyhGPRXugZ4VZiqAH5jGyGCrSKfTe4imitjAWwbyUiT
         BVmg44UcWgXhATxHCsL/ydTY36K+Ej7XT7lkDADnbhd/6m8W07sbjURiPM+hAOYZ9VEQ
         VIq3H6EjqYEZheKDVTugpTHBmuhoXLEsWGL9o8yCRON8SNj6sN1tZLB5exIl7RUUPVHm
         A0NQtNXgtH2EQOb4QAYMbvj1Ks4bj9fZORw6h/fH4Lu5Q17lSwtZIELfu67ZFD8dlFtX
         4tsX2e/YPZeEznroFnWPGWEkH29G+UHrbQm30rE94cTI9FLsADot/oF0yuweOeG9ZuZu
         QjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740576792; x=1741181592;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0AHsRBeWrg5AIl4T2vlSKQMrg1QVH5JjtnKAUlo99n4=;
        b=exEPZAc3P5QannkOsMKKoB8APchdoJniDJQxB7He45p/tBDFZ5oax52lq9J7/HUXkP
         c+rM/kzLtbu2nTzlb0YzORyRxgCXW1l63QOz/AEnar8ryHmMvMngfDiXqMzH/4mOLpnu
         oXABoSRlGugSH/etf/1um/jrPlimR1PzZwn/LvCjUObMg+QKxArI8MrMdbt5D2IhcgI1
         Ze3M23wCdmPBgIjIuAJ115zIwz8nU5o9E2qGQZqTZyo8uGAWTVd4YQ8r3gpdc8SbTxhg
         xsVGUhzl98KFt3KNXAPMgniFZitCNueMTxKVI88TIN4Ild1OcfYXrXgi6Y1VdpRLGCXK
         wPNA==
X-Forwarded-Encrypted: i=1; AJvYcCXV93AU1CQAKQhAgGHLsqmOckkaDznWsWtDV6NtcezsYpu+pB3HBpnwHjUeHoP5EZh4PGn5paRVBNkjYTIs8raz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw18Iei5rKMHBVs3ncLE2CS7IXOUMl0+sBR62/U8Bz99FTARNMT
	Fh058JoFHHReeEMXsei+uTq4DNGLvSqeyvbe1yzAv8xIIXVPgmL6x0aDyOx+ZRg=
X-Gm-Gg: ASbGnctjhTtXVNIv2hRxjmAyadU3sGxXS1bvGgHExSKZLZVh1DzMrZK58jh2ZTczEU/
	Fp+7nA88tjJeEGeeb+uKf2/wgTXzBiqd6yo1j1fxFjwIfm8XEJREMpRPup7TlZ7TWa7KCAI5C+3
	koVzu7idhZuXJRRDtPp7TEu7iD5PA5vJntk6gVgBFgtRNpBJjCWPKvk4+eVWMmVkoyrn8hNJMNf
	B14dui4SJ+OM7pkyBQNzGe3fTDc6xWCImWnRwu0CDAkDs9unEQX81oW8HHtaSqGd2tsq2fFQO/I
	nLX1n5fO0BpAxtTsaocjA0sHP1/DxImh0g==
X-Google-Smtp-Source: AGHT+IEMwTnaV1lxB24cLJCmw9AEkuHApONnAq+Ctb9Vrt09pWCW31XxqxzLWZRAu38Bw7cikwZPiw==
X-Received: by 2002:a05:6000:18af:b0:385:d852:29ed with SMTP id ffacd0b85a97d-390d4f8b520mr2586635f8f.36.1740576792150;
        Wed, 26 Feb 2025 05:33:12 -0800 (PST)
Received: from [192.168.1.247] ([145.224.66.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd882a37sm5699140f8f.51.2025.02.26.05.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 05:33:11 -0800 (PST)
Message-ID: <e7fea60f-dac3-4762-9139-cf096d7bc121@linaro.org>
Date: Wed, 26 Feb 2025 13:33:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] perf arm-spe: Fix load-store operation checking
To: Leo Yan <leo.yan@arm.com>
References: <20250217195908.176207-1-leo.yan@arm.com>
 <20250217195908.176207-7-leo.yan@arm.com>
Content-Language: en-US
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Mike Leach <mike.leach@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>, Will Deacon <will@kernel.org>,
 Graham Woodward <graham.woodward@arm.com>, Paschalis.Mpeis@arm.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250217195908.176207-7-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_053313_864713_C9CA94A2 
X-CRM114-Status: GOOD (  21.83  )
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



On 17/02/2025 7:59 pm, Leo Yan wrote:
> The ARM_SPE_OP_LD and ARM_SPE_OP_ST operations are secondary operation
> type, they are overlapping with other second level's operation types
> belonging to SVE and branch operations.  As a result, a non load-store
> operation can be parsed for data source and memory sample.
> 
> To fix the issue, this commit introduces a is_ldst_op() macro for
> checking LDST operation, and apply the checking when synthesize data
> source and memory samples.
> 
> Fixes: a89dbc9b988f ("perf arm-spe: Set sample's data source field")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 251d214adf7f..0e8e05c87fd7 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -37,6 +37,8 @@
>   #include "../../arch/arm64/include/asm/cputype.h"
>   #define MAX_TIMESTAMP (~0ULL)
>   
> +#define is_ldst_op(op)		(!!((op) & ARM_SPE_OP_LDST))
> +
>   struct arm_spe {
>   	struct auxtrace			auxtrace;
>   	struct auxtrace_queues		queues;
> @@ -681,6 +683,10 @@ static u64 arm_spe__synth_data_source(struct arm_spe_queue *speq,
>   {
>   	union perf_mem_data_src	data_src = { .mem_op = PERF_MEM_OP_NA };
>   
> +	/* Only synthesize data source for LDST operations */
> +	if (!is_ldst_op(record->op))
> +		return 0;
> +
>   	if (record->op & ARM_SPE_OP_LD)
>   		data_src.mem_op = PERF_MEM_OP_LOAD;
>   	else if (record->op & ARM_SPE_OP_ST)
> @@ -779,7 +785,7 @@ static int arm_spe_sample(struct arm_spe_queue *speq)
>   	 * When data_src is zero it means the record is not a memory operation,
>   	 * skip to synthesize memory sample for this case.
>   	 */
> -	if (spe->sample_memory && data_src) {
> +	if (spe->sample_memory && is_ldst_op(record->op)) {
>   		err = arm_spe__synth_mem_sample(speq, spe->memory_id, data_src);
>   		if (err)
>   			return err;

Reviewed-by: James Clark <james.clark@linaro.org>


