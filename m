Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB214C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 22:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3iDpdzRxEXGTzSx99ebjxlSOptD6jmNZBgMvWAVu1o=; b=l7yw6lbyeSkj30TPcjCtbvPeKi
	NGA/ReVD52qRNZbxoxMeHggS2mD9HKM2i08RrPETtxoQSfDHZxmPxyb9LDAK5CtW+8ncXa2Q9eawy
	N3LJVZPFQt9N3mtgAJ8mHCev4BUmKrT+sbVw0eMMxbZvXUjBmqNJtNDTLA7czjqapWfvVe2Nqi9dp
	+7XH/O81vdJCpQ+bkjEALJJzux4Bl4koXnKrMtJExM4ekX4onJene8UnBsjsKUfxNmPzmX0Dw00Uz
	MaWKreKMwuvhPpEE+nmZNxDpNb900nWB4c2N3gkBPMjRqooEkgPGBLupwTCudJVmVGbXpDr3plh+k
	0VFARO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6nx-00000006ooe-0VTt;
	Thu, 06 Aug 2026 22:43:13 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6nu-00000006ooH-0lfK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 22:43:11 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so2976110a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 15:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786056188; cv=none;
        d=google.com; s=arc-20260327;
        b=PMx8GQPs+L3DwjE60mp/1pdkBMpkdYO5XfBwQ6GITtARvm569tNNdoFZeb0bbq54PT
         Bz/6LCFPmvuQLl2/RU+jxfH3pMRDFof9oFQZe+Syb96ekZgFCX2rd9hwb3VjXfNJVM1Y
         JhzVsg1g1RJIUOMBhuDkVEKQ4pmsEM1aewuj0Tcbid4X7cdDuFVQUECKOIYYJ5t6hONk
         Sfr2MV5WLQUbGGaRUGRTFbUgShfEhfa/iXv3yiHxfrHrpA9DwNS9r89qtJT9kXedWkah
         jnpvTAqkXgTFZadPyvCpihpQ11Fgeu+4DmY9vL9eBbqDNILNa4SBhK5QlAyvtJ7Nnty0
         5ESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=t3iDpdzRxEXGTzSx99ebjxlSOptD6jmNZBgMvWAVu1o=;
        fh=MEhvFNze8yekWPIZ5H2iWJYEJLA/y9ob3FgoFaPXLoQ=;
        b=EM8PHwEHiRb4bNiFom2s92+odD25s0NHX8d4zagtGYsX/T3L6gJ++7E5QUZI3RyZ1M
         PmDFtA0FnFZBPZc+1tYMuE3p9bdqlgU6ZfKdbxYpoeY24P4uXGnsnRYjekPZu35AsJCi
         s2HOJH4qfG1bxDscYy0du8dv6kJq+BWsVr9G+0TmuJRStve66xRzRm7WWSiCwN2CjH3H
         5TWg3SLYndy9FJqeUul+bbYZm7yqltanLNEzd8su3v8UdX25GenmDb8YDLGuSGt+SRGm
         ZGRx+lBHWV3L1M2rTJYpkefRCpNgthlUvvHkJ9LdZO4uHtW7sVg7A+wgHQqnLCy/0wux
         AYlA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786056188; x=1786660988; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3iDpdzRxEXGTzSx99ebjxlSOptD6jmNZBgMvWAVu1o=;
        b=u8GJIlKyB8XV59IOkbHAWmfzMjHKqSvyqMv/kG4MQN73lJ0ldbSI6hGkGo6wOQlbtc
         JQRFNp2fn/3hp61b3uL+g9E6CZS4sZhJq7TCWYRFxFQ6Y4wcJHTUr/FAhk1S3RCWWNms
         WoKWpXqaNhWHkLvPMOyrKsY2wyGDFid7mn7vUgAcV4IMduxal0aEF8oKgAaQIIdNeRUE
         r3jbYdvAVR2I6WhWf8iIKCmnFPSsUuEepyNbHOMkc0EgNRSjrgaUUTzx6WJIAG8XcHXS
         t9UcRBBBO3IC09NbAD0QAjAt4zGquI/La1NyLnSqqNGKRdEMXYu3M6tSug+oHL5wsnoN
         TIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786056188; x=1786660988;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3iDpdzRxEXGTzSx99ebjxlSOptD6jmNZBgMvWAVu1o=;
        b=Lfb7K2JE0lz9Z+iw/Z0b4eLfp6qhLk2/Kb6SQiNb+KfQkNV34CZLQY60KyTtBmlUhe
         cLGLSbr+FC1TS3tZyI0c0BUfIX/F+jlJXawOnwHvgQRaWwQFLU2RYPoq29p+q53LOXRv
         QlBVMK+bjhyaULR7qK0eUUMmWpSS9EEOfhh7oEyi2oRPMSpLQzeUh6GHkd7sdq0jTXfP
         hRZr9b7NT9V5GmGubrXUrp4WNxJkOrmXA31bBtFDtlAA8oswB5j8k3/k2ejAd948oXf2
         WZTCcTuPey6FzdNRUSBcG47Efp01LZlNPsi6Z6zIXbaeP3u9LUXoxtfnGrr9QKg4s2od
         55Bg==
