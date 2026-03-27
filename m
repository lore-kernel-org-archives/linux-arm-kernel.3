Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E5A10BA432
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 07:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJSO1Jy8gXJ3q0SyUcqZkfXUbxuRHoGqVtwy0Y1kZfY=; b=YKTlojFrbxQoOZuJF18yDICNWd
	MG4L2FAGydAU+WKOUpAQL84V4aKIVXBzAZ5BghoYsPrFpihzO4M4orVWXLkE7LUfq9xJYzuW0BhUi
	wR+7BBe836Amg6zx2hTd6T76IDViym/raMgMsc4xWDeOuK0cJ7FlumWivq5s4XpUt2OOgtzxEUw55
	OnkgAsaOSMQ7UTPts1c9TO7d9e+vMzRB7nOpTD/XrkqNrjVrR3yFl9d07UgZA+o/wRP/LME4V5IPS
	LvUVeB+8N4/5lN/xdXpyooY/DZcc4zz3Z8uAe9iWFPhGPHXyh8uLWd1cN9IJJc83Fle8lSLSP5MIl
	BvdBXnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w623U-00000006uqq-06wv;
	Fri, 27 Mar 2026 07:56:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w623R-00000006uqX-3dr4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 07:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qJSO1Jy8gXJ3q0SyUcqZkfXUbxuRHoGqVtwy0Y1kZfY=; b=NpOV1aCsuCg6MU7udSWBX31LAc
	8nxHlynO4INsO/+sv+TZNeYxtu53aIoG+ULpYlX2zGnVScn288NcSAEnjfpACnbj//aw5OnshU5Wh
	CMkQ1rr7jHHbazKO52Hi09Q1JlOlN6TU2h92VVHEP7N+Qe7mGV4HViRpF8H10ra6O46E/SELKl5xL
	83+daRrBi26oFGa2JpirAJm+yaoCzPfE28YUFexXSV81VFxVtJkzlUklDgeJ1iaGesU6LmOpJBJW/
	GGaE1w6T5F+N18PmuzuzvIscTz3wY4fatha8LO6iZOWikf/rHajHaOmufTUAjmYACAaLgHko8QDpj
	2aJE3IkQ==;
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w623O-00000009uzR-46IQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 07:56:28 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56ce15c6898so680271e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 00:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598185; x=1775202985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qJSO1Jy8gXJ3q0SyUcqZkfXUbxuRHoGqVtwy0Y1kZfY=;
        b=qBmjsfZ9x4qUjMnqwXh655LDQ4QZMHLQX61Wl5HMSpGbvtp+z0CLpHmsUCmlr1TRHy
         IZwYgfoTqMHHaeP2QJtJeuwnI0p1JHQnZD1Os2QlSH7NJXW6zmOr5kCPBGUQY+2/f2j8
         pwLacYultxtA8Z3VoW9zG8TG+mwXO1jiZJPu4DHqCqFscyudRRhqZCAuYTLjuMRHvkWa
         mSpQZPv1Onh2+iOa8vgwu5Bnl1coj/dR4ABtaBgNOdGzzP2oSinV/E6vC/GXdIF63waa
         uHMi/W4+MOcJAg6cPb7q+agcls3FvTqf6er1cohMaGI/vFx9cp5NjCJlgKg/hj1b/NBo
         u2qg==
X-Forwarded-Encrypted: i=1; AJvYcCVwRkSjsQc368WjcmdYkOGjvfkcfsMoTtYtTgQwa9My4ZLxxZXGpDZPLbpZiB5/XY4zuvkYdTZY1Btzrfoq5/W9@lists.infradead.org
X-Gm-Message-State: AOJu0YxQzDG0791/rfjZxwSjhvy+zItmP1xm59eoqemd8wwrBvbpiwii
	LFbU1F+C/ngnQhdyE/ZPUHiKdzUH8kRQN+7VzlWbyBiHMKK4Z6jykLEO4U24XZsgrGU=
