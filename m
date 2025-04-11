Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F75EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8kqyz6og+ZMgE1hCg0zVwCVFyJJKQx+pa3IKv8VCIA=; b=CQbeDXquLfP6sOWibNjQDZZ7Gv
	bmLJ1icK68XkERFdMcyejpXPpH4Pr506Gt8zD3Oi3u1QPfJ1DF53HO+rGIGvQVS7fm5hsFYqnINqe
	zRtG73i5t8osXCcoR3E/+P7bFfREVBfnb3TeuqM6t5E9Zh1iWibVe+0PQlyNesJHako/J3hLmtyra
	v8TC7CnG2DdNrTqNaI4Dt2cWUjgT5+/sRvcp3TIHlMAgtS4w6+0sViad4Pz0JOnaIjpZ5g6Q7goyS
	h8VYUo6FlhBnFiiNFASaSlewMX8aNeA1jFl3aZ01BaysEHuMs+JRrlsu6cf5qhWAH2k4e5Z0urUdt
	k9FL6AHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DuF-0000000DopS-0Xmn;
	Fri, 11 Apr 2025 12:54:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DdQ-0000000DlUq-1v49
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:37:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1F0A6A4AAFB;
	Fri, 11 Apr 2025 12:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7698AC4CEE2;
	Fri, 11 Apr 2025 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744375047;
	bh=Mkt4qwEL6YZZPNOG+fEpra9ZqeqLpa49F4xR9I37838=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnv/jlUVLyD5vk/IaJ1ada8t08ATiZdgJxHz/RdcuXsdj+gyFU7hOuNkqMTIsyd4w
	 Yyv+ruvjy8kL51NOhv95ua7VxZbm5JYxkqP6hUqV4MYgL7CFgrt7Mt1ilO8bga3tZU
	 yLFrymZuRPK/Q0PTYjg+/02u4T3Oy+g6OgnVDuZTV75CMiRcUATUd/fWyTHwW+ZxtV
	 eNmEtAUhetYQMFPXOKtEgD6WIOkDy/Qn0uBlawp1dQ53CrzQCXPi0XGZKByDw4qpPi
	 iVeHisRqPtNphh4uzdQFvAlHJ48QxWeCkiEPh/KpXQlrxWNTOralCrQ+YqIYr20AkF
	 YV7YQ/Gv++Z7Q==
Date: Fri, 11 Apr 2025 14:37:19 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Liam.Howlett@oracle.com, ast@kernel.org
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <Z/kM/+uBsD9DAGjF@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <Z/jgL52ZVdcxTEkP@lpieralisi>
 <87plhjrpit.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plhjrpit.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_053728_631238_FFA44524 
X-CRM114-Status: GOOD (  27.38  )
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

On Fri, Apr 11, 2025 at 11:55:22AM +0200, Thomas Gleixner wrote:
> On Fri, Apr 11 2025 at 11:26, Lorenzo Pieralisi wrote:
> > On Tue, Apr 08, 2025 at 12:50:19PM +0200, Lorenzo Pieralisi wrote:
> >> Maple tree entries are not used by the driver, only the range tracking
> >> is required - therefore the driver first finds an empty area large
> >> enough to contain the required number of LPIs then checks the
> >> adjacent (and possibly occupied) LPI ranges and try to merge them
> >> together, reducing maple tree slots usage.
> >
> > The maple tree usage for this purpose is an RFC at this stage.
> >
> > Added Alexei because I know BPF arena used the maple tree in
> > a similar way in the past and moved to a range tree because
> > the BPF arena requires a special purpose mem allocator.
> >
> > As Thomas already pointed out a plain bitmap could do even though
> > it requires preallocating memory up to 2MB (or we can grow it
> > dynamically).
> >
> > We could allocate IDs using an IDA as well, though that's 1 by 1,
> > we allocate LPI INTIDs 1 by 1 - mostly, upon MSI allocation, so
> > using an IDA could do (AFAIU it works for 0..INT_MAX we need
> > 0..2^24 worst case).
> 
> The point is that you really only need a 1-bit storage per entry,
> i.e. used/unused. You won't use any of the storage functions of maple
> tree, idr or whatever.

IDA does use the XArray entries (i.e. the pointers) to store bitmaps,
the only drawback I see is that it allocates IDs one by one (but that's
not really a problem).

I wonder if it is used in the kernel for IDs larger than 16 bits, it
should work for 0..INT_MAX.

> So the obvious choice is a bitmap and as you said, it's trivial to start
> with a reasonably sized one and reallocate during runtime if the need
> arises.

Yes I can do that too but to avoid fiddling with alloc/free ranges crossing
bitmap chunks we need a single bitmap, AFAICS that may require realloc+copy,
if the need arises.

> The reallocation happens in domain::ops::alloc() which is fully
> preemptible context, i.e. no restrictions vs. allocations.

Yes point taken.

> For the top-most domain, the callers hold domain::mutex, which excludes
> concurrency vs. ops::alloc/free(). If the bitmap is in a domain further
> down the hierarchy then you need your own mutex there.

Thanks for confirming Thomas, I do rely on the topmost mutex to be held
for dynamic IST table entries updates (LPI top domain).

Thanks,
Lorenzo

