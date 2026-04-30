Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33479CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 04:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+UUS7GUGZaVgbrELoIxuwWRfwzqtpp9mPPWbq3QxPI=; b=qnrHWX/1iWgKKeBy2vf+lwftXa
	6dkbBbTKp2J6+o4S3GjdOocQxX/SmTfD9qF77ZgEO0jxLQ4ZTUGMOdhO8+akpu8Xfeye67EgpPdGx
	hW1+FWNhzx0PF20Z+Wl7f7C1z4rkilPSSKhMSq9Kd1LhppZEJlYTHTEHWEdYr5vRVb9boxxDqui37
	J9Q6pVg411VRh2DfYt/0kx7j+vm/7sCdPTx5pHAr8qRrU46AcRH5unqAHO0B+TKgdeFiPLfSvqvhO
	hVrrt5q4Lq8vIbEioYzOWdwR3z+7gcF2EPaXgneuF6dx5+Fr9ZMCdCSyxNfYxU+wGvsJLlXZAiTvh
	DIaF5qkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIe9-00000004cnw-3cdP;
	Thu, 30 Apr 2026 04:05:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIe8-00000004cnT-3GYE;
	Thu, 30 Apr 2026 04:05:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A3E16132D;
	Thu, 30 Apr 2026 04:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C627C2BCC4;
	Thu, 30 Apr 2026 04:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777521903;
	bh=3UzddeMl13pC5cJUrT4HHkjYBFF8Z0grqJoknqLkHzk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mKwVglCF7XEsFftOn0BAtLwGM5IZ72wXKgPaG3s9rdnfQtx+pmDdlMhp0BTc5EYNf
	 FJboHwOiMXC33Onbze1GSoNvzLlFPIK9rhRrqSsueRkYACFW51iYCE+t5LiSSUtrDZ
	 6Zgo/egoBF46WoaKKLJpL+hNtjheakCbbtpFjT8y7TDrK7Ows6M9EqK3rdErLUzivK
	 4Ay85oZFt3iFrC53ukdn7sqXcw6md9eq3jFLK0YjDszHvyQDD9gHGtkAjd47bH+XH1
	 stGeQfEGcaAiSsSh1IY9gXD9Yt5DxgBQ/zzQ6kcBG30A7WMR3XO465Eebcb6ZNIjyv
	 BawWjDw+St+Lw==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	willy@infradead.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	jack@suse.cz,
	pfalcato@suse.de,
	wanglian@kylinos.cn,
	chentao@kylinos.cn,
	lianux.mm@gmail.com,
	kunwu.chan@gmail.com,
	liyangouwen1@oppo.com,
	chrisl@kernel.org,
	kasong@tencent.com,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	bhe@redhat.com,
	youngjun.park@lge.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [PATCH v2 2/5] mm/swapin: Retry swapin by VMA lock if the lock was released for I/O
Date: Thu, 30 Apr 2026 12:04:24 +0800
Message-Id: <20260430040427.4672-3-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260430040427.4672-1-baohua@kernel.org>
References: <20260430040427.4672-1-baohua@kernel.org>
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

If the current do_swap_page() took the per-VMA lock and we dropped it only
to wait for I/O completion (e.g., use folio_wait_locked()), then when
do_swap_page() is retried after the I/O completes, it should still qualify
for the per-VMA-lock path.

Tested-by: Wang Lian <wanglian@kylinos.cn>
Tested-by: Kunwu Chan <chentao@kylinos.cn>
Reviewed-by: Wang Lian <lianux.mm@gmail.com>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/memory.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 199214f8de08..00ee1599d637 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4791,6 +4791,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	unsigned long page_idx;
 	unsigned long address;
 	pte_t *ptep;
+	bool retry_by_vma_lock = false;
 
 	if (!pte_unmap_same(vmf))
 		goto out;
@@ -4896,8 +4897,13 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 
 	swapcache = folio;
 	ret |= folio_lock_or_retry(folio, vmf);
-	if (ret & VM_FAULT_RETRY)
+	if (ret & VM_FAULT_RETRY) {
+		if (fault_flag_allow_retry_first(vmf->flags) &&
+		    !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT) &&
+		    (vmf->flags & FAULT_FLAG_VMA_LOCK))
+			retry_by_vma_lock = true;
 		goto out_release;
+	}
 
 	page = folio_file_page(folio, swp_offset(entry));
 	/*
@@ -5182,7 +5188,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	}
 	if (si)
 		put_swap_device(si);
-	return ret;
+	return ret | (retry_by_vma_lock ? VM_FAULT_RETRY_VMA : 0);
 }
 
 static bool pte_range_none(pte_t *pte, int nr_pages)
-- 
2.39.3 (Apple Git-146)


