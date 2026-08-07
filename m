Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CD4C5AC9E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYWDmn2G+wXZLvGltOR22yM7CZvt9ISIXe4XUdQ1SlM=; b=zfIE38W4qU5F4FU2wawu8jyioK
	lusvhGTEMLX1xoaKgGNEAzdnh2jLWOUgkvRu+8S6xIdgBt5COUhNUAd8BGCdm/7lkbFPf+gmQ9n8s
	qXj6/6KxNFD6XQpmELbo5d6Zor5gzGQQIB14LR45lTaxYMCwAYD2k0vnR1uiuIXyVuim89Tca/+QX
	UU/pxOvWO3Pai5MTaWTbWreqzLBrfGPUP67qK9Cef6t4WmE1MNHj1kvnr4Eyx7chBQlW35pteu8hh
	N0IQ+l6TtjxJ2Zzpl+JJnQWoMN+9Ehz99iGsfQ7xuTVW/d4Jx6qPZmBGIsdlUkNZ8myRwxgKfReoE
	su4aDInA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsII2-00000007mPb-2pLg;
	Fri, 07 Aug 2026 10:59:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsII0-00000007mOv-1SHi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:59:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F9161516;
	Fri,  7 Aug 2026 03:58:55 -0700 (PDT)
Received: from [10.57.40.157] (unknown [10.57.40.157])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 696D93F9A2;
	Fri,  7 Aug 2026 03:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786100339; bh=uuFrFlTnxR2oRESNj+PEN7bA9/kaSqszCUAy8op7WaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fw4XtpBkfkE+rClcmwHAo5bM2jngfqXmIKz5nRrbXwqkxFWonBtCZyjh5ySsiYO5P
	 3K+Db6dyLygBF4SXRrevtbXTze2H9PA/sTzd7JGyW1vMiQgjj6DC9JamLCDvyoXPYO
	 50379CxKlYns2w2zd6EOAKlggDYuL8Y78ejrmMl4=
Message-ID: <7ff49972-a9bf-4d99-9088-3d5e1eaa1608@arm.com>
Date: Fri, 7 Aug 2026 11:58:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 27/45] KVM: arm64: CCA: Allow populating initial
 contents
Content-Language: en-GB
To: Ackerley Tng <ackerleytng@google.com>, Steven Price
 <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, rick.p.edgecombe@intel.com,
 yan.y.zhao@intel.com
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-28-steven.price@arm.com>
 <CAEvNRgHF-30EwJEprM466+Ag7GSuJWrzMGNAw7kCvXyT7YVucg@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CAEvNRgHF-30EwJEprM466+Ag7GSuJWrzMGNAw7kCvXyT7YVucg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_035900_470179_827231B0 
X-CRM114-Status: GOOD (  37.08  )
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

On 06/08/2026 23:43, Ackerley Tng wrote:
> Steven Price <steven.price@arm.com> writes:
> 
>> The VMM needs to populate the realm with some data before starting (e.g.
>> a kernel and initrd). This is measured by the RMM and used as part of
>> the attestation later on.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>

...

