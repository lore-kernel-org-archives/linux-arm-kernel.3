Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E15C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 21:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YboiOBuuzvpNMxiBuKPw6BD6c8PklI5nO1wrPxXt8c=; b=syRJUlIguRDOdKDE1O1fDElDkr
	VtGfXvtwaK/8FFS362fcB10LIA0qW5kTHSU5gqf29PFwKp/hdK/EtZ60anJVFnICcvdkJkWczwJBZ
	eNV0PNirlacGIjS7g8cgRRHvIAsDETEIa17N6ziBiN0C3M/rb2POe64elaW8JKBi0KMo+NNlIrhN3
	SSlhTNcCJdeMqpF7zg83R8chm+D7RADhHk3XXnwWPVjCuW0g4NMuWOAfsyepYOffPk/73ndhiIHCJ
	qJXAql+uZte5cCT09dNGa24pGDRsTCiywOe1B7sfRxqzfpI0LZnD/17uhcC8iBGLtduYs9t5sqgha
	ed14+3ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9GP-00000008fAf-33OK;
	Wed, 16 Jul 2025 21:02:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8Pw-00000008Zjf-1Zdz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 20:07:53 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so186487f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 13:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752696470; x=1753301270; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YboiOBuuzvpNMxiBuKPw6BD6c8PklI5nO1wrPxXt8c=;
        b=RgAXRuAoKzOup8S9/jy/dWaxeTUvPmSPBIW4psFLd2+LpDNkjDjGEbNJl18+aFi4iL
         SK33pWTQl6e8bnReC/a9a2s2faSB+zraseHc+nPI/WxfxI9owN3Ak9mSDaTMPCcx0NSl
         J+ruiqREOVG7SapiQ++GuBSzWagiqwBLlSgptqduIymO+ADYRxVWbLVxa8zXZ2KEW6/D
         Gv/ADKiVh8dUNkCXiM1tD3ML0dtRTscEvPDceIgiF/HR4LmnzHn1PdCG+6wALIYJOz6q
         yTIyDKyX2wkIbwfM36CKNMWbqMYUPXwWk9oA86WaFe2CylFEoEp96X3GUip5YGLhWHYq
         C8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696470; x=1753301270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YboiOBuuzvpNMxiBuKPw6BD6c8PklI5nO1wrPxXt8c=;
        b=fk6fqbmvHDK7Ms1qMN4hgXNSXH8xKEE4w3lQq45pFPI2lsh94/8dLLySjhULE5nMBl
         wJ2s5uqShaR8kAPhiV4tvPq5oDvgZljEBZg4zBjXQJtMGOypgJD5+ITnDkstLvN0F9wl
         y6K/IhVCkVAMOXRi5kTZTUthYNpL6/21ZW7PSXsOOcCSNHwBNb+4ACq4VxKioQUL8x+a
         n3uAuWhndDQSIHJ7cEHlWoeYL567FSRqNiPAwDfMpFD3WsYCDua577jWhOEPhjKhB04M
         W+2wJa1CrPUEhZxrYMdRPnxbhUItr0Rg6WnYCULafBeDmXPK80qwS7dzHR6NgesKz8xp
         RHMA==
X-Forwarded-Encrypted: i=1; AJvYcCVJZjS0Jr3YSqUwiBTTCvvX/Vw13aO16OdlPejFDb87v6HbWvVH79DYo/U+2hKUpkpCy8TBwgoMee+3mJ4TSJVW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+kGHYows2WT7hFSXTEAyUiwmoeJYAvhMUchnVyo15CuDQ23LW
	5XYrXuo5iX7Lnyf9OUUw9aUFJZz61mHXbrsTO+3MdtCyOC7Zvq8itimwHwrukKIygZajOMfjXC0
	XJwpNKvx2789n9WLaiSya0/iYXDeC34QuTNH8c5Gt
X-Gm-Gg: ASbGncu82sQyOk6xJUCgMcJhMuqof/UoVWaqDkCo8PDx/DwdQPxRJJo4Uq4KayGRi0d
	j8V9TBZ14x1qTL5395oWLOS4wuj6kanhr3GzO3vUuLjjB5Bz4Lk9mE+N1jeOJuxzk8RSqH3pRkB
	6JaR/a8VglLPM1YzbRfr5GFBf7rPoCnSynkXcPiba/Ewv7vqFHUcSHoBj3J8KdATapxO1l2eRbe
	vGWGRTp
