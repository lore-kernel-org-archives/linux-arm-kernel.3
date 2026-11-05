Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC26606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 00:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=icsbL8+b;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NF6TE60S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f1CvH+as+agX5N9iINX97/Uef8bnH6gfjICU40OR3xk=; b=icsbL8+bEUWHi9uETpP62S/rQA
	p46jzcLHpMJKizLgTMohn4yDq/nlokh/Ckewx/PMDrK4QiMst/mXh8PNXMaPmAgIYs6Ztdlutu/rn
	PLeVBnyBD0/Q7K8H7hOlAl0eGl/0CjtNmLb0DYKKU+S0agoglh6cJseIDzljGz9nSvseE3BwGCU0Q
	GGr1Z4BSMQnDKOZSg0ToViQL88ckvxvG/oaP5Xhux5K4iAK9gxQmRrG6DDA+1F07qQSv1OkpaVkwl
	PW+lvVdKDIOB3Ad6ieW7giVwf3K1o8Sa0ywiGEco9BE/nIal9ykInawW5pPq49KONzv/n2PfkmmoJ
	AMMQ9cbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlJ9-00000007MBw-2PRJ;
	Thu, 05 Nov 2026 00:26:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlJ8-00000007MBe-0XYD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 00:26:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1044760213;
	Thu,  5 Nov 2026 00:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959D91F000C1;
	Thu,  5 Nov 2026 00:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793838380;
	bh=f1CvH+as+agX5N9iINX97/Uef8bnH6gfjICU40OR3xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NF6TE60SuJ/RpFwiucFOH4X1hDTcm23WfZjdayPf3S5MdR7D8A4LtcLDyGwZlsJj/
	 tFMRVv1bEZhd9KplPtlj2KEX7xVHjaGoh5CtZ62iYtrN0FZpdZXzT5gK7T+r8IwUt6
	 yHMGgKutL9z9CKmcvit1aJntK3pn/Xd5Rs1B8Q4zfa5i7pICeiblBRKqUND87UlL14
	 yvCJpLLqVTnQ/QpalBhaXXAT28o4U9GYx1o0bVnajYQmWJdzN9Wiaxg8GTzyTmqIoU
	 fRIkiDx7963HmBvbc4Qy8VyeVz4ovn7ywyzXnsGLdL2sc/43TnN00Xjba0MOAXKnPR
	 fL6Tgp7IDOk6w==
Date: Wed, 4 Nov 2026 16:26:19 -0800
From: Oliver Upton <oupton@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	peter.maydell@linaro.org, lpieralisi@kernel.org,
	timothy.hayes@arm.com, fuad.tabba@linux.dev
Subject: Re: [PATCH v2 08/16] KVM: arm64: gic-v5: Add ITS translation cache
 maintenance
Message-ID: <auvNK3FK7TxwGu8g@kernel.org>
References: <20261102194454.4086911-1-sascha.bischoff@arm.com>
 <20261102194454.4086911-9-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102194454.4086911-9-sascha.bischoff@arm.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 07:44:46PM +0000, Sascha Bischoff wrote:
> Walking the guest DT and ITTs on every MSI or ITS event is unnecessary
> once a DeviceID/EventID pair has been resolved. Add an XArray indexed
> by the DeviceID/EventID pair to cache resolved translations as a
> disposable acceleration structure, avoiding repeated walks of guest
> memory.
> 
> Cache entries hold references to the resolved struct vgic_irq objects
> stored in the VM-wide LPI xarray. Lookups use RCU to access entries in
> interrupt context without taking a raw spinlock, and take an IRQ
> reference before returning an entry to the caller. Cache eviction drops
> the reference held by the cache and defers freeing the entry until RCU
> readers have finished. This keeps the cache tied to the normal LPI
> object lifetime instead of storing raw LPI numbers.
> 
> Invalidate cached translations when the table configuration or guest
> invalidation commands make them stale. Changes to DT_BASER or DT_CFGR
> drop the entire cache, while writes of unchanged values leave it intact.
> INV_EVENTR removes either one event or the events covered by an L1 ITT
> entry, and INV_DEVICER removes the translations covered by either an L2
> DT entry or an L1 DT entry.
> 
> The cache is not part of any userspace ABI and is never authoritative:
> entries can always be rebuilt from guest memory on the next lookup.
> 
> The vgic_irq objects for LPIs track valid translations rather than
> mirror interrupt state. Mirroring that state would require querying
> the GIC on every guest exit. Once direct injection is added, the
> objects also record whether an LPI is mapped into the host ITT.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/vgic/vgic-its-v5.c | 219 ++++++++++++++++++++++++++++--
>  include/kvm/arm_vgic.h            |   3 +
>  2 files changed, 208 insertions(+), 14 deletions(-)

