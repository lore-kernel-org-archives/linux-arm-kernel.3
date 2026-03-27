Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB8810F285E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BpdTk3yfLMXdUkcdSqe/UkWFQSmNN+g+3FB/HDrwE4=; b=3DzSMNQILB045xNCwlBFDCAAMK
	fZtdt/xesgdM9sMDAGBXLsyDdsdO3151CMCQeyO5dNDcQuL1i09YwVyQuXD0OiHheqmP1SLPUlZfZ
	EQwIw4pNSd2i8dLngXpJRmeYqbH5XN16Dprc7ls6AVpzqVNyL2+8kJdwzRlYg3Jky2pA3ZDaOUEGF
	4kHkc4IQ5ynSc8IA6E+d43ok/ZHZ0Zfng7gcQN1NVO7z3bi+4yNfkY+UxdLLOknPPhpYm1RR9efaL
	GobE+aont47cudFgrksruH5rFOcLpKRMM6Ls9LLBQOyES26BDDuazKsT80s79xn28R4eX6LGnJLM2
	WG03YlPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AuQ-00000007rIK-1vbx;
	Fri, 27 Mar 2026 17:23:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AuO-00000007rHn-1DNS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 17:23:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AD394444E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 17:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC175C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 17:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774632222;
	bh=B0QJFzHz4fHnDQOwI9Isf399xfwKPSgQhgYZDJhjLV8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=COFyM9L+/KahIBnEjYxn1SjsJZ+r9JR1KOekoKVWEK1Nh4Mq3BAtHUgdL2w4CmWMm
	 VVU10cA4ARopLIboGd5FGaN5Vf9njYvq27i6hpe7L5HrHWiOTPD9oW60kjEXP87PJG
	 t7S6R5VDNt/7erEOutKHrRQMJbcml7n1S1ozqzUICXr32+DJPMvU213PJjqNvuUxD0
	 Ppu0eu4NPQib9Thzhpm2Tz8g9QhGaMo1uOfOPHABHnBC1k+5oykpRSWKRX5C7kICsc
	 HaGEuCvaIxRHuzdcZO0mz7GRmFoYOo+zV98IDZvtTnLPDTswweEn7wMI7yktRESrLB
	 3eq9RjEBCMmPg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a723b2b29so20698101fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 10:23:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVtvwjk9VsTrT2Vt2/DoWd00ex+DSaIf9C5SvDJJkkBcAwu3dDVgdX8Pv44+viNW6FHh1TpT3YFm17OYo+V5bAD@lists.infradead.org
X-Gm-Message-State: AOJu0YytEDgbrbdsHZoAmTY+V/hl/lB42ObJTGKoHqV2hYC785G9TQz+
	qk7Eqb18YnsNH7vUOZ1dFoSUc3xudlRVxKdSWkWyt2/2wrrDB3qI/fndbm7Lpqw6YLaRmyqPJ5C
	0t0IeM/j21wr4IAMLIsRYRl/eIUUWRhA7bfvITyVW4w==
X-Received: by 2002:a05:651c:1508:b0:38c:5b99:a32 with SMTP id
 38308e7fff4ca-38c73114706mr11731611fa.10.1774632221372; Fri, 27 Mar 2026
 10:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com>
 <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com> <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
 <7h1phxpzml.fsf@baylibre.com> <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
 <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com>
 <acaOlGcGQEZHQ_mJ@darkstar.musicnaut.iki.fi> <CAMRc=McDdK8Y7wtG8WObjD6WF-2ftKBDwKbvj=xL-NMfeV=bPQ@mail.gmail.com>
 <aca3ajb_G3gD24S7@darkstar.musicnaut.iki.fi>
In-Reply-To: <aca3ajb_G3gD24S7@darkstar.musicnaut.iki.fi>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 27 Mar 2026 18:23:29 +0100
X-Gmail-Original-Message-ID: <CAMRc=McVPskF4pMQSz=hR8CkyZhoPmCU_yJFT66vgTCPJd3-Vw@mail.gmail.com>
X-Gm-Features: AQROBzAizA0aFS4zAgRW_NoeIPz_y40ntaHCdZia8dk6252Ylj_RriHyNCKXnHc
Message-ID: <CAMRc=McVPskF4pMQSz=hR8CkyZhoPmCU_yJFT66vgTCPJd3-Vw@mail.gmail.com>
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kevin Hilman <khilman@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_102344_375023_6253B7D7 
X-CRM114-Status: GOOD (  16.75  )
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

