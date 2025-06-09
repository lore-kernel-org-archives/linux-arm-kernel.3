Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5729C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 19:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Na30GlknzdZiABLMWSdd39v+Z/ENok+XEyt3IOc8ai0=; b=ZSjxwRA1aGNMob1+UqROvoBKwB
	sSCzuNFttyEscUtzxMjJgqd4jqFmbT0OHXAEmN7G7V5emA2uIk/QtS1lX6pzUwf6PaSws45c53ZRj
	uS6ATV9ldrYxDvMvHiGluhr+uO4EDgw+VFXJoJAHnajV7/xIfOlkbWakfQ7kCVcykdkS0whx0ZD7+
	v1RzHXJeeXnaoXVjHrcqqgZFmucQDvaoNNqMUXNzNO1H956LSASwWm/g5y/tdaRkq/0yokvzagvMT
	m3lUot9/PQi2td0QpdcsAxhhHjWAkV0NMcy4guR9OJz1uAdWZwOAPkLbiHC8RVYSvgwEnGWZQA1WU
	9fH+NFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOiBM-000000051Lc-3ZHi;
	Mon, 09 Jun 2025 19:29:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgmR-00000004rNT-0slI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 17:59:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DBAC4A3EC
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Jun 2025 17:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C74AC4CEF2
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Jun 2025 17:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749491970;
	bh=Na30GlknzdZiABLMWSdd39v+Z/ENok+XEyt3IOc8ai0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OZxJ+ESt7yh3BZGQilp23HXBvZ3O+rCKdAIpi31zgkM0r9bcW8YFRzS9xz2B2Ntl1
	 /uPk87XUJxLRvWgpJQZG8JWHSyS4RPXlU2crtOXcTlzlC+tbGn6peVVCxthbK56Hio
	 Mipb8TTbiKCjgYLCKqYO3y6uyPRgyJrC2gkjqz2Ya21xkT3U3utBu8bFB2EhU1KsYI
	 Op1n34sYb77uS3V6HBmiV1jYr3ibXPD7ddysaz256PDco2flBWUFrNVoXcmIjz5cxd
	 srloO2KKcvDwDVEU4NLFQtPntUkPVAbT9c4pAfFmqRPS0FJC/fxdcwTkBOEwtu20NJ
	 F1/+dgX5RPmJw==
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fae04a3795so48097676d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 10:59:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPItKLCuYv/iW8s6IBdrt00A8h/If25r5bGKy9ipDvSdHjnCbYdN3FvVRy6cum5lozFoqfuizOlXZrQJSH2XMD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1eZkHdbgjfLsqHLp1w8HhskxoKdBvZI9u5Y0bx8cBV7OAl80e
	kzzlgb7s1jE6nQb1ABHI9mKWgbjglr7kGERV1dXMCyTihuBj47DjNA7csQeStQvnruxn2akZOYX
	ma0Ff4KWveCeKR8H6PbHP9uWyM7H5ITE=
X-Google-Smtp-Source: AGHT+IE0/1F+tJmdfUTBxMygYYerrwYiSSqscVu/E+k19TT9Jo7m4EFtGcDYALC6bTqErlWjJ2Aqe20xCFO+jVRrbSY=
X-Received: by 2002:a05:6214:2682:b0:6fa:9baa:face with SMTP id
 6a1803df08f44-6fb08f96f34mr214305856d6.35.1749491969419; Mon, 09 Jun 2025
 10:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250603223417.3700218-1-dylanbhatch@google.com>
In-Reply-To: <20250603223417.3700218-1-dylanbhatch@google.com>
From: Song Liu <song@kernel.org>
Date: Mon, 9 Jun 2025 10:59:16 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4o87DA0HM4UHjuAUsYbYkuuwZCo9v5Ht0N=OzRTEqztg@mail.gmail.com>
X-Gm-Features: AX0GCFtlZJVV0vhRsQmmP-jCcIp5jN7wzYtrnRX4e8Iw_dQaZDg_1BhZGrTrnkg
Message-ID: <CAPhsuW4o87DA0HM4UHjuAUsYbYkuuwZCo9v5Ht0N=OzRTEqztg@mail.gmail.com>
Subject: Re: [PATCH v7] arm64/module: Use text-poke API for late relocations.
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_105931_271178_2380BAA5 
X-CRM114-Status: GOOD (  12.94  )
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

Hi Will and folks,

We (Meta) are hoping to test livepatch arm64 with our kernels soon.
In general, we strongly prefer patches that are already landed in the
subsystem's git tree, and being tested in linux-next.

Could you please help us review and land this set and [1] and [2] so
that we can test them in our kernels?

Thanks,
Song

[1] https://lore.kernel.org/linux-arm-kernel/20250320171559.3423224-1-song@=
kernel.org/
[2] https://lore.kernel.org/linux-arm-kernel/20250521111000.2237470-2-mark.=
rutland@arm.com/

On Tue, Jun 3, 2025 at 3:34=E2=80=AFPM Dylan Hatch <dylanbhatch@google.com>=
 wrote:
>
> To enable late module patching, livepatch modules need to be able to
> apply some of their relocations well after being loaded. In this
> scenario however, the livepatch module text and data is already RX-only,
> so special treatment is needed to make the late relocations possible. To
> do this, use the text-poking API for these late relocations.
>
> This patch is partially based off commit 88fc078a7a8f6 ("x86/module: Use
> text_poke() for late relocations").
>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> Acked-by: Song Liu <song@kernel.org>

