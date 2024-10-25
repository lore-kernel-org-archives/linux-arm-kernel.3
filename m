Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF69D149E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 19:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pqtm4O409KQs+qC4qHIqpJ6fPA7Q/9J5YGrNZs6ZYaM=; b=imtTNq08Ch3ldFgMXiA8jkwBVY
	WiYb6kFC+crRYC39w7oW5VgxngikYCZlVq6t4thTVY5F9kD3R/DJFGMfnBQWXkzVdCLnDLrdtY4uc
	A8jsHbPXuL1iy2DPu1L+qUhe35m5bjLndLyn6E7HOZ2jtdg4/+ueQPLUlUK3tOBn744YwtCQ/CFpw
	fe8PfnOWxfMg+z9s0EXVYYN0Szjb1Wn2kR1pdy1JF1cKSCbOVW1aOVgprDQ+H/fIf/tmuZSeoxzZG
	7+rHAyrHiyNt+0quoT7wLaPJIaZqoYjhVbpjHPaGbh07qLG5jqiVaJWeTEYzvm+lwL5+g9aUBLE2K
	T/m2zDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PYs-00000004t2s-2dYF;
	Fri, 25 Oct 2024 19:01:26 +0000
Received: from out-184.mta1.migadu.com ([2001:41d0:203:375::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Oyn-00000004mlw-1854
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 18:24:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729880646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pqtm4O409KQs+qC4qHIqpJ6fPA7Q/9J5YGrNZs6ZYaM=;
	b=fJ6IvbC0WxjXQzJ+inEGwLweQ63h8mR57RCeZehUSbTWuHuZIv6YbrO7r5pnt003YZdFuh
	3ycg0wI8sZFg6qmD2W3SEI6M+8Vq1NmJ89A6c44Ssk9ajH6ooZ6X7twqbNoZGvUV3RWt6I
	hI5U3Tyg6SgvnQYDjM3HQAlFMx+CGAk=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v4 00/18] KVM: arm64: nv: Support for EL2 PMU controls
Date: Fri, 25 Oct 2024 18:23:35 +0000
Message-ID: <20241025182354.3364124-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_112409_724830_BC8E4804 
X-CRM114-Status: UNSURE (   5.76  )
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

v3 -> v4:
 - Align sysreg definitions with DDI0601 2024-09
 - Fix 'accessible' counter mask construction
 - Fix MDCR_EL2.MTPME RES0 logic

v3: https://lore.kernel.org/kvmarm/20241007174559.1830205-1-oliver.upton@linux.dev/

Marc Zyngier (1):
  KVM: arm64: Extend masking facility to arbitrary registers

Oliver Upton (17):
  arm64: sysreg: Describe ID_AA64DFR2_EL1 fields
  arm64: sysreg: Migrate MDCR_EL2 definition to table
  arm64: sysreg: Add new definitions for ID_AA64DFR0_EL1
  KVM: arm64: Describe RES0/RES1 bits of MDCR_EL2
  KVM: arm64: nv: Allow coarse-grained trap combos to use complex traps
  KVM: arm64: nv: Rename BEHAVE_FORWARD_ANY
  KVM: arm64: nv: Reinject traps that take effect in Host EL0
  KVM: arm64: nv: Honor MDCR_EL2.{TPM, TPMCR} in Host EL0
  KVM: arm64: nv: Describe trap behaviour of MDCR_EL2.HPMN
  KVM: arm64: nv: Advertise support for FEAT_HPMN0
  KVM: arm64: Rename kvm_pmu_valid_counter_mask()
  KVM: arm64: nv: Adjust range of accessible PMCs according to HPMN
  KVM: arm64: Add helpers to determine if PMC counts at a given EL
  KVM: arm64: nv: Honor MDCR_EL2.HPME
  KVM: arm64: nv: Honor MDCR_EL2.HLP
  KVM: arm64: nv: Apply EL2 event filtering when in hyp context
  KVM: arm64: nv: Reprogram PMU events affected by nested transition

 arch/arm64/include/asm/kvm_arm.h     |  29 ---
 arch/arm64/include/asm/kvm_emulate.h |   5 +
 arch/arm64/include/asm/kvm_host.h    |  21 +-
 arch/arm64/kvm/emulate-nested.c      | 291 ++++++++++++++++-----------
 arch/arm64/kvm/nested.c              |  54 ++++-
 arch/arm64/kvm/pmu-emul.c            | 143 +++++++++++--
 arch/arm64/kvm/sys_regs.c            |  15 +-
 arch/arm64/tools/sysreg              |  76 ++++++-
 include/kvm/arm_pmu.h                |  18 +-
 9 files changed, 465 insertions(+), 187 deletions(-)


base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
-- 
2.47.0.163.g1226f6d8fa-goog


