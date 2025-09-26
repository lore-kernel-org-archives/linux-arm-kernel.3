Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6A4CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 11:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wCjr3n4Ux2Mt5JPE80XF2IWB8kKI2Z4dWnoPhegY+Zo=; b=Z1L/294HrJUGf7iaQaBJCXjtK0
	qVCPmDF5XPKBOg1Lmx/zkjT2/p1XbfGaArk3iIP/pqqoH6KdPBE1TEJJzBT3aLRlCe9CIY/8lL3Py
	GabHJb84PmOYpIM3DnT1bQf7c2xFLCl2Po+gRUKHZtSK7ad3w9buDLgnPv0wGPwQBel6+1YWREOE8
	iM6neDRV5kg08iAEAMJhhmnxVzjoptdptrM7JjUi7xgdC/FXarUdrwzOAmI0RY5Rlr+23FoKBDGP2
	bjrdYITtEmL5cW3tzM/pJzlzgdKsmldmDXP4LsUMvZ6TAnjSUcvrzoVWzK8iQLsshC4JRQsgAm41l
	lqtIPfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26EJ-00000000cdQ-1RfF;
	Fri, 26 Sep 2025 11:03:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26EG-00000000cbS-3qE0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 11:03:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A90E01655;
	Fri, 26 Sep 2025 04:02:59 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.38.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 878073F66E;
	Fri, 26 Sep 2025 04:03:03 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Steven Price <steven.price@arm.com>
Subject: [RFC PATCH 0/5] Arm CCA planes support
Date: Fri, 26 Sep 2025 12:02:49 +0100
Message-ID: <20250926110254.55449-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_040309_083465_6543C055 
X-CRM114-Status: GOOD (  11.72  )
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

The Arm CCA (Confidential Compute Architecture) RMM version 1.1
specification[1] adds support for a concept of "planes". This allows a
realm to be divided into multiple execution environments with memory
separation between them (while still sharing the same IPA to PA
translations). There's an overview on the Arm website[2].

The TF-RMM project[3] recently merged support for planes to their "main"
branch and this an early preview of the corresponding Linux changes to
support the feature. Note you need to enable the (experimental) RMM_V1_1
configuration option to enable this feature.

This series is based on the v10 posting of the CCA host support
series[4] and is also available as a git tree:

  https://gitlab.arm.com/linux-arm/linux-cca.git/ cca/planes/rfc-v1

A hacked up version of kvmtool to launch a realm guest with an extra
plan is available here:

  https://gitlab.arm.com/linux-arm/kvmtool-cca.git/ cca/planes/rfc-v1

Note:
   The kvmtool support is a hack - it simply (unconditionally) enables a
   single extra plane (for a total of two planes: P0 and P1). This
   should obviously be a configuration option and should support other
   numbers of planes. But it gives an easy way of testing the support
   for auxiliary RTTs while running a single guest image (i.e. leaving
   P1 empty).

This series was written against the RMM v1.1 alp14 specification. Those
who are following things closely will know we're up to alp16, however
there are no major changes affecting planes between these two versions.
The spec is still alpha, so there may well be changes in the future.

[1] https://developer.arm.com/-/cdn-downloads/permalink/Architectures/Armv9/DEN0137_1.1-alp14.zip
[2] https://developer.arm.com/documentation/den0125/400/Arm-CCA-Extensions#md239-arm-cca-extensions__realm-planes
[3] https://www.trustedfirmware.org/projects/tf-rmm/
[4] https://lore.kernel.org/r/20250820145606.180644-1-steven.price%40arm.com

Steven Price (5):
  arm64: RME: Add SMC definitions introduced in RMM v1.1
  arm64: RME: Handle auxiliary RTT trees
  arm64: RME: Support RMI_EXIT_S2AP_CHANGE
  arm64: rme: Allocate AUX RTT PGDs and VMIDs
  arm64: RME: Support num_aux_places & rtt_tree_pp realm parameters

 arch/arm64/include/asm/kvm_rme.h  |   13 +-
 arch/arm64/include/asm/rmi_cmds.h | 1104 +++++++++++++++++++++++++++--
 arch/arm64/include/asm/rmi_smc.h  |  121 +++-
 arch/arm64/include/uapi/asm/kvm.h |   12 +
 arch/arm64/kvm/mmu.c              |   15 +-
 arch/arm64/kvm/rme-exit.c         |   33 +-
 arch/arm64/kvm/rme.c              |  441 +++++++++++-
 7 files changed, 1618 insertions(+), 121 deletions(-)

-- 
2.43.0


