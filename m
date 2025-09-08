Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBE6CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 09:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZXyFzYuA8aZyQjKh7kKN91C/ghUBbC862WwHS3ZpcU=; b=UAOazRpmgBjcrLzwTwMi0DFiAT
	tFDuTD/daF/g4DgQE96WhALRgHrv1riBciJcrYjDGS4C2RSjfsFkYHPSN7SKSpjaczGlzPltfYB1V
	DsbjFxwYgjoKjrsJZpbDBBt36LRehOAmO2Vmg+VvLRII/B0Pj8VSiRECdLPiu1aoeB602O8ClGen7
	PgTXCRZhVkhMNCZhWGCOYxsBvx/yaXw+FkLZD8KTyAENepx0l2yS3aBsW4ccF4j8MRfqnAiv3ctX/
	TShoOeBxIlYX0PHm9f6bXgRswjqAIQYLPnfinCemOiztl38i2dHkvJ2MlX/jwh+6FhRJfF6Uqdr/3
	LXwXgYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXuw-0000000FwMo-0WZD;
	Mon, 08 Sep 2025 09:12:06 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvX4j-0000000Fdf0-26cX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 08:18:10 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-6263d0e4b94so3019903a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 01:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757319487; x=1757924287; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oZXyFzYuA8aZyQjKh7kKN91C/ghUBbC862WwHS3ZpcU=;
        b=JiJaOwBM+cyzUYncND+QDEBEIZxMz8HMQKfDvnPcRoanOWpUJA0QrUjiSfgJf8N9o/
         P/ZKuLnxpt+xLGRA3vVf/9mIkOPsexwz4Fn5r9MgjL52j0f0oZpQ5IXsORYrjKg9lkPB
         uFQZ2LdCXtndi3BkCKDWDD+OrkH6xcM+bDfJohCxaLy/dauApORAoTOqtU9Lw3b5PRi6
         78iMJWj+x7jJXPaaxqcp7A3T5UAN3w3pwRvDXcHdmv2PH+QMLA+MPUfCvvIi+nSYqjTD
         vZfwLapFqEszHdUDGTpawxzzW5TlfKLD35fMbk5trsTvGHNPbFWc13DiFKrZiCQ4GEAQ
         zheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319487; x=1757924287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZXyFzYuA8aZyQjKh7kKN91C/ghUBbC862WwHS3ZpcU=;
        b=s2oyxo9G/IcHQVNkNZR/2xx4YZykFeNfv1wDzu6roAdQoEVSCqVx1K1WNyIlCyfzet
         jICV66ZsNU7Ols413ruBhzFcyijfeQma55NbeTRJQRaWoid673HTZlsuAvrtGrhHC/iV
         GAjYuLXHkB1ahe5gZEHkI1CQEAGf2okCGwAq92fha93ETn8kMVRgGtkS2a+n4MrFgqt0
         AM1aw/zE7WoYDtbd8VYZHBmDty18fwk+2C4lXs+YMKtNL2SRcXmD6InUGjeAYZKjQ0qJ
         fmPh7f/nVqfaR8jxct5BUrL8QCPS61F/5Rle4I2N0+AamiRI+QX42h+wVkP0tO9mWXKJ
         ipiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAaGppHzBArpSiay88JNq2R1A6dUw7d/qoaoskgZVa8DhEUoT4MgB8hgzIKDHGtKaugB973O6Fw0coq4TRDjit@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1GQW+c7uiw6TGzeYYlCLseWZ1EgyWKoNHm+6b7MNvEz6dbFBD
	QFiHFAL3057PIBPpaeXJDj2Hk74pbD2kXSnq2a0AgQcuBlHk+2KeCD/kWJ9OWqCqc3E=
X-Gm-Gg: ASbGnct0q7x8dHE6kf0pCoHrKwgQ+u8+wRwRGHRDx1Ykcf2jbWjokLt7XEqzbnUTAJp
	Q5pUxwKgVYaXDnQ3wqaVQ/36Uvnj7PWKD2l2BNlbxK+hq240UcsKEDAh8c2ZSWeBbMuPZmrxK8E
	ZqIkJFDnxoHNmbZwAXAUWcF+Q8mt4Pa/czAbjuetrflrNsOgO3BuluIU9sU5Zov2ENpCt9aiKpd
	Y4GhkC5Aj0PyaS4zt7zUNWchRF9+abgHYimbYO7K7VApCN5K2JQt6ly8P6Ww6SnBRoJ01SY4qrj
	VB/bD8aJZT7br9A9jZ7gOdmLYCpcU1ZKvF4Hguqw5jaDKdg/s0YeexJhMW3tyOoAawDHEwpc/HB
	exsadWJcO/haccP2NpfAS2uU3AARPoTLlCDkMmnQFPHIVZXv6+Zmxs+wFmysACduUdyWZC1s6Ci
	nnEUfj9UfInr9CE/GwznHZ5k5XyRPBFC0M
