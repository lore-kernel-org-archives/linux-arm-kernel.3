Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9DACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKFS9/TuG2v9AIcAoooIJr3bGKW6zmP0XL+5izT5Y+4=; b=MasD2YZavQJ0Fxdj0q6a1KRYoK
	in6LJPk1c7hWYJ6UXYVr0tlHfZKXsDZxfznLrya7xFUz60bqTFRjANNiJfz7UJKvUSOyuCGBitPBk
	kUdy9ncQZcR/awgtn800NhIC5+dOmssjeVhm8r/ztUWEnC4HqXHdpFGXk8FoOBSW60KNBjycO4qTa
	u+yz3BbWPuYSpa/GVLDNOU7xdW/zJN15t7MUnem/5MhUPHGaIdCa2Bu2SMrv9FKQMzpqD9SBItSNJ
	P/ez3y76qm3e8Ab6/dDy2kTFsE1E2iqS1XlCRNiBMlAJivh7Ulp6IIwYNnsI1c1cmYuiZWP4muc3b
	jcK7UX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFxJ-000000014cN-1uDA;
	Fri, 22 Aug 2025 00:48:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaA-00000000Ny4-18QU
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NKFS9/TuG2v9AIcAoooIJr3bGKW6zmP0XL+5izT5Y+4=; b=RywJ54gRl1c1LpaHbN/kGzMtB0
	pf0GspOqzqQCq8l1fOyg1W8ZTiJi338ClnHEHRTz4hKvqqlMjscDevdAq3z8VU1W8LpceKTPcPps+
	EOKEdTLTFAKjK0EycBY1QfvzFlP3zE8+PI6xMyqmE+5qhnftvwQnNi3/LDjcfPwmeTiaR4YuBmqlX
	8p8xeta+wvtxUFqrTX3K+HX/f2V+nBi7Vdrll1K/J4PxXqwFUmZsoESCwNlbgy9Lq7KTC+PNaSLU9
	tkzz3Ao+Se0SewsS2QxousraN8M7JY2yND6E+mWtVGc8wI4njGkKXQ1fLczPFuQsHrD67DUsJG13m
	ZlbcTREw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBa5-00000000ezp-0EuZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKFS9/TuG2v9AIcAoooIJr3bGKW6zmP0XL+5izT5Y+4=;
	b=JcjO8Em/BfdFU6JIykokyz293Sd8PAj5WJE/wa9DOxjVfvaaFaq1bsuA0AzRs6+3t5whuB
	qCosSVo15p8yWU66r/+CPmp6TqeOYzrpPl/xvrakX0PPcocwcHIPMmrB0rJ9sGnMbWqY8m
	indvS9OiA35aTUXT3Z1G3C8xp1os5X4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKFS9/TuG2v9AIcAoooIJr3bGKW6zmP0XL+5izT5Y+4=;
	b=KtuX4I3BLmc2Ll+9kAXA544loSti7IPBid44Rgpb7tAZkxHl9HugGNH/9JPtuTWYngNjGz
	Jl38qD33lAQAp1W6At7516iJmsS3OSgTHR8SDEjAbv6OfK4EN6gxEC6jwvjVlgoaFkrx5R
	Ap8oyeMeONOzxjtaYCFDthHgJfVwP/k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-qWwsHIH5O821v6w9rUkGyg-1; Thu, 21 Aug 2025 16:08:13 -0400
X-MC-Unique: qWwsHIH5O821v6w9rUkGyg-1
X-Mimecast-MFC-AGG-ID: qWwsHIH5O821v6w9rUkGyg_1755806892
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45a1b0ccb6cso6975125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806892; x=1756411692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKFS9/TuG2v9AIcAoooIJr3bGKW6zmP0XL+5izT5Y+4=;
        b=rICPF7/41nvD07wfFoxPuh6CREiG02VDXDQE05iZe7JFiY82aseGt2kLBd+j9Bju8R
         usGbMRkWmiND/WMnVKbkDz0veTzX2+BMqTOIm8XtHETf0xj4zUizFKmUH/0sOZhnALtz
         0tkTzLTZ2H1q4bZg8La8MmcWCiSIkQ3yfHxjaCT01sVL9ZnYkdGrteRiGYjVoOvAO2Gi
         n47mrQz0vsqk7HgIJ0+c0K9e42ba447LjhZmwuhxyAtr7K6btmDn8sKtOoqhrtS+yQKJ
         VtTiBLxWY4/0+X+YKuLsWUf1cnjzEyFhv6rdsluS81+9xyf1fgnxTBRNz5vmI73/KJjb
         3ZIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH3ULcTDUCIa7t7mLNV4LEdvTALc8ciiQUFx/nY56XRXfVJGSi27XvKMoZDk/R47FFlMuW17k+ZF4JP6wi/FkX@lists.infradead.org
