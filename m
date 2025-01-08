Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7A9E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 06:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LNvrIzo+npvfznW/iXVwt2s9BNL0jx/BmS8TasxDnA=; b=MJhuhAHkqSqakumxFUojS2EU47
	d6AaMJue1uXV4l89a4jj0nEqfHJXiZmzzWMCdCfqAVoFroF3iA0Jt66o2PBRacuWrZtfmX81iQxbK
	EFUt9yc4aDV/xV2pDY2B/xmiY1JDdyntXTnGauoPKb3zVlvD6p2pRfB98o0lzXDZbFbrtlYgWRkq8
	8YCkShnFv8/HwFIxoaB5lLwGGobkLHTZiJNgDVBueRJw7tYUCCjrUxtKq6fG3NMvoKTLIGa3OByJ8
	QWNbAF47M7nBtFypNFGJKHwtkBQDvPTkKw4hJVL2cTcF8gaL6Kaiqm/8npyufsCbcUA7qUPeqhKIF
	DH8oKRgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVPXv-00000007H4J-0ZzI;
	Wed, 08 Jan 2025 06:28:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVPWh-00000007Gqi-0LOE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 06:26:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 405F4A40443;
	Wed,  8 Jan 2025 06:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75956C4CED0;
	Wed,  8 Jan 2025 06:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1736317605;
	bh=ictVswVJ4mGv9GZMqt9hcwWRjSa3QIhF5THgyv+dfIc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=yV3mq70NowsKzsNN4Ez+jnFDFJRIlhbNscdaUiVTLxZRecRmCbvgybiz9uRsrgg0n
	 PjP3lsjSFoN3ZHe8QI2pdayWSJuwfonJJuwBr3DLAHViSi3MWsPfptWuWaWljJtEVC
	 tmLb8vkj5Dj4ezW3MMOW7Coe5YQtHTHUai0uWSDo=
Date: Tue, 7 Jan 2025 22:26:43 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Alistair Popple <apopple@nvidia.com>
Cc: dan.j.williams@intel.com, linux-mm@kvack.org, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com,
 peterx@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com
Subject: Re: [PATCH v5 00/25] fs/dax: Fix ZONE_DEVICE page reference counts
Message-Id: <20250107222643.80d5509219d6b66c15b1b8af@linux-foundation.org>
In-Reply-To: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_222647_184437_955D5412 
X-CRM114-Status: GOOD (  16.93  )
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

On Tue,  7 Jan 2025 14:42:16 +1100 Alistair Popple <apopple@nvidia.com> wrote:

> Device and FS DAX pages have always maintained their own page
> reference counts without following the normal rules for page reference
> counting. In particular pages are considered free when the refcount
> hits one rather than zero and refcounts are not added when mapping the
> page.
> 
> Tracking this requires special PTE bits (PTE_DEVMAP) and a secondary
> mechanism for allowing GUP to hold references on the page (see
> get_dev_pagemap). However there doesn't seem to be any reason why FS
> DAX pages need their own reference counting scheme.
> 
> By treating the refcounts on these pages the same way as normal pages
> we can remove a lot of special checks. In particular pXd_trans_huge()
> becomes the same as pXd_leaf(), although I haven't made that change
> here. It also frees up a valuable SW define PTE bit on architectures
> that have devmap PTE bits defined.
> 
> It also almost certainly allows further clean-up of the devmap managed
> functions, but I have left that as a future improvment. It also
> enables support for compound ZONE_DEVICE pages which is one of my
> primary motivators for doing this work.
> 

https://lkml.kernel.org/r/wysuus23bqmjtwkfu3zutqtmkse3ki3erf45x32yezlrl24qto@xlqt7qducyld
made me expect merge/build/runtime issues, however this series merges
and builds OK on mm-unstable.  Did something change?  What's the story
here?

Oh well, it built so I'll ship it!