X-Google-Smtp-Source: AGHT+IER2UAr/9PTWelTpPr0ZeyJhT+GzvKUxYe6FoK/Y0gFZt2/nh1VtCoSx8Jp83YYy5ehcL+EcA==
X-Received: by 2002:a05:6402:4305:b0:629:7973:e8b1 with SMTP id 4fb4d7f45d1cf-6297973ec5fmr1031764a12.7.1757319487314;
        Mon, 08 Sep 2025 01:18:07 -0700 (PDT)
Received: from localhost (host-79-31-194-29.retail.telecomitalia.it. [79.31.194.29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-622ac41b1d6sm5337838a12.32.2025.09.08.01.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:18:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 8 Sep 2025 10:20:04 +0200
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
Message-ID: <aL6RtJPdw06p2YZD@apocalypse>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
 <CACRpkdY82ohgX_7YP16DJrzDvxMHcSu3rW+UtEmrP0AQiD_Exg@mail.gmail.com>
 <aLqg4ZTbUjsgoMwy@apocalypse>
 <CALeDE9O-CxmHUb2sOauyMbNtPftQnqcGchpp-VrD=Ju=QPS4jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALeDE9O-CxmHUb2sOauyMbNtPftQnqcGchpp-VrD=Ju=QPS4jw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_011809_543293_8D1D7453 
X-CRM114-Status: GOOD (  25.71  )
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

Hi Peter,

On 17:24 Sun 07 Sep     , Peter Robinson wrote:
> Hey Andrea,
> 
> > On 21:06 Thu 04 Sep     , Linus Walleij wrote:
> > > On Thu, Aug 28, 2025 at 2:45 PM Andrea della Porta
> > > <andrea.porta@suse.com> wrote:
> > >
> > > > From: "Ivan T. Ivanov" <iivanov@suse.de>
> > > >
> > > > This driver provide pin muxing and configuration functionality
> > > > for BCM2712 SoC used by RPi5. According to [1] this chip is an
> > > > instance of the one used in Broadcom STB  product line.
> > > >
> > > > [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
> > > >
> > > > Cc: Jonathan Bell <jonathan@raspberrypi.com>
> > > > Cc: Phil Elwell <phil@raspberrypi.com>
> > > > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > > > Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> > > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > >
> > > Patch applied!
> > >
> > > > +config PINCTRL_BRCMSTB
> > > > +        tristate "Broadcom STB product line pin controller driver"
> > > > +        depends on OF && (ARCH_BRCMSTB || COMPILE_TEST)
> > >
> > > I changed this to (ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST)
> > > because Peter Robinson told me the Pi5 needs this driver too.
> > > See commit 1d99f92f71b6b4b2eee776562c991428490f71ef for details.
> >
> > Indeed, thanks for spotting this!
> 
> I've been testing this, and other associated patches, with Fedora
> (feel free to cc: me on any patches too) and I'm seeing the following
> crash on the 2Gb model, someone else reported to me they see it on
> their 16gb, I'm assuming there's some issue/nuance in the d0 rev of
> the SoC that causes issues. Wondering if you've done any testing with
> the newer SoC rev or know of any issues there?

I think you have to substitute 'd0' in place of 'c0' in bcm2712.dtsi:

s/brcm,bcm2712c0-aon-pinctrl/brcm,bcm2712d0-aon-pinctrl/
s/brcm,bcm2712c0-pinctrl/brcm,bcm2712d0-pinctrl/

that is, the compatible for the two SoC pin controller.

Which reminds me that we need to add this to the DTS specific for D0 silicon,
I'll work on that asap.

Many thanks,
Andrea


> 
> Peter
> 
> [   56.289183] SError Interrupt on CPU3, code 0x00000000be000011 -- SError
> [   56.289194] CPU: 3 UID: 0 PID: 341 Comm: (udev-worker) Tainted: G
> M               ------  ---  6.17.0-0.rc4.36.pr3.fc43.aarch64 #1
> PREEMPT(voluntary)
> [   56.289200] Tainted: [M]=MACHINE_CHECK
> [   56.289201] Hardware name: raspberrypi Raspberry Pi 5 Model B Rev
> 1.0/Raspberry Pi 5 Model B Rev 1.0, BIOS 2025.04 04/01/2025
> [   56.289204] pstate: 804000c9 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   56.289208] pc : brcmstb_pull_config_set+0x5c/0xd8
> [   56.289216] lr : brcmstb_pull_config_set+0x44/0xd8
> [   56.289220] sp : ffff800080663500
> [   56.289221] x29: ffff800080663500 x28: ffffbcba6aaab480 x27: 0000000000000370
> [   56.289227] x26: 0000ffffa9554298 x25: ffffbcbad6ad2360 x24: ffff000000776240
> [   56.289231] x23: ffff0000011352b8 x22: ffff000002a16080 x21: 0000000000000014
> [   56.289235] x20: 0000000000000118 x19: ffff000002a16080 x18: 00000000fffffffc
> [   56.289239] x17: ffff0000010f1180 x16: ffffbcbad419c418 x15: 000000000000000a
> [   56.289243] x14: ffffffffffffffff x13: 0000000000000001 x12: 0000000000000000
> [   56.289247] x11: 0000000000000040 x10: 0000000000000000 x9 : ffffbcbad3dda6d4
> [   56.289251] x8 : 0000000000000014 x7 : 0000000000000000 x6 : ffffbcbad3dda768
> [   56.289254] x5 : ffff00000204f480 x4 : 0000000000000020 x3 : 0000000000000000
> [   56.289258] x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000000
> [   56.289262] Kernel panic - not syncing: Asynchronous SError Interrupt
> [   56.422659] CPU: 3 UID: 0 PID: 341 Comm: (udev-worker) Tainted: G
> M               ------  ---  6.17.0-0.rc4.36.pr3.fc43.aarch64 #1
> PREEMPT(voluntary)
> [   56.436367] Tainted: [M]=MACHINE_CHECK
> [   56.440123] Hardware name: raspberrypi Raspberry Pi 5 Model B Rev
> 1.0/Raspberry Pi 5 Model B Rev 1.0, BIOS 2025.04 04/01/2025
> [   56.451472] Call trace:
> [   56.453919]  show_stack+0x30/0x90 (C)
> [   56.457595]  dump_stack_lvl+0x7c/0xa0
> [   56.461268]  dump_stack+0x18/0x2c
> [   56.464590]  vpanic+0x140/0x338
> [   56.467737]  panic+0x68/0x70
> [   56.470622]  nmi_panic+0x90/0xa0
> [   56.473859]  arm64_serror_panic+0x78/0x90
> [   56.477878]  arm64_is_fatal_ras_serror+0x90/0x98
> [   56.482509]  do_serror+0x38/0x60
> [   56.485742]  el1h_64_error_handler+0x38/0x60
> [   56.490026]  el1h_64_error+0x84/0x88
> [   56.493609]  brcmstb_pull_config_set+0x5c/0xd8 (P)
> [   56.498416]  brcmstb_pinconf_set+0xbc/0xe8
> [   56.502523]  pinconf_apply_setting+0xc4/0x148
> [   56.506893]  pinctrl_commit_state+0x124/0x240
> [   56.511262]  pinctrl_select_state+0x24/0x40
> [   56.515456]  pinctrl_bind_pins+0x1ec/0x280
> [   56.519565]  really_probe+0x60/0x3a0
> [   56.523150]  __driver_probe_device+0x84/0x160
> [   56.527520]  driver_probe_device+0x48/0x130
> [   56.531716]  __driver_attach+0xd0/0x1f8
> [   56.535560]  bus_for_each_dev+0x84/0x100
> [   56.539494]  driver_attach+0x2c/0x40
> [   56.543078]  bus_add_driver+0x158/0x280
> [   56.546924]  driver_register+0x70/0x138
> [   56.550769]  __platform_driver_register+0x28/0x40
> [   56.555487]  gpio_keys_init+0x28/0xff8 [gpio_keys]
> [   56.560296]  do_one_initcall+0x5c/0x318
> [   56.564143]  do_init_module+0x9c/0x2b8
> [   56.567903]  load_module+0x7e0/0x998
> [   56.571486]  init_module_from_file+0x90/0xf0
> [   56.575769]  __arm64_sys_finit_module+0x270/0x380
> [   56.580488]  invoke_syscall.constprop.0+0x64/0xe8
> [   56.585208]  el0_svc_common.constprop.0+0xc0/0xe8
> [   56.589927]  do_el0_svc+0x24/0x38
> [   56.593250]  el0_svc+0x3c/0x168
> [   56.596398]  el0t_64_sync_handler+0xa0/0xf0
> [   56.600593]  el0t_64_sync+0x1b0/0x1b8
> [   56.604264] SMP: stopping secondary CPUs
> [   56.608198] Kernel Offset: 0x3cba532a0000 from 0xffff800080000000
> [   56.614310] PHYS_OFFSET: 0x0
> [   56.617194] CPU features: 0x080000,00017000,24023140,0401720b
> [   56.622958] Memory Limit: none
> [   56.626147] ---[ end Kernel panic - not syncing: Asynchronous
> SError Interrupt ]---

