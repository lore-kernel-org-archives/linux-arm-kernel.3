Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92421CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQxFfMbVY694nwqT/Zr69fBeRewrLZzBFyNEZe7ythI=; b=kEgG5JQAeZ4XDAq2jLrbc8XNGc
	GctodT7EQb19HlGrFMtM1bTICbeEVm+XVpMwO+6CIeIYi15OqS1lmQXD9iOWK2RVo+FROITKpt8iZ
	rQjQW379YD28CuahOBb6edNoWOyd9Lu0dGahMShCKkAWHhq7jzYt95qIaej+8/a+z45134gpRwcgL
	g4aI0+kdZug8lGtsZ692PkRG54hc+Qcv0L3ZxToyUcpi5XG0G/7SzYnPK4KnA8iWcyLx47gv/9uBy
	VZ/3TK7Fi+bqs8ZF3GS/9TPkBLtD8xBw8ZyVup2f02XYwz+OoN4A2ePs2MT4hAwizZAaXfjSv6NEg
	mpFqMbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphrR-000000046Zc-01rV;
	Sat, 23 Aug 2025 06:36:21 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTHE-00000002vlk-3v3r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:02:02 +0000
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2445813f6d1so3405335ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 08:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755874920; x=1756479720;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQxFfMbVY694nwqT/Zr69fBeRewrLZzBFyNEZe7ythI=;
        b=VxrzOn2UWbbjvQhG7WOvnfigi8tmjYvGedURsxjEXbdXVAfPZW6LQJ2oSrn9BqN88t
         CR3CRvho0+tUm6PAuEdeZVrH3JDL9ETXNC9Yfq50PBKBICgKrSsf20JcGB8NnBtaixce
         PISDnas4y0FFkgpey9EwgY0paVa9Go9/FmJPOwO++JlaYXE/dkF3UY0u2qkJuFgDFGns
         wsk+aDnPmlZ3+Vbhs7hmc025A5/GW2cbHVgOUFiPSc8xLPbJBGachzYlU8ACe2TNMMwF
         tjA7gWvTCUoa2uAZ41pJtHt8NX6m5meV3EHKy3OjOseI8PCjPRCVucnlBHzk/hXle3E0
         pAEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlEsLmqGkQNzw20ioH4dvvIVFL/l1CehFEEJnHiG0EaEtOchROww0uAs0uLllLu8Cacx/Rdu+PPKdJh9PM1U2o@lists.infradead.org
X-Gm-Message-State: AOJu0YzxKAgrHGjpvQEmodTAxn1JVN8fMaMCavbOkOfdDXPZy1BEp6h+
	29WG2ESfGASsZ/JNNGBQDjPhdVUxQzV2DuP3XDsuUnEfiRP9s+TQUpYL
X-Gm-Gg: ASbGncvhQNKFzfNPnA/s27AgDVo9fu58kBsLukKFQMLoFl7Vbxye+BTlJuc2nSg9f30
	JWjHJHVJCgX6p8oKvZnmgcVrp8WO2l0aBNI5wDEgv3b91xfz+BJP1z5UNYv49t5n7xDWtcaXl27
	Tcc0z1ur7YBb4evCkmMCqYfe79UvJYYiKs3n9JiuEwzdL4G1HVl3zS+xMPlTMKKo5US1gacfbVo
	HbGE3Sodb0CX10oLw/jAVw7XGv4mGL6OvK/Ao4cdCE2tTPAC/XsB5X7WwgAqs+tSP5G2VCd/Xik
	sz9p52BTCYx2MrV1ndAdWHiChwxk/j6XYO3Levz4t8H2AStQDRnrEQumz0WuiwhQ1c2aeZ3K5u4
	Tva5u/KPIe5zwwX+QeBpceM7ItaCN43h3UUiYlzvs/yqM7u4rYa0KMgckjPsSShkV7iT7mUuvVZ
	qgNRLfd9uVXMqe8nK7JQ==
X-Google-Smtp-Source: AGHT+IG8h+rTjIYpDUhkLX0FKz+yq6EYhXDcqOADp2zpIy/mkPHlai6jtgygN4ifJj/kHfxfd3C9eg==
X-Received: by 2002:a17:902:e5c8:b0:245:f5fd:8eea with SMTP id d9443c01a7336-2462ef8af80mr24163935ad.8.1755874918990;
        Fri, 22 Aug 2025 08:01:58 -0700 (PDT)
