Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D225BCDB470
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9T0Fze3KpG06xnYvjmlUmzBODU53xtqtwO9Goa0J3Rc=; b=mI6sIEhBm4V5i5PWmqGTQ6tzsK
	F/fPPoNSfpanfLNaiRMO9arAW85HTfjZe9Bw75SdLguky4McVfO4qld/8y2QftsQog46cfLYK05Nj
	rGcfnR/K/gJ6V7tZOs9nggKhbcilPtw+ZG/8TiyDwVtpg8T8dAl/wm8RUB/TEwSw03wjzb5quou/E
	vDE1chjhMN9xyCMlh38F2ENITcRGEgYswV0Sn4hoqerqDB0x90u+ti7gVNEIPc4P3rOlKtQ+/Fbjt
	xaMHI/e/1Na1yiIK1ILyKNlSEF026jZ1oXOEX//Dxu/IPs0uovMNuQcvI1i7MuzlzzWJUFJrMiqjq
	D5gZYIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIA7-00000007KKz-3cIs;
	Wed, 24 Jun 2026 07:36:43 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIA4-00000007KKL-2XEe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 07:36:42 +0000
Message-ID: <85b09fd7-f849-46e5-a04d-1e76524943b8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782286587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9T0Fze3KpG06xnYvjmlUmzBODU53xtqtwO9Goa0J3Rc=;
	b=Mn96eHResPBSCyPsmN5dNm1kiNQkCTSsU33kbZpT8C88/niYY9SZETrVoJxvV+a+zTZQIC
	+YvG/pf77lfyNVlF2y2HVKLafVkhr5dbK5jEpC043M26er9EcAK98KijzhbYZyI+bDoG/p
	KKKDAelxFmIFAoDN70FKLxT6PT9CdjE=
Date: Wed, 24 Jun 2026 00:36:17 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v6 07/21] RISC-V: Add Sscfg extension CSR definition
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ian Rogers <irogers@google.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
 <20260608-counter_delegation-v6-7-285b72ed65a9@meta.com>
 <ajjZkRxoh2F3vUAS@blinky>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <ajjZkRxoh2F3vUAS@blinky>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_003640_778354_2A585709 
X-CRM114-Status: GOOD (  15.89  )
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


On 6/21/26 11:43 PM, Charlie Jenkins wrote:
> On Mon, Jun 08, 2026 at 11:01:21PM -0700, Atish Patra wrote:
>> From: Kaiwen Xue <kaiwenx@rivosinc.com>
>>
>> This adds the scountinhibit CSR definition and S-mode accessible hpmevent
>> bits defined by smcdeleg/ssccfg. scountinhibit allows S-mode to start/stop
>> counters directly from S-mode without invoking SBI calls to M-mode. It is
>> also used to figure out the counters delegated to S-mode by the M-mode as
>> well.
>>
>> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
>> Reviewed-by: Clément Léger <cleger@rivosinc.com>
>> ---
>>   arch/riscv/include/asm/csr.h | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>> index b4551a6cf7cb..26cb78dee2fd 100644
>> --- a/arch/riscv/include/asm/csr.h
>> +++ b/arch/riscv/include/asm/csr.h
>> @@ -241,6 +241,31 @@
>>   #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
>>   #define SMSTATEEN0_SSTATEEN0_SHIFT	63
>>   #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
>> +/* HPMEVENT bits. These are accessible in S-mode via Smcdeleg/Ssccfg */
>> +#ifdef CONFIG_64BIT
>> +#define HPMEVENT_OF			(BIT_ULL(63))
>> +#define HPMEVENT_MINH			(BIT_ULL(62))
>> +#define HPMEVENT_SINH			(BIT_ULL(61))
>> +#define HPMEVENT_UINH			(BIT_ULL(60))
>> +#define HPMEVENT_VSINH			(BIT_ULL(59))
>> +#define HPMEVENT_VUINH			(BIT_ULL(58))
>> +#else
>> +#define HPMEVENTH_OF			(BIT_ULL(31))
>> +#define HPMEVENTH_MINH			(BIT_ULL(30))
>> +#define HPMEVENTH_SINH			(BIT_ULL(29))
>> +#define HPMEVENTH_UINH			(BIT_ULL(28))
>> +#define HPMEVENTH_VSINH			(BIT_ULL(27))
>> +#define HPMEVENTH_VUINH			(BIT_ULL(26))
> Since these are rv32 bits for a 32-bit register, I think these should be
> BIT() instead of BIT_ULL()
>
>> +
>> +#define HPMEVENT_OF			(HPMEVENTH_OF << 32)
>> +#define HPMEVENT_MINH			(HPMEVENTH_MINH << 32)
>> +#define HPMEVENT_SINH			(HPMEVENTH_SINH << 32)
>> +#define HPMEVENT_UINH			(HPMEVENTH_UINH << 32)
>> +#define HPMEVENT_VSINH			(HPMEVENTH_VSINH << 32)
>> +#define HPMEVENT_VUINH			(HPMEVENTH_VUINH << 32)
> These definitions are identical to the rv64 ones, can these be removed
> and can you move the rv64 definitions to be global?

Good catch. Will fix this and the above in v8.

> - Charlie
>
>> +#endif
>> +
>> +#define SISELECT_SSCCFG_BASE		0x40
>>   
>>   /* mseccfg bits */
>>   #define MSECCFG_PMM			ENVCFG_PMM
>> @@ -322,6 +347,7 @@
>>   #define CSR_SCOUNTEREN		0x106
>>   #define CSR_SENVCFG		0x10a
>>   #define CSR_SSTATEEN0		0x10c
>> +#define CSR_SCOUNTINHIBIT	0x120
>>   #define CSR_SSCRATCH		0x140
>>   #define CSR_SEPC		0x141
>>   #define CSR_SCAUSE		0x142
>>
>> -- 
>> 2.53.0-Meta
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

