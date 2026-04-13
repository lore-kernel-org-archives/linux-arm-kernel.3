Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7345EF34C42
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 11:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsWvbs/E8BuX47BPy20VS9Wv1MP4vOMFWcjWYfd2JFU=; b=nZJ8zWkUql2C/xOhum0MWzvdJr
	F4HJAQN4pc4IoXqJ0oMiqddqPweqK8ZWXmCiaAMdHnfj+m+j3eT+sUsVYp4cLuqoA3COpZ6tyojeE
	94Wlu91mbMW1CzvIS/twMeaYhH69RNWP8r4YGugXN10Trv2cxpWlLfolD3KjuicBMavS3X2H+iajR
	SsgtpogYV2MvwoD7re+Hydleb5Ccg115kKSFd3MIrVJVs+nDMSIxuSxUWgReN1/s5JZDEn/B52XgE
	GBYsjEx3wO8w+D69Ie6k2YN0Cd7qwuxoErGIQyDr2Lw4ogg5aHo9W7Cidj6bJwdWfb/dymCVAjueI
	uzWXU5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFkL-0000000FawW-2ZUj;
	Mon, 13 Apr 2026 11:46:29 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFkJ-0000000Favl-1xEh;
	Mon, 13 Apr 2026 11:46:28 +0000
Received: from [192.168.0.106] (unknown [49.205.253.198])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6D82020B7128;
	Mon, 13 Apr 2026 04:46:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6D82020B7128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776080786;
	bh=SsWvbs/E8BuX47BPy20VS9Wv1MP4vOMFWcjWYfd2JFU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ChDflkTv0RePxIfj1+9WKPBLoyC1lbuyqEhjRh/S+ethqrhKmm3qCqK0ZLQ/MTxLm
	 ZLsTHcRFPANr5NJwp85PyRSOymoFIj7xdulM7m0D9xM8ODoC7c0Qe7nhGPiKQzd5Jx
	 RYvdNUrPQi9G9byTvhuMCCiljHMo/t/hOJZtFd1E=
Message-ID: <fe4c0663-4ece-439c-bcb6-cd5780c15ed9@linux.microsoft.com>
Date: Mon, 13 Apr 2026 17:16:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] Drivers: hv: Refactor mshv_vtl for ARM64 support to
 be added
To: Michael Kelley <mhklinux@outlook.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
 <20260316121241.910764-5-namjain@linux.microsoft.com>
 <SN6PR02MB41573C4A21BA96A534E5429CD450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <SN6PR02MB41573C4A21BA96A534E5429CD450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_044627_566114_2928DA4E 
X-CRM114-Status: GOOD (  23.27  )
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



