Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF02AE8FDA0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 06:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7W6lTO5HqhdsUdqMUK0JVCIeu7zAS4i6K6mEqBoWdOw=; b=ChVazh9TnS6DzahSElgX24R48W
	gpz0jObDBU2gQ683IAWySyshAwSJR1vCHhrQt5dXSzRgjrIXu31f0AUzXusxyoVQTwEPVMTO9gulV
	vDMTQQzjklQwtfj0K8Abax5ptKO3pKm6DK/4kdjAgfNKuNs7Ry6E08v66foPFBHOj5D1hGxQiYc+Q
	HoBiCbaUAaJqvm5M5iM6ViF4hT7K3bO0jETp+FherXbrQAg/yAseHl8t4nWCt9ZF5YQ02z2SGC0z6
	1LYTG7AcSfcmAByEcAENh3MS0ZqNtGAGxDKM7s6qBeMeVxQ4ClVGwOUZCPDlnc+cjo2TUQbFabW50
	eYH/Qbfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ1Td-00000000xt8-0PhX;
	Fri, 26 Dec 2025 06:39:05 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ1Ta-00000000xsg-1VGW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 06:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766731137; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=7W6lTO5HqhdsUdqMUK0JVCIeu7zAS4i6K6mEqBoWdOw=;
	b=SEkeKihEgQoS1AnKwQw/HHH5JeF1l1c1ktJdjfBEN9SFufzpD7QrDuOk9pYRrMBIIDiwjVyUrBlxU7pKyi6ltKzA6Ied5okLtXWD9X0X78f+vQv/4SxVDihaR80hB32OmTPmFXobapuFlsy/eigFzajlSGP+O6WDqf0M/ZG439s=
Received: from localhost.localdomain(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0WvgaM6Q_1766731125 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 26 Dec 2025 14:38:55 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	linux-mm@kvack.org,
	baolin.wang@linux.alibaba.com,
	Weilin Tong <tongweilin@linux.alibaba.com>
Subject: [RFC PATCH] arm64: Kconfig: enable ARCH_WANTS_THP_SWAP for all pagesizes
Date: Fri, 26 Dec 2025 14:38:00 +0800
Message-ID: <20251226063759.4020782-2-tongweilin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_223902_907361_997CC347 
X-CRM114-Status: UNSURE (   8.55  )
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

Currently, ARCH_WANTS_THP_SWAP was limited to 4K page size ARM64 kernels, but
large folios requiring swapping also exist in other page size configurations
(e.g. 64K). Without this config, large folios in these kernels cannot be swapped
out.

Here we enable ARCH_WANTS_THP_SWAP for all ARM64 page sizes.

Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
---
 arch/arm64/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 93173f0a09c7..58f7b4405f81 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -120,7 +120,7 @@ config ARM64
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANTS_EXECMEM_LATE
 	select ARCH_WANTS_NO_INSTR
-	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
+	select ARCH_WANTS_THP_SWAP
 	select ARCH_HAS_UBSAN
 	select ARM_AMBA
 	select ARM_ARCH_TIMER
-- 
2.43.7


