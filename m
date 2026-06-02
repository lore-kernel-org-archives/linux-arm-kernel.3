Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90FFCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4IzAi0b7YXiSHeiaK73l6IwijKtNYPXKnRXnHpuVFA=; b=4JiGzA1qxBCZqkKICPVuZXln8W
	O8+isICTKtzboWfFuSgQSUmgBS/WFNzuQffpNPv6phqwJRywu8s8C9wOGYjWyuCQyQlro5dSyO+Q6
	aL16Z+9zLcD/laBdY/lNeFm1G0wwdrqW3c0c0CsFKBrAeZivLrluRSzDmQAUtyDDBeW85h0EFfIc1
	7RaRUaP/YZLz8Ceceafvt0OCYTJrrPS7TKumFo+yl2XDahyhrWv3zM5h2ZR4F0j3M9vH4FK0aY908
	0xXuRvB6Tf0Kgm8CHV/GwPaqUvtn1NkaZihO/v98fL3t6n9dqtuUup/RqCApKU4YBhFoo0ygO8wuX
	iANqV1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTIZ-0000000Dc9H-1sEY;
	Tue, 02 Jun 2026 17:53:07 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTIW-0000000Dc8j-3dYb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:53:06 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-68d22476e88so891a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 10:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780422782; cv=none;
        d=google.com; s=arc-20240605;
        b=DOA1LmsFoifC1Vl8k19yC+HBKeBZKAQr5n6Ja8lJiwaAyxWfTmAGr235KlZDtk3WDO
         f4xD1U5LNR4NI/YFUD/Z5jS2+V/vvvRbN53oipiqOfD4Hp/tItZLveE9EppwY2x0B0Dm
         X9uRqmCelwtXid8BSVSM9yk+22e8EnaoTe794LTpQ72LRUvxIR8jnDV/vUHulQ/LjZnL
         FMAe1WJUdRHr7oZHQJ9H41A8qrOQgkUTQCpvPS9Z0bFtxXO8H1ID0SMSKf/1i5B8T99M
         7AoMxbjG6P+EvHSvTKBMj24COUf2hs1p9s7bSDDfPy7MfHGo0+8q3XOJmc6npcms38vH
         BDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T4IzAi0b7YXiSHeiaK73l6IwijKtNYPXKnRXnHpuVFA=;
        fh=95HCLl6RkWBEwj9/94VHiA2g/jFYNj5ZSup3dRu46T8=;
        b=QIYcE6gFfpkHzSN/h9fPg0zqihc8muMOkfk2+u1hCnvReAQbkYGEKsBqOq5dTDcu8f
         8NAITObVjAMAyMSqczwqaZ3KCY4EeROlX0mlwvnHhD2hZzcZAOLqP5sXxEhD8mdTgTa3
         /23Ov2mgHlf8p1g9nu2R+og0UXSsqLVcVL1ZRelQoFcZPxsrcSxn6Rels2hXKDphhqTG
         z6UTlQJoMGQL+aAVtLGhj7bVUaUa6xl7DoDFT7RnQASzjsfpfLzurTchuIfkvc1X6o5E
         aDt2E/CkWd+m8BPVjn+MgPRQlnCd3hFrHYbF5dnyqHDepRrHUy1jxcsAiizahjmEkSpz
         cvPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780422782; x=1781027582; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4IzAi0b7YXiSHeiaK73l6IwijKtNYPXKnRXnHpuVFA=;
        b=TydXxFKQDXxB6FbQnEYcs4oV4au3la6u6iW7HQfiSwjeeyOh0cAZfP+zma9+xmRFcd
         x99yJ5e6XQSX/APnYnLvhKJhVw05CaGNDutCJ6J5YB0mRoEuvJDNrelA3UPgPtPLdVOO
         /UG7lbOO7aHdhYS/9+q0T2CLWp7F4XRN+v0kD5WK605VpK29NrtRFO9YkRkLNNdisYY4
         FFxK1iXiflfhxC2EOcKnggpGIpy4LiPi0LSg1kQb9mmL0lxyfqNGfPYHNr+25B0uzUBb
         ui93CEz7rUD8wXEqvZPKUD8mXOLrgGmjrS9inmZYQhbkMt0ALSRu0M/Mu/F0t70BHAl4
         8aVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780422782; x=1781027582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T4IzAi0b7YXiSHeiaK73l6IwijKtNYPXKnRXnHpuVFA=;
        b=D8+OgTpPkTCVZYKIsgJ8jj+6flRsXH3fH8kgNbhLYwsA7TSJTECjHnmBlyAbCje2Bo
         5uNVv3pT/u8xAeRNBxhZ7teJMKkEUh8ndGT2HBsu/cmCFBg4nkdN1LulicBu4XOQ7kGC
         OTcU5MPQLtDLhRCeUeo5RY0nTbOgcr3WcbcCF6UxRregthO0N3ENuQFJEeL8KyG3nKie
         s29vpqJuRf2VFOPL3+ahxejykD1z2hTDlUaz9OH/dhgrUa6A16DKaGbTq3pQLvT8SpBz
         1sYUOi43QqD/ccUdC7qynF7RZjRp0HL05WBwNpKCaToSvV3/TFQqrK6F+YxadLWksrfl
         yC0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/HlzUNV3wy2p6ushrdDDpwqYc3B+VLDMJi75eXta8qYgkTVioOvApIEvdm6/6aQKOVYzRgT7iJTVeNbVJWcIeN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4MAiTNZX/OVHqrEardqrUJEBfgaNRIedV6hFo6qzPrC3j2/Mt
	1Esh4qpZdaZS0GNLvJAHJ95jPjucEwaP5c/0tegqEr2Rrtfhs8Vg21yC411v2dXBmA0lXsJDdpq
	6LSGaPJjA71juwvFe4rQM5eeNhxSpWugBfhwslTRD
