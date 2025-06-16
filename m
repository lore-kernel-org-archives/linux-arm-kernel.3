Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0758CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M31GzpRII/9oVMagio/2eZGIm60F0snIMjnNOydNvf8=; b=HUmAfmewQ1K2Xc3pcdH9aiR1a8
	ev2JgeRm2kQtJwxISop+zji4JAFWPofGlUHW0DlNuKXJ8YTcYjACvDWXiafWlrZdfJwXMLRiak7YX
	4sfTyyu9ghtyb9LyvBqW+agP6yswMb7szVrDPXcXAvrb2d6TvXu4mNhnd8tyW4tev8bXnskDsL63p
	sjxNkKrUask4TrCRIxlkRpCAYQT1/71LPjMMac2iE78Nncyh3PpjCCZ4AhloV5nM3yRnyNJNnAPd4
	6alLZ5no8Fc3TunLsMB0CRkHQO8fPT39M6fpGCzWustO2a2Sc0qXF0x3R06itJQZWai3coYqcBHBF
	DBR0Njkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIZl-00000005jIJ-48dU;
	Mon, 16 Jun 2025 22:45:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIQK-00000005iIc-0XS5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:35:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0BC6EA51F75
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 22:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D49C4CEEA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 22:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750113326;
	bh=jRE8q825ITu9aQFou1ym5Nrl8CwPEfbXbjwT7qI4k/w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EzSAdGdudgYXl5I7sScTHMIraXWbDbGDbmTQ8fo74+bXL+K6YQnZxiMjbhq49+glp
	 vk/2v24aJ6Jspdl7nYg+kgt/tRpFtqtdvEoPYObQ6bZLFyt6qejb6zjjpfM02zYta4
	 CczfLEL/gbrpEJdj3pb4Xr3XMkxzvwfsiwD5KNFwGTWbdxrQNdIunK1XhMleg1Ll1x
	 z+Y2uLnomv++eCL7wbR9JONhuSYkP78sL3xwYE698KXa5tu0QLvACqKfE29vmjhfW9
	 at/ci+7x4sD8k/ePhZSKN0M3NX0BJ0xgNH8ffl5IyDI9l15oz+m45Aqs5oN8jdKqgo
	 eXedmpUaVWGww==
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a5ae2fdf4eso67024461cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 15:35:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUk+tUsIo1SGFqxW4bVg/TbHmCzF3L4uiRacvusneY5fPpfJBMzHJeMr8OIdAgihIO1wyEEmxEZD3NJlLjdPYoO@lists.infradead.org
X-Gm-Message-State: AOJu0YxGp+zLxnm1P+vGwuCzEEWJYLph8HIZ+yDsw0nB9DUMr6cJdNBD
	7sIQVcJblss+0/ua5BLn7jFnyXNCMuSKyYR0rGKzmUlw9X5s5yN/lG23uCJqjT/YVuJXgrBxJpF
	TqgaR1neTZRxkyhEiwQ42u9RQ0K5OLp8=
X-Google-Smtp-Source: AGHT+IEfmvAp5VLvaA2Z6l6e0kzOjdnQpsHXb/3iQIsmmgJHO0aw+Xmaq8UUE+SfG5vEUerhV9acyq7B9cnAFuWFmnI=
X-Received: by 2002:ac8:7d88:0:b0:4a6:f0bb:4d83 with SMTP id
 d75a77b69052e-4a75b8d40c0mr5529711cf.8.1750113325821; Mon, 16 Jun 2025
 15:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250603223417.3700218-1-dylanbhatch@google.com> <20250612151859.GD12912@willie-the-truck>
In-Reply-To: <20250612151859.GD12912@willie-the-truck>
From: Song Liu <song@kernel.org>
Date: Mon, 16 Jun 2025 15:35:14 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5jhwxcd01XBwLJxsP46a+P2sPLcZwtxAX3h7U1=JV_tA@mail.gmail.com>
X-Gm-Features: AX0GCFtjIT8CYMuT4GuWpCCQiOclI0xAAPv_Ht-16o_ETrbw7xxCug6vp97kulA
Message-ID: <CAPhsuW5jhwxcd01XBwLJxsP46a+P2sPLcZwtxAX3h7U1=JV_tA@mail.gmail.com>
Subject: Re: [PATCH v7] arm64/module: Use text-poke API for late relocations.
To: Will Deacon <will@kernel.org>
Cc: Dylan Hatch <dylanbhatch@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_153528_294492_8E5F6486 
X-CRM114-Status: GOOD (  16.62  )
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

Hi Will and Catalin,

What's our plan with this set and [1]? Once we land these two sets, I
will respin [2] which enables livepatch for arm64. We (Meta) are hoping
to land these in linux-next soon, and back port them to our kernels.

Thanks,
Song

[1] https://lore.kernel.org/linux-arm-kernel/20250521111000.2237470-1-mark.=
rutland@arm.com/
[2] https://lore.kernel.org/linux-arm-kernel/20250320171559.3423224-3-song@=
kernel.org/

On Thu, Jun 12, 2025 at 8:19=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Jun 03, 2025 at 10:34:17PM +0000, Dylan Hatch wrote:
> > To enable late module patching, livepatch modules need to be able to
> > apply some of their relocations well after being loaded. In this
> > scenario however, the livepatch module text and data is already RX-only=
,
> > so special treatment is needed to make the late relocations possible. T=
o
> > do this, use the text-poking API for these late relocations.
> >
> > This patch is partially based off commit 88fc078a7a8f6 ("x86/module: Us=
e
> > text_poke() for late relocations").
> >
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> > Acked-by: Song Liu <song@kernel.org>
> > ---
> >  arch/arm64/kernel/module.c | 101 +++++++++++++++++++++----------------
> >  1 file changed, 57 insertions(+), 44 deletions(-)
>
> Thanks for sticking with this, Dylan:
>
> Acked-by: Will Deacon <will@kernel.org>
>
> Catalin, I assume you'll pick this up for 6.17.

