Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4C2C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 12:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsDlwBaMuIS17pJVY5RsL5wyk14DUnumCFdCtmFC7lA=; b=ot5gH+MXYD8rYbrf7BCzhCF4na
	yLhFRkhOL43wYZnONRqxBnK5Lmr6BKUv+pX3oQUOqlt2q7mqcAnuXMMF+0cFICcPLRzetD48KTKBc
	oagP8bJs/s9ZLGeH1t/REIA5tXUSCxGED1Nll3eanYl/OIAeRHFROhvc0/NQ5vpU2c4pP45cuJ10I
	+cISoTGv+Er6ZF1S9vi+voVKMPXmAY+U9bzi70gHHdcc67VBmX5bexsi2OLvzM3XH7pX//XeE38Tl
	Hh330piXJACeLt1ICpc0tWikMfdVFEdDPlUxzodwHyQiuW10GTcNfEya1Y0hoxkZIGFzhQyZ6hv20
	e2ft8gQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdqLw-0000000AcY2-18rC;
	Fri, 31 Jan 2025 12:42:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdqKd-0000000AcWp-1dcr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 12:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 339F3A41E03;
	Fri, 31 Jan 2025 12:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FE8C4CEE1;
	Fri, 31 Jan 2025 12:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738327268;
	bh=361MpZRIBEfqHuYP7WFilCBvDowjHwoFCsg4xWfX68A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pm7aI4oVMqAH0wPbXGij15rq1Vzb9kmgs/BjEj2Z3fePSdIBzy566uncTjYV0x2NG
	 kLpORUXCma5k6OR6kznpOE3ZIPzuL38Pi/Wp/v6QibUYq2+7mh6/NM7frXHtZC3Ldz
	 lGqtUxB9GjTrjlJm8XZdgW5LU5BTy6IyRDtTnkDKEvNrMohRMePGmPYbsLwU+IZ4Kd
	 Q4Ekpkyqhm7OTdK1SWGyHgk+KjojTOKAZFV9OVN14oQoRecWRyk/8UmpzX2LA3Lgic
	 lbHNhLAInIw3AagoLNhrojAHxguNhRbZyqnQaoLJLuD1a+gUTPvuCuY/nj6g4P2Ag8
	 Jp089AP9Cu+JA==
Date: Fri, 31 Jan 2025 12:41:04 +0000
From: Will Deacon <will@kernel.org>
To: Emanuele Rocca <emanuele.rocca@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <20250131124103.GA29766@willie-the-truck>
References: <Z5tuaxgDyFJPAvR0@J2N7QTR9R3>
 <Z5uTCnhfKo5D-_bV@NH27D9T0LF>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5uTCnhfKo5D-_bV@NH27D9T0LF>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_044111_571161_A96A5E29 
X-CRM114-Status: GOOD (  21.77  )
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

On Thu, Jan 30, 2025 at 03:56:10PM +0100, Emanuele Rocca wrote:
> On 2025-01-30 12:19, Mark Rutland wrote:
> > For the benefit others, when we looked into this a few days ago it
> > appeared that a GPR was being clobbered across an SMCCC call, resulting
> > in a later crash (as that GPR should hold the ADRP'd base address of
> > 'smccc_version'). I didn't have the time to dig more into that (e.g.  to
> > figure out whether kernel/compiler/firmware was to blame).
> > 
> > Emanuele, could you please dump the result of:
> > 
> >   objdump --disassemble=arm_smccc_version_init vmlinux
> > 
> > ... for this kernel? That'd make it possible for others to
> > perform/verify the analysis I mentioned above.
> 
> Sure, here it is:
> https://people.debian.org/~ema/Z5OpGluX6oX5NLxh@NH27D9T0LF.objdump.txt
> 
> > If you can share any more details from the crash, that'd be helpful. The
> > GPR dump would be *enormously* helpful in this case, and even a photo of
> > the crash log might be useful.
> 
> pc : arm_smccc_version_init+0x90/0x1ac
> lr : psci_probe+0x1fc/0x2c0
> sp : ffffa3d8eea33ca0
> x29: ffffa3d8eea33ce0 x28: 0000000081000200 x27: ffffa3d8edd72a80
> x26: ffffa3d8edd728b0 x25: ffffa3d8eec66248 x24: ffffa3d8edc528d8
> x23: ffffa3d8eed7f4f8 x22: 0000000000000001 x21: ffffa3d8eea58410
> x20: ffffa3d8eed7f000 x19: 0000000000010001 x18: 0000000000000006
> x17: 0000000009f69730 x16: 00000008760968d0 x15: 0000000000000000
> x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> x11: 00000000ffffefff x10: ffffa3d8eeac09c8 x9 : ffffa3d8eea687d8
> x8 : ffffa3d8eea33cb8 x7 : 0000000000000000 x6 : 0000000000000000 
> x5 : ffffa3d8eed7f000 x4 : ffffa3d8edeb0000 x3 : 0000000000000000
> x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000000
> 
> Call trace:
>  arm_smccc_version_init+0x90/0x1ac
>  psci_0_2_init+0x20/0x2c
>  psci_1_0_init+0x1c/0x58
>  psci_dt_init+0x6c/0x98
>  setup_arch+0x400/0x5ec
>  start_kernel+0x90/0x788
>  __primary_switched+0xbc/0xc4
> Code: d29fffe1 eb01001f 1a9f97e0 f0ffd384 (b94264c2)
> 
> The above was transcribed by hand. I double-checked, but there may be
> mistakes.
> 
> Photo here: https://people.debian.org/~ema/Z5OpGluX6oX5NLxh@NH27D9T0LF.jpg

Crikey, you transcribed all that junk by _hand_?! Thanks for the effort,
but next time please don't waste your time! The screenshot is fine.

Anyway, it looks like x6 gets trashed across the SMC. I think that's fine
per the SMCCC spec:

  | Unused result and scratch registers can leak information after an
  | SMC or HVC call. An implementation can mitigate this risk by either
  | preserving the register state over the call, or returning a constant
  | value,such as zero, in each register.

so the question is whether or not the compiler should be relying on the
register being preserved. It looks to me like the arm_smccc_1_1_smc()
macro is actually broken in this regard: it constructs the input list
based on the number of arguments passed and doesn't take the above into
account at all.

So I think we should change that so unused arguments are clobbered
instead. Mark -- what do you think?

Will

