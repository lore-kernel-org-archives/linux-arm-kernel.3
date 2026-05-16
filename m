Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E702CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vc0G3fVTDA0KoBlVty6FVQPgJehqicMqVBRcne/BwdM=; b=KrbxV2XyGysGG337jMJHdrxlpi
	zKt+DukgTMvIK2ks2c9J3z/2Y78/AEFp2L2zMARWLzgS7y0AaUROyzWXHQj3kMj45rNqBQlX6JMpP
	wzayPEZoGdvBDZTRBz4+stRPq5LFkBIfABMN2t8xzNTstJhXNwME9CWCzG9Jrls/qmuIdIuPTIE11
	fNGBQxPhxt9F8pKs+6O66LB0jZqGkKJc9WhteTTEy/LjvdOgTSavmULHHE+R869KVAlz67zQvpjT5
	NKizGLUU2iOcdoOfANzJISw5DdhDxnQCeqn4xfEnPQSIr9o5kZ8VmqvtQ8G8N3DPnInZym1sAm6C7
	w8W0LfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJms-0000000BCI0-3ipC;
	Sat, 16 May 2026 18:30:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJmn-0000000BCG9-3J44
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 18:30:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E9861BF3;
	Sat, 16 May 2026 11:30:43 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 023AD3F85F;
	Sat, 16 May 2026 11:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778956248; bh=NPq7c3O7m9YoMQfFgefKlCXS40W630c66ivNjwX7VnY=;
	h=From:To:Cc:Subject:Date:From;
	b=X3AVoYMic76EhjPA5QnkayYsO/uqgN8aSmHiHRkVLmdd4+gKne8/4SxtqHitV5VIx
	 dR79teEEA0ZcD5I9q2lArcEV20ly23EVs3HPgOHZ+4qtsomrkBjl7lvv3Q00yg1i4R
	 60pEIp5GvT2zSy+ff9ZHmAN7EC8SaBkbkzOjSYNo=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 0/9] KVM: arm64: selftests: Basic nested guest support
Date: Sat, 16 May 2026 19:29:54 +0100
Message-ID: <20260516183003.799058-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_113053_957234_220E6724 
X-CRM114-Status: GOOD (  10.12  )
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

This is v3 of adding basic support for running nested guests (L2) in
kselftest. This time a framework for enabling stage-2 in the guest is
added, including the s2_mmu struct, s2 translation control setup, and
a stage-2 page table generator. Similar to L2 vCPU management, all
stage-2 work is done in the guest instead of userspace.

An additional shadow_stage2 test is added which leverages the framework
to run L2 with stage-2 enabled.

* Changes from v2 [1]:

  - Update vm_paddr_t to gpa_t, vm_vaddr_t to gva_t.

  - Added framework for enabling stage-2 in the guest.

  - Added shadow_stage2 test.

Thanks!

[1]: https://lore.kernel.org/kvmarm/20260412142216.3806482-1-weilin.chang@arm.com/

Wei-Lin Chang (9):
  KVM: arm64: selftests: Add GPR save/restore functions for NV
  KVM: arm64: selftests: Add helpers for guest hypervisors
  KVM: arm64: selftests: Add hello_nested basic NV selftest
  KVM: arm64: selftests: Enhance hello_nested test
  KVM: arm64: selftests: Add shadow_stage2 test
  KVM: arm64: selftests: shadow_stage2: Allocate L2 stack from dedicated
    pool
  KVM: arm64: selftests: shadow_stage2: Check supported stage-2 granule
    size
  KVM: arm64: selftests: Add infrastructure for using stage-2 in guest
  KVM: arm64: selftests: shadow_stage2: Turn on stage-2 translation for
    the nested guest

 tools/testing/selftests/kvm/Makefile.kvm      |   5 +
 .../selftests/kvm/arm64/hello_nested.c        | 134 +++++++++
 .../selftests/kvm/arm64/shadow_stage2.c       | 165 +++++++++++
 .../selftests/kvm/include/arm64/nested.h      |  85 ++++++
 tools/testing/selftests/kvm/lib/arm64/entry.S | 137 +++++++++
 .../selftests/kvm/lib/arm64/hyp-entry.S       |  77 +++++
 .../testing/selftests/kvm/lib/arm64/nested.c  | 264 ++++++++++++++++++
 7 files changed, 867 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/hello_nested.c
 create mode 100644 tools/testing/selftests/kvm/arm64/shadow_stage2.c
 create mode 100644 tools/testing/selftests/kvm/include/arm64/nested.h
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/entry.S
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/hyp-entry.S
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/nested.c

-- 
2.43.0


