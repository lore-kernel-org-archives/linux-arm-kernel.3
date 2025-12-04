Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DB3D1D89F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ONE0djmXdFXyOCYcMZhfrppYZIGRN59rsZraO7G+BFQ=; b=GKp7muMv4nyv/gtsNLYo+xAYtf
	y9Qp6V5pNBsgz/stzfAcHrcHI9DhcFnBM0/yjwcJ1rlf50YcKQ2ku5uZfMmTQpF+vfUz2fNK8P68R
	vWYyspxliJTdNfgQZmlDFFxE1/jTnD3+e9ojh324Be0WVrDX0V+GImlECGGpBrSXXwM+ehiWLKVbq
	PW/Ndwaeh3pzclnBgDNrAey/mIxj8dZGj6qrGNuuKVrOeRcZm+xeboZrKlGsZZ0zGQpdGk6oIVz1+
	ElXzLwSTwGOX4ePWU9p0dbZUWoC1yxktH5PSGbFUeJuWDDB4m3OY1heAei7UjuXeHf7Ccg2bxX4ya
	gfv5WfNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5x6-00000007mw6-1qBX;
	Thu, 04 Dec 2025 09:48:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5wz-00000007mox-0XhW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:48:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74F9A43C50;
	Thu,  4 Dec 2025 09:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AD6C4CEFB;
	Thu,  4 Dec 2025 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764841716;
	bh=H60AiTeTzKaEMtMo0Wpw3pM5yVyroEt8ri3eLfcsf7Y=;
	h=From:To:Cc:Subject:Date:From;
	b=li9bWD+cbvG9uGOLckEFc3UgZon0KhHvVh8y/3Ae7MVyIYkUBakFqf+RQddkTrNlU
	 GkRGomTccrcvp5VT/32wuEOIIdny3etEv1j+TfL4uzdrPSwKHzDnsA/gqEBcuRrrd0
	 sTcCDIJ5NdyhiOVmUShJzUvvA5aEaTNf3+eiP0PQr+Y4j+65ZxLaaBMoVx3BY9Cdl5
	 0nFpUEBuvHOoyhKjuxZV03l49cWfzXqbI543/MU13Q549bUpANloIJQ96yKvwJrgPX
	 ZLREZ3fteSDpWKz/PJKSlrsE/ocB8kFi5zQsZvJCH8JsL/6WSwTWDok+ybdE4mlexq
	 mJ3+Po8VDqgiw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vR5ww-0000000AP90-0fQ6;
	Thu, 04 Dec 2025 09:48:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v3 0/9] KVM: arm64: Add support for FEAT_IDST
Date: Thu,  4 Dec 2025 09:47:57 +0000
Message-ID: <20251204094806.3846619-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_014838_046467_EC139852 
X-CRM114-Status: GOOD (  14.68  )
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

FEAT_IDST appeared in ARMv8.4, and allows ID registers to be trapped
if they are not implemented. This only concerns 3 registers (GMID_EL1,
CCSIDR2_EL1 and SMIDR_EL1), which are part of features that may not be
exposed to the guest even if present on the host.

For these registers, the HW should report them with EC=0x18, even if
the feature isn't implemented.

Add support for this feature by handling these registers in a specific
way and implementing GMID_EL1 support in the process. A very basic
selftest checks that these registers behave as expected.

* From v2: [2]

  - Repainted ID_AA64MMFR2_EL1.IDS description (Oliver)

  - Made the IDST handling more generic in the core KVM code, which
    resulted in the series being restructured a bit

  - Added handling to pKVM (in a slightly different way, as pKVM
    insist on seeing a full enumeration of the trapped registers)

  - Some cleanups

  - Collected RBs, with thanks

* From v1: [1]

  - Fixed commit message in patch #4 (Ben)

  - Collected RB, with thanks (Joey)

[1] https://lore.kernel.org/r/20251120133202.2037803-1-maz@kernel.org
[2] https://lore.kernel.org/r/20251126155951.1146317-1-maz@kernel.org

Marc Zyngier (9):
  arm64: Repaint ID_AA64MMFR2_EL1.IDS description
  KVM: arm64: Add trap routing for GMID_EL1
  KVM: arm64: Add a generic synchronous exception injection primitive
  KVM: arm64: Handle FEAT_IDST for sysregs without specific handlers
  KVM: arm64: Handle CSSIDR2_EL1 and SMIDR_EL1 in a generic way
  KVM: arm64: Force trap of GMID_EL1 when the guest doesn't have MTE
  KVM: arm64: pkvm: Add a generic synchronous exception injection
    primitive
  KVM: arm64: pkvm: Report optional ID register traps with a 0x18
    syndrome
  KVM: arm64: selftests: Add a test for FEAT_IDST

 arch/arm64/include/asm/kvm_emulate.h          |   1 +
 arch/arm64/kvm/emulate-nested.c               |  28 +++++
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            |  39 ++++--
 arch/arm64/kvm/inject_fault.c                 |  10 +-
 arch/arm64/kvm/sys_regs.c                     |   4 +-
 arch/arm64/tools/sysreg                       |   4 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/arm64/idreg-idst.c  | 117 ++++++++++++++++++
 8 files changed, 189 insertions(+), 15 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/idreg-idst.c

-- 
2.47.3


