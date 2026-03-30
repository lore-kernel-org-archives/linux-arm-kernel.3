Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAA110D14A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7JyzGDh2V9hD5ppCKHdE8lqc25UY6zaRA17P+pQPiE=; b=UCJxvSkeWnOwXPmOaCTBq+WOur
	WZ0W55Oee+62gRPg3iWKyYja2nc2tczrZoFBN2MeX7Ro058Eb4zbO2WXdzMrb2S8ci/VZi5p/Bs2s
	jy4bP4qpxK+aTU6/40fexo5/8UfTB+8UD0r/JFYn2UTp/zjm8bIkk6z79HdoosMPrd+OHB7M+3hR+
	Y8XPz9iFTOnO4cgKC3fO84frqtK1dnAZLfBYXhhCLCpMgeX+ATVi12k5FiKlyfbkYVF9bqfQl0cJ+
	Zy9xwubvxCaSR4+pWepOoyUJSuxu3Qwrw2xBLYxkSUfjwzOF1PPz6kwl3E0UO3WN+/JmexBzJ5h7u
	FXC235xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BTA-0000000BDae-0Ay0;
	Mon, 30 Mar 2026 12:11:48 +0000
Received: from mail-pf1-f170.google.com ([209.85.210.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BT7-0000000BDZr-1RJm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:11:46 +0000
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-827270d50d4so3990625b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 05:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774872704; x=1775477504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7JyzGDh2V9hD5ppCKHdE8lqc25UY6zaRA17P+pQPiE=;
        b=F9FFt8mbdMzUQNuHaks9vL2p4tkT0z47m+VzbcTKUK+hMauPlnf33qguC7JX5FcX3J
         YNonwfvqZxdsKXo/BAn/uhlXzWEiZYK8cdUboGmhj7b4uaIOrsd5qXLrZGJvyE2BgV7O
         K/qK4aRvcj267CjYsLruEkiKd+cAOSCzB+L7NX7dC3EH2YfmElntAZoJK7J2+xteEmAS
         KtoxP5eolh/URtTjPEgRgm1n3yxFbWEzdl5oBxmPF4qHxLrGwwkNOXs3THSGFvYigiZq
         FF8/YOOH5+2p6KirnFPxNcsc5wXp/pmf5cgLsi59+/dJxmKQ3161uONJI/t/icVJojM4
         yuWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ0IDEwAvriDRbRrbdbyO5ixWu0y7AJx993bd/Yj305KLkulNBw79mhY35FT+6PT9E2AWWcqKDOo+syqYISc6S@lists.infradead.org
X-Gm-Message-State: AOJu0YwseaKmQUbEtRBJhoQ/0LuwU8gfMW9CVgjHXR1F5y+J+j4qJtOq
	Kv2IEp4t9UTpoK+NqemuHhTySUNXVSjc9rxy/sB2cJANP3NXNBG8qiLZsytOIqzk
X-Gm-Gg: ATEYQzwrTNia7wtNYT/dt9sEwVNw3fo3gn6NQjuRZVqhMlPMxl3YRDV4XLrMYe/Ne1N
	pmkY7AmEZvKLRDfY2hUPLNy1FxX8/BRrMMRqAYUE/GVOSIzqfgUpcwHOjS98vnIADn/a32IjCLS
	NupJ4H/2CKs4K05N7lHLvREBCvb98wA1g3BvwRwXaLfmVQjLTo3b5IxSIMdn4qplymoAYOMFB7C
	TCY/SngWSVE/aJyi4WNvHJLQIEhx/Bfsh85Boyj6gWYUBVkje4IBkPKOp6zxuJoQCRsPpnge129
	+sqGO9vh5M6IrB/BQajiN4lhozjGlXT3ye8EAdENzG1jF/VRLGfWK3Or0Jx8SvMyvKDfZvSyKE8
	W6+pEQIDKMwa0kWr0iA3grdvbcvUMXBnRnBKMM/Y8jd7erYjNedZG6ljo5/1ukYTNC9E5OLGjnl
	bF8tHRFa40m4oImlXzlytvRZ3Kr/7XNh+bQechfUArL3B6N1AbNbCWDHmSDu8=
X-Received: by 2002:aa7:914c:0:b0:829:924c:3482 with SMTP id d2e1a72fcca58-82c960044d7mr10172677b3a.53.1774872704225;
        Mon, 30 Mar 2026 05:11:44 -0700 (PDT)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com. [74.125.82.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d0252sm6767125b3a.35.2026.03.30.05.11.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 05:11:43 -0700 (PDT)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12a695044a4so7030020c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 05:11:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdrQI6AgNJKl6F90Ib0fy831eH+v/lfxKsC6O7LkefSiJTczTY8jYm0u9ZOZmbW3qG13854VMF06KIqexAkURe@lists.infradead.org
X-Received: by 2002:a05:6122:1824:b0:56a:e46f:2cfa with SMTP id
 71dfb90a1353d-56d4a5f2e5cmr4217124e0c.12.1774872216490; Mon, 30 Mar 2026
 05:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com> <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com> <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
 <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com>
In-Reply-To: <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 14:03:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-+dm83TVttfarT7QxE5ySpQ2LJ_k6oFKMWRcbaWcCdA@mail.gmail.com>
X-Gm-Features: AQROBzBixIQPiuCOL0pIFbgyC_M26WMZwTpKOw623Sg5KUyDyMzQqEZKs9RSoco
Message-ID: <CAMuHMdU-+dm83TVttfarT7QxE5ySpQ2LJ_k6oFKMWRcbaWcCdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, acourbot@nvidia.com, 
	Andrew Morton <akpm@linux-foundation.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, David Gow <david@davidgow.net>, 
	Gary Guo <gary@garyguo.net>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	Benno Lossin <lossin@kernel.org>, Mark Rutland <mark.rutland@arm.com>, mmaurer@google.com, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nicolas Schier <nsc@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, rust-for-linux@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_051145_383418_1ADB6FD9 
X-CRM114-Status: GOOD (  23.98  )
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

Hi Arnd,

On Fri, 27 Mar 2026 at 10:02, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Mar 27, 2026, at 08:56, Geert Uytterhoeven wrote:
> >> I noticed a similar issue with m68k-linux, which has a bitfield
> >> alignment different from anything else on gcc, but uses the normal
> >> behavior on clang.
> >
> > Ugh, I wasn't aware of that. Adrian, did you know?
>
> To clarify, this illustrates what I mean here:
>
> echo 'struct { short a : 3; short b :15; short c :14; } x; int y = sizeof(x);' | m68k-linux-gcc -xc - -S -o-
>
> this produces '4' on m68k-linux-gcc, but '6' everywhere else. I originally
> thought this was related to this 2009 change in both compilers

Oh, now I remember.  AFAIK (holding wood and a rabbit leg) we don't
have any bitfield members spanning multiple base type instances in
the kernel.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

