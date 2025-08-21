Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC90CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaqjYk7qiFpFT4dP16wKMuC8fiQfbkUwRRgQVKGzHC8=; b=OYdmgfvjyk5r9qpgRrBN2/Yz+T
	NgcMJvdNKaTN3XvHzgJU3eZ/JaiROvq3gW9SChAv6DcMDj9tOUfb4+H8aIKDqFfK68BZFFNgxsKxL
	qJoEThBoGsUpLFshIKTn+pvSA0qPRHWV1T2rRuLJuNnjLU0FtAWLRKfp3XICuoaXW/0W2l8RwYJxS
	sotq1pfF2Oi0aHtfzqt+unmjsXyEAxlokiRSNwZ6EpxwV+79DXPbRXPG8tHBHsGxTmgt+60Ad2Hue
	dq5y0qjDIvgfqkE5t1RkdPVdcZ/UJmjZygtmngbpDN+w7oL/WxesLp8YB9sWvouFgtgfWL5FMJyGt
	30AOVLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFf8-000000012oG-3MKN;
	Fri, 22 Aug 2025 00:29:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBZm-00000000NlF-3dAb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TaqjYk7qiFpFT4dP16wKMuC8fiQfbkUwRRgQVKGzHC8=;
	b=VHCH6zjvhS/7B2NvvLSqhmwYfr+xkNsd3qnuHe1jh4c5WrZaPSPrBeG+diV2jTMDlNNtY5
	5BEqQxjnZvt7V3j9+HXC8k3SeK0pBaKxSki2I6FmjHyDbZP8KjmdX9YVUbzJLelmdHzR3y
	smp9rTsn9ABbFWJHtsANJqbT5F22aMU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-OS4AqlSfOoyru5zhP3TZLA-1; Thu, 21 Aug 2025 16:07:47 -0400
X-MC-Unique: OS4AqlSfOoyru5zhP3TZLA-1
X-Mimecast-MFC-AGG-ID: OS4AqlSfOoyru5zhP3TZLA_1755806866
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45a1b0d221aso6547735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806866; x=1756411666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaqjYk7qiFpFT4dP16wKMuC8fiQfbkUwRRgQVKGzHC8=;
        b=SQNF9Fa/ovg4l2drebPHO+UfKwVeaPFXZJr2fRyD3x4jx+RtFyUxve5FVTaWv4N0IS
         29b3rGMYKzwHIFVaf5J/O2WMcmtFswTEkaZ1Dk9jPKopKGh86W2Cs4lhLbjHEzgrLrat
         zffbuXyFJJDZPxpUbcqEi9nBwARUTlR5PVBamcq8dBoBAaQHm69ks2RURDjF7KQcT/9q
         OEXXUS0oZ04mlZHy8UeTr6jUlH5Xr0adWHX2awfGYwKqQxV2gBcfnTOTHSX+u2OMujBn
         OZDRPmowzOi9JKQyiv+11wM7IF3L6CMtKMYd4v0xoDKM7QIIMZRDjqTPM0kaDARCmfkw
         QyYA==
X-Forwarded-Encrypted: i=1; AJvYcCXg5UuONZhn6IHyMRnPG1wkURTsJiWq7TdwsYUesmrKFemAdV0JaZ0yM4BWl1HNmLFgXYIvjNQJRpNad9wxd5hu@lists.infradead.org
X-Gm-Message-State: AOJu0YwcF+L7K2jPs6kh5UhiWoJMdnZkDcFwgeggK4KebCanSSXljLJM
	rZdlTTELOF0Vo2Gdxkd0p6R6atc8P1IrItjfsJ+RHv2oxW2DLjZasg1shdgAqgb2MsGbtQBA8HZ
	d6mZkGTpFmIJrGGbY5YMCDqqBvaQOYXuTdKh2O6xEdfwUDLv1SKwYq6kv9c3voI6HfC++nHZGN+
	4Q
X-Gm-Gg: ASbGncuhwZQQ6r6aFprp9guQPszXWvvohZT9hIwQlcbOxG9YWoq7yYDgp6eQi+uJB3N
	faQRorBUAT+KnU3PfSDQ5lPIOL1YZu0Z9Mx21VRFu2FhrO4X818TKFKcnOfzdTa4RiGHj0VrT9m
	iZgnUHLVLcHCaFYTNCSXtEAQfNY2VeHe773LKbhbtn4SdrXrOnaRoh1D8Uf303d7hRFenznYjdf
	I3igpsgWPrvAm28eMksobJi1VTRfofWHDgmaa4Z4Ns+3PODWcbcsb9Gsn6a9Jy7txScBjsywXi8
	b1XdfPzEsh0rPBRKTeh9ydVQ6qROa7hdBSzVHKuycBl/wUVX+MtqjUUmKw0JRQp5EE/ir2bN7IR
	dv/vtE0KuCdZHMcwOI5aPYA==
X-Received: by 2002:a05:600c:1392:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-45b517d4e23mr2819355e9.26.1755806866184;
        Thu, 21 Aug 2025 13:07:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUtzGc4rPv18tjnV22wd1xjfGI25AJiVbHUBF3o7jj7YvZLrrv8XzLc39l/Z4dCqHj4yY2QA==
X-Received: by 2002:a05:600c:1392:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-45b517d4e23mr2819075e9.26.1755806865726;
        Thu, 21 Aug 2025 13:07:45 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50dd0380sm8632985e9.10.2025.08.21.13.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:45 -0700 (PDT)
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
Subject: [PATCH RFC 14/35] mm/mm/percpu-km: drop nth_page() usage within single allocation
Date: Thu, 21 Aug 2025 22:06:40 +0200
Message-ID: <20250821200701.1329277-15-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7yECejdoF9wHFpe9cmD1j2FHNkK0dSD6GmcNzC5gBZY_1755806866
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130758_972340_979C7231 
X-CRM114-Status: GOOD (  14.73  )
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

We're allocating a higher-order page from the buddy. For these pages
(that are guaranteed to not exceed a single memory section) there is no
need to use nth_page().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/percpu-km.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/percpu-km.c b/mm/percpu-km.c
index fe31aa19db81a..4efa74a495cb6 100644
--- a/mm/percpu-km.c
+++ b/mm/percpu-km.c
@@ -69,7 +69,7 @@ static struct pcpu_chunk *pcpu_create_chunk(gfp_t gfp)
 	}
 
 	for (i = 0; i < nr_pages; i++)
-		pcpu_set_page_chunk(nth_page(pages, i), chunk);
+		pcpu_set_page_chunk(pages + i, chunk);
 
 	chunk->data = pages;
 	chunk->base_addr = page_address(pages);
-- 
2.50.1