Received: from [192.168.50.136] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed53e779sm85642335ad.160.2025.08.22.08.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 08:01:58 -0700 (PDT)
Message-ID: <e935e36a-1c5f-4706-830c-95cf6d9e6dc7@kzalloc.com>
Date: Sat, 23 Aug 2025 00:01:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm64: Sync ESR_ELx_EC_* macros in
 arm64_exception_types.h with esr.h
To: Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250814151452.618765-2-ysk@kzalloc.com>
 <20250821113825.GA745271@e132581.arm.com>
Content-Language: en-US
From: Yunseong Kim <ysk@kzalloc.com>
Organization: kzalloc
In-Reply-To: <20250821113825.GA745271@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_080200_972439_24ADB553 
X-CRM114-Status: GOOD (  18.87  )
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

Thank you for the review Leo!

On 8/21/25 8:38 PM, Leo Yan wrote:
> Hi,
> 
> On Thu, Aug 14, 2025 at 03:14:53PM +0000, Yunseong Kim wrote:
>> Update perf util arm64_exception_types.h to match the exception class
>> macros defined in tools/arch/arm64/include/asm/esr.h. This ensures
>> consistency between perf tooling and the kernel header definitions for
>> ESR_ELx_EC_* values.
>>
>> Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
> 
> Thanks for working on this.
> 
> This patch still misses couple macros, please see below.

I nearly missed that. Appreciate your checking.

>> ---
>>  tools/perf/arch/arm64/util/arm64_exception_types.h | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/tools/perf/arch/arm64/util/arm64_exception_types.h b/tools/perf/arch/arm64/util/arm64_exception_types.h
>> index 27c981ebe401..29931bf19062 100644
>> --- a/tools/perf/arch/arm64/util/arm64_exception_types.h
>> +++ b/tools/perf/arch/arm64/util/arm64_exception_types.h
>> @@ -33,7 +33,7 @@
>>  #define ESR_ELx_EC_PAC		(0x09)	/* EL2 and above */
>>  /* Unallocated EC: 0x0A - 0x0B */
> 
> #define ESR_ELx_EC_OTHER	(0x0A)
> 
>>  #define ESR_ELx_EC_CP14_64	(0x0C)
>> -/* Unallocated EC: 0x0d */
>> +#define ESR_ELx_EC_BTI		(0x0D)
>>  #define ESR_ELx_EC_ILL		(0x0E)
>>  /* Unallocated EC: 0x0F - 0x10 */
>>  #define ESR_ELx_EC_SVC32	(0x11)
>> @@ -46,7 +46,10 @@
>>  #define ESR_ELx_EC_SYS64	(0x18)
>>  #define ESR_ELx_EC_SVE		(0x19)
>>  #define ESR_ELx_EC_ERET		(0x1a)	/* EL2 only */
>> -/* Unallocated EC: 0x1b - 0x1E */
>> +/* Unallocated EC: 0x1B */
>> +#define ESR_ELx_EC_FPAC		(0x1C)	/* EL1 and above */
>> +#define ESR_ELx_EC_SME		(0x1D)
>> +/* Unallocated EC: 0x1E */
>>  #define ESR_ELx_EC_IMP_DEF	(0x1f)	/* EL3 only */
>>  #define ESR_ELx_EC_IABT_LOW	(0x20)
>>  #define ESR_ELx_EC_IABT_CUR	(0x21)
>> @@ -55,7 +58,7 @@
>>  #define ESR_ELx_EC_DABT_LOW	(0x24)
>>  #define ESR_ELx_EC_DABT_CUR	(0x25)
>>  #define ESR_ELx_EC_SP_ALIGN	(0x26)
>> -/* Unallocated EC: 0x27 */
>> +#define ESR_ELx_EC_MOPS		(0x27)
>>  #define ESR_ELx_EC_FP_EXC32	(0x28)
>>  /* Unallocated EC: 0x29 - 0x2B */
>>  #define ESR_ELx_EC_FP_EXC64	(0x2C)
> 
> #define ESR_ELx_EC_GCS		(0x2D)
> 
> Thanks,
> Leo
> 
>> -- 
>> 2.50.0
>>

I’ve sent out patch v2, Thanks everyone!

Best regards,
Yunseong Kim



