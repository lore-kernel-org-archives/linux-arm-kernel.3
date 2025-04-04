Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0C7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfNro2goZHUZEXvPOeCgv9rUUFuthnly7rP4iV8zawQ=; b=22PQShbkwzlblxy624BRxK3j6O
	WhdFLFlUmQVbiieAGDAwD5RNaF/MEEZ3QgBUbEKn5K3752lRTt2fPe9l22/kzGSmbk7i93bbc8RVm
	U4zZJ4g1oobmmDDfeKRjmMavyI+lTYewyJlFeIVH5aFc3HgXMU9JAhK452VicLBKlHkuRrb9W82l+
	HjNijT8qLrqUmvOWblojObcETQUx4ZVqK0OTsZZUu/rAgyMYS+xrBet7Nieh3eAYqAeV6ZNAwKVXm
	triXMJA7kUhn4z4TVoTTviHAilaD2sIh+829mw6ablNIKWPXcB5mQHDli5CXgSvXT3CxP3jGepF4Y
	C+mHguoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0g1d-0000000Bf77-2RhL;
	Fri, 04 Apr 2025 12:19:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fzr-0000000BeyU-3MVs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 12:18:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B8F744DB7;
	Fri,  4 Apr 2025 12:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4773C4CEDD;
	Fri,  4 Apr 2025 12:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743769085;
	bh=F5t8Um7OOTfhJKq4jZwEY0gafKvvuvc4XRg2bZIcrb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXcfXYrc7n0kJFY0EwdXMKHGvcZbkFgOLWr0n5ol/1BRS7ZmQKz8yj4eAtDLW9L/Y
	 sOvZfVyRKtv6qlLOsSnka8eNKbAr8arxqJqsMrwiqotIv0pOINOvm0wN9vo983YvSZ
	 B2ez7WYrTWnwW0sisq8vBACoTNUQuR/WqYVnAOJ1yC4/kz93hQazUML6BkSo9K6c9l
	 EJoPg1vDFYlHdA9kAgHv4MCf6Omd/Gv/zKvBWF/VwFvKVJbDtJCmg3dqK7t1OoyNBM
	 Ec315i1gfa835jtpervv2ECwzw2Y1M/3obVk3LK2Yzs2UZ+jvdV9QA1TZlxMnIfi+2
	 G/7EONjGehAaA==
Date: Fri, 4 Apr 2025 13:18:00 +0100
From: Will Deacon <will@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, baolin.wang@linux.alibaba.com,
	tianruidong@linux.alibaba.com, brauner@kernel.org, shuah@kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/pidfd: align stack to fix SP alignment
 exception
Message-ID: <20250404121759.GA28692@willie-the-truck>
References: <20250312061557.28532-1-xueshuai@linux.alibaba.com>
 <0a70f4ab-cd83-434d-8dd2-486d58e5599a@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a70f4ab-cd83-434d-8dd2-486d58e5599a@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_051807_883268_7BFAD98D 
X-CRM114-Status: GOOD (  24.45  )
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

On Wed, Mar 19, 2025 at 10:59:57AM +0800, Shuai Xue wrote:
> + ARM maintainers for review.
> 
> 在 2025/3/12 14:15, Shuai Xue 写道:
> > The pidfd_test fails on the ARM64 platform with the following error:
> > 
> >      Bail out! pidfd_poll check for premature notification on child thread exec test: Failed
> > 
> > When exception-trace is enabled, the kernel logs the details:
> > 
> >      #echo 1 > /proc/sys/debug/exception-trace
> >      #dmesg | tail -n 20
> >      [48628.713023] pidfd_test[1082142]: unhandled exception: SP Alignment, ESR 0x000000009a000000, SP/PC alignment exception in pidfd_test[400000+4000]
> >      [48628.713049] CPU: 21 PID: 1082142 Comm: pidfd_test Kdump: loaded Tainted: G        W   E      6.6.71-3_rc1.al8.aarch64 #1
> >      [48628.713051] Hardware name: AlibabaCloud AliServer-Xuanwu2.0AM-1UC1P-5B/AS1111MG1, BIOS 1.2.M1.AL.P.157.00 07/29/2023
> >      [48628.713053] pstate: 60001800 (nZCv daif -PAN -UAO -TCO -DIT +SSBS BTYPE=-c)
> >      [48628.713055] pc : 0000000000402100
> >      [48628.713056] lr : 0000ffff98288f9c
> >      [48628.713056] sp : 0000ffffde49daa8
> >      [48628.713057] x29: 0000000000000000 x28: 0000000000000000 x27: 0000000000000000
> >      [48628.713060] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
> >      [48628.713062] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000400e80
> >      [48628.713065] x20: 0000000000000000 x19: 0000000000402650 x18: 0000000000000000
> >      [48628.713067] x17: 00000000004200d8 x16: 0000ffff98288f40 x15: 0000ffffde49b92c
> >      [48628.713070] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> >      [48628.713072] x11: 0000000000001011 x10: 0000000000402100 x9 : 0000000000000010
> >      [48628.713074] x8 : 00000000000000dc x7 : 3861616239346564 x6 : 000000000000000a
> >      [48628.713077] x5 : 0000ffffde49daa8 x4 : 000000000000000a x3 : 0000ffffde49daa8
> >      [48628.713079] x2 : 0000ffffde49dadc x1 : 0000ffffde49daa8 x0 : 0000000000000000
> > 
> > According to ARM ARM D1.3.10.2 SP alignment checking:
> > 
> > > When the SP is used as the base address of a calculation, regardless of
> > > any offset applied by the instruction, if bits [3:0] of the SP are not
> > > 0b0000, there is a misaligned SP.
> > 
> > To fix it, align the stack with 16 bytes.
> > 
> > Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> > ---
> >   tools/testing/selftests/pidfd/pidfd_test.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/pidfd/pidfd_test.c b/tools/testing/selftests/pidfd/pidfd_test.c
> > index c081ae91313a..ec161a7c3ff9 100644
> > --- a/tools/testing/selftests/pidfd/pidfd_test.c
> > +++ b/tools/testing/selftests/pidfd/pidfd_test.c
> > @@ -33,7 +33,7 @@ static bool have_pidfd_send_signal;
> >   static pid_t pidfd_clone(int flags, int *pidfd, int (*fn)(void *))
> >   {
> >   	size_t stack_size = 1024;
> > -	char *stack[1024] = { 0 };
> > +	char *stack[1024] __attribute__((aligned(16))) = {0};
> >   #ifdef __ia64__
> >   	return __clone2(fn, stack, stack_size, flags | SIGCHLD, NULL, pidfd);

The arm64 alignment requirement is correct, but I don't really grok what
this code is trying to do. If it's not using CLONE_VM, why bother passing
a separate stack? If it _is_ using CLONE_VM, then surely the stack needs
to be allocated somewhere other than the caller stack?

Will

