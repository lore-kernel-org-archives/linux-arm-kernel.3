Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E01CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZtGxzPBBhWZb8TdeGEHePc9lnXNDI+6sWWhJSedy84=; b=Mt0fVBIwrsT3IVkRAvTeMkXcyh
	D8i1r/eAIzsHzcddBhXGzqKfxRxSwN0CZgGXuYcoKZHvBm5oEdo848oEkCy4u2MyA8hHq0c0DGgMi
	fdF+hVb5yMsyHAz8u7xnzj52jqngFg7ry5X5X2ixNNnwU1F3hRXomPvjfhe85aCzpUCwOG5Yk3IX1
	pBRrVgmJAK7OkXMyXuxfvHR3oue2bzDRUntFC2mVw+8bw9CBe0+T55hSSkciJLxdA767LNAZVNEqW
	+VnVFamieT8i2EkUxTDtjoHxH01J1f9rIjEsybpdHju/gMFIl71QV2QYbvVpnPGJKP5HlnxoVcSW+
	EEojgpUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXP8-0000000FlbC-2KX5;
	Mon, 08 Sep 2025 08:39:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWnQ-0000000FWju-1lB6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 08:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757318413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6ZtGxzPBBhWZb8TdeGEHePc9lnXNDI+6sWWhJSedy84=;
	b=JSlQ927HR9ZV9kMm0skt+NBdhnqG7ezFazBEzADZ3fEgLw+t/pMOT081FONMGPIS4HA7dU
	rdE8nvA2bsrSttXUjIGaAnCPwRtzrPMbVhd6ROEa4lwf7y9FSgu2RsdCuKNwD+VqyIkDfJ
	GV+k9QGU/89L3Sy47tdHe7u7kU9xFcw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-OP3GGKsIPsSbgbZ8b3yAdg-1; Mon, 08 Sep 2025 04:00:11 -0400
X-MC-Unique: OP3GGKsIPsSbgbZ8b3yAdg-1
X-Mimecast-MFC-AGG-ID: OP3GGKsIPsSbgbZ8b3yAdg_1757318409
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3e1260394dcso2061693f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 01:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757318409; x=1757923209;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ZtGxzPBBhWZb8TdeGEHePc9lnXNDI+6sWWhJSedy84=;
        b=SK++mD8HGeKGycrNUGeCm4XBuRZQ62uwB/IGItxBdnWgSS2sIYqiDYYfd5Fmewpolz
         BjZmQLY6fe5YrTWOGjHtD6gOojgID+MaBbK0KXmyNpwD8jwTRFVr+3fYHEvRCLX3XpBD
         YsECZcd0XAmcz0L0yrztKJVTwdJ0Kx02fCTagAyssXVPhClcnMcYOy8UsaQyeD/lko2J
         U9QyVWZmFzdDkAzcnRuk78QfAqGsh4gedFMaWqLcQ5u/UCo/vNksSkjpSpxEhvC679zR
         fAi/2uIOTYFs/rdyDKQ8wGaxKZLO5j87XPzZiNUZYvwZ1r2w0dy6b5Gmy0sAn5d1M3QM
         XtSA==
X-Forwarded-Encrypted: i=1; AJvYcCUD0c/cJAVQi57Y9mUv0RBbwhv6sbP1ekjiw/OJNxmCOqspajJRjcGrw0S7Sdb4zzC0Ot3hO9GMK9BOCz29ULQH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7giDYymBi0mYw084gtFHgA0MVHZnovRxIRg6g1G7veZ5TKkhu
	VaRHKH8jut6ZvWj1V1TyR4U+7mSQNk/7KtZYMtDoM60o4fCKMhovv+hfALPL2zSP7P4onf6r6Nr
	h7UUb14FVsyIVFE8WgxPJp3HbjkvaTPyqDnKjP8gYK5fiBe5+/qGm7K02dM8YQLhQcK2aakuthW
	a0
X-Gm-Gg: ASbGncumZF3M5pYu4B0n2Lhvgt4G4as6qn5pMGFh0yncELQ/unx8lDl5iuGtI55QFqZ
	xPZ/tu9Jm3wZoodwjlAIWtOPLSUypZhZ15IDFF+n0exac1TG2NVaYKBhTVHDp85iBWkYDmcpgYj
	pTSUH6Es4D94SuJ6uVU2eZmmVBsp+dlaxoJd1Tt+YrLMBoNbdIrlt58ynNAIeFrUEh/SQ+LTg+D
	kETefbUcb9d/MKrzcJcvMWe1D/ZJOOJk+AR43FLwnphPJv749JgSCV7WmUlHqAr7Gcf3CPWF5FW
	/SH8Pc491UZd7Y9QaiNvlruqUwiNc0uIJiv/5UO5jpO+3aru49upyVshv058yJ+IGVnokyg=
X-Received: by 2002:a05:6000:26cd:b0:3e0:2a95:dc9e with SMTP id ffacd0b85a97d-3e64ce50347mr4840527f8f.57.1757318409146;
        Mon, 08 Sep 2025 01:00:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+e2xgTQYe5kT3rV+uD8LRSVafVXIklNJL7Am05EAxkn8s4rPl3yNNJ7oQs/EOmF2miaT83w==
X-Received: by 2002:a05:6000:26cd:b0:3e0:2a95:dc9e with SMTP id ffacd0b85a97d-3e64ce50347mr4840495f8f.57.1757318408663;
        Mon, 08 Sep 2025 01:00:08 -0700 (PDT)
Received: from [192.168.3.141] (p57a1ae98.dip0.t-ipconnect.de. [87.161.174.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e740369f1esm6798834f8f.11.2025.09.08.01.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 01:00:08 -0700 (PDT)
Message-ID: <28fc8fb3-f16b-4efb-b8e3-24081f035c73@redhat.com>
Date: Mon, 8 Sep 2025 10:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/37] mm/gup: remove record_subpages()
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, kasan-dev@googlegroups.com,
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
 Zi Yan <ziy@nvidia.com>, Aristeu Rozanski <aris@redhat.com>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-20-david@redhat.com>
 <016307ba-427d-4646-8e4d-1ffefd2c1968@nvidia.com>
 <85e760cf-b994-40db-8d13-221feee55c60@redhat.com>
 <0a28adde-acaf-4d55-96ba-c32d6113285f@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <0a28adde-acaf-4d55-96ba-c32d6113285f@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m-Sk-K0UWdR1hlfrKhSjkU8obi3c3E5Ii-DOCBsCkBI_1757318409
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_010016_534094_0955A411 
X-CRM114-Status: UNSURE (   8.29  )
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

>> Roughly, what I am thinking (limiting it to pte+pmd case) about is the
>> following:
> 
> The code below looks much cleaner, that's great!

Great, I (or Aristeu if he has capacity) will clean this all up soon.

-- 
Cheers

David / dhildenb


