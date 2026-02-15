Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F778EF585B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 03:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZCuFX4wLWSbnn2ULZdbzI2FlhLkmO20FWopmI/RY+50=; b=ixU1iUP7r2UEvBPdeEvgfNykrK
	hpH9VJSj1sUZKbTETHXIhrus9EuT9Q+oY7c7nLNbBmrf9ugEFDYi3q1QlOwpo3kJTybYTQLmXnbVt
	UIj+YUPw1/C/3xlC51dHP15Ycph/rwD/jM1fPJTfW6X+pbg/cXEKtyjKHjVt3c1lQ0waW28BQ4sO+
	EuPsyQbCboDH9hrw7NT8XjSiwyVBbD+LXx96VKKXyLK5AzE1cX/nP8ZkcTY0tVsXCBXL0GeA9cPrm
	aoXuDOv4jBa3AtcL2aEWuolbAcgemRhudvs52EPhsaSDydbnEO9Du7tHrKN7+pabYvR2dhbU3Z9Im
	KdzZkb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrTGy-000000058e2-3qM4;
	Sun, 15 Feb 2026 03:58:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrTGx-000000058dv-1cTG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 03:58:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D5ED6001D;
	Sun, 15 Feb 2026 03:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809A0C4CEF7;
	Sun, 15 Feb 2026 03:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771127892;
	bh=jsM6rUIEAwjwmIUoIADEtW5CiHC9ZcogfvHijHZpuys=;
	h=From:To:Cc:Subject:Date:From;
	b=AXEQZIueajJ7DSzROwzTv2ACIB0cWHnp8cKrN44oY7F4k5wUfahMoqA1vTzqNfbic
	 RwRxyMU+tZqNsGzixcYy6Ki0Qfr23XH4NNGEbFTo5/8YzsXtaSCg3EyCjZYPvGq+nn
	 7HXhlPR3evjZ+YVDMQV+NrTqlGmIDV1D4j+kMXdIgp95bsUYdMg3Q3DWAMcTQKsZji
	 zS04TsnIjwFpvY09XV8HoOOTzoZ5yFJ3X/3byZt7Ur66jeGGpy7QAsqqBb6hXRrXBw
	 b8j+qnMVgtbnVUUoDY5Py9xed73WuybqloJ/+Mc/QaiAlzD5jqskm8p75qTOXUul0E
	 mSLg6dyP46nLw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] arm64: remove HAVE_CMPXCHG_LOCAL
Date: Sun, 15 Feb 2026 11:39:44 +0800
Message-ID: <20260215033944.16374-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
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

It turns out the generic disable/enable irq this_cpu_cmpxchg
implementation is faster than LL/SC or lse implementation. Remove
HAVE_CMPXCHG_LOCAL for better performance on arm64.

Tested on Quad 1.9GHZ CA55 platform:
average mod_node_page_state() cost decreases from 167ns to 103ns
the spawn (30 duration) benchmark in unixbench is improved
from 147494 lps to 150561 lps, improved by 2.1%

Tested on Quad 2.1GHZ CA73 platform:
average mod_node_page_state() cost decreases from 113ns to 85ns
the spawn (30 duration) benchmark in unixbench is improved
from 209844 lps to 212581 lps, improved by 1.3%

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/Kconfig              |  1 -
 arch/arm64/include/asm/percpu.h | 24 ------------------------
 2 files changed, 25 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..5e7e2e65d5a5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -205,7 +205,6 @@ config ARM64
 	select HAVE_EBPF_JIT
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_CMPXCHG_DOUBLE
-	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS
diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index b57b2bb00967..70ffe566cb4b 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -232,30 +232,6 @@ PERCPU_RET_OP(add, add, ldadd)
 #define this_cpu_xchg_8(pcp, val)	\
 	_pcp_protect_return(xchg_relaxed, pcp, val)
 
-#define this_cpu_cmpxchg_1(pcp, o, n)	\
-	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
-#define this_cpu_cmpxchg_2(pcp, o, n)	\
-	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
-#define this_cpu_cmpxchg_4(pcp, o, n)	\
-	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
-#define this_cpu_cmpxchg_8(pcp, o, n)	\
-	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
-
-#define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
-
-#define this_cpu_cmpxchg128(pcp, o, n)					\
-({									\
-	typedef typeof(pcp) pcp_op_T__;					\
-	u128 old__, new__, ret__;					\
-	pcp_op_T__ *ptr__;						\
-	old__ = o;							\
-	new__ = n;							\
-	preempt_disable_notrace();					\
-	ptr__ = raw_cpu_ptr(&(pcp));					\
-	ret__ = cmpxchg128_local((void *)ptr__, old__, new__);		\
-	preempt_enable_notrace();					\
-	ret__;								\
-})
 
 #ifdef __KVM_NVHE_HYPERVISOR__
 extern unsigned long __hyp_per_cpu_offset(unsigned int cpu);
-- 
2.51.0


