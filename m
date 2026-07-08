Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1836DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DxyegdDTBkuws1o4l0mkPGvs9ZTLGu40cJligZL/Yo=; b=Uuchxop60+U/qOrHnjUbtgZYhV
	UXnAOoI2mL4qhvwEeQulxvHgwaZ0jhQYcD6ovtC5ltw6NdASzJBXs2HPsVB+bFDKYzt4kCxAMECzq
	K5iiduMCh7/QaYWxueGtf7L/FJrhWoWGrpxbuar0cPbIS7XEO7Jp7Q5+dTR52QPntbNQ9iTkWDFhZ
	hZ9d35WLQbCvQGYWZPF2MVQ+znENQaqgaaIDtFhMMryboLpP17dewbWjiO4NMAtRD9oy2JLgMlNB9
	bwSZLP0sdZs5OvwjjQqh8If/bBhvlGrb/CeT/Fl5HPSVywLcUeAS/d9HErv7eII4LKmivymgDW5Bs
	qvix7/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhp-0000000GCqt-3tkm;
	Wed, 08 Jul 2026 03:12:13 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhQ-0000000GCE5-1dSm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:50 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2ca5d2474c7so9176075ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480307; x=1784085107; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DxyegdDTBkuws1o4l0mkPGvs9ZTLGu40cJligZL/Yo=;
        b=c1FSoyCA7C3XJ2vZkVXDCLelE4mRShq7Nd+195CNoK2NN/Dw83EL+gNssOR/gC/A7m
         2jlQt6bKTMHTfhjVROxsYACcSp/ZVE4WaJT9uBktkSlfJ1PFeCAphy7BWT80YjMyJB+m
         biSxrL8UGTkA7SujSa1atVqkJ4ERjJNEPeV2WPQsU2BuKRNbwanZMTJVCJ5311UZzaq8
         sbpzyKp+04EdU9tjBkM5B2ZqRbFzNc3qkPkAOTBFtjTL366wYvBVMmM7rhnvS/FCPq1h
         aNfun3bHN7KcMoaLfjMtPI+GmfU8LcRbJY/YKuOT3NJKGrIdGU0Bpi7tIDM3vhPJUa/e
         7bUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480307; x=1784085107;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DxyegdDTBkuws1o4l0mkPGvs9ZTLGu40cJligZL/Yo=;
        b=sKFRNZ87jTyQb89fjlv3jPPiJipk6EMyXsPEa0Wo6ZS8gA2BT5FOvvqIFM6Vr9IxWm
         MFjXNDNJFxWJ1XBhF/MAPz+pGg664DYtgJb8bnYjzsRUkdQfgzWEs4AKXES+hRCiwC18
         Vk5XWr+tIC7Z5RVzVrc703Ci2HDNFghwIrqHOdJjirJFVOoKTp20cOaBIRvtydVgYT/U
         c0g9kyd3u0+1PdvY4vLJym+B9jbP6Hueh+Je8UlMBUiUN4kpFe4yIXSI8B3W6NTtIg7p
         KAPfLgb+B10gslfc2wvfB2KgJGDqsV//h6PysJ+w33ClIiYb8ZZ+xxXm9XAVKl5ig69v
         2i6A==
X-Forwarded-Encrypted: i=1; AHgh+RpAOJZJLbLhsFjtJWBli5ClhSnX63iRvymEvvrR/w1tg1pnodrrFZbAMcz9wqaMKA5/EyceZLoKu524NHNi8w09@lists.infradead.org
X-Gm-Message-State: AOJu0YwzDmRdn2cZF1Q2T+P2p7jGMlqS4eIkk2Ds7L2xMs+fle8ArwnB
	wtiD2RgfH4+GE7XcFfSpECc09orkd7bWHcQrBk7GcomX0MyYlh+5fG4/tlkhoZ0s1Bw0sUI58tp
	1I9Wa/tkWnRRBoHbTgBDdPw==
X-Received: from plbjl21.prod.google.com ([2002:a17:903:1355:b0:2cc:7709:3bc8])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:4b4e:b0:2ca:c7a:859b with SMTP id d9443c01a7336-2ccea36d9cfmr6381555ad.36.1783480306686;
 Tue, 07 Jul 2026 20:11:46 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:25 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-16-jthoughton@google.com>
