Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF406F51410
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 06:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTT2hSwhIX0sy9uprNVi4qKHugU4cvVQ3G9ad8x784g=; b=20bor1UZoTNDk3GHnNyku8G95n
	PS1gWReueYa+fH1IfFhxolOu1cUOhd7RL9SdsGgQ+dbtRNlOOyvVrcUFYbD3fhDG1c/wzEavR15mk
	DPccQgqw6kjy9LaqQbAIOoBk92IjKIBO03j8nae8fW+QvAbCP9l7P73yWIyQL+7zl8/jBTY+3noun
	liEEX/VU7863hwpBCy2n5OsM6mSx0H8fhXdbT/iBrZRmwS/doCVtQ5f3ESZl49IjkwkSvRC7/SUZC
	HHlP8WedZrulGxj1MWGBNc3wr4ten+J0ihBQC2JX9ZnaqNzwkXlToT0nGTbXpjXqWXVthQfp7xiD9
	0CoCWzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOv3-0000000361f-0PWG;
	Fri, 06 Mar 2026 06:44:17 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOuw-000000035wL-0aAZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 06:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772779446; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=HTT2hSwhIX0sy9uprNVi4qKHugU4cvVQ3G9ad8x784g=;
	b=w5yF0tBG0srvtuPWG6VFFoJMPCPZn77wmvoSI1d5EQ4srq8VoRxG21D9VtRw7fGvdMBEws9cSd1Fi2aXis0PsPvMLnQUwmvTpY79Nnk+4Wf2lNxFYz7ZhOvZiDLB3CwAQRmrsuxlzeNQtH5K1mlD1ALn8u8uFZEXueiAMWzVpL4=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X-MKhEA_1772779441 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Mar 2026 14:44:02 +0800
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
Subject: [PATCH v3 3/6] mm: rmap: add a ZONE_DEVICE folio warning in folio_referenced()
Date: Fri,  6 Mar 2026 14:43:39 +0800
Message-ID: <64d6fb2a33f7101e1d4aca2c9052e0758b76d492.1772778858.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
References: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_224410_397425_07B87F1E 
X-CRM114-Status: UNSURE (   8.86  )
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
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/rmap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/rmap.c b/mm/rmap.c
index 603186ff4ba5..2d94b3ba52da 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1065,6 +1065,7 @@ int folio_referenced(struct folio *folio, int is_locked,
 		.invalid_vma = invalid_folio_referenced_vma,
 	};
 
+	VM_WARN_ON_ONCE_FOLIO(folio_is_zone_device(folio), folio);
 	*vm_flags = 0;
 	if (!pra.mapcount)
 		return 0;
-- 
2.47.3


