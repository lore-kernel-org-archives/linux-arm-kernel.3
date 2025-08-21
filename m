Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E287CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 04:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzMWVCGQW0mP4+/ULAfe7CdOmgWkAKLnoxAB4Fy092E=; b=LtqY4Gi2d7JPjf0KxDccwGpASe
	TWCTdJ2iIqhMKIfIS2IJVI4BztddHzO9mtW40egBCS0ndQuDQTS2DdFNzU6KO/8WVSDN31MdXukeC
	8ARZAhwPyLB+Dc88lQZ+KG8Mtv9Bpz+jXP3a5iclzMCteZpASuPKUCylTxl8zlclivXznSutjqe3d
	T1Ip+KO0Bf/oBaOT62mcxJFOq7dbpE9hC0c1wq7X15eHQQgwUtLXomkpDXzP/E98XTFbYhkm+Sur7
	tio1edA7gFGd5rEozXmpEXSbkBwLFuyRtlMrZLp7mD20b50PRThYQ/tYX7Nh5WJoSuYQMERaVrWYR
	sz0k5B6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJO9-00000001VOT-305f;
	Fri, 22 Aug 2025 04:28:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBeK-00000000PAA-3Pin
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755807159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MzMWVCGQW0mP4+/ULAfe7CdOmgWkAKLnoxAB4Fy092E=;
	b=IFZFbkg01p8ZX4Kf3tlKDRU1c6Fm7dP+7pVfPPSDIujLupfy/OV19zOB6EB6o8+97HKMk5
	nqE9UssVQInJT8C02Fq+7K50tC9SbX8/dAHhSqYjtFBITXWwgUIcND7W5aXuEmPTWiWTWY
	sypOpZ/f0DKF070blaoP7SwhbaadCCE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-RCIS-pkANp2Xc3EnzDMYtw-1; Thu, 21 Aug 2025 16:07:50 -0400
X-MC-Unique: RCIS-pkANp2Xc3EnzDMYtw-1
X-Mimecast-MFC-AGG-ID: RCIS-pkANp2Xc3EnzDMYtw_1755806869
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3b9e4117542so631170f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806869; x=1756411669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzMWVCGQW0mP4+/ULAfe7CdOmgWkAKLnoxAB4Fy092E=;
        b=wbvn+n4dJbeRc2egCLrc5YFk1j7tpIKiQanGd3RgOrVXDbJQWjTBHY+LErcnl+SH/h
         Q3WOM4RHC3gBocukvqvW9yaPlsApdXiytHytZJQkifxsZRaDW27NlSvzG6WxT/MWrF+g
         nFyrQ8M4fUCsUqUxLDrLpufqg8PI2ZC994VlUd4hLh1QS4VeqJQQfJlDqz8xl93iNkYc
         THEgaOEYSSVFYgArsOksNWRxCQoWeoc0ZfLIKpAdrQvMBllXv5eMvnuqsgvX+Yzmsx0x
         zcNl/FAlQnDcRUJYv1I1BhCOl/umMSvNbiW2jZgXMdt6Ggt94hFDVdSsqP7A5r9TPC6p
         V9/w==
X-Forwarded-Encrypted: i=1; AJvYcCWmYRUHeCvUI0R41VHNXotayvAjeDdUKAg8etEIhY7/B6lJyISh7uENv3aViAxkdSJP+8AsIzsqDp8y57T77Eh9@lists.infradead.org
X-Gm-Message-State: AOJu0YyppAvnK/ohdo94umXoqQONqwUFzGKurpDfiReUqmEN/vAJJf20
	VVfdR4rFwlbwa/UXc6P21bYyo5VTzJNIxF57ap2AAYFujYiHevRcHhnl9vInf5WKEUjPnl/7tfR
	XbTadt4KiOeAyZHFiGWBLOk/S50roKVqPRS2BUUsrhw70kEQ8QXgAEnmiqVfi5HHbUBpjzGX5tE
	Tp
X-Gm-Gg: ASbGncvgstF1vRI95uh6dz1gAg8ST8wt/+UkqbjnCLvJ4fmv3kSs962sCoSORJ5fcF9
	+ZUi4jyAeP9jbJX9rC4VVmKPkvqoaw+BOO+UOV3ZrWPsC9k/drPF/S3VPGCkyRC0sXqS1x5LcUh
	TzkOuyePqnHj3dxzhAabR1U4Q1rXHrjZXhgGGpUH6zyZdVHC21ZV5/5ofJl/vj96zoGnjcCHJ1R
	ya7Vk2Z0/HJcohT7eAy4UNnTbqpslj7CJSQy3VhmFW/bfCS07fMv5CGiEt0/fnQposjA72Zq6lp
	Ygib/0RtVmVK4oVqOZemNXQDLnMCTgJPxszfWVEfXkBQKAk1T0WcbDcO+zJgvuqoKXZbklHlPK5
	DtSFHvP713PT32t9xOllm0A==
X-Received: by 2002:a05:6000:2901:b0:3b7:c703:ce4 with SMTP id ffacd0b85a97d-3c5dcff5f3amr167811f8f.59.1755806868902;
        Thu, 21 Aug 2025 13:07:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCm64ALptQrKyrLlaLt4xJ2vziBy3gZm4Q1WMVX6wnWhr2W2tRcHnZJHBwxpAOnTfL4mKx+A==
X-Received: by 2002:a05:6000:2901:b0:3b7:c703:ce4 with SMTP id ffacd0b85a97d-3c5dcff5f3amr167760f8f.59.1755806868453;
        Thu, 21 Aug 2025 13:07:48 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c5826751d5sm1323274f8f.14.2025.08.21.13.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:47 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 15/35] fs: hugetlbfs: remove nth_page() usage within folio in adjust_range_hwpoison()
Date: Thu, 21 Aug 2025 22:06:41 +0200
Message-ID: <20250821200701.1329277-16-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PCr_BIhrFi2HQs_ZsZmiB4omnVcE6OsY7IBppDxq9zY_1755806869
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_131240_920932_8A0BB234 
X-CRM114-Status: GOOD (  16.84  )
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

The nth_page() is not really required anymore, so let's remove it.
While at it, cleanup and simplify the code a bit.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/hugetlbfs/inode.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 34d496a2b7de6..dc981509a7717 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -198,31 +198,22 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 static size_t adjust_range_hwpoison(struct folio *folio, size_t offset,
 		size_t bytes)
 {
-	struct page *page;
-	size_t n = 0;
-	size_t res = 0;
+	struct page *page = folio_page(folio, offset / PAGE_SIZE);
+	size_t n, safe_bytes;
 
-	/* First page to start the loop. */
-	page = folio_page(folio, offset / PAGE_SIZE);
 	offset %= PAGE_SIZE;
-	while (1) {
+	for (safe_bytes = 0; safe_bytes < bytes; safe_bytes += n) {
+
 		if (is_raw_hwpoison_page_in_hugepage(page))
 			break;
 
 		/* Safe to read n bytes without touching HWPOISON subpage. */
-		n = min(bytes, (size_t)PAGE_SIZE - offset);
-		res += n;
-		bytes -= n;
-		if (!bytes || !n)
-			break;
-		offset += n;
-		if (offset == PAGE_SIZE) {
-			page = nth_page(page, 1);
-			offset = 0;
-		}
+		n = min(bytes - safe_bytes, (size_t)PAGE_SIZE - offset);
+		offset = 0;
+		page++;
 	}
 
-	return res;
+	return safe_bytes;
 }
 
 /*
-- 
2.50.1


