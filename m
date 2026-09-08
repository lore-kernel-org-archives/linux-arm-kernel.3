Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9A5C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 01:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+nGBRO2sjU7QywpXuR7j0pn9TtrUztUEGuQR5IxcPg=; b=DqJWHQ8uZ8WZnFJzfSyBNI5wJ9
	NinabX3LW0NTXKpenOkKEQBJr05xfoKuEsvjo4N9hoLFk0iiN/oRC5ICCDF6XN31FfxPKsHNR2tL7
	do6idDhKL09XLsbZTAw52/WL/IePQ7Y7LXCD1a2j0KMEtytOSYLsUld14hmutaJjjlyrIzvGgdhMU
	UkvdPHoAlqh0NsjsfLmGWPPH948Jnhy8WUocBu+BeDncN6M7alZgvQOd3TcfSsuNvLO7lDmO1ml8E
	CDHBoa9Ff7otwSggXcdu+7VEAE0kMDloswZelUZBsr80F9Mbl0lxPavdlhTmMaA3d8yn8fFeiT6QB
	IvghM/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ksy-00000007tzD-0P5i;
	Tue, 08 Sep 2026 01:44:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ksw-00000007tz5-19lQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 01:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u+nGBRO2sjU7QywpXuR7j0pn9TtrUztUEGuQR5IxcPg=; b=hwwhGfs8kRQmI894f5NSwy/5U+
	lrO9kZEdyTH45oOqig5jY2Tevh27nJnP6iRhWBT5SXkHzmtU1zBqaHX09jiK2kwEMt3DLJQ8YLg6p
	zC0BtqRHopDL1m8huKfS17fL2OfuDvmdZp3IpNE6Vkj1mo0mu2aa/9GMteAKfuN6jM2FrUMw1O6Ke
	00DNIGqh2obL9DjcYSo0zlYxZxDuASnxx7xlykiMSis1XbfN4zgASdvgYPuSVt1s2uc+p386B1t4o
	iZj9stxvwllVPzalkXGAFOx4NEjGznk2FV3YhE+qDJy/Ug2QLXJHdnGdW67OTaU3BAP2B+FRCcqpW
	SUWq7pGg==;
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3ksr-0000000GngC-35rg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 01:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788831866; x=1820367866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LvzJtPnZANUsV5VdV340HGark2+yZ1Mwn3pRAiG/vvU=;
  b=J5I8AH7BX9DZhSp2evDOUGxpIjFx8kCsTcJ+1rZDR4dXjjFfWWbH7bAH
   p6+GUBnhbm3pisP9z3z48URhctIWNfAPVsZrzY3MUX9RX4MwxHnTQ5F3M
   h2WgUdyuPtKkIl4KSIOoH0oyAb8loWm8pAit+nlCH0oeAbHVziFHZ1i14
   5Ji2hRmAF33GOLq0xg1Y+J8OD5z0Kaks3FWfEWjFCSdSp7YqsoHAq0LBZ
   z2l5r38VH4UfcM9BaIcUHvbJer1/S+G1FdkpYWezT7ykQQqk1KprwqOmG
   yswvYAEx44ciM87SxUS3CysDxm+7GNb/fghupEi60Arx9HjY0kJB420cn
   g==;
X-CSE-ConnectionGUID: D0xRsUeATi28nVaqnxlkug==
X-CSE-MsgGUID: CSFw9cQxRXmYD3skDiIQ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="254270986"
X-IronPort-AV: E=Sophos;i="6.25,268,1779116400"; 
   d="scan'208";a="254270986"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 10:44:20 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id EAC421C1C704
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 01:44:19 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9D669C0021B
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 01:44:19 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 0B0EE18002CD;
	Tue,  8 Sep 2026 01:44:13 +0000 (UTC)
Date: Tue, 8 Sep 2026 10:44:10 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takayuki Okamoto <tokamoto@fujitsu.com>
Subject: Re: [PATCH 1/2] KVM: selftest: arm64: Support 5-level paging in
 stage 1 translation table
