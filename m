Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68499CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 14:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OMiKtcpewqF4gCsOfnEp6MDRQfHmBN1vsuh1So/WKQ=; b=D1zLpBlJTlZF4H16lFevRbHPYW
	3hm0qCnd4I2c0lM/4q19UXidSAsGwYHPp6WxjUDoFgIp6S1uMOnuqvpRCfDCctPjX1gSa6rhHKfYk
	oI6r7tCZa2er2vDOgnXH2x7Gj28Uiudp+n6e1sTBX5sPujRpK3ag1GMr46TyGDxKM8MO8tURm3q40
	O9F9zPTQEYZmoVTKwqqCrPeYOufXuhx6hnqXIXHXL11eC03yr2TpsZJkrtIOAYY9E9isV4lep+3tW
	paFDrfgb424NJ5Calm2kdh5wTH6l+Lx38uIhlpFsoU1+gHIRtHpYuaj35ItzblwRqU2++MN41Wrx+
	y5xAl2zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2sZM-0000000G3uN-3k5j;
	Sun, 28 Sep 2025 14:40:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2sZL-0000000G3ti-31Rt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 14:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 254AA62175
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 14:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99AAC116C6
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759070406;
	bh=YTfeZ2Az2Z8Gm9DtkMQMER4W7eQCdNdPKRtSzc6jOSQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E+eEDf738DIWH8AV/fKoc38BolmBbkv2V3MzRdl9kmp+cWmedZHwK0nxfwFGGO+UQ
	 45AqO5ZFt4tJZzxZd6CS2q3iWcAS4Cbm2N1Iy990txMQROoVk7uAHvjUuU/JHjVJcx
	 E3P76EMaVdCAm6ljVWWca2xSfv6YP/I871kQXLIassNB/tMf1STibLRON5mCzYfrnW
	 f3v6VVvYwtllH8yx9nPhcUazF0FUub5fedvheR2I3/cGe+iSgelMwVd2B05vSjy5SP
	 UbAmbTHotqsZB+WoHDd19rq+DNy7tPRZbosPIetRNE91Jw7cB4CFTM8kJNYWmpZNOE
	 yl+zwxV//VHnw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-371e4858f74so20521821fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 07:40:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYY5n7Ayfg6A3KWZfdbAlK3+gsDTsNE6qnPHBD13CToorPXFOG5KW6N3xk3QQQj3O3dM7qtGkXxBNCEh+u70Ja@lists.infradead.org
X-Gm-Message-State: AOJu0YxN1b0yFuxeq8TZv7KKvOp9E3qf2zVB95NFzjpU3hmAoWubSw/e
	eAh3d516aO4DUmKNRfjPqrqAH2F6UKD1b4VUeMU4K1RG2rpIz5ohJv4KuXcjNAbyN7roaF6B7Ap
	7itDn7pxXn87yhtYGDxDpdQ/HESjgJ1Y=
X-Google-Smtp-Source: AGHT+IHH3ITnfb2BpbA6fI4i1D/KynnPo0itxokVo5z2R2BxNhPDjgHL5REZ4v90HN8ojvUvINWVTbbCPEGJLRT00uM=
X-Received: by 2002:a2e:bc24:0:b0:36c:2899:7a33 with SMTP id
 38308e7fff4ca-36fb05aac1emr41368541fa.5.1759070405095; Sun, 28 Sep 2025
 07:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
In-Reply-To: <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 28 Sep 2025 16:39:53 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
X-Gm-Features: AS18NWBfnP56WGhzhDUorQf3ioUtwwx0in0DsVvUF4v8bsmet9iSfiUkxyOpxGQ
Message-ID: <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, 28 Sept 2025 at 15:52, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Ard,
>
> On Sun, Sep 28, 2025 at 9:42=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> =
wrote:
> >
> > On Sun, 28 Sept 2025 at 10:55, Tiezhu Yang <yangtiezhu@loongson.cn> wro=
te:
> > >
> > > When compiling with LLVM and CONFIG_LTO_CLANG is set, there exists
> > > the following objtool warning on LoongArch:
> > >
> > >   vmlinux.o: warning: objtool: __efistub_efi_boot_kernel()
> > >   falls through to next function __efistub_exit_boot_func()
> > >
> > > This is because efi_boot_kernel() doesn't end with a return instructi=
on
> > > or an unconditional jump, then objtool has determined that the functi=
on
> > > can fall through into the next function.
> > >
> > > At the beginning, try to do something to make efi_boot_kernel() ends =
with
> > > an unconditional jump instruction, but this modification seems not pr=
oper.
> > >
> > > Since the efistub functions are useless for stack unwinder, they can =
be
> > > ignored by objtool. After many discussions, no need to link libstub t=
o
> > > the vmlinux.o, only link libstub to the final vmlinux.
> > >
> >
> > Please try keeping these changes confined to arch/loongarch. This
> > problem does not exist on other architectures, and changing the way
> > vmlinux is constructed might create other issues down the road.
> ARM, RISC-V and LoongArch do things exactly in the same way. Now
> LoongArch is the first of the three to enable objtool, so we meet the
> problem first.
>
> But yes, I also don't want to change the way of constructing vmlinux.
> So I prefer the earliest way to fix this problem.
> https://lore.kernel.org/loongarch/CAAhV-H7fRHGFVKV8HitRgmuoDPt5ODt--iSuV0=
EmeeUb9d5FNw@mail.gmail.com/T/#meef7411abd14f4c28c85e686614aa9211fccdca0
>

Can we just drop the __noreturn annotation from kernel_entry_t, and
return EFI_SUCCESS from efi_boot_kernel()?

