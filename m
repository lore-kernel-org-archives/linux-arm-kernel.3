Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CFECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 10:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HW4bKBT8xrSY5GEouSxxGs5MztnP7UN7ylXE6WHX3iw=; b=UAL6MRtKa/+TjLR7uFMasmhaBJ
	nVb4ytm6f7osON96Rjym9X1/OzfSbXeD3xR4VgzJfHAPo0BIz0vrMhfPAxagiQTFHBX5XSqSvnmXL
	T3trsx+PuqWZSHJ6rUwkHK+3xuYDAVRp7kxjNNCrc1Q9Aaxc8uW6Odo1hN6puLzLnEciTNDbsTFoz
	FMcdwi+J30Qc5UL5WYvaYZt9+Q6revaXUWo95nW6reaPYQeXgRUYxGs4dLx9Ao6aztJCdEZUWT4pX
	M8c7oU4BZtjHyvwGiaLKgYKM1+oBTfGoBc0y/5ZgctjWPnBBn5bb8qtfrQdloMo3T3QLBrJa47jFc
	b1EtE+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nWT-00000005jRh-0pDI;
	Thu, 09 Oct 2025 10:05:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nWR-00000005jRH-06x9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 10:05:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46e3cdc1a6aso6209985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 03:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760004317; x=1760609117; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HW4bKBT8xrSY5GEouSxxGs5MztnP7UN7ylXE6WHX3iw=;
        b=CVgg6PpN/bJjt9/2iXIzSsSS1Ixkii4R43nVMXrxNLZPKStOraYHBvSdReqLyWUlBY
         jD4gUG23Qhth8xOx8COIKVIHFBAxQDKXbYHB4tounsyj+QpchYAOlxAoM4qZSHFy2she
         0ohfM2kjATD5H+eH/N+yfRjB03iVFrHA53/+8pc3zVs0TzyI8eso0OKBuRjBBgQryWzi
         5vKhdQ6Gz9kr50QC3XZ6RRT8wdqJvrLabWbZYEJR9xEFgqorOr3WrdJNyJ0oeHuXInIb
         SrEVnclMg0WgAHjmlyS2LSxXLzFOBQqAfhCPwWx9I70Q07UPgS/k5UHb60t6NXWOtLJC
         /Qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760004317; x=1760609117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HW4bKBT8xrSY5GEouSxxGs5MztnP7UN7ylXE6WHX3iw=;
        b=PSKr1HSOLyR/E/Qpt53KRMKyvmFLomRFHTjRwBNDkGHLHC4LEbOeh5SbohGlyepcEl
         tweKKfuI7T0rH1WzYwUQfIqQIWJ90dvkgRMEUjNoVBRQSJXcnzztdCYY0GLWeiu3HST8
         ddBWJXWkmMCnUNrqNadDCnwyr5bGXaG4u24cyWVH9Zdj0CmSOoJG4WRCaG6OBZBXX31/
         Ny16AYryMErWM9pcuTXIPC2fcdwoQ71k7KLFdCNgHwif3a2jmMMyDW6FLhfFAMZRlAXA
         nYpor11NOc8k2X2+j5PuHSxS6IWox4ngwl8jYxLb4FRK6CBa8oiDPjIdQmxwFhoPo3kz
         BwSA==
X-Forwarded-Encrypted: i=1; AJvYcCWw1Ifib1/hp2DAZgPAAUtsJV8TTDuqkRJzpkhSzh8f4QaXp/m9z2vueIJ4SK04bogMPh6L/+XJdhns3uDQ2qBV@lists.infradead.org
X-Gm-Message-State: AOJu0YwApJPBoMrYZllCvd7tdekwPtYtgaVSkYYA4ohQ3PoDlw/LyKzd
	pYP1H9jpFGzup8PxD2g8Eiap0WS4ixhFhQarnbmlFdDeI1VfWGElX/eQlBiUACXdMTg=
