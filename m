Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9ECCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 16:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiRNyzOe298r/AZQWMjcltwwDXu8VvyeRKjL05VJt+k=; b=iB9ObeBUxsnKio7HXFeFv0SCn+
	Q7S/uYbu0Ug8Pn7pI4xZVFBbp0+wz8FL2jUZOUsLk0e4i99IGfN9+CjZyFFd+ZLjligxbpXuHTe1A
	se9hWv8EhbxqEYAA6DZB/Q2nBbPvKhaAvWyPDyCKDQrMPi5IJOSVELvNM6xGieHyhGNfNC5CyWEUI
	4Ta1HyW1I3c/oJYePfEgif5qujdbbh/kI/1X/WwH3HVnrzk+iGtMjoFdEn3iu/G98sklcmeWfl6ac
	PlgoDz+fj8+HUMHvFoxlLiZ9Il9aHd9zBTcCaZHttd8pcUrsL0GRNdNPsDXmglZLKGrvNi4mRKEw7
	JacsWGMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvIF7-0000000BtJ1-3MCI;
	Sun, 07 Sep 2025 16:27:53 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvICJ-0000000Bseb-0NaM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 16:25:00 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad681so5033908a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 09:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757262295; x=1757867095; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiRNyzOe298r/AZQWMjcltwwDXu8VvyeRKjL05VJt+k=;
        b=ktM8h8b4dAGcSrGy0EbwysmNs513P1rDbl04wtkBPXIVVeweNEnS/w5ExDh2CIUeGW
         fE8ugqe+W+tIGE4BrXtXb88rvswvYRaszXCiuDHQ6qEkO9qzW1Iedj/QNiITfhc8jo+W
         lfRtt/qnRG0B6KYPsApznFclisAYdd2fXFWF7Pl9T0zklT4Aysqgc7CRtj8OD5vWIgcp
         kBQuyqbqtr5cy6IhC7siDssJcJP3dHzXOHKljdzhw34gcvC4Qv7Sr8z4PDGTv7WyCXx8
         rBqCVNaNDFQWNCEozmz+Rr6BMtofkDSq07Ujsi9iRVdqSIbtMuiTKrUjEKYdNE4Fj3Xv
         WSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757262295; x=1757867095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiRNyzOe298r/AZQWMjcltwwDXu8VvyeRKjL05VJt+k=;
        b=oKjiaI7nxgRVqTjnzgHlmb48Yreyruzlg9I4dqQQsj3Lb4TvT1qdiH45L91RE/uMPE
         N12eV6YJ38dTFunmFB+WGhoXdeinliYnJa2K1MNsTBzvAYsJv9dEz3NDzfxIihMRouCG
         yUcqnx9MMFwVyP0RFNUa9BTQh+CmA1ZZt49vyi04MwCeFNQAVduIxNNphMZnktYhXM2a
         UZPIoPGvkzuBHi24OWxELcM1M8hEWN51CEOZ8cZ6JhXYZFhpZUAixu6jvPLJu4wlFdRi
         LJvKB8pi6sldy170PPhOtqyvDOgP/GRzxtZyRydr3aXEjEs0F3M0nLaYBDkrAfiAb1eO
         2YpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJkwaLoQAJU1Ya/nPN2ed8yuNTCmXx3rRLu7dzO0hROOzFNcKSnas5g95ShaqLvZxCF1xTdCXgbrF8kMZ8to0M@lists.infradead.org
X-Gm-Message-State: AOJu0Ywew05FnILshvGc39s3XiBA3jR4cisPqdR2puyftDa2fXoztGwD
	I7FhtqlN0pPew9IvVx7hhqnYrv9v/XaNiyZhm0s6Z2DZORKyjgQUbmF+K/d2nqgGPVXhMnWlvZ8
	ibFoF6xXUn6/JcSxv+c5sdq5/89cwJqY=
X-Gm-Gg: ASbGnctH7GGMeZR8MD1oIWhka1rhCAU0R6aA8tkQYIoCFS/RhR79DCYMajOyFtpEEUO
	tmk0ru0jo7cjlv9hY0NzeUfGoOXCILoar7jl1DWYt8S4VAJWXqZMtaMhJKnhyNWAtcNbl0RK6WK
	ZXbziu8IB6nBu2Fv2Wq6fvl4ze1ekOWtH+rXgxHOOc3MlHgTsC+4OsBytXauPlutOhERasoCCQo
	mujSyiF7/zkIsbHBJixgzKmSEMZZNDNvqw=
