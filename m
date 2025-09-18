Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A820ACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 01:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGu6jUV2+RT3PgqHH5oCw8Nh03q6VX9mmcyZQjqvWaA=; b=GfzooelxHT6/RogBlEADHlHd63
	1GTCBl1ffOQI4M1MI5aDS144LmRYJKPrDlPtV4ZA9z2ra7qDqmZQg3UwDtlZmEBktkwjhcjesbEQg
	M5XrEZDubIb8EIUDf//OQ6HlgZEUx4MnlS5Yxkvb/vaoMRVe0sCY/npM9bWqhz3Ybp7ZEQq4F20+w
	TY50sreAs66u5N6SYkd6aQPKb5+7hShzK8UjVLjKdx0UDUho0nZTsMx947I2keyjzFlsZZmf7rUH9
	FGUf0qCYxcXHafFrPL3vfknYaOG9T2XCCwoJEblORq9lA66Ci1dLS9VnT7n7Wea4V5q+Ubfmi+bsb
	8rq85keQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz3Un-0000000FvrR-0pvL;
	Thu, 18 Sep 2025 01:31:37 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz3Uk-0000000Fvqz-1rp2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 01:31:35 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b54ff31192aso279478a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 18:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758159093; x=1758763893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGu6jUV2+RT3PgqHH5oCw8Nh03q6VX9mmcyZQjqvWaA=;
        b=meTiFbI5Gun+QfBVIxIptu7hzgj9zrnqsH5tKgFpqcepyGRgFMjXgNG5XOiFEVb51q
         3x4nIaMcqe5ORmGxzdXoyOuylZA3eg3MLnM9CzOiRSESF5pjH5Mbpq8rVLsqEk1K/bMD
         kK1zd4nX4rCXaxRjIquIuI32jYVsgH4fU2NZ3IZF/whwL9p6HgN+Homj0lRNS1Y8eG/R
         WcUc6oYHIUMGxYRaSNwFETT5MY5FbCgcUXlAC0GprY6GwgzT3Pou/qLQsI2RlI1eeB0A
         IXZMuobeiguqH5EwAsqxXwIqHfiVtEMvbx7XjrXDUxk8C9LZ3XJ5Toc2E2co/0uwfjBe
         3shw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758159093; x=1758763893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGu6jUV2+RT3PgqHH5oCw8Nh03q6VX9mmcyZQjqvWaA=;
        b=BTiBvlhzBpAuIwQ0YvBcS/7JMKJBnjfSGLy2dIeMxYg5UGz/9LP6Xf+wNDl+T1XEB4
         ednxhvURSMAQyTUwvP0ZB313C/qAWoxJDus1dFfxIQV/XJf3u54+3Nk1bzaINalsZUqO
         o6fO/qQLhHFSYuR62j0uUjS0EB6EMeskBoFti88IWpa6C8uE9CqxumfCuLFJdvOZ90ak
         9rxkaUEMfhr/qCSDHXm4sroat82J9M1puFXF127C2l9uT5FSTFH9j6OWeDCo0d8o/7w1
         ZFs75ZlpuYlk5Be2ijnshabIIeaoeFet4+sCdmP14UOIbA1Pi7wRDN16lGDc3wXt1ZyD
         OhDw==
X-Forwarded-Encrypted: i=1; AJvYcCXPv8gukNmZEv8CwnQ4tIdF0SpC759IVNS58cElvseqBRt4a4XW0I203mZ9zkzF+rLuo9gmGUWa2kmW2KJYzGz7@lists.infradead.org
X-Gm-Message-State: AOJu0YyscowFZgNq4YbLYGGKh0ZYtpxpN1jeRKU/EbLXXRPZtwetsfi/
	bUx7vYWBMUmMXCHMi/pXBvEpvurjgegkwTXWzXfMWNsVllNWudgIlf4t
X-Gm-Gg: ASbGncua7oFWt+ZaXSTHRBZFefS+I3CC6JsQIL+pXcQB4w8c6T1nRQZcx2ZeWHgzRum
	7UI6J3sbXbRZbA7aDwXwp9IIo9rjqfYtZmy+gdZlXJHB/qhmI91vAXSZCEXvtEV+fMCG5qMC4f3
	BIJnRcPBjx8MV/HNWZD2W9U4i0rwQJ8amKYKIrJt9OsmNvkg0cTdLqdJTt1FQFSQGDV3BpJmDOF
	ti3xFP0fgjX5cJv+IzPmiQR0twRBUuXeTIK+AIj1e5lM/QK55aUhv9qQNhkmo/Rbl8C/R7teOAs
	SD9CfV3jPoQ8kQWa2BuK2yBcNHKaDn0fleIYCIwu2ILeblKg8PL8sU8dt0E4TJHR8EhufO8VvUE
	IMW1AVW7jhNXSUxpR7Wt55cM7/af/LaOrrx/oDftv6LXib87DmSwGIAU4L0Y7V2w=
