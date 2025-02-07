Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAEAC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7+57nAAv8QP4u/IKjzXqebMrcWsPnCBFtc7wCFJPUQ=; b=l/1epnG10TnZ2VtU5xD0dDrEfk
	W8O8TSqDRyZO9J6mXCDfhW01qryxntgg/yzQVohr4RqQNmGwtAFiysKjuo/MaEfQYPK7cngUABBj8
	YxaJkPgB02NXj3C3qJgKBCif8QDaUaPz4OFjI5ni6GR3LqprvAoWbw5V617kmmRtOs3IIDA/+BUUv
	cLn7sXPBA2zAxrkBDpKrx23nX8e4PYbOdm2gU1Yi8dnaJ7gwqiYHTTDmmvoCOr7l3iwt9rdYBQT+u
	zwwIxDYkEuhAw3ugSsyi1axb9nJG3FDZjazLwfzTFCXFjGkbxzg9Gqdyw4rRAthZoUcZG+bcN/Cmn
	nb1BiViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJQv-00000008l7m-29u3;
	Fri, 07 Feb 2025 08:09:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJPH-00000008kVn-1oZx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:08:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso11597625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 00:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738915689; x=1739520489; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N7+57nAAv8QP4u/IKjzXqebMrcWsPnCBFtc7wCFJPUQ=;
        b=wgiUCXjk66r196pzS8nn4L9mUhDNRHTVu/3iYrhILe2Ef+UUwnqllIOVuNCcF9IL0f
         09Xwqfn5Ezsj2671z63amrh7G+05WC8vUI1bP0xZKbTm3wP+To1SD40YEhdVLoYdCIWW
         xz7TZIZaLby+hwnCrpS1WTbRxsod/KjV8TdTZelzZPIsJqfppA2A6hHc8uSNtiabi07j
         HitrKO4mHnaK7oUFuXdgkPb3sj6QI6grVgcZUh6wCiP0ZQ71brHLkNL2zS3RAr4Lt7OK
         fBLNy7Mbk+E2SvRO6tyRcsIrmngFaCW2//MkqGr1ra1MOJeDf2Bh8Fg5EI6558fWsf7z
         K2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915689; x=1739520489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7+57nAAv8QP4u/IKjzXqebMrcWsPnCBFtc7wCFJPUQ=;
        b=wF08ykfQ6QSk0oVyxxub8OsGtcuWUt3mheriHumY3x6LOfZ1fR3sKKtUtRiCgyrmaD
         fWxpRXDFwjYxrYIct3bo/nq44kZFMBO71dbr1jz8MP98Hlww0JeuHMFR/bIioyOV2jGR
         pzUhHhCgBm7HzxPfEHsHer7ijRXVCH4g+gKLfYV27W3pn9qZrN544HbGMwukHn4dSmhi
         0h3MKmlOOckBr0qZ6zIlu+V7X0NDpRTXQfj/Znh1ftGndaXJMU/xJJKX82VdOTP2ZIvp
         KJC4i53r+/+nsaUTQDCB0xQobfzQ3XODq4hDZGhd0LU4k9rtOjUowdaLBaIwD9DSPUCb
         NvYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU3XF9fCl8Ii6ZhZkrIJ4TvSt0uoUDyPkRmSnZ61LKl3E8dZA1xcIO5/jFBCTLqqH76f2PdY90h3hNsUWVPZjT@lists.infradead.org
X-Gm-Message-State: AOJu0YxInK2RfF2WJFi9Mz1oqRVtKEaWwJN9sfHkvCA+EXQ17RyhmkRc
	UBnnZrwE0lzJjdrHAMX0o/bzHDbDxiFw/+QASgbnh/9GhMNlIMqEkteO+j1/Cx0=
X-Gm-Gg: ASbGncuy1bK54phcEag/o6mjAKMELmb5hMG1zcPS9V0b/9oCjcTO96HCwzerFi90p4q
	ShcApR7XUVYEBb3XWlsH9x7RcNjeRj3sy2UfgM6PaD7DlI6qoudPBzo0RAJ1uZywzhwDu2qPdkR
	AX+8QnwgQYnER9MuiZCD1o8LLTJGaBQfxm4UX8su+yjnfhubNF9PopVeoXmN9/c9Bjshm7upNM4
	t1UtvSjEHM3zsaxvD9UGsJw/LNC4zAeHqPtDBkkaNg7wrY6wStpEuXm0wjNX1DY0I3XudflRZ41
	nmRbjXKRKVPT3UxNPtbEAYz4AsPjAoi43hgKsYZySu6/iRQwM122nq/mzsGB
X-Google-Smtp-Source: AGHT+IEpCAnzMJ9gzxKx250V5bllvFofCg+NZdnX2FF6QiB0L9kNIhtil4j6rsAH/g8Ai7a/4f4w3g==
X-Received: by 2002:a05:600c:6c52:b0:434:f335:83b with SMTP id 5b1f17b1804b1-43924a27b10mr19870375e9.5.1738915689136;
        Fri, 07 Feb 2025 00:08:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca004esm45229805e9.13.2025.02.07.00.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 00:08:08 -0800 (PST)
Message-ID: <d5138234-b0c3-4f78-af9e-33e0d5039ea3@rivosinc.com>
Date: Fri, 7 Feb 2025 09:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/21] RISC-V: Add Ssccfg ISA extension definition and
 parsing
To: Atish Patra <atishp@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-9-835cfa88e3b1@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-9-835cfa88e3b1@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_000811_475610_BF7A0A27 
X-CRM114-Status: GOOD (  17.35  )
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



On 06/02/2025 08:23, Atish Patra wrote:
> Ssccfg (‘Ss’ for Privileged architecture and Supervisor-level
> extension, ‘ccfg’ for Counter Configuration) provides access to
> delegated counters and new supervisor-level state.

Hi Atish,

The spec seems to primarly use Smcdeleg rather than Ssccfg. This commits
adds both but only mention Ssccfg in the commit title/description. Maybe
it could be nice to mention both as well.

Thanks,

Clément

> 
> This patch just enables the definitions and enable parsing.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 2 ++
>  arch/riscv/kernel/cpufeature.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b4eddcb57842..fa5e01bcb990 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -103,6 +103,8 @@
>  #define RISCV_ISA_EXT_SSCSRIND		94
>  #define RISCV_ISA_EXT_SMCSRIND		95
>  #define RISCV_ISA_EXT_SMCNTRPMF         96
> +#define RISCV_ISA_EXT_SSCCFG            97
> +#define RISCV_ISA_EXT_SMCDELEG          98
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 8f225c9c3055..3cb208d4913e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -390,12 +390,14 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
>  	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> +	__RISCV_ISA_EXT_DATA(smcdeleg, RISCV_ISA_EXT_SMCDELEG),
>  	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
>  	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
>  	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
>  	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
>  	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> +	__RISCV_ISA_EXT_DATA(ssccfg, RISCV_ISA_EXT_SSCCFG),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
>  	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
> 


