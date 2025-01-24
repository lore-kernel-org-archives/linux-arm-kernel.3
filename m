Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1055C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IgE0MoYXbBG4ftnOjv+rhuzBE3qTCPbZ5WZ+XjvpsjA=; b=mx50DAWVFRI128F01fj5/J0Vde
	PIQvMWkCxIAUihb9b5Y7P54Kik74WW8hAq3gDMM3BG0xsSLdvBk78EooADWn7JbDVkFjf5EqbkYxK
	1u8E5iKzqZyMiZtebCwJKsBo/0eXGypjPVivRlOVtVzZkXkFL7tv1ivG0YCI7/0yL/L+h2l3URGK8
	aTWdrb2IrmqyOCRXDoZceZpde3ZXZDDkUP+wr4Roymm97QA3HBJw9jG+LvwBXMrskXuq2qHIQ/AIl
	JhFrTKyfeSY4vpUN5EywbhaxtXIRo5hXbK8m/LuT731OeZm3cqv56YEpGS9wmEQidCzhYzYuWm1XE
	XOGmz+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJok-0000000EkeS-0AtB;
	Fri, 24 Jan 2025 13:33:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJnP-0000000EkYJ-3smP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 13:32:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92FC15C5F23;
	Fri, 24 Jan 2025 13:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D74AC4CED2;
	Fri, 24 Jan 2025 13:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737725546;
	bh=4FYKS1XlVwqucqi8Ae86v922xxqNnKi/Xn6F3uH2Au4=;
	h=From:Date:Subject:To:Cc:From;
	b=YT4kMRIEv1K+OGMSzKsd+ozMsCWl3l17jt8GJUD5d4QQy2tPe+KpT2qPfc3rVLlAO
	 JHgl1+91c3DGyoWkst9mkaf87pbNPSCR+bUOn+PcvIJ+6Twpp3prL79cZuS/rRLbAa
	 VgSnM08qglYLxxHDKdt6FjwJhrdPuBPzXdS0WUmNfodMzSuZ3Btp6SByNPN81NXkEe
	 DFOQguABK4X9IsD+T/AAmmE9ePQN2VgL1Hp2kSlnC3sAT8deWCv0d8hUXfT+wdPVGa
	 VS2TATyTzxG4IZUiHkKkLB8N55rF1lmBpQcllJONoloacSLIrCkvoOpRZDslkH8NEm
	 l4UD3e5CckBBQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 24 Jan 2025 06:31:57 -0700
Subject: [PATCH] arm64: Handle .ARM.attributes section in linker scripts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-arm64-handle-arm-attributes-in-linker-script-v1-1-74135b6cf349@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEyWk2cC/x3NUQrCMBCE4auUfXah2VgRryI+rOmoizWWTRSh9
 O5GHz9+mFmowA2FDt1CjrcVe+aGsOko3TRfwTY2k/Qy9EEiqz92W25pnPADa61u51dFYcs8Wb7
 DuSS3ufJeFJAhhqiJ2uTsuNjnf3c8resXRmbOKX4AAAA=
X-Change-ID: 20250123-arm64-handle-arm-attributes-in-linker-script-82aee25313ac
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2175; i=nathan@kernel.org;
 h=from:subject:message-id; bh=4FYKS1XlVwqucqi8Ae86v922xxqNnKi/Xn6F3uH2Au4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOmTp2UUnHHdyyih3ld3Yd2N7+9Uf998JhNXWCS8LiSxW
 mff93D1jlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRlYoM/wO2xW/7VvbYmnd2
 cGXZqtoyM9t0NS2+tsMbmSRMDtuHWDH8T1ofeP6h7vr7YvO5PzM7vZnekLK22tjE9038zMxVS2R
 W8wAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_053228_065788_DE86ACCC 
X-CRM114-Status: UNSURE (   9.42  )
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

A recent LLVM commit [1] started generating an .ARM.attributes section
similar to the one that exists for 32-bit, which results in orphan
section warnings (or errors if CONFIG_WERROR is enabled) from the linker
because it is not handled in the arm64 linker scripts.

  ld.lld: error: arch/arm64/kernel/vdso/vgettimeofday.o:(.ARM.attributes) is being placed in '.ARM.attributes'
  ld.lld: error: arch/arm64/kernel/vdso/vgetrandom.o:(.ARM.attributes) is being placed in '.ARM.attributes'

  ld.lld: error: vmlinux.a(lib/vsprintf.o):(.ARM.attributes) is being placed in '.ARM.attributes'
  ld.lld: error: vmlinux.a(lib/win_minmax.o):(.ARM.attributes) is being placed in '.ARM.attributes'
  ld.lld: error: vmlinux.a(lib/xarray.o):(.ARM.attributes) is being placed in '.ARM.attributes'

Add this new section to the necessary linker scripts to resolve the warnings.

Cc: stable@vger.kernel.org
Fixes: b3e5d80d0c48 ("arm64/build: Warn on orphan section placement")
Link: https://github.com/llvm/llvm-project/commit/ee99c4d4845db66c4daa2373352133f4b237c942 [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm64/kernel/vdso/vdso.lds.S | 1 +
 arch/arm64/kernel/vmlinux.lds.S   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index 4ec32e86a8da..f8418a3a2758 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -75,6 +75,7 @@ SECTIONS
 
 	DWARF_DEBUG
 	ELF_DETAILS
+	.ARM.attributes 0 : { *(.ARM.attributes) }
 
 	/DISCARD/	: {
 		*(.data .data.* .gnu.linkonce.d.* .sdata*)
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index f84c71f04d9e..c94942e9eb46 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -335,6 +335,7 @@ SECTIONS
 	STABS_DEBUG
 	DWARF_DEBUG
 	ELF_DETAILS
+	.ARM.attributes 0 : { *(.ARM.attributes) }
 
 	HEAD_SYMBOLS
 

---
base-commit: 1dd3393696efba1598aa7692939bba99d0cffae3
change-id: 20250123-arm64-handle-arm-attributes-in-linker-script-82aee25313ac

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


