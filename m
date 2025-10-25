Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB9ACCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 20:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKZzFH9baPhuiDV4/UyjYPxffM2N3XsDNJhdMtNChJA=; b=mA3PS1M8PMDBA+CCchhE0BqzU2
	viyjZAsLhH64jaY08XN+nmv2X7KftiUzfZH77FJeyVIuYuCbAnpuZTDN9CK+2Mk7aN24Kkh+IJu6C
	xhdTvWADxb9UdF+MVkzmO3bPgJo8l+KO+tZ3MFPcpS/eJNk1/uAJAY4MKTbNqnLhV3KEIHMMqXjWn
	wmZq85UaorUwRTIKkFd6xXzeUe1URE4alQVeVhD7F2bw9EktlTOY+49yPmf/FhLdRdWKniJq//myT
	S36zbjFddYFMYrXWwY+z6KEW2bo/3TSUnEidUrO+R2SGSehegEnOAtzwZzdHC2Vm9qoSKTA3Mkvnv
	oU5+ja8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClGk-0000000BkGy-1mWT;
	Sat, 25 Oct 2025 20:53:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClGg-0000000BkFg-36ti
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 20:53:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BE2C43DE7;
	Sat, 25 Oct 2025 20:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677E7C113D0;
	Sat, 25 Oct 2025 20:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761425621;
	bh=k3f56oOKXrHPQQfnFbh//sCNF5j+f6kxvvopfboCJxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gyBS+m3+QuJhhVlVHOUu0JiISZ/k5A2IXJFsl4NJpggJCKVvIjEa5DDaYcuanepEl
	 ZX8qFwgLj5h05w3VNQIwz095yPKdIr0J5hR9EYXxYcccTZgWrEYO5mBRVxL5xjP1SO
	 e1vM74f58O9uKTNpKGok29peiZRWauNITxgfFEv4bGO5LjmYkZjTGFSsRpyvTVywkm
	 o8XZXwwutNJLzUUdXK8JQMrWlxwFwbJAgv7rVCE7Bd97fyfmilTCi84cM/+WbrgSaD
	 NJiBenCNc79SH8VjATqKJUrXw9UEcHG5CxPFvfdcSjyz6Mpkkqd3DNIoEe58TCEw0a
	 IWJ/jpi1hdY8Q==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sat, 25 Oct 2025 21:53:18 +0100
Subject: [PATCH 1/3] compiler_types: Introduce __nocfi_generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-idpf-fix-arm-kcfi-build-error-v1-1-ec57221153ae@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120; i=nathan@kernel.org;
 h=from:subject:message-id; bh=k3f56oOKXrHPQQfnFbh//sCNF5j+f6kxvvopfboCJxQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBl/Lc5InyyKcb3JcHTHf8mWDxptnkqzlkza4fp4wuf3C
 y70+sbs7ShlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATEYxgZLhgKXhcWan09CFZ
 rfM/z319Pnl1bPAMkYg83hl63neLNTIZ/lmsZ9aZkmEVs8JC9pVNn9NCf3O+vncMWzprc9f/3ea
 0iwsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_135342_824658_C0BC4A3D 
X-CRM114-Status: GOOD (  13.33  )
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

There are two different ways that LLVM can expand kCFI operand bundles
in LLVM IR: generically in the middle end or using an architecture
specific sequence when lowering LLVM IR to machine code in the backend.
The generic pass allows any architecture to take advantage of kCFI but
the expansion of these bundles in the middle end can mess with
optimizations that may turn indirect calls into direct calls when the
call target is known at compile time, such as after inlining.

Add __nocfi_generic, dependent on an architecture selecting
CONFIG_ARCH_USES_CFI_GENERIC_LLVM_PASS, to disable kCFI bundle
generation in functions where only the generic kCFI pass may cause
problems.

Link: https://github.com/ClangBuiltLinux/linux/issues/2124
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/Kconfig                   | 7 +++++++
 include/linux/compiler_types.h | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index 74ff01133532..61130b88964b 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -917,6 +917,13 @@ config ARCH_USES_CFI_TRAPS
 	  An architecture should select this option if it requires the
 	  .kcfi_traps section for KCFI trap handling.
 
+config ARCH_USES_CFI_GENERIC_LLVM_PASS
+	bool
+	help
+	  An architecture should select this option if it uses the generic
+	  KCFIPass in LLVM to expand kCFI bundles instead of architecture-specific
+	  lowering.
+
 config CFI
 	bool "Use Kernel Control Flow Integrity (kCFI)"
 	default CFI_CLANG
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 59288a2c1ad2..1414be493738 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -461,6 +461,12 @@ struct ftrace_likely_data {
 # define __nocfi
 #endif
 
+#if defined(CONFIG_ARCH_USES_CFI_GENERIC_LLVM_PASS)
+# define __nocfi_generic	__nocfi
+#else
+# define __nocfi_generic
+#endif
+
 /*
  * Any place that could be marked with the "alloc_size" attribute is also
  * a place to be marked with the "malloc" attribute, except those that may

-- 
2.51.1


