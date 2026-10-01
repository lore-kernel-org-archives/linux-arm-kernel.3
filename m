Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26FBCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3H88xwqzEr6JD1Sr9Ox2e9PZgP/QmVDL7/22+3do9Kg=; b=C3Q5pJVBBMrsHbZIVSuV8gIHnx
	731qPwS1M9P0L3TQOYUVZaPbloSsYLXeCBkwstfmg36onz6179LjXOPpH1zxytxrkAN/gAsvyUzjG
	kgI/ZnIIEvJ5h0x0l6uAPbo1t4C9a0puZ1YcWgqJT5oxz5COIBQS2f/rqTELgRPt/f08PtN6KxwXE
	4uHzirJPwzN+zci45wizbAJCmTfmMOAR0GfAPzxxz9/GkbK4G3Gik5jSYLlpoCxraY1i+vgH/uI4E
	b/KOwlyPxMuG25y7Abwrh73IN4jMHIPJD0/AIno3IGwfKGoagWIPTG/35VfWRBkC3my5oACsSBfDo
	yqdS9k1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAwj-00000007xgK-2xuj;
	Thu, 01 Oct 2026 07:11:13 +0000
Received: from out-65.mta1.migadu.com ([95.215.58.65] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAwf-00000007xes-2FUn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:11:11 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=DhIR0bzDit/54mRZ18aEIOAZmEoER6aoaw9jLPnsPjo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790838665; v=1; x=1791443465;
 b=ctqS2PQ5TuzqsOkOQZDVPfBJ3GgMmT10ZS0Wse6z0+FYaP0bGZhxZgCbf9RkdH4HBxnbNTRc
 VKOAG0GOuOJFATGGPXyVr6uRaGEKmNo7YTNeV8f1Re0yWWOLcwARKEHaIgfFcdaTktKs+RAlkO8
 HlW8Pd6lvgQxBBS6mUCvGaNk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b1243c585b78d71b;
	Thu, 01 Oct 2026 07:11:05 +0000
X-Mizu-Trace-ID: b1243c585b78d71b
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Yuchao Zhang <ndaugoing@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 0/3] KVM: arm64: selftests: Cover the ITS MOVALL command
Date: Thu,  1 Oct 2026 08:10:57 +0100
Message-Id: <20261001071100.190013-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_001110_230695_3F9C4403 
X-CRM114-Status: GOOD (  12.00  )
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
  - Make the LPIs pending before they're moved, since pending state is
    what MOVALL moves. (Marc)
  - Put the test in vgic_lpi_stress, which now builds a VM per test.
    (Marc)
  - Test MOVI as well.
  - Rebased on kvmarm/next.

This series tests MOVI and MOVALL on pending LPIs, in vgic_lpi_stress.
The MOVALL case passes only with "KVM: arm64: vgic-its: Fix MOVALL
handling of source redistributor", which is in kvmarm/fixes. Under QEMU
with pKVM, VHE and nVHE hosts, it failed all 21 runs without the fix,
and the test passed all 21 with it and all 5 on top of Oliver's series
[2]. MOVI is there because it's what Linux uses to change an LPI's
affinity.

The test can also catch the stale LR that Oliver's "KVM: arm64: vgic:
Move IRQ migrations out of vgic_prune_ap_list()" fixes, since the vCPU
the LPI is moved from can keep it in its list registers during the
move. I've only seen that in the MOVALL case without the MOVALL fix,
where 13 of the 21 runs took the LPI on that vCPU. I couldn't reproduce
it with MOVI, with the fix, or in 70 runs in a Linux VM on an M4 with
Ubuntu's 6.8 kernel, which predates the MOVALL bug. Oliver, this may be
the pending-LPI migration test you mentioned.

Turns out the test does run on an M4, unlike what I said in v1, since
KVM emulates the ITS whether or not the host has one.

Based on kvmarm/next (8c00199d322b9).

Cheers,
/fuad

[1] https://lore.kernel.org/all/cover.1790708299.git.fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20260929212925.31775-1-oupton@kernel.org/

Fuad Tabba (3):
  KVM: arm64: selftests: Add MOVI and MOVALL commands to the ITS library
  KVM: arm64: selftests: Build a VM per test in vgic_lpi_stress
  KVM: arm64: selftests: Test MOVI and MOVALL on a pending LPI

 .../selftests/kvm/arm64/vgic_lpi_stress.c     | 258 ++++++++++++++++--
 .../selftests/kvm/include/arm64/gic_v3_its.h  |   2 +
 .../selftests/kvm/lib/arm64/gic_v3_its.c      |  28 ++
 3 files changed, 265 insertions(+), 23 deletions(-)


base-commit: 8c00199d322b9e5e936bb0ff624ac95b01c740fe
-- 
2.39.5


