Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D83CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4r8pNWdz3S545O1KpgFHRR3jsSCx1Q8XXamRGdNK5Bs=; b=HmwTgYtzoPzRpE1zfrCJqvAjAZ
	HFW35PgbMex3YjzeqRZkpM/SswW/B1BtaIvnV7/xaJaQEAvuv1g2FfcZctQhQ/Wt/s+mteuK09kBH
	r5MRn3ui3dF2DjNwGE/PQ250cNoxkRtPTh7G/xYvNbtRGI3LXOzrbjL7De42SORC7W5usuj+262h0
	AHtrl4Yh1KCb0xfZKfpVlih4zpN2NBs6KCNwSgnxORDtv6dxXABB+M6DpOE02PMmUCf2DOeYR+QZq
	48Is1B0rF0RXrmE4g6SPgu6w6RnGhbEt5fwDZsZ4XMwu44xsmiF5B3fJVApgUDowBCd44l0f54IB1
	wkQzfVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEC-00000000tJx-2uMd;
	Mon, 28 Sep 2026 15:25:16 +0000
Received: from out-251.mta0.migadu.com ([2001:41d0:1004:224b::fb] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEA-00000000tIi-12hX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:25:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=s41ieSguAC04yFXFLtnQHHE7zfUrtIP1s8AWwaR+J+o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790609110; v=1; x=1791213910;
 b=iuYFGXupSLbrHdpNaH+cCxQyP6rF0HJ3Wvkf2Td3W56whcQIGUDnflIqpx0owicFjNchRz0b
 RsBdXStH2HpXtIly1j8Zhxw53AgoU1E1lfHCdqJZ1jbmUjY5DZ52zGSfgSnE4i/6wEITqdfoczR
 ZPUJk7DP1dVUKbDu+xZkvh9A=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8f5f8dc529bfd712;
	Mon, 28 Sep 2026 15:25:09 +0000
X-Mizu-Trace-ID: 8f5f8dc529bfd712
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
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/10] KVM: arm64: Nested stage-2 walk error handling and other small fixes
Date: Mon, 28 Sep 2026 16:24:57 +0100
Message-Id: <20260928152507.2116110-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_082514_431985_57DD09C0 
X-CRM114-Status: GOOD (  11.53  )
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

Small KVM/arm64 fixes that came out of reviewing Karl's SMCCC filter
series [1], and it just kept growing.

The first two are WARNs that userspace or a guest can trigger: the
SMCCC filter one on an allocation failure userspace can force with a
memory cgroup limit, which Sashiko raised [2], the nested one when an
L1 guest programs an invalid VTCR_EL2. Patches 3 and 4 are the same
walk's return values. With an invalid VTCR_EL2 or a stage-2 descriptor
KVM can't read, AT S12E{0,1}{R,W} was retried forever instead of
retiring with the fault in PAR_EL1. Reporting the unreadable descriptor
as a Data Abort instead, for the stage-1 walks too, is a separate
change I'll send later. Patch 5 extends the AT selftest to cover the
SL0 case.

The three documentation patches fix identifiers in api.rst that don't
exist anywhere in the tree, and the last two fix selftest leaks.

Based on Linux 7.3-rc3 (fd73f4a665989; also applies to torvalds/master
fd179f8a05be3).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260829054856.70549-1-kmehltretter@gmail.com/
[2] https://lore.kernel.org/all/20260829055809.29AD31F000E9@smtp.kernel.org/

Fuad Tabba (10):
  KVM: arm64: Don't WARN on SMCCC filter reserved range allocation
    failure
  KVM: arm64: nv: Don't WARN on an invalid VTCR_EL2
  KVM: arm64: nv: Don't loop on AT S12E{0,1}{R,W} with an invalid
    VTCR_EL2
  KVM: arm64: nv: Return a failed stage-2 descriptor read as a fault
  KVM: arm64: selftests: Test AT S12E1R with an invalid VTCR_EL2.SL0
  Documentation: KVM: Fix the name of the SMCCC filter attribute
  Documentation: KVM: Fix the name of KVM_ARM_SET_COUNTER_OFFSET
  Documentation: KVM: Fix the name of KVM_ARM_FEATURE_ID_RANGE_IDX
  KVM: arm64: selftests: Free the VMs in smccc_filter and psci_test
  KVM: arm64: selftests: Free the thread arrays in vgic_lpi_stress

 Documentation/virt/kvm/api.rst                |  6 ++--
 arch/arm64/kvm/hypercalls.c                   |  2 +-
 arch/arm64/kvm/nested.c                       | 11 +++-----
 tools/testing/selftests/kvm/arm64/at.c        | 28 +++++++++++++++++++
 tools/testing/selftests/kvm/arm64/psci_test.c |  5 +++-
 .../selftests/kvm/arm64/smccc_filter.c        |  2 ++
 .../selftests/kvm/arm64/vgic_lpi_stress.c     |  3 ++
 7 files changed, 45 insertions(+), 12 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5


