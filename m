Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A896C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 03:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7iolVVEOrYejX7d7d8DcD6Ab7lgNTgshuAjePMKf+0=; b=H7Yh5VdJZSkXi6lnHnxs21Jx9Q
	DZWaAxZS82AEDtRYwn4aM7CiXfHlqBL7amrgWYfnaWECn7iRM2OKVuakMTsWQjGM2i1C33c94pvY6
	vJS8gh9dcZwWdifapNSveihfeUtEVZaTbGWuSfuFXKn9mFumcCjuThxKbCPU9OOv7bOKTPmZlRGME
	q7bMgQr+H/RaKg1KHq/z2bq7mBjdZqgSwzK5zIIMYz3vIRgJr0TeLB/eR3mP+ZORwl4cZUdVxTRof
	mQOid3sij750qIasaNWp9RuM24wBpxL718y/inVWZdCa+3W4cS1+XfSyzqlVUiAQCKCPVox4YjE/Z
	OzgvLkKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqmz-0000000H7gc-2i2S;
	Fri, 30 May 2025 03:52:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqkp-0000000H72o-2djQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 03:50:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AAC816F8;
	Thu, 29 May 2025 20:49:41 -0700 (PDT)
Received: from [10.164.18.46] (a077893.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50EB13F5A1;
	Thu, 29 May 2025 20:49:56 -0700 (PDT)
Message-ID: <8f6bba3a-4cf6-44c2-abeb-8d419ca5a6c3@arm.com>
Date: Fri, 30 May 2025 09:19:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/ptrace: Make user_hwdebug_state.dbg_regs[] array
 size as ARM_MAX_BRP
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland
 <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250421055212.123774-1-anshuman.khandual@arm.com>
 <20250516135958.GA13612@willie-the-truck>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250516135958.GA13612@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_204959_764128_0BFE1A3D 
X-CRM114-Status: GOOD (  23.60  )
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



On 5/16/25 19:29, Will Deacon wrote:
> On Mon, Apr 21, 2025 at 11:22:12AM +0530, Anshuman Khandual wrote:
>> Array elements inside 'struct user_hwdebug_state.dbg_regs[]' are inherently
>> coupled with maximum breakpoints or watchpoints which could be present on a
>> platform and which are defined with macros ARM_MAX_[BRP|WRP].
>>
>> Rather than explicitly trying to keep the array elements in sync with these
>> macros and then adding a BUILD_BUG_ON() just to ensure continued compliance
>> , move these two macros into the uapi ptrace header itself thus making them
>> available both for user space and kernel.
>>
>> While here also ensure that ARM_MAX_BRP and ARM_MAX_WRP are always the same
>> via a new BUILD_BUG_ON(). This helps in making sure that user_hwdebug_state
>> structure remains usable both for breakpoint and watchpoint registers set
>> via ptrace() system call interface.
>>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-perf-users@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> This patch applies on v6.15-rc3
>>
>>  arch/arm64/include/asm/hw_breakpoint.h |  7 -------
>>  arch/arm64/include/uapi/asm/ptrace.h   | 10 +++++++++-
>>  arch/arm64/kernel/hw_breakpoint.c      |  9 +++++++++
>>  3 files changed, 18 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/hw_breakpoint.h b/arch/arm64/include/asm/hw_breakpoint.h
>> index bd81cf17744a..63c21b515647 100644
>> --- a/arch/arm64/include/asm/hw_breakpoint.h
>> +++ b/arch/arm64/include/asm/hw_breakpoint.h
>> @@ -75,13 +75,6 @@ static inline void decode_ctrl_reg(u32 reg,
>>  #define ARM_KERNEL_STEP_ACTIVE	1
>>  #define ARM_KERNEL_STEP_SUSPEND	2
>>  
>> -/*
>> - * Limits.
>> - * Changing these will require modifications to the register accessors.
>> - */
>> -#define ARM_MAX_BRP		16
>> -#define ARM_MAX_WRP		16
>> -
>>  /* Virtual debug register bases. */
>>  #define AARCH64_DBG_REG_BVR	0
>>  #define AARCH64_DBG_REG_BCR	(AARCH64_DBG_REG_BVR + ARM_MAX_BRP)
>> diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
>> index 0f39ba4f3efd..8683f541a467 100644
>> --- a/arch/arm64/include/uapi/asm/ptrace.h
>> +++ b/arch/arm64/include/uapi/asm/ptrace.h
>> @@ -99,6 +99,14 @@ struct user_fpsimd_state {
>>  	__u32		__reserved[2];
>>  };
>>  
>> +/*
>> + * Maximum number of breakpoint and watchpoint registers
>> + * on the platform. These macros get used both in kernel
>> + * and user space as well.
>> + */
>> +#define ARM_MAX_BRP		16
>> +#define ARM_MAX_WRP		16
>> +
>>  struct user_hwdebug_state {
>>  	__u32		dbg_info;
>>  	__u32		pad;
>> @@ -106,7 +114,7 @@ struct user_hwdebug_state {
>>  		__u64	addr;
>>  		__u32	ctrl;
>>  		__u32	pad;
>> -	}		dbg_regs[16];
>> +	}		dbg_regs[ARM_MAX_BRP];	/* Or ARM_MAX_WRP */
>>  };
>>  
>>  /* SVE/FP/SIMD state (NT_ARM_SVE & NT_ARM_SSVE) */
>> diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
>> index 722ac45f9f7b..9bc51682713d 100644
>> --- a/arch/arm64/kernel/hw_breakpoint.c
>> +++ b/arch/arm64/kernel/hw_breakpoint.c
>> @@ -981,6 +981,15 @@ static int __init arch_hw_breakpoint_init(void)
>>  {
>>  	int ret;
>>  
>> +	/*
>> +	 * Maximum supported breakpoint and watchpoint registers must
>> +	 * always be the same - regardless of actual register numbers
>> +	 * found on a given platform. This is because the user facing
>> +	 * ptrace structure 'user_hwdebug_state' actually depends on
>> +	 * these macros to be the same.
>> +	 */
>> +	BUILD_BUG_ON(ARM_MAX_BRP != ARM_MAX_WRP);
> 
> Sorry, but I don't understand why this patch is an improvement over what
> we have.
This is an improvement because

- user_hwdebug_state.dbg_regs[16] is hard coded for size without context
  requiring explicit sync up when ARM_MAX_WRP/BRP changes to 64 later on
  with FEAT_Debugv8p9. Defining the array size in terms of ARM_MAX_WRP/
  BRP provides required context and also avoids the need for an explicit
  hard coded sync up when those macros change.

- user_hwdebug_state.dbg_regs[16] gets used both for breakpoint registers
  and watchpoint registers. Hence there is an inherent assumption that
  ARM_MAX_BRP == ARM_MAX_WRP which should be ensured with a corresponding
  assert.

