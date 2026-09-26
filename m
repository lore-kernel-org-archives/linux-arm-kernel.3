Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D4FC98335
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 07:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrw6MYauCv8ojbkVGE0/DH1V6nBqh+BVfWF8V89VP1s=; b=sUrKYnd7daY5syaiQtmkZx6so+
	76BKKPrc8EuHJ2NslIbAzIiHZKB6IxZ4WucncxFkZO4EwFI9WNk102Ic4e787qRBiSut4skO4vRPg
	ebwNrk5gZFm0UD8PnS77BW+L/UNUEYi0ij1IaEK0wVjsd+u/owR9NUHsACIF6cVlUEqPeIH5XtdgP
	Kz7IaxQy6xo0HJlqaprL16CsifCMtEKmQhIHZcqQHJK8ujCCtL2kN0Xg81O67Kj4Eu+C34nOYLb5l
	AyEdV6aPD5bwEEEUlT/sbxXoU/+sgXZjzWtIZz/uINxAoT6cG8GeoXaPUoujrLNVH9m0vOgcFNCzr
	HxMYpdVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAN7m-0000000F7aG-0uuD;
	Sat, 26 Sep 2026 07:47:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAN7k-0000000F7ZS-1REU;
	Sat, 26 Sep 2026 07:47:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 788B943C06;
	Sat, 26 Sep 2026 07:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F58A1F000FF;
	Sat, 26 Sep 2026 07:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790408827;
	bh=wrw6MYauCv8ojbkVGE0/DH1V6nBqh+BVfWF8V89VP1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OLfMscGBr6BX8Yna19+gsaP22UJ+VC6W76Sm1UE/FlcJ15iqFYFvbP8d90Igg0AX1
	 etwZZWvdBFqYZ7NSvihHp+SwEwBuk701GAxfmSO6piNYjNYiaHlu046T9GjwlMO2xf
	 4c1bAB9kwCau4RjnCCKk9fIPdqnFDhybBXluZ4npAQ+/Qvix5ljL2AzBzj8Usd+RJB
	 alu3Ul+qNVip0JJyq+c0VPs71CaO7MwDN5xY42FOblZ0wy/sGg+Vkn4Rt8NPoSJNVK
	 MPrtXSD7KUf/JpSLiGjV6OU4NBwSkGGFUelmNzH6itp7ArEwWPKw0np5F/RZkSk9Pv
	 v3y9vQMfZ/lsg==
Date: Sat, 26 Sep 2026 10:46:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] arch, mm: promote DEBUG_WX to CHECK_WX
Message-ID: <ard4bg-fJZUwlZav@kernel.org>
References: <20260925-direct-map-verify-wx-v1-1-7fd2f7d6d23b@kernel.org>
 <c8bd5eb2-d411-4b11-8f51-1309374bd466@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8bd5eb2-d411-4b11-8f51-1309374bd466@kernel.org>
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

On Sat, Sep 26, 2026 at 08:47:50AM +0200, Christophe Leroy (CS GROUP) wrote:
> Hi Mike,
> 
> Le 25/09/2026 à 11:53, Mike Rapoport (Microsoft) a écrit :
> > Verification that the kernel does not have writable + executable
> > mappings is about detecting security risks rather than a pure debug
> > feature.
> > 
> > Major distribution configurations enable it in their kernels as well as
> > defconfigs of most architectures that have ARCH_HAS_DEBUG_WX.
> > 
> > Rename relevant generic configuration options to use CHECK_WX and move
> > their definitions from mm/Kconfig.debug to mm/Kconfig.
> > 
> > For arm that does not widely enable it, only rename its variants of the
> > config options.
> > 
> > Enabling CHECK_WX adds a few kilobytes to the kernel binary and while
> > the added size can be slightly reduced with churny updates of
> > architecture implementations of ptdump, the core functionality takes
> > most of the added size. It cannot be moved to .init.text because the
> > verification has to happen after init sections are freed.
> > 
> > With this, make generic CHECK_WX default to STRICT_KERNEL_RWX while
> > still leaving users targeting small kernels the possibility to opt-out.
> 
> Looking at how it is done in powerpc I have some doubt with your reasoning.
> 
> ptdump_check_wx() will report regardless of CONFIG_DEBUG_WX:
> 
> 	if (st.wx_pages) {
> 		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found\n",
> 			st.wx_pages);
> 
> 		return false;
> 	} else {
> 		pr_info("Checked W+X mappings: passed, no W+X pages found\n");
> 
> 		return true;
> 	}
> 
> The only difference is we won't get the WARN_ONCE():
> 
> 	WARN_ONCE(IS_ENABLED(CONFIG_DEBUG_WX),
> 		  "powerpc/mm: Found insecure W+X mapping at address %p/%pS\n",
> 		  (void *)st->start_address, (void *)st->start_address);
> 
> 
> And I believe a big fat warning like this is a debug option not to be
> enabled on production kernels.

It's arguable that this indicates a security risk and you want to see it in
production as well. And on many major distros DEBUG_WX is on, so you do
have it in production.
 
> So I think we should instead do:
> 
> diff --git a/include/linux/ptdump.h b/include/linux/ptdump.h
> index 240bd3bff18dd..714f63fb604a0 100644
> --- a/include/linux/ptdump.h
> +++ b/include/linux/ptdump.h
> @@ -33,7 +33,7 @@ bool ptdump_check_wx(void);
> 
>  static inline void debug_checkwx(void)
>  {
> -	if (IS_ENABLED(CONFIG_DEBUG_WX))
> +	if (IS_ENABLED(CONFIG_PTDUMP))

I don't think we should change that.
It's up to the architecture how they want to report it. If an architecture
wants to keep the warning only for debug it should convert WARN_ to
VM_WARN_.

What we actually should change is debug_checkwx name :)

>  		ptdump_check_wx();
>  }
> 
> 
> That way you should get (untested) the following warning but not the big fat
> debug WARN():
> 
>   Checked W+X mappings: FAILED, %lu W+X pages found
> 
> Christophe
> 

-- 
Sincerely yours,
Mike.

