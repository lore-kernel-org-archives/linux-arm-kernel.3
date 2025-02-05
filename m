Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB36C02196
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wu/sc/L4OPn7cAk2v/XNwJZ1ybARuz3FCSjlWNrd2uc=; b=aY7jGODvlKln+pe+xYxsXm/iyh
	hMDCdOp5VIIzAHIDjlz3nGQ5TU1R9q1vDXKxf9uw1xWMP4YGetxBEYX83K9uXSB93Sh8qI5k/xW3/
	eboEG9WwJcHzc7TfNNxsYrIZY43EvgUVxZS0jvyiIrzRERaQ5oygJfuPfcdzkHTqoHIaMoxTyg3dy
	BOKYfHlSZ7KCXnfn0hCM9dAyIBZNKb2WBrrDhgoC/WC1T/MZ+6ksdrLyyD7N88jT+V4HzfpDicwsI
	e1sJsZuOHXcoVvG/O37caZ/EqfpRXAr2HTEQPaj9qLjvnxhAxmckIAqXzL/P9duRKfC+hj6Z80kl7
	DT6WJRlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffGq-00000003MyM-0qWe;
	Wed, 05 Feb 2025 13:16:48 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffFS-00000003MiK-49Vs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 13:15:24 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2166f1e589cso64737265ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 05:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738761321; x=1739366121; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wu/sc/L4OPn7cAk2v/XNwJZ1ybARuz3FCSjlWNrd2uc=;
        b=cx97NtQhdQntKS9FWr6rgsXfdF46h25QhGgVxdkXiJ8Nj6edtUbuZkV4mv2N0e00xA
         voYCASzQh2FF3hg/wp5qfK3q+yGB6HtFSZ9POxq9n8XfjlHlD8dCDX87F2c4yUD8Nk7g
         l17SbcUoCbin731mg4Lh6fmGizrvBmiVpIOV3wGVMg2s5RBJ2QdK3dWhuAHMkQJ61h/T
         m5F8jN1MNEcIEXEhLG8Ik8fN8eJlOahVRE3j1BguXB4UTWqR6/ObpFnFPmluyeyi1Vvu
         0FkrqXv9qXjadRlDoNCNHNWpoGo8ejhyA6om/pUwbI6bqrVrzGzduy7YH73/bxs9eqBh
         Nxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738761321; x=1739366121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wu/sc/L4OPn7cAk2v/XNwJZ1ybARuz3FCSjlWNrd2uc=;
        b=IKUIir8SsrgZ3LkO7eabJZIUvBCn482NU1LuI/kYAl31yKTpCM/uCT4f1tn1pusG0k
         oQ9/9DiGeI8IqS5/EK4RypaZvPYoKf6bfYjbRZKGIBEkS8f9j3TjDHk2IaGFbQAXDIuA
         1NVUD6vJObdShGnnwQi/YxQd/sz5LdGc6BlnNQS6qFSeFN+ELb/vseeS4ERIxuhNFa29
         vAN2ckgABODF7DwTM424j3lnztxFZ0xkCkLH5EqeA1q/QDrARK4C3FPEL/frfduGH+Zc
         QjLLIGE9IrW/p34wMKh8sis1cBq6LeXftqFfohFtF8CucJiilrIbfsT6acAed7nZSlsA
         HYIw==
X-Forwarded-Encrypted: i=1; AJvYcCWgWDOqbcPwU18zfPe5tK/4v2UaCVhfo6lUo6gi5d8vLEqL19vTEO3Vp6In4v/h+B9pzYAjkBJ+fLLFgQQwo9Ek@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+q8MbVuUvZfjsBaHEIFFhmUc005H392OHZohGgbixpwK+RGEY
	mm3Z4+MGPSuf7lf2KGNNH9srNhZejrCfBCbtoIiBPtGiyKCODZ7H6+Sco9EnTa+5hFGJ5/BUEcB
	XBx3AJ9G0GMA4hpDZnLvBlc/ZGIPvhkhKJYpB
X-Gm-Gg: ASbGncsb92mx9DTLIxS/+teW5WW3pboOM8FuKF2DrlTO0EGxXiEL5xzaiy0Yosrs+Zq
	6cm5ic+PkOAYZUGWqEjZBs9sxX6z7aVqh0onOrQB1fbA0P5ABcHJ/zGpMRyLGlvclrpHaxs7trA
	H3toZ6m/sXlF5VsJ3mlQbANpxkvY4=
X-Google-Smtp-Source: AGHT+IFf8uqGqejiqDC+WsvJ+0IKFQdep5DE/lTTj9Lq2uU4fvUimsIEKmftbwK3h1qE8+ChhRZkPz5mlad/lMYnjFo=
X-Received: by 2002:a17:903:2b10:b0:216:3732:ade3 with SMTP id
 d9443c01a7336-21f17ef01f1mr55209855ad.35.1738761319655; Wed, 05 Feb 2025
 05:15:19 -0800 (PST)
MIME-Version: 1.0
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com> <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
 <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch> <CANiq72n7UhQEh9TJU7UNBv2t0ZR_rNO3dqbVZ2cwr99u5SOVeg@mail.gmail.com>
In-Reply-To: <CANiq72n7UhQEh9TJU7UNBv2t0ZR_rNO3dqbVZ2cwr99u5SOVeg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Feb 2025 14:14:51 +0100
X-Gm-Features: AWEUYZlASz-FWWUxhqCKYiMuN_a0MLJAcx7YSx21Wkzf07cjFQ7z0fJLREmrNHo
Message-ID: <CAH5fLgi05p6KTN2v=+jy4HoK-oC9pg7dYBuc8wvfx_uN6SVjOg@mail.gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Rudraksha Gupta <guptarud@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Geert Stappers <stappers@stappers.nl>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_051523_055900_B9DBE543 
X-CRM114-Status: GOOD (  22.44  )
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

On Wed, Feb 5, 2025 at 2:12=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Jan 31, 2025 at 5:05=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrot=
e:
> >
> > Floating point is banned within the kernel, except for in very narrow
> > conditions, because the floating point registers are lazy saved on
> > context switch. If the kernel uses the floating point registers, you
> > can break user space in bad ways.
> >
> > I expect this has been discussed, since it is well known kernel
> > restriction. Maybe go see what happened to that discussion within RfL?
>
> Yeah, it has been discussed, including in the last couple weeks in the
> Rust Zulip due to the upcoming move to the aarch64 `softfloat` target
> (the disallowing of disabling `neon` in the hardfloat one).
>
> Ideally, I think upstream Rust could perhaps give us a way to do
> something like `-mgeneral-regs-only` or `-march=3D...+nofp` (in the form
> GCC does it, i.e. a hard error if one even tries to use the floating
> point types even within a function implementation, not just in
> interfaces like in Clang), i.e. a way to avoid unintended use of
> floating point facilities:
>
>     https://godbolt.org/z/o1E5nrrzc
>
> Currently it is unclear what form that could take (e.g. whether a
> `-nofloat` target could be possible, "disabling" the `f*` types, just
> Clippy...).

Seems like we already have a warning for it:

warning: floating-point arithmetic detected
  --> /home/aliceryhl/rust-for-linux/rust/kernel/lib.rs:89:5
   |
89 |     a + b
   |     ^^^^^
   |
   =3D help: for further information visit
https://rust-lang.github.io/rust-clippy/master/index.html#float_arithmetic
   =3D note: requested on the command line with `-W clippy::float-arithmeti=
c`

> Cc'ing Catalin in case he wants to be in the loop, since I discussed
> it with him recently.
>
> Cheers,
> Miguel

