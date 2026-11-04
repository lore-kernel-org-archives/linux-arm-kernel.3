Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFEC606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BLhwbz7Y;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YFufWwhi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tVLelWtOiKs5gOhdKa6hRa5lDxrUmzH5vqTxLffuKAk=; b=BLhwbz7Y8algrmQF0qsUx3DbpY
	7DOGW5zwBFwy48cpZrqKcI6O7gE+gN1KC/dxgqCYBAVZtBNCDjRzE4TSYxxz0NWkOJI0IrE1bwUNM
	va7+QePiLv/ZMysyY+gPR2oF9owY5KUO/lhTOw51wefzMOPLk+EHg4oDKSIqJ2Fm0l72G4ghf6GQa
	SEPYfP607iGelqb3zxGEbj5gqQ+zbiEz6T/zhYWENst59B5Er6mmgHRlrDww1eyFtFZW8LGhi3Oe5
	pBpNMDoayAqfU0BNjFZ9FUmR1TQqBRVboy2VihVI6cZIGpey49M1S63Y8Fi+fVpybNps0hDralVUp
	QlzfiacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWfu-00000004l0S-0M57;
	Wed, 04 Nov 2026 08:48:54 +0000
Received: from out-248.mta1.migadu.com ([95.215.58.248] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWfq-00000004l01-27PL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:48:52 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Le2HnV1cWaxWKIp2IUyJdv0RZTylQe/ImxfQDvmHubg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793782127; v=1; x=1794386927;
 b=YFufWwhil8zG4Fa3kITYq+rKwV4Ack7CtQ+xPrM9cvVg58wzeiLIp5Lo1qFw/deOO5V6JwDz
 XJZz9vt5rSdTSLc4dkVk7ylGm5Q4ZosUvNWaIgf/OGq46+uLf41F1APHXRyRixWipHxHv/2fahj
 edGLy5mExidRDZqzasyUF760=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 293ca65f55a86fc9;
	Wed, 04 Nov 2026 08:48:47 +0000
X-Mizu-Trace-ID: 293ca65f55a86fc9
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/16] KVM: arm64: selftests: Tests for protected VMs
Date: Wed,  4 Nov 2026 08:48:26 +0000
Message-ID: <20261104084842.132944-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_004850_695135_F78BEFC0 
X-CRM114-Status: GOOD (  14.23  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

This series adds selftests for protected VMs. A test skips on a host
without pKVM, and so does any case where the host doesn't have the
required feature, e.g., PtrAuth, SVE or hugetlb pages.

A couple of points:

- Each area gets its own test rather than cases folded into existing
  tests such as psci_test, hypercalls, set_id_regs, etc. A protected
  guest requires its own boot path, and has to share the ucall pool
  before its first ucall. On top of that, a protected guest gets the
  opposite result for many of those tests' checks.

- pkvm_exceptions skips its breakpoint, watchpoint and single-step cases
  while a protected guest's ID_AA64DFR0_EL1.DebugVer is 0. pkvm_id_regs
  reads the same field to choose between the hidden and the exposed
  debug view. With the patch that adds self-hosted debug to protected
  guests [1], both tests run the debug cases with no change.

The series is structured as follows:

  01:     external_aborts: an abort injected before a vCPU's first run.
  02-04:  Generic selftest changes: creating a protected VM, the pKVM
          function IDs and the ucall pool's address.
  05-06:  Protected-VM library: boot trampoline and helpers.
  07-16:  The tests, one per area.

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261102093950.2922035-1-fuad.tabba@linux.dev/

Fuad Tabba (16):
  KVM: arm64: selftests: Inject an abort before a vCPU's first run
  KVM: selftests: Allow arm64 tests to create protected VMs
  tools: arm-smccc: Add the pKVM memory sharing function IDs
  KVM: selftests: Export the ucall pool's guest physical address
  KVM: arm64: selftests: Add protected-VM boot trampoline
  KVM: arm64: selftests: Add protected-VM library helpers
  KVM: arm64: selftests: Add pkvm_host_abi host-interface test
  KVM: arm64: selftests: Add pkvm_psci multi-vCPU PSCI test
  KVM: arm64: selftests: Add pkvm_mem_share hypercall test
  KVM: arm64: selftests: Add pkvm_smccc hypercall test
  KVM: arm64: selftests: Add pkvm_id_regs register and trap test
  KVM: arm64: selftests: Add pkvm_vcpu_regs register-state test
  KVM: arm64: selftests: Add pkvm_irq interrupt test
  KVM: arm64: selftests: Add pkvm_isolation host-access test
  KVM: arm64: selftests: Add pkvm_lifecycle teardown test
  KVM: arm64: selftests: Add pkvm_exceptions debug and SError test

 tools/include/linux/arm-smccc.h               |  22 +
 tools/testing/selftests/kvm/Makefile.kvm      |  12 +
 .../selftests/kvm/arm64/external_aborts.c     |  21 +
 .../selftests/kvm/arm64/pkvm_exceptions.c     | 261 ++++++++
 .../selftests/kvm/arm64/pkvm_host_abi.c       | 428 ++++++++++++
 .../selftests/kvm/arm64/pkvm_id_regs.c        | 306 +++++++++
 tools/testing/selftests/kvm/arm64/pkvm_irq.c  | 268 ++++++++
 .../selftests/kvm/arm64/pkvm_isolation.c      | 225 +++++++
 .../selftests/kvm/arm64/pkvm_lifecycle.c      | 110 +++
 .../selftests/kvm/arm64/pkvm_mem_share.c      | 394 +++++++++++
 tools/testing/selftests/kvm/arm64/pkvm_psci.c | 632 ++++++++++++++++++
 .../testing/selftests/kvm/arm64/pkvm_smccc.c  | 117 ++++
 .../selftests/kvm/arm64/pkvm_vcpu_regs.c      | 221 ++++++
 .../selftests/kvm/include/arm64/pkvm.h        |  74 ++
 .../selftests/kvm/include/ucall_common.h      |   1 +
 tools/testing/selftests/kvm/lib/arm64/pkvm.c  | 245 +++++++
 .../selftests/kvm/lib/arm64/pvm-entry.S       |  58 ++
 tools/testing/selftests/kvm/lib/kvm_util.c    |   5 +-
 .../testing/selftests/kvm/lib/ucall_common.c  |   9 +-
 19 files changed, 3406 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_exceptions.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_host_abi.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_id_regs.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_irq.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_isolation.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_lifecycle.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_mem_share.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_psci.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_smccc.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_vcpu_regs.c
 create mode 100644 tools/testing/selftests/kvm/include/arm64/pkvm.h
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/pkvm.c
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/pvm-entry.S


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


