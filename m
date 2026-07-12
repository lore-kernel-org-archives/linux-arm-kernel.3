Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CBDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 08:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDe2roBwGlbGNLfIylYtCXE90pGvdrMhNrHyux+rp2c=; b=bn/zvS4j/0RB/hcx/4fviIRzt7
	kgYOkrOL7pvCr/U3SKxZ5qkeoCNaw4RLI8UFLQcMiAy7iLu1C3o1ESJ6prFjCfSCFBMfomTV+5NHO
	4ypFMf3fDF7YOg1Nx0aKQqxFa9AoHuYG9VUsGcDMxzf+W99HT5z8/Od7+58o7Armlos8GL1HPt0e0
	JfbqZon5iyvY6+FgONOIpnCHkyGN31Z3ovYK9G0FKjMga8+OE9RBDZeIhUHiZTpEMDzlw+vmA2rm6
	RBLy4+UHzpHzbXkhVkjCq17AhNNg7wXcyzAXakiS/oM4gb33qWo6wBzsy8/pMQhvUMx+yhnJl3InJ
	+dWTGv5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wip8E-00000007FO8-3I1d;
	Sun, 12 Jul 2026 08:01:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wip8C-00000007FNz-3R2W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 08:01:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 63ABA6004E;
	Sun, 12 Jul 2026 08:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706E51F000E9;
	Sun, 12 Jul 2026 08:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783843302;
	bh=JDe2roBwGlbGNLfIylYtCXE90pGvdrMhNrHyux+rp2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SnCux/Zc5Sz6wi+JbQXUqQ08OdE2kieVNBoY0ZP2rJjIyDGi+Mwh+J925gW6WEXAD
	 ObL+XgBuml2lhR9Pro5gioOUQsXo8yR9KccFsZiRYaA6Sc4obLsxN350uxi89mjIYd
	 zrGI85qqVm6Sxw+V38cHDlaKVAvXBULd2Teh72jk=
Date: Sun, 12 Jul 2026 10:01:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Toshi Kani <toshi.kani@hpe.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Carlier <devnexen@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/2] mm/vmalloc: acquire init_mm read lock on huge vmap
 promotion
Message-ID: <2026071252-sweep-quirk-a068@gregkh>
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
 <20260710-series-vmap-race-fix-v1-1-5b3794c113fe@kernel.org>
 <d47ac961-4767-4ce4-9c75-f281beb24e42@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d47ac961-4767-4ce4-9c75-f281beb24e42@arm.com>
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

On Sun, Jul 12, 2026 at 01:13:12PM +0530, Dev Jain wrote:
> 
> 
> [-----]
> 
> > We also define a guard class for mmap_read_trylock() so we can use
> > cleanup.h to make the scope handling cleaner in the implementation.
> > 
> 
> Will this cause backport problems, I think this scoped guard thingy is
> not that old?

Don't worry about stable issues until after the fact.  Fix things
properly in Linus's tree first.

And scoped guard has been backported to many of the LTS branches
already.

thanks,

greg k-h

