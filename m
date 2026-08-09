Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438D1C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 05:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3FGOkCsyAkRq/PlWdyqKgGv29697plosgcUL2pIKfU=; b=rfm5uaHG2Tdd2r87FyvZ+0/IYL
	fxf2SSv8mJ7GUvttQTFcpAbu5Cjkj5UYv5qSZ51Lih7DddA2NMdda5ERp7rJ8L7j6LeUqxrBtb5ij
	SDGa3c/S5FLMo5O37bUwrUJtpoPiE52fLqRM7hIkQwYWB9gGonsVrdRSGrasZ+qb9M0De5MXMhA76
	YeL556S7GtgBXFQSEfW7BpDA3M8VK9v8XydlZFR781OAC3UH+HJZRsy4dZTw8WaxBoMEcgWk3DDZX
	5WPl2GHnw1dFHSAM6A4Xee/UjJqkALJIv76dIWKQatXtUccKn7Cj0NIiojeW8Osl2UjmVFN8yVz1+
	mzRdCmIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wswRi-0000000A1TW-29xB;
	Sun, 09 Aug 2026 05:51:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wswRh-0000000A1TF-1DuE;
	Sun, 09 Aug 2026 05:51:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38A4E42A4C;
	Sun,  9 Aug 2026 05:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD7B1F000E9;
	Sun,  9 Aug 2026 05:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786254698;
	bh=T3FGOkCsyAkRq/PlWdyqKgGv29697plosgcUL2pIKfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ixEmCWHm7ue2f00kzDVoGx2sOV1FXDu+EXAaI2iOwLz+GBiH4XdAsliF60VuH08RA
	 jkOi0P473ENk5+CmpbrxxClJp4qkn2H4Nyb2FfdYB8v5l8CkaCzShWTOZSPZSQRzoV
	 QOjH/ievlWfMSifDniCKcMkYCY0sLwmwzFxfd5LmZ13luZgo46vjrYdrXDIOmD3nWC
	 83ntAy9WSZ2tld1oz2tTUcvfRBnAuIt1DaUTfisZTNnClBNMtKESdsqoBYifeflv8p
	 MP4u3PP5BkcolJtsL9gGsB4bkhZ+7fCEPtMOxmXLP9AMMdrkxNsL6NRMWevPj3Q6Q1
	 PAmFJQztTL81g==
Date: Sun, 9 Aug 2026 08:51:29 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	driver-core@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] drivers/base, mm: move arch_numa.c to mm/
Message-ID: <angVYX5owaXkZ3sG@kernel.org>
References: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
 <20260806154842.9faab19cdfb7cf09799d8f79@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806154842.9faab19cdfb7cf09799d8f79@linux-foundation.org>
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

On Thu, Aug 06, 2026 at 03:48:42PM -0700, Andrew Morton wrote:
> On Thu, 06 Aug 2026 09:58:38 +0300 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:
> 
> > arch_numa.c implements boot time discovery and initialization of NUMA
> > topology on architectures that select GENERIC_ARCH_NUMA (currently arm64
> > and riscv).
> > 
> > Since this is step in the initialization of the memory management
> > subsystem, it's logical to have arch_numa.c in mm/ alongside numa.c,
> > numa_memblks.c and numa_emulation.c.
> > 
> > Move arch_numa.c to mm/ and add its F: entry to "MEMBLOCK AND MEMORY
> > MANAGEMENT INITIALIZATION" in MAINTAINERS.
> 
> Unclear what tree this is targeted at.  I grabbed it.
 
Heh, it's muscle memory to send such patches to you :)
Let's keep this in your tree, thanks!
 
> mm-stable does have this change:
> 
> --- linux-7.2-rc5/drivers/base/arch_numa.c	2026-07-27 04:44:55.000000000 -0700
> +++ 25/drivers/base/arch_numa.c	2026-08-06 15:47:59.019918702 -0700
> @@ -231,10 +231,6 @@ static int __init numa_init(int (*init_f
>  {
>  	int ret;
>  
> -	nodes_clear(numa_nodes_parsed);
> -	nodes_clear(node_possible_map);
> -	nodes_clear(node_online_map);
> -
>  	ret = numa_memblks_init(init_func, /* memblock_force_top_down */ false);
>  	if (ret < 0)
>  		goto out_free_distance;
> 
> 
> which is easily handled either way.

-- 
Sincerely yours,
Mike.

