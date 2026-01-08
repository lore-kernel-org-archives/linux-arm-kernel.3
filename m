Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98742D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yE3dT2zokWGh3zsY7BdC0m/KxfpgkvaUItOixLW4TkQ=; b=P6J7XSSy2+GJFutQ+UMWD9ejSn
	et1EobTeHDCrHbuERSA2YqkH7gmIsFDWSms6mr7mIB2pGdFL0lytyR3sIL15yBqoLjDkQnIs8rNp7
	vbkXGph8k4r/IVps/XYRgHDETtkIylsqUGJTwiHMzmnLV0854imxSI9UadvA2eh/4w/V7KPgaAJ0c
	fwMkgWYF1cJKU5fup8dC7J9D0/f4rm1hNd831wIXuNe4YE9wI2zkQkCp8i6aSQGUCxz8Q1JBgzO/Q
	/jZ4yh6Fa5uTdupqEJWIXEnK8ZTqNiOnbsFg7o8SFonnSQrb0dhZaCMMx9WLVtYEeJjUgH0+O8Cdm
	v5KYkqFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsEL-0000000HZeI-3Cjw;
	Thu, 08 Jan 2026 15:47:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsEK-0000000HZdv-0zvj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 15:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 605036012B;
	Thu,  8 Jan 2026 15:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6B5C16AAE;
	Thu,  8 Jan 2026 15:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767887239;
	bh=7caujGyve2zR5xMPQjCuO+DCSyoqQe6HI+AnfqPwGVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gdfJwL+TNvvs65hgRiW/n5xACT4Jb+FqaJ4sgDVjEqDd335UTt5deqZmXM0L3Z/Mi
	 5bD3Q7jJwKiPZKvqGUhmuk+do30eJ5ADMNbHSrwgigIz/+Ngzv2cn/0ceLeF0VwkfI
	 WAJs3I4QVEuWNZhzaI32ioKy18YgW0uUo8m3vHYl02iBJxtx5vJG9MyE7Llc1gYbIp
	 vZ72vcniEkgz+iLVVgheRlNs55bjvw4ubsabsBgbztzNioNDc/Kzd4XAHGRvXJVwsJ
	 eX80EwgUIOCggdXZdL+jNsj/R9n2AQtuiVCL947B7hxAAN4wkaclK0PgRfK52I0Gp/
	 4CcVcfNRmI9vw==
Date: Thu, 8 Jan 2026 15:47:13 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Kornel =?utf-8?Q?Dul=C4=99ba?= <korneld@google.com>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bartlomiej Grzesik <bgrzesik@google.com>,
	Tomasz Nowicki <tnowicki@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix error checking for FFA_VERSION
Message-ID: <aV_RgSUCERAqZCgY@willie-the-truck>
References: <20251114-pkvm_init_noffa-v1-1-87a82e87c345@google.com>
 <86y0nyqoy9.wl-maz@kernel.org>
 <CACF_fqmWwtuF_7+OJ2rUPvDJzs4ubJO6XCf6N9cW2-AABSx_NQ@mail.gmail.com>
 <86ms4br2dz.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86ms4br2dz.wl-maz@kernel.org>
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

On Mon, Nov 24, 2025 at 01:22:48PM +0000, Marc Zyngier wrote:
> On Mon, 24 Nov 2025 11:49:08 +0000,
> Kornel Dulęba <korneld@google.com> wrote:
> > 
> > On Sat, Nov 22, 2025 at 12:36 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Fri, 14 Nov 2025 11:11:53 +0000,
> > > "=?utf-8?q?Kornel_Dul=C4=99ba?=" <korneld@google.com> wrote:
> > > >
> > > > According to section 13.2 of the DEN0077 FF-A specification, when
> > > > firmware does not support the requested version, it should reply with
> > > > FFA_RET_NOT_SUPPORTED(-1). Table 13.6 specifies the type of the error
> > > > code as int32.
> > > > Currently, the error checking logic compares the unsigned long return
> > > > value it got from the SMC layer, against a "-1" literal. This fails due
> > > > to a type mismatch: the literal is extended to 64 bits, whereas the
> > > > register contains only 32 bits of ones(0x00000000ffffffff).
> > > > Consequently, hyp_ffa_init misinterprets the "-1" return value as an
> > > > invalid FF-A version. This prevents pKVM initialization on devices where
> > > > FF-A is not supported in firmware.
> > >
> > > Is this statement accurate? I regularly boot KVM in protected mode in
> > > environments that really cannot be suspected of implementing FF-A
> > > (there is no EL3 to start with). And yet I don't see any failure of
> > > the sort.
> > >
> > > Please clarify the circumstances this is triggered.
> > 
> > I do have EL3 enabled, but the FF-A itself is not implemented.
> > 
> > Without this change kvm initialization fails with the following:
> > 
> > [    0.946776][    T1] kvm [1]: nv: 554 coarse grained trap handlers
> > [    0.952880][    T1] kvm [1]: nv: 669 fine grained trap handlers
> > [    0.958813][    T1] kvm [1]: IPA Size Limit: 44 bits
> > (...)
> > [    1.034089][    T1] kvm [1]: Failed to init hyp memory protection
> > [    1.041213][    T1] kvm [1]: error initializing Hyp mode: -95
> 
> [    0.045492] kvm [1]: nv: 568 coarse grained trap handlers
> [    0.045860] kvm [1]: nv: 664 fine grained trap handlers
> [    0.046194] kvm [1]: IPA Size Limit: 42 bits
> [    0.220184] kvm [1]: GICv3: no GICV resource entry
> [    0.220525] kvm [1]: disabling GICv2 emulation
> [    0.220852] kvm [1]: GIC system register CPU interface enabled
> [    0.221264] kvm [1]: vgic interrupt IRQ9
> [    0.221565] kvm [1]: Protected hVHE mode initialized successfully
> 
> Ergo, it works here without FFA (this is in a nested guest that is not
> exposed anything but PSCI in the FW emulation).

I looked briefly at this today and I think the !FFA path for nested
probably ends up in kvm_smccc_call_handler(), which will get
KVM_SMCCC_FILTER_DENY for the FFA_VERSION call and end up returning
SMCCC_RET_NOT_SUPPORTED as a u64, so 0xffffffffffffffff and effectively
hiding the bug in the proxy code.

So that might explain the different behaviours we're seeing.

On the plus side, the fix should continue to work in that case because
we'll just ignore the upper 32 bits.

Will

