Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40938CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 09:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3c05gl0H/GpWSA6qaxgxfypMYcQADyQffOHZBAKPcvc=; b=NYTTJH2Ymmq13t6CnFzW6fGWBU
	zHh43Cxcc8F3+iqGCfnGdA+wVY5hFdG/AbTcpfLe9gAqrmma6+orCRH3HR8qgCSDp8GfROQgtkdXJ
	K5NZhxeU1CdBWp7cXlbiFxEo7PDbgFmpRw/c8NEwbgcIwm8KHgl6gFFGkpaIkSOlH6EchYwGEkgfG
	Ql1j8JcsVBy/lZ6EzrTFHZidcSzejtZapDIbUAmWmvLNg6mg5eU6PEETlohfhS0BoJSsd47Paj9Q4
	UstW9lpXNMGsLU9j3n2zfdsLN0/BEvEYAXIPj8PcOCZndyE99kG/SCcWmc9Tn9Fqrjtu8rLXlekbt
	5vH9AY3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLqH-0000000AGxa-1Iiu;
	Fri, 22 May 2026 09:06:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLqG-0000000AGx4-23ST
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 09:06:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6DBB60136;
	Fri, 22 May 2026 09:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701E21F0155D;
	Fri, 22 May 2026 09:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779440809;
	bh=3c05gl0H/GpWSA6qaxgxfypMYcQADyQffOHZBAKPcvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AHh9Mvku4Tnd8U5EQXKfG07xtqXD/gmOXK6xZTxiIvJAiMFkn1FNVmOhV3MWPz75/
	 IV9zCMOtUNQoilLVACbSZK+6EbGvqrV5e1yPfiLurnr2w835AOHAnwWn2FeYnpdyPC
	 fhxUWLFapRiDSRH2XCyrWgKKh58W3k075AIgm7/R4TgvNhK5wwhclvtlNGngiQjS3a
	 8cPy7dmRejgOL+ZiWJjl6IzW4cEoNz5h+OsGrMMS+AA8hglPmkdWuQ+LPZzi5AbFJI
	 epMFfBExLfqLf6f4l8USRqpiRmVtZyXHsW2kjK3jYOy5jDOEQO77z5X28B5fJPEHYd
	 LKQBvrIrMTVsw==
Date: Fri, 22 May 2026 10:06:42 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 2/2] irqchip/gic-v3-its: Use GFP_ATOMIC_RT gfp flag in
 allocate_vpe_l1_table()
Message-ID: <ahAcWjiPbf-V554w@lucifer>
References: <20260520204628.933654-1-longman@redhat.com>
 <20260520204628.933654-2-longman@redhat.com>
 <861pf3x3hc.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861pf3x3hc.wl-maz@kernel.org>
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

On Fri, May 22, 2026 at 09:17:35AM +0100, Marc Zyngier wrote:
> On Wed, 20 May 2026 21:46:28 +0100,
> Waiman Long <longman@redhat.com> wrote:
> >
> > A longer term solution is to defer the allocation to a later stage of the
> > hotplug pipeline where interrupt isn't disabled.
>
> And that's what needs doing. Not papering over this in a bizarre way.
> I proposed a potential solution a few months back, but didn't get a
> chance to work on it. If you have the bandwidth, that's the way to go.
>
> But papering over this issue this way seems like a bad case of short
> term and unsustainable hack.

Yes, agreed. It really smacks of trying the fix the problem at the wrong level
of abstraction.

>
> Thanks,
>
> 	M.
>
> --
> Without deviation from the norm, progress is not possible.

Cheers, Lorenzo

