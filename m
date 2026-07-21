Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CF3C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jNF/wdr5AnCE3efKH/glvasNKose7c8fAIiOsTYCr0=; b=rzk4gm0EghpA5qw1sd39XHgF3O
	Boe9wL9iuQJpZdp4ncQonFzddUgwkZsUwBv6hzBG+rEUKfB3+72HPrjCSrlrpTcNExgkaDabve3/q
	ByjtdlIbR5B600wh0J4bNTSMkg12Tbh0r/YGQy9jNPBW+atU1HCCnMr0/iDPLJeOfRkeDV/rSS1jg
	SRoRSDf3oAnW+tUKY3xekwaWCeHK97L+UJ3TyoRUZ0uDFT4ADw9pCrbTSB5Xw5IdxbFq/mmXFdjtV
	gkDGkQYw9u2LrLLbgY2EJfMTfJpoXVgvWZQ5bqe7ONOt1xU382FZ0xQ+cuh2xy4KOGZ/fuwQkADTG
	ZpEpGHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmD7m-00000009ru5-0VLB;
	Tue, 21 Jul 2026 16:15:18 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmD7j-00000009rtc-1g3L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 16:15:16 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso12447368a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784650513; cv=none;
        d=google.com; s=arc-20260327;
        b=qGFFL6PbnyKtQuppE1I0K9svoT6TOIsRWfnPQYJppXMjNk68/atJ/K8VPnY1LrEP/J
         wN7bSUEHv34WfLU/pzyJ+g1xn4lLcJ0ql9h7rUBgwrW6QoqxELQYeTMQgd1ah6DLsGLb
         bTmwR6hAwXUW2ZZs0hp5ne7vO9Lx35NGE36sa36eWvPu41gKPoQLZeQjjzjufFFe5kvv
         Fj2t2pT41xs+cPJ6emq6VuxNz0U9zgrBn8GOz6T/w+XolQfe9UBlggyhDlAcx/FSn0dQ
         +XipDslh1nxiBpPAdispMEpITttwuHtR6xPRkhrg4yOjFMKHQ+xxma7MxrT5JIqElbyz
         ng7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5jNF/wdr5AnCE3efKH/glvasNKose7c8fAIiOsTYCr0=;
        fh=n63xE5ivNLaVOJBtP7on+d0wsA1TkRalWm4RZOSvENk=;
        b=jX98hNjDt18BMHWhOpN3P7P2i3UzeezvUJDWot14DMmNwaqnAyMwUOWPjyUmH0frJG
         X/GUcChdjnyjKwg4MEn4ErtBB0u0Zvgugwt3UPd1CUk3Rff3d2dkWr2RVpVQ3PlZlZ6s
         OiAqBvbpG/bHe57vwaWq1tLyn4BkA+e0QMklLa10opKfLp87WotAPY//eZuc7IFf7m3O
         vFSBNwYRTg6DbYH7BBXdKDldeEBUhphDrE30y10/eCE2Aa6JGM/q/YrxJh2phlTJ76dF
         wkcyg3zdgbQVUW0zXjBGqPsOUhvHr8cwuQvLX3NE3XpvpPFoJAXP4s4PWvthKc4/1prI
         I3RA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784650513; x=1785255313; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5jNF/wdr5AnCE3efKH/glvasNKose7c8fAIiOsTYCr0=;
        b=csgKVT/Yyf2Qc0vPGMyznCcAOZ4cFBJzT5Ow59xZ/Ls1+JxtVa1+SH5/NpyE7NdDtU
         DqqWy2m14asOz320J96DOy/vYWVGxxqZy4zwrrn95kMN42Vf87zxX6DKhCtofCi2sVC1
         rtG9A7Y8MIC+tdONwvEzNvA4E3f9A1alS9PH7T72ZjX6mQRhNyqJAs9/Tk5KcCfYOe4e
         jHN3tOaKxf5va9MFpxlSnJsLZDxqta6y8WRMhi7dQDLEjWE63wNUL4S1L1DYsZO2aDQ3
         o0s8NzbOe1tZgP+f5AhYEypqulM6kUTuhYDOqsz+HCegj3lXiPr02LREBCaXd5jC4svF
         YVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650513; x=1785255313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jNF/wdr5AnCE3efKH/glvasNKose7c8fAIiOsTYCr0=;
        b=QZwRvCXzT4esd6WAOxqic8wk/JZSHvDUnW/zaFO7vJ1Qj0gfOsZhBNXgybW+5+5XHx
         LCyVDWxnQ5vGN6+jPThnepjk7ks7U1NBDW0iHED2PVAUkh9FzVOXv3tsJyWjjWrm0aZv
         yeCURJezzaauR7SkqPGVUDb0wDtGiRB5EPGIE6PysE5UlCzwRf8j3F7U1RAlcC9PpFHL
         eKYlTsj660LSKcTojwJUE7nDyo6jTmnB7hUaAhGojdWVWVvB1T9o6I/6v6IvpfTFhqHD
         QVk15DuReEQ6kBaBS6ntRlVvRD+Rfm9VlUmdpUe3+GGwLm0R/y4eSQpgiRb5DI3gh5MW
         DCuQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFeGmTMPjrKC5KY1SSNXCR2uCUH1NSIdD0fDDPcLavpMgCerO1wufaXaAOl4WswJK75gV1iDw7uwXXt856UtKj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3YZLHkN3oCdxb/qL1UWyop4gKbq7iXF71loTbQQodSmdsPDaZ
	YBdnxABVvVwV5gWRMYsJL9pMsSIlL4qNVAo38hiT06VFDZR3DVLZfv4/MS9sMStw0M1tNTKyVUd
	nrjuxtPCzIS+LV12vV78WtIMuftWcW0icwt8MvM32
