Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634AFC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FGCvEgoYFbb+RqbPsxNvhrDGdl/2MCrgutaZMspXl0Y=; b=lF0M+RziccCxNp
	yGB2txn1ZcW1nuThyihF56UB6nah7Ot62iPZeajXb/sNrDZLS/fuH6CPB/FR4XtIPEay/Ldst23fs
	1R9Fd7qdi5tNeghltA47x5fM5JzDRebn4vdJZfxHBKY+9euFWCe2zJvgilpdWQB97ckdSwKu8334p
	j3c6+4tZqY8cSIpucJ6lAAj6jjHRRQTfng6xbAhybYbdLGBAGZeLo0BD06OJzjeafYryuOV5oDaEg
	cuIGCte7btUiwqZ0Q4DMsGzIps5ish1QvKYtrUVRBXGJ12ZHCKTTifJgqyvV2lu7jdVxT19D3z0SE
	z3HjYgwxtKQwESKtCvSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu93H-0000000GI5D-1R2u;
	Wed, 12 Aug 2026 13:31:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu93F-0000000GI4l-2VWu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:31:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 453E9413E6;
	Wed, 12 Aug 2026 13:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE7E1F000E9;
	Wed, 12 Aug 2026 13:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786541485;
	bh=FGCvEgoYFbb+RqbPsxNvhrDGdl/2MCrgutaZMspXl0Y=;
	h=From:Subject:Date:To:Cc;
	b=I5KYmKbZPNDRWjAi5eqWjk71WYzUpliMGCzTTqETB0DpV7KGgpMXR8v3jhvnACarp
	 SI2paNES7dLDqKHYMT3PnCFXxYAgkxXgmlAbnPQ0ku10X3u3cvvv94u1OdVXV84Dn4
	 K0jNkPaV0MV3c4Ov4kU975NyBJUdnrgUAXI4REcDkQxM5RbYJuBsdX/BS4o5exagXT
	 RvRuoSTHVYtdqmr8/jB4WHvY0Qn5PbR/kG6T2K20gTh7mnDKLUGNDLqVfNi2jauTTc
	 Y1+lfBDurQrQaL68dc0mf8lP4yrF2MEqdnskPzQF1KlFdQXSDB/hc9XGGCceEZZkuQ
	 s8i20t3koP0eA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: [PATCH 0/2] KVM: arm64: Fix spurious warn, null ptr deref on S2
 teardown race
Date: Wed, 12 Aug 2026 14:31:19 +0100
Message-Id: <20260812-kvm-arm-nested-virt-fix-v1-0-4ad883f1b6a5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MwQqDMBAFf0X27ELWgtr+SvEQ9amLmJZNCAXx3
 xs8zsDMSRGmiPSqTjJkjfoJBaSuaNp8WME6F6bGNa3rRXjPB3s7OCAmzJzVEi/6Y/cQPP0oI/q
 OSv01FH2f38N1/QG1Qt1MaQAAAA==
X-Change-ID: 20260811-kvm-arm-nested-virt-fix-031e9ab1be87
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jintack Lim <jintack.lim@linaro.org>, 
 Christoffer Dall <christoffer.dall@linaro.org>, 
 Christoffer Dall <christoffer.dall@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205; i=ljs@kernel.org;
 h=from:subject:message-id; bh=tpLslcTY/jbcjdNO9fIepj0cT1/gnbsyvrTV4i5uR9M=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJqSle+qKhom6e/2vUq453bLztSHZp1KtZrG5dv8stnW
 7R7ccO7jlIWBjEuBlkxRZbnX8T3B4mEzeu84O8GM4eVCWQIAxenAExkvjYjw1ozx2jzeS01prZT
 v/oIrzl2OexH4w6FT1fM78i/WaScuZeRoclTjiE+3UDpu12F5J7AHfYP7xS2qjfEsv+Z4XTy945
 iVgA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

When GFNs are invalidated in L0 an MMU notifier triggers
kvm_unmap_gfn_range() which tears down all of the stage 2 shadow page
tables for nested guests via kvm_nested_s2_unmap().

To avoid lockup, the kvm->mmu_lock is dropped while doing this and the task
rescheduled once for each block of physical address space (32 MiB for 16
KiB page size), with the lock being reacquired once the task is scheduled
again.

This results in a potential race between this L0 tear down and tear down of
the guest itself in kvm_flush_shadow_all(), a race which has been observed
on real hardware.

When this race occurs it causes an invalid kernel warning when the PGT of a
nested MMU is cleared by kvm_flush_shadow_all() ->
kvm_arch_flush_shadow_all() -> kvm_free_stage2_pgd().

Patch 1 fixes this by having stage2_apply_range() no longer return an error
when it has experienced a benign race with pgt teardown when it drops the
lock.

Patch 2 addresses something more serious - bad timing can turn this spurious
warning into a NULL pointer dereference.

kvm_arch_flush_shadow_all() calls kvm_uninit_stage2_mmu() which calls
kvm_free_stage2_pgd() on the canonical kvm->arch.mmu for that guest's S2
mappings, making it NULL.

This is problematic if it happens before stage2_apply_range() reacquires
the kvm->mmu_lock, as it ultimately returns to kvm_nested_s2_unmap() which
dereferences kvm->arch.mmu.pgt with the mmu lock held under the incorrect
assumption that it means it's valid, resulting in a NULL pointer
dereference.

Fix that by checking if kvm->arch.mmu.pgt is NULL before dereferencing it
in kvm_nested_s2_unmap().

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
Lorenzo Stoakes (ARM) (2):
      KVM: arm64: Fix spurious warning for benign stage 2 teardown race
      KVM: arm64: nv: Fix null ptr deref in kvm_nested_s2_unmap() on S2 teardown

 arch/arm64/kvm/mmu.c    | 10 ++++++++--
 arch/arm64/kvm/nested.c |  6 +++++-
 2 files changed, 13 insertions(+), 3 deletions(-)
---
base-commit: ed8384586cf9937df7ed018fcfc625b85e0ece81
change-id: 20260811-kvm-arm-nested-virt-fix-031e9ab1be87

Best regards,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>


