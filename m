Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2F9D49232
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdtwwIJNAU9UljeByxBUVUW2Rebc/JHtWDPV4PBUMDU=; b=U60cYkCff0UNee1SbmDudi0TBu
	WYfN0YfuS7WefQIK0OS0u2PGiEJEtvYuPFOCngqDKjW7jm+JwXe8M4HExKXlTHF4Zxx185m/jkqiP
	niMVUSlhDuOojClzwNuOBc++/+FjrDwvE/VG4QCUlCpScExdq5t/ZMslnGOxJhE07/ho1KkgkInZ1
	FIKsu8TkMLAmPKMf+m2dH0rtMniUZd0HdpyPWGwZZUqG1XADGz7I7JifctMsanJ35Kuev2uj+XEJR
	Jdy+84GBvJT+HM+NEsCo4mftDLP7R5Guf7BuMBtKKmBEsxNwIYPKCmTLVKiFMKB0ydpMzewtnJ9e+
	eVLECsXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4dM-00000000e1c-2QjM;
	Fri, 12 Dec 2025 15:00:40 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4dC-00000000e0v-3cKD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:00:33 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so2572078a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765551629; x=1766156429; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tdtwwIJNAU9UljeByxBUVUW2Rebc/JHtWDPV4PBUMDU=;
        b=XCRbkkGszJBIwXAGNcyXrPDmTvOwdIeBibGKIJoO/Yn4+NVZ30Wbc68y6fGvSuRtFR
         rGxHrEQPGKb3U5KM5MQWTWGjmhAZNko7JrsZoAvUL7x1MJsUX1lwkKWGxTRcXq7cWTKR
         iWqCrl9rNtEI90SZSyCBZRkV3GC1BYBwxVqeXAb2q5lkcO9j2h8Rtjr1eKoxvV05ZeJ/
         dj2L4bDROM0a6/XSQHxnzOGHhSfk2Dd8APrjo4DfC7zePCTVHySZlk2YlBXQPtCZpIjO
         KH9OwWkNWP5iDCZ+dawXY7RNF91wUikgLbjQ6NdmOqZIfvv7hx+rybwEjy8MLVg2DQ99
         5O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765551629; x=1766156429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdtwwIJNAU9UljeByxBUVUW2Rebc/JHtWDPV4PBUMDU=;
        b=ZQ85VPplPui9rMY5EwYj3jTR55E3ZBoVg4iyAkDM7W8velvG8E2UonNFnzzNITJmoy
         eXdrghR1YWx2G4jgEi7embJZjXdyVMzKs85HS5g/t5iu7QoETxRTsuxFnxYrtmHcMW4I
         P81YrqGM4yfMoQVC/j9SonnF0kRf2wo0ty8cewscxIXQV5jSgVSbEfdEhOGcwcZxObrV
         h9d49MIx8IH7gCX9KGYkBK1VD++CN5xzmzfRhlPnquYzfZJo3cvFzMTW4pxxuX4KNP9z
         3Wio+If6zFdzeW5DeWS7pDfvLsrIgxjnMJ+2Qk+yLXcxqMyTdp4KAKz57fv3aOvTbPZd
         UhVA==
X-Gm-Message-State: AOJu0YxpwGt4HlLdQ+M5zzVbMiLe952QFZ2FP8bLZY72YUNamQPA1ANx
	rtBa7D67YgrmlJKxxQg85IR6EOZayk75rxApmzjZSqFoDL42GF7Jrq1WO/ZgOZbqISE=
X-Gm-Gg: AY/fxX5b1eJPb+142ccqhsxXQL4Ia1VZXRImDq6MppvVbMwGYopc8T4w1dhWxWqemjb
	ZgR71UHHVT+Oi/nS9fgDJDssBPN4AOBqe8RqO9uxLstTPIB/WD/91TRsAXnH91f+ocQ/LmJTOkS
	tkBiRmA3WW0+vtysZ3kPdbaNCcLHwDZrVb923b3towvk7JfRAviaTCrrow+4QtWq0cMf2DbI0X2
	RFv0BOZ4ZTtiopafxBp2crJcJFo6GG3JiKVIpNzOcjymh0oDjTwoGnFMiNRlh1hhQ0P3vT8kOPu
	wRu+GB3ZpTBgIS3xYfdUc8TkGdY8/TOKUplDyDkzvZga7DOQSLqgFxsAghhHVNrAvP4L5Y1+q0i
	K2sEC1Br1Adk2s1RVtldPpOmwhFdN7DtPpG/nAPuPkE3eEsspFbzU2TrXXAPTD+O+Zj3pz4lSaJ
	qZgzuNX+w02FgUnJPZ78LM
X-Google-Smtp-Source: AGHT+IElfvfWwMZz1cNmYrEtoT0T6NC0VQveo08Mp01q2n8OVYW3xlLRaecHrQm7FbKCC25OI7vsMg==
X-Received: by 2002:a05:6402:5209:b0:649:9251:1115 with SMTP id 4fb4d7f45d1cf-6499b1f369bmr2115809a12.29.1765551628638;
        Fri, 12 Dec 2025 07:00:28 -0800 (PST)
Received: from [192.168.0.108] ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-649820517d6sm5453544a12.13.2025.12.12.07.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 07:00:28 -0800 (PST)
Message-ID: <c3fa97dc-3377-4a62-9fc1-561fc904cf5c@linaro.org>
Date: Fri, 12 Dec 2025 17:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] perf c2c: Update documentation for Arm SPE events
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Mike Leach <mike.leach@linaro.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>
References: <20251212-perf_c2c_update_event-v1-0-29a26c7a949b@arm.com>
 <20251212-perf_c2c_update_event-v1-2-29a26c7a949b@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251212-perf_c2c_update_event-v1-2-29a26c7a949b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_070032_405192_26791CA2 
X-CRM114-Status: GOOD (  15.83  )
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



On 12/12/2025 14:44, Leo Yan wrote:
> Document the default Arm SPE events used by the perf c2c tool.  Make a
> minor adjustment to the PowerPC entry for formatting consistency.
> 
> Suggested-by: Al Grant <al.grant@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/Documentation/perf-c2c.txt | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/Documentation/perf-c2c.txt b/tools/perf/Documentation/perf-c2c.txt
> index 40b0f71a2c44eb642ff3bb234631a614b7c4fc9d..b765ae2511d2418a63092fb8a90a61faa335ac91 100644
> --- a/tools/perf/Documentation/perf-c2c.txt
> +++ b/tools/perf/Documentation/perf-c2c.txt
> @@ -170,11 +170,16 @@ following on AMD:
>   
>     ibs_op//
>   
> -and following on PowerPC:
> +following on PowerPC:
>   
>     cpu/mem-loads/
>     cpu/mem-stores/
>   
> +following on Arm:
> +
> +  arm_spe_0/ts_enable=1,pa_enable=1,load_filter=1,min_latency=30/
> +  arm_spe_0/ts_enable=1,pa_enable=1,store_filter=1/
> +

Technically there's 3 different ones on Arm because 
PERF_MEM_EVENTS__LOAD_STORE is also supported. Although I question the 
usefulness of these without labels or any text to say what the 
difference is, but that's an existing problem.

>   User can pass any 'perf record' option behind '--' mark, like (to enable
>   callchains and system wide monitoring):
>   
> 


