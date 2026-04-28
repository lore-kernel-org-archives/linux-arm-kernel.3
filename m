Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C100FFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NilECp0m2FUAOg9cioK7uduTaZS/ORavn8koLfI5Eg=; b=ixd6s4/wZZ7irmbxXa8eW1zmM+
	SCDsTEx2UcxuF2POL465q8wqEhtSwBEtOYR8sOlZDXTOKgfdV2abtzRCptYTiKYsf2pxtedxbjXhg
	RKQS4vpsSg7qA2EThQc4ZnTu85hd7WIWb+Jo6WjhqbLx3fAjy+LNPufxvFZ7Wfv3WRPkAQPKLm7uz
	YE3MzqNzuuiO2H+IM7ewZX14eg6S05po3G0gmhFpnkjRKVsHtq29UaZ5t36dFs3vNkD5EBk5RRxHG
	X/0n3zrLLxWxgWt2Qeb4c1by6ad35US3W8FpVMr1d/gZSybI/2wrLGiS0vZ9XUBxd6hqNYbGNyjul
	BK4LhyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdZB-00000000rOy-0ubn;
	Tue, 28 Apr 2026 08:13:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdZ9-00000000rOi-41UZ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 08:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6NilECp0m2FUAOg9cioK7uduTaZS/ORavn8koLfI5Eg=; b=k4KfIK0ITOixVALBXHoYtDhJKs
	6j641Q59Lf3O0PVWJk0atTPTd5JM7gGutG4Wc9/KZ4oSNL9fHuWyBGU8A136Dbl3irdF+YK44Lq58
	FQkTbxxtUyi+4hpTCoOrPwxVwhbdR3SNd33wA2sn0s6uJdgYNAIMSEa8CGMTN2VoZDOFiwE/BzHoT
	bij4WqgQkRtacxLbYaaIrtCTbq/SbHW6XOsU5bQkZTZVX1zw2Zz1cO+hG1b5iQwXjUV3jaGJQKPmS
	lW3VgvP8PdW67KFp1F2z+6TzxjeeIOkmU4Z4dGWIcHKV14FYHReRm/8yqnDSl2aGicM4aQ/J3EyO7
	X3n8Wd3g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdZ7-00000002NAr-33r0;
	Tue, 28 Apr 2026 08:13:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D832D301CEB; Tue, 28 Apr 2026 10:13:08 +0200 (CEST)
Date: Tue, 28 Apr 2026 10:13:08 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Mathias Stearn <mathias@mongodb.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ingo Molnar <mingo@kernel.org>, Blake Oler <blake.oler@mongodb.com>,
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>,
	Matthew Wilcox <willy@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
Message-ID: <20260428081308.GK3102924@noisy.programming.kicks-ass.net>
References: <87ik9i0xlj.ffs@tglx>
 <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx>
 <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
 <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
 <87v7dgzbo7.ffs@tglx>
 <20260424150318.GE641209@noisy.programming.kicks-ass.net>
 <87se8kywhb.ffs@tglx>
 <87jyttz8cf.ffs@tglx>
 <20260428073938.GH3126523@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428073938.GH3126523@noisy.programming.kicks-ass.net>
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

On Tue, Apr 28, 2026 at 09:39:38AM +0200, Peter Zijlstra wrote:

> > +	return IS_ALIGNED((unsigned long)rseq, rseq_alloc_align()) &&
> > +		rseq_len >= offsetof(struct rseq, end);
> > +}
> 
> Given we really only differentiate between ORIG_RSEQ_SIZE (32) and
> sizeof(struct rseq), perhaps we should also add something like:
> 
> 	if (rseq_len != sizeof(struct rseq))
> 		return false;
> 

Wakeup juice, I need more wakeup juice :-) Its there, except written
weirdly with that offsetof thing.

