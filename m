Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5A6C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q2PFB9bGPCBWyxXpptwJuGCpMsyTpL531J3WsZwpejA=; b=nashk3QJInsU2cbPe27JMc1HAn
	DYLaP714IpoqyD+2Li7nH/S6h9cYE9jSnv6D6ltKB9flS2Z1wfkzudgb+niGXGNrbc8ifxAazLixH
	El1kawFiiKA87kGfezLMB06OT46BBcoKaOoPVk+CFGV9FMzCyPSAHtcTnjTgDB9zgPpeqPt3bLlg8
	r3/xkdDOL1W1/Oaj3uahWKBjHo7zUfW/+kq9qzt5Huc0+eb3t/LCbO0Ptl2G5SQjFIfbRPFeze4OU
	JbOHaziH/GpCU7au9CZWNZZjfXMJwz8HBS+v3Dk0IaWCTQuEZie6gnrgFf//oEu1SKMFsZAXQNu7D
	8y5D5Jpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VJh-00000007GQH-3PNl;
	Tue, 15 Sep 2026 15:43:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VJg-00000007GPt-4978
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Q2PFB9bGPCBWyxXpptwJuGCpMsyTpL531J3WsZwpejA=; b=eV6p8PqEBmMBP7RcDEl7MgcjGd
	e8yvXe4UvpAVswaeGPPUwiyiaL5bO7VLDFDb4JMXrPvE1E3AQwwMfODs7Iy7GIKBOIXSOKmh9v1bo
	SgPI6ifO9Lvu09+2/mpllP82X/Og8OAaz7vnNTpWagB5fsya39Jlf56UmsprSbwFzoJBRMYffnAD+
	2xq1ELDefXnfe9yJOSwp2XNGMcwtHKXVYs0LgvvpCp2S9BrN/G96+YuBUr1n/jKHYdCZXHoQVqQBd
	+2UMaiNCSj7xDib5bg6FMTXSrIlnsGLsyK+ceF3iWSpOglwUlJawskzwNkZuzQ38uMBUH8d2QlU7/
	JlgAJRDw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6VJd-00000006xxM-2JaZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:43:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23BDA1570;
	Tue, 15 Sep 2026 08:43:19 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 235873F882;
	Tue, 15 Sep 2026 08:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487002; bh=dGCyRyad+R3eTVvMaV3UbHKKwBABsVheRnTDSo9R3QI=;
	h=From:To:Cc:Subject:Date:From;
	b=crRRscH3OrO9Zfmax7p89GH6tKP3LypEq486sailvOhs1x+pILaPsAFgFoEhZt/3z
	 RSBFwRy/1/4FbN0cUHwn4EvBnFTJz0NNAryNGTEo+zmtf7t3yTdELLaK0RDF8XG3jt
	 bVZN6VKKjSvpdnX+tdrJSVjZpcxoaVQ2+Ej9uwSQ=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v6 0/7] KVM: arm64: nv: Implement nested stage-2 reverse map
Date: Tue, 15 Sep 2026 16:42:58 +0100
Message-ID: <20260915154305.3852871-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_164325_952922_F4BD670D 
X-CRM114-Status: GOOD (  13.42  )
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

Hi,

This is v6 of optimizing the shadow s2 mmu unmapping during MMU
notifiers.

This version fixes a few issues, and adds Marc's space optimization
for kvm_guest_s2_mapping [1]. Please see the changelog for the details.

Tested by booting L3, and running in-kernel targetted tests described
in [2]. v5 got some tested-by's from Itaru and Wang (thanks), I didn't
carry them over since some bugs fixed in v6 are non-obvious. Some
retest would be much appreciated!

Series based on v7.3-rc3 + Marc's nested mmu lifecycle fixes [3].

* Changes from v5 [4]:

  - Align the addresses down to the mapping size when recording the
    guest s2 mappings. s2fd->fault_ipa isn't necessarily PAGE_SIZE aligned.

  - Record guest s2 mappings even when page table maps return -EAGAIN.
    kvm_pgtable_stage2_map() can create mappings while returning -EAGAIN.
    For example, a 2M block map (A) could race with a 4K page map (B):
    1. (A) maps the 2M block in kvm_pgtable_visitor_cb()
    2. (B) breaks that block into a table and maps 4K
    3. (A) reloads and finds the table after kvm_pgtable_visitor_cb(),
       then descends into it.
    4. (A) maps some 4K, but before it finishes reads entry mapped by (B).
    5. (A) returns -EAGAIN although it had mapped a few pages.
    In this case, we don't know what subrange is mapped, just track the whole
    requested mapping range.

  - Don't remove tracked mappings from the interval trees if they only
    partially overlap the removal range. Because of the previous bullet point
    we can have a 4K shadow mapping tracked as a 2M range in the interval
    trees. It would be wrong to remove the 2M range when a guest TLBI doesn't
    touch the 4K mapped.

  - Check mmu->pgt during mmu unmap notifier, as it could race against
    MMU teardown.

  - Make guest_s2_tracking_destroy() canonical mmu only. We simply don't
    need to detach the nodes from the nested mmus' trees. Freeing them
    during canonical mmu's teardown is enough.

Thanks!

[1]: https://lore.kernel.org/kvmarm/86h5jv7qrd.wl-maz@kernel.org/
[2]: https://lore.kernel.org/kvmarm/gerjpm62a2gszzggc6vuai22bf3prfquvfsp7ueumps7vz2ev3@odlmovaklg2b/
[3]: https://lore.kernel.org/kvmarm/20260911162203.1919330-1-maz@kernel.org/
[4]: https://lore.kernel.org/kvmarm/20260810205038.118843-1-weilin.chang@arm.com/

Marc Zyngier (1):
  KVM: arm64: nv: Drop kvm_s2_mmu pointer from kvm_guest_s2_mapping

Wei-Lin Chang (6):
  KVM: arm64: Use a variable for the canonical IPA in kvm_s2_fault_map()
  KVM: arm64: nv: Introduce guest stage-2 tracking structures
  KVM: arm64: nv: Track guest stage-2 mapping creation
  KVM: arm64: nv: Track guest stage-2 mapping removal
  KVM: arm64: nv: Avoid full shadow stage-2 unmap
  KVM: arm64: Refactor kvm_unmap_gfn_range() with common variables

 arch/arm64/include/asm/kvm_host.h   |  31 +++++-
 arch/arm64/include/asm/kvm_nested.h |   7 ++
 arch/arm64/kvm/mmu.c                | 109 +++++++++++++++++++---
 arch/arm64/kvm/nested.c             | 140 +++++++++++++++++++++++++++-
 4 files changed, 269 insertions(+), 18 deletions(-)

-- 
2.43.0


