Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9283CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 17:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDjKCkoTg3i3GJZfWXyR5+GUBGu//vlWsGB4F0dmV4Q=; b=WxPMGcvBaG240CY6uOlN7DLFrX
	CdwNm4ynPXjughkk2FyXBqCFFUIOJQsTvZOnTUv5p8v+uqH6zqS7BUEIFr5mQfiK53sWizbz7R24a
	puv4wACTbog5PsW3flXov0E+WIikWA7LDDnIwZ2dN8xJRlA8I/xpsSu9g2bACfEy60s4Bs9A6n4yS
	ndfd0gTkMDlJGyPYvsZIY3zyRRyYS5AsDF2s8wR/n86UZxy73+YxXi0J2OwAGXwGNA5BjftPDRj1h
	ZlyefNz6toDt15JGmcJCn33AjLnaU/iaKMaW6qT1LDassKgtmuCMOWkjMmynQ/+I0x3eQBsegOT4l
	6Z2SzgjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcRZN-00000008BKF-3Up7;
	Wed, 24 Jun 2026 17:39:25 +0000
Received: from confino.investici.org ([2a11:7980:1::2:0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcRZK-00000008BJu-23bj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 17:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782322757;
	bh=TDjKCkoTg3i3GJZfWXyR5+GUBGu//vlWsGB4F0dmV4Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ciwM3wOzJiNUs9hD46zOJThBt7YPMtL/k/p9dVCqH1KYu7qZoemAdmdruaiiUvu48
	 9o7H9pb8nWu5/BilyRLbEobRRVaHbB+AuVdfAZp6+xmgHDqfqbqHKkHKlPV3Hc359s
	 ydlPyM9DdLtAqKgZhkjV9s/nyFKsqe1Ujx2sjnh0=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4glq1d5z0sz10sb;
	Wed, 24 Jun 2026 17:39:17 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4glq1d131zz10sH;
	Wed, 24 Jun 2026 17:39:17 +0000 (UTC)
Date: Wed, 24 Jun 2026 18:39:16 +0100
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
CC: Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Quentin Perret <qperret@google.com>,
 Vincent Donnefort <vdonnefort@google.com>, Gavin Shan <gshan@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_3/3=5D_KVM=3A_arm64=3A_top_up_s?=
 =?US-ASCII?Q?tage_2_memcache_for_dirty_logging_faults?=
In-Reply-To: <20260624160028.15591-4-include@grrlz.net>
References: <20260624160028.15591-1-include@grrlz.net> <20260624160028.15591-4-include@grrlz.net>
Message-ID: <9FCEC7E9-DE50-443F-8E82-9FA22CA15ED6@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_103922_983880_8DE26F54 
X-CRM114-Status: GOOD (  12.87  )
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

On June 24, 2026 5:00:28 PM GMT+01:00, Bradley Morgan <include@grrlz.net>
wrote:
>Dirty logging forces new stage 2 mappings down to page size, but
>it does not always remove an existing block mapping before the next
>fault. Eager splitting is best effort and is disabled by default.
>
>A permission fault on such a block can still need a page table page
>to install the smaller mapping. Top up the memcache for any permission
>fault while dirty logging is active, not only for write faults.
>
>The issue was discovered [1] by Sashiko.
>
>Link: https://lore.kernel.org/all/59984F6D-06F2-4302-BDD7-92DF334E8FA0@grrlz.net/T/#t [1]
>
>Fixes: 6f745f1bb5bf ("KVM: arm64: Convert user_mem_abort() to generic page-table API")
>Cc: stable@vger.kernel.org
>Signed-off-by: Bradley Morgan <include@grrlz.net>
>---
> arch/arm64/kvm/mmu.c | 9 ++++-----
> 1 file changed, 4 insertions(+), 5 deletions(-)
>
>diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>index 3f57f6825a33..8911e319e6fa 100644
>--- a/arch/arm64/kvm/mmu.c
>+++ b/arch/arm64/kvm/mmu.c
>@@ -2122,13 +2122,12 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> 	 * Permission faults just need to update the existing leaf entry,
> 	 * and so normally don't require allocations from the memcache. The
> 	 * only exception to this is when dirty logging is enabled at runtime
>-	 * and a write fault needs to collapse a block entry into a table. With
>-	 * pKVM, they may still need a fresh mapping object if the fault turns
>-	 * page entries into a block entry.
>+	 * and a fault needs to collapse a block entry into a table. With pKVM,
>+	 * they may still need a fresh mapping object if the fault turns page
>+	 * entries into a block entry.
> 	 */
> 	memcache = get_mmu_memcache(s2fd->vcpu);
>-	if (!perm_fault || (memslot_is_logging(s2fd->memslot) &&
>-			    kvm_is_write_fault(s2fd->vcpu))) {
>+	if (!perm_fault || memslot_is_logging(s2fd->memslot)) {
> 		ret = topup_mmu_memcache(s2fd->vcpu, memcache);
> 		if (ret)
> 			return ret;
>

Note: Patch 3 seems to conflict because of patch 2 (the comments)


Oops! :(

V4 (after people have their review go), will contain one commit (patch
3) with the updated comments.

Patch 1 and 2 applies as usual.

Apologies for my messup. 

Thanks!

