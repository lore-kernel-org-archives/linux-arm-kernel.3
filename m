Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004BBC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 16:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAf1EpB3RHV5nguc56M5OiGGTGDZlSOZIyII2hjqUoc=; b=NpXPN7EtjRdlBZj83mb4Xt0Msi
	FywoxTNynEBcxsXMqUnDRJOm6JoTrkUnnS89HJdb7EfE0wI8+0KeO5HuIg0NtN8IMx/DWTjDnKHYc
	x5GrC7RdTCp7nFCLnr0IyeSq/tjrDD+lGkBUh7f7x21Lx0WZIe9apDBY7b5I1MSu+s4aCVVssCBIb
	T+8HnkzfoT78G7kBN6ljzLvniV7bxABGJijqEW7D9b716AviB8o0zNerNDsTxXCEdlT1UmSSxcxWs
	/jL0xGOARaFRgwrOHtRpR2PcM9Ir/US2JeVne/MhpWX8k/GnGDzp+/XFjU+UYACvbNdQqUvWX6g/T
	QXnQ05aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgmfI-0000000ESpx-3SXZ;
	Fri, 16 Jan 2026 16:27:12 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgmfD-0000000ESpR-0YIi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 16:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1768580819; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=FAf1EpB3RHV5nguc56M5OiGGTGDZlSOZIyII2hjqUoc=;
	b=Wgsww7VBCiHvKyvUe95Z7ZBlP4hCY7rICkPcYK5nCXNgTOdbhXGn6u6xWGwPKadfZuXPrhO3VWG67+wP6PwozlacGuuqD6+i2Rkoj1a+rv1e4ahhxTxX31UI8WBgHakXpqgO+ie36Jclll3HlgMzfi5mcpXF8vD1567qGEs6LJc=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WxAk08M_1768580817 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 17 Jan 2026 00:26:58 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: baolin.wang@linux.alibaba.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	catalin.marinas@arm.com,
	david@kernel.org,
	dev.jain@arm.com,
	harry.yoo@oracle.com,
	jannh@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	riel@surriel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	surenb@google.com,
	vbabka@suse.cz,
	will@kernel.org,
	willy@infradead.org
Subject: [PATCH] mm: rmap: skip batched unmapping for UFFD vmas
Date: Sat, 17 Jan 2026 00:26:52 +0800
Message-ID: <20260116162652.176054-1-baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
References: <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_082708_795323_09971954 
X-CRM114-Status: UNSURE (   7.80  )
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

As Dev reported[1], it's not ready to support batched unmapping for uffd case.
Let's still fallback to per-page unmapping for the uffd case.

[1] https://lore.kernel.org/linux-mm/20260116082721.275178-1-dev.jain@arm.com/
Reported-by: Dev Jain <dev.jain@arm.com>
Suggested-by: Barry Song <baohua@kernel.org>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/rmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/rmap.c b/mm/rmap.c
index f13480cb9f2e..172643092dcf 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1953,6 +1953,9 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
 	if (pte_unused(pte))
 		return 1;
 
+	if (userfaultfd_wp(vma))
+		return 1;
+
 	return folio_pte_batch(folio, pvmw->pte, pte, max_nr);
 }
 
-- 
2.47.3


