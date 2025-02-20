Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB72C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQwuIWaltYp/mz8zKBUY/VeGrYxpDtxHxLNNtrjlSjw=; b=ZOnFJTFXN5dNENXrDgUBT+V+B1
	ld3nGbA9IG5Zx0JUPZQILWEQXxLP9oPM1hvts+A+eWtMCxJe0j1JBzwB++O7+/hMIOLrummfaYoMQ
	wSeOhcwKCzmoMCQIyU7OkDQ/YQbGRQASm9VsWwqmuwGAPmpqgwStZKaXs7PtPsOJARyYPItNIwkct
	fKw4ic9qBm9/G/Yr88oexm0csfe7wLOPnxHT+mYO7TMA6hs2FQ+ee/uhX8Z8IQPaPpIDREW+Frehp
	29hG+0j46dzO9vh5p5NhJSDZJvw43aSMA/XIyip07tgamScM215sgEa+DboYCk6bWSvPGqoSiJAbv
	KDyfNahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7iJ-00000001Mdx-0HiZ;
	Thu, 20 Feb 2025 14:39:43 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7Zd-00000001K36-2f3I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:30:48 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id DAF6172C8F5;
	Thu, 20 Feb 2025 17:30:40 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id CD17C7CCB3A; Thu, 20 Feb 2025 16:30:40 +0200 (IST)
Date: Thu, 20 Feb 2025 16:30:40 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/31] ARM: Switch to generic entry
Message-ID: <20250220143040.GA24540@strace.io>
References: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
 <20250214010325.GA12626@strace.io>
 <CACRpkdZJYFUhmPg3EWJeU42fzJMzWm7Sgn3XfELB2-PSCf6Ssw@mail.gmail.com>
 <20250214110508.GA19194@strace.io>
 <CACRpkdbmOiapucnzyd9-x4WJsRBs2pRdcgZ2-AoN3bdkNJaW_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbmOiapucnzyd9-x4WJsRBs2pRdcgZ2-AoN3bdkNJaW_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_063045_838693_E66F6D01 
X-CRM114-Status: GOOD (  21.02  )
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

On Thu, Feb 20, 2025 at 03:04:22PM +0100, Linus Walleij wrote:
> On Fri, Feb 14, 2025 at 12:05 PM Dmitry V. Levin <ldv@strace.io> wrote:
> 
> > > Sure, where can I find this test suite?
> >
> > It's a part of strace, you can find it e.g. at
> > https://github.com/strace/strace
> >
> > To build and run it one can roughly do
> > ./bootstrap && ./configure && make -j`nproc` && make -j`nproc check
> 
> make check produces some test failures on v6.14-rc1 on ARM
> even before I apply the generic entry:
> 
> FAIL: filtering_syscall-syntax.test
> FAIL: qual_fault-syscall.test
> FAIL: qual_fault.test
> FAIL: strace--tips-full.test
> FAIL: strace-r.test

This is surprising, no tests are currently known to fail on arm.

> Then there is the fact that I had to add the  PTRACE_SYSEMU and
> PTRACE_SYSEMU_SINGLESTEP as stubs returning -EIO
> (modeled after UM) to use generic entry. Do you think this affects
> the results?

No, strace doesn't use PTRACE_SYSEMU* and doesn't test it either.

> Is there a way to run a single test? I tried to check the docs but
> nothing obvious to me ... I guess I'm not used to this unit-tester.

Sure, it's a regular automake-based test suite, so you can do something like
$ make -s -k check VERBOSE=1 TESTS='filtering_syscall-syntax.test qual_fault-syscall.test qual_fault.test'


-- 
ldv

