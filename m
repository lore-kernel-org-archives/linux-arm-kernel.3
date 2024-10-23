Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557BACFA468
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pnofjtWFRW1a3Ex4iamW6Sy5pqigg3kUWm7+B1kI9+Q=; b=B+7a27IFwkCJgaUT5KdhY/QlFj
	2Sudq11XxnHPNptSW1Q/j30G7DxtexDNYFp+G7FxIOSRJDiywYWd0mzJRq5gwIiSJwN0JEf9G+nDj
	ErFRXik9W5Bbdih8QMgs29xvVlGTaB/lordk81hasZ1trdOWMYQlyiTHvoVsW/twqFNVlEAFQd/HZ
	2ha0SHfwluLiz9cKKv0mFrmFmdzgMbfOzrJWhirgRPnHbscL4oCryH2LLiShs37WJqNh27mUn6G5f
	TFI65cbj6zPHc57mpUa+apBsnNoqpVkFS5KAjhcfKP4TMT7sDAbkmePdgFYnbAdOBA4hYEcjm1Mpy
	+Ow3aBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hh8-0000000Fmk6-3VlK;
	Wed, 23 Oct 2024 20:11:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hIk-0000000FjR3-0CFs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 19:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pnofjtWFRW1a3Ex4iamW6Sy5pqigg3kUWm7+B1kI9+Q=; b=h/yD9D/860kV5yyshWWgMIMGPr
	5Y/QxMgy8Qx7w2cTYX6kRQhdlB3KqN+MY4cNRvt94WqfJu2NixJ9fxTo1FARn0AAqDH8Vuz6Y9hDy
	yCCJe/z8FtwFDDV/NMRQtAnkEH9L7b9ZtlOem2aYepMOLYuKN1/PuTkAA4FZsxMpz0mCfVgCAuGbS
	+/bRgSqshAfX0KzU0kSNf8eN2HeVbC4k3Oic4VlOhr/Lol8SLWQ/Omq7d2xnGf5jC9cbiwoOSffm1
	MN/J8bsc2HGzEjpkaTJRCjv0ggYmOAfUtDFpWrw7IXY8d755vXZRD4V+VugCbNw/JRk7466sntgBS
	o71bzRkw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hIe-00000008XNO-3Dyc;
	Wed, 23 Oct 2024 19:45:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D8E61301171; Wed, 23 Oct 2024 21:45:43 +0200 (CEST)
Date: Wed, 23 Oct 2024 21:45:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v3] Avoid memory barrier in read_seqcount() through load
 acquire
Message-ID: <20241023194543.GD11151@noisy.programming.kicks-ass.net>
References: <20240912-seq_optimize-v3-1-8ee25e04dffa@gentwo.org>
 <20240917071246.GA27290@willie-the-truck>
 <4b546151-d5e1-22a3-a6d5-167a82c5724d@gentwo.org>
 <CAHk-=wgw3UErQuBuUOOfjzejGek6Cao1sSW4AosR9WPZ1dfyZg@mail.gmail.com>
 <CAHk-=wjdOX0t45a7aHerVPv_WBM3AmMi3sEp8xb19jpLFnk0dA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjdOX0t45a7aHerVPv_WBM3AmMi3sEp8xb19jpLFnk0dA@mail.gmail.com>
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

On Mon, Sep 23, 2024 at 09:28:31AM -0700, Linus Torvalds wrote:
> On Wed, 18 Sept 2024 at 08:22, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, 18 Sept 2024 at 13:15, Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
> > >
> > > Other arches do not have acquire / release and will create additional
> > > barriers in the fallback implementation of smp_load_acquire. So it needs
> > > to be an arch config option.
> >
> > Actually, I looked at a few cases, and it doesn't really seem to be true.
> 
> Bah. I ended up just committing the minimal version of this all. I
> gave Christoph credit for the commit, because I stole his commit
> message, and he did most of the work, I just ended up going "simplify,
> simplify, simplify".
> 
> I doubt anybody will notice, and smp_load_acquire() is the future. Any
> architecture that does badly on it just doesn't matter (and, as
> mentioned, I don't think they even exist - "smp_rmb()" is generally at
> least as expensive).

Do we want to do the complementing patch and make write_seqcount_end()
use smp_store_release() ?

I think at least ARM (the 32bit thing) has wmb but uses mb for
store_release. But I also think I don't really care about that.

