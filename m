Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF91AD0C5F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oyz3AH73jsvhVuXMvukfXv65WS9wp+HqrXkM26N9vJA=; b=GWLceYazbyfvOdvVOBx7ipajxZ
	LWZgv7KRXvBIXfSn3uub3NUx2wLcMWtR1wRj89loesbbhNvQcNLX5mB1S3Eo2MqqU3yHCgiGE5/6u
	eYNhE1JFvy3W23GqPVeJW7MrEOogpAG1ppLvGxe28HvmCxPBHOruDCoBO0IYZJ1GwLpn9qW6oNxra
	qriDfq/iO6Gpv6LBV5AaWqrxpOU+ILgAcRJbWpu0NaiLjv9rZ6LSY04CHLXsBpZHFo1nptkjlnq09
	n3Gd0CfozIsJNCH2TgvE/smw39C8wLRcO38QveSdLHlTWSUUqCnFvD1zhtZ5JqUGoi6PcC70JaEi+
	yb+w4Iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4H87-00000003HUr-26pq;
	Fri, 25 Oct 2024 10:01:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4EyD-00000002pxx-2pN0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 07:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Oyz3AH73jsvhVuXMvukfXv65WS9wp+HqrXkM26N9vJA=; b=V0NHcwcsuxdvKzX6wLX6w2QjPl
	hwQ9HeHnsPa5m5iToxLcJVUcjwqRu15DO9EAUV0QQzHoW3FWDTkDPB146XOSRbDixULZZdd+sQoB/
	h759sk759Vnxe5iEa6rXDG93SYvAR49+cFxWSPGN+ca9AneGxFt/XCATxAuW/SaGe9WgUvJm0qvTk
	aMF0lxHntpStWCNittH0792WL+K3Ce5zCswq7V2gj2gEyAGSPIKR1sTiU66iCQWBs+4T8fXkJnG1a
	oztq3Xiu24GdhNPG+DtUtRRQvh3z/QNC3n9ZAsVeO6XEVqTjzAFvaraslBH0Il5ZSY30n5Q4UjhSx
	GFrYWFHg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ey4-00000008r2u-41M1;
	Fri, 25 Oct 2024 07:42:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 96CFE30083E; Fri, 25 Oct 2024 09:42:44 +0200 (CEST)
Date: Fri, 25 Oct 2024 09:42:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v3] Avoid memory barrier in read_seqcount() through load
 acquire
Message-ID: <20241025074244.GB14555@noisy.programming.kicks-ass.net>
References: <20240912-seq_optimize-v3-1-8ee25e04dffa@gentwo.org>
 <20240917071246.GA27290@willie-the-truck>
 <4b546151-d5e1-22a3-a6d5-167a82c5724d@gentwo.org>
 <CAHk-=wgw3UErQuBuUOOfjzejGek6Cao1sSW4AosR9WPZ1dfyZg@mail.gmail.com>
 <CAHk-=wjdOX0t45a7aHerVPv_WBM3AmMi3sEp8xb19jpLFnk0dA@mail.gmail.com>
 <20241023194543.GD11151@noisy.programming.kicks-ass.net>
 <e9fd5ba0-bd84-76a8-a96e-1378c66d0774@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9fd5ba0-bd84-76a8-a96e-1378c66d0774@gentwo.org>
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

On Wed, Oct 23, 2024 at 04:42:36PM -0700, Christoph Lameter (Ampere) wrote:
> On Wed, 23 Oct 2024, Peter Zijlstra wrote:
> 
> > > I doubt anybody will notice, and smp_load_acquire() is the future. Any
> > > architecture that does badly on it just doesn't matter (and, as
> > > mentioned, I don't think they even exist - "smp_rmb()" is generally at
> > > least as expensive).
> >
> > Do we want to do the complementing patch and make write_seqcount_end()
> > use smp_store_release() ?
> >
> > I think at least ARM (the 32bit thing) has wmb but uses mb for
> > store_release. But I also think I don't really care about that.
> 
> The proper instruction would be something like
> 
> atomic_inc_release(&seqcount)

It would not be, making the increment itself atomic would make the whole
thing far more expensive.

