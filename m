Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BB0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qxmgc5GPf6s07cMie5Yt6ddiOaa1wIdJN50dxg5fYvY=; b=YwtCL+N8pVt+mytCcIbwFXSS3b
	NNqupRJvJc42O116GayPDpQzEQUWSgPp6KRuoIRIL5PqSZvHA9aTJRY7F+VCCao+Qs8svTk2OdGqL
	v+Qs5mmttTqRWoIghuEIdQud47oAezst4JzH77IW1jStEKfC5AzeP5gUK76bnw/2RMw0JMwEltzFF
	tYac3BQdV3x0C5aBG2ahfJ24ESlpIBRJizB978pjTJtHUFDIzAKxs0GTXGsU2Im247rIQ2t6xJFhX
	6Wc6y3E98eN46dWbvtuuCIgCVZUMBAMjoj/7Ej6ohqUAn0vHupy5JX/TkBspptMlxyddkqcwC34FI
	dI2IbGdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIQ7-00000004d9r-1Ywj;
	Thu, 02 Jul 2026 14:29:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIQ4-00000004d8f-154i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 14:29:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95752359D;
	Thu,  2 Jul 2026 07:29:28 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB60E3F673;
	Thu,  2 Jul 2026 07:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783002573; bh=hjgzRuRixsji8jEKTlp+FzYkQ4qNfZ44rOs1Pa2QDhE=;
	h=From:To:Subject:Date:From;
	b=hcPfanP9lfgG7RZ/Gbwj9CacIVyBHBgGEX04YYhJlhPyRK19zIgvpcN0502pkPTeJ
	 A0RPfX+tHgtYvVV44MwVqxDuTpfR765q33yWAtMbaH0IzhU2qEOH15m7aoMHLCQakD
	 vCtqfOOcHNQBN6TmE1QFz3TnvWCAeohrD0tirB6k=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: pbonzini@redhat.com,
	kvm@vger.kernel.org,
	seanjc@google.com,
	david.hildenbrand@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	fuad.tabba@linux.dev,
	mark.rutland@arm.com
Subject: [RFC PATCH 0/3] KVM: Dirty page logging for guest_memfd-only memslots
Date: Thu,  2 Jul 2026 15:29:09 +0100
Message-ID: <20260702142912.6395-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_072936_405776_487AD491 
X-CRM114-Status: GOOD (  18.09  )
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

The memory represented by guest_memfd-only memslots
(kvm_memslot_is_gmem_only() is true) is shared with userspace, which can
freely mmap it and access it. The only thing that is preventing dirty page
logging for such memslots is that KVM doesn't allow slots backed by
guest_memfd to have their flags changed; they can only be created and
deleted.

When KVM changes the flags for a memslot, it is possible for one reader
handling a guest fault to observe the old memslot, with the old flags, and
another reader to observe the new memslot, with the new flags. With the way
a guest_memfd file keeps track of the associated memslots, it is impossible
to avoid the WARN_ON_ONCE in __kvm_gmem_get_pfn() when one of the two
memslot pointers that the readers observe doesn't match the memslot pointer
stored in the file bindings.

To get around this, I decided to change the way guest_memfd keeps track of
the associated memslots: instead of an xarray of memslot pointers, use an
xarray which stores the memslot id (id and as_id, to be more precise),
which can be used to search for the memslot in the active memslots array.
Whenever guest_memfd wants to access a memslot, it deferences the
kvm->memslots RCU pointer under the RCU read lock, similar to how guest
faults are handled, or how the MMU notifiers work. All of this is
implemented in patch #1, "KVM: guest_memfd: Use memslot id to keep track of
associated memslots".

Building on that, toggling the KVM_MEM_LOG_DIRTY_PAGES flag for
guest_memfd-only memslots is implemented in patch #2, "KVM: Implement dirty
page logging for guest_memfd-only memslots". This is gated by a KVM
capability because it is a userspace visible change in behaviour.

The capability is also architecture specific, not because this is something
tied to a specific architecture, but because when I was testing the series
on arm64 I realized that the arm64 fault handling code required a minor
change, and I don't know enough about the other architectures to tell if
any changes are needed for them.

Just FYI, this is an RFC so it goes without saying that I'm open to any
suggestions, and I'll redo the whole thing if there's a better solution.

Tested the series using kvmtool on an arm64 machine, with guest_memfd
support added, as well as two command line arguments: --enable-dirty-log
and --disable-dirty-log. The arguments toggle the KVM_MEM_LOG_DIRTY_PAGES
memslot flag, they don't read or otherwise touch the list of dirty pages in
any way. Pushed a branch at [1].

[1] https://gitlab.arm.com/linux-arm/kvmtool-ae/-/tree/guest-memfd-v1-wip4-dirty-page-logging

Alexandru Elisei (3):
  KVM: guest_memfd: Use memslot id to keep track of associated memslots
  KVM: Implement dirty page logging for guest_memfd-only memslots
  KVM: arm64: Allow dirty page logging for guest_memfd-only memslots

 Documentation/virt/kvm/api.rst |   9 ++
 arch/arm64/kvm/arm.c           |  22 +++++
 arch/arm64/kvm/mmu.c           |   3 +-
 include/linux/kvm_host.h       |  15 +++
 include/uapi/linux/kvm.h       |   1 +
 virt/kvm/guest_memfd.c         | 165 ++++++++++++++++++++++++++++++---
 virt/kvm/kvm_main.c            |  44 ++++-----
 virt/kvm/kvm_mm.h              |  11 +++
 8 files changed, 232 insertions(+), 38 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.0


