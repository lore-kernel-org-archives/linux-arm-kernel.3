Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74538FD5323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFvgQ+JoosgOuHvCEtm/wySIDfFeyNBVmJ3HBIM12WU=; b=1DBQpV3vo6aBnJeXDQBA1LROOt
	3yiZLHRdkhpmo4+kMsiVhF4VOt/l7wIFscAI/jfDeAbEHkoQi2RGf12USEHBGR/VwO6Z+3QJvbViP
	2cAtU/WK1XYL1fMNw+Bm7eRHTNPqBjAHivCdg/eGckhOlsrNtcXCPmob+qBTMIiie+50X69Pm89Fl
	4zw7eiJmOmttxr1PistYVlzNPeNK1cZ4KpcXR57sbJLQlMzz+zCtiXZVad85euVgo644QDgrtztL2
	qSRmHalQsu58/q60zNNkHRdefEUcS5KEY0E/5TTNZ81Pap9JjZOdQ+s6k3GU9Olw5+sa53vUPS3km
	fzun8TdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuPK-00000008A2r-3p6w;
	Fri, 27 Feb 2026 09:45:14 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuPH-00000008A0P-0Ft5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772185496; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=TFvgQ+JoosgOuHvCEtm/wySIDfFeyNBVmJ3HBIM12WU=;
	b=MN52tlDrVxlU2YBhdh34hRUl2Or13cX+jf1/VE9Il5HznzvPMH2VeSdquDkZnElioB0KH3VcdWTCfGtgs4WWiPTUxF+uqDUasIzXgp2fnuCQsrZfZUBNN1S2+Lz6J09ghDqOgB1zZA4QhhdTmtuvZ/niybo3JyroYIwLu1fw5/Q=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wzu0LeH_1772185494 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 27 Feb 2026 17:44:54 +0800
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
Subject: [PATCH v2 3/6] mm: rmap: add a ZONE_DEVICE folio warning in folio_referenced()
Date: Fri, 27 Feb 2026 17:44:37 +0800
Message-ID: <6562be8c92e07f0a69c8ffd4016d1b1e55198af6.1772185080.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772185080.git.baolin.wang@linux.alibaba.com>
References: <cover.1772185080.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_014511_696539_97025CB9 
X-CRM114-Status: UNSURE (   9.23  )
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
index bff8f222004e..11cc6171344f 100644
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


