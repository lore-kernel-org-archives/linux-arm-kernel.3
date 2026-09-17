Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DD9C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RGp251C3BSJd3fLm3eCBvVW22NHcQTjZ7+8OXJ1e2rE=; b=NLjq7ZP6/2BGssaIeIMgeEHx2v
	7KYPLLjv9wls0XHbDTOfvp/OZYZ8FHQSWfgMtuG/aWBbYKZ2XsXh5bQVgRJ6smJuKBQ4zG5pfzww8
	073iXEPR8+qNbLrilOqoQzUsD3DPh1koWBz+cykiBAwx9LqIyKxKn721cSApga42irjQGX3/piQZ0
	57YrkwmcXED29PxPN0uqQsi76vOxopk0VpCgLlE7xXJQ5V5PFCW4Jp5ddII4b3LRXrHcQwQ5Ek+41
	FZonKdTCeMn7LT6riH+U3Ik/2hsUb4fEoxoCZ/AlXsywQlRbHkZjBD0AJW0+mo9D4nDB4Ns7u5fTZ
	jhsay6xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78GN-0000000AzIE-05eM;
	Thu, 17 Sep 2026 09:18:39 +0000
Received: from out-115.mta0.migadu.com ([2001:41d0:1004:224b::73] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78GJ-0000000AzHR-3nmd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 09:18:37 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=qQPrpFqFbLdTmOWfZG9ZieuKIf9/ArvaIv1uQrUh0t4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789636712; v=1; x=1790241512;
 b=xQMkT2xm7tnXgGB2fvULnHiNzu5QsAHf0o5HzkIm1BohsdAy69q1UcFvkurt2KartI9ENuln
 pQ6VFV78NMeoLoSk6CTRK59B6fkHJuO9Ul86J3u5VenZDu+7ca+T8H0VkuSm+8mkmf7qfV0guy7
 2/S/G+0BbqKQSeTHSgFCH2K4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7de1b4b5002de0bd;
	Thu, 17 Sep 2026 09:18:32 +0000
X-Mizu-Trace-ID: 7de1b4b5002de0bd
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	qperret@google.com,
	vdonnefort@google.com,
	martijnbogaard@google.com,
	seiden@linux.ibm.com,
	tabba@google.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] KVM: arm64: Honour KVM_VM_TYPE_ARM_IPA_SIZE under pKVM
Date: Thu, 17 Sep 2026 10:18:22 +0100
Message-Id: <20260917091826.2639205-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_021836_103691_762FDD3B 
X-CRM114-Status: GOOD (  14.79  )
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

Hi folks,

pKVM has ignored KVM_VM_TYPE_ARM_IPA_SIZE since it started running
guest stage 2 at EL2 (v6.2): every VM gets the host's IPA limit,
whatever its VMM requested, and an out-of-range request that every
other host rejects with -EINVAL is accepted. This series makes pKVM
handle the type the way KVM does everywhere else, fixes the bugs that
causes, and two found on the way.

Ignoring the type has two consequences I hit while testing the ITS table
save series [1]: vgic_init fails on any pKVM host whose limit exceeds 40
bits, because the addresses it expects a 40-bit VM to reject are in
range; and on a 64K kernel built for 48-bit PAs on a 52-bit part the
host sizes a VM at 52 bits while EL2 gives it 48, so a memslot above
2^48 the host accepts can't be mapped.

Patch 3 is the fix. EL2 takes the IPA size from the VTCR the host
sized the VM with, bounded by the same rule as the host's limit, and
the host-side override goes: the request is range-checked and the VM
gets the size it requested, so the VMM owns the guest's IPA layout on
a pKVM host too, and the host and EL2 agree on it.

The rest supports that. Patch 1 moves the limit rule into a helper EL2
can share. Patch 2 rejects a pgd donation that's page-aligned but not
aligned to its own size, which crashes EL2 today; patch 3 changes how
that size is computed, so the check goes in first. Patch 4 frees a VM
vgic_init and vgic_v5 leak when the GIC probe fails.

A VMM that requests less than the host limit under pKVM, the 40-bit
default type included, now gets that size, and on a host whose limit is
below 40 bits the default type is refused, as it is without pKVM.
kvmtool requests the smallest size its RAM needs, for protected VMs
too, and crosvm requests the limit, so neither places anything beyond
its request.

vgic_init passes with this, its range checks untouched, on QEMU under
pKVM and VHE at 52- and 48-bit host IPA limits. On a 64K/PA_BITS_48 pKVM
host a guest mapping above 2^48 fails without patch 3 and works with it.
On an M4, whose limit is 40 bits, pKVM used to create a VM for a 44-bit
request and give a 36-bit VM a 40-bit stage 2; with this it refuses the
first and bounds the second, as the same machine does without pKVM.

Based on Linux 7.3-rc3 (fd73f4a665989; also applies to kvmarm/next
8476ce1f1e949).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260821064445.615838-1-fuad.tabba@linux.dev/

Fuad Tabba (3):
  KVM: arm64: Move the IPA limit rule into kvm_get_ipa_max()
  KVM: arm64: Honour the requested IPA size under pKVM
  KVM: arm64: selftests: Free the VM when the GIC device probe fails

Quentin Perret (1):
  KVM: arm64: Check PGD alignment when creating a pVM

 arch/arm64/include/asm/kvm_pgtable.h          | 15 ++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         |  2 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 24 +++++++++++++++----
 arch/arm64/kvm/mmu.c                          |  4 +---
 arch/arm64/kvm/reset.c                        | 12 +---------
 tools/testing/selftests/kvm/arm64/vgic_init.c |  4 +++-
 tools/testing/selftests/kvm/arm64/vgic_v5.c   |  4 +++-
 7 files changed, 44 insertions(+), 21 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5


