Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF57C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 09:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b6y0XLWFts4ocHCR2uGkK2oUT/pf9rkW+qj40pMNlOw=; b=3I8FLhJzDRmUKZGGm9RpDQeY/l
	NrEEF+4NflW6wd0B++HDZFPiexulkUtecCaNUT3Bj25lLVz3Hrmq0OZcyXy3JsbiWw/PhanH5f7am
	7Cwx+eU2XERia3Tw5OtVEv9pdKE1+3mAbGluzp3di4iClDZ9YZ6zXBl9+Sp3RlYpt1lpWdhQDImBO
	BEIGvz0GyvizKUlqoNd87YA6Ks2jQARagv/CFGxnzrTg14P107SE1Nn9JurSgtJrh2Jl0ASfjsdE8
	m0sfG58THmyKlTYTtQVLJpsc6ZgfkoqRI5MOLF7H4yMh8w0Tqv1B28hhdtiLWtfqN81JlvOtkK79i
	h1N8VmpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1sv-0000000Cy5E-0Nuq;
	Fri, 25 Sep 2026 09:06:25 +0000
Received: from out-55.mta1.migadu.com ([95.215.58.55] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1ss-0000000Cy3Q-0tep
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 09:06:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZITxk4HraLSo7l0zjsQliO/uP2wjwsUcYzQpwin/yRQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790327180; v=1; x=1790931980;
 b=JmohhVcgVsqSBcDGuC0e3WvDKsInmcrppCdikxY7yTDi3/3w03BhkfPu0pHcx81gGqgCOCDl
 7h2PYoUVNmUFbGciFDcsBSxXWq+ZyalOMblAnjazazweBO1TB48ZlmJt3rgb5f4XIhSSvK9vdKv
 edlFfy1HQQIXzB0jhdtWUCxs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9160c77694c73bbb;
	Fri, 25 Sep 2026 09:06:20 +0000
X-Mizu-Trace-ID: 9160c77694c73bbb
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
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] KVM: arm64: Fix HCR_EL2 for non-protected VMs in pKVM
Date: Fri, 25 Sep 2026 10:06:15 +0100
Message-Id: <20260925090619.852995-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_020622_473054_A15A2C3E 
X-CRM114-Status: GOOD (  11.63  )
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

In pKVM, EL2 sets a non-protected VM's HCR_EL2 in pkvm_vcpu_reset_hcr(),
which covers only part of vcpu_set_hcr(), and takes only TWI, TWE and
VSE from the host. As a result, an AArch32 VM can't run, a VM can read
GMID_EL1 or execute a TLBI OS its ID registers hide, and the host's TVM,
VI and VF never reach it.

Rather than add each missing bit at EL2, the third patch uses the host's
HCR_EL2 on every entry, except for the bits EL2 owns. A bit added to
vcpu_set_hcr() then reaches pKVM with no change at EL2, unless it opens
state EL2 doesn't switch, in which case it goes in PKVM_HCR_EL2_OWNED,
as ATA and DCT do.

The third patch depends on the first: once TTLBOS reaches the VM, a
trapped TLBI OS from a non-nested guest hits a WARN in
handle_tlbi_el1(), as it does without pKVM.

The last patch adds a selftest that checks a feature hidden in an ID
register is UNDEFINED in the guest. Its TLBI OS case fails in pKVM
before the third patch.

VSE still comes from the host as before. Syncing it back after delivery
is a separate fix [1].

Based on Linux 7.3-rc4 (93f51579e7df2).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260921101030.1231605-1-fuad.tabba@linux.dev/

Fuad Tabba (4):
  KVM: arm64: Don't WARN on an unsupported TLBI OS from vEL1
  KVM: arm64: Clear HCR_EL2.RW for 32-bit non-protected vCPUs
  KVM: arm64: Use the host's HCR_EL2 for non-protected VMs in pKVM
  KVM: arm64: selftests: Check a feature hidden in an ID register is
    UNDEF

 arch/arm64/include/asm/kvm_arm.h              |   1 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  13 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |   7 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  24 ++-
 arch/arm64/kvm/sys_regs.c                     |   7 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/hidden_features.c     | 184 ++++++++++++++++++
 7 files changed, 222 insertions(+), 15 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/hidden_features.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.39.5


