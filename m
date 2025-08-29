Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72B1CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZOwGmW32l0tJzhQKm8pcC6DjrljVo3iHLjJ7S9bpiA=; b=klbD9xOVXJbC8llhWXaOOAlS4L
	XRAd6HAdqq/Ln+4WYWwBmiKgq8dEEqlEv1gLbGmNzr6OuIe2T+vPNkKlKEJOKBt/A2GXer+Qjcn87
	9z3hTYVdj/FYFNnpnAFq/VqbRAChD6BiiusfTLQrHUOFnMazSn9VACndDDxZaTPM7TrJ/kscAGipD
	F5RqdAPB5JBKsvsyvynjEONjfgxceMFZuiRAGh/NcxaghmmHwu9oJQ/2odlDr9wU/8A3mNT8odIu5
	XdxHVa+7RQbGp2XdbWJYrKhnjiMa9SqDUrobGBvVxHJCKTNxblrwZ5SNH7oQq9ICVs0qDT3ksJFM1
	xBogpOSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9k1-000000078na-0P6G;
	Sat, 30 Aug 2025 00:46:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1bw-00000006Lfk-1nH1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:05:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C426340762
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 16:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A434EC4CEF0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 16:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756483555;
	bh=/fsHhWsSiwyOtIj1bx5ospQQn0DoNIWn4soWO79/N2w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jfz4Aw+9yPXZSWT653fxEvmaqhg0Jm/Rw/23+atTWeJchItG/g/xCc+ZD64y8uNUH
	 N04QbP+nGOn9qI4aKINXQTmKPrv369okma6ImAbEl2TXcOMOM2AqF37YxDcWPwCpRT
	 d/I/pQ2z3V1p/hgGZ+gaugnJ6Rfy82pVpifOn7DKVnto3XJqBylwyeNGJRqGRXK+G3
	 zz/Jj/sdegEkGtUSMEJNCP4Kzan2lEkv+G5lxKFpFuRdjAelr95/qQbla6xD7SJ78P
	 Y1YmntSMCD5sQicDuDV/eiproJINhm8zMJC2WXpmk5af9S3ypJ6a3+00rEI+z3sx7a
	 1BQXkAnnLF7UA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f42e4c3ebso2264359e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 09:05:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWN6bJWDZKznNtrx/nRjlT8rRlkGu6IGjXrdIcPIK6280jePYaywpzhFOhRRXrVOPnOg1oCejznNCif5UKrFX+C@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7IhEEHRxwfwazeUjSIT+YFLx5VDcpVYORnQuNEVHna+9qD/03
	GFxr2HzkP2kADMK7ww+ZsCqwq/NS6oBOMf7P4rhjhiJbXwk8StwWjGa3qM7RAYg7GQt/EIC1Wie
	fBwlVmMWsTTwtOz8QJEsteJonH/X6pjE=
X-Google-Smtp-Source: AGHT+IFr1NtG4C9fVjhaQPBoAripXjdR2xqeXJjj9nx4cBrsKNR84LC16+0wpCvKQHW6CEe9RmZ3WfrgviBpAB8sh0o=
X-Received: by 2002:a05:6512:260d:b0:55f:4fb6:20af with SMTP id
 2adb3069b0e04-55f4fb6222emr3279688e87.51.1756483554053; Fri, 29 Aug 2025
 09:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250827151131.27733-1-ebiggers@kernel.org> <20250827151131.27733-10-ebiggers@kernel.org>
 <CAEH5pPY98CaSm+EXiuOzo6EuWzGu7rEQjGa3eojk18HP29Rs7w@mail.gmail.com> <20250829152912.GA91803@sol>
In-Reply-To: <20250829152912.GA91803@sol>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 29 Aug 2025 18:05:42 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGf+0b=6kPAzzxgesaOYSJtzoL1oQyNqT2VrUkWFzwJzA@mail.gmail.com>
X-Gm-Features: Ac12FXzLZacz-sBE8NRb_XQ7Tqv3u8sk7UD0Q2bdwjm9ftcJfH2QikBrdlO4YkM
Message-ID: <CAMj1kXGf+0b=6kPAzzxgesaOYSJtzoL1oQyNqT2VrUkWFzwJzA@mail.gmail.com>
Subject: Re: [PATCH 09/12] lib/crypto: blake2s: Always enable arch-optimized
 BLAKE2s code
To: Eric Biggers <ebiggers@kernel.org>
Cc: Honza Fikar <j.fikar@gmail.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_090556_508130_DF422C9C 
X-CRM114-Status: GOOD (  20.27  )
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

On Fri, 29 Aug 2025 at 17:30, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Aug 29, 2025 at 03:08:56PM +0200, Honza Fikar wrote:
> > On Fri, Aug 29, 2025 at 2:54=E2=80=AFPM Eric Biggers <ebiggers@kernel.o=
rg> wrote:
> >
> > > Currently, BLAKE2s support is always enabled ('obj-y'), since random.=
c
> > > uses it.  Therefore, the arch-optimized BLAKE2s code, which exists fo=
r
> > > ARM and x86_64, should be always enabled too.
> >
> > Maybe a stupid question: what about ARM64? The current NEON
> > implementation in kernel arch/arm/crypto/blake2s-core.S seems to be jus=
t
> > for ARM.
> >

That code is scalar not NEON, and is carefully tuned to make use of
the ARM barrel shifter, which does not exist on arm64.

> > While the upstream BLAKE2s with NEON is both for ARM and Aarch64 (ARM64=
):
> >
> > https://github.com/BLAKE2/BLAKE2/blob/master/neon
>
> There's no ARM64 optimized BLAKE2s code in the Linux kernel yet.  If
> it's useful, someone would need to contribute it.
>

NEON is cumbersome in the kernel so this only makes sense if it is
substantially more performant, and I'm skeptical that this is the
case, as you pointed out yourself in

commit 5172d322d34c30fb926b29aeb5a064e1fd8a5e13
Author: Eric Biggers <ebiggers@google.com>
Date:   Wed Dec 23 00:09:59 2020 -0800

    crypto: arm/blake2s - add ARM scalar optimized BLAKE2s

    Add an ARM scalar optimized implementation of BLAKE2s.

    NEON isn't very useful for BLAKE2s because the BLAKE2s block size
    is too small for NEON to help.  Each NEON instruction would depend
    on the previous one, resulting in poor performance.

Even if NEON code might be slightly faster on some cores, the fact
that it is sensitive to micro-architectural details makes it less
attractive.

