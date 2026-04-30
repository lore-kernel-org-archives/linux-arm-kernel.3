Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F806FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 04:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjOwhtb3aLC8dXcF5fdBlXdpp4mSyr4Dq8lBNuOOORA=; b=0/KdgzkA/Voouvj37XB3kyOb+b
	ZJ1ZnPPOJOZp3loaIwxALlAgqKNrSkMTW0gnwTUdB1E7fhk3KdxeKZMO0cwNxkiuqb2S7tk94Y5iD
	d9Sx7QW7Ine4BdU6jUPeWhYSQs7Cdw7ZhRJ0ncsqRGbjocGYVJ5D5TSOwGuG3b7YOfdTnmSX8Y8K4
	y3uTJIwhQYgrLvbW/4L3udd423UxEOqwlyX3BGvcHrn2VB29F6bYtsj6XeXrhephybdpvkFG2RNSy
	kkyDTrYk7/AoSYbuGaDpXvTzLfPYafMBfEVD051xCIT9nCvfVtm9bWZfIDIo/3iDMqpyT6eTOrrQX
	ENqrqGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIf7-00000004dPg-3EXF;
	Thu, 30 Apr 2026 04:06:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIf6-00000004dOQ-1SZe;
	Thu, 30 Apr 2026 04:06:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AjOwhtb3aLC8dXcF5fdBlXdpp4mSyr4Dq8lBNuOOORA=; b=gbVNsHmfrp3dlnjUGbqZ5l8qiS
	ROaAwj/M+qCPklMStrP21+ynBPts0egtBU3vG3bBx4KbGWCr//7YmlnyiRfgWLPQLtUylBcdBJ9T4
	gcsP/UBxqetm6r2p0uXfsiyGWi4k4juHiKCCAQ4uONz1PNpUW7FggJmNznthVmKu+MwSvB0Snbwtz
	8DsUCuGRVaZ40T7AFxQn6Xi8laLNALkCZ/T839DfMYtOfvV2acymB8bgJ5PAgCdCaAAWcAi8ajS3G
	ZImC3+gqobX4QTo3tYV6PZos4A5aXSfX3mut/uZn+gpEXCogrUYWvnDuAc91W77irvP3VyCnGSZsy
	7qFj8BSQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIeT-00000006afk-30ou;
	Thu, 30 Apr 2026 04:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 953E9417E4;
	Thu, 30 Apr 2026 04:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B00CC2BCC6;
	Thu, 30 Apr 2026 04:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777521914;
	bh=6MPYWPf1QbIXw7VCTkYtFV9yBQTJYYcQnuchAn2u66s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uJyCN/cPD0/zuU5TMG/FWh17eVTVcTCG22wyND+Ln22vdCzvScs+KeOLVG9RmOssZ
	 jDw1d8PhCAGGbMI/IFgx4Z5EBNcmkVO03z+9/CJtVz3K4wxUxjDLHuhXQrygfZY0vj
	 Mz9EPYWMtvXMUkv1GvrXcIXqYy7f2Nbz3f61nlophvJmqpD4ikN6UOlFyXJonZi3kU
	 apK9iwjy49sl7fMM6lNjIBPwaa1bmY1pG/z4xtRWqVUh4kt9XKZhnZLwyhRWE61vDF
	 fxzmTVdxergJndpikZIoTxLjBRYHAUamicyvLwT/yqUnIVLaZSAeOqCic0yYJ36c4O
	 EWCGitvEei8LA==
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
Subject: [PATCH v2 4/5] mm: Don't retry page fault if folio is uptodate during swap-in
Date: Thu, 30 Apr 2026 12:04:26 +0800
Message-Id: <20260430040427.4672-5-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260430040427.4672-1-baohua@kernel.org>
References: <20260430040427.4672-1-baohua@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_050528_898727_B2C9EDCC 
X-CRM114-Status: UNSURE (   9.94  )
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

If we are waiting for long I/O to complete, it makes sense to
avoid holding locks for too long. However, if the folio is
uptodate, we are likely only waiting for a concurrent PTE
update to finish. Retrying the entire page fault seems
excessive.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/memory.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 0c740ca363cc..a2e4f2d87ec8 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4949,6 +4949,13 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	}
 
 	swapcache = folio;
+	/*
+	 * If the folio is uptodate, we are likely only waiting for
+	 * another concurrent PTE mapping to complete, which should
+	 * be brief. No need to drop the lock and retry the fault.
+	 */
+	if (folio_test_uptodate(folio))
+		vmf->flags &= ~FAULT_FLAG_ALLOW_RETRY;
 	ret |= folio_lock_or_retry(folio, vmf);
 	if (ret & VM_FAULT_RETRY) {
 		if (fault_flag_allow_retry_first(vmf->flags) &&
-- 
2.39.3 (Apple Git-146)


