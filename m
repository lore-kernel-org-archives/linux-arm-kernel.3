Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7349FC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BEWCKYpCDY3BtjkjFSO1j2gTOATmGhHGuimTvvZdLP8=; b=EBpy7Fb2gSVS89UxxrGJMEmx7D
	J3/J74wn8vXDgVAUpVabZdR48OfbqQe01nX+kFtt/Eo6ehWwew4IS6Ocwbyb3GwhdMK1yfbRb2r1A
	BT2ndTQ1pVMyoPKSVxDkZavZWxWxvFLerZVPCXGV0JkaODQH4N5rPyYtocUHmXNp/hzeprrJpE5Hi
	ex0g1KZPgx3w+pvVQUjp+L9YaAu3YevtSauLsACKQZMbNvNPcAUaV8QiiTOCuKT9EotjrEpsaMcKJ
	+m0xX0r21YnM+NX67x+JtxUrzhKga7tc82bkGXETpZcKVD0VzFrdaNxfB6/LfzLEryt5ryi0S6iJF
	XahAwWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXJS-0000000GwM5-1Ny8;
	Tue, 30 Jun 2026 12:11:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXJG-0000000GwFZ-3QTT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:11:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7736E175A;
	Tue, 30 Jun 2026 05:11:18 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9C233F905;
	Tue, 30 Jun 2026 05:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782821482; bh=fKXhVZd2KbcgtEAsulIof9g1rmwAW3Kz/yvYpw76Jns=;
	h=From:To:Cc:Subject:Date:From;
	b=XmdA4OyG03dXigKmUsdRuMpu5OSF8Mmw5WpWNxYworu6arKNkHMlFBlI4BeCOXgXe
	 GJlTe2zyDRow7+ubJbjFBXGZqcdWvxPA7mcm3FSILAcwAsNb6AvD6D+I/twY6iN8Xk
	 qb8h00UcGoMoHQJmNceCIAP4n9mXfCXur4Ljbwh8=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sebastian Ene <sebastianene@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 0/6] KVM: arm64: ptdump: Shadow ptdump fixes
Date: Tue, 30 Jun 2026 13:09:59 +0100
Message-ID: <20260630121005.1130996-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_051128_471157_2581AFB1 
X-CRM114-Status: GOOD (  10.66  )
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

This is v2 of fixing shadow ptdump debugfs files. Unfortunately I couldn't make
per mmu ptdump files work after all, mainly because there isn't a clean way to
locate the specific nested mmu for each ptdump file as the nested mmus could be
freed when the file gets opened. Therefore in this series a single file
"shadow_page_tables" is created that dumps all valid mmus' page table
information.

An advantage of this is that this new ptdump file have a lifetime identical to
other ptdump files i.e. stage2_page_tables, ipa_range, etc., hence avoiding the
dentry UAF found last time [1].

With this all ptdump files are only removed when the last kvm reference gets
dropped and kvm_destroy_vm_debugfs() is called, in their open(), show()
functions the nested mmu array and mmu->pgt are checked with mmu_lock held to
prevent UAF.

Patch 1-2: Undo previous shadow ptdump implementation.
Patch 3:   Fix a mmu->pgt UAF that happens when ptdump files are read after
           mmu->pgt is freed.
Patch 4-5: Preparation for the shadow page table dump file.
Patch 6:   Implementation of the shadow page table dump file.

The fixes are tested with CONFIG_PROVE_LOCKING,
CONFIG_DEBUG_ATOMIC_SLEEP, and CONFIG_KASAN.

Thanks!

* Changes from v1 ([2]):

  - Move from per mmu ptdump files to one file that will dump all shadow page
    tables.

[1]: https://lore.kernel.org/kvmarm/ajty6I7ZqodP4ous@sm-arm-grace07/
[2]: https://lore.kernel.org/kvmarm/20260623142443.648972-1-weilin.chang@arm.com/

Wei-Lin Chang (6):
  KVM: arm64: ptdump: Remove shadow ptdump files
  KVM: arm64: ptdump: Undo making the ptdump code mmu aware
  KVM: arm64: ptdump: Fix UAF when mmu->pgt is freed
  KVM: arm64: ptdump: Factor out initialization of
    kvm_ptdump_guest_state
  KVM: arm64: ptdump: Extract kvm_ptdump_guest_open() from canonical
    ptdump path
  KVM: arm64: ptdump: Introduce the shadow ptdump file

 arch/arm64/include/asm/kvm_host.h |   5 +-
 arch/arm64/include/asm/kvm_mmu.h  |   4 -
 arch/arm64/kvm/nested.c           |  18 +--
 arch/arm64/kvm/ptdump.c           | 185 ++++++++++++++++++++----------
 4 files changed, 135 insertions(+), 77 deletions(-)

-- 
2.43.0


