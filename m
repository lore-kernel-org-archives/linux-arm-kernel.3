Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C876606C7C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ywGrLqXs;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uJjYZrc/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ucL7Kplm9BcQfsNCszVakuHa/fV2YWpTEBClElt75lg=; b=ywGrLqXsdVMeLSetpcdoI2IqBa
	NHam7lkb3jiyYMjJ0ZQvCCCZN/+iDji42hZz4QgpfP7ZjaTYjXEojbZ38bKfxMtNTKCPeEcHOFaeN
	F07+WVB7cxe1bJJy97T10aNo94ghrYaKtdFbgK3VcpX+OniTGWA0Zs4LsuchPDyeB0DOnWa4qgzak
	oum5Ooc5Cmui+rntZ1qHEQIOlOSJ2cIrybSw/gMAwKNtWQWpqSjTOPw6tdemFXL/UzYIvv6UB6olM
	YbxF9xo2fypKJNTWX1TyCiV8lYiyeeXO5VcRSA26U5s18gsZAnKNOsvTU9LG3WNAsZZNOI/MbChE2
	aFbXsFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIKW-0000000CBEM-1xKk;
	Fri, 06 Nov 2026 11:42:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIKU-0000000CBDn-2B1Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:41:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B2091650;
	Fri,  6 Nov 2026 03:41:54 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B0BF3F628;
	Fri,  6 Nov 2026 03:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793965317; bh=GtzZGsuJwQAob0R6SufhJGIdzZ65QSVgYvPV+jqju24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJjYZrc/QFCxqfHVhKctjEGSxaednrBocQV1LT6i1orIBGz0qqcGQPpLrM2WSMpwB
	 qfqKjfZ2Qy/PyWXIziRTNNVrPqCt2B1bXxPF4p2plo9RC9+Z3rJbX9BAdQzmcvE6aa
	 DMQON7BVfEHIZkZN8M/l6XEkKxV8CGl6EAQw/KBk=
Date: Fri, 6 Nov 2026 11:41:52 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: Re: [RFC PATCH v7 00/28] KVM: arm64: Add Statistical Profiling
 Extension (SPE) support
Message-ID: <au29ACRXFEOXaWPV@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <auy-TwnMbIn-r2xl@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auy-TwnMbIn-r2xl@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_034158_637126_0530F73B 
X-CRM114-Status: GOOD (  38.66  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo,

On Thu, Nov 05, 2026 at 05:47:45PM +0000, Lorenzo Stoakes (ARM) wrote:
> Hi Alex,
> 
> I've gone through all of the patches now, thank you for your patience with
> the review :)

Many thanks for the stellar review, will start replying soonish.

> 
> So there are various dependencies/architectural decisions that need to be
> made here to go from RFC -> non-RFC:
> 
> 1. The 'Ignore MMU notifiers for guest_memfd-only memslots' patch [0] is a
>    hard dependency for the series. I chased over there, hopefully we can
>    get something landed there.

Like you said, Sean is planning to send my original version of that patch with
an updated commit message, thanks for the ping!

> 
> 2. non-VHE, pKVM, NV disallowed for SPE - As I mentioned off-list, I spoke
>    to Marc, and he confirmed that he's more than happy for these to be off
>    the table for a v1. So I think you can drop the HACK: patches and just
>    make these conditions of using SPE.

Oliver, some time ago, expressed the opposite preference: VHE-only is OK for an
RFC, but he was concerned about the discrepancy between VHE and nVHE
configurations. Maybe the direction for KVM changed in the meantime.

Fine by me to drop the HACK! patches, of course, that's just something to keep
in mind.

> 
> 3. The entire VM needs to be pre-faulted, but who should do it? - I do
>    think that relying on userland to do this is a little iffy. So I wonder

There's plenty of iffiness that userspace already handles when it comes to
virtual machines.

Or, how Oliver put it [1] (regarding migration, but it fits):

'My take is that there's no amount of idiot-proofing we can do in KVM to prevent
the VMM from messing this up somehow'.

[1] https://lore.kernel.org/kvm/alE3jRLtYeq-WesA@kernel.org/

>    whether it might be possible to, on SPE first run, prefault the ranges
>    there, and make that a condition of using it? Relatedly, KVM could
>    reject non-guest_memfd memslots for an SPE VM rather than trusting
>    userspace there too.

I'm not sure that's the best idea. Mainly two reasons:

1. KVM will be imposing the condition that *all* writable memslots be backed by
guest_memfd, and *all* memory backing these memslots be pre-faulted and
effectively pinned.

There are use cases for writable memslots to describe guest memory that won't be
used by SPE. First thing that comes to mind would be paravirtualized interfaces
between host userspace and the guest. For example, pvtime - kvmtool creates a
RAM memslot for pvtime (i.e, non-read-only memslot), and it looks to me that
qemu does the same (but my knowledge of qemu is severely limited, so I might be
completely wrong).

Then there's also the possibility that a guest might want to assign a slice of
RAM for use by SPE, to avoid pre-faulting and pinning the entire VM memory. In
this case, userspace will want to have *only* the memslot describing that slice
pre-faulted and pinned, and not the rest of system memory.

2. Perfomance - userspace can pre-fault in parallel, KVM cannot easily do that.

arm64 now has support for KVM_PRE_FAULT_MEMORY, I say let's use that :)

> 
> 4. Dirty page logging - patch 27/28 relies on series [1] being landed,
>    which is also an RFC, and allows migration of SPE VMs. So we need to
>    decide - do we want this migration? Additionally, I think it's
>    reasonable to, if we want it, send both [1] and patch 27/28 as a follow
>    up separate from the v1 non-RFC of the series.

For background, I started this conversation in the LOG_DIRTY_PAGES support for
guest_memfd series [2]. Oliver had some concerns, but he didn't follow up on my
explanations, so I decided to send migration support as part of SPE so people
can have a more complete picture of how everything fits together.

I would be very happy to get basic support for SPE merged in KVM, and, if we
decide it's useful, migration implemented as a follow up, as that involves
landing dirty page logging support for guest_memfd.

[2] https://lore.kernel.org/kvm/alAFmiAsNf6Xm49_@kernel.org/

> 
> 5. Errata handling - the default already disallows SPE on the affected
>    silicon, which seems right. I wonder whether kvm-arm.ignore_spe_errata
>    should exist at all though, other than in some sort of debug mode.

It is intended as a debug/development option, to be used only when the VMs are
trusted. As to why it's there, it's there because without it, SPE would be
disabled on all the machines that I have access to, and I suspect systems not
affected are few and rare between.

> 
> So 1 is a known dependency, I think there's no getting around that, and
> thus that makes merging [0] or something like it a top priority.
> 
> It seems to me 2 is pretty clear-cut, and 4 can reasonably (if we want it)
> be sent as a follow up.
> 
> So really 3 and 5 are the decisions to make here!

I really appreciate your enthusiasm, thanks!

Alex

