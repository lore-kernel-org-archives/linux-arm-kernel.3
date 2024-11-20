Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAF3D6395B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 14:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOrhFC7btBee1Sh8oQyDRKSp7p3TwDK10iLY51WPzqQ=; b=ZA1aTgW7UaaqPxGMkFBQutV+VN
	84WaaWMzfFdpR8lpb8ebfiDfBjBt0qFW128KjNw8RSlWGWHrcKcw06C1eqrChZPyhcuZhUBI0cW02
	xy6ydLOObL3hQVRqjeKSk47jhjsKgcHMXdxk7Rmc/1dD1LhNIUchXPzfMpDpazaDQUJNXYHky6kmd
	Y3DMmMFI9tXWEw/l4WS0ha7m7R24nUjWuPeotIB9oYvA74oPO3pJjFkgPlMFVQBJEvOuJpLmQmB8B
	WH47xTyR5b+S4oryvmhjMm9auR4HnF/WwOvedV48hRHRwFe5noZ70OIZ7zs9eCpOIuhKwLcBJOrUA
	o0XFp7GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlTx-0000000FVl4-0719;
	Wed, 20 Nov 2024 14:15:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlNb-0000000FUU5-3yog
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 14:08:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B10C5C5835;
	Wed, 20 Nov 2024 14:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A82C4CECD;
	Wed, 20 Nov 2024 14:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732111707;
	bh=Qkn2TGa/epeCHDrjdIDriCHj6rl+KeWU7Q9FUblDxAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kBx/PlgK4v6erVe9gXAg2ayc7aTS4AiYuecx80BpJ9XvSUXX2SZnZLY77WVf9D3mB
	 q4VSUsYT9rvj8Wum/Bh/SDlL9idi2Y7gbzoseMVkcQ4Np+2yNRaj/4qn4yenpq7q6x
	 mOiUjFyQEW9Pz/DC2gbgizeP8/OWu0Mzzl5kcJsxAjo7zbnu6BK0ZwubM/w3aO93Dh
	 y1/X2vygL9wToP2jZ8J34YRgLJEz2l2NFWCo891iOKr8qOeyBm8AiD6UO/CvwZQBht
	 vlmBYrdn04RaOgBODHRauI91/PLBfiLaASNZBbp7908N0fH9bhctpf0tf8oI7jR6Cj
	 guA+A3jDcQT7A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	kernel test robot <lkp@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>,
	linux@armlinux.org.uk,
	arnd@arndb.de,
	samitolvanen@google.com,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 2/3] ARM: 9434/1: cfi: Fix compilation corner case
Date: Wed, 20 Nov 2024 09:08:12 -0500
Message-ID: <20241120140819.1769699-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120140819.1769699-1-sashal@kernel.org>
References: <20241120140819.1769699-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.230
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_060828_029333_1BA3E9EC 
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
index 28c9d32fa99a5..db6a720ec0fc4 100644
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


