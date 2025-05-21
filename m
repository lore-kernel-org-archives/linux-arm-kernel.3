Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D99C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 01:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xTkM+0D8//f566GySy7EXd19ZJqJeoizAhZSsoZc1/w=; b=ucOn/Y/r3GLcVAi6nkLah/z5CE
	+zCDAPSF+c0sGQnJ2PJj0fVlCLnK7EY9Mw98h7Vbp4wsumw1c/AHpLvj18JpU36e6bT55T3JM3/sw
	Na7KexYg1lQ/xNMBCp+vztJdT7/D5Xibmcb4DBpa/PEl3oBQAxjVPkMXp+z5VacCEsZpx1DeZ5X7L
	dtBe3yJnZWSseNSLPpmFy8CTGhA6FIhkERyLrku6EF6MIbWCmcxoSc0VnDkUBjZwKKEvKWn0tqX36
	eJSgvERuswTjnQx8dqQZSZ/Vcx4+5tbiYCe+TvGYh3lt3Ix9TNcdFnld/nh+Sr3GM1rrah9N2xxg3
	IiwoUKeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHYa9-0000000EX71-3dYT;
	Wed, 21 May 2025 01:49:21 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHYY3-0000000EWz7-1aRx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 01:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747792025; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=xTkM+0D8//f566GySy7EXd19ZJqJeoizAhZSsoZc1/w=;
	b=mtarOv1oE6TnE5PvQLHGGAicnsHEt6p/LZrugBFKsPAuErHMADzde6OtwcS7MLeplOl1iDdivWCTCXAZlkt8m5OOwdhz8TJVpZoRWXHAe/lLZh03eQTRB/NDCXNmnzIBbTxAurOHLwGv4FDvolhIABDTQDpHPJWcCTvXjsAqW18=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WbPY5eZ_1747792022 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 21 May 2025 09:47:02 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH RFC] arm64/mm: Lift the cma address limit when CONFIG_DMA_NUMA_CMA=y
Date: Wed, 21 May 2025 09:47:01 +0800
Message-Id: <20250521014701.73046-1-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_184712_178508_1C0E7046 
X-CRM114-Status: UNSURE (   9.79  )
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

When porting an cma related usage from x86_64 server to arm64 server,
the "cma=4G" setup failed on arm64, and the reason is arm64 has 4G (32bit)
address limit for cma reservation.

The limit is reasonable due to device DMA requirement, but for NUMA
servers which have CONFIG_DMA_NUMA_CMA enabled, the limit is not required
as that config already allows cma area to be reserved on different NUMA
nodes whose memory very likely goes beyond 4G limit.

Lift the cma limit for platform with such configuration.

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 arch/arm64/mm/init.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index b99bf3980fc6..661758678cc4 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -312,6 +312,7 @@ void __init arm64_memblock_init(void)
 void __init bootmem_init(void)
 {
 	unsigned long min, max;
+	phys_addr_t cma_limit;
 
 	min = PFN_UP(memblock_start_of_DRAM());
 	max = PFN_DOWN(memblock_end_of_DRAM());
@@ -343,8 +344,14 @@ void __init bootmem_init(void)
 
 	/*
 	 * Reserve the CMA area after arm64_dma_phys_limit was initialised.
+	 *
+	 * When CONFIG_DMA_NUMA_CMA is enabled, system may have CMA reserved
+	 * area in different NUMA nodes, which likely goes beyond the 32bit
+	 * limit, thus use (PHYS_MASK+1) as cma limit.
 	 */
-	dma_contiguous_reserve(arm64_dma_phys_limit);
+	cma_limit = IS_ENABLED(CONFIG_DMA_NUMA_CMA) ?
+			(PHYS_MASK + 1) : arm64_dma_phys_limit;
+	dma_contiguous_reserve(cma_limit);
 
 	/*
 	 * request_standard_resources() depends on crashkernel's memory being
-- 
2.39.5 (Apple Git-154)


