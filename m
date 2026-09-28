Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E7AC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eumLFs3pz+0Uy3yciaKk0uUQGj0SXHUlxCPWz5mKOJ4=; b=2I6xu7URty1bsCH2GqwnEwIsHT
	7DmNywV9cdtCzTWb2Bs8OyWKdf3HT50pUNlcHyETqfeaMdSC7FkV31cqxsTRkRw26yrIwCpL7BaMN
	7+qI4L78wVTv7JdrYI6hAIZi/TuvpMbXK7lzKF2qdAOqs06us8ZxmUcHFC2XJNMMcSIOy9P77ggoO
	Fo9B5tmgolvg5JNwhlOmPS/qUM7M7E9ZxOlfUM9wj0SSnlXvucPfYSSN5sy28c0ZA6muejmYjRZ8h
	amdQbU+dsTGiqwRPh4Gy4Av8DNsk/f/0KjM8i9GOUm6bnWuaI5BNDAZ++3s5cScJ5sTyb4zJLDEHx
	QD8w37Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB58V-0000000HTWY-0Sw3;
	Mon, 28 Sep 2026 06:46:51 +0000
Received: from out-39.mta1.migadu.com ([2001:41d0:203:375::27] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB58R-0000000HTUZ-2Zfk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:46:49 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=6ivHM1djiyNApPfmgTiRMC+kHX/ImCj+9xjrPFQgQi4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790578004; v=1; x=1791182804;
 b=aAnQlglhVL8NR8DwUi32fX0WPb1wl0Ov84kG0bRmcFLd96Rw9GW4BvqRo1BFn+y3NxaiRdcg
 K80AbHVpLRSkXwwcGMxQsASJTf4/LX4ModWu1+4SOun5CTEqkOS4qGnptr/ByeBW10UOXx/Ox8S
 5xtaQ3x2m8Tj9rYarXYR190s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id eace2c2eb089f675;
	Mon, 28 Sep 2026 06:46:44 +0000
X-Mizu-Trace-ID: eace2c2eb089f675
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
	Wei-Lin Chang <weilin.chang@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] KVM: arm64: Fix HCR_EL2 for non-protected VMs in pKVM
Date: Mon, 28 Sep 2026 07:46:39 +0100
Message-Id: <20260928064643.3265087-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_234647_937504_6300C9DE 
X-CRM114-Status: GOOD (  13.23  )
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

Changes since v1 [1]:
- Patch 3: take a list of host bits per VM type instead of the host's
  value minus the bits EL2 owns; drop the HCR_GPF definition (Marc).
- Patches 2 and 3: use the HCR_EL2_* names in added lines (Marc).
- Patches 1-3: reworded the messages, and the comment in patch 2
  (Marc).
- Patch 1: collected Wei-Lin's Reviewed-by.

In pKVM, EL2 sets a non-protected VM's HCR_EL2 in pkvm_vcpu_reset_hcr(),
which misses the RW, TID5 and TTLBOS handling of vcpu_set_hcr(), and
takes only TWI, TWE and VSE from the host. As a result, an AArch32 VM
can't run, a VM can read GMID_EL1 or execute a TLBI OS its ID registers
hide, and the host's TVM, VI and VF never reach it.

The second patch clears RW for an AArch32 vCPU. The third also takes
from the host, for a non-protected VM, the bits the host varies with the
VM's configuration or at runtime: VI, VF, TVM, TID2, TID4, TID5 and
TTLBOS. The rest stay EL2's, and a protected VM still takes only TWI,
TWE and VSE.

The third patch depends on the first: once TTLBOS reaches the VM, a
trapped TLBI OS from a non-nested guest hits a WARN in
handle_tlbi_el1(), as it does without pKVM.

The last patch adds a selftest that checks a feature hidden in an ID
register is UNDEFINED in the guest. Its TLBI OS case fails in pKVM
before the third patch.

VSE still comes from the host as before. Syncing it back after delivery
is a separate fix [2].

Based on Linux 7.3-rc4 (93f51579e7df2).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260925090619.852995-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20260921101030.1231605-1-fuad.tabba@linux.dev/

Fuad Tabba (4):
  KVM: arm64: Don't WARN on an unsupported TLBI OS from vEL1
  KVM: arm64: Clear HCR_EL2.RW for 32-bit non-protected vCPUs
  KVM: arm64: Use the host's HCR_EL2 for non-protected VMs in pKVM
  KVM: arm64: selftests: Check a feature hidden in an ID register is
    UNDEF

 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   9 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |   7 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  25 ++-
 arch/arm64/kvm/sys_regs.c                     |   7 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/hidden_features.c     | 184 ++++++++++++++++++
 6 files changed, 218 insertions(+), 15 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/hidden_features.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.39.5


