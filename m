Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F998C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWt4misabhLOnV//lu2h3uE6MQyjYWXsTbiIxpiihLI=; b=nAWEpHDhgpNyCzsYFi+H/r3YKY
	cfwhTmABiNqHY63voZWQ8bgK4uQ/VEMFSRxucBihfqtuCNop/7bKiV7OylHP4F/NRXMJl9tyDovPf
	iIYj1kATdPGjYinq/jcu2wuWXAPIZiM1eetGeMkRXQTXLzdxGnTVK6Yv44VmU3VZd+6eYxsgzLeuh
	8lruX/IWAfhRHnOxwnbbkWKkMI2elEyLoRYupQUfs1wGqAuEn7hk/141BRa096dlrzXGaNonXasP/
	fVtrUGlk38WWDcOPRx3YMJwepVixRLPEprJL9HBPhEzpzMG8MZ4pSOuwxVlrQawmUDF5aljB16+9G
	svXOWWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZWf-00000006xON-1G0o;
	Mon, 07 Sep 2026 13:36:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZWY-00000006xNq-36b7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:36:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E72CB1476;
	Mon,  7 Sep 2026 06:36:32 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBD973F528;
	Mon,  7 Sep 2026 06:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788788196; bh=DeeXP5VTRAaxBpRd5mSKpS9jcefo3GPkzMjxSmfNmxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pp0fBinAfSAERaH+4GMK9+su2zRdcdSsv6MOvALzgktaheLoMKrQ6T4cii4dcsXm6
	 cm8NTsibWj8CenWDa8KVg8LzXKEIRur5kVtj095fytxsJ0RlBjy1VgL7lDzLEpFVzf
	 OMEXSJBomvM/JSvQWC/oz3gdFzrXQeuE3VwPANQk=
Date: Mon, 7 Sep 2026 19:06:33 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	=?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH RFC v9 02/25] set_memory: Introduce set_memory_pkey() stub
Message-ID: <ap694bZb0crWvLo3@a079125.arm.com>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-2-743ad31b2c8f@arm.com>
 <apbiQtt-cAlLkDqV@a079125.arm.com>
 <66270f42-931f-4043-b24c-edcc4cad74b8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66270f42-931f-4043-b24c-edcc4cad74b8@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_063639_687034_765E9086 
X-CRM114-Status: GOOD (  31.82  )
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

On Thu, Sep 03, 2026 at 06:41:33PM +0200, Kevin Brodsky wrote:
> On 01/09/2026 16:33, Linu Cherian wrote:
> > Kevin,
> >
> > On Tue, Aug 18, 2026 at 03:08:44PM +0100, Kevin Brodsky wrote:
> >> Introduce a new function, set_memory_pkey(), which sets the
> >> protection key (pkey) of pages in the specified linear mapping
> >> range. Architectures implementing kernel pkeys (kpkeys) must
> >> provide a suitable implementation; an empty stub is added as
> > Could you make it explicit here why we are restricting this only
> > to the linear mapping range ? Would be helpful to add the reasoning
> > in the commit message and as comments.
> >
> > Essentially we are also making a assumption here that there are no
> > aliases to the linear map ?
> 
> We're not assuming this, this function is called on pages that are also
> mapped as part of the kernel image. But indeed it ignores aliases,
> unlike e.g. set_memory_ro(). Really its name is wrong as discussed below.

Just trying to understand, does it also imply that we dont have use cases that has aliases.

> 
> >> fallback.
> >>
> >> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> >> ---
> >>  include/linux/set_memory.h | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> >> index 3030d9245f5a..7b3a8bfde3c6 100644
> >> --- a/include/linux/set_memory.h
> >> +++ b/include/linux/set_memory.h
> >> @@ -84,4 +84,11 @@ static inline int set_memory_decrypted(unsigned long addr, int numpages)
> >>  }
> >>  #endif /* CONFIG_ARCH_HAS_MEM_ENCRYPT */
> >>  
> >> +#ifndef CONFIG_ARCH_HAS_KPKEYS
> >> +static inline int set_memory_pkey(unsigned long addr, int numpages, int pkey)
> >> +{
> >> +	return 0;
> >> +}
> >> +#endif
> > Would be better to make this (linar map range)constraint on the API name or that passed
> > as a boolean flag ?
> 
> Indeed, in fact I've been thinking about renaming this function for a
> while and I've already done it locally :) It'll be set_direct_map_pkey()
> in the next version.

Okay.

> 
> > Also, it would be better to have the __is_lm_address checks in this generic wrapper which
> > then calls arch_set_memory_pkey ?
> 
> That's not unreasonable, but such pattern isn't used by other functions
> in set_memory.h and I'd rather not deviate too much without a good reason.

Ack.
> 
> - Kevin

