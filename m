Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2532C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5oOzMK2JlDQqDWdY37veBc8sIrd6Hyk8XP3lPFCDLs=; b=JAaAYxBWGR6SVQ7zqUD/6dfr7F
	nQldc5ABuuNf6kAlwzmzLccbJHiT13KxlAqZbUQ+/rbwdDf7Ypnu06+L7uG6FWzODk5nUYu/fYWwY
	A3EqPTTtnDCYmB/eSA3mfIJVd2LUA77qdtVEXalX7rAPAQLJ9AnXVHHm2qejmWCzydHqwJcVZYyDI
	VggW02mL18/Y5e4ztHI1JWqZ7adwRrzLlhdBIukmVKKuAVwVcuyDo5EHDog+cJnSV4Vf0CQq+XTbj
	IliHcqC5uvPgernrsdsaprxI09xCGvfjMI3JXRNHjS9ORhCvytDYZivjbPey//cAus/r38O5BtQA1
	F+cpjOSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkqe8-0000000EsYW-0BCZ;
	Wed, 19 Feb 2025 20:26:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpPu-0000000EXEu-2KrY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Feb 2025 19:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=w5oOzMK2JlDQqDWdY37veBc8sIrd6Hyk8XP3lPFCDLs=; b=YZNeE9d2Pm6y7vgY7yWe8ThNQ/
	Z6Dwcnv4UIV8N548xNhbwlb/gIZME5H7Ybc2vKkWY+QmJ2Z0wzSko63k+S6tSZF1FclJcKmBA74FJ
	7kuRG8aES/9AUliUTci5VVK7hn1YSL0I2oyzN36BtneF1i6+3zQPhpZoQIrf/qU4fIPjVPk7IfW8Q
	tEF6IRL8nMgCmpq2MMiZDQdUKwf7uyPSMITWdrzyllDdWMtEFqyDryo0c8piGSbi5ZjzXJIxor2Rq
	I2VJEHRmpdVqfRArp59sTQV0GwQ91GbUs1WBCPipn8DoQGnZdX19K+VTZfqtPKSFU2xZPwux1qOs4
	oIUmGJ9A==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpPp-00000002JD3-3pXK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 19:07:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B48D85C5C06;
	Wed, 19 Feb 2025 19:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAF3C4CED1;
	Wed, 19 Feb 2025 19:07:15 +0000 (UTC)
Date: Wed, 19 Feb 2025 19:07:12 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
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
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] mm: Don't skip arch_sync_kernel_mappings() in
 error paths
Message-ID: <Z7Yr4HKUZ5AdLP2C@arm.com>
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <20250217140419.1702389-5-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217140419.1702389-5-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_190726_137170_6463D648 
X-CRM114-Status: GOOD (  11.86  )
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

On Mon, Feb 17, 2025 at 02:04:17PM +0000, Ryan Roberts wrote:
> Fix callers that previously skipped calling arch_sync_kernel_mappings()
> if an error occurred during a pgtable update. The call is still required
> to sync any pgtable updates that may have occurred prior to hitting the
> error condition.
> 
> These are theoretical bugs discovered during code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2ba3e6947aed ("mm/vmalloc: track which page-table levels were modified")
> Fixes: 0c95cba49255 ("mm: apply_to_pte_range warn and fail if a large pte is encountered")
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

