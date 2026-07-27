Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B1BC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPvuz+aL88c21S8YC4GLGVYZg37SgTBgz+cPgSwl5YY=; b=XOIsaJ5vLW9QKOBgVMhKsWB2cz
	39wqXxh6Nvah7oTsVrsNqHY3Oz4tskZUWFnnKZFlFCZfjeSAQS324agmJXjUNhV0HoIV1utCx8GDa
	Ll0gyUX4BwejpaSzJQK4NHCTvHIelkweUK06qurSs/QRTbOjcx+ZVbKleuc4uS4FEzqFsIArmnNJR
	Y3lNgJzP6q37TEBU/1CYQy6K2zhhpHX00mPEP7QoR+poWWxbgw80mssB75jF5g99UUFlRkF+izSsq
	xXZFAA2qmOcx6SGFospepKZWi8xrSmn7653/BNVyhWXIUUeeJmyzX6b7UAjGYKv0mg7I5RjtDzyMs
	EWfpD51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woINd-00000002SRS-1T3s;
	Mon, 27 Jul 2026 10:16:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woINc-00000002SRE-3eY1;
	Mon, 27 Jul 2026 10:16:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2746F601ED;
	Mon, 27 Jul 2026 10:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0021F000E9;
	Mon, 27 Jul 2026 10:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147375;
	bh=aPvuz+aL88c21S8YC4GLGVYZg37SgTBgz+cPgSwl5YY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aeXLGKxn+RhuEpjDFbt/ECV2BxYK5diVi7xVn6tULU7vDF7IK7Nil1nVqd/uTLs0a
	 j54JY+fifjoQHmXB9CR+jCM4rvP6pUcAJpAIgW91yTz1VWA8cFXD1DZoURmpEUqlBo
	 Tq8KvwKyQ4fOEXf51Jdb/5lt35sWrjNBv7X3ON5nEjg++ndjFL8fdwh7RQt7DAiufK
	 NEu++wGQ+modaUWU4wmPBGb6eEqXBiiWFcOGq4t079CkA4z0301GVt3RVtw+hHhHy4
	 jlT37q6tmmybvVR0a4m6cIFpSFH0potJvfTJYgzoIW0uyrUmfcVfT1diLwjHu9fMt5
	 gbvr2kjjgFHYQ==
Date: Mon, 27 Jul 2026 13:16:01 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <jackmanb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/18] arch, mm: create a generic
 set_memory/change_page_attr core
Message-ID: <amcv4Q_jxriraFzU@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <amDe_3KFBc9CcIbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amDe_3KFBc9CcIbo@google.com>
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

Hi Adrian,

On Wed, Jul 22, 2026 at 03:17:19PM +0000, Adrian Barnaś wrote:
> On Tue, Jul 21, 2026 at 07:23:23PM +0300, Mike Rapoport (Microsoft) wrote:
> 
> Hi Mike,
> 
> > Once this settles, the next step I'm planning is to convert arm64. This
> > would be much more involved than loongarch and riscv together, so I
> > didn't even aspire to include arm64 in the first RFC. That said, I have
> > a very ugly arm64 prototype that rewrites arch/arm64/pageattr.c to use
> > the generic CPA infrastructure and replaces the existing implementation
> > of page table splits for systems that support bbml2. But there's a lot
> > of yak shaving there to get from a PoC to actual patches.
> 
> Could you share your PoC for ARM64. I can help you with that and align my
> execmem rox cache for ARM64  changes to the desired shape of this API.

It's too ugly and more importantly it cuts too many edges. 
I'll try to bring it into a better shape and will share then Really Soon :)
 
> Best regards,
> Adrian

-- 
Sincerely yours,
Mike.