X-Forwarded-Encrypted: i=1; AHgh+RrqeVaGzAAKahXP8MT86JUuELZqgg5UVK6XNTrEaI2+uWWGhYB7sPlW+vFW5Baw4lDBA5zS/SO8L65QGseUYk63@lists.infradead.org
X-Gm-Message-State: AOJu0YyfcmgpALtGS3Rk2PnZLEp2LYngKc+9aY0bSvIo1KLSX8HgFF1h
	1wHkjeAPPl1x3p2UzpcqfoRFdXZjLZokDJfTat3kjs/DR43E7ad5YDZnRHbt/Nq53s8IcdS3O58
	urZJ36ZfS6ru/tm8RNb8RturrDTkHOfsdIQ2xqjsZ
X-Gm-Gg: AR+sD11C4U2fyUI9McFiWSNhy1OaHoqj7ojLBItQzs7V7EJMTYz1riSnup0FOkfu2JE
	2fb9rMIv2syr9Vp/OldsmhMzUv1YcK+V5S41bMTgny8vD4Iw1BSxrogZ8XJ6gGh6MCmaSZf86Gc
	gV7lPnWoNQPH99zTCkpA7VfMBzL41P5aqC8cy2JnLIkHRKH0LmQ0izkzyh3jlqUa2HpX7ZV7nUH
	/0op+taWLxzvoQ2qTGtCPY9lDoZKLPBR0gFYqZYG0zLpONTeTPJXlo3AauIrITVgVZ4J4i2zLHA
	AbFqCtGwoHuFBFtvAptPnivKOycF8IL00Y4wVM1kWmiW2DGqBwDABdHfz1KvbaGqdvoQq7LSfTX
	AhZQuVG2IvaZfUgyxc+nroYfW7sL0SdazDsg=
X-Received: by 2002:a05:6a20:7487:b0:3c4:1c9f:d7e with SMTP id
 adf61e73a8af0-3cb85e2b724mr19964239637.6.1786056187332; Thu, 06 Aug 2026
 15:43:07 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Aug 2026 15:43:06 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Aug 2026 15:43:06 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260803134403.80630-28-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com> <20260803134403.80630-28-steven.price@arm.com>
MIME-Version: 1.0
Date: Thu, 6 Aug 2026 15:43:06 -0700
X-Gm-Features: AUfX_mz4KvATUHiDYAFclNLmldRIwEYFFUZFU-z1uCffxQhTAlRAoSRwyvnJ1NM
Message-ID: <CAEvNRgHF-30EwJEprM466+Ag7GSuJWrzMGNAw7kCvXyT7YVucg@mail.gmail.com>
Subject: Re: [PATCH v16 27/45] KVM: arm64: CCA: Allow populating initial contents
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, rick.p.edgecombe@intel.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_154310_241236_E68B61BB 
X-CRM114-Status: GOOD (  40.06  )
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

