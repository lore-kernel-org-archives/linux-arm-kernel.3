Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C55DCD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjikVzeHQvQn86OhIn4rkOMRYcykRqfrspB/jiiXnos=; b=kaAJCPVs+EcyevzVak6jc5Ekud
	QJT+sJMqv2iW2ICmwWhTZO7smiwhcOEt91IEyFEWT6PqGc7KWZxbruhy1iGL2lJy8suXPonfYMS3u
	wNjh1yGskqjUh5WvjyBD9RvZIe5Jg6OAadgbe/yPtYWYzk786Ivpffe4c2vJsOVKhHeNBolzPavRL
	RtF9G+HdLa1AukIrdwqDtvhDMm9iccJJZP4uiXcP5DaoJNQ1b29TxhTaO1fOHReNO884qP9d7U8Rx
	FiV/vPtUQC74ORhAb8eiDz95vRrdyre+ADgA9NM1zMkGroPoZ/HdXdNtHz9pE9eEBZ24JsfbJGpZk
	1EIOL48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxcT-00000005nwL-2nGM;
	Tue, 09 Jun 2026 14:39:57 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxcR-00000005nus-0sBP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:39:56 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c862b05a78bso97517a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 07:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781015994; x=1781620794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjikVzeHQvQn86OhIn4rkOMRYcykRqfrspB/jiiXnos=;
        b=MiIxf+E1MuIDSQ86V9AJGoqw0XzwkI4ZqgehY9F9NaQOWu6etNDZROGxAu6nNh6TCr
         F5aGJz4nSK4BwhbpX7Ct/fup4KOA4mrlm8XsOg7pAuAInrfOWGrmUGUKgl9e5VUHseWC
         bINvkf4cznYKc0D4w1MIeDr6T6UvDjwVbglM3Z8LEn4RGVOgvsc4GG2eSsnhJmEyl7uo
         whIMuSzD88n4ZHnnOwPQx152UNWzve+WampZaK6mvRpkf9SQnIJPouLQHeQSnAya78yq
         uRAv2w3ok0FnbVbFzs+d9eGuGpyqo39v/77p1fA7rZhg6fp2dQE8XjKrmLMhu3DmngWW
         lyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015994; x=1781620794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xjikVzeHQvQn86OhIn4rkOMRYcykRqfrspB/jiiXnos=;
        b=KUhnTWoeSZTLrT99pmXTSZzMGRJPKMgig2+fXBtFkWFNadv63YvuSoIHmVYyl/WVsQ
         Rd15RDzDKU28A5dSc/qPL/F2mcxDNd7ZZ6+MxPgevSnnys95ghDoorf9Bl92NuC3R9ER
         g1Z2RgN9NYTM2pICcfkjhv81s4HwMvDopuIZzI6y9125FyzqzMpykl0lV9shLzkAW/bF
         7XdM591L6pzR1Gdm+SgB44IlbkjPbqgib+nhbsa/sUHI1XKXnB06+zBh0Eeg4Oe5ha70
         MkeZKDhRhZrVN6fJDZA/zKQHNJ+wxygoSN0bLBklhf03YCO+uP6lAmL0r8DgjN+xbMAB
         UNug==
X-Forwarded-Encrypted: i=1; AFNElJ9XAkULnI8IdTf98VwSV0X499FeO7aWwZzaKqFMN7nFNM2+5tc32++hyvoLmMbIZmyX0b/oL5IEmrUvReXvp+4G@lists.infradead.org
X-Gm-Message-State: AOJu0YwaQux9AueoeuaMdj3D4PjgIX2NB1+WEPhS6KQ8e79CUENpvrfn
	dDp6T3xY73i0LnMj9YPP5YrS2FYPDnGAIlHaBxrujZoL+V9VU0YeCT6R
X-Gm-Gg: Acq92OEayOvX1whogCbp2x2ab183XHm1VtGqGDCZsWeIIrkVyumGfYYv1Wxg7THc6ds
	HM+b8OfyEwoZ2XcUZ6Hv93s0RAyyU37d1oggByVpBBrP6IIpLBLsQp83jB7qmahKoekJCBm+K1s
	gs6InVM3H2SSRygoPyjMPQuHWtJe2SnBc5Vq4sv4T87SR6xVKntZ6m13yjINKk1KA7FYsAwY5Bh
	wywLNzvlLh8VfDWUKq78LBDG5TgCAFjzCa0GKwD1HDBAUqvR9e1M6sscBO/Nb/HM46N3vbBVWB7
	DO9hpkm0LLv2FTIAHu2oliyAB/1PeReEvXTXQL2sJKyC4r/qrhbODvUswtrqMqmlDCwL4ad0Pie
	GfFoccAn5RlrYYGb6xPt/sDUMr82XnTScYXf7FazJnMr54zitHsd2iPZMceVyNi11gs9jemaVlL
	u3j9VcqxAtXCRqEKV3pJqPkPUHFiIOfa1r3UBAK2zgO2z+1XeAKgL9ZvI8RY8yu5sO3eVBR50Qv
	FqAFjb72xYHYasKsHsiJGru
X-Received: by 2002:a05:6a21:699:b0:3b4:82e5:b906 with SMTP id adf61e73a8af0-3b4cd424041mr11738801637.3.1781015993812;
        Tue, 09 Jun 2026 07:39:53 -0700 (PDT)
Received: from o6.lan ([188.253.112.242])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b315esm17939677a12.26.2026.06.09.07.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:39:53 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	hpa@zytor.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [RFC PATCH v2 3/3] x86/mm: make pages read-only in the direct map
Date: Tue,  9 Jun 2026 22:38:01 +0800
Message-ID: <20260609143801.7917-4-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609143801.7917-1-xueyuan.chen21@gmail.com>
References: <20260609143801.7917-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_073955_247379_FC11635A 
X-CRM114-Status: GOOD (  10.84  )
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

Implement arch_make_pages_readonly() for x86. Make the corresponding
direct-map range read-only so unexpected writes fault instead of
corrupting shared contents.

Reject highmem pages because they have no permanent direct-map address.
Treat the set_memory_ro() update as best effort. If it fails, leave the
mapping unchanged.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/x86/mm/init.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index fb67217fddcd..ff0a7003eaeb 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -3,6 +3,7 @@
 #include <linux/ioport.h>
 #include <linux/swap.h>
 #include <linux/memblock.h>
+#include <linux/mm.h>
 #include <linux/swapfile.h>
 #include <linux/swapops.h>
 #include <linux/kmemleak.h>
@@ -38,6 +39,14 @@
 
 #include "mm_internal.h"
 
+bool arch_make_pages_readonly(struct page *page, int nr_pages)
+{
+	if (PageHighMem(page))
+		return false;
+
+	return !set_memory_ro((unsigned long)page_address(page), nr_pages);
+}
+
 /*
  * Tables translating between page_cache_type_t and pte encoding.
  *
-- 
2.47.3


