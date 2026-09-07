Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984F5C79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGGBej+SQ1I6McGtzO0CVbCK2WO3o2hwjiZoBeg1MN0=; b=ik8JEVCo1GkvzGpGex8gy516Wx
	8R4GArOAsssmaL9+pZLgjuCVpKoUW+TbqLfJBLMVmUoLAE+6qtmkgvPmeLcLw2zHmUJnvROP/kyuB
	Ix4vXvIxfP+wuj0eK2rUlecB16ndyX8u+0NVu9Udc43FIOL9TkODBC3DyBBNAn2VdMYj3wkh5DGp8
	V44FzqU52PpChg1T9jrfnmgByltiOIWlTR/zkc6Jhos7L8xfSGYZhYN9VRkdDjsNtNjcoIbjVDXrE
	ibTP06kZIiwKtZcLr3tI141Ghu8nPVp16LHlGMGl38YpNCUv1r3yVBstd4PJAjFotP74BJyRk/pLb
	oOM91f8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cM8-00000007K6F-2zqm;
	Mon, 07 Sep 2026 16:38:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cM6-00000007K3a-0exC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:38:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6416407F5;
	Mon,  7 Sep 2026 16:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48FF71F00A3F;
	Mon,  7 Sep 2026 16:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799081;
	bh=KGGBej+SQ1I6McGtzO0CVbCK2WO3o2hwjiZoBeg1MN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WpfsWqlrMUwBRR1EH5ZCqpwogDEm/CJPNWtWBEtBuooS4VzUmdPlxEaUpushCM7H3
	 4RMuouTvrtIiPlTeuOAPOLGdjR/y25iJ+JgiPnehcL99HHqvkRoOgsZUZD6+ODyN64
	 X4DqP50cqC+NYF5B1jLZcMFCvdPZRr5HiZiRhUdzjyRsWgboCMoekZ8atcIt4X/RA6
	 cFZI4IrN4aYpfO3mobi1Oei/S0m7KtXOtkDe2skzhJqGRepY7kmhVrfiK4VqOwUVyb
	 N8Lz4JPqQ01wgGQbH69mXYZZqbJR/ozVLBeaNHWUkqujrdE+kHmkSUdO1RrE6Z99uK
	 ZojZErFH/0zLg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 07/14] arm64: head: Force little-endian early during boot
Date: Mon,  7 Sep 2026 17:37:18 +0100
Message-ID: <20260907163726.17104-8-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907163726.17104-1-will@kernel.org>
References: <20260907163726.17104-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Commit 2ced0f30a426 ("arm64: head: Switch endianness before populating
the ID map") configured SCTLR_ELx.EE at boot according to the endianness
of the kernel in case the bootloader had entered the image in the wrong
endianness. Additionally, if the MMU was enabled in such a case, logic
was added to turn it back off to prevent the hardware walker from
misinterpreting the idmap page-table.

Given that the MMU is only expected to be enabled when booting EFI, EFI
only supports little-endian and arm64 kernels cannot be built as
big-endian images, we can rip out this handling and simply force
SCTLR_ELx.EE to 0 (little-endian).

Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/head.S | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 8951ce693552..d5c1ea0c5b3c 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -138,29 +138,11 @@ SYM_CODE_START_LOCAL(record_mmu_state)
 	b.ne	0f
 	mrs	x19, sctlr_el2
 0:
-	tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f
+	bic	x19, x19, #SCTLR_ELx_EE		// Force little-endian
 	tst	x19, #SCTLR_ELx_C		// Z := (C == 0)
 	and	x19, x19, #SCTLR_ELx_M		// isolate M bit
 	csel	x19, xzr, x19, eq		// clear x19 if Z
 	ret
-
-	/*
-	 * Set the correct endianness early so all memory accesses issued
-	 * before init_kernel_el() occur in the correct byte order. Note that
-	 * this means the MMU must be disabled, or the active ID map will end
-	 * up getting interpreted with the wrong byte order.
-	 */
-1:	eor	x19, x19, #SCTLR_ELx_EE
-	bic	x19, x19, #SCTLR_ELx_M
-	b.ne	2f
-	pre_disable_mmu_workaround
-	msr	sctlr_el2, x19
-	b	3f
-2:	pre_disable_mmu_workaround
-	msr	sctlr_el1, x19
-3:	isb
-	mov	x19, xzr
-	ret
 SYM_CODE_END(record_mmu_state)
 
 /*
-- 
2.55.0.979.g7e5102b832-goog


