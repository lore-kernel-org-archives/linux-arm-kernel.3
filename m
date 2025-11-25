Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5623CFD371
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 00:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eQOzOdTt+5ga5DERa19IdsHmZ9YtEuF1FLhAp11XwR8=; b=4MamdIO0ZueumAK+/83s/B7LDS
	12yIt+XFHQxf20xc47NHpURO/GIcSbvC6i24KqtgofUk/ZfVoVuwbi+Ny7dFaHN/yHaOzLvG4zxcq
	mbzESqbfV521HPG0Cg0chiCZVuG8j4H0fIGeSJKLGM/dgh4P0v/ot3Z5oOGKPIyvOSuMJ9N8Vmiis
	RAkH+u5FHtn2jvvckR5KgOLdL64qkgdMWTDO9w8RAA+yj8jlHdMzFywabxsj+DXMDisGASXzsamDm
	hSy9MAIeV3J2JeFDiVFNlgAArsNhLXMk0e46S8UXcjNKCjqy7NzhAoongEj3b7z1GAiEiYJebxfHQ
	JIvxAkCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNhMn-0000000CX2f-0JUc;
	Tue, 25 Nov 2025 00:57:13 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNhMj-0000000CX1S-1sso
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 00:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764032221; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=eQOzOdTt+5ga5DERa19IdsHmZ9YtEuF1FLhAp11XwR8=;
	b=YgvAHlM+0zme+xCFbDYD3CywZ81h/KvNHJNnLtt7wDStvntOmbbvlVN6d4cErKjjQVRY9D2nNEyKWAWOgwa2EvZiZBpxaf7sPBERDTvBwXc7giIIzNUU96eim2K+ZobLakshbLYKmIXQuYmDMxxOuLWeQHgLviVgd7bZ6L7QTb0=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WtL7S5r_1764032217 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 25 Nov 2025 08:56:58 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: lorenzo.stoakes@oracle.com,
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
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] support batched checks of the references for large folios
Date: Tue, 25 Nov 2025 08:56:49 +0800
Message-ID: <cover.1763976541.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_165709_641357_EEE5781D 
X-CRM114-Status: UNSURE (   7.98  )
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

Currently, folio_referenced_one() always checks the young flag for each PTE
sequentially, which is inefficient for large folios. This inefficiency is
especially noticeable when reclaiming clean file-backed large folios, where
folio_referenced() is observed as a significant performance hotspot.

Moreover, on Arm architecture, which supports contiguous PTEs, there is already
an optimization to clear the young flags for PTEs within a contiguous range.
However, this is not sufficient. We can extend this to perform batched operations
for the entire large folio (which might exceed the contiguous range: CONT_PTE_SIZE).

By supporting batched checking of the young flags and flushing TLB entries,
I observed a 33% performance improvement in my file-backed folios reclaim tests.

BTW, I still noticed a hotspot in try_to_unmap() in my test. Hope Barry can
resend the optimization patch for try_to_unmap() [1].

[1] https://lore.kernel.org/all/20250513084620.58231-1-21cnbao@gmail.com/

Baolin Wang (2):
  arm64: mm: support batch clearing of the young flag for large folios
  mm: rmap: support batched checks of the references for large folios

 arch/arm64/include/asm/pgtable.h | 23 ++++++++++++-----
 arch/arm64/mm/contpte.c          | 44 ++++++++++++++++++++++----------
 include/linux/mmu_notifier.h     |  9 ++++---
 include/linux/pgtable.h          | 19 ++++++++++++++
 mm/rmap.c                        | 22 ++++++++++++++--
 5 files changed, 92 insertions(+), 25 deletions(-)

-- 
2.47.3


