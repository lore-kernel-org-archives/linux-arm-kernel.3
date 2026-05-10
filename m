Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E00CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 14:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uF8TF2GOVCerMhwVEoOYekz371q5hNoP6EZCVBlL4gM=; b=lflwHpywjF04XRmzM4dtqjouis
	Z8liyDsfXn/6jIXbLwsSNfIT7EOXRchuskAYqpwVxU11m7E6PjtDzCvxvbG4cpMCK+YaRDOwv9TxY
	6DF1bYlW1JKgSfwSiDWlonc82axZ9ovwmtJlt9Zbpeab4eNUKkJbGdJ8CKQj+pzl/QyqYznf1HSCH
	0lkZK1ZoQ0xnpWN8wQ4UzE++bSfqxEsp5zI6RbCvhTNLADzCB2EITMGHvtgw+FPyPO9tAU6ja4DZK
	a0ieUsELDEQDZNp1wg0/Qgoblm50oIw2F9YF6QyPRUdO897NI9Mzf+en78ueak/1cTzdbdQy1OnfE
	J1UWXr5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5Y0-0000000Aytr-1Hwh;
	Sun, 10 May 2026 14:54:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5Xw-0000000Ayrq-1MSu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 14:54:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E135F1D13;
	Sun, 10 May 2026 07:54:09 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C80E23F836;
	Sun, 10 May 2026 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778424855; bh=VYxBiY24h03tiLKCKU1MSqB/0xqzgQWJIyjoe5z/fSg=;
	h=From:To:Cc:Subject:Date:From;
	b=Rka61JTu1CsueQ86DnzZVem2PUA3yQTxo1jUnXzPgfs4eezOnsefjvySxeydpwHSq
	 4aTW8AOA+15xe3RLfifA8WoYpIwwMsr3fZvJXH2dnkQmECVFpQcIFoEza6ABOT2dx4
	 VTcO2j8J3EfBQR3uCZtLiZ5S0GL1oaYiUKeFHwgM=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 0/5] KVM: arm64: nv: Implement nested stage-2 reverse map
Date: Sun, 10 May 2026 15:53:33 +0100
Message-ID: <20260510145338.322962-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_075420_552054_D9319755 
X-CRM114-Status: UNSURE (   8.35  )
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

Hi,

This is v3 of optimizing the shadow s2 mmu unmapping during MMU
notifiers.

Two new preparatory patches are added, one reduces a hole in kvm_s2_mmu
and another refactors the code a bit during s2 faults. Other changes are
listed below.

* Changes from v2 [1]:

  - Removed "polluted" teminology.

  - Use xa_{mk, to}_value() when storing and retriving values from maple
    trees.

  - Avoid using the 63rd bit in maple tree values so that xa_{mk, to}_value()
    does not lose us a bit.

  - Added reverse map removal during TLBI handling.

  - Other suggested refactorings.

Thanks!

[1]: https://lore.kernel.org/kvmarm/20260411125024.3735989-1-weilin.chang@arm.com/

Wei-Lin Chang (5):
  KVM: arm64: Use a variable for the canonical GPA in kvm_s2_fault_map()
  KVM: arm64: Move shadow_pt_debugfs_dentry to reduce holes in
    kvm_s2_mmu
  KVM: arm64: nv: Avoid full shadow s2 unmap
  KVM: arm64: nv: Remove reverse map entries during TLBI handling
  KVM: arm64: nv: Create nested IPA direct map to speed up reverse map
    removal

 arch/arm64/include/asm/kvm_host.h   |  17 +-
 arch/arm64/include/asm/kvm_nested.h |   6 +
 arch/arm64/kvm/mmu.c                |  43 +++--
 arch/arm64/kvm/nested.c             | 238 +++++++++++++++++++++++++++-
 arch/arm64/kvm/sys_regs.c           |   3 +
 5 files changed, 290 insertions(+), 17 deletions(-)

-- 
2.43.0


