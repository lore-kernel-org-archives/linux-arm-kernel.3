Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38A4EC113C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 01:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kr4nT2BT8PGK/D1Q43aMJ3TWsyAUzb25RqrNR5DsqQ=; b=lNiwTU5IOSgKZIpRcv+qcz+8wd
	wkv9MA7WDl1LURvPDZKckjHIU7HbSorHBdVCNxGQ3AqwJFpppbQW+IKG3hUACuT3YDbLrWWYu9La+
	j/zovu0qchv7zTD84bhVfoZywM6qsNOBRUoDNxvAoE7sDR9GPdEIsHgx4dy1k4yHk565YIWogk4uq
	zv8uZeljvM+UNlLwnFVwC6GedgFBV6CTzkrZ3nc6KQQLwI+f8qFgYmmLww8LBKIJ87uh3pcLem6HN
	Onaq1pe61OhX+hRnWst1P54bSTqn7miFqaxWKD0hIuNHfm5S/mB94hM2gDN+S1u+OxHOdOZiESaRu
	zxpiPvIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhfB-00000001JYf-0z0A;
	Tue, 24 Feb 2026 01:56:37 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhf8-00000001JXY-2ULP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 01:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1771898188; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=5kr4nT2BT8PGK/D1Q43aMJ3TWsyAUzb25RqrNR5DsqQ=;
	b=QJUMRgWi4gPAKaro+SgXkW8d6VS9WabZBsWkHvu5tiDdUmvnzgnJfCqqupGy96GvSY5Psf+F3+JerINQjNv9aIUGSdh/ZIK0Jz7gVV7re9NT2LHr5+z/2brZ57124U69oC+lqPdnojYs99dfVzvoSdyFP/KKSkfVjvBpi+DFn/s=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WzhpS27_1771898184 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Feb 2026 09:56:25 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	riel@surriel.com,
	harry.yoo@oracle.com,
	jannh@google.com,
	willy@infradead.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	hannes@cmpxchg.org,
	zhengqi.arch@bytedance.com,
	shakeel.butt@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] mm: rmap: add a ZONE_DEVICE folio warning in folio_referenced()
Date: Tue, 24 Feb 2026 09:56:05 +0800
Message-ID: <e91eaa86a6fbb0682b4e308082048c688a57c035.1771897150.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771897150.git.baolin.wang@linux.alibaba.com>
References: <cover.1771897150.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_175635_045297_BE6B6617 
X-CRM114-Status: UNSURE (   8.64  )
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

The folio_referenced() is used to test whether a folio was referenced during
reclaim. Moreover, ZONE_DEVICE folios are controlled by their device driver,
have a lifetime tied to that driver, and are never placed on the LRU list.
That means we should never try to reclaim ZONE_DEVICE folios, so add a warning
to catch this unexpected behavior in folio_referenced() to avoid confusion,
as discussed in the previous thread[1].

[1] https://lore.kernel.org/all/16fb7985-ec0f-4b56-91e7-404c5114f899@kernel.org/
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/rmap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/rmap.c b/mm/rmap.c
index bff8f222004e..be785dfc9336 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1065,6 +1065,7 @@ int folio_referenced(struct folio *folio, int is_locked,
 		.invalid_vma = invalid_folio_referenced_vma,
 	};
 
+	VM_WARN_ON_FOLIO(folio_is_zone_device(folio), folio);
 	*vm_flags = 0;
 	if (!pra.mapcount)
 		return 0;
-- 
2.47.3


