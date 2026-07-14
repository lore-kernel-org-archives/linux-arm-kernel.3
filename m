Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363A5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3RTd/RUmR1flBGRcnZvNGzMkr2spLiM63yI11KWUODc=; b=jfxhx56Qr6uZuN
	Gpe0/9pDYVDLg5i2Edfxo5u7lsryvLFFsYe64KjnCbq6YEaEXDrCaaVs/YSqY/K7T0Vzy1SN6g7u8
	jU2qAUCm7XERynsEp26yy49XM+9SXrfIIYqKd80COnGtklnC0PJ8slXeM2CZgIezgrnUNnkEXJ7x/
	2Tdq9pmFD10dpajScT0UmzpFYx2HFSmnx1hv1PAKa9zNIMTG/MMNPQawS3fphVXM73CdXuU9O7R4B
	0HP40iZLv2i37cB/sHL0Lb9nvXskVM23dhFhcf8qvahybSPxidHBuHOxWcUZ3GuV6GDLJhyaQoUMP
	wFrrBFmv8Mpe9hiuJczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZSw-0000000BSUh-480v;
	Tue, 14 Jul 2026 09:30:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZSv-0000000BSUH-1r5w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:30:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D7A42B;
	Tue, 14 Jul 2026 02:30:07 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BD713F93E;
	Tue, 14 Jul 2026 02:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784021411; bh=26WnatMxYtI4yFCVq80r+jSOSG54slQREFAZPSUe644=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KObdah6K4AsDaSAj1I52l5IeKvleRHcV7sqX96cq9/eijrL2FWZLfBRYmD5U5FAl4
	 YmfMjql0pWSM1BLFsnR1ycreLvgQZmj+ry20ghZ3XIJScoU9n1I/1aTjbC7RoXKmBF
	 F3aJBc5BiM4w2nARTt/Ikco/sgCDiM/upldyE97M=
Message-ID: <16948de7-c2e0-4a37-892d-9be84b36b191@arm.com>
Date: Tue, 14 Jul 2026 10:30:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 26/36] arm64: ptrace: Add PSR_ALLINT_BIT
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-27-vladimir.murzin@arm.com>
 <ef1ad41b-a8c0-4d14-8187-cd58f8153db9@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <ef1ad41b-a8c0-4d14-8187-cd58f8153db9@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_023013_582837_0E972988 
X-CRM114-Status: GOOD (  23.35  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/10/26 03:16, Jinjie Ruan wrote:
> 
> On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> When FEAT_NMI is implemented, ALLINT is part of PSTATE and will be saved
>> to SPSR on exception entry.
>> As it can mask interrupts, depending on configuration, we will need to
>> check its value in interruted tasks, so add the corresponding bit
>> to ptrace.h.
>>
>> Given its impact on interrupt and NMI masking, use it to update
>> `print_pstate()` so that it displays ALLINT state.
>> Display it after DAIF so that interrupt masking fields are together.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/include/uapi/asm/ptrace.h | 1 +
>>  arch/arm64/kernel/process.c          | 3 ++-
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
>> index 6fed93fb2536..99352dd823cc 100644
>> --- a/arch/arm64/include/uapi/asm/ptrace.h
>> +++ b/arch/arm64/include/uapi/asm/ptrace.h
>> @@ -48,6 +48,7 @@
>>  #define PSR_D_BIT	0x00000200
>>  #define PSR_BTYPE_MASK	0x00000c00
>>  #define PSR_SSBS_BIT	0x00001000
>> +#define PSR_ALLINT_BIT	0x00002000
>>  #define PSR_PAN_BIT	0x00400000
>>  #define PSR_UAO_BIT	0x00800000
>>  #define PSR_DIT_BIT	0x01000000
>> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
>> index ddda8d7aee24..8d4ceef4f67f 100644
>> --- a/arch/arm64/kernel/process.c
>> +++ b/arch/arm64/kernel/process.c
>> @@ -183,7 +183,7 @@ static void print_pstate(struct pt_regs *regs)
>>  		const char *btype_str = btypes[(pstate & PSR_BTYPE_MASK) >>
>>  					       PSR_BTYPE_SHIFT];
>>  
>> -		printk("pstate: %08llx (%c%c%c%c %c%c%c%c %cPAN %cUAO %cTCO %cDIT %cSSBS BTYPE=%s)\n",
>> +		printk("pstate: %08llx (%c%c%c%c %c%c%c%c %cALLINT %cPAN %cUAO %cTCO %cDIT %cSSBS BTYPE=%s)\n",
>>  			pstate,
>>  			pstate & PSR_N_BIT ? 'N' : 'n',
>>  			pstate & PSR_Z_BIT ? 'Z' : 'z',
>> @@ -193,6 +193,7 @@ static void print_pstate(struct pt_regs *regs)
>>  			pstate & PSR_A_BIT ? 'A' : 'a',
>>  			pstate & PSR_I_BIT ? 'I' : 'i',
>>  			pstate & PSR_F_BIT ? 'F' : 'f',
>> +			pstate & PSR_ALLINT_BIT ? '+' : '-',
> Hi Vladimir,
> 
> This seems to be correct, but the status of the ALLINT bit
> should not be displayed if FEAT_NMI is not enabled (system_uses_nmi()).
> 
> According to the ARM64 ALLINT manual,
> 
> 	"On a Warm reset, this field resets to an architecturally UNKNOWN value."
> 
> If the hardware supports FEAT_NMI but the config is not enabled, the
> value of the ALLINT bit is a random value, which is very misleading to
> show it.
> 

On FEAT_NMI hardware PSTATE.ALLINT is always set to the inverse of
SCTLR_ELx.SPINTMASK on taking the exception regardless of the value
of SCTLR_ELx.NMI. So I fail to see how it could be a random value.

I agree that it could be slightly confusing to see ALLINT even if NMI
is not enabled, such as when the user has forced pNMI or hidden NMI
via id_aa64pfr1.nmi=0 or disabled NMI via config option.

Guarding this with supports_nmi() indeed could help. However, I think
the general direction is to keep this function lean and not add extra
conditionals.

Thanks
Vladimir

> Best regards,
> Jinjie
> 
> 
>>  			pstate & PSR_PAN_BIT ? '+' : '-',
>>  			pstate & PSR_UAO_BIT ? '+' : '-',
>>  			pstate & PSR_TCO_BIT ? '+' : '-',
> 


