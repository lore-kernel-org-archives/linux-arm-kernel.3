Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958E3C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHJ3paD55i7zus9Qk9EYKpiugs/TV0iilkm9IjMJHm0=; b=cmEMXx3dbEGVpk
	wrIku3DdAiFVX1qXP9gV3rFoS34957QAxvMOdm7FaSIBQVxlD0XXTQDIWKgtSneVnOv3QxojnprEF
	sjze05tHU37q924vHuV+WAxdJuuYfxTRNjDk3jQSx3WsSlPEPkoBz3DCNodv8BNg6loKY8qbq/91U
	7KDSMFSk5sOwwY0/TpnyAz7uHi1Pr++wNR8hEEpRY5Cgy9CY+kG7g0JeVFrvWxqxRVBbLtqAcEOVM
	Na3njli93LBUbsXqbiykV+qhbScbAkUXv52mjfOdtAn+8pnux9uD+n03zQceg/E255devE6KGr11d
	SiS0SjZoNQAVJq5Tu/yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjx5X-0000000EUTk-0pbS;
	Wed, 15 Jul 2026 10:43:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjx5U-0000000EUTD-1yFk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 10:43:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 254CD1477;
	Wed, 15 Jul 2026 03:43:31 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 059533F7B4;
	Wed, 15 Jul 2026 03:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784112215; bh=/rpRhT2EBWKL2i6C/kd+OnXVQ37BfQUbnXIaIXqVWRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YmwOJ4DjimS59u20HmvHu269zD9LA3vMqA1Xry2xWX3fV9CptfsY0L4kFLYMbEwaY
	 1GLCdBd+4yjrW0EyK4yk9/SS4lAopPuevGCUnOjmD3xjES+MfUSPZ4kRFhMoYjg9jw
	 64AI3dfLVW3JUlvVWzWO04RDGPGwVz/w5vTgs3mc=
Message-ID: <77fba859-cfcc-4120-ba17-b4e1c4113e10@arm.com>
Date: Wed, 15 Jul 2026 11:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/36] arm64: interrupts: introduce interrupt masking
 helpers for entry code
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-12-vladimir.murzin@arm.com>
 <797df793-51c3-4311-8c0a-98c1642e1035@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <797df793-51c3-4311-8c0a-98c1642e1035@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_034336_800970_D2DC6F60 
X-CRM114-Status: GOOD (  14.45  )
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

On 7/10/26 10:44, Jinjie Ruan wrote:
>> +static __always_inline
>> +void arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool update_pmr)
>> +{
>> +	if (system_uses_irq_prio_masking() &&
>> +	    update_pmr &&
>> +	    hwstate.pmr == GIC_PRIO_IRQOFF) {
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
>> +		pmr_sync();
>> +	}
>> +
>> +	write_sysreg(hwstate.daif, daif);
>> +
>> +	if (system_uses_irq_prio_masking() &&
>> +	    update_pmr &&
>> +	    hwstate.pmr == GIC_PRIO_IRQON) {
>> +		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
>> +		pmr_sync();
> In the original local_daif_restore, pmr_sync is only required when
> interrupts are enabled. Is there any performance issue?
> 
> If all are using pmr_sync, why not merge it with the previous pmr
> operations?

IIUC, pmr_sync is not required for IRQOFF case. Please see my other
reply on this patch for the rationale behind structuring this function
this way.

Cheers
Vladimir

