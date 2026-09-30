Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D58CCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbSovUZb/MlZhj2tEhZiGj8CNPVmvAH3i/Z0nTxFLdg=; b=gbTJcfR3Tha3E8wNqBJq/WX8PS
	HNhgfZbxsK+n4aQKipL8FRS5wXvDTKRYshXw8MR7l8lFoE0ekExupoO7CpTDWBfBKgmc015gdVtEk
	w1cQwhxHyGvAa9ai/mNWcjgGTjPKUeGiZ7KqeVwuJpIHliC2zj3/0iHdIL4rzhE36HhqszOFWmBhc
	FkmEDK/Wg+i2lxyXwIi+s+uxqM1uVGDlblDIs/RiOI/IzaFnzjIB1yqny0gp18C6XSmteOdyhL+H/
	2WpCUVw788nViEmWweAyeGqtSYa6qvMhVJEhF1Ed3r7isK3AQZLCnQNTNtw8RfeZmaKZiy89w1N+j
	06venYQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpWl-00000005P4I-0LO8;
	Wed, 30 Sep 2026 08:18:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpWj-00000005P3u-41M9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:18:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 16EA3600D4;
	Wed, 30 Sep 2026 08:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AB61F00893;
	Wed, 30 Sep 2026 08:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790756336;
	bh=nbSovUZb/MlZhj2tEhZiGj8CNPVmvAH3i/Z0nTxFLdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JOTpVC04wh5pGOAwB+akNvtPI/EaJ/sGBV5jUBqBgrdaZmq4W7GXQAkE+Wu2KInW5
	 jRDnHo3ofu3EWnP34hEd6e2A7PdYH454fghF/agQnD8YU4tyzjkhuySfIcbK8ri5gR
	 e908gdDcPHTJ2Lsw806HNc8ZkXRpczhaHl8l0ZmdGYp9jtsvPTUh0VjNTD0ir1+wc7
	 JTmAkePd/1/+vxicYMbNTbATdOJJVfFHXGfal0pB6qvAq0yKINxjcgOKQcaQVE+kXN
	 CzfpJDFSeYHUa2feuXIHtDJOHBzChvR2meGHR/kaHhE753kfTeGj1A5m06OmVyVmGa
	 Zbl62QeRGrrRQ==
Date: Wed, 30 Sep 2026 09:18:47 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andreas Grapentin <gra@linux.ibm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Friedrich Welter <fritz@linux.ibm.com>,
	Fuad Tabba <tabba@google.com>, Gautam Gala <ggala@linux.ibm.com>,
	Hariharan Mari <hari55@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>, Nico Boehr <nrb@linux.ibm.com>,
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v8 16/29] arm64: Share arm64 headers with s390
Message-ID: <arzF5y2C0eMDQYwE@willie-the-truck>
References: <20260918133107.1042730-1-seiden@linux.ibm.com>
 <20260918133107.1042730-17-seiden@linux.ibm.com>
 <arqQ2Eat4VUBbl49@arm.com>
 <20260928162345.428362-C-seiden@linux.ibm.com>
 <ars6Jh5DiendDT7G@li-d8547bcc-2d90-11b2-a85c-a70f2a37009a.ibm.com>
 <arvunF8epgpWh1YT@arm.com>
 <20260930072803.664031-A-seiden@linux.ibm.com>
 <865wzn41h6.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865wzn41h6.wl-maz@kernel.org>
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

On Wed, Sep 30, 2026 at 08:55:49AM +0100, Marc Zyngier wrote:
> On Wed, 30 Sep 2026 08:28:03 +0100,
> Steffen Eiden <seiden@linux.ibm.com> wrote:
> > 
> > On Tue, Sep 29, 2026 at 06:00:12PM +0100, Catalin Marinas wrote:
> > > On Tue, Sep 29, 2026 at 06:19:20AM +0200, Andreas Grapentin wrote:
> > > > On Sep 28 26, Steffen Eiden wrote:
> > > > > On Mon, Sep 28, 2026 at 05:07:52PM +0100, Catalin Marinas wrote:
> > > > > > On Fri, Sep 18, 2026 at 03:30:53PM +0200, Steffen Eiden wrote:
> > > > > > > +# Enable all code shared to s390
> > > > > > > +KBUILD_CFLAGS	+= -DARM64_S390_COMMON
> > > > > > > +KBUILD_AFLAGS	+= -DARM64_S390_COMMON
> > > > > > > +KBUILD_CPPFLAGS	+= -DARM64_S390_COMMON
> > > > > > 
> > > > > > Do we actually need these defines? They seem only to be used as markers
> > > > > > for the awk scripts to extract the definitions. Why do we need the C
> > > > > > preprocessor involved at all? Could we not just have comment markers:
> > > > > > 
> > > > > > /* ARM64_S390_COMMON_BEGIN */
> > > > > > ...
> > > > > > /* ARM64_S390_COMMON_END */
> > > > > >
> > > > > No technically we do not need those. They could be useful if we find out
> > > > > that AWK is the wrong tool and move to a C Preprocessor + diff based
> > > > > approach. 
> > > > > 
> > > > > if the ifdev is not closed the compiler will complain, but an 'arm did
> > > > > not destroy us' verifiaction tool ( I will send one soonish) could do
> > > > > the same.
> > > > 
> > > > iirc the last time we discussed this we didn't think that load-bearing
> > > > comments were the right tool here. We also briefly floated the idea of
> > > > using a #pragma region based approach, but in the end we went with the
> > > > #ifdef preprocessor directives instead, as the least invasive
> > > > non-comment marker that was available.
> > > 
> > > The downside is that the macro affects the preprocessed code. We need to
> > > ensure they don't leak in uapi headers for example. Not a fan of this
> > > approach but I don't have a better suggestion either. At least we could
> > > write them as:
> > > 
> > > #if ARM64_S390_COMMON == 1
> > 
> > This is a great idea and an improvement. Thanks.
> > 
> > @Marc: Shall I sent a v9 of this series or do you want to pick v8 and I
> > send this as an improvement once picked?
> 
> Please send a v9. That's invasive enough that it warrants it.
> 
> > > It would also be useful for the awk scripts look for the paired #endif
> > > rather than relying on the comment at the end of the line. Otherwise
> > > it's not really different from just sticking to comments.
> > > 
> > 
> > Are you suggesting that the AWK scripts should track the #if% and #endif
> > in the code and warn or reject if the marked endif for the shared code
> > does not match pairing with the starting #if? That makes sense yes. I'll
> > investigate and would add this as an improvement later on.
> 
> I think the suggestion is to teach the script about the #if/#endif
> nesting, and therefore to not require the trailing comment on #endif
> (i.e. the script acts as a normal cpp).
> 
> It should only be a matter of counting the #{if,ifdef}s and #endif
> past the ARM64_S390_COMMON guard.

Yeah, and the check on the comment anchor could still remain as a rough
consistency check.

Will

