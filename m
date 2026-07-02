Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A46AC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2F0L/XUiTLM3A8G0VJGA94FT1+KmNQOQgpGnjoI3Xec=; b=aI/kNFSH+KBFdvj98s1B7ltJKA
	wqA6yS4X85GnKjRfTSU3bIvPIc0vach8VnUy6kBa8dSCjQGTIGPOxNsJY5KXOMQIl3mNxB/OHqlc9
	vxluJNFrURpcx2PNGQ4MLPQZ/t/b2qr62f+RJ1BLQJ/AVb/6/WoVEDSUpHfxWkxK7kP+pPAqcVymE
	oJsjbWjH8WvtSW0ZnxejuodPwEkL0GygoprY00TV90EJtfcSk/7bqUQp4Svx9q6LQW+rtYpEvCrj2
	fsr5g0Irh4UGmg8VsXY/cq9K62hCuH2GgYdiZz3V//CZzrBeL+rJQUFIT6skKEiTbEllcwvOEyoYA
	egU+V3Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMiM-00000005JCG-1dJB;
	Thu, 02 Jul 2026 19:04:46 +0000
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.245.243.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMiJ-00000005JBK-3k3T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1783019083; x=1814555083;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2F0L/XUiTLM3A8G0VJGA94FT1+KmNQOQgpGnjoI3Xec=;
  b=biUX2nqOcehpOYs8uB7qgPpCAEiJ1E6wVfPvcIvfPLSibGJEUU4vU8XZ
   ztw4G7zyWrNHyt7VhfT1UnQkXuWp/Pvg63Zzy//TlkyLlTOSeGtXY6Gwp
   xNhAhO7N9Mzua3TJ8f1/Q60oTPvzLtChFHjx1ywJkuWYg9NxkpPe9Mzin
   wytlBg419kWEUBIwMOuUyn40ZvLzT5SwbGSpHkFvUgp1b3GQ7R6ExD+Qr
   rX1zqNh0SmR/XX/LrhTCm4JqW3jNixn1aSEeQ4W5JX/nsLchfHdSZ8+nD
   kUN7fpkPsFGw+V2zgSOCLq3O1WgBM6eo1x47ko50mnCZ2BwUYtGN8exPR
   g==;
X-CSE-ConnectionGUID: RUCOIRJSTHavSfOQXFTPmg==
X-CSE-MsgGUID: vAdo8kNJQSCmRTWkKIoTVw==
X-IronPort-AV: E=Sophos;i="6.25,144,1779148800"; 
   d="scan'208";a="22450114"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 19:04:39 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:3819]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.1.125:2525] with esmtp (Farcaster)
 id 76b56ee0-2128-4c30-8bc9-732e61c13d37; Thu, 2 Jul 2026 19:04:39 +0000 (UTC)
X-Farcaster-Flow-ID: 76b56ee0-2128-4c30-8bc9-732e61c13d37
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 2 Jul 2026 19:04:39 +0000
Received: from dev-dsk-congkai-2a-df9e8fab.us-west-2.amazon.com
 (172.23.251.204) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43; Thu, 2 Jul 2026
 19:04:38 +0000
From: Congkai Tan <congkai@amazon.com>
To: Oliver Upton <oupton@kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
CC: Congkai Tan <congkai@amazon.com>, Marc Zyngier <maz@kernel.org>, "Joey
 Gouly" <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Haris Okanovic <harisokn@amazon.com>, Geoff Blake
	<blakgeof@amazon.com>, Stanislav Spassov <stanspas@amazon.de>,
	<kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
Date: Thu, 2 Jul 2026 19:04:18 +0000
Message-ID: <20260702190421.420992-1-congkai@amazon.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.23.251.204]
X-ClientProxiedBy: EX19D045UWC004.ant.amazon.com (10.13.139.203) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_120443_984700_88B832B5 
X-CRM114-Status: GOOD (  13.39  )
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

Today when the perf tool runs in a guest on cores with PMUv3p4, it fails
to parse the default metrics with "Failure to read '#slots'", since perf
can only read 0 from sysfs caps/slots, which is backed by PMMIR_EL1.SLOTS
that KVM traps as RAZ/WI.

Taking into account backward compatibility and heterogeneous systems, the
exposure of PMMIR_EL1.SLOTS is gated behind a new vCPU feature flag:

- Patch 1 adds the new flag KVM_ARM_VCPU_PMU_V3_STRICT. When set, KVM does
  not create a default PMU during vCPU init, and the VMM must select one
  explicitly via KVM_ARM_VCPU_PMU_V3_SET_PMU before the first KVM_RUN.
- Patch 2 exposes PMMIR_EL1.SLOTS of the selected PMU under the flag, and
  adds userspace get/set for PMMIR_EL1 so that SLOTS can be reset to 0
  for backward compatibility.
- Patch 3 stops masking STALL_SLOT* in PMCEID1 under the flag.

When the flag is not set, behaviors are unchanged.

v1: https://lore.kernel.org/r/20260601193954.2103455-1-congkai@amazon.com

v1 -> v2 changes:
 - Gate the whole feature behind a new KVM_ARM_VCPU_PMU_V3_STRICT vCPU
   feature flag, instead of unconditionally exposing PMMIR_EL1.SLOTS.
 - When the flag is set, skip creating a default PMU during vCPU init.
 - Split the PMCEID1 unmask into its own patch, also gated by the flag.
 - Snapshot SLOTS into a new field pmmir_slots in kvm_arch during the
   handling of KVM_ARM_VCPU_PMU_V3_SET_PMU when the flag is set;
   access_pmmir()/get_pmmir() return it and set_pmmir() only accepts the
   SLOTS field (rejecting other bits with -EINVAL).
 - Add get_user and set_user for PMMIR_EL1 to support setting the SLOTS
   back to 0, and add PMMIR_EL1 to the get-reg-list selftest.

Congkai Tan (3):
  KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_STRICT vCPU feature
  KVM: arm64: Expose PMMIR_EL1.SLOTS under strict PMUv3 UAPI
  KVM: arm64: Advertise STALL_SLOT* in PMCEID1 under strict PMUv3 UAPI

 Documentation/virt/kvm/api.rst                   |  5 ++
 arch/arm64/include/asm/kvm_host.h                |  5 +-
 arch/arm64/include/uapi/asm/kvm.h                |  1 +
 arch/arm64/kvm/arm.c                             | 18 +++++--
 arch/arm64/kvm/pmu-emul.c                        | 50 ++++++++++++++-----
 arch/arm64/kvm/sys_regs.c                        | 63 +++++++++++++++++++++++-
 include/kvm/arm_pmu.h                            |  4 ++
 tools/arch/arm64/include/uapi/asm/kvm.h          |  1 +
 tools/testing/selftests/kvm/arm64/get-reg-list.c |  1 +
 9 files changed, 128 insertions(+), 20 deletions(-)


base-commit: 1702da76e017ae0fbe1a92b07bc332972c293e89
--
2.50.1

