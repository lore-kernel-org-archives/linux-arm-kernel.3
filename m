Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AC3105F7A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 12:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91RpXhmhG1y7Y3R2yiY+A7xQRPuRiR0gbkywSMYhLXI=; b=3Zue7C+8sVRgfh4oW36mfVoouC
	1O0yqJOr5HyXcapaquNFpHYSw8Y/7s7H/v4INGbzPc6W/uTpj34jtdTPcwVSqm4JSoeMUMUvNr1K6
	JF235B6bxRNWH8yvQXQdxu75NHLcGx6OKjeHNF+/U0B9jC59mlSgAk6WBYJaSIAxA42wF7wL34lLn
	5hCl6sech763IlvW0C79/bUaFZRl7P7jRUOaD8eUNZtVEry1klvVeQSOPQZ8OVEgtT1gIL9Jut3Ez
	LK3ZKgu0BXT0pGPhHnjfYiQHcZfitEvD4PKv5Kx5jIOkgTP81liHOobN/qSMJzEp5MB/OVUO5gEZd
	tFnKSgQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11Ou-000000005Uz-2Zdw;
	Fri, 13 Mar 2026 12:13:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11Os-000000005UW-3ocR;
	Fri, 13 Mar 2026 12:13:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F053660142;
	Fri, 13 Mar 2026 12:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E0DC19421;
	Fri, 13 Mar 2026 12:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773404033;
	bh=YTSstfxoFHiBrx/2m0P/t3MkgTKyeJ4OyC8gGdFgfg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DB6dRsTQ08n3qOo3LbHGR1u+n0kWeOhSwb+ENV+XLmec/F+YIQ0TbkSpcxXc4SxOp
	 vHeCf5xRAJLRPuA8hMqRPDPvUtF/PM2u9MLhTGgfq0Ae11MF9gBBhHXccmzR/v45mn
	 xB0zSI5yzSzGTansN0d4x/wNLnx0ndS+Dl4B+JhsaH2l6nIzblj937L039TmtA4rml
	 Dr6J3+ATKRtvGj3D+6JSEUu1hbMWQTHb7OHl+ygHlVZiX0nXmiZRiVxI/hdDdKQZaN
	 hT2R8s+ucuXlNHEKl1rR953D/AJ1NweqQI8U1F2poQTAT5Z/pBYTS88vUfrR7KVI0X
	 7ogwZcTeTjd3A==
Date: Fri, 13 Mar 2026 12:13:42 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Clemens Ladisch <clemens@ladisch.de>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Bodo Stroesser <bostroesser@gmail.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH 01/15] mm: various small mmap_prepare cleanups
Message-ID: <fa6bf4b1-b4da-4679-bd4d-7a0884b45fbb@lucifer.local>
References: <cover.1773346620.git.ljs@kernel.org>
 <56372fe273f775b26675a04652c1229e14680741.1773346620.git.ljs@kernel.org>
 <20260312141425.1837736829210f2d0b00cac6@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312141425.1837736829210f2d0b00cac6@linux-foundation.org>
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

On Thu, Mar 12, 2026 at 02:14:25PM -0700, Andrew Morton wrote:
> On Thu, 12 Mar 2026 20:27:16 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:
>
> > +int mmap_action_prepare(struct vm_area_desc *desc,
> > +			struct mmap_action *action)
> > +
> >  {
> >  	switch (action->type) {
> >  	case MMAP_NOTHING:
> > -		break;
> > +		return 0;
> >  	case MMAP_REMAP_PFN:
> > -		remap_pfn_range_prepare(desc, action->remap.start_pfn);
> > -		break;
> > +		return remap_pfn_range_prepare(desc, action);
> >  	case MMAP_IO_REMAP_PFN:
> > -		io_remap_pfn_range_prepare(desc, action->remap.start_pfn,
> > -					   action->remap.size);
> > -		break;
> > +		return io_remap_pfn_range_prepare(desc, action);
> >  	}
> >  }
> >  EXPORT_SYMBOL(mmap_action_prepare);
>
> hm, was this the correct version?
>
> mm/util.c: In function 'mmap_action_prepare':
> mm/util.c:1451:1: error: control reaches end of non-void function [-Werror=return-type]
>  1451 | }

Seems different compiler versions do different things :)

In theory we should never hit that but memory corruption and err... rogue
drivers? could cause it ofc :)

Will fix on respin.

>
> --- a/mm/util.c~mm-various-small-mmap_prepare-cleanups-fix
> +++ a/mm/util.c
> @@ -1356,6 +1356,8 @@ int mmap_action_prepare(struct vm_area_d
>  		return remap_pfn_range_prepare(desc, action);
>  	case MMAP_IO_REMAP_PFN:
>  		return io_remap_pfn_range_prepare(desc, action);
> +	default:
> +		BUG();

I'd probably prefer a WARN_ON_ONCE(1) return -EBLAH; will think about it on
respin.

>  	}
>  }
>  EXPORT_SYMBOL(mmap_action_prepare);
> _
>

Cheers, Lorenzo

