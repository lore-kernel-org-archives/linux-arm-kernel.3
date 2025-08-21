Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04AECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hICKs+PYshPEfoclHwqOXtWPheskj6p8LyRcJkrFnX4=; b=3zk0IsARynlfAlozd90+BXPcxT
	2eiwXdfmRcPDvMp3DSgvFXCSJcOwTBxznUmENkC78+lQT/b5uP3XTYGyjnZAw+9/JyHUx7Vp+AMAH
	+L4/bY124hVvuXNjInlgcYUN1q5CUUwwEwPXg8Fo5yMKuwjlH7voSmkNKhiXKkTqDsZQibvuOBO3l
	PbWump0nwDvfxh1jBOH+LJJWRygW5ZpkwILmmWmYT4zZgwBus7hpUN1z7aNc5NKW//HzktH3OEQvp
	I4sT/ttPeiSELiMuD/M23Zd7e3m5xh3FY03LKMuHT2q7+Nu8vFzAfwlLkZOd1WAZsKoHl6JdgBQau
	B6mtMTYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFhj-0000000134U-2dyT;
	Fri, 22 Aug 2025 00:32:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBZo-00000000NmC-3YCu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hICKs+PYshPEfoclHwqOXtWPheskj6p8LyRcJkrFnX4=;
	b=d50BOTRb+SEcMJs+gPi21vd4ycSzxd+Hq6bmtV+XrL44+R89DB6hvtzUQNgULdNUcDSJVS
	0goysmH283RP0xKSkgdmsR0QkSU5sOzbbYg3LDOKmhcFFui3QjMGy0RNsIGRAnFZWlO5Zp
	t1fmTshP+97z+qpiYMKOo/BrfLJTrNc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-14mXUK8HPHygSHDnOasPyQ-1; Thu, 21 Aug 2025 16:07:58 -0400
X-MC-Unique: 14mXUK8HPHygSHDnOasPyQ-1
X-Mimecast-MFC-AGG-ID: 14mXUK8HPHygSHDnOasPyQ_1755806877
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3b9edf34ad0so613141f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806877; x=1756411677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hICKs+PYshPEfoclHwqOXtWPheskj6p8LyRcJkrFnX4=;
        b=LpdBWpEcFtH0chpG3S2GfRj6vIu89E/JWBHMMmkyIRWucsh4ImLOgqoisBYatlB8pD
         +PdOcG75hH7ka+WZvYkKdzZqmpHqzKsmEda6JC3Ca8/R6+sluG70VQoH4UZNgU400n9s
         qXQV535+DPeG2weB62oA+2NYhhz0KlOynzoDctS9YFc1gRMoyhWObwvyQraTp5ZelnS0
         BL5OeaN0c0RgPAdWiHsxMGepiehQL33Rv2Nrsyd8Q+dUuswUR56Q/Rbug6GNABhyYs5Q
         5iae3JUBHtwr116zW7bvOFtvlPfHC6z3NdUbjQUiTGqE5AKR3isL9qsQArfhwTi+5avw
         lgSw==
X-Forwarded-Encrypted: i=1; AJvYcCWzwpl5262KHydShSrDod/AAC32d20ouwLUx8v06bexWFw0wfRXHxJCEOxu5G3nXppcYYdcBhYggo0yvmpFzZAN@lists.infradead.org
X-Gm-Message-State: AOJu0YxAuLdkZ3DLFw/2dzhygxUGH/Xh5jZseSXq1ZjARxJmbQ/tYsfL
	MtV+lph0LTtH/Zxmx6RoDim0c1U+uYleemMwVcNr5scFx06oh7ty0oKxWAjn5jWRacGX1w0afBo
	lGqzHBj7MVxJDnKWtJSaCYP1tSAIV1dpA4Yy9suXJnqy+PVnDdeKwSSJYwIpOU58+WrKw+q1vUI
	Ag
X-Gm-Gg: ASbGnctKboBfA87bJMiaz4MFV9McSCecTjudTIRRZeOS+AxbsSDGXSbjsrwmoWda/9m
	uFRDp9s6A4gQGTk/h6wVogCm/WI+ibiPVj0vr8uj3yRBLl9urrqeTjAatoCumzauYMciWilbjJ1
	nxyOFpBX1sX/EN52szlHIep1dUs2Vp6aymSzT1wsfz4fvZDC61EmCM40SL16KV4RUnAJFgUOfoR
	z1fF1H6Si0Mv5/wt48HiL/pESBql84sEQlX6Rz4K51IY1YfiLyiClTbdIORsS4zBF0bWxbw+AIY
	bbLjSVsFyLsJ57lCSCR4IWOvPcCrQ9AvW0wMszsJnDbVr87jm03IDyytgvRXF2S3dVAA/JCpPtH
	Ufaxpz4F0gZQD0CUe/dY+fw==
