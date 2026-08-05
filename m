Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714E3C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 07:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0ogknZifwHUHqlmbzAZ1WlG35CJPpu3eT3NUulJv6o=; b=bFgzJ79alG2iH0lbfaqISczAVw
	aplN6TzL3okZS/ekFWdZNvJfpSpq/c+qzJMt6T9CbQn3QkJfb2fDUvIhuzKeI+KaZqi6mlsGho8b8
	RXCDb0HZ037TyUJveqVuqKnR97kXvu8m33gJ0bWfGNCCF45tHM+0mmUezIMUm5mQFGIrK+kX0lbGq
	DbqAEUYuFOUAtOI3aNtorc3AS8j5/a9az/EtNL0IqOFtsy90hbO6pInrxJrK9JZemObMDshfrXEIo
	9IfgpX3py4+zxNX1ALsNKCtng8ZV/qzVNj9q7Ec8IzCydzJJRZO2+a4834d/ubAZSxFMMFud+i0TX
	nnI5bALg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrW5P-00000003PYz-0nsL;
	Wed, 05 Aug 2026 07:30:47 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrW5M-00000003PXh-1cZX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 07:30:46 +0000
Message-ID: <fc37a0e2-816b-4fde-880b-7b117d462626@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785915038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C0ogknZifwHUHqlmbzAZ1WlG35CJPpu3eT3NUulJv6o=;
	b=n2D9a/hPBedAD8LSevbLI9iOrECg0VzUuxk15L+oUg4Gxckz/WqTaOWBOFJKCLi6KMXA/b
	uFj0HYIgYTn3t2qwRBzFCPEGH0Cl7yQ53K9pWgI3N3k6xhdTweCMlkCpjPEdSyXfzaWwaW
	gNxMRFTwkwVHxMAa8XdeevrZpFeypyM=
Date: Wed, 5 Aug 2026 00:30:31 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v8 02/22] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
To: Paul Walmsley <pjw@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>,
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-2-7909f863a645@meta.com>
 <3d1f698c-6b76-5252-4e8f-b61671e309c7@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <3d1f698c-6b76-5252-4e8f-b61671e309c7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_003044_846762_3C343A47 
X-CRM114-Status: GOOD (  22.75  )
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

On 8/4/26 4:35 PM, Paul Walmsley wrote:
> On Wed, 1 Jul 2026, Atish Patra wrote:
> 
>> From: Kaiwen Xue <kaiwenx@rivosinc.com>
>>
>> This adds definitions of new CSRs and bits defined in Sxcsrind ISA
>> extension. These CSR enables indirect accesses mechanism to access
>> any CSRs in M-, S-, and VS-mode. The range of the select values
>> and ireg will be define by the ISA extension using Sxcsrind extension.
>>
>> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
>> Reviewed-by: Clément Léger <cleger@rivosinc.com>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> 
> Thanks.  It's easier for folks to grep and cross-reference if the official
> RISC-V extension names are used whenever possible, rather than something
> like Sxcsrind.  Queued the following patch for v7.3.
> 

Agreed. Thanks!

> 
> - Paul
> 
> 
> RISC-V: Add Smcsrind and Sscrind ISA extension CSR definitions
> 
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
> 
> This adds definitions of new CSRs and bits defined in the Smcsrind and
> Sscrinq ISA extensions. These CSRs enable the indirect CSR accesses
> mechanism to access any indirect CSRs in M-, S-, and VS-mode. The
> range of the select values and ireg will be defined by the ISA
> extension that are based on the Smcsrind and Sscsrind extensions.
> 
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> Reviewed-by: Clément Léger <cleger@rivosinc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> Link: https://patch.msgid.link/20260701-counter_delegation-v8-2-7909f863a645@meta.com
> [pjw@kernel.org: clean up the patch description; use official RISC-V extension names]
> Signed-off-by: Paul Walmsley <pjw@kernel.org>
> ---
>   arch/riscv/include/asm/csr.h |   30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 31b8988f4488..7f09e54a0f9a 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -347,6 +347,12 @@
>   /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
>   #define CSR_SISELECT		0x150
>   #define CSR_SIREG		0x151
> +/* Supervisor-Level Window to Indirectly Accessed Registers (Sscsrind) */
> +#define CSR_SIREG2		0x152
> +#define CSR_SIREG3		0x153
> +#define CSR_SIREG4		0x155
> +#define CSR_SIREG5		0x156
> +#define CSR_SIREG6		0x157
>   
>   /* Supervisor-Level Interrupts (AIA) */
>   #define CSR_STOPEI		0x15c
> @@ -394,6 +400,14 @@
>   /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
>   #define CSR_VSISELECT		0x250
>   #define CSR_VSIREG		0x251
> +/*
> + * VS-Level Window to Indirectly Accessed Registers (H-extension with Sscsrind)
> + */
> +#define CSR_VSIREG2		0x252
> +#define CSR_VSIREG3		0x253
> +#define CSR_VSIREG4		0x255
> +#define CSR_VSIREG5		0x256
> +#define CSR_VSIREG6		0x257
>   
>   /* VS-Level Interrupts (H-extension with AIA) */
>   #define CSR_VSTOPEI		0x25c
> @@ -436,6 +450,12 @@
>   /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
>   #define CSR_MISELECT		0x350
>   #define CSR_MIREG		0x351
> +/* Machine-Level Window to Indirectly Accessed Registers (Smcsrind) */
> +#define CSR_MIREG2		0x352
> +#define CSR_MIREG3		0x353
> +#define CSR_MIREG4		0x355
> +#define CSR_MIREG5		0x356
> +#define CSR_MIREG6		0x357
>   
>   /* Machine-Level Interrupts (AIA) */
>   #define CSR_MTOPEI		0x35c
> @@ -498,6 +518,11 @@
>   # define CSR_IEH		CSR_MIEH
>   # define CSR_ISELECT	CSR_MISELECT
>   # define CSR_IREG	CSR_MIREG
> +# define CSR_IREG2	CSR_MIREG2
> +# define CSR_IREG3	CSR_MIREG3
> +# define CSR_IREG4	CSR_MIREG4
> +# define CSR_IREG5	CSR_MIREG5
> +# define CSR_IREG6	CSR_MIREG6
>   # define CSR_IPH		CSR_MIPH
>   # define CSR_TOPEI	CSR_MTOPEI
>   # define CSR_TOPI	CSR_MTOPI
> @@ -523,6 +548,11 @@
>   # define CSR_IEH		CSR_SIEH
>   # define CSR_ISELECT	CSR_SISELECT
>   # define CSR_IREG	CSR_SIREG
> +# define CSR_IREG2	CSR_SIREG2
> +# define CSR_IREG3	CSR_SIREG3
> +# define CSR_IREG4	CSR_SIREG4
> +# define CSR_IREG5	CSR_SIREG5
> +# define CSR_IREG6	CSR_SIREG6
>   # define CSR_IPH		CSR_SIPH
>   # define CSR_TOPEI	CSR_STOPEI
>   # define CSR_TOPI	CSR_STOPI
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


