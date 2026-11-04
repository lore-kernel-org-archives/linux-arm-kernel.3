Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD29606D820
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 22:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vEyNzGzR;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ac29vcO0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DMdL19ia1MseF42JJfTaNBjB6MPN2f0VB+2HLKGRGcw=; b=vEyNzGzRiOH96RNldSCP3RLrZm
	I+eW1lfkjrPae80ASvGzQg68lcN7uo5U8xotu1snfudkr7yMSGJr+1kE7x4PR7ro+gwbdS9mjRJWu
	eYAZkynyQMW0w6NfUZcP6V/pAcHp/+4qWLl5J80IYwNLffd5U7ikjArd/5jinFKy3UhrzvhaUEeqh
	YxAxDBaNh7RELp4t5r6jj/lvmVmaGDFfo2PzYUDTv9QgXPXgDd1pfh7HHi00rKSBsW1s7gbNWaJ5w
	LAIbX/85GI1k0n3Wyqd24Lqx/hi++1X3VGox7EDrSamNv3o8uuHW3NvdFF+DHzDQi7jVXjlbjT2Iv
	+xAIPjvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjkQ-00000007B9b-0ydL;
	Wed, 04 Nov 2026 22:46:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjkN-00000007B8b-2f97
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 22:46:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6953C169C;
	Wed,  4 Nov 2026 14:46:19 -0800 (PST)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7D983F632;
	Wed,  4 Nov 2026 14:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793832382; bh=gA3RjhcnUbX3FeD3ZQ9T2a1Q2l8A9c0Kc7zUbAxh5FE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ac29vcO02ijqYFN1QbLQkbGJ71LNaDm+oDI6B3SR0IYbRhaVs8PzsnE4o8GnYyfE7
	 Rpm/vTICVO+eyFhZ0JE8nX1bzhcMf+LOt03/NZCT9XQgkrY2zaPpprrPsBSzTQYy1I
	 5eW4Rf1jwXnU6KoNJawv2swSuQKfiYKaqiMxTrxw=
Date: Wed, 4 Nov 2026 22:46:16 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, peter.maydell@linaro.org, 
	lpieralisi@kernel.org, timothy.hayes@arm.com, fuad.tabba@linux.dev
Subject: Re: [PATCH v2 08/16] KVM: arm64: gic-v5: Add ITS translation cache
 maintenance
Message-ID: <7sk6tikltw7bsrpes7p2hv2vufwua77xxfdbdmlpyas2pjyu5e@j42zu3b536t6>
References: <20261102194454.4086911-1-sascha.bischoff@arm.com>
 <20261102194454.4086911-9-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102194454.4086911-9-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_144623_765072_BC5C9F99 
X-CRM114-Status: GOOD (  33.07  )
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
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-its-v5.c b/arch/arm64/kvm/vgic/vgic-its-v5.c
> index caa68c4680d02..9f4783b243221 100644
> --- a/arch/arm64/kvm/vgic/vgic-its-v5.c
> +++ b/arch/arm64/kvm/vgic/vgic-its-v5.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/kvm_host.h>
> +#include <linux/rcupdate.h>
>  #include <linux/slab.h>
>  
>  #include <asm/kvm_arm.h>
> @@ -19,6 +20,153 @@
>  #define VITS_V5_DEVICE_ID_BITS		16
>  #define VITS_V5_EVENT_ID_BITS		16
>  
> +struct its_cache_translation_entry {
> +	struct rcu_head rcu;
> +	struct vgic_irq *irq;
> +};
> +
> +/* Put EventID in the low bits so each device's events form one range. */
> +static unsigned long its_cache_key(u32 device_id, u16 event_id)
> +{
> +	return ((unsigned long)device_id << VITS_V5_EVENT_ID_BITS) | event_id;
> +}
> +
> +static void its_cache_drop_translation(struct kvm *kvm,
> +				       struct its_cache_translation_entry *entry)
> +{
> +	struct vgic_irq *irq = entry->irq;
> +
> +	vgic_put_irq(kvm, irq);
> +	/* An interrupt-context lookup may still be using the erased entry. */
> +	kfree_rcu(entry, rcu);
> +}
> +

drop and erase sound very similar, would its_cache_release_entry() make
this clearer?

> +static void its_cache_erase_translation(struct vgic_v5_its *its,
> +					unsigned long key)
> +{
> +	struct its_cache_translation_entry *entry;
> +
> +	entry = xa_erase(&its->translation_cache, key);
> +	if (entry)
> +		its_cache_drop_translation(its->dev->kvm, entry);
> +}
> +
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
> +static void its_cache_erase_span(struct vgic_v5_its *its,
> +				unsigned long key, unsigned int bits)
> +{
> +	unsigned long mask = (1UL << bits) - 1;

nit:                         GENMASK(bits - 1, 0) ?

> +	unsigned long first = key & ~mask;
> +
> +	its_cache_erase_range(its, first, first | mask);
> +}
> +
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
> +		/* An L1 DTE covers the L2 DT's devices and all their EventIDs. */
> +		bits = l2_bits + VITS_V5_EVENT_ID_BITS;
> +	} else if (bits > VITS_V5_EVENT_ID_BITS) {
> +		bits = VITS_V5_EVENT_ID_BITS;
> +	}
> +
> +	its_cache_erase_span(its, its_cache_key(its->didr.device_id, 0), bits);
> +}
> +
> +static void its_cache_handle_inv_eventr(struct vgic_v5_its *its)
> +{
> +	int bits = 0;
> +
> +	if (its->inv_eventr.l1) {
> +		/* An L1 ITTE covers the EventIDs in its L2 ITT. */
> +		bits = its_cache_l2sz_bits(its->inv_eventr.itt_l2sz);
> +		if (bits < 0)
> +			return;
> +	}

For the ITT_L2SZ field in the spec there is:

When programming a reserved value or an unsupported value, the ITS
behavior is CONSTRAINED UNPREDICTABLE to any behavior which could be
achieved by programming a valid and supported value.

So I think we should still invalidate when a ITT_L2SZ is programmed to
a reserved value, maybe just arbitrarily pick a defined value when this
happens?

Thanks,
Wei-Lin Chang

> +
> +	its_cache_erase_span(its, its_cache_key(its->didr.device_id,
> +						  its->eidr.event_id), bits);
> +}
> +
>  static int parse_linear_dt(struct kvm *kvm, gpa_t dt_base, u32 device_id,
>  			   gpa_t *itt_base, bool *two_level_itt,
>  			   unsigned int *event_id_bits, unsigned int *itt_l2sz)

[...]

