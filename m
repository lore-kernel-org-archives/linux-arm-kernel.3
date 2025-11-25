Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3FDD0EE1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 20:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yeh7sjglmZDqfmrRko9tR7UXfMuq3XWnG6fXKeoiTGs=; b=TSCiELhVDkLO4xC+Esasnvd+nt
	9pGUCSk7NX1xoUMYUPNlw21Y9d9isXyXh0eYMp/NngrhdlHfL8LJSZJYEYoQDd3zgE6KcOFirs48j
	LsWPQa5SZGLiS7EaqMLNKbJacaxMoolZ6Alane2Ewg1GeDcO2TzZCSC+Hzpj7ujfKOBRDAwGm1pKX
	etCLPVPPg232/BvLN7kNws2asu7NMMBh5JlPKKqOmLP/+RHKEbx7/qfmSmtM+95EiBrmgbMid9idn
	Hm9JiiNcBPpHjaHqntlPY06rSzXVgucZnNNvD11lqcF653IM54NULctgpdmXzimt0RNWHhOlBEpGt
	FkhjElmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzTX-0000000DtNl-33Sf;
	Tue, 25 Nov 2025 20:17:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzTW-0000000DtMq-0MCx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 20:17:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3666860151;
	Tue, 25 Nov 2025 20:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8301C4CEF1;
	Tue, 25 Nov 2025 20:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764101840;
	bh=hzbR14ZISIMAgrKscEtE9O4AxjI+YtVWZFwOy9uJXg8=;
	h=From:To:Cc:Subject:Date:From;
	b=S9eQXmzQ0b9CochquTo+PVGfqqmazZyHHt6+I/eoi1j9d1AE5pyPqxnPQ3mUHJhbM
	 ncrdnVuaVfDsKuevkOzRYWPefitMvYU7uYBMkofOMoLe+842CXzM1+DDPJVdI3FjLd
	 Bo2gH/+eLkV96ygSzq3Oa8VnTbzna2v8ZRwN6Zr93KQBIcdZoEGkCDVBP2C48xCoJZ
	 rXtBOsnFAk+dMVTh4Rg0XP/t0OqcOwTDMs84a9pBGeMtyJXgHvl9ZPzxxKhcHarkT2
	 eOfioK9DFUpUiDwgPBRGpKI004+yT3I5FzqDc0cJw0l01665bdcaGcXnT5/CWVYSYy
	 983m5Hpdwl0mw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vNzTS-00000008Gpd-3C63;
	Tue, 25 Nov 2025 20:17:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] KVM: arm64: Don't use FIELD_PREP() in initialisers
Date: Tue, 25 Nov 2025 20:17:15 +0000
Message-ID: <20251125201715.1133405-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, nathan@kernel.org
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

Nathan reports that compiling with CONFIG_PTDUMP_STAGE2_DEBUGFS
results in a compilation failure, with the compiler moaning about
"braced-group within expression allowed only inside a function"...

Replace FIELD_PREP() with its shifting primitive, which does the
trick here.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Fixes: 81e9fe5c6f25d ("KVM: arm64: Teach ptdump about FEAT_XNX permissions")
Closes: https://lore.kernel.org/r/20251125173929.GA3256322@ax162
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/ptdump.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index bd722383d0e3f..6cbe018fd6fda 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -46,22 +46,22 @@ static const struct ptdump_prot_bits stage2_pte_bits[] = {
 	},
 	{
 		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
-		.val	= FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b00),
+		.val	= 0b00UL << __bf_shf(KVM_PTE_LEAF_ATTR_HI_S2_XN),
 		.set	= "px ux ",
 	},
 	{
 		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
-		.val	= FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b01),
+		.val	= 0b01UL << __bf_shf(KVM_PTE_LEAF_ATTR_HI_S2_XN),
 		.set	= "PXNux ",
 	},
 	{
 		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
-		.val	= FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b10),
+		.val	= 0b10UL << __bf_shf(KVM_PTE_LEAF_ATTR_HI_S2_XN),
 		.set	= "PXNUXN",
 	},
 	{
 		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
-		.val	= FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b11),
+		.val	= 0b11UL << __bf_shf(KVM_PTE_LEAF_ATTR_HI_S2_XN),
 		.set	= "px UXN",
 	},
 	{
-- 
2.47.3