On 4/1/2026 10:26 PM, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Monday, March 16, 2026 5:13 AM
>>
>> Refactor MSHV_VTL driver to move some of the x86 specific code to arch
>> specific files, and add corresponding functions for arm64.
>>
>> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
>> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
>> ---
>>   arch/arm64/include/asm/mshyperv.h |  10 +++
>>   arch/x86/hyperv/hv_vtl.c          |  98 ++++++++++++++++++++++++++++
>>   arch/x86/include/asm/mshyperv.h   |   1 +
>>   drivers/hv/mshv_vtl_main.c        | 102 +-----------------------------
>>   4 files changed, 111 insertions(+), 100 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/mshyperv.h
>> b/arch/arm64/include/asm/mshyperv.h
>> index b721d3134ab6..804068e0941b 100644
>> --- a/arch/arm64/include/asm/mshyperv.h
>> +++ b/arch/arm64/include/asm/mshyperv.h
>> @@ -60,6 +60,16 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
>>   				ARM_SMCCC_SMC_64,		\
>>   				ARM_SMCCC_OWNER_VENDOR_HYP,	\
>>   				HV_SMCCC_FUNC_NUMBER)
>> +#ifdef CONFIG_HYPERV_VTL_MODE
>> +/*
>> + * Get/Set the register. If the function returns `1`, that must be done via
>> + * a hypercall. Returning `0` means success.
>> + */
>> +static inline int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, u64 shared)
>> +{
>> +	return 1;
>> +}
>> +#endif
>>
>>   #include <asm-generic/mshyperv.h>
>>
>> diff --git a/arch/x86/hyperv/hv_vtl.c b/arch/x86/hyperv/hv_vtl.c
>> index 9b6a9bc4ab76..72a0bb4ae0c7 100644
>> --- a/arch/x86/hyperv/hv_vtl.c
>> +++ b/arch/x86/hyperv/hv_vtl.c
>> @@ -17,6 +17,8 @@
>>   #include <asm/realmode.h>
>>   #include <asm/reboot.h>
>>   #include <asm/smap.h>
>> +#include <uapi/asm/mtrr.h>
>> +#include <asm/debugreg.h>
>>   #include <linux/export.h>
>>   #include <../kernel/smpboot.h>
>>   #include "../../kernel/fpu/legacy.h"
>> @@ -281,3 +283,99 @@ void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0)
>>   	kernel_fpu_end();
>>   }
>>   EXPORT_SYMBOL(mshv_vtl_return_call);
>> +
>> +/* Static table mapping register names to their corresponding actions */
>> +static const struct {
>> +	enum hv_register_name reg_name;
>> +	int debug_reg_num;  /* -1 if not a debug register */
>> +	u32 msr_addr;       /* 0 if not an MSR */
>> +} reg_table[] = {
>> +	/* Debug registers */
>> +	{HV_X64_REGISTER_DR0, 0, 0},
>> +	{HV_X64_REGISTER_DR1, 1, 0},
>> +	{HV_X64_REGISTER_DR2, 2, 0},
>> +	{HV_X64_REGISTER_DR3, 3, 0},
>> +	{HV_X64_REGISTER_DR6, 6, 0},
>> +	/* MTRR MSRs */
>> +	{HV_X64_REGISTER_MSR_MTRR_CAP, -1, MSR_MTRRcap},
>> +	{HV_X64_REGISTER_MSR_MTRR_DEF_TYPE, -1, MSR_MTRRdefType},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE0, -1, MTRRphysBase_MSR(0)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE1, -1, MTRRphysBase_MSR(1)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE2, -1, MTRRphysBase_MSR(2)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE3, -1, MTRRphysBase_MSR(3)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE4, -1, MTRRphysBase_MSR(4)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE5, -1, MTRRphysBase_MSR(5)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE6, -1, MTRRphysBase_MSR(6)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE7, -1, MTRRphysBase_MSR(7)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE8, -1, MTRRphysBase_MSR(8)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE9, -1, MTRRphysBase_MSR(9)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEA, -1, MTRRphysBase_MSR(0xa)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEB, -1, MTRRphysBase_MSR(0xb)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEC, -1, MTRRphysBase_MSR(0xc)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASED, -1, MTRRphysBase_MSR(0xd)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEE, -1, MTRRphysBase_MSR(0xe)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEF, -1, MTRRphysBase_MSR(0xf)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK0, -1, MTRRphysMask_MSR(0)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK1, -1, MTRRphysMask_MSR(1)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK2, -1, MTRRphysMask_MSR(2)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK3, -1, MTRRphysMask_MSR(3)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK4, -1, MTRRphysMask_MSR(4)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK5, -1, MTRRphysMask_MSR(5)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK6, -1, MTRRphysMask_MSR(6)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK7, -1, MTRRphysMask_MSR(7)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK8, -1, MTRRphysMask_MSR(8)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK9, -1, MTRRphysMask_MSR(9)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKA, -1, MTRRphysMask_MSR(0xa)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKB, -1, MTRRphysMask_MSR(0xb)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKC, -1, MTRRphysMask_MSR(0xc)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKD, -1, MTRRphysMask_MSR(0xd)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKE, -1, MTRRphysMask_MSR(0xe)},
>> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKF, -1, MTRRphysMask_MSR(0xf)},
>> +	{HV_X64_REGISTER_MSR_MTRR_FIX64K00000, -1, MSR_MTRRfix64K_00000},
>> +	{HV_X64_REGISTER_MSR_MTRR_FIX16K80000, -1, MSR_MTRRfix16K_80000},
>> +	{HV_X64_REGISTER_MSR_MTRR_FIX16KA0000, -1, MSR_MTRRfix16K_A0000},
>> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KC0000, -1, MSR_MTRRfix4K_C0000},
>> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KC8000, -1, MSR_MTRRfix4K_C8000},
>> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KD0000, -1, MSR_MTRRfix4K_D0000},
>> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KD8000, -1, MSR_MTRRfix4K_D8000},
>> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KE0000, -1, MSR_MTRRfix4K_E0000},
>> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KE8000, -1, MSR_MTRRfix4K_E8000},
>> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KF0000, -1, MSR_MTRRfix4K_F0000},
>> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KF8000, -1, MSR_MTRRfix4K_F8000},
>> +};
>> +
>> +int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, u64 shared)
>> +{
>> +	u64 *reg64;
>> +	enum hv_register_name gpr_name;
>> +	int i;
>> +
>> +	gpr_name = regs->name;
>> +	reg64 = &regs->value.reg64;
>> +
>> +	/* Search for the register in the table */
>> +	for (i = 0; i < ARRAY_SIZE(reg_table); i++) {
>> +		if (reg_table[i].reg_name != gpr_name)
>> +			continue;
>> +		if (reg_table[i].debug_reg_num != -1) {
>> +			/* Handle debug registers */
>> +			if (gpr_name == HV_X64_REGISTER_DR6 && !shared)
>> +				goto hypercall;
>> +			if (set)
>> +				native_set_debugreg(reg_table[i].debug_reg_num, *reg64);
>> +			else
>> +				*reg64 = native_get_debugreg(reg_table[i].debug_reg_num);
>> +		} else {
>> +			/* Handle MSRs */
>> +			if (set)
>> +				wrmsrl(reg_table[i].msr_addr, *reg64);
>> +			else
>> +				rdmsrl(reg_table[i].msr_addr, *reg64);
>> +		}
>> +		return 0;
>> +	}
>> +
>> +hypercall:
>> +	return 1;
>> +}
>> +EXPORT_SYMBOL(hv_vtl_get_set_reg);
>> diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
>> index f64393e853ee..d5355a5b7517 100644
>> --- a/arch/x86/include/asm/mshyperv.h
>> +++ b/arch/x86/include/asm/mshyperv.h
>> @@ -304,6 +304,7 @@ void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
>>   void mshv_vtl_return_call_init(u64 vtl_return_offset);
>>   void mshv_vtl_return_hypercall(void);
>>   void __mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
>> +int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, u64 shared);
> 
> Can this move to asm-generic/mshyperv.h?  The function is no longer specific
> to x86/x64, so one would want to not declare it in the arch/x86 version
> of mshyperv.h. But maybe moving it to asm-generic/mshyperv.h breaks
> compilation on arm64 because there's also the static inline stub there.

This is still arch specific (x86 to be precise). For ARM64, we always 
want to return 1, which is to tell the client to use hypercall as a 
fallback option. Moving this x86 specific implementation (X64 registers, 
MTRR etc) to a common code, would not be right. One thing that could be 
done here was to move the "return 1" stub code from arm64 to asm-generic 
mshyperv.h, but that would not provide much benefit.

I am currently not planning to make any changes here. If I misunderstood 
your comment, please let me know.

Regards,
Naman