X-Gm-Gg: Acq92OFNRBtts/Fz5EmKAghbNx5aqGBUmbSePlPmlwHfvg2q5WejUCUDnJXVF1CEnPp
	+uckVTsVhXpsgBMuhlfYATJpRaYrhdaVVDX42TuKxh+M3hjjYYr0ZiqmJtmuXp0Lbl6k06w3OFZ
	trZe6P3ss6sXiySQiNwKT9y7hVC47U2X3JOlZ5Yt4mU7CGLk0PchBBU91CF2GIb3hFG2JkgL7SM
	fDjcHQHnAhAJnJDGNe5D2tIlAd0q1bLSJv+swhoawCBvqkE1RGdVY1PrF3MRyeiWA/FeGJ4gKwn
	mJ6TvVbdU11UJ34L+FS7kayQHsR8/6DXL/rYIMSSarKuTRj8
X-Received: by 2002:a05:6402:309a:b0:671:4bfd:e074 with SMTP id
 4fb4d7f45d1cf-68df75232cemr106572a12.9.1780422781497; Tue, 02 Jun 2026
 10:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260527214510.3907973-1-xur@google.com> <20260527214510.3907973-3-xur@google.com>
 <178010203122.3743687.12531843798236779880.b4-review@b4> <CAF1bQ=RNokHJtf=8RGKyP12jNPKUvyztJVRaDZ2fnXSVzZ3L5g@mail.gmail.com>
 <ah6ltnOk2ol8_2ly@willie-the-truck>
In-Reply-To: <ah6ltnOk2ol8_2ly@willie-the-truck>
From: Rong Xu <xur@google.com>
Date: Tue, 2 Jun 2026 10:52:48 -0700
X-Gm-Features: AVHnY4LuFHGKYSOcg7d-67eKfzkJQsTAV6yevBzDx3QxZ1ehe74HmTNGYslLgHs
Message-ID: <CAF1bQ=TfCAdxh64cSNeO5wiT8o02o6+bVooju1Bgy3odM1NYwQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kconfig: Remove the architecture specific config
 for Propeller
To: Will Deacon <will@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Yabin Cui <yabinc@google.com>, Han Shen <shenhan@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Linus Walleij <linusw@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Helge Deller <deller@gmx.de>, Ryan Roberts <ryan.roberts@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, x86@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_105304_933532_86E8292E 
X-CRM114-Status: GOOD (  36.96  )
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

On Tue, Jun 2, 2026 at 2:43=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Jun 01, 2026 at 11:18:27AM -0700, Rong Xu wrote:
> > On Fri, May 29, 2026 at 5:47=E2=80=AFPM Nathan Chancellor <nathan@kerne=
l.org> wrote:
> > > On Wed, 27 May 2026 14:45:08 -0700, xur@google.com <xur@google.com> w=
rote:
> > > > diff --git a/arch/Kconfig b/arch/Kconfig
> > > > index e510c585ea84..e4eaca9c917c 100644
> > > > --- a/arch/Kconfig
> > > > +++ b/arch/Kconfig
> > > > @@ -879,12 +879,8 @@ config AUTOFDO_CLANG
> > > >
> > > >         If unsure, say N.
> > > >
> > > > -config ARCH_SUPPORTS_PROPELLER_CLANG
> > > > -     bool
> > > > -
> > > >  config PROPELLER_CLANG
> > > >       bool "Enable Clang's Propeller build"
> > > > -     depends on ARCH_SUPPORTS_PROPELLER_CLANG
> > >
> > > It does not look like '' or its predecessor,
> > > '-fbasic-block-sections=3Dlabels', are supported by all architectures=
?
> > > This will break allmodconfig for some architectures in that case, so
> > > this needs to addressed with some other dependency.
> >
> > Thanks for catching this. Yes. -fbasic-block-address-map currently
> > only supports Arm64 and X86_64 as of now.
> > We thought people would only enable this config if they knew Propeller
> > was supported on that architecture.
> > But the allmodconfig build breaks this assumption.  I think I have to
> > keep this config for propeller, and make arm64 opt-in.
> >
> > >
> > >   | $ make -skj"$(nproc)" ARCH=3Darm LLVM=3D1 mrproper allmodconfig a=
ll
> > >   | ...
> > >   | clang: error: unsupported option '-fbasic-block-address-map' for =
target 'armv6k-unknown-linux-gnueabi'
> > >   | ...
> > >   |
> > >   | $ make -skj"$(nproc)" ARCH=3Ds390 LLVM=3D1 mrproper allmodconfig =
all
> > >   | ...
> > >   | clang: error: unsupported option '-fbasic-block-address-map' for =
target 's390x-unknown-linux-gnu'
> > >   | ...
> > >
> > > Maybe something like
> > >
> > >   depends on CC_IS_CLANG && $(cc-option,-fbasic-block-address-map)
> > >
> > > then cleaning up scripts/Makefile.propeller to use it exclusively?
> >
> > I think keep ARCH_SUPPORTS_PROPELLER_CLANG is cleaner.
>
> I still don't think it has anything to do with the arch. If the compiler
> supports the option, then we can use it. The arch code in the kernel
> doesn't need to do anything, right? So can you just check if the
> compiler accepts the option using a 'depends on $(cc-option, ...)' line?

Yes, arch code in the kernel does not need to do anything=E2=80=94it is jus=
t a marker.

I understand your concern. I can use (cc-options,...) in PROPELLER_CLANG co=
nfig.
But I will not use -fbasic-block-address-map for backward compatiliby reaso=
n.
I would use "-fbasic-block-sections=3Dlist=3D/dev/null".

I'll send the updated patch shortly.

Thanks,

-Rong

>
> Will

