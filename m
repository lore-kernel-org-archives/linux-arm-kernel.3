Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3969D6B6A6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 16:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fiV9K3dtTr85noHw9X/hZxO5rZ4joptXXFrhuKkJI2w=; b=DpOZ+8x1MZET+pP6bzYCgwL+9X
	HDgUVzah56Ko34NkuF4+W+is35LILxiGKE7FCrF2KNgkXzFPqkpQDD+5i9eE4gH+jTQJSpf9aCeyJ
	Lyf5IQTajlWYet0jKqYgY6ShUW54DBlwwPXgO4rTSE8H99yiXKmCqzYqd1d8QXYVJrsiDhOvVWgHg
	9y69YOBpleZwhfc8Gjops8d5SrIfoDnGewK4sSNubdREO/VpgXMhDWtbMaqXZHJReJOFb/EBA9qEZ
	V8pFvOZoSSnkSW4aUc/TwIEkAssnjwtbrdazZtrABq2k8SSC2TmaNynG6rmz6cmp0qPFrg3Krfszt
	Lz+Qyaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BJ5-000000011w7-1R2J;
	Wed, 30 Oct 2024 16:12:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BAO-0000000103R-1PZn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 16:03:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10792113E;
	Wed, 30 Oct 2024 09:03:55 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 478523F528;
	Wed, 30 Oct 2024 09:03:23 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: anshuman.khandual@arm.com,
	gshan@redhat.com,
	james.morse@arm.com,
	joey.gouly@arm.com,
	shameerali.kolothum.thodi@huawei.com,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jing Zhang <jingzhangos@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v6 0/7] KVM: arm64: Hide unsupported MPAM from the guest
Date: Wed, 30 Oct 2024 16:03:10 +0000
Message-Id: <20241030160317.2528209-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_090328_488055_4815D671 
X-CRM114-Status: GOOD (  14.10  )
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

changes since v5 [1]:
	- Removed Kconfig option, the KVM traps shouldn't rely on host kernel support
	- Renamed cpus_support_* to system_supports_* since that matches other functions
	- Replace static branch arm64_mpam_has_hcr with a normal cpufeature capability
	- Add MPAM*_EL2 regs to KVM (undef_access)
	- Use constants in the test, instead of hardcoded values
	- Added R-b and T-b tags
	- Rebased on v6.12-rc5

James wrote:
	This series fixes up a long standing bug where MPAM was accidentally exposed
	to a guest, but the feature was not otherwise trapped or context switched.
	This could result in KVM warning about unexpected traps, and injecting an
	undef into the guest contradicting the ID registers.
	This would prevent an MPAM aware kernel from booting - fortunately, there
	aren't any of those.

	Ideally, we'd take the MPAM feature away from the ID registers, but that
	would leave existing guests unable to migrate to a newer kernel. Instead,
	just ignore that field when it matches the hardware. KVM wasn't going to
	expose MPAM anyway. The guest will not see MPAM in the id registers.

	This series includes the head.S and KVM changes to enable/disable traps. If
	MPAM is neither enabled nor emulated by EL3 firmware, these system register
	accesses will trap to EL3.
	If your kernel doesn't boot, and the problem bisects here - please update
	your firmware. MPAM has been supported by trusted firmware since v1.6 in
	2018. (also noted on patch 3).

Thanks,
Joey

[1] https://lore.kernel.org/kvmarm/20241015133923.3910916-1-joey.gouly@arm.com/

James Morse (7):
  arm64/sysreg: Convert existing MPAM sysregs and add the remaining
    entries
  arm64: head.S: Initialise MPAM EL2 registers and disable traps
  arm64: cpufeature: discover CPU support for MPAM
  KVM: arm64: Fix missing traps of guest accesses to the MPAM registers
  KVM: arm64: Add a macro for creating filtered sys_reg_descs entries
  KVM: arm64: Disable MPAM visibility by default and ignore VMM writes
  KVM: arm64: selftests: Test ID_AA64PFR0.MPAM isn't completely ignored

 .../arch/arm64/cpu-feature-registers.rst      |   2 +
 arch/arm64/include/asm/cpu.h                  |   1 +
 arch/arm64/include/asm/cpucaps.h              |   5 +
 arch/arm64/include/asm/cpufeature.h           |  17 ++
 arch/arm64/include/asm/el2_setup.h            |  14 ++
 arch/arm64/include/asm/kvm_arm.h              |   1 +
 arch/arm64/include/asm/sysreg.h               |  12 --
 arch/arm64/kernel/cpufeature.c                |  96 +++++++++++
 arch/arm64/kernel/cpuinfo.c                   |   3 +
 arch/arm64/kvm/hyp/include/hyp/switch.h       |  31 ++++
 arch/arm64/kvm/sys_regs.c                     | 121 +++++++++----
 arch/arm64/tools/cpucaps                      |   2 +
 arch/arm64/tools/sysreg                       | 161 ++++++++++++++++++
 .../selftests/kvm/aarch64/set_id_regs.c       |  99 ++++++++++-
 14 files changed, 523 insertions(+), 42 deletions(-)

-- 
2.25.1


