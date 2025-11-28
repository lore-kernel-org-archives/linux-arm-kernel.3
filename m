Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8E7CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 10:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=slGJO1gRgZ2Z8lvXkav1ma+hpQQHXVvjs3ECcjvwoC4=; b=opBkyROb2Lx+nlUYtOGWlnczmq
	sOM/qgylWC9/HPPNDVilNHYufOaG8ypquYwVkIE+afbBIlsVFe7eNXPxfNsw85t8ITQIcEu3UhQeO
	zk7f0y5FLLvYymrlc50Vyx8T+Ecz+pApr3+NYwPu2B+ZpjSf1Ud1vjSBMIxamSMHCWhKW/sCYEeov
	h4Wq5uOTVGqMadQE+HNYkwUnlFrnLV0xE9fKjdDr7Pr0uc+9vw0I7W4xDxqzNJOObcRIuaFFds5h+
	VMhn+o7+bti7+xDzvz80imtOmZAOxlFZ1xRiFtvzfFnsgDZrlZy/LD3C5bj3kGr6iERC8fM0Kk8M2
	tPrLlIxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvQf-00000000GWM-3Lyd;
	Fri, 28 Nov 2025 10:10:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvQd-00000000GVv-0UHb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 10:10:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07BAC176A;
	Fri, 28 Nov 2025 02:10:03 -0800 (PST)
Received: from e140010.arm.com (unknown [10.57.90.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F02BF3F73B;
	Fri, 28 Nov 2025 02:10:03 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH 0/4] KVM: arm64: nv: HAF fixes
Date: Fri, 28 Nov 2025 10:09:42 +0000
Message-ID: <20251128100946.74210-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_021015_198837_DFBD75C1 
X-CRM114-Status: GOOD (  12.15  )
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

Based on kvmarm's next branch.

HAF support for the software translation table walker was merged while I
was in the process of reading the patches, so instead of comments I have
these few fixes.

One thing I didn't touch is this sequence in hyp_set_prot_attr():

	if (prot & KVM_PGTABLE_PROT_X) {
		/* don't set the XN bit */
	} else {
		attr |= KVM_PTE_LEAF_ATTR_HI_S1_XN;
	}

If the caller is executing in nVHE mode, the translation regime is EL2,
which has only PrivExecute permission. Since KVM_PGTABLE_PROT_X is now the
union of PrivExecute and UnprivExecute, if the caller requests only the
UnprivExecute permission, but no PrivExecute permission, the function does
not return an error code and sets the PrivExecute permission.

Something similar happens in kvm_pgtable_hyp_pte_prot() - it will return
KVM_PGTABLE_PROT_X, which includes KVM_PGTABLE_PROT_UX (UnprivExecute) even
if the permission does not apply to the EL2 translation regime.

I have a feeling I am being too pedantic here, that's why I didn't propose
a fix. Though I thought it might be worth confirming that this isn't an
issue.

Alexandru Elisei (4):
  KVM: arm64: Document KVM_PGTABLE_PROT_{UX,PX}
  KVM: arm64: at: Use correct HA bit in TCR_EL2 when regime is EL2
  KVM: arm64: nv: Don't mask VTCR_EL2.HA if FEAT_HAFDBS is present
  KVM: arm64: at: Update AF on software walk only if VM has FEAT_HAFDBS

 arch/arm64/include/asm/kvm_arm.h     | 1 +
 arch/arm64/include/asm/kvm_pgtable.h | 4 +++-
 arch/arm64/kvm/at.c                  | 5 ++++-
 arch/arm64/kvm/nested.c              | 4 +++-
 4 files changed, 11 insertions(+), 3 deletions(-)


base-commit: 81410a2ac378414e9c60c34dac4e2c4d00969b46
-- 
2.43.0