X-Google-Smtp-Source: AGHT+IEUh6UJBSIy7uo4UeXfaJOjmOBfvt+baz+Zj/IM1FZe0WwfnCLd6E2TEKnFs8F+Okrwc8Mjvj/w45twhB1XxLk=
X-Received: by 2002:a05:6402:2344:b0:61c:8114:8832 with SMTP id
 4fb4d7f45d1cf-6237c32cb64mr5651148a12.16.1757262294701; Sun, 07 Sep 2025
 09:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756372805.git.andrea.porta@suse.com> <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
 <CACRpkdY82ohgX_7YP16DJrzDvxMHcSu3rW+UtEmrP0AQiD_Exg@mail.gmail.com> <aLqg4ZTbUjsgoMwy@apocalypse>
In-Reply-To: <aLqg4ZTbUjsgoMwy@apocalypse>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sun, 7 Sep 2025 17:24:43 +0100
X-Gm-Features: AS18NWBwzsJHe_6E2dyS_2mGziKRRgdiIeyrYys7qDjqxQdP84-pkGK82KYLoRs
Message-ID: <CALeDE9O-CxmHUb2sOauyMbNtPftQnqcGchpp-VrD=Ju=QPS4jw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, florian.fainelli@broadcom.com, wahrenst@gmx.net, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_092459_136595_830F5C54 
X-CRM114-Status: GOOD (  18.92  )
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

Hey Andrea,

