Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82E5C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8a181GN7Ao0wUR1dBz6O6OJIemyumNYvfR7LIastGzc=; b=Y00NHGBT9924nmxb/1UEbCStwe
	/Q6Mpk117WsMrK8vCbFMhIB0RU2zfrXrECpYlu0CImbFgk+dl6sNkCKDHam+RDOU+jpyz6nsNoYDM
	i/iUjllXUcRPHiNPwO9Vp3FtlWLwiRc5DGE1IwnTLSllEbFozXhANsGHl9UjCVhwLtVVFmmXCUkHD
	rsTwDGsQ8EMBIuFZmwMBioKqrroYmJnP0NmDBxDuxfAlCNEGjUsyZ9ozR6HG0PwSA85v1sY7L36PM
	4/Bjq1HFugzPXkGoy/cEv1ELxdUkwDBF57L2D3PxzAKa28ZuIX28M2Af4zRjPXigP3yqK6xAgTRtC
	RYoYXs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tma4e-0000000EE3c-0DYW;
	Mon, 24 Feb 2025 15:08:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZcB-0000000E8Aw-2MLm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:39:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98972152B;
	Mon, 24 Feb 2025 06:39:37 -0800 (PST)
Received: from arm.com (unknown [10.1.32.142])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D2C03F5A1;
	Mon, 24 Feb 2025 06:39:19 -0800 (PST)
Date: Mon, 24 Feb 2025 14:39:16 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH] KVM: arm64: Drop mte_allowed check during memslot
 creation
Message-ID: <Z7yElHKrJGn8XuPS@arm.com>
References: <20250224093938.3934386-1-aneesh.kumar@kernel.org>
 <Z7xSfVME4z2ComUm@arm.com>
 <86ldtvr0nl.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ldtvr0nl.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_063923_688834_DA3AEA6B 
X-CRM114-Status: GOOD (  26.23  )
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

On Mon, Feb 24, 2025 at 12:24:14PM +0000, Marc Zyngier wrote:
> On Mon, 24 Feb 2025 11:05:33 +0000,
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Mon, Feb 24, 2025 at 03:09:38PM +0530, Aneesh Kumar K.V (Arm) wrote:
> > > This change is needed because, without it, users are not able to use MTE
> > > with VFIO passthrough (currently the mapping is either Device or
> > > NonCacheable for which tag access check is not applied.), as shown
> > > below (kvmtool VMM).
> > 
> > Another nit: "users are not able to user VFIO passthrough when MTE is
> > enabled". At a first read, the above sounded to me like one wants to
> > enable MTE for VFIO passthrough mappings.
> 
> What the commit message doesn't spell out is how MTE and VFIO are
> interacting here. I also don't understand the reference to Device or
> NC memory here.

I guess it's saying that the guest cannot turn MTE on (Normal Tagged)
for these ranges anyway since Stage 2 is Device or Normal NC. So we
don't break any use-case specific to VFIO.

> Isn't the issue that DMA doesn't check/update tags, and therefore it
> makes little sense to prevent non-tagged memory being associated with
> a memslot?

The issue is that some MMIO memory range that does not support MTE
(well, all MMIO) could be mapped by the guest as Normal Tagged and we
have no clue what the hardware does as tag accesses, hence we currently
prevent it altogether. It's not about DMA.

This patch still prevents such MMIO+MTE mappings but moves the decision
to user_mem_abort() and it's slightly more relaxed - only rejecting it
if !VM_MTE_ALLOWED _and_ the Stage 2 is cacheable. The side-effect is
that it allows device assignment into the guest since Stage 2 is not
Normal Cacheable (at least for now, we have some patches Ankit but they
handle the MTE case).

> My other concern is that this gives pretty poor consistency to the
> guest, which cannot know what can be tagged and what cannot, and
> breaks a guarantee that the guest should be able to rely on.

The guest should not set Normal Tagged on anything other than what it
gets as standard RAM. We are not changing this here. KVM than needs to
prevent a broken/malicious guest from setting MTE on other (physical)
ranges that don't support MTE. Currently it can only do this by forcing
Device or Normal NC (or disable MTE altogether). Later we'll add
FEAT_MTE_PERM to permit Stage 2 Cacheable but trap on tag accesses.

The ABI change is just for the VMM, the guest shouldn't be aware as
long as it sticks to the typical recommendations for MTE - only enable
on standard RAM.

Does any VMM rely on the memory slot being rejected on registration if
it does not support MTE? After this change, we'd get an exit to the VMM
on guest access with MTE turned on (even if it's not mapped as such at
Stage 1).

-- 
Catalin

