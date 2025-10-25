Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C11CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 20:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwAdxCHRgEQ+91R3lmIAM0trfHzgVfiaQ7nM5FiQFM8=; b=tg1S+QvYJDS4/Asmam3xs2V53X
	TTcaC/dUYZ0F8J5jqjTnIY/dKoUaHMmBQTjh13p5cDf7vDaqkglxg/h0rmTRs04ev3D/9dUA5P9vB
	YOcuman3rgpSM3nbQuei0cTrniFLu3BolKLUVsARJqtsWzXaQVl4L0fSPxsz/7FP5ir9x42EYkgwZ
	6U1OCBUXs3mfR7wVjWIWPbyTC0bSFCDEHzJ1Qf4gnFrYE14RJaowClY7otru/o1PKpxLnno/dhvzp
	L514rtc7opUNG6koAp1pgXO/Kjak5z+F4lS9iAWYzsIHm+ae7lbpPrX629E9SDfeP6vIW/gUgPxS1
	o5PXdwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClGp-0000000BkIo-32Jk;
	Sat, 25 Oct 2025 20:53:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClGk-0000000BkH0-48tE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 20:53:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 469FA602E6;
	Sat, 25 Oct 2025 20:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0286C4CEFF;
	Sat, 25 Oct 2025 20:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761425625;
	bh=iG5SfyTk4AKapcKPPrgaFC/L53w+793p/xw4lohb8j4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tIOI0fBX3xZrYkIIJKOTTujgZFS5HWbD5Fq0jy1bprFv8lhHtqpaHaNXYfigNsuvV
	 IPJSVSUUb/H19XVseECrJfWHff5FzANCf/bFsgYXSmZ/XitcJLQDCQGQ202ZyXySnC
	 djE0aeNgokJhBAFjxVoNpURGUPu2DzKnoiu2vgAb900a+kKkBB0z2R6qGyQHX9QfRF
	 1U4yvR2tstfL8mdlQBpehKXVDp/ifN51kZf6nVyfEZIRrNPsGSDhaEalZBTe+tnZ9h
	 A+qqxJAg6ovg04sN7aHZT34rLlamKBuPYTeqC6s31CrnnGAbsnTjvE6oV5d2oD76aQ
	 ctQrpfhR7nA/w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sat, 25 Oct 2025 21:53:19 +0100
Subject: [PATCH 2/3] ARM: Select ARCH_USES_CFI_GENERIC_LLVM_PASS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-idpf-fix-arm-kcfi-build-error-v1-2-ec57221153ae@kernel.org>
References: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
In-Reply-To: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
To: Kees Cook <kees@kernel.org>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Michal Kubiak <michal.kubiak@intel.com>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=nathan@kernel.org;
 h=from:subject:message-id; bh=iG5SfyTk4AKapcKPPrgaFC/L53w+793p/xw4lohb8j4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBl/Lc7cXRGgEvFzhe+9sFOGP38axfW9tZlhLmOZX/NkW
 wwnw6SbHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiySwM/wxDz1zd/XRjSMYZ
 vym50b0nP25112lec31i1Ha1lzW5idmMDF3XTz96kqbppmE8gT+FIdqm4Ne2c1cVVkeGynAsFN3
 FxQ4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

Prior to clang 22.0.0 [1], ARM did not have an architecture specific
kCFI bundle lowering in the backend, which may cause issues. Select
CONFIG_ARCH_USES_CFI_GENERIC_LLVM_PASS to enable use of __nocfi_generic.

Link: https://github.com/llvm/llvm-project/commit/d130f402642fba3d065aacb506cb061c899558de [1]
Link: https://github.com/ClangBuiltLinux/linux/issues/2124
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2e3f93b690f4..4fb985b76e97 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -44,6 +44,8 @@ config ARM
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_MEMTEST
+	# https://github.com/llvm/llvm-project/commit/d130f402642fba3d065aacb506cb061c899558de
+	select ARCH_USES_CFI_GENERIC_LLVM_PASS if CLANG_VERSION < 220000
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_IPC_PARSE_VERSION

-- 
2.51.1


