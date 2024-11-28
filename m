Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B92D70DED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 19:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCXNzwoYjhjr8btaZ57OB2jRNu87McCmAkcc7DaLDwo=; b=w7rarZ0reEiqrUJyTK1r0nFG2p
	IdkEdDZICsSur7eLq/lYd9AHXUREZX/E7mQZ1XOEWGm+K7/cWFdm+Blaz7PjJMb421zRYWe7Xy+oa
	nCeiAkN0zRtZUDk5tRbe82Ub1ufUtWGrxoXDeW1hoSa8LXVHANMqlLjPgK6HmdkeBejr9cq4NE2BI
	8CYiCTEOabiwF7AYfaEiNlnFLkd0sciozEC8hViL/UzI2F/GZW+ibleQ8DRD3Ir6QSLTHzN6ujxE5
	O3uvrn7eA4A9sIN3n603qSDjL3o6SFROZdEDSLI1ePH6JyxS+dsApj5hJp2E7Vd1N0H3fDXwOawVH
	MhTIeC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGjp5-0000000GDGG-1JdJ;
	Thu, 28 Nov 2024 19:05:07 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGjo5-0000000GD8f-1EWo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 19:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hCXNzwoYjhjr8btaZ57OB2jRNu87McCmAkcc7DaLDwo=;
  b=s29WyAmO8KapvqVuiZJcfKkecoTldhMZf2ISF7UhCfJOS3P/EEDmv6N2
   P67cGTLSOdXvsbVlgCrtEYuNkq+HBEIarCqn/GyO6vN7PYHnlnyNKaEzN
   +Ym/jxqI28fU45MeVWbUipzN1H0OJXA5TSms6i3PWbuB2moduP44DMNyr
   s=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.12,193,1728943200"; 
   d="scan'208";a="102924560"
Received: from dt-aponte.paris.inria.fr (HELO [128.93.67.66]) ([128.93.67.66])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 20:04:02 +0100
Message-ID: <a62e682d-c2e8-424d-84c5-4e64468124a9@inria.fr>
Date: Thu, 28 Nov 2024 20:04:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm/arm64: vgic-its: Add error handling in
 vgic_its_cache_translation
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev
References: <20241128134534.361144-1-keisuke.nishimura@inria.fr>
 <Z0iujBMl1ypdwfBu@linux.dev>
Content-Language: en-US
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
In-Reply-To: <Z0iujBMl1ypdwfBu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_110405_731347_B8D33AA1 
X-CRM114-Status: GOOD (  24.58  )
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

Hello Marc and Oliver,

Thank you for the replies.

On 28/11/2024 18:55, Oliver Upton wrote:
> On Thu, Nov 28, 2024 at 02:45:34PM +0100, Keisuke Nishimura wrote:
>> The xa_store() may fail because there is no guarantee that the cache_key
>> index is already used in its->translation_cache. This fix (1) resolves
>> the kref inconsistency on failure and (2) returns the error code.
> 
> xa_store() doesn't fail if an entry is already present at the specified
> index. It returns the old entry, which is why we have a vgic_put_irq()
> on the "error" path.

Sure. But to my understanding, this could be the first store to 
its->translation_cache with cache_key, and that is why old can be NULL? I am not 
very familiar with this code, so please correct me if I am wrong.

> 
> Genuine error handling definitely is missing here, but that would only
> happen if the xarray library failed to allocate (-ENOMEM) or if the
> xarray itself is broken beyond repair (-EINVAL).
> 
>> Fixes: 8201d1028caa ("KVM: arm64: vgic-its: Maintain a translation cache per ITS")
>> Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
>> ---
>>   arch/arm64/kvm/vgic/vgic-its.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
>> index 198296933e7e..8f423857b7d2 100644
>> --- a/arch/arm64/kvm/vgic/vgic-its.c
>> +++ b/arch/arm64/kvm/vgic/vgic-its.c
>> @@ -555,7 +555,7 @@ static struct vgic_irq *vgic_its_check_cache(struct kvm *kvm, phys_addr_t db,
>>   	return irq;
>>   }
>>   
>> -static void vgic_its_cache_translation(struct kvm *kvm, struct vgic_its *its,
>> +static int vgic_its_cache_translation(struct kvm *kvm, struct vgic_its *its,
>>   				       u32 devid, u32 eventid,
>>   				       struct vgic_irq *irq)
> 
> This was deliberately made a void return. The entire translation cache
> is opportunistic and not required for functional correctness. Nothing
> breaks if we fail to insert an entry for, say, a failed memory
> allocation.

If my point above is correct, in the next version, we can ensure no memory error 
here by calling xa_reserve() in advance. Or, we can ignore the error, and just 
make the kref consistent.

> 
> It would be extremely helpful if you could share the steps to reproduce
> the error you observe.
> 

I encountered this when I studied the usage of xa_*. After some investigation to 
confirm that the call of xa_store() might be the first store with cache_key, I 
sent this patch. (I apologize if I missed anything.)

Thank you,
Keisuke