>> +static int realm_data_map_init(struct kvm *kvm, unsigned long ipa,
>> +			       kvm_pfn_t dst_pfn, kvm_pfn_t src_pfn,
>> +			       unsigned long flags)
>> +{
>> +	struct realm *realm = &kvm->arch.realm;
>> +	phys_addr_t rd = virt_to_phys(realm->rd);
>> +	phys_addr_t dst_phys, src_phys;
>> +	long ret;
>> +
>> +	lockdep_assert_held(&kvm->slots_lock);
>> +	lockdep_assert_held(&kvm->arch.config_lock);
>> +
>> +	dst_phys = __pfn_to_phys(dst_pfn);
>> +	src_phys = __pfn_to_phys(src_pfn);
>> +
>> +	if (rmi_delegate_page(dst_phys))
>> +		return -ENXIO;
>> +
>> +retry:
>> +	ret = rmi_rtt_data_map_init(rd, dst_phys, ipa, src_phys, flags);
>> +	if (ret >= 0 && RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
>> +		/* Create missing RTTs and retry */
>> +		int level = RMI_RETURN_INDEX(ret);
>> +
>> +		KVM_BUG_ON(level >= KVM_PGTABLE_LAST_LEVEL, kvm);
>> +
>> +		ret = realm_create_rtt_levels(realm, ipa, level,
>> +					      level + 1, NULL);
>> +		if (!ret)
>> +			goto retry;
>> +	}
>> +
>> +	if (ret && WARN_ON(rmi_undelegate_page(dst_phys))) {
>> +		/* Leak the page if the undelegate fails */
>> +		get_page(pfn_to_page(dst_pfn));
> 
> Is there some way to avoid taking a reference on the page? This would
> interfere with conversions. There was a similar discussion for TDX as
> well [1].

Unfortunately, no. The page was transferred to the Realm world (with
rmi_delegate_page() above the retry: ). If we fail to bring it back,
that page is still in the Realm PAS and any access to it by the normal
world would result in a GPF and eventually bring down the system
if it happens from the kernel.

We don't expect that undelegate to fail. The granule_delegate()
should fail if the page was already in use by the RMM for some
purpose (e.g., already mapped at the IPA, because VMM issued
DATA_MAP_INIT twice. Even with the relaxation coming in the
RMM, we will mandate that the "populate" cases will request
strict conditions for granule delegate).

Please note that this is NOT the "unmap" failure, but it is
"Bring the page back to the NS world" failure that causes
the WARN_ON and the leaking.

> 
> TDX originally incremented folio refounts for these:
> 
> + when mapping folios into the Secure EPTs. This one was easier to agree
>    to remove, since TDX can trust guest_memfd to keep pages around on
>    behalf of the guest.
> + To indicate unmapping failure (IIUC this is the same situation as
>    above). This interferes with conversions.
>      + An alternative discussed was to mark these pages as HWPOISON, but
>        that was eventually rejected as adding unnecessary complexity to
>        make TDX special for code paths that only occur on kernel
>        bugs. (In TDX's case the unmap failures would probably only be for
>        kernel bugs.)
>      + I later worked a bit more on memory failure for guest_memfd
>        HugeTLB and found that because we will need to restructure huge
>        pages for conversions, using the HWPOISON flag would be hard to
>        handle. For TDX since the conclusion was not to use a HWPOISON
>        flag to indicate unmap failures anyway, this turned out to be a
>        non-issue. Nobody wanted to use the HWPOISON flag. (I hope you
>        won't need to either)
> 
> So for TDX, on an unmap failure we do a KVM_BUG_ON() and mark the VM as
> dead, and do nothing about the page, it still gets returned to the
> system as if nothing happened.
> 
> Here's my understanding of why this is okay for TDX (Rick and Yan, could
> you please help me here):
> 
> + For unmap failures, the page remains in TDX's Physical Address
>    Metadata Table (PAMT), and the page is still assigned to some TD.
> + If the page was assigned to some other TD, it would be blocked, since
>    the PAMT shows it as already assigned.
> + If the page was used by something completely unrelated to TDX, then in
>    the TDX model the host is free to write and read pages. Nothing goes
>    bad until the TD tries to use that same page, but that TD would never
>    use the page again, that TD is already dead and the HKID for the TD
>    was leaked.

This is not true for CCA. Like I said above, touching the page in Realm
PAS is going to be disastrous for the Host.


> 
> [1] https://lore.kernel.org/all/diqz34bolnta.fsf@ackerleytng-ctop.c.googlers.com/
> 
>> +	}
>> +
>> +	return ret <= 0 ? ret : -ENXIO;
>> +}
>> +
>> +static int populate_region_cb(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>> +			      struct page *src_page, void *opaque)
>> +{
>> +	unsigned long data_flags = *(unsigned long *)opaque;
>> +	phys_addr_t ipa = gfn_to_gpa(gfn);
>> +
>> +	return realm_data_map_init(kvm, ipa, pfn, page_to_pfn(src_page),
>> +				   data_flags);
>> +}
>> +
>> +static long populate_region(struct kvm *kvm,
>> +			    gfn_t base_gfn,
>> +			    unsigned long pages,
>> +			    u64 uaddr,
>> +			    unsigned long data_flags)
>> +{
>> +	long ret = 0;
>> +
>> +	lockdep_assert_held(&kvm->slots_lock);
>> +	lockdep_assert_held(&kvm->arch.config_lock);
>> +
>> +	if (!uaddr)
>> +		return -EINVAL;
>> +
> 
> Why not check for !uaddr together with the other checks in
> kvm_arm_rmi_populate?

Yep, we could move it there.

> 
> Also would it be okay to inline populate_region into
> kvm_arm_rmi_populate below?

Ack.

Suzuki

