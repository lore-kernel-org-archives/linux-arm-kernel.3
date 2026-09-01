Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D303C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hWHMZANuyto9dL0rZ5Jl0kraj9mv6LaBGG2cASeNcns=; b=G1rJ0OTVMDySMqOAeHH3wfmndi
	4ydThxsS+ctn58P/Oc/NJRpiLKPljhF9FZKna662TYhPPhiZDqLveV7DwJ+3O3KrEohlomNB8hEcI
	Sf+bpVt2DHq9GyA0RV1wofInfNgRuVW/hTULZSZZ+EHAXyDl+4EPGwCEuHoqFp4kWR02Xy0PEfBdn
	5yO8rpiLUGGIWChSHt0SKyqQ1rNhJLwxqrvZSctor9v98NWbgToweHn1yYQTZ3LbiUkKAco3JP9Zu
	zzL9tgorja2oT35xLxPE3/0quombW0Nh/DnRDb2JvbX7bX5LbHBdyid2rkOtY9QliBaEBAxFXeEX7
	QM/y1USQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1S5i-0000000CnFg-0Pe2;
	Tue, 01 Sep 2026 17:16:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1S5f-0000000CnD9-1ADY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:16:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23B441756;
	Tue,  1 Sep 2026 10:16:00 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DABA83F7D8;
	Tue,  1 Sep 2026 10:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788282963; bh=LPbF21iE9ep8LNYPWYLCmBh5eBtWwnTLW2zpejTK+uM=;
	h=From:To:Cc:Subject:Date:From;
	b=BLJGPw59ghk0iGEn/Xo+nJCxYpjfDuyKJQ/An5HQZwkuFRmeCug1iR1JoCNTkGxz1
	 cY+PoFVYEB2SO/PfWwx4+sUVA4oOvbDqq/p7yYpHoBq4/C0Ft8jauPMOy1fuagqg+U
	 5x+ShIzKTjsojlTYEmmdHEqEq0TD+k/bUK5fLASE=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/5] KVM: arm64: New PTE dirty-page encoding, HAFDBS new usage
Date: Tue,  1 Sep 2026 18:15:51 +0100
Message-ID: <20260901171558.2674031-1-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083; i=leo.bras@arm.com; h=from:subject; bh=LPbF21iE9ep8LNYPWYLCmBh5eBtWwnTLW2zpejTK+uM=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKms82R+l6aLevoLPTlevrjXj+xN0X5Dw80573/FLDZL OEZ5/QLHaUsDGJcDLJiiiyyj+av4vk+JePIlR8LYOawMoEMYeDiFICJWDAx/M822rbU95bGj2U7 BIREbi46WyIsOXGdcyy/imhR69apEpwM/0PLPCdczPnF+W1Ga8H74w7V9z0XvvvxSWi96/uv32W CPdgA
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_101607_700223_1BB3F333 
X-CRM114-Status: GOOD (  14.53  )
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

This series have 2 main goals:

1 - Patches #1,#2,#3 : Change the PTE descriptor to use WD/WC/RO encodings
    making use of the DBM bit, adapting all usages, and
2 - Patches #4,#5 are an RFC on using HAFDBS on a guest to avoid resetting
    all PTEs to WC when dirty-logging starts, speeding-up startup.

(1) will also introduce a new walker for cleaning the dirty-bit, which will
clear the DBM bit if it's a block mapping (hugepage). This is needed as on
lazy-splitting we need to fault a write so we can do the lazy splitting.
This is needed for both the next patches, and for HDBSS & HACDBS
enablement.

On (2), I really just want feedback to understand if it's worth pursuing.
My main idea is that we can use HAFDBS _outside_ dirty-logging to only mark
dirty the pages that were actually written to. That is supposed to make it
faster to transverse the pagetables when we need to clean the dirty-bit, as
there is potentially less atomic writes to perform. The price paid for that
is disabling HAFDBS on every vcpu before we can start cleaning the pages,
done by a (new) vcpu request.

Please let me know of what do you think!

Thanks!
Leo

Leonardo Bras (5):
  KVM: arm64: pgtables: Change write bit from S2AP_W to DBM
  KVM: arm64: Add KVM_PGTABLE_PROT_DIRTY
  KVM: arm64: Introduce a dedicated walker for stage2 write-protect
  KVM: arm64: Add KVM_REQ_RELOAD_STAGE2
  KVM: arm64: Enable HAFDBS for guests not on migration

 arch/arm64/include/asm/kvm_host.h    |  2 ++
 arch/arm64/include/asm/kvm_mmu.h     |  6 ++++
 arch/arm64/include/asm/kvm_nested.h  |  9 +++--
 arch/arm64/include/asm/kvm_pgtable.h | 12 +++++--
 arch/arm64/kvm/arm.c                 | 15 ++++++++
 arch/arm64/kvm/hyp/pgtable.c         | 49 +++++++++++++++++++++-----
 arch/arm64/kvm/mmu.c                 | 51 ++++++++++++++++++++++------
 arch/arm64/kvm/nested.c              |  4 ++-
 arch/arm64/kvm/ptdump.c              | 10 ++++--
 9 files changed, 130 insertions(+), 28 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0


