Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4254FC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+8W0r1eBfeQeUIpnApB8DWC5KBFE4067O0DEyXdDjM=; b=wxVsGkx4BUAqn5Sx+nlAr+a92e
	H+feUmVPPtya56iczbsLlM/h2gOBgFTxPbwmBgPaoI9gzJ/1dlaOQTXvWcLKXrUS6FsgyYLIZ2/3B
	KxGZJe4pTIZDWz5nLqnEGr+IAF9jUGnLSvTn3dBnDI85gmcyKzEeiFzttX5Um91HJardpUkiPwV2Y
	H36JJebjqGnxhIf76CsUSa6A28wpldG7N3+u2HqtSI2CFfqiGhK87yofdXTIxevwtkNL7WkRjBZT0
	6zXqu2Fmy0RC67fFSJZpA4BoizaOva12u13ZB7cXbt2vvQKzCtGlSLcTG0vMHLdFiL2KXYj/Rm2fA
	eAfp5Zdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJGi-00000008ii8-0f3i;
	Fri, 07 Feb 2025 07:59:20 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJFI-00000008iPa-2nF9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 07:57:55 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38dc627eba6so625038f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 23:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738915071; x=1739519871; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+8W0r1eBfeQeUIpnApB8DWC5KBFE4067O0DEyXdDjM=;
        b=ShG5eMw9SDaWotoiGAqQ9XAd5Ohg9mbGo38I86fh2abT2FjXy1471lgWgIZTHeQOPf
         w+BTEjDKHix9CxoZU+uAyT2LDj7rLb+SSX/zIUZV+2v6BDjC48Wc3Ns8/HgQ5rvZ+0Y8
         uBjWvoYNTmdDqWx1JxkODU8PM82KpFnezuFQIXI/RWaMXKYJwtCZI8OtlCCqeKrCRqUF
         22UNqqHvoD2Uy+uu6rt++k1GGvM0f45cfRC9sqLNJswqVNeZTXBGkKeOFaZR1NiA295D
         o/I0Fv34zXi9wltYBaNcSUcjVxxzpjBypDtnjSXtkRYbopPfhy5YyYg4yhb128Z7IJrv
         6dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915071; x=1739519871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+8W0r1eBfeQeUIpnApB8DWC5KBFE4067O0DEyXdDjM=;
        b=TTqz4OBQj1sJohpoO4VUXTGGU/o2i4oaQctZAX07abDOgHcafsqZkrcaZsQTdftx/j
         Jw2csKzMXsPtnw01yeqOJ9Bpx5EOKkPyqKPJlOyuqOebdPr5YQe6X0wYtPSwBuTUrYHU
         duiYkn/IJiwWoniM15EY8eaHNWXVTmR2GUHsddJ1JddYTUDu9IEHVHlCKdBAyZH/jsu6
         9DgrZmjfSkyhqGKJVNmv04bwAROsO2AFGFZq2GhCImViqUi+58uiGnG7rlmpzpvueODe
         WUTior4d2NugzXWU6xl/Pv2skne1VMNf+mA0sDKMkhMyOCDz656XareJ+4lbU7keQwfp
         9bUA==
X-Forwarded-Encrypted: i=1; AJvYcCWC7SYC2CbgI0Fre8r5fZ4sAsDgT3YRH0KTiNr6yyzpH074vedrvrLx4q7Iiugdj66xhQDx0PGmNwtnI/aAbdQc@lists.infradead.org
X-Gm-Message-State: AOJu0YyolrqwuJqns/SUv+ZaiCv/bfStOVWZ9nrnAsXakXi6sbmv4uwz
	TCictw86c4hbbvh35UXKkiaJtWTNVdsYfqKMt6roDOud67GLJ4WBPTZC+NO5CFc=
X-Gm-Gg: ASbGncus39Foq/JU0I/nDse6S0lsVaoboeKlXwG5q7G59Zw4/X1Pa9rINJktp6Fa7yK
	m5s1tcItdMMGGBtnn/ynIDWbOdyD0sJGoDPBOiodEsOnAdh62SoBFekKm/WLxVwXQ/7mg+9dPer
	zDe6pH9pmZy34NlVClhrUccJZVt/PwGEH648OzxvyCoXe23rE9Px5jKj5CR1W4uP0LN8/97hT8R
	tDEs6C6Eete1MIFZ7qJfRTVzmbtNZcppdis7gL/bS9jUlGSfZeIbAggjsf4MYED0pQHPijk3loM
	Ryze1mrAsxrqGsDV1smHMkehrNBVr5TH2X2/n3h5W2vDKbnmMlVEesU7794x