Looking at the diffstat alone, I wonder why we can't share the
translation cache implementation between GICv3 and GICv5 as they
accomplish the exact same thing.

> +struct its_cache_translation_entry {
> +	struct rcu_head rcu;
> +	struct vgic_irq *irq;
> +};

Err... So the vgic_irq struct is already RCU-protected in GICv3 at
least. When the refcount drops to 0 no other observer can take a
reference on the object and the memory itself is freed after a grace
period.

So now we're using RCU on a struct that only contains a pointer to
another object subject to RCU protection?

> +static void its_cache_erase_range(struct vgic_v5_its *its,
> +				  unsigned long first, unsigned long last)
> +{
> +	struct its_cache_translation_entry *entry;
> +	unsigned long key;
> +
> +	xa_for_each_range(&its->translation_cache, key, entry, first, last)
> +		its_cache_erase_translation(its, key);
> +}
> +

Optimizing invalidations can be added on as a follow-up patch. The GICv3
ITS gets away with invalidating the entire cache any time it needs to
make a change.

> +static int its_cache_add_translation(struct kvm *kvm, struct vgic_v5_its *its,
> +				     u32 device_id, u16 event_id,
> +				     struct vgic_irq *irq)
> +{
> +	unsigned long key = its_cache_key(device_id, event_id);
> +	struct its_cache_translation_entry *entry;
> +	struct its_cache_translation_entry *old;
> +
> +	entry = kzalloc_obj(*entry, GFP_KERNEL_ACCOUNT);
> +	if (!entry)
> +		return -ENOMEM;
> +
> +	entry->irq = irq;
> +
> +	old = xa_store(&its->translation_cache, key, entry,
> +		       GFP_KERNEL_ACCOUNT);
> +	if (xa_is_err(old)) {
> +		kfree(entry);
> +		return xa_err(old);
> +	}
> +
> +	if (old)
> +		its_cache_drop_translation(kvm, old);
> +
> +	return 0;
> +}
> +
> +static void its_cache_clear_translations(struct vgic_v5_its *its)
> +{
> +	struct its_cache_translation_entry *entry;
> +	unsigned long key;
> +
> +	xa_for_each(&its->translation_cache, key, entry)
> +		its_cache_erase_translation(its, key);
> +}
> +
> +static int its_cache_look_up_translation(struct vgic_v5_its *its,
> +					 u32 device_id, u16 event_id,
> +					 struct vgic_irq **irq)
> +{
> +	unsigned long key = its_cache_key(device_id, event_id);
> +	struct its_cache_translation_entry *entry;
> +	int ret = -ENXIO;
> +
> +	rcu_read_lock();
> +	entry = xa_load(&its->translation_cache, key);
> +	if (entry && vgic_try_get_irq_ref(entry->irq)) {
> +		*irq = entry->irq;
> +		ret = 0;
> +	}
> +	rcu_read_unlock();
> +
> +	return ret;
> +}
> +
> +static int its_cache_l2sz_bits(u8 l2sz)
> +{
> +	if (l2sz > GICV5_ITS_DT_ITT_CFGR_L2SZ_64k)
> +		return -EINVAL;
> +
> +	/* L2SZ 0, 1, and 2 encode 4K, 16K, and 64K tables of 8-byte entries. */
> +	return 9 + 2 * l2sz;
> +}
> +
> +static void its_cache_handle_inv_devicer(struct vgic_v5_its *its)
> +{
> +	unsigned int bits = its->inv_devicer.event_id_bits;
> +	int l2_bits;
> +
> +	if (its->inv_devicer.l1 && its->dt_cfgr.structure) {
> +		l2_bits = its_cache_l2sz_bits(its->dt_cfgr.l2sz);
> +		if (l2_bits < 0)
> +			return;

+1 to Wei-Lin's comment about the CONSTRAINED UNPREDICTABLE behavior.
I don't think ignoring the invalidation is a valid option.

> +	if (its->inv_eventr.l1) {
> +		/* An L1 ITTE covers the EventIDs in its L2 ITT. */
> +		bits = its_cache_l2sz_bits(its->inv_eventr.itt_l2sz);
> +		if (bits < 0)
> +			return;

Same here.

Overall, we need a very good explanation for why there isn't any code
reuse. We've had plenty of bugs in this territory on GICv3 and adding
another cache implementation doesn't seem particularly desirable.

Thanks,
Oliver

