Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E75BD0C5E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 08:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5k2Y+wXN6Hav1m44Bf7BhVnqUudrumhttYGCCLQPyAo=; b=1Viz62qk/5J/jljT21ecOv54ie
	9xO0ef6r9QEZ96hoJqEE1+DuQ9ik7FdX2+CefVPm5HZuAQKkl7ruOFtN5WZt3idgjDaWtcesV3/Ep
	LwU/zhDmJJymul2VzU73HKoW/i299oCxq+qYATAV9uqCe7k3PBLO/pU4bK4AujBhillslzpj54auX
	uUeYSqbSqs8mSOrEJoocLWW0XKlBb87QKQLxIDml+gowG6Y1cn93Eq2jAPnpd01M0NueIDfFA54Ed
	OEfs0nniwqW5yZq3OSearAOOgVElC5LjeATDnbx+DheoSVxdXR6TFX745kSYUt6/0826dpl1NUajb
	cW2IEwhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Fx3-000000031hA-0uot;
	Fri, 25 Oct 2024 08:45:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FnX-00000002zzH-3Inh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 08:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5k2Y+wXN6Hav1m44Bf7BhVnqUudrumhttYGCCLQPyAo=; b=BxGPmNX61CFS/0fTTyREX9xBdd
	IIZMrQR/T/7+UECBU4nmFZ64wMe5uyoJCYx+T6RRIt8h+W+jC2Qa9D+Ff0J5LpiALe/KZERTU1aoa
	VM33n8VZ0u0RGYyX98j1aHejTd1cb9QCuNSxjPrWy1adl4HDkoIRCqu0UgpODchoG/aUe8R9iuWKW
	w1w+R9TkRzZTaf9VcaqDIA5IRslp8R60BOVhq1lR8hZAMfNq5TvWOdBcpw0tMhnyCv65XaD4GP7dP
	AUDKHQ+AArSnUWw16tbK04IhexHRRf3sA5k7EGPYlXAJDTc9HksC/s7ovTzfL19BEgPpidNwBzQd6
	BN4Pq5Yg==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FnP-00000008s4t-2gPY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 08:35:53 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so1399208f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 01:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729845341; x=1730450141; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5k2Y+wXN6Hav1m44Bf7BhVnqUudrumhttYGCCLQPyAo=;
        b=xjNpYhutRyToZ1sOz/b84e6IoMmoeL71tH9OEBXYWsMbM1UdYoQohWSOfbJ6uZC84U
         avVC84miA1h1unGyC7l827TDUdPWfUQV5le+F0oO79HCzQ7Cx41clNsJvJ2HhIWCaHJY
         vIfLRH8F2BAYP1XJTBoD1yoO3sNpVb8aZoWk+q5zV4HxhxZy8qiKh7I6AMNE+6oaEhqX
         Kz0VX1SAVwUw9T9P2t9/Kcplyk8zcDIcyyjiJTrNzfxAWzL+qC0CUIuQye4VyGB1Vszi
         +12bWrDtX/v/+TAzF/2vjL6Mg4d5bv02z5r1R8ls+MKqkx1WCNZCIrvFuCnBNPR2OxN2
         O60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729845341; x=1730450141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5k2Y+wXN6Hav1m44Bf7BhVnqUudrumhttYGCCLQPyAo=;
        b=h79/xYDBqBzhw+ZvfbuLM/TsGzyiaedN2okxUHmsJsMRpOWkUzdCg76N8XkqizoF0N
         Z0VatLcRx72vRYL5c0ZtQbyMEdOiGJNClL/H5KHomACvL5MsFwd4GnJR4EG7/4QAPlxf
         ml3G2Cn/05+rxG8aEyPN8A9EflD7H40dz9m4mrGMlLXUHSPqxOVHBjat0/Wuo05+ZkG2
         +MvSKeD/9tRXRQWIujyBij0Vy+tSJ9CChcL0bTC6xnmOiFvu3YMLDsdLDUeLoqnMoj0T
         gD/ybHtsaOfvs755H/iImRDlpDgZ4PTp529QJuIchK+LcmmNH1CTJFXnH85MAxLVQrL8
         UY6w==
