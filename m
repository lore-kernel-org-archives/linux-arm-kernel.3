Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DAFCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 03:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/kmddABpvZJu5K+QD662cz6jOGE1r8xokeQdlRgepQ=; b=PYevIcOC27wrcGvNfr7C5c+0im
	nlq1oFa4HuxsUCOMD6Sd8hbLFB4LU5pB0m0KdkWCqN5dMf5EF8vRkLqKZjAWD/AHTf5TyX7Lfww+H
	pZ205BuHxbEc7bFgPKhCkRo62ixIKplrcHormMHvz5v3DFtf55x25HxO7TLc9s8WXJ04Iu5ZmdDSD
	5J/OyvbvAD+PtnxYuUtpVWlKiOZ/wNlTSl/VchKvnVnVqfN1neeC+7NYdB5oIOWk7YA/AfA5kBG4l
	tr+ZzTJ/Ksb9vv0lAbLmElWnNZn4pK4+AcRcF2KNoI8Wj4pTbeIwmpUAAHe7fsRXz0r+59DyLg8ZR
	FB/kWgcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIqa-00000001S0r-08BQ;
	Fri, 22 Aug 2025 03:53:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBZR-00000000NVq-06nd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/kmddABpvZJu5K+QD662cz6jOGE1r8xokeQdlRgepQ=;
	b=OHRh1aWtjyH7bgDR/vKNLiBJDWefrujdgHWzWUmYUGdlXmgy7LG9YM0LMwhx4rEc26Sd5p
	r706bB3tQdyZ2Kg0VHcONgLMzTulJekNVnXVaTv+EcncZGzgg/72PvuScRZdIecvTM5xgQ
	mPPKIRJ1cKi26PWcSrqcESDHYf+9JZA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-jE_4mMU1NRyxBoi-updDZA-1; Thu, 21 Aug 2025 16:07:33 -0400
X-MC-Unique: jE_4mMU1NRyxBoi-updDZA-1
X-Mimecast-MFC-AGG-ID: jE_4mMU1NRyxBoi-updDZA_1755806853
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3b9dc566cb4so996110f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806852; x=1756411652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/kmddABpvZJu5K+QD662cz6jOGE1r8xokeQdlRgepQ=;
        b=exzYHy7R3fi2pfLiMxOAK8tixlSlW4VFtY+YgZYgnSSqYkVa6obpcSoReABM5+6adG
         jnayXHRjNX+NoXBsqHQsL2bHIIcRFpNAirqdi3vS8174mvZSQ648NdD9A7N8vDt9cgoC
         JB0XxprarX3fkhWseADX56feCMlwgQVkw8g7bCmL7AFYFLxsVdlROGGUXLo/SFFC7Okd
         qwmaXWfNo+wl0CfjckZOmfLg8ftYv+gwnEfES93kAbLX+y/iEF3qSdVDRovs7i7EXRuL
         MOMARz87gftO/ok64NxUtZks5APMZLRN79d2NWOI/gecpJ9D/qtpzn3p1ZT38nIgAcN9
         7zKA==
X-Forwarded-Encrypted: i=1; AJvYcCX0PetJ8/imb1WPYQIUbw+W72ZyYQ8QcfY5hJCzH0TvZWQh0Y+NsP7KLUVpxu7lOmABR49tSYwbk+21QQH6o2k8@lists.infradead.org
X-Gm-Message-State: AOJu0YzkIYqWIq6j4EVwznbu+Dfewye1qHFgnd7k/L8NEqztdb+k9WJN
	XBZYtLCjDFls869Kcfj1sgZLMpdBKZKZ0Xm+C3byittgeG/rrWRKnXe3086ZC42VQfFV3NmCBoV
	5FmrZpXZZCdpLYACxfUrjANBrPEejfOiqj9DBFaD7nkZKJAo45QGp9BVm5nMhKw+Ea4HWiwIsef
	z2
