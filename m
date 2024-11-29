Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4172D6EBE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 07:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4tD95wEzzC7ua/VvyG4y/vO8ctyWBdq2dh2LRB0nY8=; b=TY3J790Ea+COGjLF4z5CkRFfcv
	2985dyHQVWVK3epyJoHV0/1JsKY63/zLGtvAp0Df1ZYajxnBw7F4MuiBsC0c8rBs7Vm4cNSFhV7ig
	cLKBQr201gyUgUtsRnlldGVy/CfpkIJTn9i2Q7f9kLEZAAROhtHocsrQsBUKO4KUdt+Dte3baSJvj
	1JiuTvi6DchiyCMeZ9O0JdLvKADWEsNF3gRWHILOhnXL1Savjy36Sm/QJXmawm91CgzZhAUlW4BAS
	3IQ1wwmOP4g2NIbDy169ZYx2d11HuYkyeQsDrwasbpktcJF5VjaObJ6utVtjIAZpeHA5IMWtWh9cJ
	py0O8YEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGvKT-0000000H4IQ-0N2N;
	Fri, 29 Nov 2024 07:22:17 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGvJS-0000000H49d-3pgf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 07:21:16 +0000
Date: Thu, 28 Nov 2024 23:20:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732864871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M4tD95wEzzC7ua/VvyG4y/vO8ctyWBdq2dh2LRB0nY8=;
	b=l8jDcI4iye34mkZSkKkml7LqVOjXtSRZ9LRvvG6Rhz0dvsP7PTnFZQs5ybXAcUyWNmwt/C
	l9TqAIceTPIEthXOsJTAz1Qr7fGGi6mmGR4Xd375xgoaxaqyMcomAKj8Df6caOyAwuhxs0
	lmRyrJaCjs5nK6XhnuGlwzRGuOHFA8I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Keisuke Nishimura <keisuke.nishimura@inria.fr>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH] KVM: arm/arm64: vgic-its: Add error handling in
 vgic_its_cache_translation
Message-ID: <Z0lrWynd3O8a1pG_@linux.dev>
References: <20241128134534.361144-1-keisuke.nishimura@inria.fr>
 <Z0iujBMl1ypdwfBu@linux.dev>
 <a62e682d-c2e8-424d-84c5-4e64468124a9@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a62e682d-c2e8-424d-84c5-4e64468124a9@inria.fr>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_232115_656376_80A641EC 
X-CRM114-Status: GOOD (  27.54  )
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

On Thu, Nov 28, 2024 at 08:04:01PM +0100, Keisuke Nishimura wrote:
> Hello Marc and Oliver,
> 
> Thank you for the replies.
> 
> On 28/11/2024 18:55, Oliver Upton wrote:
> > On Thu, Nov 28, 2024 at 02:45:34PM +0100, Keisuke Nishimura wrote:
> > > The xa_store() may fail because there is no guarantee that the cache_key
> > > index is already used in its->translation_cache. This fix (1) resolves
> > > the kref inconsistency on failure and (2) returns the error code.
> > 
> > xa_store() doesn't fail if an entry is already present at the specified
> > index. It returns the old entry, which is why we have a vgic_put_irq()
> > on the "error" path.
> 
> Sure. But to my understanding, this could be the first store to
> its->translation_cache with cache_key, and that is why old can be NULL? I am
> not very familiar with this code, so please correct me if I am wrong.

So we take a reference on @irq to represent the pointer to it that's
stored in the translation cache. There are 3 possible outcomes after the
store:

 - Store succeeds and no pre-existing entry.

 - Store succeeds and there's a pre-existing entry. put the reference on
   @old since it was evicted from the translation cache

 - Store fails because of a failed memory allocation / error in xarray
   library.

We don't handle #3, and the correct thing to do in this case is to put
@irq since it was never made visible in the translation cache.

So I think we'd want to do something similar to the following.

-- 
Thanks,
Oliver

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index f4c4494645c3..fb96802799c6 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -608,12 +608,22 @@ static void vgic_its_cache_translation(struct kvm *kvm, struct vgic_its *its,
 	lockdep_assert_held(&its->its_lock);
 	vgic_get_irq_kref(irq);
 
+	old = xa_store(&its->translation_cache, cache_key, irq, GFP_KERNEL_ACCOUNT);
+
+	/*
+	 * Put the reference taken on @irq if the store fails. Intentionally do
+	 * not return the error as the translation cache is best effort.
+	 */
+	if (xa_is_err(old)) {
+		vgic_put_irq(kvm, irq);
+		return;
+	}
+
 	/*
 	 * We could have raced with another CPU caching the same
 	 * translation behind our back, ensure we don't leak a
 	 * reference if that is the case.
 	 */
-	old = xa_store(&its->translation_cache, cache_key, irq, GFP_KERNEL_ACCOUNT);
 	if (old)
 		vgic_put_irq(kvm, old);
 }

