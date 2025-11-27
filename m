Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D35CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 19:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyik1ppWsyn99IJmPwJb8rPtQa356xa43z61sJ0psZA=; b=AruENwCYAEFXP0xfInljM9Hnuv
	8twPVBSzRiODfOIMWBAt8ViKxL+RMbjT6cIRHgT1cbmDA83OTD0wJcgmJFitnx/0thvaXGr3Ed1Fi
	1c5NFFCUyf532i8Ah1dpBmtDbdLz35EP8UbUiFgQrZfZEsPqGDu47GhlogPOGqJtvwvvuddzjpEGi
	N7w4ybaJ/Uwcg+6dW+USRJ1a7EXutuFiKkb614vjlPIPWMPGcD1Bv4aAUAfhwZZntMo6A0GDTgTQH
	uZQUQT+i7bqF/HdYraL68lzBiWBZqv1aYjtEHnhCUNlMw8+83Q+vc0ajiiAUozSZieUTrHy/MTpzR
	Wq1zX88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhFP-0000000H5pZ-37io;
	Thu, 27 Nov 2025 19:01:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhFM-0000000H5oy-2yni
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 19:01:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 178D14170E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 19:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED906C113D0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 19:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764270100;
	bh=pyik1ppWsyn99IJmPwJb8rPtQa356xa43z61sJ0psZA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Vd08SOMlOgwGw5/+/GvAcXLiRh+3UiHakhJGwaq7DkutarH+xGtveL0OcdQW+C2wR
	 HslVDSCTWkDhes4fzOLL9pRjnXcUouVIuP6rQ32t7Kw7WLuisK2UvZbxRREieyZZFV
	 aCOAYyzamwmv/p6K+Ejv8J8BKQhqN2DAPB9+S/vGmFzw1A2uFR1rz4dIeFS21SKMYQ
	 /ZwDAEjHYVwia2F7ENmsgCu1yJ4ZmmLXjslYDCtoZaKR62LKhM3KBFuRJle8gQsA51
	 vrrsY3UsrrM0m6gXDZVNXzUMNkaQW5gl0zhZKdDLcTpnMrBoCR2RCrtM+jjxDQ7OSu
	 uoZq2xbJo6SJw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37a875e3418so8060091fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 11:01:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX68bdcKhv+QEuppEjkRF+SkqMIHFHY4n/svkq3jg/j5ibRAE1ejkPzT566qc+62T2A/vz5iaY2OGczmAY27ThE@lists.infradead.org
X-Gm-Message-State: AOJu0YwIp3Lu9Kfx5/49Wc7lXWAYFfQ1NrH637uxAsWisAnSAe8ip58s
	63dYEtBWTYTftbifhoMN1p9p0h4kglfSJbMxIJIvw5oGlqvbtdPCKL6ZYHY7588R6gkObx08Ohm
	jibDkBwVKScXmlm73pO9yBKLBo37+cso=
X-Google-Smtp-Source: AGHT+IGwO8km+DEKBaxbbTEf6xRCO3rvZTLW39354N1V9n8/1e78+i+7IjvkI/cbPpzn3XbNIhdZrrNc3oe68ND8ySE=
X-Received: by 2002:ac2:4e08:0:b0:577:285f:32bd with SMTP id
 2adb3069b0e04-596b526cc5fmr4598727e87.26.1764270098336; Thu, 27 Nov 2025
 11:01:38 -0800 (PST)
MIME-Version: 1.0
References: <20251127092226.1439196-8-ardb+git@google.com> <b1dae5a7-27bd-42de-bcce-9fd3c2b1c178@arm.com>
 <CAMj1kXE-Qm4DQNAcg8Tg7YM4EMdLBu_UJm7M8Cpk3t5g7XqP5w@mail.gmail.com>
 <e996fdd5-7113-4327-a884-336dd5f77c4d@arm.com> <CAMj1kXGyYMy2xhcdNicHkMfWBnEjyhc+xg8ciuR-6WXDxDpZxg@mail.gmail.com>
 <f95593ac-d4cf-4e06-9a94-cc5133897c59@arm.com> <aSiDSp8NpqJkr1oD@J2N7QTR9R3>
In-Reply-To: <aSiDSp8NpqJkr1oD@J2N7QTR9R3>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 27 Nov 2025 20:01:25 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF9-tXVQS-_p8c058ssn80xaiDu+01SR98=yQ004xevng@mail.gmail.com>
X-Gm-Features: AWmQ_blCzWooEduQY70i7aS-W3HH2XR2ydJyogg_jetISwCHw8QoRgAWB6Ylzzs
Message-ID: <CAMj1kXF9-tXVQS-_p8c058ssn80xaiDu+01SR98=yQ004xevng@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH 0/6] Improve get_random_u8() for use in randomize kstack
To: Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>, 
	Catalin Marinas <Catalin.Marinas@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_110140_813140_3D3D61FF 
X-CRM114-Status: GOOD (  28.79  )
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

On Thu, 27 Nov 2025 at 17:58, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Thu, Nov 27, 2025 at 03:56:59PM +0000, Ryan Roberts wrote:
> > On 27/11/2025 15:03, Ard Biesheuvel wrote:
> > > So the question is really whether we want to dedicate 16 bytes per
> > > task for this. I wouldn't mind personally, but it is something our
> > > internal QA engineers tend to obsess over.
> >
> > Yeah that's a good point.
>
> I think it's a fair point that some people will obsesses over this, but
> I think the concern is misplaced.
>
> I know that people were very happy for the kernel FPSIMD context to
> disappear from task_struct, but 16 bytes is a fair amount smaller, and
> I'm pretty sure we can offset that with a small/moderate amount of work.
>
> AFAICT there are extant holes in task_struct that could easily account
> for 16 bytes. I can also see a few ways to rework arm64's thread_info
> and thread_struct (which are both embedded within task_struct) to save
> some space.
>

Oh, I completely agree. But it is going to come up one way or the other.

> > Is this something we could potentially keep at the start of the
> > kstack? Is there any precident for keeping state there at the moment?
> > For arm64, I know there is a general feeling that 16K for the stack
> > more than enough (but we are stuck with it because 8K isn't quite
> > enough). So it would be "for free". I guess it would be tricky to do
> > this in an arch-agnostic way though...
>
> We went out of our way to stop playing silly games like that when we
> moved thread_info into task_struct; please let's not bring that back.
>

Agreed. (after just having moved the kernel mode FP/SIMD buffer from
task_struct to the kernel mode stack :-))

