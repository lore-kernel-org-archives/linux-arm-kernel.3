Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896FEC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRXpkCoHmRI8B2apOitlWhLmfMZbTU9+cWB13TE7DY8=; b=WOXJrA+dN00XONhkV4NfVRZUCj
	1GE6OL09OqNLMUuFeBd58zk441g5jl/dY27cEULxzEBV2IbbAH0sBMl8vTYSQvOwnai7H9V2cmNPr
	p6lnkQtbsw7u47KhH2PAnDFjJxrr3CZdAcgVWiOb5cAtyMk/O08YunoobrdIaJXFY0kBAsBq3CQvQ
	Q0KvS2FMvDNMTWghPF7v/k/DfNoSlHgCUyCNLXWqcD+J63VbC2gVWZIKme7Vbj/g7nkRCBkCFWuLe
	HTWlc1QLKViN0ZTxJJHKS8Sb8G5hdWWNfH7NS0YMhp259ozcRhrfgR86JNBqg9YR8hEg7Tl8yUqeC
	FwLHZE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEVO-0000000FfBI-39b9;
	Wed, 14 May 2025 15:58:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDoN-0000000FXu3-1fqt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:14:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 788A35C1017;
	Wed, 14 May 2025 15:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91160C4AF0C;
	Wed, 14 May 2025 15:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235662;
	bh=cJRgpdMEXZHEJK1t7Kg/C1eNrowNSvxU60h62Y5kvtc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TDmI5TZZjn/npyMlYJoum+PjSv5HtAVaOgXRweFZGSwsSMdDI/CQ7BzLDG7vT4jHs
	 1iFdFoHIPLjzcH5tFt50wu64yyYVcYKz/hAQTDLkRcYPgTKG9yDXQc23aUuu2EVpNn
	 NKsqIehfFQzD1K8XwdVYiT3NXoV94kd9J+HBo4S26mT24asWWTkHpI3+B9VfEoeZuC
	 4tyPN9MlQMeUf3OY2AH6jwtMJH2piXMb8d4t5tGS7cvXQcXhO0AgmU8Uqk3KZ6ao5S
	 FmOh8nSjltLKlaQ0QmeFfUl8Qs6ymwouIYwxvdOJmu7YPvqouy898PJWITqIBdLwIS
	 vt8z2WvWBW0UA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Permit lazy_mmu_mode to be nested
Date: Wed, 14 May 2025 16:14:12 +0100
Message-Id: <174722572203.77262.3085803317219491344.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250512150333.5589-1-ryan.roberts@arm.com>
References: <20250512150333.5589-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_081423_491571_FECF553D 
X-CRM114-Status: GOOD (  12.56  )
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

On Mon, 12 May 2025 16:03:31 +0100, Ryan Roberts wrote:
> lazy_mmu_mode is not supposed to permit nesting. But in practice this
> does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation inside
> a lazy_mmu_mode section (such as zap_pte_range()) will change
> permissions on the linear map with apply_to_page_range(), which
> re-enters lazy_mmu_mode (see stack trace below).
> 
> The warning checking that nesting was not happening was previously being
> triggered due to this. So let's relax by removing the warning and
> tolerate nesting in the arm64 implementation. The first (inner) call to
> arch_leave_lazy_mmu_mode() will flush and clear the flag such that the
> remainder of the work in the outer nest behaves as if outside of lazy
> mmu mode. This is safe and keeps tracking simple.
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64/mm: Permit lazy_mmu_mode to be nested
      https://git.kernel.org/arm64/c/1ef3095b1405

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

