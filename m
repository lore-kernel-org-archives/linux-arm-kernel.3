Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AB1C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 01:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyBGo4NEk4ou27pmwT3GiAGuDVYoMKwfHMTAe8m2fBI=; b=PttEJUC5KwpFacWeIrWHx12DKV
	6sUyUH0rk0b7mbMoDJLRWiCbkOURRePSo8AiULp4ZqoHjrywTnKWEWugA9oadHZ2SbmcuNu9Z8Sa7
	ZVewAFCaq0THW61ZX5kjH5lj64qua4TJf948M5HKbuzMC2DvVeO+opRz5hKRcpIGfPh0oseMXZCSt
	I0UpHwKtloxDYJWlZXBzBYeGFrt7X59oQ8qr+S+wYbsKnVak4pRsR1fV9okg+mUzHq8bN77vmOeA7
	SKZfVUy0xndk836POfY1PAvDLzlk13vKXM9k28aciBMfvu3iBTDCGWztcUGATh/2hFim0Kjg66j0M
	eiHr6Hyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti17r-00000005mmK-24JF;
	Wed, 12 Feb 2025 01:01:15 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti14O-00000005mNc-2alu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 00:57:41 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5de6d412ee9so2000a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 16:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739321858; x=1739926658; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyBGo4NEk4ou27pmwT3GiAGuDVYoMKwfHMTAe8m2fBI=;
        b=TZ+xQmOQcoEbfiQU7G/2GfZW2b2S9mSBkrwtcszJqltM2904tCX8PVgTwV+fdJhUf/
         yebxZ0osZkiyYR1Y6xPKvVZzVtbEUb17aj2n3GpRG/sPSijhBlRZ8OILkLh+ozfTYMFP
         /wU+RFut9hX9ePdboJPl2MrnX91uq8IbXnU5TVIRG9so849XP6mYsrK9NSDiPTM/pQTf
         D0SgknEQXLAq1ooS0lu9qGzVnxcqYnsUzkLnae+3wSZYgAQRdrNVeoJthhbuOSY1LjN8
         VQI9zVBnL44eEIcyRCFDGJIJjXyH5qsWg2Jmm4mecYOq5fpOVk7jLtURHx9ZSL1PxBNI
         +40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739321858; x=1739926658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyBGo4NEk4ou27pmwT3GiAGuDVYoMKwfHMTAe8m2fBI=;
        b=qhXnLTEkFhIxg0doQGYNTeQeppihRlMPdBFveepdESD9wROjJ9nfveq+RUgAS1Kh6P
         9R7XkOxUmXP5iMfhg77zY2uxvuEbWSjzeux1yz+MERzF0BR2kWxTl05jFy11OGt9WBkE
         cqDBlHwVYwMS0nurlzUX1toXXcAQxkzRf42GUfc2Fptal5GsHWVJflRy3y88JiB8SNyx
         ZdF7SXo6i1PpanjjcDSmoLKN+BEIVlmcUfHlfF7e2sHGJs8aBVvAF4vxqYuRrpbDvOQj
         w7hSbyemXn7HtsRQhc3UlrbChGQD7obgAL+FIZleYy4LQBmTRL8dT53mUnWh33lKzzpG
         kNKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+ubZriASD7InKQMbsc+MJsjb4ycnF/wwywxRNgSTQKCFt7gxAn4RvOPAthwQmqq51Zr1qOs0hSbe/ml4Y5A0t@lists.infradead.org
X-Gm-Message-State: AOJu0YxxcId+LyVXw6RmBOvKKv3e8vd/rPFkddqc6TOopMB6aDZSkrXE
	WWDRz7RFN9IS40XjnUY2qH9L+zzaAAuJJnT4uwxveRJKqSZibeOKp/qLHxtlltr0tXPLqnKDpig
	99h114OlN/f5Xwzzl0NOmx6vgu6hFK+TN2P31
