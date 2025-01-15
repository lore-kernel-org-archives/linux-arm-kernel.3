Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA87C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 03:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJIQvsAs93F2Rgx1xFn4Hzm1URQ2cAp3NCo21K6rE7w=; b=L55Qm46S5bXhaXtP96UUx5CIBn
	4jqWC9N/m18fAjz7uodw+pnw6PSNhLCb7wvhQmQfLuR10uY9XsJ+ZxVfG6gJzGMfGdpcfmI7H8HId
	ThrZQ6aXTQ5TZN5DwtjU4Zd2zWhbOXmi0l8Nxviuqp6RTHlAGEQ6J338V7bLyMkonnRW2Qtne/Ubi
	nTB2VqaAK+2Qc9WAjBEWFDPmF9KTBXBvbJUWqcMoegJ3vUA5S/MjqIWolsABeWC+uRSxQVPMNJmvj
	S9gewoBD836c9QdCvjZa5NUhIpuPV0ObfgUBjT4P4JGvU9v8ECrcXWhQFCHNrp24MNT1dRLLl7Ov9
	gKove34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuIS-0000000AXT4-1T44;
	Wed, 15 Jan 2025 03:42:24 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuEk-0000000AWco-1HXW;
	Wed, 15 Jan 2025 03:38:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21680814d42so92701755ad.2;
        Tue, 14 Jan 2025 19:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736912313; x=1737517113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJIQvsAs93F2Rgx1xFn4Hzm1URQ2cAp3NCo21K6rE7w=;
        b=k4JWV/T3/MmAq2XFttjkj1k4zEp9AiVv198o0+oQRedIJVWapHBImD3x3jnhd9Oa3j
         wN+Ahay/YamA+f7Q+ZDCWmBnRFCffRxq92ineMvZr6+ik0rehFDVGk8hdJK3AX3xBCzN
         cScMCnACd1zwO89QOWwR9PlIJm4q3E8cDgOj++CCBk7PR35unb4BbwHMHHYUnkpPBS8O
         CFJGvEwQUmRubzHf/mWyNPYBOsQvYB8mrOr6N3S5MR4kn7WXSzXwXuGmJh++Y8DzKe2B
         pg4C/z464fbx24L8i9oJAej64hRGM62h4rUS2QLELTPE19yMY779gzv+Dyq+aoNAmutx
         YBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736912313; x=1737517113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJIQvsAs93F2Rgx1xFn4Hzm1URQ2cAp3NCo21K6rE7w=;
        b=NrxCdtdgjM2WhV83OLCCqFarCSnb/F+QWd5LixqXzFyLKRDahx88ERFTBHGvCjzxsP
         Iigvxm6vsf0qNBsEwlNYxukhWg64Cn0uZu741FFX6o3IPzrv5OR93gpUGMqjqZWgxCvU
         1CSvCkGyJQF314BQUbnHSA2N5Y6RVgwCSy+npFvbXMiCh3GCLJXw0NaXW40PNBUuZTRk
         2abgs/E+JfOBoD+VF7jxQ1HYSmvRyVMwgJDNqkGJRDW6vLD2EPSqLfxAp7v/H/0ugVr1
         lQL2gULXAzppD01KbWuGxXBd1JltcyllTGAcXUi92q22nvVYl1TqsRLkzJp1Y8Bzl8Fv
         CErQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUAM2yNs9V1EShsygy3hYHCTlipO1qLdWw7hTDgO9O8aUawTYNllWFYf+7ZEz/kIymWSMb2fNggblx4MjVaE3o@lists.infradead.org, AJvYcCVPTD5Id7k8kLRRTfYB1QaPel0T5haQ93h3sX1CdR5IFdz6hbFTWiySkdAGK56fZ1EdeZEPv2nrSD5D+IE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2lVKo85qGZ0udhwpkKBwySYoL+D83mOScEE2J71fXgk6tZ4h7
	dOihip1cZGN3mOynnQbnbW2T1hpDfCF4SGVZCxh8G87qay2A+Mnk
