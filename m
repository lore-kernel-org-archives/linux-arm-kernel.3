Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5C0C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUIMbyjzjk6Gbi1KQs8lIYpj3qBqcTH19UQA/L6N/Y8=; b=XH4detg86cSzwMOQJN0WWIWARe
	G9W9rNHGcrei9Q3PTr4PAnnMJwC9K90tEiAwhRv6+4I2fW4Vpqn6YLxDEGPNxwlbgslnIRP36mASA
	vPu+I+RWl0QnGpgoC4FzJswFM5wWUEN4jc2BiegkfKm5+2ZG72xadPEjySiEUunBfET2IJ4EqKGZM
	RTUUaWpqRh2FNwolxQ+hoUM8OHV2M6SlmU4U6W6ktxdPrmmA+FYP0zEfbZkKCZRJNWxYhhZEciGi6
	A+cEubSNRJTcqzPFeY7lg6e9s2VkLsaT5ROeQpq/LPJHt9IQMBRKBKKbj7Eked/pcziZC3PVFJG6n
	Yfp8v9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrmn-0000000H1VG-3PmZ;
	Mon, 03 Aug 2026 12:28:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrml-0000000H1Ui-2wQ1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:28:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAF8D1476;
	Mon,  3 Aug 2026 05:28:46 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 372443F66F;
	Mon,  3 Aug 2026 05:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785760130; bh=3NJf4uOIwKgpdXc0ZaovCjw+QoXRq5IFPAEFAXt4i24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gFQnVGX01j3IMN8m5Gg4I+rj5CJSnKVK+CWnkj0+9nRmm/8Cw45V86qbUx42mMSUA
	 bugxjBqlPAJCqlX+PQ9AeNy2QyhCYGUfjA7ekbrPzMPBuUQe6PEsR++rpFWJDvDZkk
	 ZkoPxCIKCaHNeALBlUuQy3RoKLKq4X6qzJOWEq+k=
Message-ID: <972a040a-da53-4051-adba-7984e593b7b3@arm.com>
Date: Mon, 3 Aug 2026 13:28:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 32/45] arm64: nmi: Manage masking for superpriority
 interrupts
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-33-vladimir.murzin@arm.com>
 <343099ee-a9b3-41b0-9e6f-f63c1dad841b@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <343099ee-a9b3-41b0-9e6f-f63c1dad841b@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_052851_773703_04640209 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

On 7/28/26 13:14, Jinjie Ruan wrote:
>> @@ -194,10 +218,21 @@ void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
>>  		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
>>  	}
>>  
>> +	/*
>> +	 * Try to order ALLINT writes to be consistent with the DAIF state :
>> +	 * we don't want to take an NMI with DAIF masked or when it should
>> +	 * be masked but isn't yet.
>> +	 */
>> +	if (system_uses_nmi() && hwstate.allint && force)
> 
> hwstate.allint & ALLINT_ALLINT
> 

Fair enough.

>> +		_allint_set();
>> +
>>  	barrier();
>>  	write_sysreg(hwstate.daif, daif);
>>  	barrier();
>>  
>> +	if (system_uses_nmi() && !hwstate.allint && force)
> !(hwstate.allint & ALLINT_ALLINT）
> 

Fair enough.

I'll fix both of them in the next version.

Thanks
Vladimir

>> +		_allint_clear();
>> +
>>  	if (system_uses_irq_prio_masking() &&
>>  	    hwstate.pmr == GIC_PRIO_IRQON &&
>>  	    force) {


