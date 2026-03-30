Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0AF10D14AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woUempTeRL+MJtlKxpfNaT94H+rNPuTZjIMDTveSMCs=; b=urPgG2qmjqOgHsADyROJzebz8p
	M3oE2Lc7QZKDkQv+rVOtCUNckv8ksM1PvndgLvrMpGofiJBYERFwejEA+hvzN7gRwjKZRFqg3QnQu
	UpjFfjnZA7lnxGe12PF0HxIJJXPWzMU/jB/iJf3bLnngP+3bxlvz6Rz2CXRI/f54KnHkAJZUp/uAN
	06DQEKJQ9CC1X55ZvN3k+TU64juV6tWRTiGVgUTkMb6ICiB6Q7oeqfoz6GbhyJTs77N17fE925uZS
	VWWN9gg97gu7sZlZSlcsYiZJBRZFf5ITvADj76FFB4K6PdnzM7GaOX+ZU1WXkFz/qBBUXmET12StB
	G+iuOQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Bf6-0000000BFMN-39iV;
	Mon, 30 Mar 2026 12:24:08 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Bf3-0000000BFLr-3S5w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:24:06 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d9b21d1461so3852266a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 05:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774873444; x=1775478244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woUempTeRL+MJtlKxpfNaT94H+rNPuTZjIMDTveSMCs=;
        b=qiXywHfK7GpZeyv3UC56/3jQ86suCzQB1ZydE/OfRJ+W7Zqd/muPJDQh7KAe2c1V5S
         jrlaVS+0pL1OyLwk7xlMnJB9f3wuw2xlI9EIjvf+l/g9n3ViYX+87U1qLZeeKtwX+d8v
         ijLbugiJWRsq9+1M6hpdYW02+X2GFAucehlB2Nu5TsrxnJt3yMxIqVxF+Isll+uc7vad
         y6HWorZxXmNORBpblCqyx3dU9ZWjX2ol8qV+A1UtBVAvZ/+eUvD3w6bG13rOmPNvOqtj
         Rca7Or5PoQxqqn01hcVhMDeLaX7vfJLu9CYXpus5U+FT+bCmcenoUn7WCJO1m+TSm+Wx
         3a4w==
X-Forwarded-Encrypted: i=1; AJvYcCWS8ggMY1RHtLtWZqZvRW2j0wyKoIWmvnRbB+HPjKQZ9vnlr2aixaRUYLKNdC2uP2z0vJFA5OUBVu67Vnwi8l6h@lists.infradead.org
X-Gm-Message-State: AOJu0YwOdKiAEkRqgz4mVCDxsdkFqUmn0l/wA7sQHZh4JWj2Y3fTIaN0
	JaUkMbIOeqwhPcpTBz/Tguxkgcfjqb6csF7a92DC6r5+3Ssdi63lkjykDrmKhZpp
X-Gm-Gg: ATEYQzxVi/FRqToqoBr9k7KXUOoBz11CWMNfn4ykDS6c0VK7zgtQUEP5XaVFzia2oti
	AHZtFCMYkXN/pa2Nf3KQLfgnJcCsvcz8jT9A45Vo9GkAgnX3W3m6Pm6EQCeJ9fal8Q1iB7uWDMj
	EwclB0ztqkNbgaZ+dNdW8S8s/LaEkRg78kDCeNBIQb79Tr43/uWOcve3t4GELmysR0+0uvTafZd
	F1JFCAkw0MEGuzZ6uBmqQcOHInKe3e9ihgJCFXxvIKkqrGQ0kslp9XcXuiRKyv1PWaIBbt42VRL
	N1L8Qic8LORvJUetenVxcyEMD1Q3zWMdOrQPG6aBaKAk16rFYbUcqK9sGRGc1RN9GbCDDS8U+yn
	l89wnjO2pJ7cqYun/7q0+qaSmMheeRn1bXiQbjjcaSkJEkB8Y1AbNWuRxWl/t7yPtDRlrUErXr2
	vVMwQum2kxR1fcddXMLnwBVHpMMEGIGafVbFo/+4ifcGZV6udj5PCXLn+IR+7yLD/T+ZRDMKk=
X-Received: by 2002:a05:6830:4d8f:10b0:7d7:e662:ad29 with SMTP id 46e09a7af769-7d9ee113363mr5436028a34.4.1774873444316;
        Mon, 30 Mar 2026 05:24:04 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a3b03fbsm5613661a34.9.2026.03.30.05.24.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 05:24:04 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d7439f8837so2971601a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 05:24:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWvt/GIZiBh3vpAIC0Ip5rp9ZilziKFQfZWY1Yq6bsC3cFtT6zafi/cz6tH/t5HGRyDYtIp/82ukS3HOwjMlzQ@lists.infradead.org
X-Received: by 2002:a05:6102:4498:b0:602:896a:84ba with SMTP id
 ada2fe7eead31-604e4df3704mr5271926137.17.1774873037674; Mon, 30 Mar 2026
 05:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com> <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com> <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
 <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com> <CAMuHMdU-+dm83TVttfarT7QxE5ySpQ2LJ_k6oFKMWRcbaWcCdA@mail.gmail.com>
 <26d690ab-d68f-401f-ae2d-7aa4de081bce@app.fastmail.com>
In-Reply-To: <26d690ab-d68f-401f-ae2d-7aa4de081bce@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 14:17:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDy9mNuzDaYfE6r+P8MSTBEGsyRzisLF_d_FWX+6qCVQ@mail.gmail.com>
X-Gm-Features: AQROBzD1En3iKQ5LsAPqOXpbj6O32MjUPo3QPwr0lgIQkMqaR2Lx1_ZSwol-K3A
Message-ID: <CAMuHMdWDy9mNuzDaYfE6r+P8MSTBEGsyRzisLF_d_FWX+6qCVQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260330_052405_929344_3D0D2F26 
X-CRM114-Status: GOOD (  27.10  )
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

On Mon, 30 Mar 2026 at 14:14, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Mar 30, 2026, at 14:03, Geert Uytterhoeven wrote:
> > On Fri, 27 Mar 2026 at 10:02, Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> echo 'struct { short a : 3; short b :15; short c :14; } x; int y = sizeof(x);' | m68k-linux-gcc -xc - -S -o-
> >>
> >> this produces '4' on m68k-linux-gcc, but '6' everywhere else. I originally
> >> thought this was related to this 2009 change in both compilers
> >
> > Oh, now I remember.  AFAIK (holding wood and a rabbit leg) we don't
> > have any bitfield members spanning multiple base type instances in
> > the kernel.
>
> There are certainly very few of those, but two example I found in
> UAPI are
>
> struct dvd_layer {
>         __u8 book_version       : 4;
>         __u8 book_type          : 4;
>
>         __u8 min_rate           : 4;
>         __u8 disc_size          : 4;
>
>         __u8 layer_type         : 4;
>         __u8 track_path         : 1;
>         __u8 nlayers            : 2;
>
>         __u8 track_density      : 4; // crosses u8 boundary
>         __u8 linear_density     : 4;
>         __u8 bca                : 1;
>         __u32 start_sector;
>         __u32 end_sector;
>         __u32 end_sector_l0;
> };
>
> struct usb_raw_ep_caps {
>         __u32   type_control    : 1;
>         __u32   type_iso        : 1;
>         __u32   type_bulk       : 1;
>         __u32   type_int        : 1;
>         __u32   dir_in          : 1;
>         __u32   dir_out         : 1;
>        // 2 bit padding on m68k, 26 bits elsewhere
> };

So we just need to make padding explicit? Sounds familiar ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

