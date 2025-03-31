Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B476DC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZLQiXv04LloKLYeZwA5zXTGimlLximWhv2V1WjRz0E=; b=3+sLO9YcPSdNxwWYtZREUtHC1h
	FBhtH2Led+CHg79Oq61rwXeMuHAueCfPUEum7aqMXTBOVrUXZegUOxXPPMENFz4ZBg6vbpQLIewOM
	PYa0X+oOkg95JdMJKxIGgN+gvoEFQpWVzL+BqkP/UIBjX7I7vj2LThu29My8KYIMn5iE6n6vq8Nbg
	MtxY2icnD7WIFSoM4G7qAmdcr690jVgZ3y07R2Uzo4Zkmi4cgqRJ2/o4yzio1ghsgJchG/EWXuQHA
	2JV46XxgzgQ+UCuVwD2wKr51s0ZcaIAeio0d8Mh+F6XxJpaMRbPIbezZl5sL5bmdSRMUAlKroBOpK
	jzCxinLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHDj-00000000qLD-3rAb;
	Mon, 31 Mar 2025 15:38:39 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGqZ-00000000jOC-02am
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 15:14:44 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac2aeada833so873158266b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 08:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743434081; x=1744038881; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZLQiXv04LloKLYeZwA5zXTGimlLximWhv2V1WjRz0E=;
        b=QRxzTFUopz6gY8L+GXxkyVMp4ObboUfsNJ8SMquAq1YBjR9djFdRpLkXVQQL0ALui9
         O6vP5z9eLZw4+ovVabQSryA8hg8EyEhjAA76/J01Jxcid+JPSU/9UVPWIYeXvEzSUzIY
         NBsrqAjjxgIDNZKnX9rW+zPvNM+CU0Xj5DKdO5qfMwJzS/xKyKxEJ1m0JEIqnYPlh6Y6
         QwvpCeRlns2nbI6/HdcKPKADwlBoAcA20TXw0Z6xWrfWUMwuknWyuECplvfmL6NFxhjQ
         OgVOS6fDvLJGeTpVXDrf1dkdRmAtPZYhNuhRh1zlIrpnsI67GjJYsxTS2u4JYxsCQGUY
         K/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434081; x=1744038881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZLQiXv04LloKLYeZwA5zXTGimlLximWhv2V1WjRz0E=;
        b=eUOWRUaCcqf3MgCsnzMgAZ2axRqV7lwCQLVzfpWGR8Ui/2Gzf5OQN/7O5CA4IXuf1r
         Y3S6qjZJoEP7bNWSMJSV6sWUTNFBvdP9KpRGPxIxGHWQoxHkmE2kugfbGDzrNuzp0iTS
         7x+5RuiyZk2EKatSGTLbFrHuZuTkYxVQvAndnJ/IqQdYHgayj2PntV74cqrssbLkcULF
         KEJbtNC09vVGQSjTduDXVO4KG7PC6K8pkO8ZSB35AFDpaDiK0TnldGisbzL+mSoOuz9t
         Qu4XGuehazn791KMV7Q0CtOZafTtnH6JPdFah69rCcjdzLiwK+tbatmXdVx8RNRxjGXs
         LbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp738R5/+8bYrWaLzYh68j1X+ICnXEXsT0QrDDv4F+bjb2WijrkKanP0lkSnmXsF0EPz2QyZ46NNWR3BS+BYYL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3b7JUADOeWhRS5g/SPOyO+YfUIkf9WXXFY6pqkhrGbXlf0Cf2
	trBsfk7Vg2gWaNtjC2dKVVO/jeBPltgNcbFVIWN3TcFvDEGRmclwG+Vz6OI9DhPpnnnXkjp1AzQ
	CCa5m2CoUDjXTIfmgT3xxw/ZTLqM=
X-Gm-Gg: ASbGncsTAPiqZ9rcraKdbAlcAq/cYr1ErVtTO75Xmi3KHz3v1PERXS3oHnzlx4sB6O2
	Q9ek4T9+KzbPmi3U6uqs/C++fHIJDiNmoXdrvLdHZMnDJnpQZhdxuSoPai1Z5lTjFrp8wYhOZIj
	8qH9sAW9lwwWRJ5qq1baFEfCPRJA==
X-Google-Smtp-Source: AGHT+IG7HN5G5eLR+WHUDukmwWaJ9HBxaScaLGRa3QFd1QA73ltzpMkDeTG4SY8gZeGdQw7rE0NehWEAUHS54/gh1dg=
X-Received: by 2002:a17:906:dc95:b0:ac6:d368:aa97 with SMTP id
 a640c23a62f3a-ac71ec04f75mr1330823266b.10.1743434080528; Mon, 31 Mar 2025
 08:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <Z-aWPqAUOIDEzzpZ@shell.armlinux.org.uk> <tencent_F967B6C3FF5405F2D17EF660590BFD213C0A@qq.com>
 <Z-qQuyG7rDeSF_oX@shell.armlinux.org.uk> <Z-qZ_4YmTJdFWAHF@shell.armlinux.org.uk>
