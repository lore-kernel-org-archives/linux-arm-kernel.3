Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABC0CE8E8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1J+34vKFjOX5XSO0TT2EIO5yov8oJ+cxq0JgOT/eyQ=; b=hueUdxQpdrtvPsEOK+1HIj/gsa
	RHO9fXDtUvT/jvZZKCU9TKXVjDtaaTkrxGuYXC89y309hidVllRiQeu2CS2Jo8Xb+Q0S/kuKUmLAn
	ckbCxPA6qxXjoPBsk6enCz71piDIAoiDgRrv/HwI0EvM3Z2mavKYxCmZF/ejJKrGLKhftd57ag3br
	Tw/CqAITmkvTNT/X0HOLUJEOTLTA+9VdJX4kMRQyPEYKrEgipt6kPqAgxRq4oQ879rzlMqx+Demvm
	3wDIa6I8D0xlsqI1NZ9BQpgbiExaCiXJBKhm9VopX2l7D9L72uihgtJrlkZh4u0lBFuYN9a27Sq+M
	NTJupy0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t406t-00000000zX0-2mQ8;
	Thu, 24 Oct 2024 15:50:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zyb-00000000xIA-0cmf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:42:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5378AA45632;
	Thu, 24 Oct 2024 15:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E13C4CEC7;
	Thu, 24 Oct 2024 15:42:12 +0000 (UTC)
Date: Thu, 24 Oct 2024 16:42:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
	anshuman.khandual@arm.com, aruna.ramakrishna@oracle.com,
	broonie@kernel.org, dave.hansen@linux.intel.com,
	dave.martin@arm.com, jeffxu@chromium.org, joey.gouly@arm.com,
	pierre.langlois@arm.com, shuah@kernel.org, sroettger@google.com,
	will@kernel.org, linux-kselftest@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 3/5] arm64: signal: Improve POR_EL0 handling to avoid
 uaccess failures
Message-ID: <Zxpq0k3b9q8nWrYa@arm.com>
References: <20241023150511.3923558-1-kevin.brodsky@arm.com>
 <20241023150511.3923558-4-kevin.brodsky@arm.com>
 <ZxoooqtuqTK5CAMR@arm.com>
 <80688edf-83dd-43c6-a1a8-b69acd30f5c3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80688edf-83dd-43c6-a1a8-b69acd30f5c3@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_084217_420190_65B7E177 
X-CRM114-Status: GOOD (  31.15  )
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

On Thu, Oct 24, 2024 at 04:55:48PM +0200, Kevin Brodsky wrote:
> On 24/10/2024 12:59, Catalin Marinas wrote:
> > On Wed, Oct 23, 2024 at 04:05:09PM +0100, Kevin Brodsky wrote:
> >> +/*
> >> + * Save the unpriv access state into ua_state and reset it to disable any
> >> + * restrictions.
> >> + */
> >> +static void save_reset_user_access_state(struct user_access_state *ua_state)
> >> +{
> >> +	if (system_supports_poe()) {
> >> +		/*
> >> +		 * Enable all permissions in all 8 keys
> >> +		 * (inspired by REPEAT_BYTE())
> >> +		 */
> >> +		u64 por_enable_all = (~0u / POE_MASK) * POE_RXW;
> > I think this should be ~0ul.
> 
> It is ~0u on purpose, because unlike in REPEAT_BYTE(), I only wanted the
> lower 32 bits to be filled with POE_RXW (we only have 8 keys, the top 32
> bits are RES0). That said, given that D128 has 4-bit pkeys, we could
> anticipate and fill the top 32 bits too (should make no difference on D64).

I guess we could leave it as 32-bit for now and remember to update it
when we enable more keys with D128. Setting the top RES0 bits doesn't
hurt either since they are already documented in the Arm ARM. Up to you,
it's fine like above as well.

> >> @@ -907,6 +964,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >>  {
> >>  	struct pt_regs *regs = current_pt_regs();
> >>  	struct rt_sigframe __user *frame;
> >> +	struct user_access_state ua_state;
> >>  
> >>  	/* Always make any pending restarted system calls return -EINTR */
> >>  	current->restart_block.fn = do_no_restart_syscall;
> >> @@ -923,12 +981,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >>  	if (!access_ok(frame, sizeof (*frame)))
> >>  		goto badframe;
> >>  
> >> -	if (restore_sigframe(regs, frame))
> >> +	if (restore_sigframe(regs, frame, &ua_state))
> >>  		goto badframe;
> >>  
> >>  	if (restore_altstack(&frame->uc.uc_stack))
> >>  		goto badframe;
> >>  
> >> +	restore_user_access_state(&ua_state);
> >> +
> >>  	return regs->regs[0];
> >>  
> >>  badframe:
> > The saving part I'm fine with. For restoring, I was wondering whether we
> > can get a more privileged POR_EL0 if reading the frame somehow failed.
> > This is largely theoretical, there are other ways to attack like
> > writing POR_EL0 directly than unmapping/remapping the signal stack.
> >
> > What I'd change here is always restore_user_access_state() to
> > POR_EL0_INIT. Maybe just initialise ua_state above and add the function
> > call after the badframe label.
> 
> I'm not sure I understand. When we enter this function, POR_EL0 is set
> to whatever the signal handler set it to (POR_EL0_INIT by default).
> There are then two cases:
> 1) Everything succeeds, including reading the saved POR_EL0 from the
> frame. We then call restore_user_access_state(), setting POR_EL0 to the
> value we've read, and return to userspace.
> 2) Any uaccess fails (for instance reading POR_EL0). In that case we
> leave POR_EL0 unchanged and deliver SIGSEGV.
> 
> In case 2 POR_EL0 is most likely already set to POR_EL0_INIT, or
> whatever the signal handler set it to. It's not clear to me that forcing
> it to POR_EL0_INIT helps much. Either way it's doubtful that the SIGSEGV
> handler will be able to recover, since the new signal frame we will
> create for it may be a mix of interrupted state and signal handler state
> (depending on exactly where we fail).

If the SIGSEGV delivery succeeds, returning would restore the POR_EL0
set up by the previous signal handler, potentially more privileged. Does
it matter? Can it return all the way to the original context?

-- 
Catalin

