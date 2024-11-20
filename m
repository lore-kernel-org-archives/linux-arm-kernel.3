Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CDBD63954
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 14:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvmKN1iLnpaSuNrsLv/73d3BhuVCrJR4bIF7fzGAUxA=; b=xIUkLBDwy4SWdDzf93e5XhPt6g
	kFnkgbJbGhsYBHp0pcJVf1zBYOWbacb/2GC6O1//skRVolO3dTEs20X3b26xCx143coSiiqzW2qVP
	cHyE9jzWfx3sozkVWGBt2eo3AEz03ybPcC5vX3olRKifFXu4kYJpsi+jfj/vC3VCBprXC5AKD2kaQ
	ruU9Wc/ZUJ5Pbwec+UnCRYxr2th9AqcLcXFKzzxyCivQXmee5a+ZP+G19mLt/XcoKXDsfcrhMkrWa
	JIbgZNisn6y4Rw5XA3x3pG1Gw6T1lzUjRClegnwUREeDSjFpOS4xFLPuHptfTOYlF/gNRmQh67OiE
	b21OWr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlRE-0000000FVJl-0TY7;
	Wed, 20 Nov 2024 14:12:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlMw-0000000FUIo-1vFd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 14:07:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 32E0EA43101;
	Wed, 20 Nov 2024 14:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB18CC4CECD;
	Wed, 20 Nov 2024 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732111665;
	bh=1h+r44bKItFpy5BY/SuLv+HOEtbQLxNAGpyYMYt2Hyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C8n1+8FIuMhs7cV0wU8DT3wZxqIbIHvqlfJmJokC65INu6hxHVRitEHntDQb92YMu
	 uUu/wtJfX2S3X0mgOmMGfn9l8uP/hyKyjsoCtrZeE6EIoZAzkk7t4usmkecC4YI+fZ
	 tKCAKE9vrBtvWr/HPfVi0mqCJckWH6Ue5iTKJD9fP0S788sdiQq7myoPzMV9l+Gxlm
	 SRR0DkKeTu2K4Ybhjq5iRsaUYeZvbGPP7XA8vpD6a+1HrfoUNDxd7u9LtQanQj1mtg
	 1TwBkIpMrCu8xvPxbqQH2goGpBxwuyFRgbhWTjVMF9DuYr+stgblBsSeb2PCMzCci3
	 iDL/nr53Ep5VQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	kernel test robot <lkp@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>,
	linux@armlinux.org.uk,
	samitolvanen@google.com,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 5/6] ARM: 9434/1: cfi: Fix compilation corner case
Date: Wed, 20 Nov 2024 09:07:11 -0500
Message-ID: <20241120140722.1769147-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120140722.1769147-1-sashal@kernel.org>
References: <20241120140722.1769147-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.118
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_060746_561833_C1AC8034 
X-CRM114-Status: GOOD (  11.89  )
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

From: Linus Walleij <linus.walleij@linaro.org>

[ Upstream commit 4aea16b7cfb76bd3361858ceee6893ef5c9b5570 ]

When enabling expert mode CONFIG_EXPERT and using that power
user mode to disable the branch prediction hardening
!CONFIG_HARDEN_BRANCH_PREDICTOR, the assembly linker
in CLANG notices that some assembly in proc-v7.S does
not have corresponding C call sites, i.e. the prototypes
in proc-v7-bugs.c are enclosed in ifdef
CONFIG_HARDEN_BRANCH_PREDICTOR so this assembly:

SYM_TYPED_FUNC_START(cpu_v7_smc_switch_mm)
SYM_TYPED_FUNC_START(cpu_v7_hvc_switch_mm)

Results in:

ld.lld: error: undefined symbol: __kcfi_typeid_cpu_v7_smc_switch_mm
>>> referenced by proc-v7.S:94 (.../arch/arm/mm/proc-v7.S:94)
>>> arch/arm/mm/proc-v7.o:(.text+0x108) in archive vmlinux.a

ld.lld: error: undefined symbol: __kcfi_typeid_cpu_v7_hvc_switch_mm
>>> referenced by proc-v7.S:105 (.../arch/arm/mm/proc-v7.S:105)
>>> arch/arm/mm/proc-v7.o:(.text+0x124) in archive vmlinux.a

Fix this by adding an additional requirement that
CONFIG_HARDEN_BRANCH_PREDICTOR has to be enabled to compile
these assembly calls.

Closes: https://lore.kernel.org/oe-kbuild-all/202411041456.ZsoEiD7T-lkp@intel.com/

Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mm/proc-v7.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
index 26d726a08a34b..2090c23e49311 100644
--- a/arch/arm/mm/proc-v7.S
+++ b/arch/arm/mm/proc-v7.S
@@ -91,7 +91,7 @@ ENTRY(cpu_v7_dcache_clean_area)
 	ret	lr
 ENDPROC(cpu_v7_dcache_clean_area)
 
-#ifdef CONFIG_ARM_PSCI
+#if defined(CONFIG_ARM_PSCI) && defined(CONFIG_HARDEN_BRANCH_PREDICTOR)
 	.arch_extension sec
 ENTRY(cpu_v7_smc_switch_mm)
 	stmfd	sp!, {r0 - r3}
-- 
2.43.0


