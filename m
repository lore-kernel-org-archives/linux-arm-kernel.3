Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2751606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 17:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vrlHWOVH;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BZ6enJrj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vktowsTsOQhJmqiWYNIb0aPqBLNSbNahOroQ81vALNQ=; b=vrlHWOVHioN0H9vLANk43RJI0N
	DxBD/2882cQ3L1NA0Du+V0Td5WJKIwjA+dZYnsBcTuWdiHRJAy1iryNE1IEn7ayIllZJ6CXT1mwYT
	2q6BR0Ic2qNC8o7W/aMOvB/q/oRX5NDLZrSwiJS6wHPZoGoYxTtGMqONmBWwVaLqty1vERzssDpGG
	5FTZw0D3nfXwJBmI89H8lvbvD20W17C8zZManGaqlcIzf0E0JRxuD4ak51kgHaYMUlgvIruVO5eDS
	h+0FKUZTpgUqSaOwVg4eNBdaDwfHfFiin5BFUCTWZoYLA9JZMnjJG7O1U3zyUHM+tynZvnXEK7GLD
	QyPKJU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7DI-00000007e0G-2dpC;
	Wed, 28 Oct 2026 17:13:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7DH-00000007dzq-2kk8;
	Wed, 28 Oct 2026 17:13:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A6F242CBD;
	Wed, 28 Oct 2026 17:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E631F031E0;
	Wed, 28 Oct 2026 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793207602;
	bh=vktowsTsOQhJmqiWYNIb0aPqBLNSbNahOroQ81vALNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BZ6enJrj2fR+WiaobREMK06Ol4IBWooQRDlbbDCkO1gNP7+G2R9/lsOOs2AhduaH8
	 IcGiH6/qAIxcfuSrwBdneQYRZt+W8ihxfi/bu8MIRkDPSGPjLv1CElqLHZjheiMzWZ
	 DH0T5HoxcIR4+yigsaET5t4ctAredW023hZHdikTpcSGKdBksnJ3GuslAURAOE73r0
	 OFDzAYx+euSlpwhkJz6vzjSi4qGr9oAaq/5t/Y26Gl7SwP46yh6RZXFHOGQCNEJN9I
	 lo7RodJkVz/gLSXqyhniNMQsfTsQPbnnv/5roVKerewBTdFEwzrN4Aepm6Xp3XPTM4
	 cnbju0zmHk6eA==
Date: Wed, 28 Oct 2026 19:13:06 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	kas@kernel.org, kexec@lists.infradead.org,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	shakeel.butt@linux.dev, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-cxl@vger.kernel.org, driver-core@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, rmikey@meta.com,
	riel@surriel.com, harry@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v6 4/7] mm/memblock: add a reserved-region flag for
 poisoned frames
Message-ID: <auItIsZRsh_Pwrti@kernel.org>
References: <20261016-hwpoison-kho-v6-0-f304255147da@debian.org>
 <20261016-hwpoison-kho-v6-4-f304255147da@debian.org>
 <ato62palTbNjLwN7@kernel.org>
 <524ee7d9-790d-48b6-8613-841da042c32a@kernel.org>
 <auH6WT5zR1RM1lpA@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auH6WT5zR1RM1lpA@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 06:49:18AM -0700, Breno Leitao wrote:
> On Wed, Oct 28, 2026 at 09:39:42AM +0100, David Hildenbrand (Arm) wrote:
> > On 10/22/26 18:33, Mike Rapoport wrote:
> > > Hi Breno,
> > > 
> > > On Fri, Oct 16, 2026 at 05:15:44AM -0700, Breno Leitao wrote:
> > >> memblock allocates from and frees to buddy whatever is not reserved, and
> > >> knows nothing about frames an earlier kernel found hardware-poisoned.
> > >> Such a frame can back the memmap, a page table or a percpu area before
> > >> any hwpoison code runs, and otherwise reaches the buddy allocator like
> > >> any other free frame.
> > >>
> > >> Add MEMBLOCK_RSRV_HWPOISON for a reserved range holding those frames.
> > > 
> > > How much this would fragment memblock.reserved?
> > > 
> > > memblock is not very scalable, to say the least, and each new flag
> > > increases the size of memblock arrays which obviously hurts performance.
> > 
> > I assume that if you have too many regions there, you have different problems
> > than scalability problems.

Not different, the problems are additive :)

> > We should cut out larger chunks, and if they are all over your address space you
> > should scrap that machine.
> 
> Ack, that is what the 2M unit does. A DRAM row fault shows up as many 4K
> pages but lands in one or two units, and adjacent units share one
> memblock.reserved region.
> 
> Mike, on the statistics you asked for: across the Meta hosts that logged
> a hard memory failure in the last 28 days, these are the
> memblock.reserved regions each host would need:
> 
>              p50   p90   p99
>      x86      1     4    41
>      arm64    1     5    27

Thanks!
A new flag is fine by me.

I'm still trying to parse what your LLM wrote in the commit messages before
sending the tags ;-)
 
> Thanks,
> --breno

-- 
Sincerely yours,
Mike.

