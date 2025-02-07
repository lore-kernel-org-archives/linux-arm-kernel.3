Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8435BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tiH9b+H/9t/xpf0NWHkN82z4SsEthrDvr6Ide4MKv0=; b=qoE6RTYSJH3v2V4b8cof3Iqxp1
	Jq+eyJHxmSAl7XkizlZlD4oW6fv1wP0VWfco/pGKgP+HLeiUjwOVXE3o/0qx2lDd3tn//kOM0/chN
	LqhdE59z+/2G+ctfNNCGBvaLvNeB/miwodUgw/Yn9ffSbmh2CSl4hLqYlcDWvXX1sqbJfjJDg4A88
	vF8hTkzLDg9CeHJn101SV9hP7OtYcCbG5VDhPDZ1Ct56F+Zo1LNsdPbnec1mubhxCdUStJqzHyEtX
	Z5tLE59fMjVRrSwLJsSxAryFSeyTYsP5kq9WzncKnxema7RBW3zYkwgqQWxZxG5VNhP+DvDN0YvLp
	tJo0A+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKaq-000000090Y1-3n93;
	Fri, 07 Feb 2025 09:24:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKY7-00000009015-2emW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:21:25 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43690d4605dso12345805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 01:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738920082; x=1739524882; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9tiH9b+H/9t/xpf0NWHkN82z4SsEthrDvr6Ide4MKv0=;
        b=O1txkBHNSd1QK67hQfE3AgzdRZIQw2VwGdDYknbqzz6fQ/6GblfNDH/3aemfBR4SFb
         GbLjp0MmnUKmL1ZGp/ItBFXQyyXaepBUHBTRTJS78Rg14shtvjnPR4MAvyj6c9zW4cJT
         8J6o/4UVDJa/49+wqZEghmyy6N571JVU9Wa5uXwbw3aPlO33c4MT82IA7aSNWU2rsQCi
         z+zuc+0st2ymujGtF06+m48XNuL4p1qE+ZvVrykaebVEspP94jFCq8qkoH0I9UVRjFqZ
         TLaXI450tEaz0zEKbp7tPP5fF/SO1I04A4jCgZsgVB810TXmQHuQK4l+06U2hYaBBcC2
         h/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920082; x=1739524882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9tiH9b+H/9t/xpf0NWHkN82z4SsEthrDvr6Ide4MKv0=;
        b=GKY4hIq64IP4WxHIcTIXlaGCc1ogx9ZUvovCfpDc/Qq5LT5WNntojZQOOPJ/zIcq44
         nQuApkcIgI1Y0a4j6e7S+UcvPqThentfzq/Pt314ZmUOtr29ZXFGns+LieKI8Bqo0i/O
         QllAB411ePo+59rAbhnoxqBEpLDVgCQ8aSS79QKo7gb4rveqyplaRGIxSRWF7kmqMDeb
         Zzm4RKWM9Vf5etrVIaDWlfzuqhlWeehkIfSjW1WRJo+1beXd1nAbaelOf632eirAWG6f
         NXyuo0SfZfLd0f3zQ4EFbcLgbRBHv2e7A3g/PAL8YJESWatdByParVxpmACc59TAwLAH
         I4CA==
X-Forwarded-Encrypted: i=1; AJvYcCVvIPwLo1nxUUyXv+qkUxsz+uRdsDflU4yPXrUREX867lSwwCQDecD4ERJKdpJANDjcsX/pygSAr5IHZ5H8xjQC@lists.infradead.org
X-Gm-Message-State: AOJu0YxuJIiijZmQYEsHzCCrNF5U0/lPJj+uGaxSbISjkq0X2cgCejLH
	jzd4BKwvU/Ees5iSWP/OzTmcd3mlUQNIc695Mc9ck6ojhhUKnl4tqZNqRF5C9HY=
X-Gm-Gg: ASbGncv2moQ8HrNGXhkH8PJmnUhyh6QpDHadSFdpKyebpX4hXSc+V3WPunyabSaSWeb
	u5xTmCc/YmEnidfEZkOf0UUi8BKMSuvtHBfyRu0B8bVKXH3HljXfTdr0gvu+xLmZyAgwIUC+NWw
	7CMiFr5WZrmBS5fSym/vOf1n3aA0tU8ndlqvv5mr4Ycv2nbO1X6nJDLS9XdIJZm6llQyfUGTtUE
	YkJXJMFd7sWmROrZTOhPQjTpR2E3CRrFZ2quQ2aJRz3D/hjEfCssfSWI3YULQ4vL9CAX/8DbEal
	nTAOqtIg6Q4SMlvPLWFzbh1JPcAh0RRblH9kT+CJd9h4TQW5dVh7lj3KdNX9
X-Google-Smtp-Source: AGHT+IECWFH7U0mArd280iuB70Vnw8HZQHKBAtWHAu5Pk2zNKD95w0WIBx5nMCf9e60ecld/9uOCGw==
X-Received: by 2002:a05:600c:3c9b:b0:436:5fc9:30ba with SMTP id 5b1f17b1804b1-439249c385cmr21219595e9.29.1738920082212;
        Fri, 07 Feb 2025 01:21:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439069290c7sm87180725e9.0.2025.02.07.01.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 01:21:21 -0800 (PST)
Message-ID: <7aace8a9-0e62-4156-9c50-f7b399c4eba2@rivosinc.com>
Date: Fri, 7 Feb 2025 10:21:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/21] RISC-V: Add Smcntrpmf extension parsing
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
 <20250205-counter_delegation-v4-6-835cfa88e3b1@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-6-835cfa88e3b1@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_012123_874892_C305F12B 
X-CRM114-Status: GOOD (  16.32  )
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
> Smcntrpmf extension allows M-mode to enable privilege mode filtering
> for cycle/instret counters. However, the cyclecfg/instretcfg CSRs are
> only available only in Ssccfg only Smcntrpmf is present.
> 
> That's why, kernel needs to detect presence of Smcntrpmf extension and
> enable privilege mode filtering for cycle/instret counters.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 3d6e706fc5b2..b4eddcb57842 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -102,6 +102,7 @@
>  #define RISCV_ISA_EXT_SVADU		93
>  #define RISCV_ISA_EXT_SSCSRIND		94
>  #define RISCV_ISA_EXT_SMCSRIND		95
> +#define RISCV_ISA_EXT_SMCNTRPMF         96
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c6da81aa48aa..8f225c9c3055 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -390,6 +390,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
>  	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> +	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
>  	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
>  	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
>  	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
> 

Looks good to me.

Reviewed-by: Clément Léger <cleger@rivosinc.com>

Thanks,

Clément