X-Forwarded-Encrypted: i=1; AJvYcCWv1QJ6DjlUgRpG2f6lsA9zNjzgESY5YxeKprnpcZ/SO2TeHV/CoWm5+9d5O8acHV919WZdDklOXJGdfn2SH57i@lists.infradead.org
X-Gm-Message-State: AOJu0YyjsQCP7OuWQ6540IjFz/PgUpPAzNLm66TFZwfGi1aR8tbZ8j8o
	B2wbmQlO6zI0FgMQU9Rsvj7NNbNY57Ul4eaxeLhYqvKAB6o1wEtrH/ppnCxoatY=
X-Google-Smtp-Source: AGHT+IF1Dm7/LCI5G/4YSRLj2pNyCW0v5xHJasePqVKzqYtzpxJfSsCdFuesRxA5iyqBt/qELFK6fA==
X-Received: by 2002:adf:e2cb:0:b0:37c:d1c7:a0c0 with SMTP id ffacd0b85a97d-37efcf1af2amr5912704f8f.30.1729845341033;
        Fri, 25 Oct 2024 01:35:41 -0700 (PDT)
Received: from [192.168.68.136] ([145.224.65.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3c7f6sm945622f8f.41.2024.10.25.01.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 01:35:40 -0700 (PDT)
Message-ID: <963d58e4-c00e-40b5-bb64-97476807ed61@linaro.org>
Date: Fri, 25 Oct 2024 09:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf arm-spe: Add support for SPE Data Source packet on
 AmpereOne
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>
References: <20241024233035.7979-1-ilkka@os.amperecomputing.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241024233035.7979-1-ilkka@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_093549_768793_78473123 
X-CRM114-Status: GOOD (  20.55  )
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



On 25/10/2024 12:30 am, Ilkka Koskinen wrote:
> Decode SPE Data Source packets on AmpereOne. The field is IMPDEF.
> 
> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> ---
>   .../util/arm-spe-decoder/arm-spe-decoder.h    |  9 +++
>   tools/perf/util/arm-spe.c                     | 61 +++++++++++++++++++
>   2 files changed, 70 insertions(+)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index 1443c28545a9..e4115b1e92b2 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -67,6 +67,15 @@ enum arm_spe_neoverse_data_source {
>   	ARM_SPE_NV_DRAM		 = 0xe,
>   };
>   
> +enum arm_spe_ampereone_data_source {
> +	ARM_SPE_AMPEREONE_LOCAL_CHIP_CACHE_OR_DEVICE	= 0x0,
> +	ARM_SPE_AMPEREONE_SLC				= 0x3,
> +	ARM_SPE_AMPEREONE_REMOTE_CHIP_CACHE		= 0x5,
> +	ARM_SPE_AMPEREONE_DDR				= 0x7,
> +	ARM_SPE_AMPEREONE_L1D				= 0x8,
> +	ARM_SPE_AMPEREONE_L2D				= 0x9,
> +};
> +
>   struct arm_spe_record {
>   	enum arm_spe_sample_type type;
>   	int err;
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 138ffc71b32d..04bd21ad7ea8 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -515,10 +515,69 @@ static void arm_spe__synth_data_source_generic(const struct arm_spe_record *reco
>   		data_src->mem_lvl |= PERF_MEM_LVL_REM_CCE1;
>   }
>   
> +static const struct midr_range ampereone_source_spe[] = {
> +	MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> +	{},
> +};
> +
> +static void arm_spe__synth_data_source_ampereone(const struct arm_spe_record *record,
> +						 union perf_mem_data_src *data_src,
> +						 u64 midr)
> +{
> +	if (!is_midr_in_range_list(midr, ampereone_source_spe)) {
> +		arm_spe__synth_data_source_generic(record, data_src);
> +		return;
> +	}
[...]
>   static u64 arm_spe__synth_data_source(const struct arm_spe_record *record, u64 midr)
>   {
>   	union perf_mem_data_src	data_src = { .mem_op = PERF_MEM_OP_NA };
>   	bool is_neoverse = is_midr_in_range_list(midr, neoverse_spe);
> +	bool is_ampereone = (read_cpuid_implementor() == ARM_CPU_IMP_AMPERE);
>   

Hi Ilkka,

I think this read_cpuid_implementor() is for the device that's running 
report, rather than record. You need to use the midr that's saved into 
the file.

But it looks like you've done that for is_midr_in_range_list(midr, 
ampereone_source_spe) above. Is it possible to just do that and not 
read_cpuid_implementor() and then it's done the same way as neoverse and 
also works off target?

Thanks

James


