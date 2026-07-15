Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799C3C44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jd5jzYngT6dqOkpuwWyJZc53GLB4Od6aD/xFdQAU4Ow=; b=w+rjRZOvqpC7sr
	sk95vNyK1dpLZlH1rKAIeckr8QBWgtZ9eq+Fvt1KqNYqexHZuubuY+6hM4Ro86g9Bcm9stYGn6G9X
	4RgGP7L6VIlLp5Vt8VJsez5fydNdl1EbBw8Ao4BiQoICut5EgNUsF5llrzuNBRRrjrVRfVP34B/1a
	+M5xIi7aXH5JTae5B73FvgvYTy5K4RcEjtzZbAAnMmNXa8xWS6jzMquEyAEXQqOHsR4f5Zb9ivQD2
	LaTscBvqQfHEQx+Np5ROz7FEwopjLQ67vIzkS4HSy2RCeJGTTKtSwyvqfz7FYJMv0rEnjpYp7jLG0
	EnDFGJLVU26BTOch6p7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjx1k-0000000ETnY-28qN;
	Wed, 15 Jul 2026 10:39:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjx1i-0000000ETmv-00AT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 10:39:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 126D51477;
	Wed, 15 Jul 2026 03:39:36 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA60B3F7B4;
	Wed, 15 Jul 2026 03:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784111980; bh=wmdL16b70l2qBmvW8NWILneMtGOzGt1bbGt10mvhgEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ICDpKz2g1AgI8AqFCCpuTV5wQbVmlVPmRUOypsqvL7LYFlMppxIqnacQEwY0F0nv6
	 6aFlxEYPscws9qgy8sSGXbbRtPhbttejd0lFh2nW4LD9H/Id1HeZKFIGybN7pVW3cY
	 CuKnpt5bb8QLFUpwiDEDv5kzQph/938qD22AQY7s=
Message-ID: <8c74549a-5a0c-40f5-95e3-26119d2f85a7@arm.com>
Date: Wed, 15 Jul 2026 11:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/36] arm64: interrupts: introduce interrupt masking
 helpers for entry code
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-12-vladimir.murzin@arm.com>
 <6374def7-d2fd-4e34-9fc3-465e479ab681@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <6374def7-d2fd-4e34-9fc3-465e479ab681@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_033942_089840_30B5BE57 
X-CRM114-Status: GOOD (  13.73  )
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

On 7/10/26 10:39, Jinjie Ruan wrote:
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
>> +	}
> The default behavior of both local_daif_restore() and
> local_daif_inherit() is to first restore the PMR register and then
> restore DAIF. It appears that there has been a functional change here.

Please see my other reply on this patch for the rationale behind
structuring this function this way.

Cheers
Vladimir

