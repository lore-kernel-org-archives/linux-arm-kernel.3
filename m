Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB5AE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 23:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSUQjXvXCX7n0zlIPB3T1YFCaCdLs1ofM4KWIMrWBKg=; b=DiZ3ZNL2Lpr7AeIGayZfGJ9Hnz
	8Tho122725nJNet/1SvkoAdsn+fOLiZA6589tGkD0f8TGt3b4QmUZIJewyPl1++xuG8fOfdNfAuue
	C8u05oXNa86OlKTfqNnRQ6FTu0pSUTLa5HNAK+Cmu90tz24URB/cCJOZjHBUKkhnV4pPRxOD2hDXa
	Oqbsk5ELjbw52xzsz8AbN78ZWLQ7ETkIAc3SftCNFY65Q/4w0t3zTR/3UuoYiFt5vnHu4Zg0DLo+D
	wVCC8x9pfUwFDnDTQmLN46+Y2cFhxBsL3y16fxXOQc534PFvpHoVAVjaxi8x4KoesH1HwMijcT6Qc
	b5TeOaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnYb-00000009cmu-2bu1;
	Mon, 09 Dec 2024 23:52:53 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnXY-00000009cdo-3vIa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 23:51:50 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so4397481a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 15:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733788307; x=1734393107; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSUQjXvXCX7n0zlIPB3T1YFCaCdLs1ofM4KWIMrWBKg=;
        b=Cicjy+A/mBqFmOhXxrbN6l8ZHsqjl/SJeX5THRoq7ldRIHV7NszCImRKU2PHqHEWde
         6gY3wlM48gUBU+WWCehEKcEBGa+UcLd8d1PL2Usw/qUwuIF7ypwC1XCsgOjCwIEjtlOo
         2PYx1ov+zJWdkH4C7CNR6oqkGLCXvgtffnKY5H1T0BQndG+uFxxSkesIHx7ovKILmjct
         sa1Jt2pAA15PI9TE3ETnlAdzBaJcYp6qubl7WPD7n5xQsyUku8lwL9VDqYt3M5/ZuchO
         0F60zKiOMldX4xQYn7lXKWAmn071AQxLccPrj2SdBRK1Hp7WI3+8m1DF1z9hny2OvnEl
         mguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733788307; x=1734393107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSUQjXvXCX7n0zlIPB3T1YFCaCdLs1ofM4KWIMrWBKg=;
        b=wV/w8Dk1kMqGo6PQAUBnGftFwoxBKqOwRt2ln5wiWLYvlHOhFEEwjlifM5XeEZe44D
         gL7P0l0OS560UDLIvXJVqybBAYv04VYBDzhbWFzSGn2DeHm8wf4YDjtzEJYhji+DhwF3
         6KiBUMKrDHXpzBFAuAnOIE7WVL+ykfz4y56+H+nuyjvf1jKjV+YJeH8ntF+OXuQkliik
         HwOvEVmD+7hD1v6Jphh1PYHuNWCHTeHAhrg8Sh6iiI6pqBOBfIECW28JvWim63S/UtKd
         cgDcDORG48FkYG7AlhojNC1nHL9K6NK9Rq96Iq13EIkCP2Wd9zBxGsDHECjnfTnvETId
         cHvA==
X-Forwarded-Encrypted: i=1; AJvYcCVD/GZqvTcz99W7tnGB5PVE6NPtbI0GnKd+wHICGfIqfRQeJMzobUKegq3fEPJ9EhVRdKN7E887RROOllqVgj7j@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/6LgXd34YDFvtxU6kWeLro4CDAS/MY0jXdtoXclms3OTu/g0p
	Xm9dZRHvOT+eQV1GGxtW0h9h3LiBApk1ptiPKHWBMVlJ9+JA2fn+CauVV4eFIgGpQ5aZ4bcSBc1
	OzZntycN4n1rhcmLq4vffEJI2WgfA5D/BxSM=
X-Gm-Gg: ASbGncsrYZRCiko839UPza//xO1pNX9J8qxTs0q/TNAkPWwTfKArEZdaZua6Vq4DjMS
	XdBMvnM8KmDRixXKpAQ9UZD40C5zByiChrg9jXhfEjnfvNOBmDJuv/yn4wp/wKocJ
