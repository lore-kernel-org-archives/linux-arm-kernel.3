Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0A5C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrUmjCwjo5DIxJ+vg0Sk0kvs/Wk7ygJAVHNpsizTEFY=; b=lgTQoBjNfkKmvPZMpJTyE+oXeB
	x4LZfml15H/3/iXNkbjEJFk/aujXe+WL9QbrSeH4GOyAk/qidXVKx2M3s9MeuUQPH/9V0Me24/R2b
	aVQuSuuY39rQK8BOur7XUqpgu6Q/3yplPkZzcZ2Cqona8u3N9hX6FO16C0XUsFxtvlkHbLY0lzLFT
	/9Mk09Cb27kIrIzfGuCXE9iLlSRnH/hBNkxcZjIhbpvsCYBCvfh5/U4/l0KjXEXlXtKy5n0ccSEqW
	YBIC/XRVayJAGPaNqOOvQ9NsSQI/wegn44elFVIE98pyRb5IthR3IBng/OCjyaiqexHT2W9PH/WBW
	7W2RxiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AZS-00000000Ctd-0JT3;
	Thu, 03 Sep 2026 16:45:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AZP-00000000Csw-1mmF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:45:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9D931596;
	Thu,  3 Sep 2026 09:45:42 -0700 (PDT)
Received: from [10.57.6.2] (unknown [10.57.6.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FBA83F673;
	Thu,  3 Sep 2026 09:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788453946; bh=/CRbtrA+vjZ5tpi+PPVd9H6w5y8wPTba5LjyadUSSnA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SR7TXHUzQxDvckWQXIc+kCOdTYGWt1Gaj//NszCiurRY4Z6SAdqDJlunSvSprXTnD
	 G+ho6hqXrCwCQrp/yne6kVlqaExRdp+vclcF/zIL/zaHD1NzPhiw1MEKzTFaOYDgfu
	 46QXLVXyg1Xi5s2nfL5Qn/gtPRKd+Mye1S/UAGRw=
Message-ID: <139b273a-d868-4d82-92b6-cccfb0048c44@arm.com>
Date: Thu, 3 Sep 2026 18:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 08/25] arm64: Initialize POR_EL1 register on
 cpu_resume()
To: Linu Cherian <linu.cherian@arm.com>
Cc: linux-hardening@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 =?UTF-8?Q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-8-743ad31b2c8f@arm.com>
 <apkMDaRKqX3TTINV@a079125.arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <apkMDaRKqX3TTINV@a079125.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_094547_551531_08885F81 
X-CRM114-Status: GOOD (  16.65  )
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

On 03/09/2026 07:56, Linu Cherian wrote:
> Kevin,
>
> On Tue, Aug 18, 2026 at 03:08:50PM +0100, Kevin Brodsky wrote:
>> From: Yeoreum Yun <yeoreum.yun@arm.com>
>>
>> The POR_EL1 register is reset to an unknown value after cpu_suspend().
>> Since POR_EL1 always holds POR_EL1_INIT when entering cpu_suspend(),
>> initialize POR_EL1 with POR_EL1_INIT before cpu_do_resume().
>>
>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  arch/arm64/kernel/sleep.S | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
>> index f093cdf71be1..e0a6ad85cd24 100644
>> --- a/arch/arm64/kernel/sleep.S
>> +++ b/arch/arm64/kernel/sleep.S
>> @@ -3,6 +3,7 @@
>>  #include <linux/linkage.h>
>>  #include <asm/asm-offsets.h>
>>  #include <asm/assembler.h>
>> +#include <asm/kpkeys.h>
>>  #include <asm/smp.h>
>>  
>>  	.text
>> @@ -134,6 +135,17 @@ SYM_FUNC_START(_cpu_resume)
>>  	/* load sp from context */
>>  	ldr	x2, [x0, #CPU_CTX_SP]
>>  	mov	sp, x2
>> +
>> +#ifdef CONFIG_ARM64_POE
>> +alternative_if_not ARM64_HAS_S1POE
>> +	b	.Lskip_por_set
>> +alternative_else_nop_endif
>> +	mov_q	x2, POR_EL1_INIT
>> +	msr_s	SYS_POR_EL1, x2
>> +	/* isb can be skipped since cpu_do_resume() will do it. */
>> +.Lskip_por_set:
>> +#endif /* CONFIG_ARM64_POE */
> Would it be better to move this under__cpu_setup ?

I didn't think about that, that's quite neat as it avoids having to take
care of the resume path separately. It also feels fairly logical as
POR_EL1 should be configured very early (since it impacts all accesses
once enabled). Will do in the next version, thanks!

I was concerned about accesses to POR_EL1 being trapped, but in fact
there is no EL1 control to trap it so no concern there. I realised I
forgot to set HFGRT{R,W}_EL2.nPOR_EL1 though... I'll fix that up in the
next version. (This has no effect when running at EL2 with VHE so I
didn't notice that beforehand.)

- Kevin

