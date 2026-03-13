Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A847107BCCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SIGiZvLDuT9uvQe4YCGX2J2OZUNCEGMTvn21oOENws=; b=xABeKANOmLUyLw9/iVqiaZWMKj
	K37QWm4MiN8kkq6jOcPOEXxD0RLiwvEEXKZY7HSaQDN1viQxjx01Ysm9ypDbGDYniU6HAlqIZ2HkL
	0ORHDP+nVFpdx9lIlXzhIizMkBnww8pWurEav3k3ajQ+9Krb/quWlvM+hGPjlZfXdhjjknZXBJDA7
	Pg2M8nf1vAJIThz1Q8xpeZ7lVDfToW5jx4zTiCA9yvb7KRnVNuvhEXcHl6qp6t2ZUfA5HC3F9gdVn
	UIY9NBU5HAQI83+G8a7BZZKTACaciFEgDoV0eEXPwNtobN631z/XyKJ2+Xp2GilxKe8Z+8E97EiQl
	YnsaQktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15pC-00000000i8c-45JK;
	Fri, 13 Mar 2026 16:57:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15pB-00000000i6q-1jA6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:57:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82C7C60142;
	Fri, 13 Mar 2026 16:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D0EC19421;
	Fri, 13 Mar 2026 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773421040;
	bh=NlyHnEVF00lgfFMdsYoT0oz0mXXnOI6++6hQTHAsR/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DgHocwGihLgUIzfEh74WnXAr8c5JROD/DIFbHV7SzajJAbvK7Qw3yhvhXuLMBO3LM
	 5Wt9miiEhrqJF22unrexhD1HPE7U291LJhYlfNtVDT98P9JvXLplLSjIEvuaR2z6nO
	 HE32GGP4nuIS3UgqnA1h0rhxhD/D/HPDRmThM9m3M4gfdxesm1cvnPWIIcbCxUPpsm
	 TcwWe7fcovYQ+2C6a4DWJUEy3CtcRjSAkXG+A0daLe9hGKPBv9fZk9DyB4ENLSsJhI
	 sAqLPwh94jbEg/3j+YPCXx4ymGC0GLLbgfZUb2yGquVy1yI2JMSNdwmC+Gg7mYBn0u
	 t6zruKkO10jbQ==
Date: Fri, 13 Mar 2026 16:57:14 +0000
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 2/2] [RFC] iommu: io-pgtable-arm-v7s: avoid gcc-16.0.1
 section mismatch
Message-ID: <abRB6g-48ZX6Yl2r@willie-the-truck>
References: <20260203162406.2215716-1-arnd@kernel.org>
 <20260203162406.2215716-2-arnd@kernel.org>
 <abBJj72kLQb0LRJB@willie-the-truck>
 <3eab12fd-31d3-4a41-a0d9-61b0f6c8ada3@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3eab12fd-31d3-4a41-a0d9-61b0f6c8ada3@app.fastmail.com>
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

On Tue, Mar 10, 2026 at 08:26:40PM +0100, Arnd Bergmann wrote:
> On Tue, Mar 10, 2026, at 17:40, Will Deacon wrote:
> > On Tue, Feb 03, 2026 at 05:24:00PM +0100, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> gcc-16 has gained some more advanced inlining techniques that enable
> >> it to inline the dummy_tlb_add_page() and dummy_tlb_flush() function
> >> pointers into a specialized version of __arm_v7s_unmap:
> >> 
> >> WARNING: modpost: vmlinux: section mismatch in reference: __arm_v7s_unmap+0x2cc (section: .text) -> dummy_tlb_add_page (section: .init.text)
> >> 
> >> From what I can tell, the transformation is correct, as this
> >> is only called when __arm_v7s_unmap() is called from
> >> arm_v7s_do_selftests(), which is also __init.
> >> 
> >> I have not come up with a good workaround, so this simply marks
> >> dummy_tlb_add_page() as not __init. Since there are currently only two
> >> files where this happens, that may be an easy way out.
> >> 
> >> If anyone has a better idea for how to deal with that, let me know!
> >
> > Can we mark the dummy_* functions as 'noinline' instead? We shouldn't
> > have to keep the selftest code kicking around in memory after boot.
> 
> I think that would work as well, but I'd have to test it properly,
> as the gcc behavior was already not what I had expected.
> 
> Another option may be to take this a bit further and do the
> same for the arm_v7s selftest that Mostafa did in the lpae
> selftest with 7e06063a43d3 ("iommu/io-pgtable-arm-selftests:
> Use KUnit") and a3c24b6d7cd6 ("iommu/io-pgtable-arm-selftests:
> Modularize the test").
> 
> I think that would be the most logical step, but it's also
> beyond what I can do as a simple build fix.

tbh, I'm happy to take the noinline variant as a quick hack if it works.

Will

