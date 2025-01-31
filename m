Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1463AC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 13:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzfjO6fF7HqD6Nc4cCx8HjywONvgc66OpvVTfVSfhic=; b=fL9g8y+vVGf5Z2ZhMyseTQOoqW
	0cg6yG4McqUuCg7szh6MqQ/+GaRNF/KUo3c39FPOcPs1DS2sPcdPMikRCGVp2RQKxlyo2NnOmXxoJ
	RXB3nQ4NsXHQUbvhLNDxE6B6f7aM++FEaVBirL6rZLi2ZEAtbR1HKg7+qRRqnUpGmVrL8u+btJXzE
	nbvTqo4xD4saP4DhJ3TjTwAVE1lFnElHZdjQjMsHpDl7q8lxnqOC/9MX9ToJWHrHFTGn2lVoQNHMR
	KEXD+rk+p6xl6hKQWQa/T0iNTd2CpFB2KBGn8JXeD5hWZV0kFOMQ7XpXci4HGAdxoABnmiuC3JRJS
	Eg+ZXtDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrWC-0000000AjO9-2Zgf;
	Fri, 31 Jan 2025 13:57:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrU7-0000000Aj9s-0RxO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 13:55:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08441497;
	Fri, 31 Jan 2025 05:55:26 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE98F3F63F;
	Fri, 31 Jan 2025 05:54:59 -0800 (PST)
Date: Fri, 31 Jan 2025 13:54:57 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Emanuele Rocca <emanuele.rocca@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <Z5zWMU4M_L5k6kII@J2N7QTR9R3>
References: <Z5tuaxgDyFJPAvR0@J2N7QTR9R3>
 <Z5uTCnhfKo5D-_bV@NH27D9T0LF>
 <20250131124103.GA29766@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131124103.GA29766@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_055503_235720_31291D39 
X-CRM114-Status: GOOD (  35.62  )
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

On Fri, Jan 31, 2025 at 12:41:04PM +0000, Will Deacon wrote:
> On Thu, Jan 30, 2025 at 03:56:10PM +0100, Emanuele Rocca wrote:
> > On 2025-01-30 12:19, Mark Rutland wrote:
> > > For the benefit others, when we looked into this a few days ago it
> > > appeared that a GPR was being clobbered across an SMCCC call, resulting
> > > in a later crash (as that GPR should hold the ADRP'd base address of
> > > 'smccc_version'). I didn't have the time to dig more into that (e.g.  to
> > > figure out whether kernel/compiler/firmware was to blame).
> > > 
> > > Emanuele, could you please dump the result of:
> > > 
> > >   objdump --disassemble=arm_smccc_version_init vmlinux
> > > 
> > > ... for this kernel? That'd make it possible for others to
> > > perform/verify the analysis I mentioned above.
> > 
> > Sure, here it is:
> > https://people.debian.org/~ema/Z5OpGluX6oX5NLxh@NH27D9T0LF.objdump.txt
> > 
> > > If you can share any more details from the crash, that'd be helpful. The
> > > GPR dump would be *enormously* helpful in this case, and even a photo of
> > > the crash log might be useful.
> > 
> > pc : arm_smccc_version_init+0x90/0x1ac
> > lr : psci_probe+0x1fc/0x2c0
> > sp : ffffa3d8eea33ca0
> > x29: ffffa3d8eea33ce0 x28: 0000000081000200 x27: ffffa3d8edd72a80
> > x26: ffffa3d8edd728b0 x25: ffffa3d8eec66248 x24: ffffa3d8edc528d8
> > x23: ffffa3d8eed7f4f8 x22: 0000000000000001 x21: ffffa3d8eea58410
> > x20: ffffa3d8eed7f000 x19: 0000000000010001 x18: 0000000000000006
> > x17: 0000000009f69730 x16: 00000008760968d0 x15: 0000000000000000
> > x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> > x11: 00000000ffffefff x10: ffffa3d8eeac09c8 x9 : ffffa3d8eea687d8
> > x8 : ffffa3d8eea33cb8 x7 : 0000000000000000 x6 : 0000000000000000 
> > x5 : ffffa3d8eed7f000 x4 : ffffa3d8edeb0000 x3 : 0000000000000000
> > x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000000
> > 
> > Call trace:
> >  arm_smccc_version_init+0x90/0x1ac
> >  psci_0_2_init+0x20/0x2c
> >  psci_1_0_init+0x1c/0x58
> >  psci_dt_init+0x6c/0x98
> >  setup_arch+0x400/0x5ec
> >  start_kernel+0x90/0x788
> >  __primary_switched+0xbc/0xc4
> > Code: d29fffe1 eb01001f 1a9f97e0 f0ffd384 (b94264c2)
> > 
> > The above was transcribed by hand. I double-checked, but there may be
> > mistakes.
> > 
> > Photo here: https://people.debian.org/~ema/Z5OpGluX6oX5NLxh@NH27D9T0LF.jpg
> 
> Crikey, you transcribed all that junk by _hand_?! Thanks for the effort,
> but next time please don't waste your time! The screenshot is fine.
> 
> Anyway, it looks like x6 gets trashed across the SMC. I think that's fine
> per the SMCCC spec:
> 
>   | Unused result and scratch registers can leak information after an
>   | SMC or HVC call. An implementation can mitigate this risk by either
>   | preserving the register state over the call, or returning a constant
>   | value,such as zero, in each register.