X-Gm-Gg: AR+sD123d2ZZFvD/qmDBODSJ+ltclpXH9FolLoiQCHBKrWiSpMPIPkSfCeyejw0bFsz
	I+Xf7H4d8WO36efCEcSMkLFMUjZZRsyGU4sLWnzNJ4tnPeRT5OSyDzJmZ/1Q0Sxr7j13kpBV96s
	/6EIiGigBIE5+rxfjxkVcnL3J71yaC9VGF+lGKsg0REtiz6J1FI5pQk3Liao6gZvWUF/xmM5lBI
	ObniQFs33xHlelcGzdHqFL36r3oKAou5JBNQrCt4goStGLVDPlGAvLHjIJOR4X37jYsAJV7+f0h
	Q8DcU19UfXBuwHNa9iiMtUqPQWItsMbGBxqj8aYiB7APlc/PnyP3xdh0IpYcH44jEM1h8HOT1g=
	=
X-Received: by 2002:a17:907:94c8:b0:c16:9ca5:e547 with SMTP id
 a640c23a62f3a-c16b487d78fmr786880666b.62.1784650512817; Tue, 21 Jul 2026
 09:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260715175223.make.153-kees@kernel.org> <CAD++jLk549ZcSjpRN0G27i1C-n-k-dOpmgvfZBgmHQ5s0F6dJg@mail.gmail.com>
In-Reply-To: <CAD++jLk549ZcSjpRN0G27i1C-n-k-dOpmgvfZBgmHQ5s0F6dJg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 21 Jul 2026 09:15:01 -0700
X-Gm-Features: AUfX_mx5hRFHlWZYNWCg31sOkuFqVIIRwEEvjRv3_jo_QY0cIF7eQh978jRBuUo
Message-ID: <CAKwvOdk54Fi3SHxTNA0sLQn1toDuc8uK4b0nbKYsrB42_gTjVA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: traps: Implement KCFI trap handler for ARM32
To: Linus Walleij <linusw@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Nathan Chancellor <nathan@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Zhen Lei <thunder.leizhen@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_091515_457670_6E42CD4B 
X-CRM114-Status: GOOD (  19.05  )
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

On Tue, Jul 21, 2026 at 12:54=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> On Wed, Jul 15, 2026 at 7:52=E2=80=AFPM Kees Cook <kees@kernel.org> wrote=
:
>
> > ARM32 GCC KCFI[1] violations currently show as generic "Oops - undefine=
d
> > instruction" errors, making debugging CFI failures difficult. Add a pro=
per
> > KCFI trap handler similar to the aarch64 implementation to provide clea=
r
> > CFI error messages, including the call target and the expected type.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> > Clang and GCC trap CFI failures differently on ARM32. Clang lowers
> > its checks to a BKPT, handled via the breakpoint/prefetch-abort path
> > in hw_breakpoint.c, which cannot recover the target or expected type
> > and so must report via report_cfi_failure_noaddr(). GCC instead lowers
> > KCFI checks to a UDF (undefined instruction) whose immediate encodes
> > the registers involved, so the handler can decode it and call the full
> > report_cfi_failure() with the target and expected type.
>
> Aha, that explains a few things.
>
> The UDF is a better approach for ARM I think (Russell will know best).
>
> As noted from earlier conversation the breakpoint usecase overloading
> on ARM is a mess, and we would certainly like to avoid it if possible,
> albeit I have a patch in Russell's patch tracker to paper it over.
>
> Do you think that long term we could switch Clang to do what
> GCC does?

Yeah, I think that's reasonable.
https://github.com/llvm/llvm-project/issues/211032
https://github.com/ClangBuiltLinux/linux/issues/2176

--=20
Thanks,
~Nick Desaulniers

