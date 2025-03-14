Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A515C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTpKh+6J9wm2jU7DQlEhYXzFlTCXWRQEeiEdGd+zv9M=; b=eHzFLB/5/wIpglBjL8TfmPzNgG
	BMnNlfqx+ZqP+G6s8nVTIbvRv1g62352ptfn/3hOTd6TV6TXlu8wm2kp6ujPjJWzH0mvEPyamDm4B
	k9nKRvHx0Nq7ETYAT64IyEVY50u3lZC9h0Xv2x5V9i1tmyD6cKrKLneksQ5WUbPFGY0y2gm3Rze3M
	jLZxrWRW8GHa77nqIZ+YtCVKeHpgLZOkUTzZ8VileGl3nkliYb1umF5x07a/yG7qQ9ZWovGCC0OTf
	ctFaAPyR66VRkzEUdQbCMQ+mzPtZLt+lRtP+D99+F85SnrIvZYykahGQZUYKPuIvckLlVhstsk10b
	+QVSyCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9Sp-0000000EyzD-1RbB;
	Fri, 14 Mar 2025 18:08:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9Ca-0000000EwMQ-4ASe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 17:52:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6E7EEA487B3;
	Fri, 14 Mar 2025 17:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C89EC4CEE5;
	Fri, 14 Mar 2025 17:52:07 +0000 (UTC)
Date: Fri, 14 Mar 2025 17:52:04 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [bug report] arm64/mm: Clear PXX_TYPE_MASK and set PXD_TYPE_SECT
 in [pmd|pud]_mkhuge()
Message-ID: <Z9RsxL98s23mvqJa@arm.com>
References: <d7902504-1ed4-452f-9b08-148f6b8b69fd@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7902504-1ed4-452f-9b08-148f6b8b69fd@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_105209_105506_AF6183EA 
X-CRM114-Status: GOOD (  13.03  )
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

On Fri, Mar 14, 2025 at 01:54:01PM +0300, Dan Carpenter wrote:
> Hello Anshuman Khandual,
> 
> Commit 1601df9e366e ("arm64/mm: Clear PXX_TYPE_MASK and set
> PXD_TYPE_SECT in [pmd|pud]_mkhuge()") from Feb 21, 2025 (linux-next),
> leads to the following (unpublished) Smatch static checker warning:
> 
> arch/arm64/include/asm/pgtable.h:587 pmd_mkhuge() warn: odd binop '0x1 & 0xfffffffffffffffe'
> arch/arm64/include/asm/pgtable.h:626 pud_mkhuge() warn: odd binop '0x1 & 0xfffffffffffffffe'
> 
> arch/arm64/include/asm/pgtable.h
>     579 static inline pmd_t pmd_mkhuge(pmd_t pmd)
>     580 {
>     581         /*
>     582          * It's possible that the pmd is present-invalid on entry
>     583          * and in that case it needs to remain present-invalid on
>     584          * exit. So ensure the VALID bit does not get modified.
>     585          */
>     586         pmdval_t mask = PMD_TYPE_MASK & ~PTE_VALID;
> --> 587         pmdval_t val = PMD_TYPE_SECT & ~PTE_VALID;
> 
> This is "1 & ~1".  I see the comment, but I'm too stupid to know even
> after reading he comment whether it's intentional or not.  :P
> 
>     588 
>     589         return __pmd((pmd_val(pmd) & ~mask) | val);
>     590 }

Prior to the above commit, the code was:

#define pmd_mkhuge(pmd)			(__pmd(pmd_val(pmd) & ~PMD_TABLE_BIT))

So just clearing a bit. That's why the reworked code has val 0 in the
current configuration. This may change with support for 128-bit PTEs
though, different format.

The comment is about preserving the PTE_VALID bit in the original pmd
value, so it's masked out of both mask and val.

It's good that smatch catches these though. Any way to mark a false
positive?

-- 
Catalin

