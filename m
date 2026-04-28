Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198BFFF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMex7aa9ddoW2HqWhtMcWaC7o2DU+P7YzO4RYUnG51I=; b=H8qxkpInFODNOmmltb0WWb7hS5
	PcthJeHsmuHGQBeicQXN6wF0CMg/LZo7K+/rEX+TVAoEkHm0LuJ8Cz6XYGuxAE3s6qs1O+ECifAWU
	OypNZw1p+Gzl6GfpqSiRBZt+GAf+VIfOHZ4yoMpZUT4xAGtj2QR3xqrjZlVHqfD3Ysa6o6ieCodg4
	LIFxLpYmGs+KVL/2kzagOKMdHeEz1SmM1+PVIakUHB9BeN6EXybhS01uKqE89vbPnnRg5eFSmRXB3
	5HpyBfcR1DQKaxlusaLNXfFbh3WTFmEQ0WFGphZ24O0OMrFfGkek2Y7Nx0/3WFBiWuxQ/XmsdVylM
	1lY5dBYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdwC-00000000tmH-1PJH;
	Tue, 28 Apr 2026 08:37:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdwA-00000000tlv-19HG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:36:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E196B448A6;
	Tue, 28 Apr 2026 08:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561A3C2BCAF;
	Tue, 28 Apr 2026 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777365405;
	bh=6431jNMlyh5TZtkffCv2Acjak2j02YoCm1/rh7vP68Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bjZl9ocH4SCCsKL6l+xut4XRgQbREMkmZTjBz0W35LvibOIiSFM4swxDiBLi1B4kq
	 CiYK9Q4JEB06BO80FC0P6bHV5Su4RUiMFTFE91SEHGNH8RIqFyaKrElslx6pHkrQF1
	 8E+C9J4DD2WmyWL+PQ12DB4h4cEoj+ceqmG4fI1lwYCbKXkgF67rW/lIq0k9pwxsXM
	 bDCN4ArLqgLMb7mH0rT9r0C5tVx8TqkGSu3EXmqvODEQfKT2cnddKCXa6Go7S4S0zt
	 N7kxo15ymikiGVFMJnXvBpTWwgEbcgyLEYK89Q7hTrlRTlW97mNuUhNHoLKSUwFyLc
	 FwENZ0Ur+VklQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mathias Stearn <mathias@mongodb.com>, Dmitry Vyukov
 <dvyukov@google.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-man@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ingo
 Molnar <mingo@kernel.org>, Blake Oler <blake.oler@mongodb.com>, Florian
 Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, Matthew Wilcox
 <willy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <20260428080359.GI3126523@noisy.programming.kicks-ass.net>
References: <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx>
 <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx>
 <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
 <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
 <87v7dgzbo7.ffs@tglx>
 <20260424150318.GE641209@noisy.programming.kicks-ass.net>
 <87se8kywhb.ffs@tglx> <87jyttz8cf.ffs@tglx>
 <20260428080359.GI3126523@noisy.programming.kicks-ass.net>
Date: Tue, 28 Apr 2026 10:36:41 +0200
Message-ID: <87340fzdk6.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_013658_333691_B5E943AF 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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

On Tue, Apr 28 2026 at 10:03, Peter Zijlstra wrote:
> On Mon, Apr 27, 2026 at 12:04:48AM +0200, Thomas Gleixner wrote:
>> +   * - 5
>> +     - Time slice extensions
>> +     - Not supported
>> +     - Supported
>
> I'm sure its cute when rendered, but when read as text this is nigh on
> unreadable.

I tried the other table variants. They are even worse :)

