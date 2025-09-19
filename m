Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A242CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 18:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vgLTYHWYvFS6X1gJg4qSeHHQhl7ZBlr3FtTxte5x4t4=; b=U95s0KwyTp3QTeywrzWCc2apaI
	XuKMnMg0F2YlP++wB2HqeMFzlp4IuLz9pjUJy+nY+D8vTD+bBqN6whaRkKVS6xXTH6GLRwVjVLgQD
	PFz8K5opAo20LmUu/t4BJ68ga78K02L48SLHQa/VHSN73oV8hcCmdnhpxyjl4a+soBoaim1yGTwp4
	hhw2bksMXZZmnVwpufMGHl0R/pMF1xrV6bkwi37FMdMtva5t204xLaiF52j/qQ2ru8KZ8S0hEloNx
	k7KivnQx6eHKv/PpG/f+vHlSd5z3v7BAnLIWlPQv0KeNFOp+5rgfVVmW3SW0dIEuNnN8B7R8zWw7B
	1ur05wQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzg2S-00000003nMr-0TLD;
	Fri, 19 Sep 2025 18:40:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzg2Q-00000003nMi-43j5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 18:40:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C43F60140;
	Fri, 19 Sep 2025 18:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD823C4CEF0;
	Fri, 19 Sep 2025 18:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758307253;
	bh=FQnOFM1F0itW/iszcCGggYVZvZGYm+S4YRJE97YXAuM=;
	h=From:To:Cc:Subject:Date:From;
	b=hFvbuftl+RX1FitUodWKdQJVkUZeDhWzfgQYZqXBH0T/hjJTcJVF/LS3q9L3Orj+V
	 2xCaZyeA3RwptHtIUvMvJK6crFzQ6md+no9slpm8Q/PrmhYZzP7YS/3qsOvrbKZl0N
	 z9ODS3IPcXWpaFAWnqlIBEgUzX7PDRDuWnp3Yhn0aGe2Juz8sqRSS20dk/7zBiygiE
	 UuXn790VKC3dL9Qh0xMIaFp1HVz40MqXOc7ACXsLff26x+m6Ux7U08HyiQ0SMzZf95
	 9fWviNCcVnP0hjkHuYF5eTsymz9QxfWJo1rFF+NioNZd1jdPXVdF0ae2qH/cjYryU5
	 uHqF+oXU2ZzfA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Hanjun Guo <guohanjun@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN
Date: Fri, 19 Sep 2025 19:40:25 +0100
Message-Id: <20250919184025.15416-1-will@kernel.org>
X-Mailer: git-send-email 2.39.5
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

Big-endian arm64 configurations are vanishingly rare, yet we still claim
to support them in Linux despite very limited testing or visible
interest. Supporting big-endian adds unnecessary burden to reviewers and
contributors which, without any known active users, is hard to justify.
For example, recent work to improve our futex routines and to implement
nested virtualisation support is non-trivially complicated by having to
support both big- and little-endianness.

Back in 2019 [1], it was claimed that Huawei were using arm64 big-endian
machines in their telecommunication products but I don't know whether
that's still the case and certainly haven't seen any patch contributions
to help support or maintain it.

Make CPU_BIG_ENDIAN depend on BROKEN as an initial deprecation step
towards its removal.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Hanjun Guo <guohanjun@huawei.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/linux-arm-kernel/73701e9f-bee1-7ae8-2277-7a3576171cd4@huawei.com/ [1]
Signed-off-by: Will Deacon <will@kernel.org>
---

Cc'ing Guenter as a heads-up in case he needs to turn down his testing
to avoid this causing a false regression report.

Cc'ing Hanjun and Jonathan for clarity on the telecommunication
situation.

 arch/arm64/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e9bbfacc35a6..5ac670d41604 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1493,7 +1493,7 @@ choice
 config CPU_BIG_ENDIAN
 	bool "Build big-endian kernel"
 	# https://github.com/llvm/llvm-project/commit/1379b150991f70a5782e9a143c2ba5308da1161c
-	depends on AS_IS_GNU || AS_VERSION >= 150000
+	depends on (AS_IS_GNU || AS_VERSION >= 150000) && BROKEN
 	help
 	  Say Y if you plan on running a kernel with a big-endian userspace.
 
-- 
2.51.0.470.ga7dc726c21-goog


