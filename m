Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC43C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwZ8/HRnFmeLDeBnLMF9ALpoQ2i6k+zaF6tYugZOpgM=; b=XqZgZssH9SXXWPi6JRUcwvvu44
	FMPM4KC90/FQPHIY7Z9Y75O+WMoGXvy71OSV2G3W13fKNbUv1l3Ymh5y5l+Mtm7FqxaxsmTIc/aRV
	KRzgVaq1/zMpaxiyx65j73x+9sdGtA3WO4nJ3eXmepKV1NMn0XTpW8TvLxEiqNgRFGaAu2e70fzL+
	quF/DqFoxGTBysjS0SHEhmj78WUhNxQMZyil2KlyLEMpP8yxYMTfgO3yHsfcoebzJ2/gR33lYzZZ5
	CQTdDUXl8ySPfWKxr+DaQlY/v70oXRbjIbDmQwty/HTJ3LvrIoyGoHzne6MG8b7JEnYwOG2cBe9ZA
	BNbacxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPXv-00000002QNI-2rXc;
	Mon, 27 Jan 2025 13:52:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPWa-00000002Q3h-1iJZ;
	Mon, 27 Jan 2025 13:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WwZ8/HRnFmeLDeBnLMF9ALpoQ2i6k+zaF6tYugZOpgM=; b=FgDinq27ZXj0o5Jh/xG1WqpFSl
	YEDlGFTOfszJKXSclDHZACtlBRejU+4hdb8TIyPUav4w6BDiO4R6gHW28RKopJv6lc3FsUrFnxhb8
	IsggbqaHwqkyss12753HCV1UBZlRcrQCDdkTu7T31YpYFm/58vkXiuW8xp+HEJbRMmftFHSbtbLtt
	TzfB40gcvvxW+B7MNeG1m5OcmNvjn2bGSv/D4DVvX435W4/HDQZm0eTNIm5nooz2Yma0oiMiQBQbv
	qJSNxDJSnf3W2/4DmlqjWBfMJjoxbT5IqOSZLPhasLxs/FrzCfv1m7Db172F/BHhc/7p51biE2OFm
	RWGm8YVQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPWY-00000009ToN-17YQ;
	Mon, 27 Jan 2025 13:51:34 +0000
Date: Mon, 27 Jan 2025 13:51:34 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 2/9] riscv: Restore the pfn in a NAPOT pte when
 manipulated by core mm code
Message-ID: <Z5ePZt61CM84Hb36@casper.infradead.org>
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
 <20250127093530.19548-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127093530.19548-3-alexghiti@rivosinc.com>
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

On Mon, Jan 27, 2025 at 10:35:23AM +0100, Alexandre Ghiti wrote:
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> +static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
> +			    pte_t *ptep, pte_t pteval, unsigned int nr)
> +{
> +	if (unlikely(pte_valid_napot(pteval))) {
> +		unsigned int order = ilog2(nr);
> +
> +		if (!is_napot_order(order)) {
> +			/*
> +			 * Something's weird, we are given a NAPOT pte but the

No, nothing is weird.  This can happen under a lot of different
circumstances.  For example, one might mmap() part of a file and the
folio containing the data is only partially mapped.  The filesystem /
page cache might choose to use a folio order that isn't one of your
magic hardware orders.

> +			 * size of the mapping is not a known NAPOT mapping
> +			 * size, so clear the NAPOT bit and map this without
> +			 * NAPOT support: core mm only manipulates pte with the
> +			 * real pfn so we know the pte is valid without the N
> +			 * bit.
> +			 */
> +			pr_err("Incorrect NAPOT mapping, resetting.\n");
> +			pteval = pte_clear_napot(pteval);
> +		} else {
> +			/*
> +			 * NAPOT ptes that arrive here only have the N bit set
> +			 * and their pfn does not contain the mapping size, so
> +			 * set that here.
> +			 */
> +			pteval = pte_mknapot(pteval, order);

You're assuming that pteval is aligned to the order that you've
calculated, and again that's not true.  For example, the user may have
called mmap() on range 0x21000-0x40000 of a file which is covered by
a 128kB folio.  You'll be called with a pteval pointing to 0x21000 and
calculate that you can put a 64kB entry there ... no.

I'd suggest you do some testing with fstests and xfs as your underlying
filesystem.  It should catch these kinds of mistakes.

