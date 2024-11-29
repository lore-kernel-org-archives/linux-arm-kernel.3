Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C1ED6EBFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 11:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Q3XjPb0Ey2Y1XcJHGYpRebmTpz9c8xwwCA/EQuTE0A=; b=MB8BLlZzA0GJUQDR3/oVtKOb5U
	Q9vTavqrg/ckr/PzT90YmrBxl1wwHgMWTGsjsD8tiWThlOrCTSKfH+azNNs0Oa614doOrGy7MPqvY
	nmGljIGMSMooTuYt3bcluxyefXRZ6RjTMD043blPsfiQ3EGTdX/W8fhfuHlyUZ1pmrM6sZ+J4190H
	gheW6zy1cWgk6Wd7YFtYG8fL5PmEFlzmijK75zWTSKb0Yb8dOymfi9C0nraP7nN7kiWLBpDhcm7ky
	8ClmDZEpu3KUQvd/PYdnz1juY3gkyXQ+iX2DgBO7VzT2pQ+2hM8B4vn+d5Qg/fo95c9RoN8pGBxhl
	LAgg8Q4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGzEd-0000000HYeN-1LZZ;
	Fri, 29 Nov 2024 11:32:31 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGzD6-0000000HYCr-1eSw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 11:30:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/Q3XjPb0Ey2Y1XcJHGYpRebmTpz9c8xwwCA/EQuTE0A=;
  b=LBVDCAInW9HTBdXVSGmbuq9y9xWtFXiyE7uk36AfLiZc40znbZaiiq6f
   +OJoP24YFaAdG3BIHqrUlz3SHkb7hFs0CkAyD1VbMQyxYQULhx/R8MolU
   hQcPxzyyUqJeIySjTrfflcfeOa16EWDt40PwMV+9HCYNj1wEF0/st2mjB
   Q=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.12,195,1728943200"; 
   d="scan'208";a="102991282"
Received: from dt-aponte.paris.inria.fr (HELO [128.93.67.66]) ([128.93.67.66])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 12:30:54 +0100
Message-ID: <e85e92f9-8387-4021-885e-a379a2898c9c@inria.fr>
Date: Fri, 29 Nov 2024 12:30:52 +0100
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
 <Z0iujBMl1ypdwfBu@linux.dev> <a62e682d-c2e8-424d-84c5-4e64468124a9@inria.fr>
 <Z0lrWynd3O8a1pG_@linux.dev>
Content-Language: en-US
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
In-Reply-To: <Z0lrWynd3O8a1pG_@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_033056_945813_DB0A1848 
X-CRM114-Status: GOOD (  32.32  )
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



On 29/11/2024 08:20, Oliver Upton wrote:
> On Thu, Nov 28, 2024 at 08:04:01PM +0100, Keisuke Nishimura wrote:
>> Hello Marc and Oliver,
>>
>> Thank you for the replies.
>>
>> On 28/11/2024 18:55, Oliver Upton wrote:
>>> On Thu, Nov 28, 2024 at 02:45:34PM +0100, Keisuke Nishimura wrote:
>>>> The xa_store() may fail because there is no guarantee that the cache_key
>>>> index is already used in its->translation_cache. This fix (1) resolves
>>>> the kref inconsistency on failure and (2) returns the error code.
>>>
>>> xa_store() doesn't fail if an entry is already present at the specified
>>> index. It returns the old entry, which is why we have a vgic_put_irq()
>>> on the "error" path.
>>
>> Sure. But to my understanding, this could be the first store to
>> its->translation_cache with cache_key, and that is why old can be NULL? I am
>> not very familiar with this code, so please correct me if I am wrong.
> 
> So we take a reference on @irq to represent the pointer to it that's
> stored in the translation cache. There are 3 possible outcomes after the
> store:
> 
>   - Store succeeds and no pre-existing entry.
> 
>   - Store succeeds and there's a pre-existing entry. put the reference on
>     @old since it was evicted from the translation cache
> 
>   - Store fails because of a failed memory allocation / error in xarray
>     library.
> 
> We don't handle #3, and the correct thing to do in this case is to put
> @irq since it was never made visible in the translation cache.
> 
> So I think we'd want to do something similar to the following.
> 

Hello,

Thanks for the comment. xa_reserve() can allocate the memory in advance and 
ensure the success of the subsequent xa_store(). FYI, the document of 
xa_reserve() says:

 > Ensures there is somewhere to store an entry at index in the array. If there 
is already something stored at index, this function does nothing. If there was 
nothing there, the entry is marked as reserved. Loading from a reserved entry 
returns a NULL pointer.


I am thinking of calling it before the reference in v2. Here is the suggestion:

---
  arch/arm64/kvm/vgic/vgic-its.c | 9 +++++++++
  1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 198296933e7e..1422812ad6d7 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -561,11 +561,20 @@ static void vgic_its_cache_translation(struct kvm *kvm, 
struct vgic_its *its,
  {
  	unsigned long cache_key = vgic_its_cache_key(devid, eventid);
  	struct vgic_irq *old;
+	int ret;

  	/* Do not cache a directly injected interrupt */
  	if (irq->hw)
  		return;

+	/*
+	 * Ensure the following xa_store() will not fail. Intentionally do
+	 * not return the error as the translation cache is best effort.
+	 */
+	ret = xa_reserve(&its->translation_cache, cache_key, GFP_KERNEL_ACCOUNT);
+	if (ret)
+		return;
+
  	/*
  	 * The irq refcount is guaranteed to be nonzero while holding the
  	 * its_lock, as the ITE (and the reference it holds) cannot be freed.
-- 
2.34.1


