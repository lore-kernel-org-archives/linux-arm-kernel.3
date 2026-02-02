Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C46E7DEFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 16:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVo5Au4CP1zdPnx/DLZo5IKZOm1ggP7FcSoMPFwdqag=; b=tuPgtv0sizDHhwEg2Iq7j75VF5
	GyuuP51delHQ3Bc3VECieubgGlxgny/fRHvvzLnx09w6w+mvbSYi7DiIm3wdvsICUIlcBAF3sT6GC
	O4hAoYa8ErY7mwAmolPpSda/ZZpoY1bMFpC+HHj8YWBm0l8dE+7WocAMSCoZrj7nUt2X9QqN28TXc
	qmUs36RuBFTzWUNbv3If3FzaVngzdFHMvPiLoM/1bD57QLMyZWK/+K3oMFB5y+foTzJthQ+X8Jsvj
	9Cqb4r5BNvuqzkQ+0PABjkkrlGRxZuRLN/VfkonDVl0GOIgXnpmJXbcasmEsr0GZDZZRT+O8K2OdZ
	afhQH+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwQt-00000005GQZ-2Z84;
	Mon, 02 Feb 2026 16:05:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwQq-00000005GPc-3LbV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 16:05:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A3FD4324C;
	Mon,  2 Feb 2026 16:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22AAC116C6;
	Mon,  2 Feb 2026 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770048344;
	bh=cXGxG9ptyveGKRS8+OXlF+IZh2FPotdwQhMWSK78fFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uOhjTnK2CkLobKfALOdCNjeYkr79hIC2K1lkzcSRz57R+i1muxRf0yENJjpsaj8cz
	 I6hqYyhovT2sDJa20oj9meKga0c04zh5Lpjyk3PvdFIvhTVWCStjacQmpwcglFWkjF
	 8jNb/Mz4xEpROV1bpJXzL2nl5JBTzV46IvRwDP8anJQOl8yReK0Kce6169lGNgZLJt
	 uqMCjBtBpWpAh52yfNTzpSbE3LLGPYY24UUStVKW1u1/4AHyIyDnmL7dZMCgT2k1gH
	 wCvSj7ZU4yinaVxWgAL2xi+aY4TE5tHvC5xvxitBSt7s9w3XxpvasRxY76jEWJOITR
	 +R71ti3IaqLfA==
Date: Mon, 2 Feb 2026 16:05:38 +0000
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Marco Elver <elver@google.com>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	David Laight <david.laight.linux@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <aYDLUhWMdvzKpTK9@willie-the-truck>
References: <20260130132951.2714396-1-elver@google.com>
 <20260130132951.2714396-3-elver@google.com>
 <aYDEiOutq3_O8irP@willie-the-truck>
 <20260202160139.GF1282955@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202160139.GF1282955@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_080544_862178_136BA91E 
X-CRM114-Status: GOOD (  15.32  )
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

On Mon, Feb 02, 2026 at 05:01:39PM +0100, Peter Zijlstra wrote:
> On Mon, Feb 02, 2026 at 03:36:40PM +0000, Will Deacon wrote:
> 
> > Since we're not providing acquire semantics for the non-atomic case,
> > what we really want is the generic definition of __READ_ONCE() from
> > include/asm-generic/rwonce.h here. The header inclusion mess prevents
> > that, but why can't we just inline that definition here for the
> > 'default' case? If TYPEOF_UNQUAL() leads to better codegen, shouldn't
> > we use that to implement __unqual_scalar_typeof() when it is available?
> 
> We are?

Great! Then I don't grok why we need to choose between
__unqual_scalar_typeof() and __typeof_unqual__() in the arch code. We
should just use the former and it will DTRT.

Will

