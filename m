Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7B4CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6VkvDa+3msZeC5nA9B9+aDln+Mg2ABReefULBX94/4=; b=THkBvsVKv2rbl0ILI63fmWW2yV
	nrevIEHvq+xYFvvdRFdnNAY00SaemJrDK0gG3amiInJjblEcvW15sAyWUEQLPbYukVbl/b9mW1mR7
	y6h90bqo+oQCuJOF+0y1lbhaUVp3gxX048B2oOF/7+KbPU4oujQMe0U3Y+bkA7j4K5qw51SKsLBuq
	UoeEJAGD6ii/4YFtXfDfUIk4z0zxxLj5LgF6JDNsRbNAN9MOG4IPzTdITpGQ8pCuGn6d+L/dIo9DF
	NL81TEodQ/Yel6OZxldkNTrHsseC1A7hSVwPXIEZOu3uM+knkuypfK6AN2TE8ULAlup0z/AAmSpA8
	+Q6U6omg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFkK-000000013J3-40Kt;
	Fri, 22 Aug 2025 00:35:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBZr-00000000NnA-2cA7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w6VkvDa+3msZeC5nA9B9+aDln+Mg2ABReefULBX94/4=;
	b=jDPfnpv3+N2oUxzL5Ms/5QeVqCMWtriLWVMs1G7Kk3oF7j6obMtvwE4/l4Rl3RVImRwBMJ
	tYlwCX+2//9mdOdWxx7BRMqQeSIGCfrjNDue+zl1985K4KJuXla1qfTmWwK0XOlsaknX3K
	estHeUaIsFKzD8WJkn1aT3SLSx0o5BE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-2YP6t_-aOZ-yNBD5obveAQ-1; Thu, 21 Aug 2025 16:08:01 -0400
X-MC-Unique: 2YP6t_-aOZ-yNBD5obveAQ-1
X-Mimecast-MFC-AGG-ID: 2YP6t_-aOZ-yNBD5obveAQ_1755806880
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45a15f10f31so14273675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806880; x=1756411680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6VkvDa+3msZeC5nA9B9+aDln+Mg2ABReefULBX94/4=;
        b=QHM6i/cXkoSttTUqua2gBgMuhDGYFTQxzlFJ1+Mr0wyASkRo9j45Sbnd14/WITiZRS
         pl9x4L2aQyPyBLjKllnVq/wF8JPp4ZPkwhQLmuA7WIEmcGqvqtuHKxKLYIYSCgSWBbck
         CW/mnWGEfKlnpsyJlcYs+RtimKUkSMes1L+7j8goRlyTMV2b2eTXIAbxQLCQyl07Qult
         RsEhXxwFcmVE6PxchklEDex3UvSjg0tQStmb/USLJMX3Z0+qhRn6kpxaahVz+08j+01k
         WdmvFHqrIgybafgPZhJ58qCtUirWAsdPO20EUHH3arTVV+18HbmYpx6D6ce+IuJKHvlW
         tdTw==
X-Forwarded-Encrypted: i=1; AJvYcCUiSHO2nOwhd2/a5rR4OPn3TSiUPhvXPhAjrYWVCjBeejcwIRnhDnw3HPLag6kXE3rflZjYk/JbNcTRcjj8N/PQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyPMKWvuNM/e+xyWq50K4QiPE6WYW8qAHGgmBG7qi+7eBP2abde
	5N/8diIURzXpumgYfoplZOgRm4eiHuAKFPeOjKbXqhQyEubA13MMZIzMsrGWvi/G9R/f9cOlu6f
	14IfTVatPwWpVKoAnpYxA1wUh1J1mT9dgWCa0+tl28aU1s+n85T+piHqRtgbJuumqx/sTG941AT
	RE
X-Gm-Gg: ASbGnctwiqt1ifmMqPZis2c+6mmhpOanuzZVXLaQ9QsX/PDSgiGP6Ik3Gwy3ildQX2c
	iT0ezFmkuIxxkBwaxsGq5vKZJBPL6DTRnugWMQ1NVmmwP0MwnaSolEIPrwO3Sl0aDhjZK0HUibV
	k2e53gSmu4iOPW68420EmMqJqPGHdWwFLVLLvyKLRMx7nymijdHd0wdKO5PlqLDbyc+XCskTIiD
	ohJ1UbSneDORxeakg/ue9EcUvMptqeSS7SZu37ubO0p4DYG2b/vKtk8T3+5nLWtS1QXF3V7cdag
	B2DbN/bpeBAdM+fcCkH8xlacHbVepjgAaIa7yUgceh5K+HhcWoGzbHmG9XI8WC8UgHcLacd33JA
	1Ug5jXgk/JiRKOkGX+xzLcQ==
X-Received: by 2002:a05:600c:1c87:b0:456:942:b162 with SMTP id 5b1f17b1804b1-45b51792539mr3328935e9.11.1755806880065;
        Thu, 21 Aug 2025 13:08:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9ciI0WdoI3CxhUtu7m/cESVsdReJmvmXFWCMaWsO+hhXySreox2GeOL2sJ8kVyLPwCYhbEA==
X-Received: by 2002:a05:600c:1c87:b0:456:942:b162 with SMTP id 5b1f17b1804b1-45b51792539mr3328365e9.11.1755806879543;
        Thu, 21 Aug 2025 13:07:59 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c07778939bsm12219075f8f.46.2025.08.21.13.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:59 -0700 (PDT)
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
Subject: [PATCH RFC 19/35] io_uring/zcrx: remove nth_page() usage within folio
Date: Thu, 21 Aug 2025 22:06:45 +0200
Message-ID: <20250821200701.1329277-20-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4rYxwT7Pc32IaJPt3nGDLM8NZpM14PvlhLDnLOz8RIM_1755806880
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130803_733693_32A86FD4 
X-CRM114-Status: GOOD (  14.49  )
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

Within a folio/compound page, nth_page() is no longer required.
Given that we call folio_test_partial_kmap()+kmap_local_page(), the code
would already be problematic if the src_pages would span multiple folios.

So let's just assume that all src pages belong to a single
folio/compound page and can be iterated ordinarily.

Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 io_uring/zcrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index f29b2a4867516..107b2a1b31c1c 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -966,7 +966,7 @@ static ssize_t io_copy_page(struct page *dst_page, struct page *src_page,
 		size_t n = len;
 
 		if (folio_test_partial_kmap(page_folio(src_page))) {
-			src_page = nth_page(src_page, src_offset / PAGE_SIZE);
+			src_page += src_offset / PAGE_SIZE;
 			src_offset = offset_in_page(src_offset);
 			n = min(PAGE_SIZE - src_offset, PAGE_SIZE - dst_offset);
 			n = min(n, len);
-- 
2.50.1


