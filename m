Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA50CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gO7eUT36W2578KP5ay4B4VspJHw40QI17sJcPqSN4cg=; b=MoTCP68eNE0ksN1q9zUa5oBWU1
	3drjftEkd6NtfS+u5CA3Lr8lSFaXpkdeb8yrRVhNys2eA/kFlVi6mQgMdswouT6HWSdudPuy6TICV
	Lg8c/n6B8vMcq9lJ84XO5WCpYnBta5pArkjO4Y1HX8k3/F9fdnz+BlJDsPQkMn9acCS3OUpdVMol8
	Uui8/dY4zmXrmaYl1dKQhc7KUiLYeADXH2PVmT9tN0fz5GE0mFLIFEWkKByVSSEC3F1UBAQNJKJhl
	FnNIaP4IQiKhmyxuafMNJUVNlLJO9ydxrh24lKw3K8bEMALPl1FSefHkJGQnjax7Ds/LByYoxRh/s
	8DO7BZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5a6-00000008NhW-08mI;
	Thu, 21 May 2026 15:45:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5Zw-00000008Nd7-0CwY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:44:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8010C43C7;
	Thu, 21 May 2026 08:44:49 -0700 (PDT)
Received: from [10.1.32.22] (e122027.cambridge.arm.com [10.1.32.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42DFF3F632;
	Thu, 21 May 2026 08:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779378294; bh=6gAaJ+35b1VdmIblUzMc8Butec45iLP3FQ6Y+JZdcHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hPwXuuzCY2yocAWOlMCJno1HcCxIdce96lDYkDuhELyquW2pczOqgxkNux8vjnHH+
	 4doVLz2/M9VRLnXKKY3jWAg8mW9MEH7ZD47rm/1B2g2WH8xp7Hi1q9Auwd6W+a3mLi
	 lmzDYN+216pKIaLCAtknxPh0AZo3pfojxXhn6Yrc=
Message-ID: <c3fb0380-e1bb-4429-aa2e-33fdf5007df7@arm.com>
Date: Thu, 21 May 2026 16:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 05/44] arm64: RMI: Add wrappers for RMI calls
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-6-steven.price@arm.com>
 <da87fa25-d979-4d22-99f1-3ba1d81cff23@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <da87fa25-d979-4d22-99f1-3ba1d81cff23@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_084456_860025_A2A1B214 
X-CRM114-Status: GOOD (  27.10  )
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

On 21/05/2026 01:21, Gavin Shan wrote:
> Hi Steven,
> 
> On 5/13/26 11:17 PM, Steven Price wrote:
>> The wrappers make the call sites easier to read and deal with the
>> boiler plate of handling the error codes from the RMM.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes from v13:
>>   * Update to RMM v2.0-bet1 spec including some SRO support (there still
>>     some FIXMEs where SRO support is incomplete).
>> Changes from v12:
>>   * Update to RMM v2.0 specification
>> Changes from v8:
>>   * Switch from arm_smccc_1_2_smc() to arm_smccc_1_2_invoke() in
>>     rmi_rtt_read_entry() for consistency.
>> Changes from v7:
>>   * Minor renaming of parameters and updated comments
>> Changes from v5:
>>   * Further improve comments
>> Changes from v4:
>>   * Improve comments
>> Changes from v2:
>>   * Make output arguments optional.
>>   * Mask RIPAS value rmi_rtt_read_entry()
>>   * Drop unused rmi_rtt_get_phys()
>> ---
>>   arch/arm64/include/asm/rmi_cmds.h | 661 ++++++++++++++++++++++++++++++
>>   1 file changed, 661 insertions(+)
>>   create mode 100644 arch/arm64/include/asm/rmi_cmds.h
>>
>> diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/
>> asm/rmi_cmds.h
>> new file mode 100644
>> index 000000000000..04f7066894e9
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/rmi_cmds.h
>> @@ -0,0 +1,661 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2023 ARM Ltd.
>> + */
>> +
>> +#ifndef __ASM_RMI_CMDS_H
>> +#define __ASM_RMI_CMDS_H
>> +
>> +#include <linux/arm-smccc.h>
>> +
> 
> [...]
> 
>> +
>> +/**
>> + * rmi_rtt_destroy() - Destroy an RTT
>> + * @rd: PA of the RD
>> + * @ipa: Base of the IPA range described by the RTT
>> + * @level: Depth of the RTT within the tree
>> + * @out_rtt: Pointer to write the PA of the RTT which was destroyed
>> + * @out_top: Pointer to write the top IPA of non-live RTT entries
>> + *
> 
> In most cases, the parameters are well explained in RMM-v2.0-bet1 spec,
> I think
> it's nice to keep the code and the spec synchronized. For those specific
> parameters
> of this function, they're well explained in RMM-v2.0-bet1 spec as below.
> 
>    @rd: PA of the RD for the target realm
>    @ipa: Base of the IPA range described by the RTT
>    @level: RTT level
>    @out_rtt: PA of the RTT which was destroyed
>    @out_top: Top IPA of non-live RTT entries, from entry at which the
> RTT walk terminated

I have attempted to keep the descriptions consistent with the spec - I'm
not quite sure what you think the issue is here. The @rd parameter gains
a "for the target realm" - which isn't really very informative (clearly
rmi_rtt_destroy() is targetting the realm which is being passed into the
function). @level is less informative. @out_xxx are prefixed with
"Pointer to write the" because the C function does indeed take a pointer
for the output parameter to be written.

But fair enough I can align them more precisely. In some cases I've
written the code before the final spec wording has been available which
might explain some differences.

Thanks,
Steve

>> + * Destroys an RTT. The RTT must be non-live, i.e. none of the
>> entries in the
>> + * table are in ASSIGNED or TABLE state.
>> + *
>> + * Return: RMI return code.
>> + */
>> +static inline int rmi_rtt_destroy(unsigned long rd,
>> +                  unsigned long ipa,
>> +                  long level,
>> +                  unsigned long *out_rtt,
>> +                  unsigned long *out_top)
>> +{
>> +    struct arm_smccc_res res;
>> +
>> +    arm_smccc_1_1_invoke(SMC_RMI_RTT_DESTROY, rd, ipa, level, &res);
>> +
>> +    if (out_rtt)
>> +        *out_rtt = res.a1;
>> +    if (out_top)
>> +        *out_top = res.a2;
>> +
>> +    return res.a0;
>> +}
>> +
> 
> [...]
> 
> Thanks,
> Gavin
> 


