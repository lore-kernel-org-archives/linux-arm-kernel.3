Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB5BC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 16:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2RUuqM7j77YiC7O2/E2sWiPYfT3vLPzw6aLspbrJ9A=; b=TFx2oli1sl7/GS0oXCPGWE7bm2
	ixRNrWYYjB32wQnT9aRFi+A52ycTwPukfCwTWUBEol46UsWgjDIZnTs4VV0TgdQ2wUyZVF2iuZd4t
	Z3H7BtI3N0cUMO9opsWwHMNqqDWjNcIbiWCVG5avSfg/mWBBQceKs+V4UXVL5dhosDz/d302zHEel
	10Z5lrjLwBqFLmh4AiKkpGpGEskLWQ6Qc3ZgmZo0uEWCIcBqTujn1SRqKBPbWma8s8wCW4dEPObjb
	1Yv1atGkDinL4RhGEbw0W8JZAI+MDsL167l1vPLGAC0TR0gIAzP6P1vkueX6AVIZvQDK7A9rfardo
	d5tU1qjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFbIm-00000001EaZ-0Epz;
	Thu, 15 May 2025 16:19:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFbAV-00000001CfP-2vj7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 16:10:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so11784065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 09:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747325446; x=1747930246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2RUuqM7j77YiC7O2/E2sWiPYfT3vLPzw6aLspbrJ9A=;
        b=YAsyrR1JuGGDrJlX2R9iDx5gax7OjMayicFY5tJnHt9ycuXK2wz5tiCGF+Dx4YXv9C
         0QLBj5ZQBVbNLP2efYLzU8Lqq1RHushYkPmUTg0bLyTRB9djoNs6K5EQltQ2yHkOyqAZ
         +QtP0AzQllO71rrDUT1/KPIXn5NUjOe95rfSF7OuHeP3C1vMU3tpUDHfqVeXCEId5MyR
         QJcgzjlTU/zxjiTmtYCnHxaCEWL8NFHjyrIYbOFSVM+fSrnIqnQFMLpxsZD1KbvrRaSA
         E5TLq+tmhWxS/jFYShgaAwC/Dx/B+/EOEOLghllOd8ub+6MsZqO5sKXrcRgFq5PQAwlW
         00OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747325446; x=1747930246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2RUuqM7j77YiC7O2/E2sWiPYfT3vLPzw6aLspbrJ9A=;
        b=uCSC3CP706goIAdWjWHlm2KRevk++PB88vsc1T48eHeKfEJdL4KrZ+W6uFjYuPtN5i
         5QFoz+Kq7Fjt0tGqApLXFgDKke3CMBy3cqvH0rLMm6attrziO2hEmJUUhInyaxzvSOtT
         JJZbwIB4pQ8HQOpvBze31G87FFpKGRpaouKMNEIKNy4Sq1d7qutqRm4Kl5+rfgufss8V
         ykwHKMSN10qzVng8qV+JeTC0QYdoYcXNnprOgnsQBVFYoR+xa+dAWgJyJkKMKMS8aXOQ
         ArmdWe2sjR0jbtApBfKTeXDjygl6xtNP1HWQp4KICFiRdGxgWtPsSkRzf4wytnFTU5Dl
         hBPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMAF0RvvOAK57Jn02GZPSIQYrun0w7RXUlTc7ueRUykWJ5Qgjyf7DZ6Y6gW1OlYVKiGRH0acJpLEccn8Y/SZnr@lists.infradead.org
X-Gm-Message-State: AOJu0YzUSH2j3nG2IdAH06twMPG7Y7wysXaM8FlzPjjQkM/n5jjGzXLD
	1x62+uuKoMSGeWMEZEsHeNqlETtyEv8sSferJPb3+KQEcYVqupxSuXXbQLXOIXDu7ieew4vHbQt
	5uJ1LxSjFRcWoOSGoDW1Uldhftd1dzvs=
X-Gm-Gg: ASbGnctdariy+nKcf+66XmdFC+B2GKBqZSzliK1DrfOd0g+k15oOMvdqfXh9uIKf7yq
	dGvocP/eGtp4LTsoteoJmHUBzekmxRsJxNku0RpGj6fKyqDloxDx/0svVTrrtW34QuGcQ7sEi22
	0S92ByTZ9HufzDBQxyJUpdIA6gJ1FShjA=
X-Google-Smtp-Source: AGHT+IFZbUVdPwHyT0Clm2bKqbykU6Hoz0divy6kyYfkhV2fc4IbIeu9yY9VFI6isbO+t3Jgv72E5GlEP9c/n5Vmv4I=
X-Received: by 2002:a05:6000:2dc8:b0:3a0:8325:8090 with SMTP id
 ffacd0b85a97d-3a35c825b99mr373886f8f.18.1747325445358; Thu, 15 May 2025
 09:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <202505151255.rCHp8Bvu-lkp@intel.com> <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
In-Reply-To: <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 May 2025 17:10:19 +0100
X-Gm-Features: AX0GCFutHTsXdF6X-UzPCdROzCLoI3M2MdWC6VhMZtfwaAYxbEp32opOSVRegW4
Message-ID: <CA+V-a8vrLyWDprGMcnbPQ5Skt=+zcRA6nJ6APOQ2V0d17pfMog@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally
 enable reprobe support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_091047_740401_3827077C 
X-CRM114-Status: GOOD (  29.68  )
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

Hi Geert,

On Thu, May 15, 2025 at 6:59=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Thu, 15 May 2025 at 07:04, kernel test robot <lkp@intel.com> wrote:
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on tip/timers/core]
> > [also build test WARNING on robh/for-next linus/master v6.15-rc6 next-2=
0250514]
> > [cannot apply to daniel-lezcano/clockevents/next]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bin=
dings-timer-renesas-ostm-Document-RZ-V2N-R9A09G056-support/20250506-223636
> > base:   tip/timers/core
> > patch link:    https://lore.kernel.org/r/20250506103152.109525-3-prabha=
kar.mahadev-lad.rj%40bp.renesas.com
> > patch subject: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Uncondi=
tionally enable reprobe support
> > config: hexagon-randconfig-001-20250513 (https://download.01.org/0day-c=
i/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/config)
> > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project=
 f819f46284f2a79790038e1f6649172789734ae8)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505151255.rCHp8Bvu-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/clocksource/renesas-ostm.c:235:34: warning: unused variable =
'ostm_of_table' [-Wunused-const-variable]
> >      235 | static const struct of_device_id ostm_of_table[] =3D {
> >          |                                  ^~~~~~~~~~~~~
> >    1 warning generated.
> >
> >
> > vim +/ostm_of_table +235 drivers/clocksource/renesas-ostm.c
> >
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  234
> > 3a3e9f23c2cae9 Biju Das 2021-11-12 @235  static const struct of_device_=
id ostm_of_table[] =3D {
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  236         { .compatible =3D "rene=
sas,ostm", },
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  237         { /* sentinel */ }
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  238  };
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  239
>
> The table is unused if CONFIG_OF=3Dn due to
>
>                 .of_match_table =3D of_match_ptr(ostm_of_table),
>
Thanks for the pointer, I'll add a __maybe_unused compiler attribute
and send a new version.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

