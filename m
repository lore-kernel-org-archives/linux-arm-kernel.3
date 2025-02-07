Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F0CC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffr0OMCgv5rw2MLpHSX7E1qg3OY60t4awxWCHQtHUac=; b=iVpIHGUhojq3Co8/MyYBM77N14
	Zi5prHkge0ayZS3tmw9GFMLJB22S93D+nBJ6WdC1efnLoMv54SUQ4NretejBzGXu/2iEmHhGiTiDq
	aJsH+Q5EAeDruxfkLoe+30mWXgNl4wdtNQluS0zrsGXAvHWSlpCcNEie3bNgba9YQSLR8hbkPP+mo
	vC/PrArFeD5LukMYEGiRNQL4a33rA9+VymbyEt0DdXeP/TZe/jbM0fDwZs6WwWs8T57zYL4rXjpoc
	tzMqvuu5Y4r4e4BS6XQF5yTAKhRy4d8E5F1hgWJY1nH0A09Fld7hBaadUF2xCmj13AADX4JXtqr6Z
	DSkInWkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJWI-00000008mRe-0PmW;
	Fri, 07 Feb 2025 08:15:26 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJUu-00000008m8y-03D1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:14:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-438a39e659cso11390485e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 00:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738916038; x=1739520838; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ffr0OMCgv5rw2MLpHSX7E1qg3OY60t4awxWCHQtHUac=;
        b=guaslo/auxQyaNOWSGQtg9fVtVAy6kFjVvZdk/XyEjCmy2FK6RUnKZKiMOHU5H1y49
         I4GWmlMTLKeNkHJd0iqPXa5QF247jH8AmtJmXEQPZ9aLIVMWZUDuijF1UwXr2mv0ggtO
         SFYEapCHSsBxMywHvPVg2EMchVz6xcpre0B0WDFYoQ4dIM2Br7VkLlNmVDT1V2Dw+vYc
         23UjPPvzet404WwZC277/HH8xV0R72tZm4JnUnQbuVCbnlw5RS+nPu5488NQ8qEDi8Jb
         cLl/6BQCZ9DyxgshpD12UUeOQBRzYkknd4mASbI3Bqnt4Ypxsj02DpMTAS51dJG4GpHD
         iTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738916038; x=1739520838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffr0OMCgv5rw2MLpHSX7E1qg3OY60t4awxWCHQtHUac=;
        b=EwghQyCH6r07GsvDE70c5jZCJJ4tLhkyj6Y+4e7ThEQjwMyqn9fI8NpGByELndUxaM
         ONrxoR1nklAmT4AHu2gNP35eTVVvvihb5pPePF8XmLHPHZwQndEmmdNfwxk55OAc802j
         u5P4wMI+AD7huMuGc1XNQZY+jjdXABLFfAYDIp9hgGHdMutwZ7aucXKUxrm1Q5q4A2BQ
         BYzbineN3lOMlR0lPRZQ5QuzfFVALdKPgaayvhueBhvXzXjfXwxO3D1rANu0LsNtuYp8
         wQDRuaBiNraEEB7Lh5YWdSU90OGkMPJPU5/9X6dcE4EhCbeJAVbZiUi5C+nfSQwoySay
         40UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF7Sj7riVzxoVbDoR4ohz6isI3Iq0zPiMkkk0YaP717lwqAgNS7szDAv+xN/fdaw6dnh3bUosE84oDVl0WIgMO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0qnwfPdyl6nng48quJqj5dvIjmrKj7oW2PRIdyJ75UbZ582Pv
	p2adrpqZPcyYB8pPzA6A6OtsfRSBHGtpg2Ne9ZJ7JE35ARM4qBHuqP+XolSspgHUBkC3BHseEUD
	20hY=
X-Gm-Gg: ASbGncv8H+f+NIL+1pShXC9kkv+sxeXZeovDD2TSm5+VGMWpNI1bBpmnlfHO7HTSZ9x
	WIAtbKeMfFmxxex8GUuhq79udftwCNid4rQPrL0s6dsDSY583MKacjuwuydxSOV0SLFphBdcju4
	79DAe5BnsUWGx9UYbF5L5DTSckypukaKmPW1JWRzuqPpPjXv3itt97qp8Kfe6YZDBWba1Jg4+8B
	6Vq+ZFbF+KWd5aeeGPaFSjDsg+JuXHXsSNxDnSxVPnhA5EGoESwZ7CsJKnmxWyWxijtMf6MTo7R
	whMyLn+I3z5H7Udo/jv4VNkMbHMoZnJn8elXzHbNyriEnEEE8ClVWVJGghbD
X-Google-Smtp-Source: AGHT+IEGr/YRTYNXaAzVLspq4nx30yqY6bs6EtU6OBmGn64/zPMRjPnpKtSGL4mxDnpbYdH0c6ehyw==
X-Received: by 2002:a05:600c:35c5:b0:438:e231:d35e with SMTP id 5b1f17b1804b1-439248b6ebamr20948965e9.0.1738916038069;
        Fri, 07 Feb 2025 00:13:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm3167994f8f.6.2025.02.07.00.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 00:13:57 -0800 (PST)
Message-ID: <d03581a9-495d-47df-99f2-96065b06ee8f@rivosinc.com>
Date: Fri, 7 Feb 2025 09:13:56 +0100
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
X-CRM114-CacheID: sfid-20250207_001400_053178_35FF4CD8 
X-CRM114-Status: GOOD (  16.61  )
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

Hi Atish,

based on your dt-binding commit, if smcdeleg depends on Sscsrind, Zihpm,
Zicntr, then you could add a validation callback here:

static int riscv_smcdeleg_validate(const struct riscv_isa_ext_data
*data, const unsigned long *isa_bitmap)
{
	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SSCSRIND) &&
	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZIHPM) &&
	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZICNTR))
		return 0;

	return -EPROBE_DEFER;
}

__RISCV_ISA_EXT_DATA_VALIDATE(smcdeleg, RISCV_ISA_EXT_SMCDELEG,
riscv_smcdeleg_validate),

>  	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
>  	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
>  	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
>  	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
>  	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> +	__RISCV_ISA_EXT_DATA(ssccfg, RISCV_ISA_EXT_SSCCFG),

Ditto for this one with Smcdeleg, Sscsrind, Zihpm, Zicntr, Sscofpmf,
Smcntrpmf.

Thanks,

Clément

>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
>  	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
> 


