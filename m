Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F72CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 04:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOOCtXcGKd5JxZcYNa0CCaNDWtbGtVPpAZnPySAOdUY=; b=QTK2j/N6EAFgHZM4OyWRVSrNrm
	RtmB7+GCacVEiloiGb/QlVwl8+O7rSJaLOQxm3267jHqo/gZD5DMa0U6no6MoJ34om6ej2T8Ntuqw
	z45O9ctX6MKORZFEcValnqp+vAdkGW6p7po4XBYqosfNYAsxo+iczSSNUpjyaqB9TC7aLl/d3D2u/
	+2RSM/7oT1M4+WFiI6cHIQMgJNS0wa/8RVoKqz0rNbwgNR8VPTdWwSE/jAtyZ49QntrR9PqV6230F
	DnFfH/XoP+YWRNjNTOuNzsqTOK65I5vlEL8GU26nY9E1p9APDihCbaV/9BEfJ/2hYsV9nAyVaEmIX
	6esXgqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtlP-0000000AM7q-2z2g;
	Fri, 12 Jun 2026 04:45:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtlN-0000000AM6l-1sNb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 04:45:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C26E2E91;
	Thu, 11 Jun 2026 21:44:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BAF13FAF5;
	Thu, 11 Jun 2026 21:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781239499; bh=b00TklBGecqQHLra7PJTRi5mE5kXZpjh3sOy2Gf7YPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q+ywobdJtIBtiIj1Lm87NJAvMg5U5ZyPO3GOiZE5j7oUMWa2LPjn5dzWP/UcvIfsR
	 eAIppw1XHah98pdVj9WRrylHYixsfy899jM7BhUXauI0syxEiAplt27uUuk/UZ4Tct
	 1rn0H7QLZBrriUcOjns9J7XKs7UrCuhBG1BRs4Wk=
From: Dev Jain <dev.jain@arm.com>
To: ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org,
	corbet@lwn.net
Cc: Dev Jain <dev.jain@arm.com>,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	kaleshsingh@google.com,
	21cnbao@gmail.com,
	david@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com
Subject: [RFC PATCH 1/2] kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
Date: Fri, 12 Jun 2026 04:44:23 +0000
Message-ID: <20260612044425.763060-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_214501_526485_2FAB7815 
X-CRM114-Status: GOOD (  10.31  )
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

In preparation for adding "tag only on alloc" boot time option, use
KASAN_PAGE_REDZONE instead of KASAN_TAG_INVALID for poisoning the tail end
of the vmalloc allocation.

Although both values are the same for hw tags, KASAN_SLAB_REDZONE is used
for poisoning the tail end of a kmalloc object allocation, so maintain
the pattern.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/kasan/hw_tags.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index cbef5e450954e..c1a2b48808ed7 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -375,7 +375,7 @@ void *__kasan_unpoison_vmalloc(const void *start, unsigned long size,
 	redzone_start = round_up((unsigned long)start + size,
 				 KASAN_GRANULE_SIZE);
 	redzone_size = round_up(redzone_start, PAGE_SIZE) - redzone_start;
-	kasan_poison((void *)redzone_start, redzone_size, KASAN_TAG_INVALID,
+	kasan_poison((void *)redzone_start, redzone_size, KASAN_PAGE_REDZONE,
 		     flags & KASAN_VMALLOC_INIT);
 
 	/*
-- 
2.43.0


