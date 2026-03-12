Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D522D105A594
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O47sIF8zQKYoqYAlMRmvipbo3GkUFYMUhAMMwnpwdyY=; b=WYKhNRaC3Fb6m5JXss94RTRhLg
	00o22Wh7zbsNRWW4gbqczHMM5OBDk0BKqUJQjg+voiTdqWXgeioUJixuFvB4UeBDtAeZLpDH3wJPQ
	oZiSGaiq1xATr4DZ9ixTkvtDEY/EeEBdr5xPcJdifmBJF+RUdfovFp5a6HrB/cKWNWB/tm/AnfSq/
	HOrscDNPBjr9hz9i/+jugrHtjtA57qwmg7jwpek34ilsSC/f7f7WzJZjD9mByxMdQKWggz8uakcFS
	HGqO4TswcgUTSJe/1JZqoYH5KZIW2N0j7puth3cc0i54Tg5qDkeT6c5nzD1Wl/ke19PI+DH1FLU2f
	rEnEiKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fGt-0000000E3Ur-2FqJ;
	Thu, 12 Mar 2026 12:36:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fGr-0000000E3T9-1FYo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CA8643CA6;
	Thu, 12 Mar 2026 12:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69C1C4AF0B;
	Thu, 12 Mar 2026 12:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773318968;
	bh=X83G1zyfy7cCirzYpJUDZb4XiY3Tr2OOZB5qt2lkQcw=;
	h=From:To:Cc:Subject:Date:From;
	b=M/tPI1nqzSIdTEGcEnQl+bRkII7/fPTgtXqWHhtBdSEj2/BAXMr6mTTqUYHEKkgzQ
	 /JPYboBSFs7yn2XYewKQQKaUmmisMmRKo0StMypYjsZzAIYhcK1HKx4BNw3TTGVZiS
	 GaT63BCnmHa6CepfmE/AxgU53csICkZ5MEv4qRjz1DzsDdDh9ghCRfUFKVfIAJGmkl
	 06a4eps2HGzqzQpfglGH5HUECN2A88xWHZMDPgcMqJYJOqStSI8DeCAJjdFvTCsWcZ
	 CDmgPPv5pacMD678JdR4CYmwr4egXDDtX/s6ThPtj+79CUOslzVZHZ/Rk+bMvUP7ma
	 716EUl0l2mKcA==
From: Arnd Bergmann <arnd@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>,
	Marc Zyngier <maz@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] KVM: arm64: fix include path for ring buffer implementation
Date: Thu, 12 Mar 2026 13:35:42 +0100
Message-Id: <20260312123601.625063-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_053609_358600_79BDEF46 
X-CRM114-Status: GOOD (  12.71  )
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

From: Arnd Bergmann <arnd@arndb.de>

The simple_ring_buffer.c file is in the source tree rather than
generated at build time, so the include path is wrong when using
separate object trees:

arch/arm64/kvm/hyp/nvhe/trace.c:16:10: fatal error: simple_ring_buffer.c: No such file or directory
   16 | #include "simple_ring_buffer.c"

Include it from the source tree instead.

Fixes: 680a04c333fa ("KVM: arm64: Add tracing capability for the nVHE/pKVM hyp")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/kvm/hyp/nvhe/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 143d55ec7298..3d33fbefdfc1 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -33,7 +33,7 @@ hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += clock.o trace.o events.o
 hyp-obj-y += $(lib-objs)
 
 # Path to simple_ring_buffer.c
-CFLAGS_trace.nvhe.o += -I$(objtree)/kernel/trace/
+CFLAGS_trace.nvhe.o += -I$(srctree)/kernel/trace/
 
 ##
 ## Build rules for compiling nVHE hyp code
-- 
2.39.5