X-Gm-Gg: ATEYQzz0GdGKTYRSLppaPvIkxHtyyrdNUZkT+YHQQcHLVsdMkGN5DMXNy5h8UzpSoSe
	64mztiqKbtDuTNDv7Dtszk7BHdbwSRIKICtQbDyOner+F7X5LiZ+2a0B40zCs31d9Nuh5msEN+q
	V/BK1Ww8Pm4Vx1DhErP5najbmdV4fZhHggJSaigIE682v5dWBQawqXkh/lEEN5ZBUMNJzhKsRxI
	6sXVqGI6q92RbzQh04JBCMB1w0kxtSuI/TgFUzt3nY+jWblWbhlpteCXCAN2hVSVnd+dZnLRaqq
	kwf6TLPBukesxr2HeniupuhNX8booni9SlMuHa/fCSRz2u9ZcepD8NGDLhbpflLtVW7rNJHpaAC
	6ZvRo6HLt55qNE9+XeZMRES3ImEzS6KAGRl2xnGgUTFS3FY3ayRPuMvRn7GE9dqKmxy4eoHMNCJ
	Wk3r6AoNcZRC7x4FD65noCnWLep5AUswcX400rz5r6QuufysOoTFUCN+IALgHoVmjk
X-Received: by 2002:a05:6122:3a0e:b0:566:357b:ef25 with SMTP id 71dfb90a1353d-56d4a692286mr517108e0c.15.1774598185133;
        Fri, 27 Mar 2026 00:56:25 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31da7eddsm8550584e0c.18.2026.03.27.00.56.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 00:56:23 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a9076813bso984830e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 00:56:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEvKdEL/1h+zwH29nDUHVw6Co+ZthAKmHNvtBrYKedES/v0cyzxbL0Az5xPpCqI8nLDX8UVy5w5Pgvi2AyE7rZ@lists.infradead.org
X-Received: by 2002:a05:6123:132:b0:56b:5e7e:d3fb with SMTP id
 71dfb90a1353d-56d4a619a98mr460290e0c.12.1774598183104; Fri, 27 Mar 2026
 00:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com> <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com>
In-Reply-To: <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Mar 2026 08:56:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
X-Gm-Features: AQROBzCIA8XVkhuOJBqaPSt4vzM_veS-eZVPLLLcWDFZykO6P_Bu4uSiQhzQA0w
Message-ID: <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_075627_204897_6C552A4E 
X-CRM114-Status: GOOD (  26.33  )
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

On Thu, 26 Mar 2026 at 22:34, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thu, Mar 26, 2026, at 16:18, Russell King (Oracle) wrote:
> > On Thu, Mar 26, 2026 at 03:31:26PM +0100, Christian Schrefl wrote:
> >> On 3/26/26 2:47 PM, Miguel Ojeda wrote:
> >> > On Thu, Mar 26, 2026 at 11:10=E2=80=AFAM Alice Ryhl <aliceryhl@googl=
e.com> wrote:
> >
> > I'm not sure if this is still true, but I believe it used to be the cas=
e
> > that the -linux-gnueabi target has one behaviour for enums (fixed size)
> > whereas -none-eabi, the size of the type depends on the range of values
> > included in the enum.
>
> I checked Debian's arm-none-eabi-gcc, which indeed still has this behavio=
r:
>
> $ echo 'enum { A, B } x =3D sizeof(x);' | arm-none-eabi-gcc -xc - -O2 -o-=
 -S | grep -A1 x:
> x:
>         .byte   1
>
> and I see the same thing for the hexagon target in clang, but none
> of the other targets that Linux runs on. In particular, clang always
> behaves like linux-gnueabi even when targeting plain eabi.
>
> $ echo 'enum { A, B } x =3D sizeof(x);' | clang --target=3Darm-none-eabi =
-xc - -O2 -o- -S | grep -A1 x:
> x:
>         .long   4
>
> I noticed a similar issue with m68k-linux, which has a bitfield
> alignment different from anything else on gcc, but uses the normal
> behavior on clang.

Ugh, I wasn't aware of that. Adrian, did you know?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