Steven Price <steven.price@arm.com> writes:

> The VMM needs to populate the realm with some data before starting (e.g.
> a kernel and initrd). This is measured by the RMM and used as part of
> the attestation later on.
>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v15:
>  * Handle negative error codes
> Changes since v14:
>  * Holding of locks slots_lock and config_lock have been moved up the
>    callstack with lockdesp assertions placed in the lower functions.
>  * Add overflow check into kvm_arm_rmi_populate().
> Changes since v13:
>  * Rename realm_create_protected_data_page() to realm_data_map_init().
> Changes since v12:
>  * The ioctl now updates the structure with the amount populated rather
>    than returning this through the ioctl return code.
>  * Use the new RMM v2.0 range based RMI calls.
>  * Adapt to upstream changes in kvm_gmem_populate().
> Changes since v11:
>  * The multiplex CAP is gone and there's a new ioctl which makes use of
>    the generic kvm_gmem_populate() functionality.
> Changes since v7:
>  * Improve the error codes.
>  * Other minor changes from review.
> Changes since v6:
>  * Handle host potentially having a larger page size than the RMM
>    granule.
>  * Drop historic "par" (protected address range) from
>    populate_par_region() - it doesn't exist within the current
>    architecture.
>  * Add a cond_resched() call in kvm_populate_realm().
> Changes since v5:
>  * Refactor to use PFNs rather than tracking struct page in
>    realm_create_protected_data_page().
>  * Pull changes from a later patch (in the v5 series) for accessing
>    pages from a guest memfd.
>  * Do the populate in chunks to avoid holding locks for too long and
>    triggering RCU stall warnings.
> ---
>  arch/arm64/include/asm/kvm_rmi.h |   4 ++
>  arch/arm64/kvm/Kconfig           |   1 +
>  arch/arm64/kvm/arm.c             |  13 ++++
>  arch/arm64/kvm/rmi.c             | 119 +++++++++++++++++++++++++++++++
>  4 files changed, 137 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> index 90563183a717..03f8bd2d13a2 100644
> --- a/arch/arm64/include/asm/kvm_rmi.h
> +++ b/arch/arm64/include/asm/kvm_rmi.h
> @@ -108,6 +108,10 @@ int kvm_rec_exit(struct kvm_vcpu *vcpu, int rec_run_status);
>  int kvm_rec_handle_request(struct kvm_vcpu *vcpu);
>  bool kvm_rec_handle_hvc(struct kvm_vcpu *vcpu, int *ret);
>
> +struct kvm_arm_rmi_populate;
> +
> +int kvm_arm_rmi_populate(struct kvm *kvm,
> +			 struct kvm_arm_rmi_populate *arg);
>  void kvm_realm_unmap_range(struct kvm *kvm,
>  			   unsigned long ipa,
>  			   unsigned long size,
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index 189e8ad78b22..83b95e836b4d 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -37,6 +37,7 @@ menuconfig KVM
>  	select SCHED_INFO
>  	select GUEST_PERF_EVENTS if PERF_EVENTS
>  	select KVM_GUEST_MEMFD
> +	select HAVE_KVM_ARCH_GMEM_POPULATE
>  	select ARM_RMM
>  	help
>  	  Support hosting virtualized guest machines.
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index b7c308817d45..f1b26b263bf0 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2154,6 +2154,19 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  			return -EFAULT;
>  		return kvm_vm_ioctl_get_reg_writable_masks(kvm, &range);
>  	}
> +	case KVM_ARM_RMI_POPULATE: {
> +		struct kvm_arm_rmi_populate req;
> +		int ret;
> +
> +		if (!kvm_is_realm(kvm))
> +			return -ENXIO;
> +		if (copy_from_user(&req, argp, sizeof(req)))
> +			return -EFAULT;
> +		ret = kvm_arm_rmi_populate(kvm, &req);
> +		if (copy_to_user(argp, &req, sizeof(req)))
> +			return -EFAULT;
> +		return ret;
> +	}
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index c8ec766d3dc0..d18c241f7eb2 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -609,6 +609,76 @@ void kvm_realm_unmap_range(struct kvm *kvm, unsigned long start,
>  		realm_unmap_private_range(kvm, start, end, may_block);
>  }
>
> +static int realm_data_map_init(struct kvm *kvm, unsigned long ipa,
> +			       kvm_pfn_t dst_pfn, kvm_pfn_t src_pfn,
> +			       unsigned long flags)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +	phys_addr_t rd = virt_to_phys(realm->rd);
> +	phys_addr_t dst_phys, src_phys;
> +	long ret;
> +
> +	lockdep_assert_held(&kvm->slots_lock);
> +	lockdep_assert_held(&kvm->arch.config_lock);
> +
> +	dst_phys = __pfn_to_phys(dst_pfn);
> +	src_phys = __pfn_to_phys(src_pfn);
> +
> +	if (rmi_delegate_page(dst_phys))
> +		return -ENXIO;
> +
> +retry:
> +	ret = rmi_rtt_data_map_init(rd, dst_phys, ipa, src_phys, flags);
> +	if (ret >= 0 && RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
> +		/* Create missing RTTs and retry */
> +		int level = RMI_RETURN_INDEX(ret);
> +
> +		KVM_BUG_ON(level >= KVM_PGTABLE_LAST_LEVEL, kvm);
> +
> +		ret = realm_create_rtt_levels(realm, ipa, level,
> +					      level + 1, NULL);
> +		if (!ret)
> +			goto retry;
> +	}
> +
> +	if (ret && WARN_ON(rmi_undelegate_page(dst_phys))) {
> +		/* Leak the page if the undelegate fails */
> +		get_page(pfn_to_page(dst_pfn));

Is there some way to avoid taking a reference on the page? This would
interfere with conversions. There was a similar discussion for TDX as
well [1].

TDX originally incremented folio refounts for these:

+ when mapping folios into the Secure EPTs. This one was easier to agree
  to remove, since TDX can trust guest_memfd to keep pages around on
  behalf of the guest.
+ To indicate unmapping failure (IIUC this is the same situation as
  above). This interferes with conversions.
    + An alternative discussed was to mark these pages as HWPOISON, but
      that was eventually rejected as adding unnecessary complexity to
      make TDX special for code paths that only occur on kernel
      bugs. (In TDX's case the unmap failures would probably only be for
      kernel bugs.)
    + I later worked a bit more on memory failure for guest_memfd
      HugeTLB and found that because we will need to restructure huge
      pages for conversions, using the HWPOISON flag would be hard to
      handle. For TDX since the conclusion was not to use a HWPOISON
      flag to indicate unmap failures anyway, this turned out to be a
      non-issue. Nobody wanted to use the HWPOISON flag. (I hope you
      won't need to either)

So for TDX, on an unmap failure we do a KVM_BUG_ON() and mark the VM as
dead, and do nothing about the page, it still gets returned to the
system as if nothing happened.

Here's my understanding of why this is okay for TDX (Rick and Yan, could
you please help me here):

+ For unmap failures, the page remains in TDX's Physical Address
  Metadata Table (PAMT), and the page is still assigned to some TD.
+ If the page was assigned to some other TD, it would be blocked, since
  the PAMT shows it as already assigned.
+ If the page was used by something completely unrelated to TDX, then in
  the TDX model the host is free to write and read pages. Nothing goes
  bad until the TD tries to use that same page, but that TD would never
  use the page again, that TD is already dead and the HKID for the TD
  was leaked.

[1] https://lore.kernel.org/all/diqz34bolnta.fsf@ackerleytng-ctop.c.googlers.com/

> +	}
> +
> +	return ret <= 0 ? ret : -ENXIO;
> +}
> +
> +static int populate_region_cb(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
> +			      struct page *src_page, void *opaque)
> +{
> +	unsigned long data_flags = *(unsigned long *)opaque;
> +	phys_addr_t ipa = gfn_to_gpa(gfn);
> +
> +	return realm_data_map_init(kvm, ipa, pfn, page_to_pfn(src_page),
> +				   data_flags);
> +}
> +
> +static long populate_region(struct kvm *kvm,
> +			    gfn_t base_gfn,
> +			    unsigned long pages,
> +			    u64 uaddr,
> +			    unsigned long data_flags)
> +{
> +	long ret = 0;
> +
> +	lockdep_assert_held(&kvm->slots_lock);
> +	lockdep_assert_held(&kvm->arch.config_lock);
> +
> +	if (!uaddr)
> +		return -EINVAL;
> +

Why not check for !uaddr together with the other checks in
kvm_arm_rmi_populate?

Also would it be okay to inline populate_region into
kvm_arm_rmi_populate below?

> +	ret = kvm_gmem_populate(kvm, base_gfn, u64_to_user_ptr(uaddr), pages,
> +				false, populate_region_cb, &data_flags);
> +
> +	return ret;
> +}
> +
>  enum ripas_action {
>  	RIPAS_INIT,
>  	RIPAS_SET,
> @@ -727,6 +797,55 @@ static int realm_ensure_created(struct kvm *kvm)
>  	return realm_create_rd(kvm);
>  }
>
> +int kvm_arm_rmi_populate(struct kvm *kvm,
> +			 struct kvm_arm_rmi_populate *args)
> +{
> +	unsigned long data_flags = 0;
> +	unsigned long ipa_start = args->base;
> +	unsigned long ipa_end = ipa_start + args->size;
> +	long pages_populated;
> +	int ret;
> +
> +	if (args->reserved ||
> +	    (args->flags & ~KVM_ARM_RMI_POPULATE_FLAGS_MEASURE) ||
> +	    args->base + args->size < args->base ||
> +	    !IS_ALIGNED(ipa_start, PAGE_SIZE) ||
> +	    !IS_ALIGNED(ipa_end, PAGE_SIZE) ||
> +	    !IS_ALIGNED(args->source_uaddr, PAGE_SIZE))
> +		return -EINVAL;
> +
> +	if (args->flags & KVM_ARM_RMI_POPULATE_FLAGS_MEASURE)
> +		data_flags |= RMI_MEASURE_CONTENT;
> +
> +	mutex_lock(&kvm->slots_lock);
> +	mutex_lock(&kvm->arch.config_lock);
> +
> +	ret = realm_ensure_created(kvm);
> +	if (ret)
> +		goto out_unlock;
> +
> +	if (args->size == 0)
> +		goto out_unlock;
> +
> +	pages_populated = populate_region(kvm, gpa_to_gfn(ipa_start),
> +					  args->size >> PAGE_SHIFT,
> +					  args->source_uaddr, data_flags);
> +
> +	if (pages_populated < 0) {
> +		ret = pages_populated;
> +		goto out_unlock;
> +	}
> +
> +	args->size -= pages_populated << PAGE_SHIFT;
> +	args->source_uaddr += pages_populated << PAGE_SHIFT;
> +	args->base += pages_populated << PAGE_SHIFT;
> +
> +out_unlock:
> +	mutex_unlock(&kvm->arch.config_lock);
> +	mutex_unlock(&kvm->slots_lock);
> +	return ret;
> +}
> +
>  static int kvm_complete_ripas_change(struct kvm_vcpu *vcpu)
>  {
>  	struct kvm *kvm = vcpu->kvm;
> --
> 2.43.0

