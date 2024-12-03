Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02042E6C5E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 00:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmQ/h9heMz+KncCJaPXxE2NqhV1NegmIfHVLDBVh9Mw=; b=3hM/yPJy5Hl45h9KU7x+V6y1m3
	q8IAtHS0NqUvzeeKZxPywKNiR0rJ3AwEwdwAJGMS9aGucf//fnEA+m9otVbcI2mg7Sl6/pkRx7avp
	F595n1vlqlPvbI/7DEZbNtQnkIQK4FGjpE9OCErCFY5VyOT8MQnnM4wnbf1CeDy7eyU0Xj7AVgN3w
	53uUnNPkZVpO075TYBnB7J8yCzvxnBTPq3P1/kgRFw1jr3xYP1TInpwYEHIjGQ+kEmWXUNlSBWdFj
	KdLEBis2+C/QpV2bsQdbEJhHAqtx+LVR05FoIuM7R/xXjMffqqitSOBhJOPHYeVcQDo21X2akYVxT
	hrMEZ78Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIH4P-00000007sEr-3Vgm;
	Tue, 03 Dec 2024 00:47:17 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIH3P-00000007sBp-4AkF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 00:46:17 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2396F68BEB; Tue,  3 Dec 2024 01:46:12 +0100 (CET)
Date: Tue, 3 Dec 2024 01:46:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	catalin.marinas@arm.com, hch@lst.de, rppt@kernel.org,
	thuth@redhat.com, will@kernel.org
Subject: Re: [PATCH] arm64: patching: avoid early page_to_phys()
Message-ID: <20241203004611.GA8116@lst.de>
References: <20241202170359.1475019-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202170359.1475019-1-mark.rutland@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_164616_177482_04ACE24B 
X-CRM114-Status: GOOD (  13.63  )
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

On Mon, Dec 02, 2024 at 05:03:59PM +0000, Mark Rutland wrote:
> +	phys_addr_t phys;
> +
> +	if (is_image_text((unsigned long)addr)) {
> +		phys = __pa_symbol(addr);
> +	} else {
> +		struct page *page = vmalloc_to_page(addr);
> +		BUG_ON(!page);
> +		phys = page_to_phys(page) + offset_in_page(addr);
> +	}
> +
> +	return (void *)set_fixmap_offset(fixmap, phys);

This looks much better.  Btw, I recently open coded the vmalloc to phys
logic above in an unrelated fix, and noticed that
arch/powerpc/mm/pgtable.c has a nice vmalloc_to_phys that could
be generalized and move to common code.  Does anyone have an opinion
on that?


