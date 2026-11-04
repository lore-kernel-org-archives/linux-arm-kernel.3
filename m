Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA37D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iFGd7jGZ;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aBYGdWw7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xHp9zcciDt9BQSTYUI4c3pqvrH6NfBZKhO/JkiSc8yA=; b=iFGd7jGZD+icOd
	7m9CL0rjQVNKYPaSy+WTtWaDd/BRrqYwlwkBfzTukcd6cvoPWzr68Tkegr0zr1AahF+vUCYvOruVp
	Ac9npmqeeR4gtQM4WPj0hq/gG9BJfeBcXp8k4RGy576o9bMj1dFiOh+qTc/YqXrox39fqEs6/mHW0
	Z0rARu1C438U+Jm4ffZAdp/ctUC43LD3DDB+4KOysv0r2d2svFK/q4xErnW1u91YzKCwEnoYb5ek2
	gOUtpMSGAmHfccnQzwOpDfptDxd0mXwdTXCzIfHTck409E3E6gk0rXZUTxO/83sUJRELiMkCO6eY2
	+w/7d5XFAUuGQbdGcZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeR7-000000068kE-3piI;
	Wed, 04 Nov 2026 17:06:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeR5-000000068iw-0W2r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:06:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 813BE1BB0;
	Wed,  4 Nov 2026 09:06:00 -0800 (PST)
Received: from [10.57.90.115] (unknown [10.57.90.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 909573F673;
	Wed,  4 Nov 2026 09:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793811963; bh=M5dLetY60rROLOEP0RTG1zWPi4zkfIzPuDEW8MB3PWQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aBYGdWw7WH5tD8TaTad1UX5sXkFqHy3kJFkCIO/NV+nPvDKlY2sXMTXu+pv2gHLoM
	 z3vZUPDN/buLPybv/Q+X6+qfjoULVPVgWwTWUrdshr2BqKyGHwDH3WX9pynYyFbpe+
	 ECT6kIX/0a74V1YeaSzu7NMMtnYPeJE0Zi4A9SSk=
Message-ID: <ba2d9aa3-f14d-47e6-8cdc-62a6d385515e@arm.com>
Date: Wed, 4 Nov 2026 17:05:59 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] irqchip/gic-v5: Serialise IRS synchronisation
 requests
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-3-743b61626fc5@arm.com>
 <aumlixJkwDBlv8Yf@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <aumlixJkwDBlv8Yf@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_090607_240989_F42CB902 
X-CRM114-Status: GOOD (  17.27  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03/11/2026 09:12, Lorenzo Pieralisi wrote:
> On Mon, Nov 02, 2026 at 01:32:56PM +0000, Sascha Bischoff wrote:
>> IRS_SYNCR writes are ignored while IRS_SYNC_STATUSR.IDLE is clear.
>> Calls to gicv5_irs_syncr() for different IRQs can overlap, allowing
>> the second request to be dropped. Its caller can then observe the
>> first request completing and assume that its own events have been
>> processed.
>>
>> Serialise the request and completion poll with a raw spinlock. We use
>> atomic polling, as the lock cannot be held over a sleeping wait.
>>
>> Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
>> ---
>>   drivers/irqchip/irq-gic-v5-irs.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
>> index 4edf787f3f97f..ead76560ea08f 100644
>> --- a/drivers/irqchip/irq-gic-v5-irs.c
>> +++ b/drivers/irqchip/irq-gic-v5-irs.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/log2.h>
>>   #include <linux/of.h>
>>   #include <linux/of_address.h>
>> +#include <linux/spinlock.h>
>>   
>>   #include <linux/irqchip.h>
>>   #include <linux/irqchip/arm-gic-v5.h>
>> @@ -22,6 +23,8 @@
>>   #define LPI_ID_BITS_LINEAR		12
>>   
>>   static DEFINE_PER_CPU_READ_MOSTLY(struct gicv5_irs_chip_data *, per_cpu_irs_data);
>> +/* Synchronization requests must not overlap in an IRS Domain. */
>> +static DEFINE_RAW_SPINLOCK(irs_sync_lock);
>>   static LIST_HEAD(irs_nodes);
>>   
>>   static u32 irs_readl_relaxed(struct gicv5_irs_chip_data *irs_data,
>> @@ -507,10 +510,11 @@ void gicv5_irs_syncr(void)
>>   		return;
>>   
>>   	syncr = FIELD_PREP(GICV5_IRS_SYNCR_SYNC, 1);
>> +	guard(raw_spinlock_irqsave)(&irs_sync_lock);
> 

Hi Lorenzo,

> Why does it have to be a spinlock ?

gicv5_irs_syncr() is also called while restoring the host ITTE in 
gicv5_its_set_vcpu_affinity() once we have the GICv5 ITS support for 
KVM. That callback runs under the irq descriptor lock via 
irq_set_vcpu_affinity(), so it cannot sleep. I’ll clarify this in the 
commit message.

Apologies for the lack of clarify in that regard for some of these 
commits. They logically made more sense when they were bundled together 
with my KVM changes, but now that I pulled them out some of the commit 
messages lack context.

> 
> Thanks,
> Lorenzo

Thanks,
Sascha

> 
>>   	irs_writel_relaxed(irs_data, syncr, GICV5_IRS_SYNCR);
>>   
>> -	gicv5_wait_for_op(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
>> -			  GICV5_IRS_SYNC_STATUSR_IDLE);
>> +	gicv5_wait_for_op_atomic(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
>> +				 GICV5_IRS_SYNC_STATUSR_IDLE, NULL);
>>   }
>>   
>>   int gicv5_irs_register_cpu(int cpuid)
>>
>> -- 
>> 2.34.1
>>


