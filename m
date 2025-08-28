Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117ECCA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 07:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVrt2ctwbXgHbo+Hn2TZ0gCxiv/sLljbJFjbqAY/TQU=; b=rVvLGNAbBkibKfKBwP6PZ7Fa0x
	dN/IPXn4kpKdgo2L/aqkimzlqugJDcWADCH44Pu/5ww1Dj0y3dyPpzSU/21hReWL/IzCYBCcwngkj
	STb7wlmSYFYxgUbcNpYSsQNmgw9KwOR6Ug9++teebqnqiewmPfEQRmsRBSXqNWHgOcvy60QLN8DON
	O0eMRAruKOgDDtzg9nL3Chiw/XyE1MJQS9u3yHG0Kw3ESoDX/k6h1VT+HAR6ODhK5DAi/3aBFbYPr
	eAcqdfCxZv+cLNiKEcZ3PsxgTcMGwm9RTzgIKhbtNvw+NASGqcaH8eTzrZX+MxWP9aTBF657qzg0u
	rg2V6UYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXL7-00000000fBR-04TJ;
	Thu, 28 Aug 2025 07:46:33 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXCo-00000000cdJ-2HNe;
	Thu, 28 Aug 2025 07:37:59 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-61c26f3cf0dso1069313a12.1;
        Thu, 28 Aug 2025 00:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756366677; x=1756971477; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVrt2ctwbXgHbo+Hn2TZ0gCxiv/sLljbJFjbqAY/TQU=;
        b=UYtZzDHNCJLNZqQUK/rL38Mz/I/UDsop3DinZAZ4o29BRe0w6NcBqBPWGjXB3PuCu5
         8r+yTlDkess6XhiA940BKNTgpheqdsyOH8eqIWfWcPvyrCK+XH9deJAGVQ+m3BJEhLmM
         UGM4kxyhT54I9L+DQCvi3vY/6YK7AnNN2XIu680NLyQLZMlDv9mhZEbtXslwWnPt9iuT
         oqBosoOqOHGbyF+qTj0pSGTAif7X0ybxTOs2/lzPkUWuqGIqgSr+2lH+j/2SHBstT44D
         BrUhaKCDV1JN36w6Q4ETybXk3Np0vCDAfpnL/pyUJn5v/C5yeow1Sgv4Adj010fPPt1i
         TcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756366677; x=1756971477;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVrt2ctwbXgHbo+Hn2TZ0gCxiv/sLljbJFjbqAY/TQU=;
        b=sY65sYoEZutp8wtpMFwP+1j43UzuwxGrOQBBzeh5o6E9jv5iPtO4Wzg+dwNK07vn8D
         uy+xIJ9okx1G49b/Lrk4RaBHnrDmha2qlSSINnptECHSfSSnJ1B459VBqLe7GV62lx5u
         35fzbKxtACaRdUDwZsrmTnnwU1vCIzSRtg3CTOUMMzU6oD7wnO8og4/p3PGTwy4vnw2p
         gVg6nZvIybBsY+9uKpMsdOnQRxvO3BmHC7gLZPvN/OD1ICTOze1Ge6ATMde3qGIXlR39
         cWTj5Ki2TNiOTuWIFPVtVe07+V7ApDg1txggyTM7NK9DOHs9J83yARBOPIYhwUKpln/Y
         XPxA==
X-Forwarded-Encrypted: i=1; AJvYcCULRkcMAJXrcXa8l1Bp2dvmLyd7G17tK3LbwWL+hqcmHmtPW+BXVEAlQv/cWoY7MX2OP66AwnHlxTkSxLuilf2m@lists.infradead.org, AJvYcCVoBy2zOndKDgNlA08C+iMvNGhnThOJ5+bVeow5plCik29i12fG2KgMiQj0JdSB88hJFIk57eTJjffGwVo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWPh7ueIaL1TBZ7nO9zzW4AuCte9mwUAPQ9+LBbsyLZ6KWrv3s
	JpS6eN5+5rWjfH4yY+9thRZjthiG/4W+lYbAjWvdx2QBkaKvyVKuey/n
X-Gm-Gg: ASbGncugDEag0astWpf4NI9pEMKDp6bqQvA2MJGlZXO/rirRlb72KeKltpwYYCliE8S
	JX6rna05AEl0mQqVPGqWvIdJsOV5B2s+6YM2bi642Edm3l52Hwze5NYuQ58CzYu5/ou2p8+xY+n
	wKjODZG4q8W16fswVkqvpz0X3VAjA974YBDxmGUZuayZcHmBj6hWURz1QMQvILbZem8SKf8AZdr
	gQaCSjPRguh1OinpXglD1mvss9YAR8bm4XiI2YsBWC1PBFYaHnSsvBna3bPKcamt9pd2rzCl4qH
	vbhKNiGnnW1wn8T+vUDP1UlusAkAHjIRCu2Yohc9Dzxh6kEQgJct6UMcdC+g64Pcdy6qfKHGkZY
	x/vqzrjCPH9YUV1quwgtY6dkPas+1TyNKojvUflsQxLTaRI0=
X-Google-Smtp-Source: AGHT+IHzpXzU7IRYTRL9u8s1GDWZ3U5CYmUtBakw/pIBZX/rgdseIwaMMauanPlQhlJ9DDnzYy2q2w==
X-Received: by 2002:a05:6402:52c4:b0:607:28c9:c3c9 with SMTP id 4fb4d7f45d1cf-61c1b453182mr20154119a12.6.1756366676733;
        Thu, 28 Aug 2025 00:37:56 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cdb00baf9sm715248a12.33.2025.08.28.00.37.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Aug 2025 00:37:56 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:37:56 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
	io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
	kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 11/36] mm: limit folio/compound page sizes in
 problematic kernel configs
Message-ID: <20250828073755.gyq5cyafrxb7lnw2@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-12-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-12-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_003758_585533_C773A7A7 
X-CRM114-Status: GOOD (  12.88  )
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Aug 28, 2025 at 12:01:15AM +0200, David Hildenbrand wrote:
>Let's limit the maximum folio size in problematic kernel config where
>the memmap is allocated per memory section (SPARSEMEM without
>SPARSEMEM_VMEMMAP) to a single memory section.
>
>Currently, only a single architectures supports ARCH_HAS_GIGANTIC_PAGE
>but not SPARSEMEM_VMEMMAP: sh.
>
>Fortunately, the biggest hugetlb size sh supports is 64 MiB
>(HUGETLB_PAGE_SIZE_64MB) and the section size is at least 64 MiB
>(SECTION_SIZE_BITS == 26), so their use case is not degraded.
>
>As folios and memory sections are naturally aligned to their order-2 size
>in memory, consequently a single folio can no longer span multiple memory
>sections on these problematic kernel configs.
>
>nth_page() is no longer required when operating within a single compound
>page / folio.
>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me

