Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C368C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qrTvjx6hus7PgBARqNi5S4WKvXvQglEmBs2sOR+PR4g=; b=USaxFauI6rbEo0BD9l6bS3MxGa
	dedacSbOI8rnC1ONOJGr+PPx/P/j9bKfHMfczbXE/JpUAEP1nzZ3mzri2DV1IOhJNl4rxqLTzxLYJ
	n7WFQhrQfaPFHd8NrEYCC4HvqxZ8Ybj+O5Otz0pkNuuxSzVOCiT/ud6OONFO76Pzr3/kQEiOCe88f
	nxKk+ezjO2z6/hui/FpLyJ9sDFGaXQx0XTr/SIwRRCr817TofBRS3juSptF67LHhGoQ3DwegdiDu3
	QkS3SHpMaL3x+mUPHVheH+XFAKeACgqzeoTDQZ7WD+/uPJiOzKNcbX2tyQOiOBypR3u/7yaw1wEe+
	eEjBRVnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8gA-0000000FT7q-3S4g;
	Tue, 07 Jul 2026 16:29:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8g9-0000000FT7k-1M95
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:29:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AC0060018;
	Tue,  7 Jul 2026 16:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F061F00A3A;
	Tue,  7 Jul 2026 16:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783441788;
	bh=qrTvjx6hus7PgBARqNi5S4WKvXvQglEmBs2sOR+PR4g=;
	h=From:To:Cc:Subject:Date;
	b=MwegdxFHNBEEq9GN+P4Jmp2LFy4tllYihsOgoKBrNH8hLOc0b+X7fapP7BV0pY1GA
	 kmqqL9j29xxjRGfKSkF4VWppq/Qg0POmqD1paZEDtupe/SvP1tQ+31i6djHWgNpD0M
	 eQByd2qKeejiTXZLrXhLvZo5hDRLn1lR2gAKwOBpjbW1cwJXYwabys3Bcjz8Uq3i/5
	 kZDAequAx3t+ThniS87gvb5pJe8w+vYOjhGWjHjLTgC/9z88iCRQjr3t5laeGG2OTp
	 KKMX3PNdx1Z98tPBZVTinM7hrzQBIo+toYN4LXtKL+9+wxF7DfFxWAZgRGQeYsOpnx
	 2SGVxEg7AVOYQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wh8g6-00000002V1E-1guE;
	Tue, 07 Jul 2026 16:29:46 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] KVM: arm64: Fix propagation of TLBI level in kvm_pgtable_stage2_relax_perms()
Date: Tue,  7 Jul 2026 17:29:35 +0100
Message-ID: <20260707162935.1900874-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Assigning the invalidation level (an s8 value) with TLBI_TTL_UNKNOWN
(a 32bit signed value) is not ideal, to say the least. Instead of
this, only pass TLBI_TTL_UNKNOWN to __kvm_tlb_flush_vmid_ipa_nsh()
when we know for sure that we don't have a provided level.

Fixes: 100baf0184896 ("KVM: arm64: Ensure level is always initialized when relaxing perms")
Reported-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/akztC7H2IsEKaq4i@sirena.org.uk
---
 arch/arm64/kvm/hyp/pgtable.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 8754c99c22f2f..70dceb20dfada 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1356,7 +1356,7 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
 				   enum kvm_pgtable_prot prot, enum kvm_pgtable_walk_flags flags)
 {
 	kvm_pte_t xn = 0, set = 0, clr = 0;
-	s8 level = TLBI_TTL_UNKNOWN;
+	s8 level;
 	int ret;
 
 	if (prot & KVM_PTE_LEAF_ATTR_HI_SW)
@@ -1379,7 +1379,8 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
 
 	ret = stage2_update_leaf_attrs(pgt, addr, 1, set, clr, NULL, &level, flags);
 	if (!ret || ret == -EAGAIN)
-		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa_nsh, pgt->mmu, addr, level);
+		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa_nsh, pgt->mmu, addr,
+			     (ret == -EAGAIN) ? TLBI_TTL_UNKNOWN : level);
 	return ret;
 }
 
-- 
2.47.3