X-Gm-Gg: ASbGncs3PAbz8huBp8OJKotjy/SyM7Rg0QO5S+gNZez0fwTlOAIlG9BCh3Emidz9a4S
	9EO/ZZZ88awl0aveubRPk18k4B62YIDW1ETZZuOYzfFlcGjAMJc3JbebGpViGuBi1uDWN1Tdr0o
	EY/2FRkvNWNnaWBAFVi+wIdwgG+B836mXoqaQRua5pXzw5XbUKmjy9X7crJVwalE+WCK7P5iGoH
	HPfInOt2STXDlWXatD4atmokRU/JSRrNA3066Sk4KEgQy9iGZtEltK2cVqp06aKPW1duIIuJLSG
	LJkhagDDddJSyJco7S4Bhj96HXPeyWS+HExFkREXEkpu9Jc6udYA1+zrD8v92/B5TcdBN3fgdrO
	F4O+8wW+fKShUR0W97SSDsCA0p174G1wMRjpc9Y0tckHx/Bx9uRk5CV80
X-Google-Smtp-Source: AGHT+IF2PiR9z/mI1cDdm/wmX6qLTpwvXGJi3FCpoOMyAyMI+2Urjhh7Otn9B8hFvl7zxTCISy0nvA==
X-Received: by 2002:a05:600c:6011:b0:45c:b642:87a6 with SMTP id 5b1f17b1804b1-46fa28bbca1mr56829235e9.0.1760004317095;
        Thu, 09 Oct 2025 03:05:17 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9c07cbasm78311195e9.7.2025.10.09.03.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:05:16 -0700 (PDT)
Message-ID: <953b1861-d990-4c29-9593-3796d50ad435@linaro.org>
Date: Thu, 9 Oct 2025 11:05:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/25] perf sort: Support sort ASE and SME
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
 <20250929-perf_support_arm_spev1-3-v1-22-1150b3c83857@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250929-perf_support_arm_spev1-3-v1-22-1150b3c83857@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_030519_115295_9335AC6F 
X-CRM114-Status: GOOD (  16.71  )
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



On 29/09/2025 5:37 pm, Leo Yan wrote:
> Support sort Advance SIMD extension (ASE) and SME.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/sample.h | 9 ++++++---
>   tools/perf/util/sort.c   | 4 ++++
>   2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/util/sample.h b/tools/perf/util/sample.h
> index fae834144ef42105d08a59704ee75cd4852bbc5a..405876885e1f273c039cb67187c6e5c39c91a612 100644
> --- a/tools/perf/util/sample.h
> +++ b/tools/perf/util/sample.h
> @@ -67,12 +67,15 @@ struct aux_sample {
>   };
>   
>   struct simd_flags {
> -	u8	arch:1,	/* architecture (isa) */
> -		pred:2;	/* predication */
> +	u8	arch:  3,	/* architecture (isa) */
> +		pred:  2,	/* predication */
> +		resv:  3;	/* reserved */
>   };
>   
>   /* simd architecture flags */
> -#define SIMD_OP_FLAGS_ARCH_SVE		0x01	/* ARM SVE */
> +#define SIMD_OP_FLAGS_ARCH_SVE		0x01	/* Arm SVE */
> +#define SIMD_OP_FLAGS_ARCH_SME		0x02	/* Arm SME */
> +#define SIMD_OP_FLAGS_ARCH_ASE		0x04	/* Arm Advanced SIMD */

Same comment as the UAPI change. These are exclusive so it can be an 
enum rather than separate bits.

>   
>   /* simd predicate flags */
>   #define SIMD_OP_FLAGS_PRED_PARTIAL	0x01	/* partial predicate */
> diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
> index f3a565b0e2307a8adf159725f803df5fef0dff83..c7596e9ca089c170988dbc43a00f6973039261cd 100644
> --- a/tools/perf/util/sort.c
> +++ b/tools/perf/util/sort.c
> @@ -195,6 +195,10 @@ static const char *hist_entry__get_simd_name(struct simd_flags *simd_flags)
>   
>   	if (arch & SIMD_OP_FLAGS_ARCH_SVE)
>   		return "SVE";
> +	if (arch & SIMD_OP_FLAGS_ARCH_SME)
> +		return "SME";
> +	if (arch & SIMD_OP_FLAGS_ARCH_ASE)
> +		return "ASE";
>   	else
>   		return "n/a";
>   }
> 