I think that's misleading/stale and x6 specifically is not supposed to
be clobbered. Shortly before that there's wording about preserving the
registers, summary/history below:

* SMCCC v1.0 allowed x0 to x17 to be clobbered over a call; all other
  GPRs had to be preserved.

  That was defined in ARM DEN 0028B, AKA "SMC CALLING CONVENTION":
  https://developer.arm.com/documentation/den0028/b/?lang=en

* SMCCC v1.1 mandated that x4 to x17 were preserved. This was critical
  for some of the ARCH_WORKAROUND_* calls made from kernel/kvm entry
  asm.

  That was defined in ARM DEN 0070, AKA "Firmware interfaces for
  mitigating cache speculation vulnerabilities":

  https://developer.arm.com/cache-speculation-vulnerability-firmware-specification

* SMCCC v1.2 relaxed things such that x4 to x17 must be preserved
  *unless* they contained results of the function.

  That was defined in ARM DEN 0028C, AKA "SMC CALLING CONVENTION":
  https://developer.arm.com/documentation/den0028/c/?lang=en

  .. which folded inthe requirements from ARM DEN 0070, with the
  relaxation above, but also kept the stale not from ARM DEN 0028B.

In Linux we depend on x4 to x17 not being clobbered *unless* they're
being used to return a result.

The current wording in the spec is messed up, and suggests that SMC32
calls could clobber the upper 32 bits of x4 to x17, which is inccorect
and would break the ARCH_WORKAROUND_* calls mentioend above (given those
are SMC32). I'll go chase the SMCCC architects about that; it's clearly
an unintentional error when reformatting the document.

The *intent* is that x4 to x17 are preserved here. AFAICT, nothing in
arm_smccc_version_init() returns a value in x4 to x17. If any of those
are clobbered for an SMCCCv1.1 call, it's definitely a firmware bug.

> so the question is whether or not the compiler should be relying on the
> register being preserved. It looks to me like the arm_smccc_1_1_smc()
> macro is actually broken in this regard: it constructs the input list
> based on the number of arguments passed and doesn't take the above into
> account at all.

As above, I think that arm_smccc_1_1_smc() is correct; it *always*
clobbers x0 to x3, and cannot be used for SMCCCv1.2+ calls that return
values in x4 to x17.

That doesn't change the fact that we'll need a workaround, though.

> So I think we should change that so unused arguments are clobbered
> instead. Mark -- what do you think?

As above, if FW gets this wrong for calls made from entry asm, the
results could be catastrophic, so it'd be good if we could detect this
and log a FW BUG the first time we hit it.

We'd have to assume that any of x0 to x17 could be clobbered, and at
that point I suspect it'd be better to move this out-of-line for almost
all callers, which we effectively already have in the form of the
arm_smccc_1_2_{smc,hvc}() trampolines. We could bounce arm_smccc_1_1_*()
calls through those.

Mark.

