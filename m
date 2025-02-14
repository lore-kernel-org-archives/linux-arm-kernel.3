Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494FAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYd38P/88z4Le/gu2ZsWRGcpuaJyiGCRxbJw4vPtU7w=; b=2pYVK2BkwhjaMEMHshGcjL2/K6
	m0pvZyZJ52zsU9fhN0K2qO5NrCCN2P/q9vZpxRjUEDRZIHaKCrRu00gov1PHZ1XMwe2MEBoUbpYxm
	L9YcHCO+2PiEAIeOEBkM/nFcVD/VOSJkSjo1U/EaeGNeDYOMoCof5/+VLc9uYYnquaxyqjgSqBPWZ
	Hdx9D8NCGn6cGKvB7RVk6EwEidMp5z+oWxA+IIYSB6OjgE+gwdIY5ZYLX6wk2p4X8U8QSUBH8d+qf
	qWEjx4yfs+yWzj7dZwEdW7P3YRz17i5IeGbE7jSBAGj7yhFA8wbbvAevdFa0S3OHF+fmDFAcZQSxX
	AXRKssPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tis4h-0000000ELSL-3O0e;
	Fri, 14 Feb 2025 09:33:31 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tis1u-0000000EKOs-0YbO;
	Fri, 14 Feb 2025 09:30:39 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-220ec47991aso8555785ad.1;
        Fri, 14 Feb 2025 01:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739525437; x=1740130237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYd38P/88z4Le/gu2ZsWRGcpuaJyiGCRxbJw4vPtU7w=;
        b=B3IClbmKJKWw2zsaf2I3q/vuxHhMmveuy7mBdp6AvoQYwsy/vlojYZ0VAG+9fwxhsC
         cJBZOjZznJZ8NtP9eB0SHE/+lXI0Khyrlax7LMZzOuQCNBG/v9DP3LCVkwrvbi/Rrdlk
         Y3mDYNgPrgnOkWDM4Yb6o/NSORJdb8kLdhTLebi7jpZy7lJGvrC0tjYXHgbk9ii9lJhM
         A8QUtGrm4gDM81vc09viiMxbS1SFDOiVpX6we1In99AV0wV1CXMIZ0ZC9IItCR7UUTUt
         kmRyFAhWPhmCXmrfnixmvFTREJ5HjqU/YMgyVJgskyjuwxlSqtwMKHefJzWeILhNifej
         1JPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739525437; x=1740130237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYd38P/88z4Le/gu2ZsWRGcpuaJyiGCRxbJw4vPtU7w=;
        b=gFSqlxf3HZ2f5cklz9uBdnv7YPsDn+NiZ8DSvNFhYXHS+cFGBzXNzT2IIpAo5uS3yq
         gaw+V189n/qtR9Y8+b+7dF+/SOqk3fCOqDkCdt6WF2TjJbAq4ZYQBABe+R3tidmNdjgI
         5BGDCmEX6kM+kwQJBXHD1Al7BXgxzij2jbliLHpCm6E3N6AKp9n3grD8DVsHaeA9tN7O
         QaAMXgz5lg8LndTqulNzk397GcB1j11JkGrmWm0oj6QdX/DmrdEg3sLb1TAWOBFGRl8m
         JDJ+vB/uCQ6bcW0ray3Gn5tYXLttulQ//DmIvEQOIoOltjVOX7tSOEDsp7/q9AvrEHDC
         6hUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL+LtxgzZDbtFuYzy+zIhGr+aJOIDY6/yKSEBxM65jEDl8FZ85N+ixovByKs1KVT8FR25N+5+OwKNoWppbeK1n@lists.infradead.org, AJvYcCXL/L6TNCHCztR+mdJRA9IJtRFZC89Y0gQM/plv2jk97/o3Sx7BEsmcLvSLKmAuDM5cRVxMTkpSlShkAuE=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywln/MCjIte9Jul5g/WR+2nJtpSa8Xh+BfnNFlYZSBqwWSrPITl
	LTGQ2dTqZWmyv9g6hrUq/FPjAhbLQbS4+byjnAwfVlrfV1tkqDCO
X-Gm-Gg: ASbGncsu4TIY5ieFWJmmfyqj7d3uQjvsH5upQlv0nbtKX6UhQajQGn6QV9a3sEjdcoP
	woB13RhZ3UR1DF/gktwvtToTKGEg2MMskszNQ/3aJqAwp6gZ9LAC/oO7cdabA+v5ZuWM3Ri2oCg
	fIzHJg/9tRu3LG0KjECReNWioQ2yHfSKpBb4H4AVFOgkxpQB+OFjEVV6GKTOjywNuW6YjkcD4T6
	ljUDhixmZgLLRmzBYJrnPoXNRpMxI4grdh/pHFksB8VUtTaHVGb1JkLfyDj6tZQHjVEn6O1V2XV
	Ncvf8CwIyk7CdV2ntkFg1CH1WI6TD1Q=
X-Google-Smtp-Source: AGHT+IF3R6sEv2yv6agqEs7T8nVlI0vjyVGMx4hRl93qDBPx5Nld8wdX+5D8keuWm8hulHGB8fPZdw==
X-Received: by 2002:a17:902:ecc2:b0:220:d6be:5bba with SMTP id d9443c01a7336-220d6be5e03mr81713945ad.33.1739525437158;
        Fri, 14 Feb 2025 01:30:37 -0800 (PST)
Received: from Barrys-MBP.hub ([118.92.30.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545c814sm25440515ad.148.2025.02.14.01.30.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Feb 2025 01:30:36 -0800 (PST)
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
Subject: [PATCH v4 1/4] mm: Set folio swapbacked iff folios are dirty in try_to_unmap_one
Date: Fri, 14 Feb 2025 22:30:12 +1300
Message-Id: <20250214093015.51024-2-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250214093015.51024-1-21cnbao@gmail.com>
References: <20250214093015.51024-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_013038_176310_C8512B2E 
X-CRM114-Status: GOOD (  14.90  )
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
index 25a8a127f689..1320527e90cd 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2022,34 +2022,29 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
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


