Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB4ECCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 16:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqAGe9wbhZGQLC5MPRkQeOg2lqMJuJVpuWDe7VYArwk=; b=uMi437AWOJH5gi3b5byHWfn1bH
	/zitRJpDlD8c38+ADfn+3lGfoIpVDlcnhbBRSMSDYWaDekO1kCZXbdGPHHcBjDA5IF1OGMF1NJf4H
	ICJnb2VIFJtABPm8cyN4Pxq+0oQ1H3aw/NaD47sVX3w19BwHWSGxB0H95Pon8sy/L84y3blrXNUIQ
	ng0uB47u3nUeeYkdWJkx4HOXDwnEs7dlVx9RKdinfSz3RK7YbQmiLCNPREvwCmALk1JfffzAkI2s2
	sp9EGPne30ZSLEIHDLEE8N7ackTKhWX3BRWE2wETiyzQCZjl/vfx66RoYPlQMwKdlZzwhkcpgmvY7
	gVfb0YAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJSk-0000000C9Sl-16ud;
	Tue, 04 Nov 2025 16:00:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJSh-0000000C9RL-2ux7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 16:00:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D14C44778
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Nov 2025 16:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDBEC19422
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Nov 2025 16:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762272046;
	bh=ybUNx2jIsLvN4wny2PiVPksAIEQ72qetHRtyXmJ7k+c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aR2MSp67zqdggky6ji+ROENkuohDPiaQlj3TFfzgJuVOIikzpSfzs+sq46ojKZw8r
	 A5FlDZe39wDsjKHO5j/9noGKuu2zvq7e8tf44OhtOPqKRjtpZXmupTez8z6OzE3nXu
	 BPq0ODTnbiP9WZQxzzsuKr6vJD68nnX526E8EvNl28saz18spNanPFefLHsLu30olA
	 I6oCp9oHONaotM3RZD+oIso/ZtQSugSn4juCLOk6flkvIAYl3WRR4Y3gHKUl5Y6WHW
	 Vv8dDByVwHj5T06QxIxCa/RGTB0pRLkYg8miXLppj54c+LQdSYShe2HgwA8gQSAbW2
	 ibXI8F9kXwDiQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59052926cf9so6311758e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 08:00:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3PCQaTrLtcFkJkJ4lZqanx7y5qA38awe9AFOAGJUUn8CilbhMwN/bM1Bd8hTDBuRhaKsHPyjm2jtmuCqJALnf@lists.infradead.org
X-Gm-Message-State: AOJu0YwIdLxBZMe5AuT4I0jTFOoWB++JtkykAQz1/6S27qN44aHlhbtE
	sjXANG8ILBphorSn1coQ8JnkF7SRZQJRS+HbtXO1CsKlVbEmARJ4Q7OTx8NK7RjN89S8frCWjXG
	4Z4CrsxDPTnEL0onlUGfQiyMSfJZicuE=
X-Google-Smtp-Source: AGHT+IHl4TYsbIp7q7RcLM8gvEfvv4DHuvd8GjPAShqj+bYodluXicBE5Hx5rY1swrBJdmW0rYHy3/YN70gri25XdyM=
X-Received: by 2002:a05:6512:2391:b0:594:33fc:d52b with SMTP id
 2adb3069b0e04-59433fcdb46mr1505550e87.36.1762272045211; Tue, 04 Nov 2025
 08:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20251015205634.3820870-9-ardb+git@google.com> <20251015205634.3820870-12-ardb+git@google.com>
 <aQohO07DpxlriQfJ@willie-the-truck>
In-Reply-To: <aQohO07DpxlriQfJ@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 4 Nov 2025 17:00:34 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHJ8QWLE=awDUpNa0Cf_1YXMQaW-Se1NvvavOocshDkTQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnZWe2FwdCEPmDBbfXyQD7IMRyef3q6dtPcCDOW1XeyOM1FaYaJOwR85bI
Message-ID: <CAMj1kXHJ8QWLE=awDUpNa0Cf_1YXMQaW-Se1NvvavOocshDkTQ@mail.gmail.com>
Subject: Re: [PATCH v4 resend 3/7] arm64/fpsimd: Don't warn when EFI execution
 context is preemptible
To: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Brown <broonie@kernel.org>, Pierre Gondois <Pierre.Gondois@arm.com>, 
	Sami Mujawar <Sami.Mujawar@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_080048_059393_141C319A 
X-CRM114-Status: GOOD (  23.35  )
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

On Tue, 4 Nov 2025 at 16:52, Will Deacon <will@kernel.org> wrote:
>
> On Wed, Oct 15, 2025 at 10:56:38PM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Kernel mode FP/SIMD no longer requires preemption to be disabled, so
> > only warn on uses of FP/SIMD from preemptible context if the fallback
> > path is taken for cases where kernel mode NEON would not be allowed
> > otherwise.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/kernel/fpsimd.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> > index e3f8f51748bc..3d848c89604e 100644
> > --- a/arch/arm64/kernel/fpsimd.c
> > +++ b/arch/arm64/kernel/fpsimd.c
> > @@ -1934,11 +1934,11 @@ void __efi_fpsimd_begin(void)
> >       if (!system_supports_fpsimd())
> >               return;
> >
> > -     WARN_ON(preemptible());
> > -
> >       if (may_use_simd()) {
> >               kernel_neon_begin();
> >       } else {
> > +             WARN_ON(preemptible());
> > +
>
> Given that may_use_simd() returns false on systems without support for
> fpsimd, I wonder whether moving this WARN_ON() actually helps with
> anything.

This code is only reachable if system_supports_fpsimd() returns true,
so may_use_simd() will only return false here when running in
hardirq/NMI context.

> That is, you probably shouldn't be calling __efi_fpsimd_begin()
> from preemptible code regardless, no?
>

Not sure I follow you here: __efi_fpsimd_begin() is generally called
from preemptible code, and it is the EFI runtime wrappers themselves
that disable preemption - that is the whole point of this series.