X-Gm-Gg: ASbGnctvNJs4zAWwEvuLXIUgspQsM6NLDdIKBeQHbmG5OtdwSnEQ0c1KfkjdhcxaSon
	e5/uxB7PONHJCGGPXbhBFk1vnbo+VP1712Z6aMXp9ZGKq3yCT3qUPYfN6clyvvVf6irHMX98Hhe
	fQKH6OZ4KQ86OfTaPdivEUYgNfn6OXQxc3oFqEj0uDtiZpoh6v6DN/jkDC8Q54RZHhnyXqLv/Pq
	4+xrqvZe3MeQpV98gPTAFrYhgYe1SOAwMtvO3jH/ABflRpnaI4R+l1HDuWl863aRgUlglDQN6hL
	dxKnVKQE
X-Google-Smtp-Source: AGHT+IHnFl4K6iDBiLirFwWAnLa88ULHZZM7psfa+Le3bhG1J3ARcy1prtquvYLzB7/JWDl2R1Bcjw==
X-Received: by 2002:a17:903:1cf:b0:216:39fa:5cb4 with SMTP id d9443c01a7336-21a83f67c50mr435295355ad.25.1736912313634;
        Tue, 14 Jan 2025 19:38:33 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:e5d5:b870:ca9b:78f8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10dffbsm73368195ad.49.2025.01.14.19.38.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jan 2025 19:38:32 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: 21cnbao@gmail.com,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	david@redhat.com,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com,
	Mauricio Faria de Oliveira <mfo@canonical.com>
Subject: [PATCH v3 1/4] mm: Set folio swapbacked iff folios are dirty in try_to_unmap_one
Date: Wed, 15 Jan 2025 16:38:05 +1300
Message-Id: <20250115033808.40641-2-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250115033808.40641-1-21cnbao@gmail.com>
References: <20250115033808.40641-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_193834_344857_25007562 
X-CRM114-Status: GOOD (  15.30  )
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

From: Barry Song <v-songbaohua@oppo.com>

The refcount may be temporarily or long-term increased, but this does
not change the fundamental nature of the folio already being lazy-
freed. Therefore, we only reset 'swapbacked' when we are certain the
folio is dirty and not droppable.

Fixes: 6c8e2a256915 ("mm: fix race between MADV_FREE reclaim and blkdev direct IO read")
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
Cc: Mauricio Faria de Oliveira <mfo@canonical.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Lance Yang <ioworker0@gmail.com>
---
 mm/rmap.c | 49 ++++++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index c6c4d4ea29a7..de6b8c34e98c 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1868,34 +1868,29 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				smp_rmb();
 
-				/*
-				 * The only page refs must be one from isolation
-				 * plus the rmap(s) (dropped by discard:).
-				 */
-				if (ref_count == 1 + map_count &&
-				    (!folio_test_dirty(folio) ||
-				     /*
-				      * Unlike MADV_FREE mappings, VM_DROPPABLE
-				      * ones can be dropped even if they've
-				      * been dirtied.
-				      */
-				     (vma->vm_flags & VM_DROPPABLE))) {
-					dec_mm_counter(mm, MM_ANONPAGES);
-					goto discard;
-				}
-
-				/*
-				 * If the folio was redirtied, it cannot be
-				 * discarded. Remap the page to page table.
-				 */
-				set_pte_at(mm, address, pvmw.pte, pteval);
-				/*
-				 * Unlike MADV_FREE mappings, VM_DROPPABLE ones
-				 * never get swap backed on failure to drop.
-				 */
-				if (!(vma->vm_flags & VM_DROPPABLE))
+				if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
+					/*
+					 * redirtied either using the page table or a previously
+					 * obtained GUP reference.
+					 */
+					set_pte_at(mm, address, pvmw.pte, pteval);
 					folio_set_swapbacked(folio);
-				goto walk_abort;
+					goto walk_abort;
+				} else if (ref_count != 1 + map_count) {
+					/*
+					 * Additional reference. Could be a GUP reference or any
+					 * speculative reference. GUP users must mark the folio
+					 * dirty if there was a modification. This folio cannot be
+					 * reclaimed right now either way, so act just like nothing
+					 * happened.
+					 * We'll come back here later and detect if the folio was
+					 * dirtied when the additional reference is gone.
+					 */
+					set_pte_at(mm, address, pvmw.pte, pteval);
+					goto walk_abort;
+				}
+				dec_mm_counter(mm, MM_ANONPAGES);
+				goto discard;
 			}
 
 			if (swap_duplicate(entry) < 0) {
-- 
2.39.3 (Apple Git-146)


