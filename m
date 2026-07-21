Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B506C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 11:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oo4QtPAlwQWs6RQLzHeNGtNHhRPU/ryCbDtVdgxOK3o=; b=acALZ0l6oSnxLN8+vJfL6/LdGx
	ZqTlzO6Iu/yRuDoBriJyB0mw8nK89y1g17clbxLB3zMToY49L0mbMoT+cC2Iif+2VNQA/4+DWASCA
	wBzMJbYB6FWca04lYxrZLeA4CKTy6ezGOkgH/EE9bKAwHRl9tcxmNx4im0TCJLAHJYIxXtcDUmTHo
	cX2mJIQOhG5hX8ZZvAJZd1b6bH5JKV3qIAl8lk/Dn0SZARaKMFdZiLgk5RiA/zc4itnCOg85iDHWG
	rRzIu7XnlPh2peLVShm4EXMfD7cZk0NP3+lss7fju94/BguATM8iNK4mRPimIbI+kVPrYOnKrqatH
	ETUNmhXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8a7-00000009JPI-0EH5;
	Tue, 21 Jul 2026 11:24:15 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8a4-00000009JOn-2jrv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 11:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1784633051;
	bh=oo4QtPAlwQWs6RQLzHeNGtNHhRPU/ryCbDtVdgxOK3o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=iBtuRLu2R47/cA//T2lB1K/SmxPjXHTmS3xxENtVRdPso5iiYICiZknTbm4Z8KZxd
	 zcvFlWhULghcPv5PTnWyv2MhkYEwxxn6wA8SjCAv2BPdTfrA1gl99x3kc4aDWn+z89
	 g0+yzfUAI1F3KQFt7jNfy5dIJl9mQKT5epqc2lqs=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4h4FQM0lGqz10s7;
	Tue, 21 Jul 2026 11:24:11 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4h4FQL1C2tz10s2;
	Tue, 21 Jul 2026 11:24:10 +0000 (UTC)
Date: Tue, 21 Jul 2026 12:24:08 +0100
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_0/7=5D_KVM=3A_arm64=3A_pKVM?=
 =?US-ASCII?Q?_stage-2_mapping_and_memcache_fixes?=
In-Reply-To: <20260717130317.1953574-1-fuad.tabba@linux.dev>
References: <20260717130317.1953574-1-fuad.tabba@linux.dev>
Message-ID: <31F736D9-C500-4049-AE42-EACAAAAB4E5A@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_042412_843259_38F12D9C 
X-CRM114-Status: GOOD (  19.30  )
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

On July 17, 2026 2:03:10 PM GMT+01:00, Fuad Tabba <fuad.tabba@linux.dev>
wrote:
>Hi folks,
>
>Changes since v4 [1]:
>  - Restored the permission-fault and dirty-logging memcache top-ups
>    that v4 dropped. Both fix real bugs.
>  - Patch 1 uses the anonymous bitfield encoding rather than the
>    open-coded mask and helpers. (Marc)
>  - Reshaped the permission-fault top-up to stage the full memcache
>    under pKVM, not just the mapping object. The object-only form still
>    returned -ENOMEM and tripped a WARN under the hypervisor's
>    unconditional min-pages check.
>  - Re-scoped the dirty-logging top-up to its generic, non-pKVM failure
>    mode, now that the permission-fault patch covers pKVM.
>  - Added three adjacent fixes found while going through the series, and
>    a selftest for the block transitions.
>  - Patches 1 and 3 keep Bradley's Signed-off-by from v3; my changes
>    to each are noted in a [tabba: ...] line.
>
>I picked this up while reviewing Bradley's "mapping cache" series [2]:
>v4 dropped two fixes from v3 that address real bugs, so I've collected
>the three fixes back together, reshaped patch 1 per Marc's review [3],
>added a few adjacent fixes I found along the way and a selftest, and am
>reposting as v5.
>
>Most of the fixes are in the pKVM stage-2 walker. On a pKVM host a
>non-protected guest's stage-2 faults go through pkvm_pgtable_*(), which
>diverges from the generic walker in several ways that are bugs: cache
>maintenance on non-cacheable mappings (patch 1), a missing memcache
>top-up on permission faults that under pKVM still allocate (patch 2), a
>full flush walk on FWB hardware (patch 4), a WARN on a guest-reachable
>map failure (patch 5), and an eager-split capability whose pKVM backend
>is only a stub (patch 6). These affect non-protected guests only, since
>dispatch and memcache selection key on the host-global pKVM mode, and
>protected guests take no permission faults.
>
>Patch 3 is not pKVM-specific. During dirty logging a non-write
>permission fault, an instruction fetch, still needs a page-table page
>to split a block, but the memcache top-up is gated on write faults.
>That fault path is generic, so the fix is too.
>
>The two memcache top-ups came from sashiko review-bot findings [4][5],
>and both check out against the code.
>
>The series is structured as follows:
>
>  1:    Skip cache maintenance for non-cacheable mappings.
>  2-3:  Top up the memcache for the permission and dirty-logging faults
>        that force stage-2 block transitions.
>  4-6:  Adjacent pkvm_pgtable_*() fixes: FWB flush early-out, drop a
>        spurious map WARN, and gate the eager-split capability.
>  7:    Selftest for the block-collapse and block-split transitions.
>
>Testing: the selftest in patch 7 covers the two dirty-logging block
>transitions (page->block collapse and block->page split) that patch 2
>stages; on the base kernel the collapse oopses the host in
>pkvm_pgtable_stage2_map() with a NULL dereference under mmu_lock, and
>with the series applied it passes. It is a standalone test rather than
>an extension of kvm_page_table_test, whose default anonymous-4K backing
>forms no huge-page blocks, so an automated run never exercises these
>transitions, and whose worker/stage harness does not fit the multi-stage
>logging sequence. Run it with 2M hugepages
>reserved and, for the split half, on a CPU with CTR_EL0.DIC == 0 (e.g.
>-cpu cortex-a710 under QEMU); it self-skips those otherwise. It also
>passes on a non-pKVM host (VHE and nVHE), where patch 3's generic change
>applies. The other fixes are not exercised by the selftest and rest on
>the analysis in their commit messages: patch 3's fault path is generic
>and non-pKVM (under pKVM patch 2 already tops it up, and its failure is
>a WARN_ON(!nobjs) in kvm_mmu_memory_cache_alloc(), not a KVM_RUN error),
>and patches 1 and 4-6 each need a specific pKVM configuration to hit.
>
>Based on Linux v7.2-rc3 (a13c140cc289).
>
>Cheers,
>/fuad
>
>[1] https://lore.kernel.org/r/20260701192428.17430-1-include@grrlz.net
>[2] https://lore.kernel.org/r/20260624160028.15591-1-include@grrlz.net
>[3] https://lore.kernel.org/r/86qzllpy1g.wl-maz@kernel.org
>[4]
>https://lore.kernel.org/all/20260623161545.EA08E1F000E9@smtp.kernel.org/
>[5]
>https://lore.kernel.org/all/20260623165634.699011F000E9@smtp.kernel.org/

Whole series


PKVM.c/.h
Tested-by: Bradley Morgan <include@grrlz.net> # On pixel 7, Android 17 CP2A.260705.006

Test: Tested-by: Bradley Morgan <include@grrlz.net> # On QEMU arm64 host
 

Thanks!