On Fri, Mar 27, 2026 at 5:59=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi=
> wrote:
>
> Hi,
>
> On Fri, Mar 27, 2026 at 03:22:12PM +0100, Bartosz Golaszewski wrote:
> > Hmm, I'm wondering if there's a race with consumers already requesting
> > the GPIOs after the controller device is registered but before the
> > software node is added. I'll send a version with software nodes being
> > registered first, then passes as firmware nodes to the platform device
> > API before the device is registered.
>
> It crashes early, I was able to get an UART log from OSK (another
> 16xx board):
>
> [    1.001525] Register r12 information: 2-page vmalloc region starting a=
t 0xc2808000 allocated at kernel_clone+0xa4/0x20c
> [    1.013092] Process swapper/0 (pid: 1, stack limit =3D 0x(ptrval))
> [    1.019500] Stack: (0xc2809ed0 to 0xc280a000)
> [    1.024230] 9ec0:                                     c072d000 c052947=
4 c06b3aa0 c050a3cc
> [    1.032958] 9ee0: c072d000 c085c000 00000002 c052582c c050a324 c072d00=
0 00000000 c0503160
> [    1.041687] 9f00: 00002710 00000000 c04da8f8 c0060900 c2809f64 fffffff=
f 00010000 946f70b5
> [    1.050384] 9f20: 00000062 c0816120 00000002 c052582c c0525848 c072d00=
0 c04da8f8 c0060a18
> [    1.059112] 9f40: c2809f64 c2809f64 00000000 946f70b5 00000062 c081612=
0 00000002 c052582c
> [    1.067810] 9f60: c052584c c072d000 c04da8f8 c050352c 00000002 0000000=
2 00000000 c0502400
> [    1.076507] 9f80: c2809f7c 00000000 c03f86f4 00000000 00000000 0000000=
0 00000000 00000000
> [    1.085205] 9fa0: 00000000 c03f8704 00000000 c000850c 00000000 0000000=
0 00000000 00000000
> [    1.093902] 9fc0: 00000000 00000000 00000000 00000000 00000000 0000000=
0 00000000 00000000
> [    1.102600] 9fe0: 00000000 00000000 00000000 00000000 00000013 0000000=
0 00000000 00000000
> [    1.111206] Call trace:
> [    1.111328]  software_node_to_swnode from device_add_software_node+0x2=
0/0x80
> [    1.121704]  device_add_software_node from omap16xx_gpio_init+0xa8/0xe=
4
> [    1.128997]  omap16xx_gpio_init from do_one_initcall+0x68/0x1f4
> [    1.135620]  do_one_initcall from kernel_init_freeable+0x1ec/0x240
> [    1.142517]  kernel_init_freeable from kernel_init+0x10/0x108
> [    1.148864]  kernel_init from ret_from_fork+0x14/0x28
> [    1.154357] Exception stack(0xc2809fb0 to 0xc2809ff8)
> [    1.159820] 9fa0:                                     00000000 0000000=
0 00000000 00000000
> [    1.168518] 9fc0: 00000000 00000000 00000000 00000000 00000000 0000000=
0 00000000 00000000
> [    1.177185] 9fe0: 00000000 00000000 00000000 00000000 00000013 0000000=
0
> [    1.184295] Code: e3500000 012fff1e e59f3034 e5932000 (e5923000)
> [    1.191040] ---[ end trace 0000000000000000 ]---
> [    1.196350] Kernel panic - not syncing: Attempted to kill init! exitco=
de=3D0x0000000b
> [    1.204559] ---[ end Kernel panic - not syncing: Attempted to kill ini=
t! exitcode=3D0x0000000b ]---
>

Thanks. This makes sense. Both omap16xx_gpio_init() and
software_node_init() run as postcore_initcall() so if the order is not
right, it will fail.

Cc'ing Andy who's a reviewer for software nodes. Andy: is there any
reason to run software_node_init() as a postcore initcall? It only
allocates the kset, can we move it to core_initcall() by any chance?

Bart