> On 21:06 Thu 04 Sep     , Linus Walleij wrote:
> > On Thu, Aug 28, 2025 at 2:45=E2=80=AFPM Andrea della Porta
> > <andrea.porta@suse.com> wrote:
> >
> > > From: "Ivan T. Ivanov" <iivanov@suse.de>
> > >
> > > This driver provide pin muxing and configuration functionality
> > > for BCM2712 SoC used by RPi5. According to [1] this chip is an
> > > instance of the one used in Broadcom STB  product line.
> > >
> > > [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3=
@broadcom.com/
> > >
> > > Cc: Jonathan Bell <jonathan@raspberrypi.com>
> > > Cc: Phil Elwell <phil@raspberrypi.com>
> > > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > > Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> >
> > Patch applied!
> >
> > > +config PINCTRL_BRCMSTB
> > > +        tristate "Broadcom STB product line pin controller driver"
> > > +        depends on OF && (ARCH_BRCMSTB || COMPILE_TEST)
> >
> > I changed this to (ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST)
> > because Peter Robinson told me the Pi5 needs this driver too.
> > See commit 1d99f92f71b6b4b2eee776562c991428490f71ef for details.
>
> Indeed, thanks for spotting this!

I've been testing this, and other associated patches, with Fedora
(feel free to cc: me on any patches too) and I'm seeing the following
crash on the 2Gb model, someone else reported to me they see it on
their 16gb, I'm assuming there's some issue/nuance in the d0 rev of
the SoC that causes issues. Wondering if you've done any testing with
the newer SoC rev or know of any issues there?

Peter

[   56.289183] SError Interrupt on CPU3, code 0x00000000be000011 -- SError
[   56.289194] CPU: 3 UID: 0 PID: 341 Comm: (udev-worker) Tainted: G
M               ------  ---  6.17.0-0.rc4.36.pr3.fc43.aarch64 #1
PREEMPT(voluntary)
[   56.289200] Tainted: [M]=3DMACHINE_CHECK
[   56.289201] Hardware name: raspberrypi Raspberry Pi 5 Model B Rev
1.0/Raspberry Pi 5 Model B Rev 1.0, BIOS 2025.04 04/01/2025
[   56.289204] pstate: 804000c9 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   56.289208] pc : brcmstb_pull_config_set+0x5c/0xd8
[   56.289216] lr : brcmstb_pull_config_set+0x44/0xd8
[   56.289220] sp : ffff800080663500
[   56.289221] x29: ffff800080663500 x28: ffffbcba6aaab480 x27: 00000000000=
00370
[   56.289227] x26: 0000ffffa9554298 x25: ffffbcbad6ad2360 x24: ffff0000007=
76240
[   56.289231] x23: ffff0000011352b8 x22: ffff000002a16080 x21: 00000000000=
00014
[   56.289235] x20: 0000000000000118 x19: ffff000002a16080 x18: 00000000fff=
ffffc
[   56.289239] x17: ffff0000010f1180 x16: ffffbcbad419c418 x15: 00000000000=
0000a
[   56.289243] x14: ffffffffffffffff x13: 0000000000000001 x12: 00000000000=
00000
[   56.289247] x11: 0000000000000040 x10: 0000000000000000 x9 : ffffbcbad3d=
da6d4
[   56.289251] x8 : 0000000000000014 x7 : 0000000000000000 x6 : ffffbcbad3d=
da768
[   56.289254] x5 : ffff00000204f480 x4 : 0000000000000020 x3 : 00000000000=
00000
[   56.289258] x2 : 0000000000000001 x1 : 0000000000000000 x0 : 00000000000=
00000
[   56.289262] Kernel panic - not syncing: Asynchronous SError Interrupt
[   56.422659] CPU: 3 UID: 0 PID: 341 Comm: (udev-worker) Tainted: G
M               ------  ---  6.17.0-0.rc4.36.pr3.fc43.aarch64 #1
PREEMPT(voluntary)
[   56.436367] Tainted: [M]=3DMACHINE_CHECK
[   56.440123] Hardware name: raspberrypi Raspberry Pi 5 Model B Rev
1.0/Raspberry Pi 5 Model B Rev 1.0, BIOS 2025.04 04/01/2025
[   56.451472] Call trace:
[   56.453919]  show_stack+0x30/0x90 (C)
[   56.457595]  dump_stack_lvl+0x7c/0xa0
[   56.461268]  dump_stack+0x18/0x2c
[   56.464590]  vpanic+0x140/0x338
[   56.467737]  panic+0x68/0x70
[   56.470622]  nmi_panic+0x90/0xa0
[   56.473859]  arm64_serror_panic+0x78/0x90
[   56.477878]  arm64_is_fatal_ras_serror+0x90/0x98
[   56.482509]  do_serror+0x38/0x60
[   56.485742]  el1h_64_error_handler+0x38/0x60
[   56.490026]  el1h_64_error+0x84/0x88
[   56.493609]  brcmstb_pull_config_set+0x5c/0xd8 (P)
[   56.498416]  brcmstb_pinconf_set+0xbc/0xe8
[   56.502523]  pinconf_apply_setting+0xc4/0x148
[   56.506893]  pinctrl_commit_state+0x124/0x240
[   56.511262]  pinctrl_select_state+0x24/0x40
[   56.515456]  pinctrl_bind_pins+0x1ec/0x280
[   56.519565]  really_probe+0x60/0x3a0
[   56.523150]  __driver_probe_device+0x84/0x160
[   56.527520]  driver_probe_device+0x48/0x130
[   56.531716]  __driver_attach+0xd0/0x1f8
[   56.535560]  bus_for_each_dev+0x84/0x100
[   56.539494]  driver_attach+0x2c/0x40
[   56.543078]  bus_add_driver+0x158/0x280
[   56.546924]  driver_register+0x70/0x138
[   56.550769]  __platform_driver_register+0x28/0x40
[   56.555487]  gpio_keys_init+0x28/0xff8 [gpio_keys]
[   56.560296]  do_one_initcall+0x5c/0x318
[   56.564143]  do_init_module+0x9c/0x2b8
[   56.567903]  load_module+0x7e0/0x998
[   56.571486]  init_module_from_file+0x90/0xf0
[   56.575769]  __arm64_sys_finit_module+0x270/0x380
[   56.580488]  invoke_syscall.constprop.0+0x64/0xe8
[   56.585208]  el0_svc_common.constprop.0+0xc0/0xe8
[   56.589927]  do_el0_svc+0x24/0x38
[   56.593250]  el0_svc+0x3c/0x168
[   56.596398]  el0t_64_sync_handler+0xa0/0xf0
[   56.600593]  el0t_64_sync+0x1b0/0x1b8
[   56.604264] SMP: stopping secondary CPUs
[   56.608198] Kernel Offset: 0x3cba532a0000 from 0xffff800080000000
[   56.614310] PHYS_OFFSET: 0x0
[   56.617194] CPU features: 0x080000,00017000,24023140,0401720b
[   56.622958] Memory Limit: none
[   56.626147] ---[ end Kernel panic - not syncing: Asynchronous
SError Interrupt ]---

