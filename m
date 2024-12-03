Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0261CE6C61A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 08:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWzIAxtMeBHQFfZzVhC269tcvLpqOuVSiNLN4Yur0EI=; b=jbRYop88PLM9hP27zQmCiu0DgC
	xAuwqA3bVQPBmc7XDYbDEWnBzt/kzbAlmBzU6RQomCm9UECc0Qjk9nLGbdtAAH7Zen4vvQpnJD9An
	dqvjojqSqwL3fvkSnfKcbFt/REMqfiCHlsM+xTNHAcVIdHXGvnesBEVTTz33R0aKKpmJuXiDPHU2R
	HUp47XRSBL3nD3Y+oCeGan1B70z6ZczeLeXef4+15uZN/3/682KISvvUvGzqy0oWV/xOkMa9gCQg/
	FptBGTSCT+6mA4ag2zFZ1uOxv3VwULQnT47DvvLsRp/avV2J31yiXF45yZ77ZoWdLTuGy0Mraxa1O
	8e4GT/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOhu-00000008lq6-38vj;
	Tue, 03 Dec 2024 08:56:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOgv-00000008ljv-0e24
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 08:55:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 220055C6A9C;
	Tue,  3 Dec 2024 08:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62846C4CECF;
	Tue,  3 Dec 2024 08:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733216131;
	bh=+yGM0G1AeMOukz1kobeqt/CUlcju2kSwqIImGGyFJdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tC5TZBj79hZSq9sNGZLtP8vEFZ0sAowbkTSgmcDI5BBGdpRCWlXUUE0XrRf6j6yrS
	 3erETwic23VHPI8J3+WhOKq2eQCIb+KuOfp9f4TM8Oa7fq6mDVr+1weNfjYulWOJeG
	 o3QMu4ctjmqIZmPLJzHtVP5B4QANW6sEeGyA8gYX0WhoMAsQOLNjMRMBNnChKnn8ne
	 E3pKl5MS0d6PkbpCIN2YsFY/d3Y4hxQl1zNlkTmrALOFMvgEMXgUhva0cMQAj9P7qe
	 HBBI2Dr7B76mBQ2TEFD3EbxJOxecmjqfMhvImtqzm6QaPnF79el0KJf0A0XtgFFjYW
	 OGxpmH1SXWcKw==
Date: Tue, 3 Dec 2024 10:55:19 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	catalin.marinas@arm.com, thuth@redhat.com, will@kernel.org
Subject: Re: [PATCH] arm64: patching: avoid early page_to_phys()
Message-ID: <Z07Hd0UR3mQQW1f7@kernel.org>
References: <20241202170359.1475019-1-mark.rutland@arm.com>
 <20241203004611.GA8116@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203004611.GA8116@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_005533_229537_2CC4515C 
X-CRM114-Status: GOOD (  15.96  )
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

On Tue, Dec 03, 2024 at 01:46:11AM +0100, Christoph Hellwig wrote:
> On Mon, Dec 02, 2024 at 05:03:59PM +0000, Mark Rutland wrote:
> > +	phys_addr_t phys;
> > +
> > +	if (is_image_text((unsigned long)addr)) {
> > +		phys = __pa_symbol(addr);
> > +	} else {
> > +		struct page *page = vmalloc_to_page(addr);
> > +		BUG_ON(!page);
> > +		phys = page_to_phys(page) + offset_in_page(addr);
> > +	}
> > +
> > +	return (void *)set_fixmap_offset(fixmap, phys);
> 
> This looks much better.  Btw, I recently open coded the vmalloc to phys
> logic above in an unrelated fix, and noticed that
> arch/powerpc/mm/pgtable.c has a nice vmalloc_to_phys that could
> be generalized and move to common code.  Does anyone have an opinion
> on that?

Maybe fold that check for !page into vmalloc_to_pfn() and make
vmalloc_to_phys() a static inline?
 
-- 
Sincerely yours,
Mike.