X-Gm-Message-State: AOJu0YwVH98JuZBHCoIGYniMATsC+uCvrnqYLyq6WlvRKK89IK/S9rYX
	IYdKnSRz0St7B02i+WD3Rq5v25ijs1e9LAueZXHIuR5FLt2JumityXxaDl3wYQVTPz6L3Jtt+Q5
	HwsiVBMfZBgPexnoLbsdjzRrAYJQNTD7d9fhszHUmQ1jz6c6ZsEGbJ6WXEt5p5RMjQcH386TWku
	a/
X-Gm-Gg: ASbGncsi6IfQRHq6wtWa68deqVu7nbB9FEdv3mpY1R+8P4DK8bdsidBPrcUGoR3i4pH
	4HaiVc9zGzYT/b66uTQPAYkOTBgyOi50skmZ+qp1KaKFbgZPEEw98oWCorPUBMdf2yQFqvXJzEc
	vZrZurl2sMWtC+n0V6D5MM5O+NN6o6HnSwzTjUBFn+j4CKNq7OhfY0owlHTGsik/H5JhZw1vtAa
	LihUWOSaUCTjhGtB9xQy7K+BSj8Us1CYi9cZZ/kk10/ijYS1RePqkVduHZ0Z6iulyDiJ424j/hA
	SJhUqBF7cvf28/7n0gWKNFEKEkblt9uWDybAp2mirVs2zzRH6qhqllv/VUGiF1YYIpE8vsxnfQH
	yVr2dH31oVy4HNWa0hqfLVw==
X-Received: by 2002:a05:600c:1f1a:b0:45b:43cc:e557 with SMTP id 5b1f17b1804b1-45b517cbee2mr2552505e9.34.1755806891765;
        Thu, 21 Aug 2025 13:08:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/z26sBz7JGLAktk/cnLNnmvA2KmHoRy5M1TseKC0NpCNohvOWfWbiwnk6fyruz4Gv4BdEig==
X-Received: by 2002:a05:600c:1f1a:b0:45b:43cc:e557 with SMTP id 5b1f17b1804b1-45b517cbee2mr2552235e9.34.1755806891155;
        Thu, 21 Aug 2025 13:08:11 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c0748797acsm12277591f8f.10.2025.08.21.13.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:10 -0700 (PDT)
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
Subject: [PATCH RFC 23/35] scatterlist: disallow non-contigous page ranges in a single SG entry
Date: Thu, 21 Aug 2025 22:06:49 +0200
Message-ID: <20250821200701.1329277-24-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: je30qiYlZFUL8p8A-Cv8g_9_hRwkSGv0K4ZuEdzDPkQ_1755806892
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210817_363762_258C5C5B 
X-CRM114-Status: GOOD (  16.58  )
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

The expectation is that there is currently no user that would pass in
non-contigous page ranges: no allocator, not even VMA, will hand these
out.

The only problematic part would be if someone would provide a range
obtained directly from memblock, or manually merge problematic ranges.
If we find such cases, we should fix them to create separate
SG entries.

Let's check in sg_set_page() that this is really the case. No need to
check in sg_set_folio(), as pages in a folio are guaranteed to be
contiguous.

We can now drop the nth_page() usage in sg_page_iter_page().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/scatterlist.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 6f8a4965f9b98..8196949dfc82c 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -6,6 +6,7 @@
 #include <linux/types.h>
 #include <linux/bug.h>
 #include <linux/mm.h>
+#include <linux/mm_inline.h>
 #include <asm/io.h>
 
 struct scatterlist {
@@ -158,6 +159,7 @@ static inline void sg_assign_page(struct scatterlist *sg, struct page *page)
 static inline void sg_set_page(struct scatterlist *sg, struct page *page,
 			       unsigned int len, unsigned int offset)
 {
+	VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PAGE_SIZE) / PAGE_SIZE));
 	sg_assign_page(sg, page);
 	sg->offset = offset;
 	sg->length = len;
@@ -600,7 +602,7 @@ void __sg_page_iter_start(struct sg_page_iter *piter,
  */
 static inline struct page *sg_page_iter_page(struct sg_page_iter *piter)
 {
-	return nth_page(sg_page(piter->sg), piter->sg_pgoffset);
+	return sg_page(piter->sg) + piter->sg_pgoffset;
 }
 
 /**
-- 
2.50.1