Message-ID: <ap9oag87vZiuTVer@sm-arm-grace07>
References: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
 <20260826-arm64-52bit-va-v1-1-14ec98211363@fujitsu.com>
 <CA+EHjTy6EH-d=O+dtRdWdTUkS0zkXeW=auxiK6N5Dc-yihrYRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTy6EH-d=O+dtRdWdTUkS0zkXeW=auxiK6N5Dc-yihrYRw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_024426_723835_EF72FD9D 
X-CRM114-Status: GOOD (  35.72  )
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

Hi Fuad,
On Fri, Sep 04, 2026 at 09:38:39AM +0100, Fuad Tabba wrote:
> Hi Itaru,
> 
> The usual subject prefix in the tree is "KVM: arm64: selftests:", for
> this patch and the next one.

Sure. Fix in v2.
> On Tue, 25 Aug 2026 at 22:18, Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
> >
> > Add p4d_index() for when 5-level paging required, i.e., V52 guest mode
> > IDs. With the index helper function, _virt_pg_map() handles 5-level
> 
> Only VM_MODE_P52V52_4K has five levels. The 16K and 64K V52 modes get
> four and three, so this is for the 4K granule rather than for V52
> modes as a class.

Yes, understood. Will update the commit log.

> 
> ...
> 
> >  u64 *virt_get_pte_hva_at_level(struct kvm_vm *vm, gva_t gva, int level)
> >  {
> > +       int start_level = 4 - vm->mmu.pgtable_levels;
> >         u64 *ptep;
> >
> > +       TEST_ASSERT(level >= start_level && level <= 3,
> > +                   "Invalid translation level %d, valid range is %d-3",
> > +                   level, start_level);
> > +
> >         if (!vm->mmu.pgd_created)
> >                 goto unmapped_gva;
> >
> >         ptep = addr_gpa2hva(vm, vm->mmu.pgd) + pgd_index(vm, gva) * 8;
> >         if (!ptep)
> >                 goto unmapped_gva;
> > -       if (level == 0)
> > +       /*
> > +        * Stage-1 translation starts at level -1 for a five-level page
> > +        * table, and at levels 0, 1, or 2 for four-, three-, or two-level
> > +        * page tables, respectively.
> > +        */
> > +       if (level == start_level)
> 
> 
> This changes what level means for the existing three-level modes:
> level 0 used to return the top-level entry and now trips the assert,
> level 1 used to return the leaf and now returns the top level. No
> caller in tree asks for either of those two levels, and the new
> numbering matches the architecture.

Yes, as you checked this change won't break current tests, so if you
have better comments I will replace it with yours.

> 
> ...
> 
> > @@ -321,12 +356,14 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
> >         case VM_MODE_PXXVYY_4K:
> >                 TEST_FAIL("AArch64 does not support 4K sized pages "
> >                           "with ANY-bit physical address ranges");
> > +       case VM_MODE_P52V52_64K:
> 
> These VM_MODE_ enumerators arrive in patch 2, so this patch does not
> build on its own:
> 
>   lib/arm64/processor.c:359:7: error: use of undeclared identifier
> 'VM_MODE_P52V52_64K'; did you mean 'VM_MODE_P52V48_64K'?
>   lib/arm64/processor.c:360:7: error: duplicate case value 'VM_MODE_P52V48_64K'
> 
> There are other build errors from the same cause. Could you move the
> enum values and their vm_guest_mode_string()/vm_guest_mode_params[]
> entries into this patch, or a new one altogether?

Yes, I have rearranged the series to avoid this.

> 
> >         case VM_MODE_P52V48_64K:
> >         case VM_MODE_P48V48_64K:
> >         case VM_MODE_P40V48_64K:
> >         case VM_MODE_P36V48_64K:
> >                 tcr_el1 |= TCR_TG0_64K;
> >                 break;
> > +       case VM_MODE_P52V52_16K:
> >         case VM_MODE_P52V48_16K:
> >         case VM_MODE_P48V48_16K:
> >         case VM_MODE_P40V48_16K:
> > @@ -334,6 +371,7 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
> >         case VM_MODE_P36V47_16K:
> >                 tcr_el1 |= TCR_TG0_16K;
> >                 break;
> > +       case VM_MODE_P52V52_4K:
> >         case VM_MODE_P52V48_4K:
> >         case VM_MODE_P48V48_4K:
> >         case VM_MODE_P40V48_4K:
> > @@ -348,6 +386,9 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
> >
> >         /* Configure output size */
> >         switch (vm->mode) {
> > +       case VM_MODE_P52V52_4K:
> > +       case VM_MODE_P52V52_16K:
> > +       case VM_MODE_P52V52_64K:
> >         case VM_MODE_P52V48_4K:
> >         case VM_MODE_P52V48_16K:
> >         case VM_MODE_P52V48_64K:
> > @@ -578,6 +619,42 @@ static u32 max_ipa_for_page_size(u32 vm_ipa, u32 gran,
> >                 return min(vm_ipa, 48U);
> >  }
> >
> > +u32 aarch64_get_supported_va_size(void)
> 
> This repeats aarch64_get_supported_page_sizes() below it and builds a
> second probe VM one line after the first. Could it take a u32 *va
> out-param, so both ID registers come off the one vCPU?
> 
> VARange is the 52-bit VA indicator for the 64K granule only, so a bare
> 52 or 48 reads as granule-independent. The caller in patch 2 only uses
> it for 64K, so nothing is wrong today.

Yes, I've dropped the _va_size() function and instead, expanded a bit
as you suggested the aarch64_get_supported_page_sizes() to check if vcpu
can address upto 52-bit VA space or not (48-bit max). 

Thanks,
Itaru.
> 
> Cheers,
> /fuad
> 
> 
> > +{
> > +       struct kvm_vcpu_init preferred_init = {};
> > +       int kvm_fd, vm_fd, vcpu_fd, err;
> > +       u64 val;
> > +       u32 va_range;
> > +       struct kvm_one_reg reg = {
> > +               .id     = KVM_ARM64_SYS_REG(SYS_ID_AA64MMFR2_EL1),
> > +               .addr   = (u64)&val,
> > +       };
> > +
> > +       kvm_fd = open_kvm_dev_path_or_exit();
> > +       vm_fd = __kvm_ioctl(kvm_fd, KVM_CREATE_VM, NULL);
> > +       TEST_ASSERT(vm_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VM, vm_fd));
> > +
> > +       vcpu_fd = ioctl(vm_fd, KVM_CREATE_VCPU, 0);
> > +       TEST_ASSERT(vcpu_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VCPU, vcpu_fd));
> > +
> > +       err = ioctl(vm_fd, KVM_ARM_PREFERRED_TARGET, &preferred_init);
> > +       TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_ARM_PREFERRED_TARGET, err));
> > +
> > +       err = ioctl(vcpu_fd, KVM_ARM_VCPU_INIT, &preferred_init);
> > +       TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_ARM_VCPU_INIT, err));
> > +
> > +       err = ioctl(vcpu_fd, KVM_GET_ONE_REG, &reg);
> > +       TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_GET_ONE_REG, err));
> > +
> > +       va_range = FIELD_GET(ID_AA64MMFR2_EL1_VARange, val);
> > +
> > +       close(vcpu_fd);
> > +       close(vm_fd);
> > +       close(kvm_fd);
> > +
> > +       return va_range >= ID_AA64MMFR2_EL1_VARange_52 ? 52 : 48;
> > +}
> > +
> >  void aarch64_get_supported_page_sizes(u32 ipa, u32 *ipa4k,
> >                                       u32 *ipa16k, u32 *ipa64k)
> >  {
> >
> > --
> > 2.43.0
> >

