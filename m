Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594ECC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RNAw0xf7/NqwVQQ+kBhEeREeDXOOuB3wWqORL1f3CoI=; b=g0kvjDWfsZ2MdMTeclpgjYBsob
	dsV9As8uYJD8Bnf1NZEDaRy2ZwpamLLrdgw+UHe3dJmRrIycCmoXlfxt4uppOiiTEBb7hmvn76rSo
	JFKyjVwBPhPw36EL/QMW6qeRz3xat634olXTt2GRsd/JqonUnUtwPOSkirKyIYovughyuHU0w+N5D
	Mp97xYZ8KSs62BEaTnGx+wAdVEw1/yb3TKZXY7pstM0cm4GCwpGaiPFsmVuyNzffR2/++oAgeif4r
	vmVcdpB2PK5lykvqFUQjXy3egVTjH4UdoMwTxLrIwbHIH/EPMIPe74xJp98Z8/INcHD3YxN82Ex8/
	Bx+ou03w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn5q-0000000EAe3-1ULp;
	Tue, 11 Aug 2026 14:04:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn5p-0000000EAdv-0R6L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:04:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8922A600AD;
	Tue, 11 Aug 2026 14:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD8F1F000E9;
	Tue, 11 Aug 2026 14:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786457076;
	bh=RNAw0xf7/NqwVQQ+kBhEeREeDXOOuB3wWqORL1f3CoI=;
	h=From:To:Cc:Subject:Date;
	b=XUAJw3faRxHmuC+VOEdalgcwHImfb1c/ee/R5FvsKMVzLgA6VYmXYLIpF567Ihzva
	 0dsaiMh2SmAPFKAnh4h9Jo7xr+NERqpQY925hZPPUZepAvvAjFTKxD/xUWZX85alyJ
	 0eywkovLqNJhVhBqao2JRbt3fFtXiYDfp6xRHo7xaZinsRVoOgsIHEl0Zqf0OSxs01
	 UfqGFZelnI2/5cgLBYeFJPrYqIaQWT0LShPfKZ3ZJsCKfPpWOdJTRUr4B5MnBD6SzX
	 3y7ZKi6mIePF6LwYEEPRgGbJSG/XdNPNHhd/7+/GAfuxffwy27Mg1LHJIiNcBeMFnZ
	 5Z5Zg2bWA+s0g==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Gus Bourg <gus@bourg.net>
Subject: [PATCH] arm64/efi: Avoid voluntary preemption with efi_mm installed
Date: Tue, 11 Aug 2026 15:04:29 +0100
Message-ID: <20260811140430.22832-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
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

Gus reports a bad kernel memory access when using software PAN
(CONFIG_ARM64_SW_TTBR0_PAN=y) on a machine with support for EFI runtime
services:

  Unable to handle kernel access to user memory outside uaccess routines
    at virtual address 00000000f322ff30
  Mem abort info:
    ESR = 0x0000000096000004
    FSC = 0x04: level 0 translation fault
  Internal error: Oops: 0000000096000004 [#1]  SMP
  Workqueue: efi_rts_wq efi_call_rts
  pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : efi_call_rts+0xd8/0x288
  Call trace:
   efi_call_rts+0xd8/0x288 (P)
   process_one_work+0x178/0x4f8
   worker_thread+0x194/0x328

This is because the fpsimd context management code called from
__efi_fpsimd_begin() can preempt voluntarily, returning later to the EFI
code with an incorrect value for TTBR0_EL1 thanks to the deferred mm
switching used by the software PAN implementation.

Since EFI runtime services cannot preempt voluntarily and because the
fpsimd switching code does not rely on the TTBR0_EL1 mappings, simply
reorder the fpsimd switch so that it occurs before we change the
page-table.

Cc: Ard Biesheuvel <ardb@kernel.org>
Reported-by: Gus Bourg <gus@bourg.net>
Tested-by: Gus Bourg <gus@bourg.net>
Fixes: a5baf582f4c0 ("arm64/efi: Call EFI runtime services without disabling preemption")
Link: https://lore.kernel.org/all/20260806000144.3388823-1-gus@bourg.net/
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/efi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 30cd7f804398..0ec90fd1754e 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -184,6 +184,8 @@ void arch_efi_call_virt_setup(void)
 		efi_virtmap_load();
 	}
 
+	__efi_fpsimd_begin();
+
 	/*
 	 * Enable access to the valid TTBR0_EL1 and invoke the errata
 	 * workaround directly since there is no return from exception when
@@ -191,8 +193,6 @@ void arch_efi_call_virt_setup(void)
 	 */
 	uaccess_ttbr0_enable();
 	post_ttbr_update_workaround();
-
-	__efi_fpsimd_begin();
 }
 
 void arch_efi_call_virt_teardown(void)
-- 
2.55.0.679.g6767b8d81c-goog


