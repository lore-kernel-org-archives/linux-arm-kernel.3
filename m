Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D552CE8E91
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JrfQxAyVo4Ab/7w06T1Ua4rQCOt+oeojwazfo2in8k=; b=myzSklOSYe5rc6PPOVraepZUK5
	iguSjcc3QhvdHjBBfjqiBJoZJ/1Ef4By7/A0XRQpmcwqlgtK0rKwZttwZ4OvVwdDi/eMemd9abh/Z
	xmEn4c9amVbalRSkkJ3mOd3WM4MvixQRWPrWqimNNn1byJVWZuKbYXjL/Zfnl7Q8EQILmZjwJ0582
	8M2AvwlvmxW7vAjfg4CWAosqP2CEAUOcs00Xfr43vJSJpU+YI0ygvcEcoIrDaypSLBk19/6FbNrE9
	zCa/fjPBi9hjf3W4colXB1GeCb+iwfyZ/FcbJLSCpVdCHh9cAmvyRM0P67IeLX2Dc0x3Od5SHQF1f
	lPUaatfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40ac-000000014X4-1n0d;
	Thu, 24 Oct 2024 16:21:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40YP-0000000146a-1QIC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:19:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 154F6339;
	Thu, 24 Oct 2024 09:19:44 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76A263F71E;
	Thu, 24 Oct 2024 09:19:12 -0700 (PDT)
Date: Thu, 24 Oct 2024 17:19:07 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
	anshuman.khandual@arm.com, aruna.ramakrishna@oracle.com,
	broonie@kernel.org, dave.hansen@linux.intel.com,
	jeffxu@chromium.org, joey.gouly@arm.com, pierre.langlois@arm.com,
	shuah@kernel.org, sroettger@google.com, will@kernel.org,
	linux-kselftest@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 3/5] arm64: signal: Improve POR_EL0 handling to avoid
 uaccess failures
Message-ID: <ZxpzexqNIfys3MnJ@e133380.arm.com>
References: <20241023150511.3923558-1-kevin.brodsky@arm.com>
 <20241023150511.3923558-4-kevin.brodsky@arm.com>
 <ZxoooqtuqTK5CAMR@arm.com>
 <80688edf-83dd-43c6-a1a8-b69acd30f5c3@arm.com>
 <Zxpq0k3b9q8nWrYa@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zxpq0k3b9q8nWrYa@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_091917_499718_228CAE24 
X-CRM114-Status: GOOD (  40.54  )
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

On Thu, Oct 24, 2024 at 04:42:10PM +0100, Catalin Marinas wrote:
> On Thu, Oct 24, 2024 at 04:55:48PM +0200, Kevin Brodsky wrote:
> > On 24/10/2024 12:59, Catalin Marinas wrote:
> > > On Wed, Oct 23, 2024 at 04:05:09PM +0100, Kevin Brodsky wrote:
> > >> +/*
> > >> + * Save the unpriv access state into ua_state and reset it to disable any
> > >> + * restrictions.
> > >> + */
> > >> +static void save_reset_user_access_state(struct user_access_state *ua_state)
> > >> +{
> > >> +	if (system_supports_poe()) {
> > >> +		/*
> > >> +		 * Enable all permissions in all 8 keys
> > >> +		 * (inspired by REPEAT_BYTE())
> > >> +		 */
> > >> +		u64 por_enable_all = (~0u / POE_MASK) * POE_RXW;
> > > I think this should be ~0ul.
> > 
> > It is ~0u on purpose, because unlike in REPEAT_BYTE(), I only wanted the
> > lower 32 bits to be filled with POE_RXW (we only have 8 keys, the top 32
> > bits are RES0). That said, given that D128 has 4-bit pkeys, we could
> > anticipate and fill the top 32 bits too (should make no difference on D64).
> 
> I guess we could leave it as 32-bit for now and remember to update it
> when we enable more keys with D128. Setting the top RES0 bits doesn't
> hurt either since they are already documented in the Arm ARM. Up to you,
> it's fine like above as well.

Can we maybe just have a brute-force loop that constructs the value
using the appropriate #define macros?

The compiler will const-fold it; I'd be prepared to bet that the
generated code would be identical...


> > >> @@ -907,6 +964,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
> > >>  {
> > >>  	struct pt_regs *regs = current_pt_regs();
> > >>  	struct rt_sigframe __user *frame;
> > >> +	struct user_access_state ua_state;
> > >>  
> > >>  	/* Always make any pending restarted system calls return -EINTR */
> > >>  	current->restart_block.fn = do_no_restart_syscall;
> > >> @@ -923,12 +981,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
> > >>  	if (!access_ok(frame, sizeof (*frame)))
> > >>  		goto badframe;
> > >>  
> > >> -	if (restore_sigframe(regs, frame))
> > >> +	if (restore_sigframe(regs, frame, &ua_state))
> > >>  		goto badframe;
> > >>  
> > >>  	if (restore_altstack(&frame->uc.uc_stack))
> > >>  		goto badframe;
> > >>  
> > >> +	restore_user_access_state(&ua_state);
> > >> +
> > >>  	return regs->regs[0];
> > >>  
> > >>  badframe:
> > > The saving part I'm fine with. For restoring, I was wondering whether we
> > > can get a more privileged POR_EL0 if reading the frame somehow failed.
> > > This is largely theoretical, there are other ways to attack like
> > > writing POR_EL0 directly than unmapping/remapping the signal stack.
> > >
> > > What I'd change here is always restore_user_access_state() to
> > > POR_EL0_INIT. Maybe just initialise ua_state above and add the function
> > > call after the badframe label.
> > 
> > I'm not sure I understand. When we enter this function, POR_EL0 is set
> > to whatever the signal handler set it to (POR_EL0_INIT by default).
> > There are then two cases:
> > 1) Everything succeeds, including reading the saved POR_EL0 from the
> > frame. We then call restore_user_access_state(), setting POR_EL0 to the
> > value we've read, and return to userspace.
> > 2) Any uaccess fails (for instance reading POR_EL0). In that case we
> > leave POR_EL0 unchanged and deliver SIGSEGV.
> > 
> > In case 2 POR_EL0 is most likely already set to POR_EL0_INIT, or
> > whatever the signal handler set it to. It's not clear to me that forcing
> > it to POR_EL0_INIT helps much. Either way it's doubtful that the SIGSEGV
> > handler will be able to recover, since the new signal frame we will
> > create for it may be a mix of interrupted state and signal handler state
> > (depending on exactly where we fail).
> 
> If the SIGSEGV delivery succeeds, returning would restore the POR_EL0
> set up by the previous signal handler, potentially more privileged. Does
> it matter? Can it return all the way to the original context?

That seems a valid concern.

It looks a bit like we don't back out the temporary change to POR_EL0
if writing the sigframe fails, so the temporary "allow all" perms might
get saved out into the SIGSEGV sigframe on the alternate signal
stack, and will then be restored as the user thread's POR_EL0 when the
SIGSEGV returns.

(This is all assuming that the force_sig(SIGSEGV) logic works properly
at all...  I'm still trying to puzzle it out!)

Cheers
---Dave