X-Received: by 2002:a05:6000:1789:b0:3b4:9721:2b2b with SMTP id ffacd0b85a97d-3c5dac17062mr195828f8f.12.1755806877254;
        Thu, 21 Aug 2025 13:07:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgVLjhFaRrDh3LOBLGV7UmH7wFAxvy1IR++ErfO8cOP/XFU/ikMyZpM3bVU7Jjqctj1mhmFQ==
X-Received: by 2002:a05:6000:1789:b0:3b4:9721:2b2b with SMTP id ffacd0b85a97d-3c5dac17062mr195797f8f.12.1755806876810;
        Thu, 21 Aug 2025 13:07:56 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c4f77e968esm2903478f8f.21.2025.08.21.13.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:56 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
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
Subject: [PATCH RFC 18/35] io_uring/zcrx: remove "struct io_copy_cache" and one nth_page() usage
Date: Thu, 21 Aug 2025 22:06:44 +0200
Message-ID: <20250821200701.1329277-19-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vKR8r8oy_-KzCnsls7EVqUUz86IG4HJl-5sMZmOLdKw_1755806877
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130800_962096_B912F29D 
X-CRM114-Status: GOOD (  15.78  )
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

We always provide a single dst page, it's unclear why the io_copy_cache
complexity is required.

So let's simplify and get rid of "struct io_copy_cache", simply working on
the single page.

... which immediately allows us for dropping one "nth_page" usage,
because it's really just a single page.

Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 io_uring/zcrx.c | 32 +++++++-------------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index e5ff49f3425e0..f29b2a4867516 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -954,29 +954,18 @@ static struct net_iov *io_zcrx_alloc_fallback(struct io_zcrx_area *area)
 	return niov;
 }
 
-struct io_copy_cache {
-	struct page		*page;
-	unsigned long		offset;
-	size_t			size;
-};
-
-static ssize_t io_copy_page(struct io_copy_cache *cc, struct page *src_page,
+static ssize_t io_copy_page(struct page *dst_page, struct page *src_page,
 			    unsigned int src_offset, size_t len)
 {
-	size_t copied = 0;
+	size_t dst_offset = 0;
 
-	len = min(len, cc->size);
+	len = min(len, PAGE_SIZE);
 
 	while (len) {
 		void *src_addr, *dst_addr;
-		struct page *dst_page = cc->page;
-		unsigned dst_offset = cc->offset;
 		size_t n = len;
 
-		if (folio_test_partial_kmap(page_folio(dst_page)) ||
-		    folio_test_partial_kmap(page_folio(src_page))) {
-			dst_page = nth_page(dst_page, dst_offset / PAGE_SIZE);
-			dst_offset = offset_in_page(dst_offset);
+		if (folio_test_partial_kmap(page_folio(src_page))) {
 			src_page = nth_page(src_page, src_offset / PAGE_SIZE);
 			src_offset = offset_in_page(src_offset);
 			n = min(PAGE_SIZE - src_offset, PAGE_SIZE - dst_offset);
@@ -991,12 +980,10 @@ static ssize_t io_copy_page(struct io_copy_cache *cc, struct page *src_page,
 		kunmap_local(src_addr);
 		kunmap_local(dst_addr);
 
-		cc->size -= n;
-		cc->offset += n;
+		dst_offset += n;
 		len -= n;
-		copied += n;
 	}
-	return copied;
+	return dst_offset;
 }
 
 static ssize_t io_zcrx_copy_chunk(struct io_kiocb *req, struct io_zcrx_ifq *ifq,
@@ -1011,7 +998,6 @@ static ssize_t io_zcrx_copy_chunk(struct io_kiocb *req, struct io_zcrx_ifq *ifq,
 		return -EFAULT;
 
 	while (len) {
-		struct io_copy_cache cc;
 		struct net_iov *niov;
 		size_t n;
 
@@ -1021,11 +1007,7 @@ static ssize_t io_zcrx_copy_chunk(struct io_kiocb *req, struct io_zcrx_ifq *ifq,
 			break;
 		}
 
-		cc.page = io_zcrx_iov_page(niov);
-		cc.offset = 0;
-		cc.size = PAGE_SIZE;
-
-		n = io_copy_page(&cc, src_page, src_offset, len);
+		n = io_copy_page(io_zcrx_iov_page(niov), src_page, src_offset, len);
 
 		if (!io_zcrx_queue_cqe(req, niov, ifq, 0, n)) {
 			io_zcrx_return_niov(niov);
-- 
2.50.1


