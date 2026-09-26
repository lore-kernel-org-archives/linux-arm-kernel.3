Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70B4C98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4bWsh+Pc9s6sIGPF4Grv7BRltIPfKgjNpbCy4AEEXA=; b=s2aD8UnTBAIOd4SWylbY2Mn0UB
	115yUjKmax5C7wJsNIaXIZwYRqWTDjJ1f3ulfS2UGH/pdZCwYLQ+fZeachBkqLYj3TM8uZo4dIWB/
	gmjwpiAnGg2F4XQGsMvEYxZhn4dJm/+xASouhQFTaX3JtZNnVwgpNHMNjbWXu3dqKuP5gEd0YfkNF
	LOu4oBuSA2dCO436wB7fRMNMH6sG/Vsluxjo6YqCfAn3jqpxXlMA1X8eDIS1RNiVrOd4ESqSNIz55
	s+w9WXAE67d4WlkHXYoS3tlYRlCCIFFiPFzFhInVaWhrxwB4+gYn9G0wWbJzNQBf8tEVMtrzqWDRE
	KXljUKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAOVq-0000000FBmi-2YTk;
	Sat, 26 Sep 2026 09:16:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAOVp-0000000FBmW-1ZjX;
	Sat, 26 Sep 2026 09:16:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8459343D1D;
	Sat, 26 Sep 2026 09:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6591F000FF;
	Sat, 26 Sep 2026 09:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790414163;
	bh=N4bWsh+Pc9s6sIGPF4Grv7BRltIPfKgjNpbCy4AEEXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i/cy2uAqCW0oNOWoQHl6gMve0xGBebGA1qmqR1XrS9a5R9KjUOKFr6umhqPOwVAfq
	 JV6o+g9ZbwsyFiC1yXxh+8YSz9r3KSw26jRgxGioo81b3ckcBjRXINtVkE5FLLobZm
	 cEXp3py7fiL/jCemhyNfo4o04u6qGas4PLNjGw3xPqVwYER6r75qK1Kpvp2M23DpoY
	 0BBb6c0Da8U0FS8/BGW5K1g9Jfq3Q/44IR7oFF8xFbzjaFcMlW6oTmaVRUNooMJemG
	 74S09dqAtiFGHl507QSUC4HwsG7rqGMANSDx0f//8KLgYHgnF7DXbYK/029YJkc1x3
	 aMwcgwNgXEt7w==
Date: Sat, 26 Sep 2026 10:15:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Ingo Molnar <mingo@redhat.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] arch, mm: promote DEBUG_WX to CHECK_WX
Message-ID: <areNQfnAdkfR8fAf@gremlin>
References: <20260925-direct-map-verify-wx-v1-1-7fd2f7d6d23b@kernel.org>
 <91d800d6-03f3-4068-8c12-618529a81528@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91d800d6-03f3-4068-8c12-618529a81528@kernel.org>
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

On Fri, Sep 25, 2026 at 01:01:51PM +0200, David Hildenbrand (Arm) wrote:
> On 9/25/26 11:53, Mike Rapoport (Microsoft) wrote:
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
> >
> > Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
>
> Makes sense to me
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Similarly LGTM so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo

