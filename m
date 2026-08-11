Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412BDC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 17:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGAMSHHCOy6Ofyjr6GQGUC1+QOQEyOWjz2kH/2YxslA=; b=vI1D5+aPm4HnwlK5Jt9RZGK0Ac
	nKDlP25qK/8Iv+aA+gt9AvrALj8MVRfgCftyA8777mX0bRwA4pYtjQy1VFRRWno0na9JvpiR2oq3H
	Z3lgJcJJKNKcCmLbtu/KwX/01A3KQ8zJmCzZjHuxlReLPWf2zRwt2GwAn44kIFGiQEdQUw/duwfUS
	4/1HUZ9Nw+FKyQaEMVlpXLARdCUy4Br8qxa2Eb7LYcbfFhK5xSOBO9rt9FylUaNj6MiyWeg7yhTeF
	yYSnpdKCgjiGj2zL1Q1uTmtiwGHrFcbvnL3pC0eYdD+NNdGmbF10NkNA3VCBsaMs12q4Tl7Q8SIpN
	V1vzX96Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpux-0000000EaxZ-3xAN;
	Tue, 11 Aug 2026 17:05:35 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpuv-0000000Eax3-3RXH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 17:05:35 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6a17c04563fso52996a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 10:05:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786467932; cv=none;
        d=google.com; s=arc-20260327;
        b=mw8jgKWvx0pc6fdt3eKZso6qp24Sx1dKsh0+915iHN1As40MQ6jiBbwN2rmqSUNXs9
         0s5tTxf429EVZToWelxFfziq9ljSKk5yzb9K7Zf4CWYTI0tb9bCgd+CKMQ9nDW+gIpNN
         YsZVyuVlOPYzxFFiBJyPE/APoje0UMezQCRMnfsCGd/IzAsR3RmwBWNH3vb1HZ1LAWCe
         Nrhl2F6z6/5E6K7hUyykC/QZrRKXo8r+zEU1fI9A6hPcVfKrJzd5v39ZmLHu8dpdLUn9
         yhbtirDlvlrwKQwZed4oSpTjmpcMMmobTlhKqzWBZRpBoKwVCsf936nTZBivpzwya5PF
         EOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pGAMSHHCOy6Ofyjr6GQGUC1+QOQEyOWjz2kH/2YxslA=;
        fh=30cdeXHZ6DVWQaaPzzUnUHKtFKthWGiwSnypl3XK8+s=;
        b=MOUY8Isgnt+4lBWIEjZzjnutm5CJsbv/z5uHp2sKUtU70CoslnmFV6qSV9VX4tWU2h
         cmJNXVB+fy3z5iT5lkXI2EhUXSRIVHdVeUOzMQxH7QwSwe2U1XYLLAzdBo1ItE7tju6v
         eKfU3hXUhZd9hGJjpNSE+pAtmGEXzERM0mBd/xP73fKCLnyHGhsLcDgNx3J05/i5/j/m
         QahGi4nm/ahuJW4JZi1RSSJowyUZmh5GdX7Y36aAQBqPTNU1U1tuBzVwMI0QarweJPCD
         7v8vVZBphoom+HjniDSNNI+/rkcZQ6BmU3KB1itlqoMY43hZLDb3jI1B3MuWmKOqiWT3
         7zhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786467932; x=1787072732; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pGAMSHHCOy6Ofyjr6GQGUC1+QOQEyOWjz2kH/2YxslA=;
        b=ZyBR27RZe9UKfUuX6qN9+xm/Ip5auFvngTy4Lw55Cn/BFgIk+rvZ+Jgs7sF6n3C2fs
         wFuxzndbV0f9KQWG7XEq4nhvD58Rc5ghVRpoAXLdFFJKdkR2NSpTyNR0db8a5Yl9dWBK
         q1IKA9n6oGzS41BMO5A+p5/DLyLYtAFUoVh86a8zH98RfGNY9n34VcygJGpfGbBm8DCc
         xPhfXDHAkV5hSIKrUALA2l0+bk/iLf6M3r5yELoI5C+tobJKTi2YOrqphDYY19NrgwaV
         IgA2r9X53FVsYuEC5ZTs2jLHT50Dme2Ya4qe3GyvqCBPhhKM8rXwurzOYyhkC/lXAKS4
         KPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786467932; x=1787072732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGAMSHHCOy6Ofyjr6GQGUC1+QOQEyOWjz2kH/2YxslA=;
        b=H78povs4bwzlmQmGjSciB6RrblUeSPs8O7Z9AMDTXNC69kpiHWLhY025l39PdniaXn
         hTnRFHE6HUTZ0zHSrDe9OUjnK7RbbYGU+y76LLUxZnWt6Y6r46usXhk4tIgQQWetqUmS
         cTuxeK70a50zcVukrbJMKPIQ7B+bcqGCd15SBj/Zau324mj7/BBRDudf8HiRgh26pfRO
         TDwQJwATuu6yttbksmuGvfvLogMXmjP/x8GJC5R2Izjr8IEwAqJ6++O9H4m9Ji89lkgN
         w9qO3qR6cIa5muu19JBc6rpU+Qp/7sEErxQ0ywBBxCeb89ENPXbYXMpDaV/j7cvnsVWa
         W6Qw==
X-Forwarded-Encrypted: i=1; AHgh+RrIqGaMqdUmBIDiRlWU95CpQJMxavN6zzSXLJoAUbptYN1chwoXUBw0756+O2bpV73sjRuWFW7zyPFhOCWUcQJL@lists.infradead.org
X-Gm-Message-State: AOJu0YxtDKmiRDguCVWjrRcHtVDc1X1iaNuJkwC4LrUJUfU/wXfZus4e
	Jhkc9bFzcE1KAGNTSTz0IzLsaS5Yi+jZg5fnvVg8CbNCksF81w4wRh1F6bqZaH25Zb3+1NYD/CX
	VWxORzx+QRFvdQvMVE3ajDNCKc5Pm5gykECh7tVZO91Dg+NQ7gR1U5n8F
X-Gm-Gg: AR+sD13s4GAsSLXoU2SDYJPrK3zIgp2OnZDICmrqRc/EMt54fJamzTUtYZRHRxlREe3
	lJrcadn+ClBKFngIwz7LiSjYZ46GbQsFS51to3WxSqbDlgqg0/pe2S70VJcoxFbafDgVy93sodi
	alhXfFNGRfzSStEn3jYj6DL8SqofXhVRoduxBIlw8iaW2AvZQPGMFBnTDPwCj3LfoqcxuvDETQJ
	Mkb5ev9s48MgZ2sTG5zP77RRfsbqLxSXSGgo9Dvs0xM7OHDOUVkJG/E7w1gWIM+fxnhevuddp+1
	7uVHNIA/tWDILgOGtngwCSSTYC3EzZTR+ekpDP5HV7vCGnM1vdQVd1K4JrKWGpbyyncfmWKGrTs
	pAJy3vBlzvj47RQbeQtiYwa1MpRuxSzNXfBVbKck5yPIVe6+ow1TwqzWr
X-Received: by 2002:a17:907:3e12:b0:c12:74af:51f3 with SMTP id
 a640c23a62f3a-c20e6001576mr216510566b.6.1786467931201; Tue, 11 Aug 2026
 10:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <anmobvJXiBQqWn6S@willie-the-truck> <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
 <08d6c5cd-9924-4359-9181-a03718161528@app.fastmail.com> <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
 <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
 <anrvDIWMNGIa4WPK@willie-the-truck> <4986ac98-d6da-474a-b218-b6468b68cb9f@app.fastmail.com>
 <16e3ed42-1b1f-4ddc-9d8c-5e12ee7dbe3c@app.fastmail.com> <answWdRpVQLtIzIj@willie-the-truck>
 <CAKwvOdkrxJ_9qjaBNQS+o=+_m_f3e9k6jMEmXB-S3+nXGoLV7w@mail.gmail.com>
 <buq25tpmdjlvskzfvlit6swc6tsjuzbdnjfix4w6af6247zads@ka44wuolomci>
 <CAKwvOdkS5ZaBGaoiLwcXqCBjcOXLXE88VD3bj5ES1sssKFf4HA@mail.gmail.com> <b4bdf563-274f-4ab9-804f-35c47ab2f353@app.fastmail.com>
In-Reply-To: <b4bdf563-274f-4ab9-804f-35c47ab2f353@app.fastmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 11 Aug 2026 10:05:19 -0700
X-Gm-Features: AUfX_mzxcGN4sb7ijjP5MydmAq4VJWRREtt4XkYwb-Zv99DfIfR8xj3RcsJ8Zs8
Message-ID: <CAKwvOdkn1WycY5d1EaOTdWWL-wH1wSeWxDGJJgmt2QW7PoQp4w@mail.gmail.com>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org, 
	Song Liu <song@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_100533_888591_4AFDA607 
X-CRM114-Status: GOOD (  28.92  )
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

On Tue, Aug 11, 2026 at 9:55=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
>
> On Tue, 11 Aug 2026, at 18:52, Nick Desaulniers wrote:
> > On Tue, Aug 11, 2026 at 9:41=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel=
.org> wrote:
> >>
> >> On Tue, Aug 11, 2026 at 09:27:28AM -0700, Nick Desaulniers wrote:
> >> > On Tue, Aug 11, 2026 at 7:23=E2=80=AFAM Will Deacon <will@kernel.org=
> wrote:
> >> > >
> >> > > On Tue, Aug 11, 2026 at 03:18:17PM +0200, Ard Biesheuvel wrote:
> >> > > >
> >> > > > On Tue, 11 Aug 2026, at 14:02, Ard Biesheuvel wrote:
> >> > > > > On Tue, 11 Aug 2026, at 11:44, Will Deacon wrote:
> >> > > > >> On Mon, Aug 10, 2026 at 09:41:35AM -0700, Nick Desaulniers wr=
ote:
> >> > > > >
> >> > > > >>> Sure, but let's replace this with a link to a bug report in =
llvm's
> >> > > > >>> issue tracker?
> >> > > > >>
> >> > > > >> Yes, please! I can apply the patch once we have the bug numbe=
r.
> >> > > > >>
> >> > > > >
> >> > > > > I can look into that.
> >> > > >
> >> > > > https://github.com/llvm/llvm-project/issues/215547
> >> > >
> >> > > Thanks, Ard. I've ended up with the patch below.
> >> >
> >> > What's the extent that HAVE_LIVEPATCH will be used?
> >> >
> >> > Does this penalize kernels built with BTI in favor of HAVE_LIVEPATCH=
?
> >> >
> >> > For example, with my Android hat on, if we have a kernel that's buil=
t
> >> > with ARM64_BTI_KERNEL=3Dy, and _dont_ use HAVE_LIVEPATCH, we're goin=
g to
> >> > turn off BTI for a feature we're not using?  But maybe we _do_ inten=
d
> >> > to use HAVE_LIVEPATCH, and my assumption was wrong?
> >>
> >> The problem isn't specific to livepatch, livepatch just makes it easie=
r
> >> to hit.
> >
> > Rereading Ard's report, let me see if I can articulate _how_ and tell
> > me if I'm still not getting it.
> >
> > Let's say we have code in .init.text that calls code in .text. If
> > .text was placed large enough away from .init.text, we get a veneer
> > inserted by _the kernel_ (not the linker).  This veneer has an
> > indirect call to the destination. No landing pad. Boom.
> >
> > Is that precise?
> >
>
> Yes.

Naive question: Could the machinery that emits the veneer instead emit
N veneers, one for each cross section reference?  Rather than one
veneer that could branch indirectly to N destinations (that probably
don't have landing pads), could we instead have N veneers that branch
directly to 1 location each?  Are the veneers larger than just a
branch?  Is the destination unknown when the veneers are created? This
would retain the landing pad elision optimization for .text (which is
likely run more frequently than .init.text), and you could probably
put those veneers in .init.text and throw them away with the rest of
__init.

--=20
Thanks,
~Nick Desaulniers