X-Google-Smtp-Source: AGHT+IGyol2ICo5LkwOJQM5YrI/z89CMfK7noN15fH9mKTb1oN4Xwj7kuK4ucc0oFR/zcNay6QAzWQ==
X-Received: by 2002:a17:903:2307:b0:248:7018:c739 with SMTP id d9443c01a7336-268139031a0mr60323995ad.28.1758159093380;
        Wed, 17 Sep 2025 18:31:33 -0700 (PDT)
Received: from VM-16-24-fedora.. ([43.153.32.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269803184d3sm7860915ad.116.2025.09.17.18.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 18:31:32 -0700 (PDT)
From: Jinliang Zheng <alexjlzheng@gmail.com>
X-Google-Original-From: Jinliang Zheng <alexjlzheng@tencent.com>
To: harry.yoo@oracle.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	alexjlzheng@gmail.com,
	alexjlzheng@tencent.com,
	arnd@arndb.de,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	david@redhat.com,
	geert@linux-m68k.org,
	hpa@zytor.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kas@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux@armlinux.org.uk,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	mingo@redhat.com,
	rppt@kernel.org,
	surenb@google.com,
	tglx@linutronix.de,
	thuth@redhat.com,
	urezki@gmail.com,
	vbabka@suse.cz,
	vincenzo.frascino@arm.com,
	x86@kernel.org
Subject: Re: [PATCH] mm: introduce ARCH_PAGE_TABLE_SYNC_MASK_VMALLOC to sync kernel mapping conditionally
Date: Thu, 18 Sep 2025 09:31:30 +0800
Message-ID: <20250918013130.2425537-1-alexjlzheng@tencent.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <aMrkoBhIcP37YgyS@hyeyoo>
References: <aMrkoBhIcP37YgyS@hyeyoo>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_183134_495241_4F302B2F 
X-CRM114-Status: GOOD (  26.01  )
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

On Thu, 18 Sep 2025 01:41:04 +0900, harry.yoo@oracle.com wrote:
> On Wed, Sep 17, 2025 at 11:48:29PM +0800, alexjlzheng@gmail.com wrote:
> > From: Jinliang Zheng <alexjlzheng@tencent.com>
> > 
> > After commit 6eb82f994026 ("x86/mm: Pre-allocate P4D/PUD pages for
> > vmalloc area"), we don't need to synchronize kernel mappings in the
> > vmalloc area on x86_64.
> 
> Right.
> 
> > And commit 58a18fe95e83 ("x86/mm/64: Do not sync vmalloc/ioremap
> > mappings") actually does this.
> 
> Right.
> 
> > But commit 6659d0279980 ("x86/mm/64: define ARCH_PAGE_TABLE_SYNC_MASK
> > and arch_sync_kernel_mappings()") breaks this.
> 
> Good point.
> 
> > This patch introduces ARCH_PAGE_TABLE_SYNC_MASK_VMALLOC to avoid
> > unnecessary kernel mappings synchronization of the vmalloc area.
> > 
> > Fixes: 6659d0279980 ("x86/mm/64: define ARCH_PAGE_TABLE_SYNC_MASK and arch_sync_kernel_mappings()")
> 
> The commit is getting backported to -stable kernels.
> 
> Do you think this can cause a visible performance regression from
> user point of view, or it's just a nice optimization to have?
> (and any data to support?)

Haha, when I woke up in bed this morning, I suddenly realized that I
might have pushed a worthless patch and wasted everyone's precious time.

Sorry for that. :-(

After commit 6eb82f994026 ("x86/mm: Pre-allocate P4D/PUD pages for vmalloc area"),
pgd_alloc_track()/p4d_alloc_track() in vmalloc() and apply_to_range() may should
always return a mask that does not contain PGTBL_PGD_MODIFIED (5 level pgtable)
or PGTBL_P4D_MODIFIED (4 level pgtable), thereby bypassing the call to
arch_sync_kernel_mappings(). Right?

thanks,
Jinliang Zheng. :)

> 
> > Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
> > ---
> >  arch/arm/include/asm/page.h                 | 3 ++-
> >  arch/x86/include/asm/pgtable-2level_types.h | 3 ++-
> >  arch/x86/include/asm/pgtable-3level_types.h | 3 ++-
> >  include/linux/pgtable.h                     | 4 ++++
> >  mm/memory.c                                 | 2 +-
> >  mm/vmalloc.c                                | 6 +++---
> >  6 files changed, 14 insertions(+), 7 deletions(-)
> > 
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 0ba4f6b71847..cd2488043f8f 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -3170,7 +3170,7 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
> >  			break;
> >  	} while (pgd++, addr = next, addr != end);
> >  
> > -	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> > +	if (mask & ARCH_PAGE_TABLE_SYNC_MASK_VMALLOC)
> >  		arch_sync_kernel_mappings(start, start + size);
> 
> But vmalloc is not the only user of apply_to_page_range()?
> 
> -- 
> Cheers,
> Harry / Hyeonggon

