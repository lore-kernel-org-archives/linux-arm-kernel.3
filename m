Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7BDC5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4a57UKGzC2bV4PeAUZvpyMlKSr5z3ugJ4BwMrsPNfhw=; b=2vjyPN4BV6M4z5Da4Ipq5brIw9
	TVlN5MgkZiBq17gNUsRByOfjoA60m8A4VmAF87M9mgtDP8651cXbzxjGEHMn7JoDdGwdPCqbBFMXA
	E7vDSeHJ4KL7/WpgUcAz8hjfDUKF7EXmcGaR5YwaMoZkTJvXDXrM9F1EeLrd//0r3nfTq0LRENCow
	EadroS7Pu4L0419LLMeAAO7bMBtCCch9WbORKEsck/vN36iBMoYC7TtcBQdPjjC6IBj0ihcRU8XTN
	KaIMzvsYhTFIQb/l/u+AobIy9qTQpHvbyygrAYC9993gsuZJkZFeD/dsLNUnx236JRNCfQnHGpALM
	b8osMahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOqP-0000000DMGr-02Wx;
	Fri, 21 Aug 2026 12:59:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOqM-0000000DMGQ-0ekM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:59:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B8881476;
	Fri, 21 Aug 2026 05:59:27 -0700 (PDT)
Received: from [10.57.68.59] (unknown [10.57.68.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 295643F85F;
	Fri, 21 Aug 2026 05:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787317171; bh=6gg2K8ZY7moM5BXjUMivefrAi9o44hVXr3rdwVlxUwU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NDvuAB9TxD0thQvfsG8Jk762pTxZ3mV6i1aRvrMdn6dkqTQY69NehEA1Kb2ILzLNl
	 z0RFSBHJqNcTKkWD8epZaC1snTd3GFLCTVrGl3Tg0d4XnpBo3D1oocwwPtsZRnBWbT
	 LyQb/IJdwtvd21QD2wVQsukFZOG/nvsMsIEQRMlo=
Message-ID: <ddcf3c44-41b6-48af-8150-84fc5102f475@arm.com>
Date: Fri, 21 Aug 2026 13:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/45] arm64: interrupts: Add common exception
 state helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-13-vladimir.murzin@arm.com>
 <e93ae08b-64e2-4128-b1fd-910c4d197dbd@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <e93ae08b-64e2-4128-b1fd-910c4d197dbd@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_055934_392798_F2685ADC 
X-CRM114-Status: GOOD (  25.14  )
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

On 7/28/26 09:20, Jinjie Ruan wrote:
> 
[snip]

Sorry, Jinjie, I missed other comments...

>> +
>> +static __always_inline
>> +void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
>> +{
>> +	barrier();
> I don't understand the purpose of the barrier at the beginning and end
> of the function. Is this fix also required for the original
> implementation of local_daif_restore()?
> 

The entry and exit barrier() calls prevent the compiler from moving
surrounding memory accesses across the exception state switch, so
caller memory accesses remain on the intended side of the exception
state switch. This is modeled after local_irq_{en,dis}able() and is
indeed different from local_daif_{restore,mask}().

__arm64_update_exc_hwstate() is a generic helper which can be used to
mask and unmask exceptions, while local_daif_{restore,mask}() seem to
be unidirectional. local_daif_mask() (and local_daif_save()) mask
exceptions and have a compiler barrier in the form of a memory clobber,
while local_daif_restore() and local_daif_inherit(), IIUC, are used
to unmask exceptions, and I could not spot a compiler barrier in any
form there.

I _assume_ that having a relaxed local_daif_{restore,inherit}() is OK,
yet I have not validated all use cases.

>> +
>> +	if (system_uses_irq_prio_masking() &&
>> +	    hwstate.pmr == GIC_PRIO_IRQOFF &&
>> +	    force) {
>> +		/*
>> +		 * There has been concern that the write to daif
>> +		 * might be reordered before this write to PMR.
>> +		 * From the ARM ARM DDI 0487D.a, section D1.7.1
>> +		 * "Accessing PSTATE fields":
>> +		 *   Writes to the PSTATE fields have side-effects on
>> +		 *   various aspects of the PE operation. All of these
>> +		 *   side-effects are guaranteed:
>> +		 *     - Not to be visible to earlier instructions in
>> +		 *       the execution stream.
>> +		 *     - To be visible to later instructions in the
>> +		 *       execution stream
>> +		 *
>> +		 * Also, writes to PMR are self-synchronizing, so no
>> +		 * interrupts with a lower priority than PMR is signaled
>> +		 * to the PE after the write.
>> +		 *
>> +		 * So we don't need additional synchronization here.
>> +		 */
>> +		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
>> +	}
>> +
>> +	barrier();
> This barrier seems redundant and inconsistent with the comment above.
> 

This is a compiler barrier and has nothing to do with the comment
above. However, it is not needed here and bellow, since the sysreg
accessors use asm volatile, so the compiler preserves the relative
order of the PMR and DAIF accesses.

Cheers
Vladimir

>> +	write_sysreg(hwstate.daif, daif);
>> +	barrier();
>> +
>> +	if (system_uses_irq_prio_masking() &&
>> +	    hwstate.pmr == GIC_PRIO_IRQON &&
>> +	    force) {
>> +		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
>> +		pmr_sync();
>> +	}
>> +
>> +	barrier();
>> +}
> If we no use pesudo NMI, the barrier is not nessary,
> 
> static __always_inline
> void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
> {
>     if (system_uses_irq_prio_masking() && force) {
>         if (hwstate.pmr == GIC_PRIO_IRQOFF)
>             write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
> 
>         write_sysreg(hwstate.daif, daif);
>         if (hwstate.pmr == GIC_PRIO_IRQON) {
>             barrier();
>             write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
>             pmr_sync();
>         }
>     } else {
>         write_sysreg(hwstate.daif, daif);
>     }
> }
> 
> otherwise, LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
>> +
>> +static __always_inline
>> +void arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate)
>> +{
>> +	__arm64_update_exc_hwstate(hwstate, true);
>> +}
>> +
>> +static __always_inline
>> +void arm64_update_exc_context(arm64_exc_context_t context)
>> +{
>> +	arm64_exc_hwstate_t hwstate = arm64_exc_hwstate_of_context(context);
>> +
>> +	arm64_update_exc_hwstate(hwstate);
>> +}
>> +#endif /* __ASM_INTERRUPTS_COMMON_FLAGS_H */
> 