X-Google-Smtp-Source: AGHT+IGq74MwyyBs38GAGswE+10Qup4jIp3Pg2RgGuSrurMbFniM8/Z3Fz5NjAT2LPHjyfZgPXz2qQ==
X-Received: by 2002:a5d:64ee:0:b0:38d:ac77:d7cb with SMTP id ffacd0b85a97d-38dc8dd105bmr1267323f8f.25.1738915070831;
        Thu, 06 Feb 2025 23:57:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ff64sm44791635e9.9.2025.02.06.23.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 23:57:50 -0800 (PST)
Message-ID: <76865725-35ce-48c6-822f-ea6cf817cee3@rivosinc.com>
Date: Fri, 7 Feb 2025 08:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
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
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Kaiwen Xue <kaiwenx@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-2-835cfa88e3b1@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-2-835cfa88e3b1@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_235752_894537_BFC4DA44 
X-CRM114-Status: GOOD (  15.87  )
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
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
> 
> This adds definitions of new CSRs and bits defined in Sxcsrind ISA
> extension. These CSR enables indirect accesses mechanism to access
> any CSRs in M-, S-, and VS-mode. The range of the select values
> and ireg will be define by the ISA extension using Sxcsrind extension.
> 
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 37bdea65bbd8..2ad2d492e6b4 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -318,6 +318,12 @@
>  /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
>  #define CSR_SISELECT		0x150
>  #define CSR_SIREG		0x151
> +/* Supervisor-Level Window to Indirectly Accessed Registers (Sxcsrind) */
> +#define CSR_SIREG2		0x152
> +#define CSR_SIREG3		0x153
> +#define CSR_SIREG4		0x155
> +#define CSR_SIREG5		0x156
> +#define CSR_SIREG6		0x157
>  
>  /* Supervisor-Level Interrupts (AIA) */
>  #define CSR_STOPEI		0x15c
> @@ -365,6 +371,14 @@
>  /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
>  #define CSR_VSISELECT		0x250
>  #define CSR_VSIREG		0x251
> +/*
> + * VS-Level Window to Indirectly Accessed Registers (H-extension with Sxcsrind)
> + */
> +#define CSR_VSIREG2		0x252
> +#define CSR_VSIREG3		0x253
> +#define CSR_VSIREG4		0x255
> +#define CSR_VSIREG5		0x256
> +#define CSR_VISREG6		0x257
>  
>  /* VS-Level Interrupts (H-extension with AIA) */
>  #define CSR_VSTOPEI		0x25c
> @@ -407,6 +421,12 @@
>  /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
>  #define CSR_MISELECT		0x350
>  #define CSR_MIREG		0x351
> +/* Machine-Level Window to Indrecitly Accessed Registers (Sxcsrind) */

Typo: s/Indrecitly/Indirectly

> +#define CSR_MIREG2		0x352
> +#define CSR_MIREG3		0x353
> +#define CSR_MIREG4		0x355
> +#define CSR_MIREG5		0x356
> +#define CSR_MIREG6		0x357
>  
>  /* Machine-Level Interrupts (AIA) */
>  #define CSR_MTOPEI		0x35c
> @@ -452,6 +472,11 @@
>  # define CSR_IEH		CSR_MIEH
>  # define CSR_ISELECT	CSR_MISELECT
>  # define CSR_IREG	CSR_MIREG
> +# define CSR_IREG2	CSR_MIREG2
> +# define CSR_IREG3	CSR_MIREG3
> +# define CSR_IREG4	CSR_MIREG4
> +# define CSR_IREG5	CSR_MIREG5
> +# define CSR_IREG6	CSR_MIREG6
>  # define CSR_IPH		CSR_MIPH
>  # define CSR_TOPEI	CSR_MTOPEI
>  # define CSR_TOPI	CSR_MTOPI
> @@ -477,6 +502,11 @@
>  # define CSR_IEH		CSR_SIEH
>  # define CSR_ISELECT	CSR_SISELECT
>  # define CSR_IREG	CSR_SIREG
> +# define CSR_IREG2	CSR_SIREG2
> +# define CSR_IREG3	CSR_SIREG3
> +# define CSR_IREG4	CSR_SIREG4
> +# define CSR_IREG5	CSR_SIREG5
> +# define CSR_IREG6	CSR_SIREG6
>  # define CSR_IPH		CSR_SIPH
>  # define CSR_TOPEI	CSR_STOPEI
>  # define CSR_TOPI	CSR_STOPI
> 
With that typo fixed:

Reviewed-by: Clément Léger <cleger@rivosinc.com>

Thanks,

Clément



