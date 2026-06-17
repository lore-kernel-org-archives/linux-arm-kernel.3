Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A767ECD98F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 18:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldThSSQTB2CI5zmNiVNRBJEFd14r4QvroLDBqhcTeek=; b=DdKoL0SYv16HPATVLrph7OuDDz
	jiW5YN5la7FLOaIREZgCN1MSNHOOCcdp9kZFxuBGL4tBC9vrlu8BISwyA5H6SHz0xvR9IZEVS6NvJ
	GsJgMc87RmaIRIPAwSLkAZd27su0OZdYWU6cVUV7nMb1hq05JXpXlXKx89+JAghKmeMxTqCmrTpE3
	ZIJJ4ClkCPBGeGfpeNhJDi2kQ9TmthqCMA22ZTDeL2qNNt9nA/CaZLJonth93EQIEOcdjdRJcqocs
	QkxpBEJEnouGURm64gIb3q4uNhVaHB+np31be2rH3d6ihnUI4VqQzy13PLx+y4AilhxQnVnoVIb4l
	dtWaq8Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvBi-00000000Azq-3GAY;
	Wed, 17 Jun 2026 18:40:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvBh-00000000AzY-3nqq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 18:40:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6044A40BBD;
	Wed, 17 Jun 2026 18:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398011F000E9;
	Wed, 17 Jun 2026 18:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781721633;
	bh=ldThSSQTB2CI5zmNiVNRBJEFd14r4QvroLDBqhcTeek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PGEAs34F6BiEJMajWABVfRAt6apO6GdmemXHMH9ZaDCtfTlhEYqpEiVDB/HATlSB+
	 5c8IZjhNSJbfvIKg3U/WcQ8QMFrETr1FwWAEiMnEo3zeh1Eu0mWa/S9jPYpERLx66T
	 2BjXib8XHNbQc7T3GRgH4fqDla3faZEtb42/ywbV8Pbb6efs2PGh/vIfIJmL1bdHNM
	 CViMGplX75QLZCOIlfNt9NbEG9KrbTjrWe/WC5MAibT4lN+1YOTGS59HzxKPT3ENFH
	 pf7bxdmXswR3mZijG+ATccnjAev3cNuDR0uzCu0H9xumEJMiUdcPjwBYm8fm8JsOvm
	 cdF0DYB088P2w==
Date: Wed, 17 Jun 2026 21:40:25 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Brendan Jackman <brendan.jackman@linux.dev>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Brendan Jackman <jackmanb@google.com>, owner-linux-mm@kvack.org
Subject: Re: [RFC PATCH 3/6] arm64: mm: fix restoring linear map permissions
 on execmem cache clean
Message-ID: <ajLqGZ7sfKsQaSf4@kernel.org>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-4-abarnas@google.com>
 <DJ69RCVRBO0Y.3JCYSW50IC4RC@linux.dev>
 <aiuyoy8Kmr9yU4GM@kernel.org>
 <ajK6w3YTFpVaUl3v@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajK6w3YTFpVaUl3v@google.com>
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

Hi Adrian,

On Wed, Jun 17, 2026 at 03:18:27PM +0000, Adrian Barnaś wrote:
> On Fri, Jun 12, 2026 at 10:17:55AM +0300, Mike Rapoport wrote:
> > > 
> > > Hm, maybe desirable for execmem but that doesn't really mean the x86
> > > behaviour is correct. Maybe it makes more sense to change the x86
> > > to align with the arm64 behaviour here?
> > > 
> > > BTW we should probably document this API a little bit, I never thought
> > > abut what "valid" actually means until now. I had thought of it as "I
> > > can access this memory" but that's an unclear concept and now I realise
> > > "valid" is a technical concept in Arm that's confusing. And it's extra
> > > confusing if the kernel API uses "valid" to mean a _different_ thing.
> > 
> > I've got confused too and that's how set_direct_map_valid() got into x86
> > with a different semantics than on arm64.
> > 
> > What execmem really needs is set_direct_map_default() variant that gets
> > nr_pages.
> > 
> > AFAIR, set_direct_map_default() has a single 'page' parameter because it
> > was added to reset permissions for the direct map alias for vmalloc()'ed
> > pages before there was VMALLOC_HUGE and each page had to be reset
> > independently anyway.
> > 
> > Maybe it's time to add nr_pages to set_direct_map_valid().
> 
> I was also quite confused by this initially. I spent some time debugging
> until I realized why unloading all the modules was causing the kernel to
> crash.
> 
> The reason I took this approach was that I wanted to send out a working
> prototype for arm64 that wouldn't interfere with the existing, working
> implementation on x86.
> 
> Following your suggestion, I can put together a preparatory patch series to
> refactor the set_direct_map_* APIs to accept a nr_pages parameter. This

There was a patch Nikita sent a while ago that does something similar:

https://lore.kernel.org/all/20260410151746.61150-2-kalyazin@amazon.com

I believe you can start from there.

> refactoring would also allow us to drop the redundant set_area_direct_map

We can't drop set_area_direct_map() because vmalloc pages might be not
physically contiguous.

> helper. I could then rebase the rox_cache series on top of that.
> 
> Does this sound like a good path forward?
> 
> Thanks,
> Adrian

-- 
Sincerely yours,
Mike.

