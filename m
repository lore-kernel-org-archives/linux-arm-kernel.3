Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24917C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSeeoZJp2knuheF3VC8Cg0vSsJ06Oi4KKbvrXmMmHGA=; b=jIpkklBA6Csrn4cDOIabIZUYh1
	0j0hdzGhDMfVK2g518NA4HxEGQ1cEofmMfR26zXzCJRdbm0jXelChf/9hqW9gyW9/dJTAozqr6O6Q
	yNZ3A7aulTWZDJ7VbZZwiOabhl/wkBad1o2lKmVGBk6MzsGDKuphMXKMn0x3zdgDFJJlECJuzDpVD
	4w6+0bzClJpE7eT+O/r4hoalIcKB7jpH0Wu1pvVXSymkQ3Q2Z8Ta+BfzosmfecVBq1tF5usC1G9DC
	BR5biD2qdAHO0fmILmHfk9wJRhdXN+yA1uV5EDhZXFkcUxqLkhrFei1UdN4TMOLGC5fXPDtLz2L5L
	inj6KhCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm83k-00000009FU9-2jks;
	Tue, 21 Jul 2026 10:50:48 +0000
Received: from devianza.investici.org ([198.167.222.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm83h-00000009FSt-2JEq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1784631033;
	bh=tSeeoZJp2knuheF3VC8Cg0vSsJ06Oi4KKbvrXmMmHGA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=N59Po1k+rbpJAYub9rNYigwnjcVbFXA+fYg+xnw0gUwbD+VI8mImpa494f42lMBHR
	 v1U82ZfSVnzcqitul7kMsQ1HbxoX77oYc0/JIo65IQ0vuJ0vt38i7Qe9KCmdCCOsaW
	 mCqWvCBEOlQ8+iVDZ7G80jKwMTOZHUt6kDVCdYgg=
Received: from mx2.investici.org (unknown [127.0.0.1])
	by devianza.investici.org (Postfix) with ESMTP id 4h4DgY4WZRz6vPL;
	Tue, 21 Jul 2026 10:50:33 +0000 (UTC)
Received: by mx2.investici.org (Postfix) id 4h4DgY1HwPz4vyJ;
	Tue, 21 Jul 2026 10:50:33 +0000 (UTC)
Date: Tue, 21 Jul 2026 11:50:33 +0100
From: Bradley Morgan <include@grrlz.net>
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
CC: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Quentin Perret <qperret@google.com>,
 Vincent Donnefort <vdonnefort@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, Gavin Shan <gshan@redhat.com>,
 Dev Jain <dev.jain@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_4/7=5D_KVM=3A_arm64=3A_Skip_p?=
 =?US-ASCII?Q?KVM_stage-2_flush_when_FWB_is_enabled?=
In-Reply-To: <20260717130317.1953574-5-fuad.tabba@linux.dev>
References: <20260717130317.1953574-1-fuad.tabba@linux.dev> <20260717130317.1953574-5-fuad.tabba@linux.dev>
Message-ID: <2ECE2480-4E56-4EE8-AE1F-36571463A930@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_035046_031346_B28E6C6F 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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

On July 17, 2026 2:03:14 PM GMT+01:00, Fuad Tabba <fuad.tabba@linux.dev>
wrote:
>pkvm_pgtable_stage2_flush() cleans the D-cache for every mapping in the
>range even on hardware with stage-2 Force Write-Back, where FWB keeps
>guest memory coherent to the PoC and the maintenance is unnecessary. The
>generic kvm_pgtable_stage2_flush() returns early in that case, but the
>pKVM MMU does not, so it needlessly cleans the whole range on, e.g.,
>every set/way trap.
>
>Return early when FWB is enabled, matching the generic walker.
>
>Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
>Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

LGTM,

Reviewed-by: Bradley Morgan <include@grrlz.net>

>---
> arch/arm64/kvm/pkvm.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
>index f70c601dcf4c..ba6570e37545 100644
>--- a/arch/arm64/kvm/pkvm.c
>+++ b/arch/arm64/kvm/pkvm.c
>@@ -518,6 +518,10 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
> 	struct pkvm_mapping *mapping;
> 
> 	lockdep_assert_held(&kvm->mmu_lock);
>+
>+	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
>+		return 0;
>+
> 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
> 		if (!mapping->nc)
> 			__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
>

Thanks!

