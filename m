Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B672ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfbHPH5Jjp8Rpz5+ZFUkvP8crb1ywqdy8VPh1hjPgaM=; b=P9d3Z5a4UqZ7qyNidtrN5/9mTK
	otAs0B6YQ8cdSsFooqE1ndsRkXt4IieEOUxBCW6VM4HCiX1Ltv7E12NFeFju2jxS699+f5Jh6ryFB
	aYkV4IQV+FkStDm5YiIxUH492TNQPhBkTg3A9OShld4QxxMS40MIMwfFYiX1nqlTRFYejTkG6S0EV
	gReacZ1qBnKoffRA9OfKzdP/rv4ePNGqVxIvPCygc8E2rk5JTGbjI9hZWK3Th0zmO8Jp/1Bk+kmNt
	TokIbCbE6LM96CKkwYu3tZxpfBLto8hYXCbsbQv7LiSyto1Iku+JHLo7vQSqZkH4EC5+M8wCUzBZx
	fIUgnx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphjf-00000003w0Q-3qXk;
	Sat, 23 Aug 2025 06:28:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPzW-00000002LWz-1COM;
	Fri, 22 Aug 2025 11:31:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so11578385e9.1;
        Fri, 22 Aug 2025 04:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755862288; x=1756467088; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SfbHPH5Jjp8Rpz5+ZFUkvP8crb1ywqdy8VPh1hjPgaM=;
        b=R7qBqRliMTkC3ymidULCskOi+2hMSStFzHuOOig05wSfWi8RNFpqXZ5ufm4LV+vJvx
         ya2T8n9cE9FSKFjK9jLqAox6d3rnPyqDKfyPptBceU5UMrzwYc4RmgW0UaOTKoeTFgcg
         jsBUWIAuhu/Sif6P3+opwwAHvszwoESU+lt6tmRMK2fR/0v/F9Brg2Hw5UkI4zsO2I7A
         Kz02ZHG1bXyEwNcAXDYkPveCoMUhW6MRLdl0Sc0d4Ad5i+uO0d+DhWb7DaRRM6yV9lT6
         VW0gS77CVSCCxguxaWNyAnkBZiW3w+fCm9jnptnUGHPR9iXcS+8N6+pnUjet4UYZgK5K
         YARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862288; x=1756467088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SfbHPH5Jjp8Rpz5+ZFUkvP8crb1ywqdy8VPh1hjPgaM=;
        b=aPVT9jrrKa//Fwzi9DF+mmRvjAKigXrTmYOeSno2qBu+qZvaGg6KY9QUOl+PlbH/j9
         iy6XDQwlXhdA7gDz1iQJy/+ModdMR4OGD/bm2PWiiGvoeNoFanoLTqabImZk2mUPxEHt
         0yZUKZQJVdysAJb2o0UVcuY7sUPpkjUogUHcpyOOqeFhpwF31Cx4S8D1sOIefo9080Yx
         06OsvPu91j3PGZU4rJFsvcBQwSnbngvi8xbB7JC7KHDlpHHqyiF6Qnhjd0rYYbrt/Dxe
         FHqAu+4iUhHJ+uuuZ5pXfSl/N6w6j5nj3ILbDkiZmlnVBgwQfnxqsrKrboyBYsEAdoQv
         AKgw==
X-Forwarded-Encrypted: i=1; AJvYcCU6X3tfZy6qSctDPtZsGLIb7pEDwDxfqOY9eQblgs1mWPn7E8q9GP8KKL6+axgrx8AWvAreBT2kwYcuIaI=@lists.infradead.org, AJvYcCWXo/sRgfg334YI1OD6mlA66QIZukEWUUDt/bQDWfr27MMkNolh8oPnK5/fyn3t7OIMRU4cF4L2t/ZRcYoQdJj8@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh/awO8jUbGaJdMUEf86BhqXXNxlmlNPJalkK6QL4g87je1l/8
	775GKTrv0f23lFTYqn4600rE6jKk5gVKLAyRY281uCQnZtjHbUpT45Z2
X-Gm-Gg: ASbGncul+qZs1/80VKaZ8n5V30dWzjm+0yIEdH/Ho6BfHY6V9iD+Lt93q5uCA1g/so4
	1khN9OkceU4/P+d/8dSIJfNgHXfIkxatpxrTU1mv+imPGg4MgaCQ2VcsYcZX1I9P8+XQj4V6Hnd
	qGQ7Y6gmnWkDeUmf9707C6/fWHzx4j2rThTkQkIoolxj4yKf+35BdzFe0O4e+90aa4Zgjv/jaLd
	46O6RHiyi/4BQWldfkbkGwdsdofmEKLjTki4TOLqFTywmD/mJxCj3TCk9IGUAPOJIlSPYq1LJO9
	QSNJV7TPuqHGOGK3xc0YQNhXczjD4U64QGlAq6R63m+dxTNv/K5jGXsmkMPE4r5F9UnoKzfU6Xz
	MTvgSNQog1p7omh6fkk5TG7SHoWCk3KvMkyY80K992dF80mKcd2lduGs=
X-Google-Smtp-Source: AGHT+IGRxFKrTZ5eDvBkmi1zEgN6s0gJ3t3AoyWptSyZJnQ5Bb32czELomyx9FMDxkr1p0nFemiRbQ==
X-Received: by 2002:a05:600c:4747:b0:459:e094:92cb with SMTP id 5b1f17b1804b1-45b517ad81bmr24844685e9.12.1755862287996;
        Fri, 22 Aug 2025 04:31:27 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:1b93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e4241dsm35921185e9.24.2025.08.22.04.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 04:31:27 -0700 (PDT)
Message-ID: <b5b08ad3-d8cd-45ff-9767-7cf1b22b5e03@gmail.com>
Date: Fri, 22 Aug 2025 12:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 18/35] io_uring/zcrx: remove "struct io_copy_cache"
 and one nth_page() usage
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-19-david@redhat.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20250821200701.1329277-19-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_043130_332354_5D56FD1D 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

On 8/21/25 21:06, David Hildenbrand wrote:
> We always provide a single dst page, it's unclear why the io_copy_cache
> complexity is required.

Because it'll need to be pulled outside the loop to reuse the page for
multiple copies, i.e. packing multiple fragments of the same skb into
it. Not finished, and currently it's wasting memory.

Why not do as below? Pages there never cross boundaries of their folios.

Do you want it to be taken into the io_uring tree?

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index e5ff49f3425e..18c12f4b56b6 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -975,9 +975,9 @@ static ssize_t io_copy_page(struct io_copy_cache *cc, struct page *src_page,
  
  		if (folio_test_partial_kmap(page_folio(dst_page)) ||
  		    folio_test_partial_kmap(page_folio(src_page))) {
-			dst_page = nth_page(dst_page, dst_offset / PAGE_SIZE);
+			dst_page += dst_offset / PAGE_SIZE;
  			dst_offset = offset_in_page(dst_offset);
-			src_page = nth_page(src_page, src_offset / PAGE_SIZE);
+			src_page += src_offset / PAGE_SIZE;
  			src_offset = offset_in_page(src_offset);
  			n = min(PAGE_SIZE - src_offset, PAGE_SIZE - dst_offset);
  			n = min(n, len);

-- 
Pavel Begunkov


