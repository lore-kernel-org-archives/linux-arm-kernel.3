Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45432CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RUmfXKtZNXvDYlvxIFkDBez4IbtIUvHffUquQ5jDbQ0=; b=zOisiS2ebMOH0NJwalfpWmO5sI
	zD2yscYEvv5NhkcbaQZ7a0Rwf087wSx2PrnAu8CGbNwfFh9xe4+boJxc5dWmgCMVIbUJqA3/uTzCW
	ck+16/qEtBXDxLPwsHePWIOOmjsfd5cMgAN1g3jMozJpr+bphjvEJlF3WmHGN9BbCKFI1NFYKei56
	eDxahTXSS84ZpdFYE0PTYXIFdXUcfEXXyzcisoD1JckI8mN7ZYfkci36QJntoKVjQic4pJUzwaim7
	taHKUgpUTYBrXtzVl5pH463t9YnxMeJsjElfmaaphWAyfbPIWT8ziGpYnL80frYWtZ0bOl7kORwh/
	pmB2h0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInIh-00000007Usb-154Y;
	Mon, 19 Oct 2026 13:21:15 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInIc-00000007Url-1iaz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:21:13 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=oEZCYVkZJ7MChk8kB7z/mT2HN0rQx4gixCr14FuhrgU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792416067; v=1; x=1793020867;
 b=Q9xvosEGHrBGdPQtrwCirPVplZXbX6wuys7UVlNjr0n1ZmtIe0NNZV66oKwVryUoxYiig20S
 IBFbS3M/15/SoRL0cXZcRwaH71lJMzk1NfwC0gqE4kSPZWSLdG8zl/CMl8ALSmCYOaSRRkH/PPV
 216uI1oPzHTHNQAc/mrvyLnw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8616446d7d753be6;
	Mon, 19 Oct 2026 13:21:07 +0000
X-Mizu-Trace-ID: 8616446d7d753be6
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Price <steven.price@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	David Hildenbrand <david@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] KVM: arm64: Fix stale MTE tags reaching a guest
Date: Mon, 19 Oct 2026 14:21:00 +0100
Message-ID: <20261019132103.3836646-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_062111_692769_B43F0DF7 
X-CRM114-Status: UNSURE (   9.08  )
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

Hi folks,

Three fixes for hugetlb and THP pages that reach an MTE guest without
their tags cleared, so the guest can read whatever tags the pages'
previous owners left.

The first clears the whole of a hugetlb folio before marking it tagged,
rather than only the pages being mapped. The second does the same when
KVM_ARM_MTE_COPY_TAGS copies tags into a page. The third sanitises when
a permission fault installs a THP block, and runs the VM_MTE_ALLOWED
check on permission faults too. A VMM that maps guest memory with
PROT_MTE isn't affected, as faulting that memory into its mapping clears
the tags first. QEMU and kvmtool map it without.

I have a reproducer that reads the previous owner's tag from 511 of 512
pages in each case. With any one patch applied, it reads none in that
patch's case.

Based on Linux 7.3-rc3 (fd73f4a665989; also applies to kvmarm/next
dd0bc00e3e920 with a three-way merge).

Cheers,
/fuad

Fuad Tabba (3):
  KVM: arm64: Clear the whole hugetlb folio when sanitising MTE tags
  KVM: arm64: Clear the whole hugetlb folio when storing MTE tags
  KVM: arm64: Sanitise MTE tags when a permission fault installs a
    mapping

 arch/arm64/kvm/guest.c | 11 +++++++----
 arch/arm64/kvm/mmu.c   |  7 ++++---
 2 files changed, 11 insertions(+), 7 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.47.3


