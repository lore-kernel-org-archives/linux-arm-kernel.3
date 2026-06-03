Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15415CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXEjc/5hFRDYA1JmIf1Nf0sHw2o3MsqDWZosJ8VPs34=; b=hyE/e6JwExoTXIQ6xeZX0eeaUV
	Ac2t1pzlqmBLMLR0G6QXTcPKu8uyunAcYhKz795LWqS4uxWFQfBenAha6duJldTYnUmxatBhntvuq
	2bsq1VjcD6siAWlns5VaSWgercZgTjWHVSsxjEFJeyuKBP24Xut/xVuhTe4eViekRufS8GBq+OaEY
	eE/iOfsFaJpRsOZvemp2q4M1gIA/9bwvsepa8dB5B38+Ahhi/NxDSv7fUEORIhAqjOEEVuFllbo1P
	kQy89DKfPTdrNM/caqj6puYPHfuShBFCDWrIujlPT9/5FXzxSfYjNjmZjktDcMH01IufITxfVNJB4
	lQ0nBFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjg4-0000000EvZP-05T1;
	Wed, 03 Jun 2026 11:22:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjg2-0000000EvZE-1qyc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:22:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B19D60052;
	Wed,  3 Jun 2026 11:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB941F00893;
	Wed,  3 Jun 2026 11:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780485745;
	bh=cXEjc/5hFRDYA1JmIf1Nf0sHw2o3MsqDWZosJ8VPs34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nOUzc5Op+hlkXIq555+AjTA9AOIZ7Z/YhcVbMSB4YwqOyXHfvGEboKFwb1vMLFt7z
	 rgKJtmrr9RSDpWZVJgclHeFWHWqp6QeZ+OTN48bM6NozoU4da0Hk9Gt2Y/JcudJEq2
	 GUczLX4n71GwBEEel4mmlmoZUS9yEwOF0baAxVKlshP+xIZDOeW+gOltyQf0EeJOxa
	 v1kSlqwBO+BJhMb/5PBSK1Cte2N6RJllzVJUPROBTzHF2O2Db4t8JgXrZllrcxfwyR
	 iQ0iWfIYE/MAD2Xc8q8C2xQaw0gMJu5BOUJL2/LSuVWBwP1A5hpdzljfWlbC8DcGez
	 f+NxByEYGWbkg==
Date: Wed, 3 Jun 2026 12:22:17 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Liz Prucka <lizprucka@google.com>,
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jann Horn <jannh@google.com>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, maz@kernel.org
Subject: Re: [PATCH v7 00/15] arm64: Unmap linear alias of kernel data/bss
Message-ID: <aiAOaYwPlGEG6FML@willie-the-truck>
References: <20260529150150.1670604-17-ardb+git@google.com>
 <178041415770.4024555.11336437584927054639.b4-ty@kernel.org>
 <2c7929d4-6622-475d-af1b-bcd0cd997cd3@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c7929d4-6622-475d-af1b-bcd0cd997cd3@app.fastmail.com>
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

On Wed, Jun 03, 2026 at 10:57:49AM +0200, Ard Biesheuvel wrote:
> (cc Marc)
> 
> On Tue, 2 Jun 2026, at 22:34, Will Deacon wrote:
> > On Fri, 29 May 2026 17:01:51 +0200, Ard Biesheuvel wrote:
> >> One of the reasons the lack of randomization of the linear map on arm64
> >> is considered problematic is the fact that bootloaders adhering to the
> >> original arm64 boot protocol (i.e., a substantial fraction of all
> >> Android phones) may place the kernel at the base of DRAM, and therefore
> >> at the base of the non-randomized linear map. This puts a writable alias
> >> of the kernel's data and bss regions at a predictable location, removing
> >> the need for an attacker to guess where KASLR mapped the kernel.
> >> 
> >> [...]
> >
> > It would've been nice to hear from the ppc folks on patch 11, but I've
> > picked it up on the assumption that they'll love the negative diff stat.
> > Worst case, we can drop/revert stuff if they have late objections.
> >
> 
> Thanks.
> 
> There is a de facto ack from Michael Ellerman in the Link:, which is why
> I included it.
> 
> Note that Sashiko found an issue with KVM+MTE, where a read-only mapping
> of the zero page in the linear map may result in issues:
> 
> """
> Does moving the zero page to .rodata (or unmapping/read-only mapping its
> linear alias) expose a guest-to-host denial of service with KVM and MTE?
> When an MTE-enabled KVM guest reads an unmapped memory address, KVM handles
> the stage-2 fault by mapping the host's shared zero page. KVM will then
> call sanitise_mte_tags() in arch/arm64/kvm/mmu.c.
> Since the PG_mte_tagged flag is never set on the zero page, KVM's
> try_page_mte_tagging() succeeds, and it calls mte_clear_page_tags().
> This executes the STGM instruction using the zero page's linear map alias.
> If this alias is read-only or unmapped, won't the STGM instruction trigger
> a synchronous permission fault or translation fault in EL1, causing a host
> kernel panic?
> """
> 
> Marc seems to think it is legit, so I came up with the following (I'll send
> it out separately with another pair of tweaks):

Thanks, it also looks like we're getting some early WARN_ON()s firing in
CI from split_kernel_leaf_mapping() after applying your changes:

https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/trusted-artifacts/2571596185/test_aarch64/14662134813/artifacts/jobwatch/logs/recipes/21399931/tasks/219104268/results/1007729692/logs/journalctl.log

Will