X-Google-Smtp-Source: AGHT+IG/mD6EU8SuNTW3LZDjCfoDb9ZARI1mRRrRCv8Xo96/5sxY7xEOyY0wRwm6k6PnyyanvPlOxzUa99SAFnecsZI=
X-Received: by 2002:adf:e195:0:b0:3a5:3993:3427 with SMTP id
 ffacd0b85a97d-3b613adaaa6mr439027f8f.26.1752696469798; Wed, 16 Jul 2025
 13:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <4c459085b9ae42bdbf99b6014952b965@BJMBX01.spreadtrum.com>
 <202507150830.56F8U908028199@SHSPAM01.spreadtrum.com> <c34f4f606eb04c38b64e8f3a658cd051@BJMBX01.spreadtrum.com>
 <CANiq72=v6jkOasLiem7RXe-WUSg9PkNqrZneeMOTi1pzwXuHYg@mail.gmail.com>
 <24e87f60203c443abe7549ce5c0e9e75@BJMBX01.spreadtrum.com> <aHftocnJcLg64c29@google.com>
In-Reply-To: <aHftocnJcLg64c29@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Jul 2025 22:07:37 +0200
X-Gm-Features: Ac12FXwaBbCKoAemQb9xmWXTf5_wpyVeFFPscMtfQR5YlmbyXhCuUwBZR_A4iZs
Message-ID: <CAH5fLgiiZE_mFhB4J+G7-Jdz46+d-5NP15npjn2_H7DgSAynxw@mail.gmail.com>
Subject: Re: Meet compiled kernel binaray abnormal issue while enabling
 generic kasan in kernel 6.12 with some default KBUILD_RUSTFLAGS on
To: Carlos Llamas <cmllamas@google.com>
Cc: =?UTF-8?B?5YiY5rW354eVIChIYWl5YW4gTGl1KQ==?= <haiyan.liu@unisoc.com>, 
	Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?B?5ZGo5bmzIChQaW5nIFpob3UvOTAzMik=?= <Ping.Zhou1@unisoc.com>, 
	=?UTF-8?B?5Luj5a2Q5Li6IChaaXdlaSBEYWkp?= <Ziwei.Dai@unisoc.com>, 
	=?UTF-8?B?5p2o5Li95aicIChMaW5hIFlhbmcp?= <lina.yang@unisoc.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	=?UTF-8?B?546L5Y+MIChTaHVhbmcgV2FuZyk=?= <shuang.wang@unisoc.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <christian@brauner.io>, 
	Suren Baghdasaryan <surenb@google.com>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_130752_419795_FA59E2E5 
X-CRM114-Status: GOOD (  22.17  )
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

On Wed, Jul 16, 2025 at 8:21=E2=80=AFPM Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> On Wed, Jul 16, 2025 at 07:01:29AM +0000, =E5=88=98=E6=B5=B7=E7=87=95 (Ha=
iyan Liu) wrote:
> >
> >
> > > -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> > > =E5=8F=91=E4=BB=B6=E4=BA=BA: Miguel Ojeda <miguel.ojeda.sandonis@gmai=
l.com>
> > > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2025=E5=B9=B47=E6=9C=8816=E6=97=
=A5 1:51
> > > =E6=94=B6=E4=BB=B6=E4=BA=BA: =E5=88=98=E6=B5=B7=E7=87=95 (Haiyan Liu)=
 <haiyan.liu@unisoc.com>
