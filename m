Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE4BC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 04:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yy8IISh+FV9cpGipg7vORYQVek5AJgkZkfEGn4HmLng=; b=DooziswS+S29p8V7dADkrvcGFV
	Iwc8WFjG56GxigUPPpHUiQn2Ey/1qC7jbytlZK3yF3D+alk1/CzAHbbuYEh29/DHTPBf4NgdutA9t
	8elt9yUscyBNiUvsu135Eexhvu6c9kr3v84i/f1I9+OhWHUNh3GtgfM6qnMT7rxkrx5n8bw4rR59F
	LYSa/6fwziCqZMZ87XC/zUSrOz08bYOVaLTG/b0pjTeqvBcYx2ZDmecmTfw3opWvJi6cwwgLB+6rl
	BJi/xEgZ1QDNwBb4oh8d+0T43QbOaD0fq0UvezcIxCSBM0A79CTqgOwnOl36T7Wx92dad6mpPIaFN
	I+9tLZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCsu-00000001vQS-0McP;
	Mon, 27 Jul 2026 04:24:12 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCsr-00000001vPg-2U4O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 04:24:10 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1861022a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 21:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785126249; x=1785731049; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yy8IISh+FV9cpGipg7vORYQVek5AJgkZkfEGn4HmLng=;
        b=PvzS7BqK3KJQSAdHYwRUiviAUnWqtphSpWevUbXt4ApY8w5pOxduWUTYwyA+4j/DRl
         ycLa1duKUhxWdRoyRcrcqGhhax+SqkQamrzJ1eti1GQtgESp9+tpPVNDUcEzGGctT2q6
         075OdD2hlwVSX8F2jbP+3QmA8/kKlOZZ38ixNPXrYi5rc3NMzfT9GzCJhuYMeutF5g/A
         iXfsnMQw8FVPi8DK1VbQmlOpLe6aaTmfgYB8RD5vQA9KAUASIdnajh3df0Cp+/CY2DBV
         38yGu/btJbyPHy3TQyuvrnUTUhlThqySg1lInrNhv6v6Dz4o9GhhlxCBg6WvSXUjbXgY
         kHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785126249; x=1785731049;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yy8IISh+FV9cpGipg7vORYQVek5AJgkZkfEGn4HmLng=;
        b=DYjMIMrKAyifDM/0lpP0BvWMyP7IkXRIGq1Fq/9Uu9csjmZGGBJ5PK2XwMbXLUiyAC
         aUXCFaSVahLm63EKI4jHGyUB8X5MFuJgGvOaoVPomdeAQHg6HceN0ymtpq0/nJSOF8l7
         SiThwMro/d8H3iaiwdiUNDgUSTeLvIsGrfOJd/Xu/Fu2jueCZ7F5uvoJnzpq7ZL1PX+H
         I0ruSj70RWCNgEuh4U8bIsJsWIiwx7Oz0fAwPwrkDWTQpkIRvQjiwmKn2O6xYIrMXAye
         7OY0UX4WEa/FIzQ8cvpxDPVsw8SWfH4tHF8d1BvsbJ0v2Yt/EpkYPc8I8fmzYbA9Uvsn
         z4WA==
X-Forwarded-Encrypted: i=1; AHgh+RogEHVK/UufNyj9ySLhrZZBRagZTqQ9DppK3mQcZImcCQnu6US7uI0kOZDbjSScAgkjpOoyXejH90Uu1s/3+wIM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj7fGXewBnaLftmr6Fs0xZLpiNDfCVx5QDKhoNAvBMXMQsPNid
	Xs/vM3v1UiePRIW2q5BEF++dzyMzyehGTcqTJKw7dCWctRgD3C0fiz8jJwFeDXo6fOA=
X-Gm-Gg: AR+sD10weru/6kThArZ6tX/yoK9ksT4ZUdNkiWL1TgOgj2oJS0fTp/bqqhX1nYzN7ZS
	woA/FXK6YeILduAmRdqGxl8QgR1t6O8VMod0YVyAxS6z0CJCWqIYev+T6UdlG5M2TZTrOcYQokp
	t/2294x1+YLyRvrJkW3kf0QLBe/qJJw5c6rNrkcagfp+GVt1MGNY2UHtR/d3IIDMbSF+6rJngQB
	yJb1EfsuNPVntsEZ6T4SLzS3akkWBJSsWXKUMo1Hn2TWmRU5Dr9r64Yj6EugX+IlH61vJafzoxo
	+6PZF/k4wiUHO3wiDQdUfIIZ24i0uaqFhtrFBknmpkElUNPh/gBLr5I2XuxuI5sCGjY+V12Gxlx
	9BXIEFMk5ap0Uwnr8Kyn6Vlbya9BDL1MtXArNRkK4jtII/TDREAJZXHWGzxlDlw==
X-Received: by 2002:a17:90b:5350:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-38f29399845mr6819950a91.2.1785126248497;
        Sun, 26 Jul 2026 21:24:08 -0700 (PDT)
Received: from ziepe.ca ([64.114.68.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041b8be9sm4471929a91.14.2026.07.26.21.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 21:24:08 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1woCsf-0002Mt-Ls;
	Mon, 27 Jul 2026 01:23:57 -0300
Date: Mon, 27 Jul 2026 01:23:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	stable@vger.kernel.org, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 01/23] dma-direct: return struct page from
 dma_direct_alloc_from_pool()
Message-ID: <ambdXXcfgK+cxqxa@ziepe.ca>
References: <20260717180442.110954-2-aneesh.kumar@kernel.org>
 <20260721115456.GI110966@unreal>
 <yq5atsps77c5.fsf@kernel.org>
 <20260721142921.GN110966@unreal>
 <yq5ao6g0750v.fsf@kernel.org>
 <20260721153321.GO110966@unreal>
 <amEhEKQW0_HJ9cLN@ziepe.ca>
 <20260723075704.GC110966@unreal>
 <amTJY_CdE-uDgoGG@ziepe.ca>
 <20260726081753.GD12003@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726081753.GD12003@unreal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_212409_724875_F12085D9 
X-CRM114-Status: GOOD (  13.65  )
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

On Sun, Jul 26, 2026 at 11:17:53AM +0300, Leon Romanovsky wrote:

> Currently, the phys type universally describes memory and can be
> reliably translated into any required representation. It is the most
> fundamental type we have.

You cannot go from phys to page reliably unless you make assumptions
about the phys, that's the whole issue here. If the callchain expects
and intends to use a page it should really stay in a page and not take
a side trip to phys.

I agree it would help to have some helpers that were more phys based
for the callchains that want that since we are mixing two fairly
different activities in these functions..

But making phys the only output out of the pool isn't going to be an
improvement.

BTW how does a struct page even work for decrypted memory? You can't
actually use it that way right? If you try to access it then you'll
get the wrong IPA and it should explode?

Maybe we should be blocking the struct page path entirely for CC
shared?

Jason

