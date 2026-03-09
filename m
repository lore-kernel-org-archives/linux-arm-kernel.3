Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E746EFCD82
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JkE9YbVHRlCAgOlJgdiFaRgqAD6IkuK18W1AKaNJPho=; b=nVrmtBBLjAMKImIv880UDLWbTF
	ym2zX21OZOm8LdSpy00HymX+d3L7QlAfsx1kDOQvvnV7b32Q/sKxkQoGOVB+4bWpYQNnSqw7BepdJ
	bWfRyZ05IhVAC7SNwa74yL7tysiBLHsOG4KKH1wZDKUlqARP4Go7ZVSF7h0Yq8BGzyE/kRm+nJEuY
	hZEQcU2Xwc00lNtkK0NbF1NW4nwEOEhC3DMm/09ZrqnK9T52TAu6qaaTPF2TckcT6olFUHQ73U5tJ
	Qh4eEnlohv545WM8yiHP0WJPiqiQyKlB2pY1NIYnhqavksYgF+YC0NgwFwJhSMDAdn/QkTFQz8USq
	gfMlPDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXpM-000000075Fd-2Sfa;
	Mon, 09 Mar 2026 10:27:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXpK-000000075FE-0L6G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:27:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B678043929
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Mar 2026 10:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80696C4CEF7;
	Mon,  9 Mar 2026 10:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773052025;
	bh=9j2Aki75Xq2R0K0rBVeN5S4byHjjWMPEXb1/HloQCQs=;
	h=From:To:Cc:Subject:Date:From;
	b=AA83fQ8hiRPciaUr/DFWygfHqj8E3x0dtQ/9sVgM13e+mIYj42DD0U9diKz4o++tA
	 q1KJM+ndJp6VwxBmYnENEkqRF7kyOTUJLunktj3qzQZPJTgJgjmC61CU39N3uUcJ0z
	 CKNEqoLvAwXnWbVWSjQNTL8shgk1FTOU5p5FoClcFl/UtAHmqfIw6PU8c5JLwLtilk
	 vQ5azLpihR3rqDo9gPPhf9rj398sGGk9t1GB39iLoQXaDnFDkb8kIp0oGArxkqZLAo
	 0pxtzbIALdm9KxIUoQBIbnpCWp+jyQMOeaZEAMmiFp4+7pzvv4rxZ7PioI2bVQ9P/s
	 qGAQ5d4jy1oEQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [PATCH v3 0/3] Enforce host page-size alignment for shared buffers
Date: Mon,  9 Mar 2026 15:56:22 +0530
Message-ID: <20260309102625.2315725-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_032706_158696_A6BFC266 
X-CRM114-Status: GOOD (  18.45  )
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


Hi all,

This patch series addresses alignment requirements for buffers shared between
private-memory guests and the host.

When running private-memory guests, the guest kernel must apply additional
constraints when allocating buffers that are shared with the hypervisor. These
shared buffers are also accessed by the host kernel and therefore must be
aligned to the host’s page size.

Architectures such as Arm can tolerate realm physical address space PFNs being
mapped as shared memory, as incorrect accesses are detected and reported as GPC
faults. However, relying on this mechanism alone is unsafe and can still lead to
kernel crashes.

This is particularly likely when guest_memfd allocations are mmapped and
accessed from userspace. Once exposed to userspace, it is not possible to
guarantee that applications will only access the intended 4K shared region
rather than the full 64K page mapped into their address space. Such userspace
addresses may also be passed back into the kernel and accessed via the linear
map, potentially resulting in a GPC fault and a kernel crash.

To address this, the series introduces a new helpers,
mem_decrypt_granule_size() and mem_decrypt_align(), which allows callers to
enforce the required alignment for shared buffers.


Changes from v2:
* Rebase to latest kernel
* Consider swiotlb always decrypted and don't align when allocating from swiotlb.

Changes from v1:
* Rename the helper to mem_encrypt_align
* Improve the commit message
* Handle DMA allocations from contiguous memory
* Handle DMA allocations from the pool
* swiotlb is still considered unencrypted. Support for an encrypted swiotlb pool
  is left as TODO and is independent of this series.


Aneesh Kumar K.V (Arm) (3):
  dma-direct: swiotlb: handle swiotlb alloc/free outside
    __dma_direct_alloc_pages
  swiotlb: dma: its: Enforce host page-size alignment for shared buffers
  coco: guest: arm64: Add Realm Host Interface and hostconf RHI

 arch/arm64/include/asm/mem_encrypt.h |  3 ++
 arch/arm64/include/asm/rhi.h         | 24 ++++++++++++
 arch/arm64/include/asm/rsi.h         |  2 +
 arch/arm64/include/asm/rsi_cmds.h    | 10 +++++
 arch/arm64/include/asm/rsi_smc.h     |  7 ++++
 arch/arm64/kernel/Makefile           |  2 +-
 arch/arm64/kernel/rhi.c              | 53 +++++++++++++++++++++++++
 arch/arm64/kernel/rsi.c              | 13 +++++++
 arch/arm64/mm/mem_encrypt.c          | 27 +++++++++++--
 drivers/irqchip/irq-gic-v3-its.c     | 20 ++++++----
 include/linux/mem_encrypt.h          | 12 ++++++
 kernel/dma/contiguous.c              | 10 +++++
 kernel/dma/direct.c                  | 58 ++++++++++++++++++++++++----
 kernel/dma/pool.c                    |  4 +-
 kernel/dma/swiotlb.c                 | 21 ++++++----
 15 files changed, 237 insertions(+), 29 deletions(-)
 create mode 100644 arch/arm64/include/asm/rhi.h
 create mode 100644 arch/arm64/kernel/rhi.c

-- 
2.43.0


