Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D1DC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSKatUPQUSBPvcMC3lseZ9L6C9yIZfA5H7J4cOXY5tI=; b=ejz9ZFWiApe9Jry8ti66L+UR6G
	5GairZXeCMWFse/Ltt961Y2/qqJnC5Mog1H4CI24FMwGzX8iZ7y4wJUED0rh664Q5hEo91y/7XyHZ
	4S1wR2jE7eHCyBYAlioCQWoTlQxrwXjcZl7T3iCq3J5wQZfEgvk+LZjY1/IBINFnyUrC0D19JF/+c
	cRnyRjJzA4SrIf8pFBJ2AR5ez0Akuche7XxRG6nR6u8syI36qh7QBkK5y4GLBfd8IpPQwTXi0mhwb
	+CtFKsfuM7NrLBt9HquDcg97V0lJT4R8tDaiiTNPbtJ9qAaA8JjHksfH6noOn5r1RYeMeNHP7WmzE
	9gpt0Dxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtT4T-0000000CQhF-3YZM;
	Mon, 10 Aug 2026 16:41:53 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtT4R-0000000CQfw-04Eo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:41:52 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c2055573c8cso272322766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 09:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786380108; cv=none;
        d=google.com; s=arc-20260327;
        b=UzmEbXzfGThuXeasN5FPQbSjqUw+6prC7G+lAg9jr8fdSplCxnIL298QjdJaoHN895
         kpyVFUipAN/Ueeaa8J//W/UFiZB9NOw8xbNKgFDB6DJJW7QN/88sj5z2QA8mivCbQVhp
         upzOhSv5HlqxJXG4f9yRm0cTKs2zazgZgq3Kf5LsRaH4UyZSyPFsmDzs5sR5+754cBdQ
         tIjIewlODIyRAsKLsHdTDWXrAxPHScqbQwAhvg+Q2gJyp5nJ2wojZ22jlYm53KSbKpyi
         txoaDiaa3oIbNxFuk9u0Mcwf36cG7usy2tGj+UYH7SR6Ic7LOAHqDV8U/ZrgqlXJKI8d
         +z2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QSKatUPQUSBPvcMC3lseZ9L6C9yIZfA5H7J4cOXY5tI=;
        fh=mvxoq8Ok8DZtAZ57gwFrWRPJ+raxPO/NQ/5tmAkXDAE=;
        b=oZT1nTlKyIogl6QwNEZ8k9f/jMTYB1tDRjWMlIuyUs+rdrzx+B9Mhd8uPoZ6kxqYEq
         X26Ez+ghyOetzTYWOT30TcPGy3tr56CoaufsDJtehjoTRFU0mkbCN7FIDPrSMgkRF+K8
         MOsa0G2KI1vGVbs08vvc96a+XDmXBzorS/GtUAqB9nzYN+73uBmDV45b4HXPwnoPex7I
         HFjJ/6M6SEcZ6gg/1vFgIi7LP0amrSD4WcAMUSHbYrdkcvgeD2PwAkaqPlzPrgeVgFxQ
         hQcjyo6fFZTQFnpcFshEXTztdjZcnkaIZcuQGLPzB26dC5V8ROKeQSwQrtySfE98dSNP
         YOjQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786380108; x=1786984908; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QSKatUPQUSBPvcMC3lseZ9L6C9yIZfA5H7J4cOXY5tI=;
        b=M84bTBOyuuigiFtDowlEn/zAh+jlARZfTaNnltxTfJyl7tm2QLuMirXyIDAno8PAOs
         /TA6JzniKT6NpNn5JU2eqXpp3TOUHBdP2uU7fEOwvbrc0DPtsWoPt5apIG9vJnfDIip8
         Kpevv4yixJJ2AewkUJDtrEQKu5eUQ4sxptHKV+BlhH7sbRPCT0+/7moSeKzEuooXCQ9S
         Yu9OT40Qd6S4Hk0oLOs8n6F9DyUQgu1TQdeR0bL1t2Pw4pm7WsYH+TB6NFZoFmZHDePB
         y2eftKpfuAIH5e5/O6YeCxCZ7s1E8oXG1oYn1QgKNX4kloQNxb88/vgcnMvFabueBtQJ
         Gdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380108; x=1786984908;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QSKatUPQUSBPvcMC3lseZ9L6C9yIZfA5H7J4cOXY5tI=;
        b=VkYNSQIftWA7F+3IcGjhT2d6xnPHX7vVgrqLNw5zvMrAxR325i/RL+LI8iHen4aKfW
         BffG9PaB44clz+YvySPK9kxlCrw43cK9FDTE0PHcuRXVIbjVf8OBeSe9NdHaXChf9ujW
         hNU/8CJcsYdCBF1I73w4OhOzR088ToBqHe/+n3WFRZcQkRgNjvIX2WXLwGZnIhlJC4s9
         SgftOH5IgJe062Itwp9JlZZ8g+XyYzPqMOHE1sjdYCYAkm9xkpPkUArcaQ5EcyYprva0
         +nlYNkF7JUafZO0idgvfOWCu4AufwKS4UHZp0AwTzHw3Jk1StszXSYknLGX5udYGtknC
         uXGw==
