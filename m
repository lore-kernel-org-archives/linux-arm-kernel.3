Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB7CC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 19:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ye5KfUskURbGui6gRwP/P9Fx+FNT2lxkR1Wtku3gQE8=; b=HxPlx9j9OBSJyMrUoOa/MrGCKb
	112z68FPP3RVTwWF4qkFmaMmN4Lcev/iuCCivaQcOJGPH4X8HiuV9+Zy0+1hbRy2Xhs38IVaoED2A
	FBHk5oLapPtYGYka3dotzax41K42da/FzuigA9ON6kTddklY486zU/fWrIraL/54EA71dCdYC87MT
	2wcalM1SaBSjHvUuN8sQK0M2apinmd3/JaMNaDYwL1G/yXHRc7sHf8pLIS9LUK2NpJYtYOswebGL8
	jXiglzwcgW0VKzq6pjr36sb6oYjbyV0s8FKEsx8ON8QsCuqaXl8t7xczhxQDE85fqXHdZxgkPZxt2
	3AujvTDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpbn-0000000EaHx-2xop;
	Wed, 19 Feb 2025 19:19:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpT0-0000000EY97-27Y1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 19:10:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78FB65C562A;
	Wed, 19 Feb 2025 19:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6982CC4CED1;
	Wed, 19 Feb 2025 19:10:35 +0000 (UTC)
Date: Wed, 19 Feb 2025 19:10:32 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Fixes for hugetlb and vmalloc on arm64
Message-ID: <Z7YsqO7ykGgcBFEI@arm.com>
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217140419.1702389-1-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_111042_583700_08949E3A 
X-CRM114-Status: GOOD (  16.98  )
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

Will, Ryan,

On Mon, Feb 17, 2025 at 02:04:13PM +0000, Ryan Roberts wrote:
> This series contains some fixes for hugetlb on arm64, and is split out from v1
> of a wider series at [1]. While the last patch is technically targetting core-mm
> and is not directly related to arm64, I'd like to to go via the arm64 tree so
> that the wider performance improvement series (v2 to be posted shortly) that
> depends on this series doesn't have to be robust to the fix not being present.
> 
> I've included maintainers/reviewers for all the arches that are (trivially)
> touched due to the API changes, hoping for some ACKs.

These fixes look fine to me and I think we should get them in for 6.14.
I think Andrew was ok with them going in via the arm64 tree:

https://lore.kernel.org/linux-arm-kernel/20250205235219.3c3a4b968087d1386d708b04@linux-foundation.org/

-- 
Catalin

