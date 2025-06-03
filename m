Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B880C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpF3njOJtHrMyikmrAfZ4zzOg2YUvEVFUbKoE3kb2rM=; b=41Lumnh3OpPyWHnA2JfFFPnghX
	OTFsL6gHaVwkbXI1/gngQxToObf/3ZGtROi1HiSyKG0XDsUuQeNWRfXXYiH6/On4thkXtcOooYkoQ
	eJuJDb08q+mTbNk6YkH7x5RZdQd2ep0eX89BGvW1T9RbUImrtyGxox9HOMn8NXL9rqIEZlFv5V2g9
	p1Qpf+GkM//I6GlKJMVCX5rZWzAb2+t1DfH9AonW6wPXueKD4i0e82IllpNKw64slqx99PZaeoNIa
	+QymteoEr27fEOuIigIdT0Kdz71u48vl3MQGvrbxcvgxBjcH/ld8riT6YKu9eChaI86aPaXAF5UYw
	eP0Tu8VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSAa-0000000B768-43nJ;
	Tue, 03 Jun 2025 13:59:12 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRzb-0000000B4w7-22ki
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:47:52 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4079f80ff0fso1948919b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 06:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958470; x=1749563270; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UpF3njOJtHrMyikmrAfZ4zzOg2YUvEVFUbKoE3kb2rM=;
        b=fUYi6+wS56EqvFUFpOHZDHLW+Cz0qkEMP6rdz3sBN2eY0DYd4iPQ0RfRZpS/R1jBGj
         v5JqbWXQSLlWuVA3YIg3P3QDbLmMtUCcsW0xV9a5eESucli2gWXN3Y4J3d9qjQxEigmL
         XprGqRTLKQ2OFOwyZIiCU0alxDOj3dXMkeVz9u3mSPmYU2Wpfrl3fg/FEk12ye5UNctj
         /3QX+VTQGZOOo+Ac960gnp/hbY+O3oSZrxRcUohdDLtW3vtJAWmnfjOl8bvhE/GZV2fM
         nkgTbN22R1RdBG80XO103M2/FSpJRcpzN4frNLWb2LivTxpWnkcaBuxwP7U1mqfA8z5s
         X5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958470; x=1749563270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpF3njOJtHrMyikmrAfZ4zzOg2YUvEVFUbKoE3kb2rM=;
        b=CDe2fGob9rUPPRBnt0+CvWhxqnDp13gCs6g0SoFJu2qULDUrpP78zWqn+hjktGiIIg
         HEgajV6tDCHALjcL7WAFwvWphBMb9ngz7JauGfJMOjUb/al88tlH1BMU10LjGhUlF9oW
         YqrB7hIOne42DfJOsYes4csacwBv4LGwrSKDsCQAfhDeI7r+oYy3VU9uSJ+30rqaVYRQ
         3WcPR2lRM5tLQsu2RYkOrxMjqRP6OB9lyXdhr/XjEJ2CDT0x+KN+xAUpWaL2u/5VjmXP
         BjPsvIROeOb6LsXYZgjY22gWWSR2XskBkJcIWpCxsH+dqjpChHR3UnHIp5cRJ8OsLFMG
         kCCw==
X-Forwarded-Encrypted: i=1; AJvYcCXyp6/vXKFHFuC5+Qsm5aZRXQSJtGtr5Zot6Oy0zto9pSfin9zMD/IEK8m2Yd23G+i7g69swOoK5TM/Yc9iQeIh@lists.infradead.org
X-Gm-Message-State: AOJu0YyGRGo1TtnDI7lXRLI/XgGx4c2DCIV06VLsyV35vvnPhOuXm0Yn
	3AC8YbDxThPTWvyoD7t58lWMxJSlHVu7UU0LTFb0nIz+B4O4jbcRyR55nj5dstRsPt0tRAnCBiZ
	Ww98D
X-Gm-Gg: ASbGncul7H0FqGvGSSD3aoKd7Cx2ZY8h1s97RQgXKL/f2KGrBLP1b3jGLABgTu0vm2C
	sZxyjVSkJx637b0aEeov0dvFStfIu6CURQec1aAK8lRbZCq6zxpgTpCtlKYGAzR+m1zpJKg7yth
	bnzgpmqohJjb9eX7FwcyFYp2BkFtUrIxtYFYLW/2lli+5lzDjHJS935RJZ7MAcU17UnAIRPeDwP
	J/S9iWfYXs95/1RoJec9ATK3MBDuw4/GEuZKY30ZL6mT++cfE8pGGVxnH70P2Ab3qFpIb1Ci9jK
	0g5B+jf7tNUjot9DMg5Y/1+JCFcFvHLaBVjjVfX+VKaTn0wctNeFHL/Ccmi52aA2fiOV57OEP7Z
	BShOiRQ+1+tBndSvHGPWIbo9EL7DqH/WOhB7jig==
X-Google-Smtp-Source: AGHT+IEn/uCXnqGk9mGrQEIlQbsguMg4s70jmRhOs28+dV79kPuZtTFgI19mnXFgGkPMbOXTAF/Qjg==
X-Received: by 2002:a05:620a:278d:b0:7c5:d71c:6a47 with SMTP id af79cd13be357-7d211676724mr394455585a.8.1748958459265;
        Tue, 03 Jun 2025 06:47:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a195d7dsm840098585a.78.2025.06.03.06.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:47:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRzO-00000001hB3-1CmA;
	Tue, 03 Jun 2025 10:47:38 -0300
Date: Tue, 3 Jun 2025 10:47:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 06/12] mm/gup: Remove pXX_devmap usage from
 get_user_pages()
Message-ID: <20250603134738.GG386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <c4d81161c6d04a7ae3f63cc087bdc87fb25fd8ea.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4d81161c6d04a7ae3f63cc087bdc87fb25fd8ea.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_064751_522364_BB778D96 
X-CRM114-Status: GOOD (  16.36  )
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

On Thu, May 29, 2025 at 04:32:07PM +1000, Alistair Popple wrote:
> GUP uses pXX_devmap() calls to see if it needs to a get a reference on
> the associated pgmap data structure to ensure the pages won't go
> away. However it's a driver responsibility to ensure that if pages are
> mapped (ie. discoverable by GUP) that they are not offlined or removed
> from the memmap so there is no need to hold a reference on the pgmap
> data structure to ensure this.

Yes, the pgmap refcounting never made any sense here.

But I'm not sure this ever got fully fixed up?

To solve races with GUP fast we need a IPI/synchronize_rcu after all
VMAs are zapped and before the pgmap gets destroyed. Granted it is a
very small race in gup fast, it still should have this locking.

> Furthermore mappings with PFN_DEV are no longer created, hence this
> effectively dead code anyway so can be removed.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/huge_mm.h |   3 +-
>  mm/gup.c                | 162 +----------------------------------------
>  mm/huge_memory.c        |  40 +----------
>  3 files changed, 5 insertions(+), 200 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

