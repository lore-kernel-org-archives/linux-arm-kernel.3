Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745F2CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cStxNPR0+6f9gxfR6Jcf39Q6otOQTf0Wm6ycPUO8mOo=; b=OjBjYIWcCqY9TaxNigsghFi7dm
	n5xPUSE9KZb4QlbSX2arzcSGfFkmsh0wob9vYmBtDvg/H0RZXUUHfVHQzbKQdTueH/n4RIYec7pg/
	8tTKt/KgJWsnccKNGRD8WsBe6iQIKjgdUnhMCUlsF/ylzxxhYUR/KFDCDu3rSOja83X/su2vRPArc
	G2oFXUMSOxl5fwKH1Ntd9MVnBRN6oXT1OsEeFbjgzqRppwEG5Gjd3nNq4/jU1Z2CpcXQkGwIFXRMF
	Y+DOUsmBMTrx4fcrWnviRv9sl1v0IvBl2JFYF8PIqvgRcXtmtvQdee66janFaRm4dtcKoevsplELc
	vMCWqQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aSk-000000091hD-1ihL;
	Mon, 22 Sep 2025 06:55:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aSi-000000091h1-3y4r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:55:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47C47601E2
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49CEC116B1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758524147;
	bh=cStxNPR0+6f9gxfR6Jcf39Q6otOQTf0Wm6ycPUO8mOo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FI+Yzh+sxnP+7y7AeY/UzD+AvO5J9BcZlzQ1Ig9XiOhmmPIGaHdmNLQO8yPkfSvpY
	 GmXGfrpVJsPf4MehwrNyRufodTnae+ejYEvF1SrCdwXJSMGZO05+qUgM/6qjzBOBK4
	 VSp9qYhI0rB7d8MHHb8IwGZllDScC+k362rcxBpeO/lx/KcmcxJr+pVg/YsnEihcvz
	 uL8LEo1EGp7oWP3Bk20pEycuJ04Y6FJ8h+CAeL4CBgKABmc8YvB9c0bz5K9MFPqbfB
	 cmdnUeX5/qc2YV9s/PCtkgjCqdv7dy/k5mraTiuVjhoWWMQodcdwnB8Na/FvQ8WK+M
	 rE0JNpsJ04NCA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57e03279bfeso1065264e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 23:55:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMVN6Wu5zgNF/KNpm94zFyb7IU2jyun7kYxqbEg0Bcr4/W5xdiLlpaliF8IuK8+OOuX3WEQJSceX9Nflg6LXqD@lists.infradead.org
X-Gm-Message-State: AOJu0YwGRfIAeAT/04fTszAvcGhiVFAFAF8SwNqfNwKW8SPY7QkPFGgv
	Fbt32GuceyRg6MhI97oljvuZTE0cKoqxRnzHjFMS7cKUEZ+ZyrfjT+rm1Yd70BKLGXmdwzWTR2o
	Vgtifb4Nzd+U2b/HgwETPOdBgy/G0ZmY=
X-Google-Smtp-Source: AGHT+IFEuuIizw00M5tOMIlDV79GLzIy8VumPMrZQwg+c8cGe2MnwvUkmO7jOkF/XPepPXL3XhK5bQF243dup2ewVbE=
X-Received: by 2002:a05:6512:39c8:b0:571:75c8:43a5 with SMTP id
 2adb3069b0e04-578932c711amr5316823e87.1.1758524146258; Sun, 21 Sep 2025
 23:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250918103010.2973462-10-ardb+git@google.com>
 <20250918103010.2973462-15-ardb+git@google.com> <19b370e4-d6a8-4a60-bc14-4adb55616040@sirena.org.uk>
In-Reply-To: <19b370e4-d6a8-4a60-bc14-4adb55616040@sirena.org.uk>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 22 Sep 2025 08:55:35 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGrbQW-0ERuHWz1cGhnm81j1_2Kf_FEUT5pzZZa=9Cuyw@mail.gmail.com>
X-Gm-Features: AS18NWDhOO8LR2J_B_pV8xirK6v2Tu0IG5sHBmb-PL3i5tNUhl9Y83YVb_5Bcvc
Message-ID: <CAMj1kXGrbQW-0ERuHWz1cGhnm81j1_2Kf_FEUT5pzZZa=9Cuyw@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] arm64/fpsimd: Drop special handling for EFI
 runtime services
To: Mark Brown <broonie@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 18 Sept 2025 at 15:10, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Sep 18, 2025 at 12:30:16PM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
>
> > Now that the use of kernel mode FP/SIMD is generally permitted when IRQs
> > are disabled, the only purpose served by the EFI-specific fallback code
> > in fpsimd.c is the case where an EFI call occurs from hardirq or NMI
> > context. No such cases are known to occur in practice, and it is
> > doubtful whether calling into the EFI firmware for any reason under such
> > conditions would be a good idea to begin with.
> >
> > So disallow EFI runtime services in such cases. This means all the
> > fallback code can be dropped.
>
> This is a really nice simplification, with the fixup rolled in:
>
> Reviewed-by: Mark Brown <broonie@kernel.org>

Sadly, this is not as simply as I had hoped.

So even if we address the irqs_disabled() case, there are three
remaining code paths where EFI pstore may end up calling the
SetVariable() runtime service in hard IRQ or NMI context: panic(),
oops_exit() and emergency_restart(). So disallowing this is
problematic, as EFI pstore might be the only way to do a post mortem.

As such an IRQ could potentially occur at a time when the FP/SIMD unit
is being used both in task and in softirq context, there still needs
to be some special handling, even though a) this condition is
vanishingly rare, and so having elaborate logic like we do today that
is never exercised is not great
b) much of the logic deals with SVE which is user space only, and we
can just disregard that under the conditions where we may enter in IRQ
context.

