Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FD5CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 09:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNH7QraMXUpcaV0wOqYdyBNIO9GlaGj+eYf1T9C03lM=; b=QKUMMLAioxe0yu6So30km7KGCX
	jLqifZnd1qANSgw5LMLOIeRDIwCmLyCfNEnVHSGfm1CMU8Lzk/bxHZ7E91aHvb+0rNQPLJBAzNiD8
	foSeUKtyEhs1p+rESMi88RG9y3XkZYYoKpSY+8/QpBeTAUR+pmTRaa9nnKxB/LpIhG/tmQDLCALGU
	KpPzfQPex+AAXFuxC733lcbvMxn8ZAYUxL0Gv5aGaVOS6Rx5ChzjKJBjJ4llE2kaqxJBT6gAoWAfN
	Hb130otbksfFtSvmoSolw+Qyarl0eW98/67Pic9F+ZYDPd0sG7h+8fitvearCp0Ppg8tDmp8csJ8y
	oDQA7BrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4EY-0000000GTz8-1Kzn;
	Thu, 04 Jun 2026 09:19:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4EV-0000000GTy0-2a1q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 09:19:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB29C3297;
	Thu,  4 Jun 2026 02:19:15 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 981CA3F632;
	Thu,  4 Jun 2026 02:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780564760; bh=FuZRWfARoBdxtqACAjhwFu//oki9peC1uE0VZ0XB/VM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YpHf3PZ+vQ0oVsa9roHjwkB+0vOR1Hexywzz1CyyUhwN9TlKNOk9yIjJTn07QHIMI
	 LnnTh7Jc000KmvgsmMeoUjNqCdt88Mer6IMQ12ZA0UGvPWYCHYFbSElGxZXOpl4JwH
	 gt9qV74qwQ9RRwoQaVzZY/ZgYuNAF3jaOipGlhwo=
Date: Thu, 4 Jun 2026 10:19:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, maz@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Mark Brown <broonie@kernel.org>,
	David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH 3/4] arm64: mte: Disregard the zero page explicitly for
 manipulating tags
Message-ID: <aiFDFbeOoxgKigP0@arm.com>
References: <20260603160949.3372482-6-ardb+git@google.com>
 <20260603160949.3372482-9-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603160949.3372482-9-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_021923_693327_0C60A512 
X-CRM114-Status: GOOD (  22.58  )
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

On Wed, Jun 03, 2026 at 06:09:53PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The zero page is conceptually immutable, and will be moved into .rodata
> to prevent inadvertent corruption.
> 
> Prepare the MTE code for this, by ensuring that the zero page is never
> taken into account for tag manipulation, given that those actions will
> no longer be permitted on the read-only alias of .rodata in the linear
> map.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/mte.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
> index 7f7b97e09996..093b34944aee 100644
> --- a/arch/arm64/include/asm/mte.h
> +++ b/arch/arm64/include/asm/mte.h
> @@ -80,6 +80,11 @@ static inline bool page_mte_tagged(struct page *page)
>   */
>  static inline bool try_page_mte_tagging(struct page *page)
>  {
> +	extern struct page *__zero_page;
> +
> +	if (page == __zero_page)
> +		return false;

Better as is_zero_page()

> +
>  	VM_WARN_ON_ONCE(folio_test_hugetlb(page_folio(page)));
>  
>  	if (!test_and_set_bit(PG_mte_lock, &page->flags.f))

Some form of this fix should have:

Fixes: f620d66af316 ("arm64: mte: Do not flag the zero page as PG_mte_tagged")
Cc: <stable@vger.kernel.org> # 5.10.x

The current mainline assumption is that mapping the zero page in user
space is always mapped with pte_special() and we skip the MTE tag
zeroing (and PG flag setting). However, the above commit missed the KVM
kvm_s2_fault_map() -> sanitise_mte_tags() path and we don't have a form
of pte_special() for stage 2 mappings.

I'm more inclined to go with a specific test in the KVM path. It matches
the stage 1 where we skip the actual tagging. We could add a
VM_WARN_ONCE in try_page_mte_tagging() to trap future changes.

-------------8<-----------------------
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index d089c107d9b7..445d6cf035c9 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1479,6 +1479,11 @@ static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
 	if (!kvm_has_mte(kvm))
 		return;
 
+	if (is_zero_pfn(pfn)) {
+		WARN_ON_ONCE(nr_pages != 1);
+		return;
+	}
+
 	if (folio_test_hugetlb(folio)) {
 		/* Hugetlb has MTE flags set on head page only */
 		if (folio_try_hugetlb_mte_tagging(folio)) {

-- 
Catalin

