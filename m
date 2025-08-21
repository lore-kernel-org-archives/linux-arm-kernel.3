Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4B1CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 04:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8aQmj/0+AYT4mPx/DatgQPPbmq0Lkvm9KCqKkKCdC9Q=; b=x/RqSBj2F/srOUsk6Z1YhiCMhc
	XKYaeC0DyJ1jCohKakl17yM9ZtqwnZnBramGWxHEfcep7ObyYxKovbC9HWtaK5JfWD0fzxHmtXdCo
	ah7ofNeAHR1Z4Zk9lfyYd/3uj1GmKXA6GFYpthGi+Rg0KLKYcpX6OS8U3Y7LPSWKy9zgjB/DDmqAn
	hWm1wWSKe3/nXD8SM9solfFc9tixh4e6SKL/VFXJaTUk0mi+noqAFol2GdVmb/dA16noHHZygEiQe
	Sbkj2LeHiVvCLnbNbn480EGvuLkUnD6n8Pcj4aa17fVBIo5liMRA5hNt3i/4X6x3BCHlpLIw5Gnpg
	JNZKkqlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJBL-00000001U8P-1Lij;
	Fri, 22 Aug 2025 04:15:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaj-00000000OHd-3hRN
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=content-type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=8aQmj/0+AYT4mPx/DatgQPPbmq0Lkvm9KCqKkKCdC9Q=; b=nICgXHQCCUDnDOJq8vOs7notLp
	IbKyHx4aM7b/Agw45ybdXyfs9bECRdFmExEAEtKCGDXTFqlmNIjZWC/1rMNG5EKL/g8fms+bFTsjA
	If47Hi6akFsLsZDJcJbVzsV0J0nW1aKYi7CZ/Av0Bg7NmH1S+7eaUj9ASkUR08x1U50e+kHFUhr0S
	ttwLIGfGnGzkWkNWmSHt5c5ABjNulv48SMaqs7veIqqhrpzWFfxxPzW3O1/UE+S7T8/MbolXEFaMN
	vf7UELSUhC8V1bGV6lmYTYlpUBvVlGyUONbI060k2qjqUAEjihSXog3JX8obxBzkmOfFvK3Mbsn/O
	P9UUIvBg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBae-0000000D2xI-0fMD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aQmj/0+AYT4mPx/DatgQPPbmq0Lkvm9KCqKkKCdC9Q=;
	b=P+om3Ly1mt0yX1sZYucJqz2xveBZcrjY6vWU9Y8+C69qNmguqbB4f+M7otevDQThyuz/FS
	YSNpckBX2waGaJekmPCzDo1xIjPmAySgByOfcLI1YJZYOSAwTOFVGj0dhYWIH+rtYNE2Vl
	deT3wZ+FJ8BYxl27wuLNOWfBQ6TXgwI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aQmj/0+AYT4mPx/DatgQPPbmq0Lkvm9KCqKkKCdC9Q=;
	b=P+om3Ly1mt0yX1sZYucJqz2xveBZcrjY6vWU9Y8+C69qNmguqbB4f+M7otevDQThyuz/FS
	YSNpckBX2waGaJekmPCzDo1xIjPmAySgByOfcLI1YJZYOSAwTOFVGj0dhYWIH+rtYNE2Vl
	deT3wZ+FJ8BYxl27wuLNOWfBQ6TXgwI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aQmj/0+AYT4mPx/DatgQPPbmq0Lkvm9KCqKkKCdC9Q=;
	b=P+om3Ly1mt0yX1sZYucJqz2xveBZcrjY6vWU9Y8+C69qNmguqbB4f+M7otevDQThyuz/FS
	YSNpckBX2waGaJekmPCzDo1xIjPmAySgByOfcLI1YJZYOSAwTOFVGj0dhYWIH+rtYNE2Vl
	deT3wZ+FJ8BYxl27wuLNOWfBQ6TXgwI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-Q2wb5nIfPv6LWmKMIthRQQ-1; Thu, 21 Aug 2025 16:08:47 -0400