X-Forwarded-Encrypted: i=1; AHgh+RpY+KAonkh5DOgQEkm/4aBL4nQ7gGnSqKIvanq0ip0dq8QL67myiCUNmVhG404t25G8x5HG9LNE/6rGfh9ytw0r@lists.infradead.org
X-Gm-Message-State: AOJu0YzuVXFLjHtln7z0TQzdSI5X+NeWojwXWfTWa3PnE/6Xxy4kjCak
	q8H9u3Lz/SX6GVa9fxTcj1V74eKJWjJPYnBDjeAme2n2Fbzvy0h+V6q3KzcAFBSKly2CTj5URHK
	ikPsn60xR5jruOBsPRa7piPJ9g3oNExP+h27xxPSl
X-Gm-Gg: AR+sD12fj/jmTyiW+YbXdRvnLUMQyDxJahULyYWzjf9r+EzWNqyfhByBAekxFEfxZv5
	8mr4HPG9aSOMdQHqBpZkUl7dX5UsynBEceBD1wGY5+HGPa53qKjTJTAVcAHrIW80OVwj91ZFMje
	PzCodMXiLNkgDvy3CIv8GB2Ua150GmmHzVZ//URt2SfM4acWqYPtbK8gOKXUz6vGrGdcjz5XuRl
	N4p0uqrbtc5SXvw6TiLFm/m37qCFiLbkth5qVhwfgDgyJD0S6CdcViGLwvoLjhthrftPOGH6Bem
	mgwVC/m7pSl4EmsGIezb9GnFIK0dQRANmw0DBjCMjMsvNR9GA6weaUU09wtTg4dPvWKKOpO2HJt
	/E9xkWg1JGH2olBSpLh+pFreI9tA+8QEXmdTQ4gtmbjDYL79xIM6ivYj8tvg=
X-Received: by 2002:a17:907:9609:b0:c16:209f:d48e with SMTP id
 a640c23a62f3a-c20c6bdf463mr142480466b.30.1786380107271; Mon, 10 Aug 2026
 09:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
 <anmobvJXiBQqWn6S@willie-the-truck> <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
 <08d6c5cd-9924-4359-9181-a03718161528@app.fastmail.com> <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
In-Reply-To: <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 10 Aug 2026 09:41:35 -0700
X-Gm-Features: AUfX_myt_EPgVNH9ESgpTukvUmbQ0LwgwTGLNV8fLE5SC2HKTnOUXN47dXl1kP0
Message-ID: <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org, 
	Song Liu <song@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_094151_084965_6F824A33 
X-CRM114-Status: GOOD (  30.49  )
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

On Mon, Aug 10, 2026 at 9:39=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Mon, Aug 10, 2026 at 06:12:10PM +0200, Ard Biesheuvel wrote:
> > On Mon, 10 Aug 2026, at 17:48, Josh Poimboeuf wrote:
> > > In which case I think to properly support BTI going forward we would
> > > need two "veneers"?  Either that or remove BTI kernel support
> > > altogether.
> > >
> >
> > Yeah, it seems we did not argue our case convincingly: their assumption
> > that veneers/PLTs can be placed within -/+ 128M of their target does no=
t
> > hold for us. But I don't think it holds for .text sections larger than
> > 128M either, so I'm not convinced their reasoning is sound even for the
> > general case.
> >
> > I suppose we could special-case the PLT logic to use direct branches
> > where possible, which would probably catch most of these (assuming
> > .text and .init.text tend to end up close to each other also for KLP
> > modules)
> >
> > For the remaining cases, we'd indeed need a second veneer at the callee
> > end (i.e., inside .text in this case) that is emitted when resolving a
> > cross-section indirect call to a function that lacks the BTI landing
> > pad. But that would be its sole purpose, so I don't think we should go
> > down this route. Instead, the 'address taken' check should include 'cal=
led
> > directly from a different section'. Emitting veneers to work around a
> > compiler optimization is just plain silly.
> >
> > I'll try and poke people on the Clang side of things to revisit this.
> > I guess that leaves kernel BTI broken for the foreseeable future but so
> > be it.
>
> Ok, so for now I suppose we need something like so?
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 06b30924509ac..972988238f367 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2117,6 +2117,8 @@ config ARM64_BTI_KERNEL
>         depends on !CC_IS_GCC || GCC_VERSION >=3D 100100
>         # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106671
>         depends on !CC_IS_GCC
> +       # https://github.com/llvm/llvm-project/commit/7af2b51e761f49974a6=
4c3009882239cea618f2a

Sure, but let's replace this with a link to a bug report in llvm's
issue tracker? I meet with Arm's toolchain team (of which Simon
is...on or adjacent to). I can bring this up then.

> +       depends on !CC_IS_CLANG || CLANG_VERSION < 210000
>         depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_ARGS)
>         help
>           Build the kernel with Branch Target Identification annotations



--=20
Thanks,
~Nick Desaulniers