> > > =E6=8A=84=E9=80=81: Miguel Ojeda <ojeda@kernel.org>; =E5=91=A8=E5=B9=
=B3 (Ping Zhou/9032) <Ping.Zhou1@unisoc.com>; =E4=BB=A3=E5=AD=90=E4=B8=BA (=
Ziwei Dai)
> > > <Ziwei.Dai@unisoc.com>; =E6=9D=A8=E4=B8=BD=E5=A8=9C (Lina Yang) <lina=
.yang@unisoc.com>; linux-arm-kernel@lists.infradead.org;
> > > linux-kernel@vger.kernel.org; rust-for-linux@vger.kernel.org; =E7=8E=
=8B=E5=8F=8C (Shuang Wang) <shuang.wang@unisoc.com>; Andrey Ryabinin
> > > <ryabinin.a.a@gmail.com>; Alexander Potapenko <glider@google.com>; An=
drey Konovalov <andreyknvl@gmail.com>; Dmitry Vyukov
> > > <dvyukov@google.com>; Vincenzo Frascino <vincenzo.frascino@arm.com>; =
kasan-dev@googlegroups.com; Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org>; Arve Hj=C3=B8nnev=C3=A5g <arve@android.=
com>; Todd Kjos <tkjos@android.com>; Martijn Coenen
> > > <maco@android.com>; Joel Fernandes <joelagnelf@nvidia.com>; Christian=
 Brauner <christian@brauner.io>; Carlos Llamas
> > > <cmllamas@google.com>; Suren Baghdasaryan <surenb@google.com>; Jamie =
Cunliffe <Jamie.Cunliffe@arm.com>; Catalin Marinas
> > > <catalin.marinas@arm.com>
> > > =E4=B8=BB=E9=A2=98: Re: Meet compiled kernel binaray abnormal issue w=
hile enabling generic kasan in kernel 6.12 with some default KBUILD_RUSTFLA=
GS
> > > on
> > >
> > >
> > > =E6=B3=A8=E6=84=8F: =E8=BF=99=E5=B0=81=E9=82=AE=E4=BB=B6=E6=9D=A5=E8=
=87=AA=E4=BA=8E=E5=A4=96=E9=83=A8=E3=80=82=E9=99=A4=E9=9D=9E=E4=BD=A0=E7=A1=
=AE=E5=AE=9A=E9=82=AE=E4=BB=B6=E5=86=85=E5=AE=B9=E5=AE=89=E5=85=A8=EF=BC=8C=
=E5=90=A6=E5=88=99=E4=B8=8D=E8=A6=81=E7=82=B9=E5=87=BB=E4=BB=BB=E4=BD=95=E9=
=93=BE=E6=8E=A5=E5=92=8C=E9=99=84=E4=BB=B6=E3=80=82
> > > CAUTION: This email originated from outside of the organization. Do n=
ot click links or open attachments unless you recognize the sender
> > > and know the content is safe.
> > >
> > >
> > >
> > > On Tue, Jul 15, 2025 at 11:41=E2=80=AFAM =E5=88=98=E6=B5=B7=E7=87=95 =
(Haiyan Liu) <haiyan.liu@unisoc.com> wrote:
> > > >
> > > > The commit changes the fragment and diff is:
> > >
> > > An Android engineer should know how to handle that, but if you are re=
porting upstream, it is best to try to reproduce the issue with the
> > > upstream kernels (e.g. arm64 is not in 6.6.y) and provide the full ke=
rnel config used.
> > >
> > > > Only two rust-related global variables in fmr.rs and layout.rs have=
 this issue. Their asan.module_ctor complied binaries are wrong.
> > >
> > > I am not sure what you mean by `fmr.rs`. As for `layout.rs`, that is =
in the `kernel` crate in 6.12.y -- isn't there a single `asan.module_ctor`
> > > per TU? Which object file are you referring to? I get the pair for my=
 `rust/kernel.o`.
