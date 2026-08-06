Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B6FC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 07:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bun4OEi9tagpmxGrHS1oR5rbRsR6OkYKZiGDfVwiPHU=; b=jSabKqlLjtxaJ5bQRtyOpf6kJY
	j7Ht+Gf+cw8jX4CXZpyzwvPPa9AlUxnWA+K1nHyJqCOZAxDnLxV9SMn/eJQTlDs9qngVq0OcBJJdI
	pj8Ualn/lAHagPcMDu9ebzVVF3uBLRrWKf2D5uzSUAE2R9DMhVuaEIW6RLXaCf91u25IHIxDIoZgd
	PI/YBJKD0ofGUNDAOEFwtyjpAsTT5aAphARUyHJK6ocB9GdBRhIV91hqGcT7Y/2vDZldDbo0uGX85
	TEqj0rLmooVblpUolXqgmiG3NEfDHJz0wUsD4oGYd6WT6IA71VOQMyy7tpqJ5NC/IpL3d4fT1XpeZ
	YwPkqQLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrs8w-000000056Yq-0MHL;
	Thu, 06 Aug 2026 07:03:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrs8v-000000056Yh-1Fcl;
	Thu, 06 Aug 2026 07:03:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D081141759;
	Thu,  6 Aug 2026 07:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1451F1F000E9;
	Thu,  6 Aug 2026 07:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785999832;
	bh=Bun4OEi9tagpmxGrHS1oR5rbRsR6OkYKZiGDfVwiPHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ez9zk1ejWKwB/nVl9E5bwSkKVYHKWD7WyLDWZ/XomFpQXqO7AA90E93iVx90FYzDM
	 DTeWgJxI8laH3LS3IEmL+5Yf/ydNxGhh293ZbmC5pAM4gOvG+ib+d51QchlnU/Ygex
	 csgnmEba6bBK2IruUkpKnPpOZsQy10kEU1KsgOyA=
Date: Thu, 6 Aug 2026 09:03:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@kernel.org>,
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
Message-ID: <2026080623-showgirl-washout-3ef4@gregkh>
References: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
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

On Thu, Aug 06, 2026 at 09:58:38AM +0300, Mike Rapoport (Microsoft) wrote:
> arch_numa.c implements boot time discovery and initialization of NUMA
> topology on architectures that select GENERIC_ARCH_NUMA (currently arm64
> and riscv).
> 
> Since this is step in the initialization of the memory management
> subsystem, it's logical to have arch_numa.c in mm/ alongside numa.c,
> numa_memblks.c and numa_emulation.c.
> 
> Move arch_numa.c to mm/ and add its F: entry to "MEMBLOCK AND MEMORY
> MANAGEMENT INITIALIZATION" in MAINTAINERS.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

No objection from me!

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

