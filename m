Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1D2C55822
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpH62FMFtWUxRfc3axL/EWkSaCRGMx2miOZKjiP1hxo=; b=w2mKsA511CV9ex3suexLeF31gk
	e5EsVGnQ+Tnl3PQHrpFY4Cy1g0IaJXqrFhUvY9WbN53bb2D68KUCGQSs+U1rFy9FAY+P1ObqeCASX
	TcLfOx1zoKYGEysHepGXUciBM09BOYEaQsVWuAdEzn7hsN1Kvfr0Quzij/yH/WPpC75yka9jbw+HM
	s1zMnJRbTq5pJtN0dT9AgJJ6nnG7ueULk5mFc261Mc43NHQzDWLrI/Db07qMIGVRWAgStSeIP+dml
	+APlcgqHEgd4Nm4caDZT+v/W5xsADk0VaYniGVtuFZ8ZFDyyGdbTi03nAkT15uuf+h82bAUmXG3JM
	W68N/q7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxJW-00000000Ml0-0njw;
	Mon, 03 Aug 2026 18:23:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxJU-00000000Mkg-3yFC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 18:23:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E98560AA9;
	Mon,  3 Aug 2026 18:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946B11F000E9;
	Mon,  3 Aug 2026 18:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785781379;
	bh=MpH62FMFtWUxRfc3axL/EWkSaCRGMx2miOZKjiP1hxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k7Zee/MxHzLWUTss9GKG+pbzKLIwtX8fAkHQ7bqeOrhMLjo9PR3khRQJ/tXXr+UHC
	 2z6O8JtxCh8EkUK62MyK10oQbaoVWi+Jduul4P4nzBS1osrbduvjWm22FwsJZxnNnh
	 +gSL1ucabzOLZTU6e18UG2d/Lq0oxKebJN1/znoVMczAMHmbJF0TSiYNixS2fz4Qdd
	 AVhm859dRTDKksUgxx9qa9FwaCceL6qUQa41jb8/gFT+4rYqFDy4jmcMcGTqGYf7YR
	 1wGiO3E/pXEjDeYy3eB7Iw8a86yY05o+FfCQfADdm5Jps3aOjn/edbNir5I1rKqnoZ
	 i7LN/twwZtpLQ==
Date: Mon, 3 Aug 2026 11:22:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Maninder Singh <maninder1.s@samsung.com>
Cc: "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"morbo@google.com" <morbo@google.com>,
	"justinstitt@google.com" <justinstitt@google.com>,
	Onkarnath <onkarnath.1@samsung.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Rohit Thapliyal <r.thapliyal@samsung.com>, ndesaulniers@google.com,
	ardb@kernel.org
Subject: Re: [PATCH 1/1] arm: backtrace-clang: fix wrong sp usage for
 unwinding
Message-ID: <20260803182255.GC1067866@ax162>
References: <CGME20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5@epcms5p4>
 <20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5@epcms5p4>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5@epcms5p4>
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

Hi Maninder,

On Wed, Jul 29, 2026 at 09:11:01AM +0530, Maninder Singh wrote:
> Ping! Any comments?

I am not that familiar with this code but maybe Nick (whose address I
have now updated to point to a better one) or Ard could help take a
look? Original patch is at

  https://lore.kernel.org/20260624054916.1571701-1-maninder1.s@samsung.com/

but I have left it inline as well.

> > show_stack() can be called for any task, however c_backtrace always unwinds
> > frames based on the "sp" register. This results in printing the backtrace of
> > the current task instead of the target task.
> > 
> > Try with normal TC:
> > ==================
> >        for_each_process(p) {
> >                sched_show_task(p);
> >        }
> > 
> > [7.433271] task:kthreadd        state:S stack:0     pid:2     tgid:2     ppid:0      task_flags:0x208040 flags:0x00000000
> > [7.433633] Call trace:
> > [7.433640] [<80113418>] (dump_backtrace) from [<80113510>] (show_stack+0x14/0x18)
> > ..
> > [7.433676] [<8016749c>] (sched_show_task) from [<803cb324>] (meminfo_proc_show+0x6c/0x930)
> > [7.434019]  r5:8158e300 r4:8b4882d0
> > [7.434024] [<803cb324>] (meminfo_proc_show) from [<80365788>] (seq_read_iter+0x148/0x4bc)
> > [7.434045] [<80365788>] (seq_read_iter) from [<803c044c>] (proc_reg_read_iter+0xb8/0xc4)
> > [7.434060] [<803c044c>] (proc_reg_read_iter) from [<80377104>] (copy_splice_read+0x228/0x308)
> > 
> > It should unwind frame based on passed "fp".
> > (CONFIG_UNWINDER_FRAME_POINTER=y)
> > 
> > With fix:
> > =========
> > [13.933732] task:kthreadd        state:S stack:0     pid:2     tgid:2     ppid:0      task_flags:0x208040 flags:0x00000000
> > [13.934165] Call trace:
> > [13.934604] [<80afa1a8>] (schedule) from [<8015426c>] (kthreadd+0x124/0x208)
> > [13.934654]  r10:8100bbf0 r4:8116f440
> > [13.934664] [<8015426c>] (kthreadd) from [<8010010c>] (ret_from_fork+0x14/0x28)
> > [13.934691] Exception stack(0xf081df9c to 0xf081dfe4)
> > 
> > Additionally, the extra manipulation of "sp" register appears unnecessary in the "current"
> > task also since the "fp" register is already provided.
> > 
> > Signed-off-by: Onkarnath 
> > Signed-off-by: Maninder Singh 
> > ---
> >  arch/arm/lib/backtrace-clang.S | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrace-clang.S
> > index 290c52a60fc6..993410a6afd1 100644
> > --- a/arch/arm/lib/backtrace-clang.S
> > +++ b/arch/arm/lib/backtrace-clang.S
> > @@ -105,10 +105,6 @@ ENDPROC(c_backtrace)
> >  		moveq	mask, #0xfc000003
> >  		movne	mask, #0		@ mask for 32-bit
> >  
> > -/*
> > - * Switches the current frame to be the frame for dump_stack.
> > - */
> > -		add	frame, sp, #24		@ switch to false frame
> >  for_each_frame:	tst	frame, mask		@ Check for address exceptions
> >  		bne	no_frame
> >  
> > -- 
> > 2.34.1
> 
> 
> 

-- 
Cheers,
Nathan

