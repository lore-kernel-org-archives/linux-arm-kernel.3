Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A64D5CCB0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 13:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYyWWFhYRCAfnaQMpfQegjXrle2h88tfxIyelrqqD2A=; b=sk/IBsUbwjBundhuN9IJ6cxClY
	MCuKjck2fqoF/GdWCk/P9AYvEz/ygnqa7ezUjI7+gHBdg0OChYibOQdlGsQBogfFyy0Hb7vP/G/PH
	mIpTjQyJ0qzzBS3hYHhGAMI7G10aEV5M8vx6Da8J0jKyEdy8HpFFsw6RXPACcSpF2CpINscnwZSE4
	rfxi3Yn3Zu8BsU7Dmo7pTfc7pcR/5USeVpV7GcR802mGI6t+pmJ1tjTYmT7y5plsI2vboKGsv46yw
	Mjb11v+d4yv6/vvLWXddC1nk34xfGrfzEWbpvwhZHO2CutZy5DRwLyIqxmCbd4BkpQJVz+PCHoCfL
	p0DFCpxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68qg-00000000Ugz-1r3s;
	Wed, 30 Oct 2024 13:34:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68hc-00000000SqA-0OWC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 13:25:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D1E85C0C36
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 13:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B506BC4CEE3
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 13:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730294734;
	bh=DYyWWFhYRCAfnaQMpfQegjXrle2h88tfxIyelrqqD2A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sPkpOGUKP6YRh9qfnzWsuHdIo+HhAPqh83da8CmdT3vl2MIhKvanEItM9VPPvh/Yj
	 zdRdokMDa7L086/V4UuHi8lQHXvxxhggYmUUfHbcRsaKn5VEidObhdNoww6jCLAdLT
	 vEntsBo7IrZVxuVFsb/F99mnmULAI/CVALZI65eK2Pf0mvOcu35lo7GYQ5+ZTtpDpH
	 s+bDWsGYKK016o4/uzyhsujDiRnI4fIVaDruNJG+tPJQAI/uThymOQDrcHH73XmToV
	 Mc88tIfHrNVGaDZhTK0OKUbwp27JF8nUSQsRTOBiZFT2u0+IMqXwEh2m9rhmloq6pJ
	 93izJYRh9gi8g==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f53973fdso805988e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 06:25:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVh7zva+hL0mZCFSrTyN6YhJOQQ8WQBWaTnoBpVsXnCXk75RLlNdcO1IIMyaQ/I4SIOF5sBVm5KIZsQVMZxNKCV@lists.infradead.org
X-Gm-Message-State: AOJu0YzAPHj/kvsCX+EXpZBY3dLTveokkaHTi7SMpSCMheMp2fMBdlnI
	rghJ5UZY4MNicVgpawru/1tTpix4D3Yuytp6ZP5mQ+5pRRctYwOJnyz6BwoHUln2hiPfU8EshYP
	tHlenQNY09iO0+AD46EcJR0vUtPU=
X-Google-Smtp-Source: AGHT+IFa5NPZ4ZduUGr0zqQdLHnPC3Jah7Z4BcbBu/1AywhN6VuZsTUgtXoBp4uZWrclnlDPgyarxQIkykReYK8kL0M=
X-Received: by 2002:a05:6512:33c3:b0:539:f1d2:725b with SMTP id
 2adb3069b0e04-53b493d4205mr1736060e87.4.1730294733142; Wed, 30 Oct 2024
 06:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241030101803.2037606-10-ardb+git@google.com>
 <20241030101803.2037606-17-ardb+git@google.com> <861pzx3gll.wl-maz@kernel.org>
In-Reply-To: <861pzx3gll.wl-maz@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 30 Oct 2024 14:25:21 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFysNcRiH6nFt3UMhJCuCr6VXZ5XM1Pd9x4gjLS6=ASHg@mail.gmail.com>
Message-ID: <CAMj1kXFysNcRiH6nFt3UMhJCuCr6VXZ5XM1Pd9x4gjLS6=ASHg@mail.gmail.com>
Subject: Re: [RFC PATCH 7/8] arm64/mm: Use reduced VA sizes (36/39/42 bits)
 only for user space
To: Marc Zyngier <maz@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_062536_246744_5885F249 
X-CRM114-Status: GOOD (  23.66  )
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

On Wed, 30 Oct 2024 at 13:44, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 30 Oct 2024 10:18:11 +0000,
> Ard Biesheuvel <ardb+git@google.com> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The advantage of a reduced virtual address space size is its impact on
> > the number of translation levels, which affects TLB pressure. The
> > working set of translations covering the kernel side is negligible
> > compared to user space, where each process has its own set of page
> > tables, and so most of the same benefit can be obtained by reducing the
> > VA size only for user space.
> >
> > As a preparatory step towards implementing this, drop all the reduced VA
> > space sizes in Kconfig, and replace it with a configurable userland VA
> > space size that is reflected in TASK_SIZE. This will be taken advantage
> > of in a subsequent patch to actually reduce the number of translations
> > used by the MMU for translating user space virtual addresses.
>
> I think this may have an impact on KVM's walking of the userspace page
> tables to determine whether we are trying to install a block mapping,
> which assumes that the start level and the number of VA bits are the
> same as the kernel (see get_user_mapping_size()).
>
> Probably nothing too complicated, but something to look into.
>

With the crude hack I used, things should just work, unless KVM reads
back the value of TTBR0_EL1.

But once that bit is implemented properly, it is definitely something
to be aware of. Thanks.