> >
> >   NSX:FFFFFFC0800A7C94|F800865E  asan.module_ctor:   str     x30,[x18],=
#0x8   ; x30,[x18],#8
> >    NSX:FFFFFFC0800A7C98|F81F0FFE                      str     x30,[sp,#=
-0x10]!   ; x30,[sp,#-16]!
> >    NSX:FFFFFFC0800A7C9C|F00240A0                      adrp    x0,0xFFFF=
FFC0848BE000
> >    NSX:FFFFFFC0800A7CA0|911D8000                      add     x0,x0,#0x=
760     ; x0,x0,#1888
> >    NSX:FFFFFFC0800A7CA4|52803D61                      mov     w1,#0x1EB=
        ; w1,#491
> >    NSX:FFFFFFC0800A7CA8|94233816                      bl      0xFFFFFFC=
080975D00   ; __asan_register_globals
> >    NSX:FFFFFFC0800A7CAC|F84107FE                      ldr     x30,[sp],=
#0x10   ; x30,[sp],#16
> >    NSX:FFFFFFC0800A7CB0|D50323BF                      autiasp
> >    NSX:FFFFFFC0800A7CB4|D65F03C0                      ret
> > The first __asan_global struct value is
> >  ENAXI:FFFFFFC0848BE760|>FFFFFFC082EDB180 000000000000005F ........_...=
....
> >  ENAXI:FFFFFFC0848BE770| 0000000000000080 FFFFFFC0836DC431 ........1.m.=
....
> >  ENAXI:FFFFFFC0848BE780| FFFFFFC082EEC780 0000000000000000 ............=
....
> >  ENAXI:FFFFFFC0848BE790| 0000000000000000 FFFFFFFFFFFFFFFF ............=
....
> > The address of the global is 0xFFFFFFC082EDB180 which value is '/proc/s=
elf/cwd/prebuilts/rust/linux-x86/1.82.0/lib/rustlib/src/rust/library/core/s=
rc/num/fmt.rs' and its viewinfo is 'vmlinux\Global\__unnamed_357'
> > The original size of the global is 0x5F
> > The name of the global is kmalloc-2k
> > The module name of the global is 'core.27758904ccee4c80-cgu.o'
> >
> >    NSX:FFFFFFC0800A7D4C|F800865E  asan.mod.:str     x30,[x18],#0x8   ; =
x30,[x18],#8
> >    NSX:FFFFFFC0800A7D50|F81F0FFE            str     x30,[sp,#-0x10]!   =
; x30,[sp,#-16]!
> >    NSX:FFFFFFC0800A7D54|F00240E0            adrp    x0,0xFFFFFFC0848C60=
00
> >    NSX:FFFFFFC0800A7D58|912E8000            add     x0,x0,#0xBA0     ; =
x0,x0,#2976
> >    NSX:FFFFFFC0800A7D5C|52800961            mov     w1,#0x4B         ; =
w1,#75
> >    NSX:FFFFFFC0800A7D60|942337E8            bl      0xFFFFFFC080975D00 =
  ; __asan_register_globals
> >    NSX:FFFFFFC0800A7D64|F84107FE            ldr     x30,[sp],#0x10   ; =
x30,[sp],#16
> >    NSX:FFFFFFC0800A7D68|D50323BF            autiasp
> >    NSX:FFFFFFC0800A7D6C|D65F03C0            ret
> > The second __asan_global struct value is
> >    NSD:FFFFFFC0848C6BA0|>FFFFFFC082EECA80 0000000000000020 ........ ...=
....
> >    NSD:FFFFFFC0848C6BB0| 0000000000000040 FFFFFFC0836DC431 @.......1.m.=
....
> >    NSD:FFFFFFC0848C6BC0| FFFFFFC082EEDA80 0000000000000000 ............=
....
> >    NSD:FFFFFFC0848C6BD0| 0000000000000000 FFFFFFFFFFFFFFFF ............=
....
> > The address of the global is 0xFFFFFFC082EECA80 which value is 0 and it=
s viewinfo is '<&usize_as_core::f..vmlinux\kernel_9a6cb9fd7c8dfd66_cgu\<&us=
ize_as_core::fmt::Debug>::{vtable}'
> > The original size of the global is 0x20
> > The name of the global is kmalloc-2k
> > The module name of the global is 'kernel.9a6cb9fd7c8dfd66-cgu.o'
> >
> > > Cheers,
> > > Miguel
>
> We have KASAN builds with android16-6.12 and haven't seen this issue.
> Can you share your entire config file, so we can try to reproduce?
>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Matthew Maurer <mmaurer@google.com>
>
> Alice, Matthew, have you seen this before?

No, this doesn't ring any bells for me. I guess we need to see a full
config so we can try and reproduce ourselves.

Alice

