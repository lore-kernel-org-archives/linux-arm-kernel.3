Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67252C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 23:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tw4mMdPKkZhiB9WCuXB6jhjMwgKF3WY9lTBU3wZMXiE=; b=GOR8JuZnIyzPMUEkA1c2PAnl+/
	J/6stK/wRblkjIWKbnZJus5O5WwTdyUi7yTdjims8zm7Pb7VLFsDdRN3s1oOuCes5kHTwPLvp1MV/
	7H2ZSnXA8XllCbQCSeED7+wGr1mUQcBhcTLgFVwsuuWCHM8pG1KS4KXFvRhSyEapLmuINlmgP4tYO
	jt2tt+5dEqO2Cmidk2+5JEHwhyaTgMS/zijOiBpsBpz7Rf5dMaKM55ZVJp4rkW03L5yQDQYFa3741
	jkUmahaeLbYXxoVcpExStvbE4l9k++ZFIIvfsrCaZyaKQdb92DnN6IrPoslA4w28E3PA38/ex94nP
	duAD1hgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9B8C-0000000461z-3F17;
	Sun, 27 Apr 2025 23:09:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9B6D-000000045sv-1tUh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 23:07:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBE4A61126;
	Sun, 27 Apr 2025 23:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C04DC4CEE3;
	Sun, 27 Apr 2025 23:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745795267;
	bh=tT1ToXBHwKrWkNCx4aAzO7gnt63zYs1WN6coWvYxIAs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lmomKp6H+Z5yPVT9yORPYvCT+AEUZgKZQEVE44c1cE1vaJTgybO2JT9SQS63XTBBU
	 a05feXjoXxpbHDOtXEZUYWOLwzLO38mBm6eXCBLgKyy7IlhOH1vgkmG1QEC3/DPMAd
	 EQ902A6TjoVIMR4JUKWFjVKfO7GfT5r9XgeZ0obQ=
Date: Sun, 27 Apr 2025 16:07:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, "Sauerwein, David" <dssauerw@amazon.de>, Anshuman
 Khandual <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, David Hildenbrand
 <david@redhat.com>, Marc Zyngier <maz@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Mike Rapoport <rppt@linux.ibm.com>, Will Deacon
 <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Ruihan Li
 <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v4 7/7] mm/mm_init: Use for_each_valid_pfn() in
 init_unavailable_range()
Message-Id: <20250427160746.13040000164752386b936be8@linux-foundation.org>
In-Reply-To: <ac77c07ecda8805a5f942f5c71b3a2ef0f9183ce.camel@infradead.org>
References: <20250423133821.789413-1-dwmw2@infradead.org>
	<20250423133821.789413-8-dwmw2@infradead.org>
	<e772cf66-c661-422d-911a-bc13ba4d59fb@lucifer.local>
	<20250425163813.58b72a3aa2d3ebbd96d1929e@linux-foundation.org>
	<ac77c07ecda8805a5f942f5c71b3a2ef0f9183ce.camel@infradead.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 26 Apr 2025 09:30:50 +0100 David Woodhouse <dwmw2@infradead.org> wrote:

> On Fri, 2025-04-25 at 16:38 -0700, Andrew Morton wrote:
> > On Fri, 25 Apr 2025 17:11:10 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> > 
> > > Andrew - can we drop this from mm-new? It's breaking it.
> > 
> > I almost did, but David seems to have a fix.
> > 
> > --- a/include/linux/mmzone.h~mm-mm_init-use-for_each_valid_pfn-in-init_unavailable_range-fix
> 
> The symptoms only manifested when it got used in
> init_unavailable_range() but that's actually a fix for the sparsemem
> implementation of for_each_valid_pfn(), as David H surmised.
> 
> Please could the fix be folded into
> mm-implement-for_each_valid_pfn-for-config_sparsemem.patch ?

yep, that's why I named the patch file
"mm-mm_init-use-for_each_valid_pfn-in-init_unavailable_range-fix.patch".
To tell myself to fold it into
mm-mm_init-use-for_each_valid_pfn-in-init_unavailable_range.patch.

> This is what it should look like with the fix:
> https://git.infradead.org/?p=users/dwmw2/linux.git;a=commitdiff;h=55bebbb093

We're good.

> If you want to keep the fix separate, then that's the patch that it
> fixes. Do you want a commit message? I'll certainly give you a proper
> SoB:
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

I already unauthorisedly added that so I don't get grumpygrams from
Stephen ;)

> Happy to resend the fixed series if it helps; it looks like you've
> already basically sorted it though?

THanks, it doesn't appear necessary at this time.

