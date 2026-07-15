Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E38C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eTPRw4xgg8IjOQ5JmgNpsEc7Nfn7rdVYVW/3U76RrDY=; b=F6ckqRT3gJt6ueGY62CSHGVX3z
	3ec19IJR6y/kmElBJfR2U4ppLt0AMfVADVDDe2+InSBm53JE8DqvKjTYSYQId2yg8MZGIBboHCtTe
	YhNr4WUGaFOFxo7MVRVvzd8/oqEphA1d7vGRthxPtMFCaZn3pxMIcrCqYRdcY+jafdJIkM3qw+6ZQ
	9MDITY9QpqKWHPVbKBtPW6zQahOpQh2W0/MFtbCKTva/Cm7WsbMWeyA09gm3RoETIIcOEhfku774f
	DlBf+ey5JcAS+kb5zvVm1RRM4/06a31TjuN7XfO6iidhwoOeb7CNu+GIlHV92CVTAao8QIplJyOiS
	DeZiByjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0ad-0000000F77J-0gTS;
	Wed, 15 Jul 2026 14:27:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0aZ-0000000F76b-0G4e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:27:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D061152B;
	Wed, 15 Jul 2026 07:27:49 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A7693F7B4;
	Wed, 15 Jul 2026 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784125673; bh=agx27SYEr3SHHoleH5Fvz+cQz0XAcVmLenbj3oTpFHU=;
	h=From:To:Cc:Subject:Date:From;
	b=j97V5XqGlfq4mWKOiZ9ORX3T4VRdaM3f0smUQ0IM8xReqAvG3EcRvSXeN4EoDS76K
	 d/9yTVPrcFfJZQurYsfD0C8/HHBzCPU3EJ0rl7AtYD/m0Q8Wat9sd5DJ1gSRW9K3US
	 6+24dp/jKRPQzH67bpgGQe1OHOsjbHCNyJVPRkX0=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH 0/6] firmware: arm_rmm: Add RMM v2.0 support
Date: Wed, 15 Jul 2026 15:27:31 +0100
Message-ID: <20260715142739.80398-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_072755_191088_E3B688DB 
X-CRM114-Status: GOOD (  16.14  )
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

This series adds the generic firmware layer for talking to the Realm
Management Monitor (RMM), as specified by the RMM v2.0-bet2
specification[1]. It is the first part of the Arm CCA host support that
was previously posted as part of the larger KVM series.

The split allows this RMM support to be used as a base for other work,
including Aneesh's changes, without depending on the KVM Realm support
that follows in the second series.

The series adds:

 * The RMI SMC definitions and direct-call wrappers.

 * RMM discovery and version checks during firmware init.

 * RMM host configuration, including the host page size.

 * Stateful RMI Operation (SRO) infrastructure for commands which the RMM
   can complete across multiple SMC calls while requesting or returning
   memory to the host.

 * GPT setup so that the RMM has entries for host memory.

The RMM v2.0 spec introduces Stateful RMI Operations (SROs), which allow
the RMM to complete an operation over several SMC calls while requesting
or returning memory to the host. This allows interrupts to be handled in
the middle of an operation and lets the RMM dynamically allocate memory
for internal tracking purposes. For example, RMI_REC_CREATE no longer
needs auxiliary granules to be provided up front, and can instead
request memory during the operation.

This series is based on v7.2-rc1 and Ackerley's guest_memfd in-place
series[2]. It is also available as a git repository along with the KVM
host support:

https://gitlab.arm.com/linux-arm/linux-cca cca-host/v15

The TF-RMM has now merged most of the RMM v2.0 support needed by this
series. The remaining PSCI changes have not yet merged; for testing those
changes are available in the following TF-RMM branch:

https://git.trustedfirmware.org/TF-RMM/tf-rmm.git topics/rmm-v2.0-poc_3

[1] https://developer.arm.com/documentation/den0137/2-0bet2/
Note that one bet2 change, which moves metadata out of the individual
address range descriptors, has intentionally not been implemented
because that part of the spec is expected to be reverted.

[2] https://lore.kernel.org/r/20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com
with Suzuki's fix on top:
https://lore.kernel.org/all/114e2488-97ed-4740-a8e8-1edd991f26c5@arm.com/

Steven Price (6):
  firmware: arm_rmm: Add SMC definitions for calling the RMM
  firmware: arm_rmm: Add wrappers for direct RMI calls
  firmware: arm_rmm: Check for RMI support at init
  firmware: arm_rmm: Configure the RMM with the host's page size
  firmware: arm_rmm: Add support for SRO
  firmware: arm_rmm: Ensure the RMM has GPT entries for memory

 arch/arm64/Kconfig                |   1 +
 arch/arm64/include/asm/rmi_cmds.h | 459 +++++++++++++++++++
 arch/arm64/kernel/cpufeature.c    |   1 +
 drivers/firmware/Kconfig          |   1 +
 drivers/firmware/Makefile         |   1 +
 drivers/firmware/arm_rmm/Kconfig  |  22 +
 drivers/firmware/arm_rmm/Makefile |   2 +
 drivers/firmware/arm_rmm/rmi.c    | 724 ++++++++++++++++++++++++++++++
 include/linux/arm-rmi-cmds.h      | 205 +++++++++
 include/linux/arm-smccc-rmi.h     | 499 ++++++++++++++++++++
 10 files changed, 1915 insertions(+)
 create mode 100644 arch/arm64/include/asm/rmi_cmds.h
 create mode 100644 drivers/firmware/arm_rmm/Kconfig
 create mode 100644 drivers/firmware/arm_rmm/Makefile
 create mode 100644 drivers/firmware/arm_rmm/rmi.c
 create mode 100644 include/linux/arm-rmi-cmds.h
 create mode 100644 include/linux/arm-smccc-rmi.h

-- 
2.43.0


