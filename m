Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D64C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MoCqLC0IyhHguklsqlEzr9OrpUUFrOWDPdsoNryKYDU=; b=dJkoAWQLC/Ls5W75/nCYMhYUal
	QkJSCKQO0+rwUE88wY1y/nzGddNhGXmKWMyjlo54Dnj9ZiN5bzPWH/8QdwZKfbQBaPn7v1fOYblWh
	UCIjabrtk1oSAiQKUT0TAs6lD4NwHWDLGalvbQ/53ZLyWQ0lUMldR4Y6SzGJyuJP2eix5Y1SBrOAm
	XiiBiqmlSQR8YZ3MauPNzmJ9CwzEWfDiY8tL9LMPIZBr7BhAkHnkHQV25JwI9VPqHIxdmNB4vDEbr
	8ZeMsJ+xJcFDvJrS4FGuLl8XjxvdlFm6roelPd5rd7YbT4BSn7wJeNU06gHVFI8TIe3gnC1A33xd5
	jd6EGVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqU3-0000000BaFE-0rpg;
	Thu, 27 Mar 2025 16:53:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqLI-0000000BYVk-1xZL
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Mar 2025 16:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MoCqLC0IyhHguklsqlEzr9OrpUUFrOWDPdsoNryKYDU=; b=tX86Jgoq24bhniWrtEPXpkd536
	cUmSpefVNuw5pC1Od8arup43Wnt7+0HRYOZoanyEQdX0oJU2QGL5xfloxkFz8kRQrsp5qXMswzpcm
	6N4x9LAKCqKwO8lowZUyg7JMY6pDkmDBvJoHIbH+vZK5Eftv03kMbr4oEon5AzyL5LhEdcON3/zXA
	ORGXhYuo5+I7eAubmfHcetoSzGNeQPVaTZQ2nCwjJ+3LPw9wiJeF3PnIZvz1oAInLzJaTKHfCth7z
	BLYHE3Kib6e5E7PS7n7ICBAU0KNrjkVE3ee8WJjXwWefDYjcgEz9JHDntUS/0mP8NIoRsj+4aMDGm
	vac/ZHUQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqLG-0000000DMCf-0N50;
	Thu, 27 Mar 2025 16:44:30 +0000
Date: Thu, 27 Mar 2025 16:44:29 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Dave Chinner <david@fromorbit.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/filemap: Allow arch to request folio size for exec
 memory
Message-ID: <Z-WAbWfZzG1GA-4n@casper.infradead.org>
References: <20250327160700.1147155-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327160700.1147155-1-ryan.roberts@arm.com>
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

On Thu, Mar 27, 2025 at 04:06:58PM +0000, Ryan Roberts wrote:
> So let's special-case the read(ahead) logic for executable mappings. The
> trade-off is performance improvement (due to more efficient storage of
> the translations in iTLB) vs potential read amplification (due to
> reading too much data around the fault which won't be used), and the
> latter is independent of base page size. I've chosen 64K folio size for
> arm64 which benefits both the 4K and 16K base page size configs and
> shouldn't lead to any read amplification in practice since the old
> read-around path was (usually) reading blocks of 128K. I don't
> anticipate any write amplification because text is always RO.

Is there not also the potential for wasted memory due to ELF alignment?
Kalesh talked about it in the MM BOF at the same time that Ted and I
were discussing it in the FS BOF.  Some coordination required (like
maybe Kalesh could have mentioned it to me rathere than assuming I'd be
there?)

> +#define arch_exec_folio_order() ilog2(SZ_64K >> PAGE_SHIFT)

I don't think the "arch" really adds much value here.

#define exec_folio_order()	get_order(SZ_64K)

> +#ifndef arch_exec_folio_order
> +/*
> + * Returns preferred minimum folio order for executable file-backed memory. Must
> + * be in range [0, PMD_ORDER]. Negative value implies that the HW has no
> + * preference and mm will not special-case executable memory in the pagecache.
> + */
> +static inline int arch_exec_folio_order(void)
> +{
> +	return -1;
> +}

This feels a bit fragile.  I often expect to be able to store an order
in an unsigned int.  Why not return 0 instead?