X-Gm-Gg: ASbGncuTon6hIYdafOVjfqj8Omaj+7VpJ3xJjVyAVKiduExg7zLx/u0TvLHOMUQ2lp2
	wBqeLFcxci8XIUjhH/kX3wp4xZyj/ioZiZn+rUbSrZupq5Vz5b1HdEpQxbVAHVtDQyfLF62TzZ9
	HPOFxml0Xj/0GT5+P9XbNjGyls/O46eoZlbL1Hs7aQ+bC5DJEnbDMWo4lHTHnKIAsGXe5Hyyu8N
	2WBrHQmFDZ8R3PXdhCPs1VRezOepDpZTWlbmsTK3mwxNxTt0tATt9CUNo0lOh0w8J6ZBIaHSOF6
	VJ2aFkTMPVaViU9M6Tcyvt+UsraO2d0KhkZ8xb++z4y4mwDQWfWbmqO6zvPTXdiIlPDTsEUr/QL
	ZFpN9gBErVcEEfk/5gf/vCg==
X-Received: by 2002:a05:6000:2dc7:b0:3b9:15eb:6464 with SMTP id ffacd0b85a97d-3c5daefa9e0mr244713f8f.15.1755806852622;
        Thu, 21 Aug 2025 13:07:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbqF8V2lF/CygktHxSJZNB7+pmyneW6nxhnLwTxWefpTwvecQ9FG1LkYH8lxi0WUYYPrMQFQ==
X-Received: by 2002:a05:6000:2dc7:b0:3b9:15eb:6464 with SMTP id ffacd0b85a97d-3c5daefa9e0mr244660f8f.15.1755806852102;
        Thu, 21 Aug 2025 13:07:32 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c077789c92sm12629958f8f.52.2025.08.21.13.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:31 -0700 (PDT)
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
Subject: [PATCH RFC 09/35] mm/mm_init: make memmap_init_compound() look more like prep_compound_page()
Date: Thu, 21 Aug 2025 22:06:35 +0200
Message-ID: <20250821200701.1329277-10-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oMIJbZV2vS9h4O_9MlZ9o4pkrL0C2UrzNz2WrEeRafQ_1755806853
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130737_146338_070E125D 
X-CRM114-Status: GOOD (  17.77  )
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

Grepping for "prep_compound_page" leaves on clueless how devdax gets its
compound pages initialized.

Let's add a comment that might help finding this open-coded
prep_compound_page() initialization more easily.

Further, let's be less smart about the ordering of initialization and just
perform the prep_compound_head() call after all tail pages were
initialized: just like prep_compound_page() does.

No need for a lengthy comment then: again, just like prep_compound_page().

Note that prep_compound_head() already does initialize stuff in page[2]
through prep_compound_head() that successive tail page initialization
will overwrite: _deferred_list, and on 32bit _entire_mapcount and
_pincount. Very likely 32bit does not apply, and likely nobody ever ends
up testing whether the _deferred_list is empty.

So it shouldn't be a fix at this point, but certainly something to clean
up.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/mm_init.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 5c21b3af216b2..708466c5b2cc9 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1091,6 +1091,10 @@ static void __ref memmap_init_compound(struct page *head,
 	unsigned long pfn, end_pfn = head_pfn + nr_pages;
 	unsigned int order = pgmap->vmemmap_shift;
 
+	/*
+	 * This is an open-coded prep_compound_page() whereby we avoid
+	 * walking pages twice by initializing them in the same go.
+	 */
 	__SetPageHead(head);
 	for (pfn = head_pfn + 1; pfn < end_pfn; pfn++) {
 		struct page *page = pfn_to_page(pfn);
@@ -1098,15 +1102,8 @@ static void __ref memmap_init_compound(struct page *head,
 		__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
 		prep_compound_tail(head, pfn - head_pfn);
 		set_page_count(page, 0);
-
-		/*
-		 * The first tail page stores important compound page info.
-		 * Call prep_compound_head() after the first tail page has
-		 * been initialized, to not have the data overwritten.
-		 */
-		if (pfn == head_pfn + 1)
-			prep_compound_head(head, order);
 	}
+	prep_compound_head(head, order);
 }
 
 void __ref memmap_init_zone_device(struct zone *zone,
-- 
2.50.1