X-MC-Unique: Q2wb5nIfPv6LWmKMIthRQQ-1
X-Mimecast-MFC-AGG-ID: Q2wb5nIfPv6LWmKMIthRQQ_1755806925
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1b0d221aso6550415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806925; x=1756411725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aQmj/0+AYT4mPx/DatgQPPbmq0Lkvm9KCqKkKCdC9Q=;
        b=mwZxGrSytyrQPaybfs0D3sloG+UUwbA2O4mZn4BXWX3iHfMCtxeuO5nmXCxsOYL6BJ
         /rltoLZWYINC8kHmJ0dor4daNePKM0ytGAa2ilGor0F17bqOGWjlB2KeWAKcMm5OMXOZ
         zbY8BnUrXe5yl3toXiOColxZ3/UgAu7WIIoFnzMs3yy/LnlqOr8JgqqxV+V9c92Y9voF
         ZRPkzjyG4KCiY9xfy6yl7EPJPc7wAw6a61JvbnhKvDKvScAKPUMQWIKhprouPAEWrghw
         H92ZrebkdJ6asm0Y50j06CQUpBBM2/vQygJP7sHgMZYRQT33KJfThPDYXynhzk7QHIy6
         HHVw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ+xa607FZqyJNjAfcqzK25nbYXBKNvIuR0pncFDktY6GFFGrC63zv5ufn/2lclT+c2SlYUWDIpXWNfD1q1lMd@lists.infradead.org
X-Gm-Message-State: AOJu0YzalJKjEEWXhFIvxE0ui1vMd+f9D2xzULDYxWt+ZiULuKu9fQwH
	fjm+he3tpc5e1xagwS5tz1lrlWVvxz47uYs2A24IRZHIlVHMOBQuo8B1t0mgOesQIACghSUjC/B
	ALTQfgCxPcaC12HlVKTmkkI2q2N8t7Hv0zbyZ9W9Jn6UpS8y5O/pDL99b5HjiDYJl3SqXgBfhKu
	z+
X-Gm-Gg: ASbGncshFf42Rwz6rzJa3Z9Esp9th8MB6dIp+yLpUqumrpGCb3gt9tDdD/7SajLOZca
	+395YdiiI4Eey9NVIz9gwbdDt69F8FlwWGAaDli5jEixG6bAsikCK5lCk0lnUkweDA4iPJozlXB
	v3bhHkNZxDeA3z4xltw5E5D3GRPQElffRYx5kT4YN2Lh9998PJHNehY72HmZKvJrrK6y5J86/q6
	iH3rWDjhEUTsVY8lJyoAzMUOBEJFjqibGC3wwGzNJoX1OmEpWmWJBcpPHZETCzeMbeERi9eu8xI
	3/wg963EGGbsLf4PQ4EPeMUfhvvx6mGctCy39qr5i+2CqO3Gep0Dl4T/YW81raIvzEvvhICZzBd
	4B+9uReL/2KacwAm9O5/Ubg==
X-Received: by 2002:a05:600c:3b25:b0:459:da89:b06 with SMTP id 5b1f17b1804b1-45b517b008dmr3774305e9.16.1755806925529;
        Thu, 21 Aug 2025 13:08:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDDv+I9AWZPVyKVFD2prHDmQqsK3mzEWwP5yNf0oRJXtHjmqgi3hMC3hwAmszm5rTAtK85Rg==
X-Received: by 2002:a05:600c:3b25:b0:459:da89:b06 with SMTP id 5b1f17b1804b1-45b517b008dmr3774035e9.16.1755806925116;
        Thu, 21 Aug 2025 13:08:45 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50e0a479sm8895255e9.21.2025.08.21.13.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:44 -0700 (PDT)
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
Subject: [PATCH RFC 35/35] mm: remove nth_page()
Date: Thu, 21 Aug 2025 22:07:01 +0200
Message-ID: <20250821200701.1329277-36-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Trqngk_hVW2m83-029O5akJboWE38z3rVcP9_4p-OCI_1755806925
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210852_944202_461E3DF2 
X-CRM114-Status: GOOD (  10.88  )
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

Now that all users are gone, let's remove it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h                   | 2 --
 tools/testing/scatterlist/linux/mm.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f59ad1f9fc792..3ded0db8322f7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -210,9 +210,7 @@ extern unsigned long sysctl_admin_reserve_kbytes;
 
 #if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
 bool page_range_contiguous(const struct page *page, unsigned long nr_pages);
-#define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
 #else
-#define nth_page(page,n) ((page) + (n))
 static inline bool page_range_contiguous(const struct page *page,
 		unsigned long nr_pages)
 {
diff --git a/tools/testing/scatterlist/linux/mm.h b/tools/testing/scatterlist/linux/mm.h
index 5bd9e6e806254..121ae78d6e885 100644
--- a/tools/testing/scatterlist/linux/mm.h
+++ b/tools/testing/scatterlist/linux/mm.h
@@ -51,7 +51,6 @@ static inline unsigned long page_to_phys(struct page *page)
 
 #define page_to_pfn(page) ((unsigned long)(page) / PAGE_SIZE)
 #define pfn_to_page(pfn) (void *)((pfn) * PAGE_SIZE)
-#define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
 
 #define __min(t1, t2, min1, min2, x, y) ({              \
 	t1 min1 = (x);                                  \
-- 
2.50.1