Subject: [PATCH 15/18] hugetlb_vmemmap: Add a way to permanently disable HVO
 when needed
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_201148_466154_75E991AB 
X-CRM114-Status: GOOD (  20.35  )
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

hugetlb_vmemmap_optimization_try_disable() is used by callers to
permanently disable HVO if it becomes impossible to use.

If HVO is already actively in use,
hugetlb_vmemmap_optimization_try_disable() returns false to inform the
caller to take appropriate action (e.g., for arm64, not to online an
incompatible late CPU).

Signed-off-by: James Houghton <jthoughton@google.com>
---
 MAINTAINERS                     |  1 +
 include/linux/hugetlb_vmemmap.h | 20 +++++++++++++++++
 mm/hugetlb_vmemmap.c            | 40 +++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 include/linux/hugetlb_vmemmap.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ff47013ce995..55bd4c09f494 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12013,6 +12013,7 @@ F:	Documentation/mm/hugetlbfs_reserv.rst
 F:	Documentation/mm/vmemmap_dedup.rst
 F:	fs/hugetlbfs/
 F:	include/linux/hugetlb.h
+F:	include/linux/hugetlb_vmemmap.h
 F:	include/trace/events/hugetlbfs.h
 F:	mm/hugetlb.c
 F:	mm/hugetlb_cgroup.c
diff --git a/include/linux/hugetlb_vmemmap.h b/include/linux/hugetlb_vmemmap.h
new file mode 100644
index 000000000000..a671eb4a4ff4
--- /dev/null
+++ b/include/linux/hugetlb_vmemmap.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_HUGETLB_VMEMMAP_H
+#define _LINUX_HUGETLB_VMEMMAP_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+
+bool hugetlb_vmemmap_optimization_try_disable(void);
+
+#else /* CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP */
+
+static inline bool hugetlb_vmemmap_optimization_try_disable(void)
+{
+	return true;
+}
+
+#endif
+
+#endif /* _LINUX_HUGETLB_VMEMMAP_H */
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index a490a34998d9..7e7f8579cc2a 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -17,6 +17,7 @@
 #include <linux/pagewalk.h>
 #include <linux/pgalloc.h>
 #include <linux/hugetlb.h>
+#include <linux/hugetlb_vmemmap.h>
 
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap_internal.h"
@@ -463,6 +464,39 @@ static int vmemmap_remap_alloc(const struct hstate *h, struct folio *folio,
 	return ret;
 }
 
+enum hugetlb_hvo_status {
+	HVO_INACTIVE = 0,
+	HVO_ACTIVE,
+	HVO_PERMANENTLY_INACTIVE,
+};
+static enum hugetlb_hvo_status hvo_status = HVO_INACTIVE;
+
+static bool hugetlb_hvo_status_try_set(enum hugetlb_hvo_status status)
+{
+	enum hugetlb_hvo_status old;
+
+	old = READ_ONCE(hvo_status);
+
+retry:
+	/* The current setting is what we want. */
+	if (old == status)
+		return true;
+
+	/* The current setting cannot be changed. */
+	if (old != HVO_INACTIVE)
+		return false;
+
+	if (!try_cmpxchg_relaxed(&hvo_status, &old, status))
+		goto retry;
+
+	return true;
+}
+
+bool hugetlb_vmemmap_optimization_try_disable(void)
+{
+	return hugetlb_hvo_status_try_set(HVO_PERMANENTLY_INACTIVE);
+}
+
 static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
 static int __init hugetlb_vmemmap_optimize_param(char *buf)
 {
@@ -571,6 +605,9 @@ static bool vmemmap_should_optimize_folio(const struct hstate *h, struct folio *
 	if (!hugetlb_vmemmap_optimizable(h))
 		return false;
 
+	if (!hugetlb_hvo_status_try_set(HVO_ACTIVE))
+		return false;
+
 	return true;
 }
 
@@ -809,6 +846,9 @@ static bool vmemmap_should_optimize_bootmem_page(struct huge_bootmem_page *m)
 	    !IS_ALIGNED(psize, pmd_vmemmap_size))
 		return false;
 
+	if (!hugetlb_hvo_status_try_set(HVO_ACTIVE))
+		return false;
+
 	return true;
 }
 
-- 
2.55.0.795.g602f6c329a-goog