In-Reply-To: <Z-qZ_4YmTJdFWAHF@shell.armlinux.org.uk>
From: Maxim Uvarov <muvarov@gmail.com>
Date: Mon, 31 Mar 2025 18:14:27 +0300
X-Gm-Features: AQ5f1JoHnBWx56MjsJrGY62_xZqL_8ufM1v54G-54h7OBc-REg1rQgw-uQfiYFs
Message-ID: <CAJGZr0+zcy+28bJydUo88zpNBN-M2-qcaahr8Pxg=yfdT6RAPg@mail.gmail.com>
Subject: Re: Re: [PATCH] ARM: Fix support for CMDLINE_EXTEND
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: =?UTF-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@red54.com>, 
	ardb@kernel.org, bjorn.andersson@sonyericsson.com, dave@vasilevsky.ca, 
	ebiggers@google.com, linus.walleij@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	liuyuntao12@huawei.com, lumag@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, nico@fluxnic.net, oskar.andero@sonyericsson.com, 
	ruanjinjie@huawei.com, victor.boivie@sonyericsson.com, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_081443_046658_760EA242 
X-CRM114-Status: GOOD (  27.93  )
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

It will be good  to have some constance here with other arches:
./arch/arm/kernel/atags_parse.c:#if defined(CONFIG_CMDLINE_EXTEND)
./arch/sh/kernel/setup.c:#ifdef CONFIG_CMDLINE_EXTEND
./arch/powerpc/kernel/prom_init.c:    if
(IS_ENABLED(CONFIG_CMDLINE_EXTEND) || l <=3D 0 || p[0] =3D=3D '\0')
./arch/loongarch/kernel/setup.c:     * CONFIG_CMDLINE_EXTEND is enabled.
./arch/loongarch/kernel/setup.c:    if
(IS_ENABLED(CONFIG_CMDLINE_EXTEND) && CONFIG_CMDLINE[0]) {
./arch/riscv/kernel/pi/cmdline_early.c:    if
(IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||

Or drop CONFIG_CMDLINE_EXTEND completely or make arm64 work as others.

BR,
Maxim.

=D0=BF=D0=BD, 31 =D0=BC=D0=B0=D1=80. 2025=E2=80=AF=D0=B3. =D0=B2 16:35, Rus=
sell King (Oracle) <linux@armlinux.org.uk>:
>
> On Mon, Mar 31, 2025 at 01:55:23PM +0100, Russell King (Oracle) wrote:
> > On Mon, Mar 31, 2025 at 08:29:21AM +0000, =E8=B0=A2=E8=87=B4=E9=82=A6 (=
XIE Zhibang) wrote:
> > > > Later arguments override earlier arguments. Any compiled-in command=
 line
> > > > needs to be overridable by user supplied input from the boot loader=
. The
> > > > current behaviour is correct.
> > >
> > > CMDLINE_EXTEND is for the built-in command line to "Extend bootloader=
 kernel
> > > arguments", not for the bootloader command line to extend/override bu=
ilt-in
> > > command line.
> > >
> > > Don't forget that the default empty CMDLINE already gives the bootloa=
der the
> > > ability to override everything. Not to mention that even if CMDLINE i=
s not
> > > empty, the default CMDLINE_FROM_BOOTLOADER continues to give the boot=
loader the
> > > ability to override all.
> >
> > The help text:
> >
> > +         The command-line arguments provided by the boot loader will b=
e
> > +         appended to the default kernel command string.
> >
> > so, you end up with default kernel command string _followed by_ the
> > boot loader arguments. This allows the boot loader arguments to
> > override anything that is in the default kernel command string.
> > That's why it is a _default_ - it can be overrided.
> >
> > If the boot loader command string is extended by the default kernel
> > command string, then that doesn't happen.
> >
> > CMDLINE_EXTEND is default _followed by_ boot loader.
> >
> > You're wanting it to be the other way around. That's broken.
>
> To add further weight:
>
> ARM gained support for CMDLINE_EXTEND in commit 4394c1244249 ("ARM:
> 6893/1: Allow for kernel command line concatenation") dated 4 May
> 2011. In this commit, CONFIG_CMDLINE _prefixes_ the boot loader
> supplied arguments.
>
> In commit 34b82026a507 ("fdt: fix extend of cmd line") dated 13
> April 2016, which _post_ _dates_ the introduction on ARM, and the
> commit even states that it's fixing the lack of appending compared
> to ARM, this adds code to drivers/of to _append_ CONFIG_CMDLINE
> to the FDT arguments which come from the boot loader.
>
> It is DT that implemented this wrongly.
>
> No, we are not going to change arch/arm to conform to something
> that was implemented in a broken way. drivers/of needs fixing
> to actually implement it as it was *originally* intended - and
> there is five years of arch/arm doing this *before* DT started
> to do it.
>
> If drivers/of maintainers also don't want to change, then I'm
> sorry, but you have to then put up with the fact that it got
> wrongly implemented by drivers/of and thus has a different
> behaviour there.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!



--=20
Best regards,
Maxim Uvarov