X-Gm-Gg: ASbGncvWrXd69nklx+Jm2vTwXFleNk5eAvoGuwMQCR/iew9yrWmRuJKKMUMwPf/evGs
	bJepRi3mxMq2T+1i6zlYtQPLOGlzClIoOzpogECpNI32HnKslma9+XEXnXGq1X5WKs3NLPKLzv6
	wOP10n+PcYd0Q1fCwJShMhWqZICYM=
X-Google-Smtp-Source: AGHT+IGGry5l4RQEnuSdk6aioJ+bv1rbvIM1o5se3iV5Jtj1b2iEWNaQAzttrNeymsRtOervTIxy8hxdeVXm7d1+3Ag=
X-Received: by 2002:a05:6402:ca5:b0:5dc:ea60:45aa with SMTP id
 4fb4d7f45d1cf-5deb0dc7a96mr19983a12.1.1739321857927; Tue, 11 Feb 2025
 16:57:37 -0800 (PST)
MIME-Version: 1.0
References: <20250210163732.281786-1-ojeda@kernel.org> <CALNs47uBcyTmBdTBAPXiBcAkE0-4tih9j=VAv1rRcTcf_c2yTg@mail.gmail.com>
In-Reply-To: <CALNs47uBcyTmBdTBAPXiBcAkE0-4tih9j=VAv1rRcTcf_c2yTg@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 11 Feb 2025 16:57:25 -0800
X-Gm-Features: AWEUYZlRV6pF3AGbc0XvrMoRFXalIUrBnJyNWQn2iVM9raDE_v1HBIS8LQ3IxnI
Message-ID: <CAGSQo00rWwhcT0SjhUn_e3o+TyCP2stadHwANkmE7-AEeSHBAA@mail.gmail.com>
Subject: Re: [PATCH] arm64: rust: clean Rust 1.85.0 warning using softfloat target
To: Trevor Gross <tmgross@umich.edu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Ralf Jung <post@ralfj.de>, Jubilee Young <workingjubilee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_165740_655575_719819CF 
X-CRM114-Status: GOOD (  20.57  )
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

I successfully booted this on the emulator (with some additional
patches to our system unrelated to this issue), so

Tested-by: Matthew Maurer <mmaurer@google.com>


On Tue, Feb 11, 2025 at 3:10=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wr=
ote:
>
> On Mon, Feb 10, 2025 at 10:38=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> =
wrote:
> >
> > Starting with Rust 1.85.0 (to be released 2025-02-20), `rustc` warns
> > [1] about disabling neon in the aarch64 hardfloat target:
> >
> >     warning: target feature `neon` cannot be toggled with
> >              `-Ctarget-feature`: unsound on hard-float targets
> >              because it changes float ABI
> >       |
> >       =3D note: this was previously accepted by the compiler but
> >               is being phased out; it will become a hard error
> >               in a future release!
> >       =3D note: for more information, see issue #116344
> >               <https://github.com/rust-lang/rust/issues/116344>
> >
> > Thus, instead, use the softfloat target instead.
> >
> > While trying it out, I found that the kernel sanitizers were not enable=
d
> > for that built-in target [2]. Upstream Rust agreed to backport
> > the enablement for the current beta so that it is ready for
> > the 1.85.0 release [3] -- thanks!
> >
> > However, that still means that before Rust 1.85.0, we cannot switch
> > since sanitizers could be in use. Thus conditionally do so.
> >
> > Cc: <stable@vger.kernel.org> # Needed in 6.12.y and 6.13.y only (Rust i=
s pinned in older LTSs).
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Matthew Maurer <mmaurer@google.com>
> > Cc: Alice Ryhl <aliceryhl@google.com>
> > Cc: Ralf Jung <post@ralfj.de>
> > Cc: Jubilee Young <workingjubilee@gmail.com>
> > Link: https://github.com/rust-lang/rust/pull/133417 [1]
> > Link: https://rust-lang.zulipchat.com/#narrow/channel/131828-t-compiler=
/topic/arm64.20neon.20.60-Ctarget-feature.60.20warning/near/495358442 [2]
> > Link: https://github.com/rust-lang/rust/pull/135905 [3]
> > Link: https://github.com/rust-lang/rust/issues/116344
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> This is consistent with what has been discussed for a while on the Rust s=
ide.
>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>