X-Google-Smtp-Source: AGHT+IH/zZbQB//HIrX1JNipWnHUi43H4PwqcC6flKakC4Wp5vy64rAYnKcCmJw4Ryeyp5nKhAclTMf/QPAcT0muhIo=
X-Received: by 2002:a17:90b:4cce:b0:2ea:696d:732f with SMTP id
 98e67ed59e1d1-2efcf29a179mr3714478a91.29.1733788307107; Mon, 09 Dec 2024
 15:51:47 -0800 (PST)
MIME-Version: 1.0
References: <20241118222540.27495-1-yabinc@google.com> <20241209162028.GD12428@willie-the-truck>
 <CAF1bQ=SiHi8oCyo5YnXGpQGofM1zAsnBdqSEet1mS-BYNKVU8A@mail.gmail.com> <20241209185623.GA13084@willie-the-truck>
In-Reply-To: <20241209185623.GA13084@willie-the-truck>
From: Yabin Cui <yabinc@google.com>
Date: Mon, 9 Dec 2024 15:51:34 -0800
X-Gm-Features: AZHOrDkYQ4V69Y7vLhOpgw-bfrlmqVn8MSQhz800aNeQq_Tq1k4ujC1njQBPuGU
Message-ID: <CALJ9ZPNfUFF8OrpvziTnTvGU7OxEgyy9ZTc3aF-NhZ5hMbp7RQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
To: Will Deacon <will@kernel.org>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Kees Cook <kees@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_155148_972894_E9B33640 
X-CRM114-Status: GOOD (  27.43  )
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

 On Mon, Dec 9, 2024 at 10:56=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> (Aside: please try to avoid top-posting on the public lists as it messes =
up
> the flow of conversation; I'll try to piece this back together.)
>
> On Mon, Dec 09, 2024 at 09:30:50AM -0800, Rong Xu wrote:
> > On Mon, Dec 9, 2024 at 8:20=E2=80=AFAM Will Deacon <will@kernel.org> wr=
ote:
> > > On Mon, Nov 18, 2024 at 02:25:40PM -0800, Yabin Cui wrote:
> > > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > > index fd9df6dcc593..c3814df5e391 100644
> > > > --- a/arch/arm64/Kconfig
> > > > +++ b/arch/arm64/Kconfig
> > > > @@ -103,6 +103,7 @@ config ARM64
> > > >       select ARCH_SUPPORTS_PER_VMA_LOCK
> > > >       select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
> > > >       select ARCH_SUPPORTS_RT
> > > > +     select ARCH_SUPPORTS_AUTOFDO_CLANG
> > > >       select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> > > >       select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
> > > >       select ARCH_WANT_DEFAULT_BPF_JIT
> > >
> > > After this change, both arm64 and x86 select this option unconditiona=
lly
> > > and with no apparent support code being added. So what is actually
> > > required in order to select ARCH_SUPPORTS_AUTOFDO_CLANG and why isn't
> > > it just available for all architectures instead?

I think it's similar to ARCH_SUPPORTS_LTO_CLANG, which also doesn't need an=
y
support code but requires testing to ensure it works on a specific architec=
ture.

>
> > Enabling an AutoFDO build requires users to explicitly set CONFIG_AUTOF=
DO_CLANG.
> > The support code is in Commit 315ad8780a129e82 (kbuild: Add AutoFDO
> > support for Clang build).
>
> Yes, that is precisely my point. The user has to enable
> CONFIG_AUTOFDO_CLANG anyway, so what is the point in having
> ARCH_SUPPORTS_AUTOFDO_CLANG. Why would an architecture _not_ want to
> select that?
>
> > We are not enabling this for all architectures because AutoFDO's optimi=
zed build
> > relies on Last Branch Records (LBR) which aren't available on all archi=
tectures.
>
> So? ETM isn't available on all arm64 machines and I doubt whether LBR is
> available on _all_ x86 machines either. So there's a runtime failure
> mode that needs to be handled anyway and I don't think the arch-specific
> Kconfig option is really doing anything useful.

My understanding of the benefits of ARCH_SUPPORTS_AUTOFDO_CLANG is:
1. Generally, we don't prefer to collect an AutoFDO profile on one
architecture and use it to build the kernel for another architecture.
This is because the profile misses data for architecture-dependent
code. ARCH_SUPPORTS_AUTOFDO_CLANG can partially prevent this from
happening.

2. Building a kernel with an AutoFDO profile involves using new
optimization flags for clang.  Having ARCH_SUPPORTS_AUTOFDO_CLANG=3Dy
for one architecture means someone has tested building a kernel with
an AutoFDO profile on this architecture.
>
> Will

