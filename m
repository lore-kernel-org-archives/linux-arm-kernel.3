Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25859FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 06:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLia1GJ4m3iPqeHXXFyHuRSpmpWEtbo9/yBBaAnZii4=; b=PsxlYon94a49Von1VIBqvAJt8y
	aSGxsNyKfHzGVf27eW+H95oYPOzC5aaQKC/m2R75duu11GvoP5/C99rKc8RtYcWVmWNSAV1M3w3q7
	SYBqW0JOeSh7988yHybOmDQpXy4+S6zmd7MkFGfdjUuPBerBWOtxkBOUqqEI2XiWNv0L4eJcriLe0
	7t3YVhm91/bt37h9a1KZQMFOGQIBL2SbJdmKRlfVTKB86XrD8IaDiimuffQp2pfKqDfsSJYMgLf/+
	MVXhWTLWr8dgdSd+keJ+JUltBlKSUZVncsWhxBmBhLbxmfx7RuP/PONkQv/Je8tG1R2AUqLgKAENT
	cOLMyYgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmlX-0000000CVFH-3IbM;
	Mon, 04 May 2026 06:26:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmlV-0000000CVEc-1fJv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 06:26:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so28770875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 23:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777876007; x=1778480807; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QLia1GJ4m3iPqeHXXFyHuRSpmpWEtbo9/yBBaAnZii4=;
        b=g5Y5BTARtayBV/acLLPGH8ru3GJ8KMMuU5n4TUSZ/Glk+hxCQwf0bV/Q1MDGi9b2Ff
         GNHS5FFDEtDdaU/bgniIv3YWyhWR95CGTKJ4YT0KKAC4eVpSUkT3fUXk7cMV1X4Y8/2i
         L11x6FPYmKOzeHZGDXsaSJDGoFv6ZDg7IY6a9uWehESgNd0+aceR8IYzdM18LIrP2SJf
         X72hlb3e+uzEfpfV0YEIhxQogIomnwEbvGF+TK5CFgCQmvLYTMee+QytCz/KSOoYU6IW
         dEt1EL8VXTiObw5VR0AuOZHIbgTXJH37/FDrxBmrpwgE9gT+yja14N2J0t0BWdwM1ur1
         eKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777876007; x=1778480807;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QLia1GJ4m3iPqeHXXFyHuRSpmpWEtbo9/yBBaAnZii4=;
        b=HaJCuMKhh+WmBsKjoh1Zu4TCVV5zpaI65rjYoZuHHC1REJlEAgr2wiHcCCimzqc5w+
         IQ0NsBeBrRgl5ITY/DrJChVa2RNkGJ6knBa8j9emIyxYb5/IOyJvk3/lSjAv9xnQtlYf
         9mO1L1Lh0wTN660n/lru/49Cxqo/QfcPE6C1DGLs+IdwSJ4083QAewHRKbGL3XlBaczY
         9+OTgpqQJtIHNwpeuw2rhLbWuB6YY73DhjewDG36GOkq5RF7gVam5ORcjG5AQecQJFCa
         Ujy3/aHHshhfwdrzbpx8i+4wL1iWXAmXs0eJJS+9X/JgtfYsCtPPX9PD8G5gLqcOv6Vu
         wlrA==
X-Forwarded-Encrypted: i=1; AFNElJ8jtPnuoZBK+Y8PIV8y1kQ2Mt4+b9ZpHmqqFthYY/3OvoXcSaodYklPjJckQW0PkRcXFxtWUE1oiFv2wXxboqC9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5e9DhvaaC4DbJFGyimZ6F3vUkTPgx/Q2RbS1tm6C1KKm6iEPd
	vXNMW/bOe2i5hFyEej7kKLnhG6USG72HCXZdJz6yqIyrHUSRvtJWgpxW
X-Gm-Gg: AeBDieu9Ok+kNM/vBbLL0YNBrmDm5F3CknvVjssws9z/dNOeAsIxPjrLLb23bxcxBkK
	jkSmPlYbAuIQAXI+R7E6XMoXjmrQUX93uSJHAiS6U7vtzsCp0+cU60tSUZJTZeJK+zH4NQt5eOH
	Ky49zWtvx7iiG05xVtTyvxVyfpUYGFFaDkcacPWu9j+fH2V6PAbrP5sMFxyCi6t74bNcGkJFDdx
	6vmmqynXum4/ikrvKH9bP2JD/JVbvJQyblQ4ezZstkWT08jJh57HAo0DdAQVkprlSD5K4nvML4x
	QMHi69CWIBsq+x9TbREfVDHbgcP7MhSQiyfjFAzLRTvIzJcsoMktEMEJJK7LKkEySvu+xfLNJoD
	UIZyG/+ZlkC4m8EfVkP8p57h1vpFw3KRk+IjWBbyPY/dl3WB2tvZMHtn0sUzRG1lmdpmh5TUOD2
	jI4Mds6+s9gjFBqr79JhoP6MlHhptDma+yLFPk6ml+2q2OVst6Dlt1lcaPNJslV4TtGv8E+w==
X-Received: by 2002:a05:600c:47cf:b0:48d:366:b962 with SMTP id 5b1f17b1804b1-48d0366bb8fmr38782655e9.6.1777876006815;
        Sun, 03 May 2026 23:26:46 -0700 (PDT)
Received: from vitor-nb.Home (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba6f83sm238082165e9.9.2026.05.03.23.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:26:46 -0700 (PDT)
Message-ID: <0cad7e5e41b9e2c6ec545050dd0d3c6b3e085d2c.camel@gmail.com>
Subject: Re: [PATCH v1] pmdomain: ti_sci: re-sync TIFS with genpd on resume
From: Vitor Soares <ivitro@gmail.com>
To: Sebin Francis <sebin.francis@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>,  Nishanth Menon <nm@ti.com>, Tero Kristo
 <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Ulf Hansson
 <ulfh@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>,  Kevin Hilman <khilman@baylibre.com>,
 vishalm@ti.com, d-gole@ti.com, Devarsh Thakkar <devarsht@ti.com>, 
 stable@vger.kernel.org, Kendall Willis <k-willis@ti.com>
Date: Mon, 04 May 2026 07:26:44 +0100
In-Reply-To: <17cbaadb-5aa7-40f4-848c-ba8e88fbd333@ti.com>
References: <20260427074808.3244226-2-ivitro@gmail.com>
	 <1fb0739e-b84f-42f1-9c96-88b5cc5866a8@ti.com>
	 <c0fe43a2339c802e9ce5900092cd530a2ba17a6b.camel@gmail.com>
	 <17cbaadb-5aa7-40f4-848c-ba8e88fbd333@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_232649_526341_F82D2CA6 
X-CRM114-Status: GOOD (  37.77  )
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

Hello Sebin

On Thu, 2026-04-30 at 16:17 +0530, Sebin Francis wrote:
> Hi Vitor,
>=20
> On 29/04/26 21:56, Vitor Soares wrote:
> > Hi Vignesh
> >=20
> > Thank you for the review.
> >=20
> > On Wed, 2026-04-29 at 10:03 +0530, Vignesh Raghavendra wrote:
> > > Hi Vitor
> > >=20
> > > On 27/04/26 13:18, Vitor Soares wrote:
> > > > From: Vitor Soares <vitor.soares@toradex.com>
> > > >=20
> > > > When a device in a TI SCI power domain is on the wakeup path of a
> > > > wakeup-capable child, the suspend path skips genpd_sync_power_off()=
.
> > > > No put_device is sent to TIFS and the domain's genpd status remains
> > > > ON.
> > >=20
> > > Correction of terminologies: TIFS is Root of trust component and is n=
ot
> > > usually involved in power management, that would be DM (Device Manage=
r)
> > >=20
> >=20
> > Thank you for the clarification. I will address this on v2. Also, I was
> > thinking
> > to replace put_device/get_device with ti_sci_pd_power_off/ti_sci_pd_pow=
er_on
> > if
> > that makes more clear the content.
> >=20
> > > But to be really sure who is doing what, Could you provide an example
> > > and the platform on which you see the issue / external abort?
> > >=20
> >=20
> > This was reproduced on our Toradex Verdin AM62P WB and the driver for o=
ur
> > Wi-Fi
> > module on the SDIO bus calls device_init_wakeup() during the initializa=
tion.
> >=20
> > After enter in suspend, it show the following error resume path:
> >=20
> >=20
> > [=C2=A0=C2=A0 41.759341] Internal error: synchronous external abort: 00=
00000096000010
> > [#1]
> > SMP
> > [=C2=A0=C2=A0 41.843286] CPU: 0 UID: 0 PID: 933 Comm: rtcwake Tainted: =
G=C2=A0=C2=A0 M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O
> > 6.18.21-dirty #3 PREEMPT
> > [=C2=A0=C2=A0 41.852762] Tainted: [M]=3DMACHINE_CHECK, [O]=3DOOT_MODULE
> > [=C2=A0=C2=A0 41.857891] Hardware name: Toradex Verdin AM62P WB on Verd=
in Development
> > Board (DT)
> > [=C2=A0=C2=A0 41.865537] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DI=
T -SSBS BTYPE=3D-
> > -)
> > [=C2=A0=C2=A0 41.872492] pc : regmap_mmio_read32le+0x8/0x20
> > [=C2=A0=C2=A0 41.876941] lr : regmap_mmio_read+0x44/0x70
> > [=C2=A0=C2=A0 41.881120] sp : ffff800081fdb8e0
> > [=C2=A0=C2=A0 41.884428] x29: ffff800081fdb8e0 x28: 0000000000000000 x2=
7:
> > ffffa95bb64aa9c8
> > [=C2=A0=C2=A0 41.891563] x26: 0000000000000000 x25: 0000000000000000 x2=
4:
> > 0000000000000000
> > [=C2=A0=C2=A0 41.898697] x23: 0000000080000000 x22: ffff000002df5c00 x2=
1:
> > ffff800081fdb9b4
> > [=C2=A0=C2=A0 41.905831] x20: 0000000000000100 x19: ffff000001286400 x1=
8:
> > 0000000000000000
> > [=C2=A0=C2=A0 41.912965] x17: 2d69696d67722f79 x16: 687020726f662067 x1=
5:
> > ffff00007fb74f40
> > [=C2=A0=C2=A0 41.920100] x14: 00000000000002ea x13: 000000000000031f x1=
2:
> > 0000000000000000
> > [=C2=A0=C2=A0 41.927234] x11: 00000000000000c0 x10: 00000000000009e0 x9=
 :
> > ffff800081fdb7a0
> > [=C2=A0=C2=A0 41.934368] x8 : ffff00007fb6ce00 x7 : 0000000000000000 x6=
 :
> > 0000000000000000
> > [=C2=A0=C2=A0 41.941502] x5 : ffffa95bb57948d8 x4 : 0000000000000100 x3=
 :
> > 0000000000000100
> > [=C2=A0=C2=A0 41.948636] x2 : ffffa95bb5795034 x1 : 0000000000000100 x0=
 :
> > ffff80008025d100
> > [=C2=A0=C2=A0 41.955770] Call trace:
> > [=C2=A0=C2=A0 41.958211]=C2=A0 regmap_mmio_read32le+0x8/0x20 (P)
> > [=C2=A0=C2=A0 41.962655]=C2=A0 _regmap_bus_reg_read+0x70/0xb0
> > [=C2=A0=C2=A0 41.966839]=C2=A0 _regmap_read+0x64/0xdc
> > [=C2=A0=C2=A0 41.970327]=C2=A0 _regmap_update_bits+0xf4/0x140
> > [=C2=A0=C2=A0 41.974509]=C2=A0 regmap_update_bits_base+0x64/0x98
> > [=C2=A0=C2=A0 41.978952]=C2=A0 sdhci_am654_runtime_resume+0x138/0x208
> > [=C2=A0=C2=A0 41.983830]=C2=A0 pm_generic_runtime_resume+0x2c/0x44
> > [=C2=A0=C2=A0 41.988445]=C2=A0 __genpd_runtime_resume+0x30/0x7c
> > [=C2=A0=C2=A0 41.992804]=C2=A0 genpd_runtime_resume+0xdc/0x2e8
> > [=C2=A0=C2=A0 41.997073]=C2=A0 pm_runtime_force_resume+0x68/0xf4
> > [=C2=A0=C2=A0 42.001517]=C2=A0 dpm_run_callback+0x8c/0x14c
> > [=C2=A0=C2=A0 42.005439]=C2=A0 device_resume+0x11c/0x34c
> > [=C2=A0=C2=A0 42.009188]=C2=A0 dpm_resume+0x178/0x1f0
> > [=C2=A0=C2=A0 42.012673]=C2=A0 dpm_resume_end+0x18/0x34
> > [=C2=A0=C2=A0 42.016332]=C2=A0 suspend_devices_and_enter+0x4a4/0x668
> > [=C2=A0=C2=A0 42.021123]=C2=A0 pm_suspend+0x170/0x2dc
> > [=C2=A0=C2=A0 42.024610]=C2=A0 state_store+0x80/0x104
> > [=C2=A0=C2=A0 42.028096]=C2=A0 kobj_attr_store+0x18/0x2c
> > [=C2=A0=C2=A0 42.031845]=C2=A0 sysfs_kf_write+0x7c/0x94
> > [=C2=A0=C2=A0 42.035508]=C2=A0 kernfs_fop_write_iter+0x130/0x1fc
> > [=C2=A0=C2=A0 42.039949]=C2=A0 vfs_write+0x200/0x370
> > [=C2=A0=C2=A0 42.043351]=C2=A0 ksys_write+0x6c/0x100
> > [=C2=A0=C2=A0 42.046752]=C2=A0 __arm64_sys_write+0x1c/0x28
> > [=C2=A0=C2=A0 42.050673]=C2=A0 invoke_syscall.constprop.0+0x50/0xe4
> > [=C2=A0=C2=A0 42.055378]=C2=A0 do_el0_svc+0x40/0xc4
> > [=C2=A0=C2=A0 42.058691]=C2=A0 el0_svc+0x40/0x15c
> > [=C2=A0=C2=A0 42.061834]=C2=A0 el0t_64_sync_handler+0xa0/0xe4
> > [=C2=A0=C2=A0 42.066015]=C2=A0 el0t_64_sync+0x198/0x19c
> > [=C2=A0=C2=A0 42.069680] Code: aa0603e0 d65f03c0 f9400000 8b214000 (b94=
00000)
> >=20
> > >=20
> > > >=20
> > > > TIFS powers off the hardware during deep sleep regardless, since it
> > > > was never informed to keep the domain active. On resume, because th=
e
> > > > domain's genpd status is ON, no get_device is issued. The driver
> > > > then accesses registers of a powered-off domain, causing a
> > > > synchronous external abort (AXI bus error, ESR 0x96000010).
> > >=20
> > > Hmm, if something is wakeup source, I would expect even TIFS/DM not t=
o
> > > turn if off, else module wakeup wouldn't work.
> > >=20
> >=20
> > I tested UART as a wakeup source and I couldn't reproduce this issue. M=
y
> > understanding is that UART has its own TI SCI domain and device_may_wak=
eup()
> > is
> > true directly on that domain device, so the set_device_constraint fires
> > correctly and DM keeps it powered.
> >=20
> > Here is my tracking of the issue:
> >=20
> > Wi-Fi driver registers as wakeup source:
> > device_init_wakeup(mmc0:0001)
> >=20
> > During suspend/resume.
> > dpm_suspend()
> > ->genpd_suspend_dev(fa20000.mmc)
> > =C2=A0=C2=A0=C2=A0 ->ti_sci_pd_suspend(fa20000.mmc)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ->ti_sci_pd_set_wkup_constraint(fa=
20000.mmc)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_may_wakeup(fa20=
000.mmc)=C2=A0 =3D false
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_device_constraint =
never sent to DM
> >=20
> >=20
> > dpm_suspend_noirq()
> > ->genpd_finish_suspend(fa20000.mmc)
> > =C2=A0=C2=A0 ->device_awake_path(fa20000.mmc) =3D true
> > =C2=A0=C2=A0 ->GENPD_FLAG_ACTIVE_WAKEUP =3D true
> > =C2=A0=C2=A0=C2=A0=C2=A0 genpd status =3D GENPD_STATE_ON
> > =C2=A0=C2=A0=C2=A0=C2=A0 skip power_off (ti_sci_pd_power_off)
> >=20
> > On deep sleep entry, DM powers off fa20000.mmc independently.
> > It received no set_device_constraint nor ti_sci_pd_power_off.
>=20
> In AM62P fa20000.mmc is part of main domain. During deepsleep the entire=
=20
> main domain is turned off by the DM, that is why you see the failures.
>=20
> In-order to debug this we need to check why pd off and pd on call is not=
=20
> getting called for fa20000.mmc during suspend and resume.

This is an expected behavior from genpd. On suspend, ti_sci_pd_power_off is=
 not
called because genpd_finish_suspend() takes an early return when both   =
=20
device_awake_path() and GENPD_FLAG_ACTIVE_WAKEUP are true.
                                                              =20
On resume, ti_sci_pd_power_on is not called because genpd sees the domain s=
tatus
as GENPD_STATE_ON (it was never cleared) and skips the power-on entirely.

>=20
> >=20
> > I attempted to fix this by calling set_device_constraint when
> > device_wakeup_path() is true but it prevented the system from entering =
deep
> > sleep entirely.
>=20
> In AM62P the DM manager selects the low power mode to enter based on the=
=20
> constrains set. The mode selection logic will ensure that if a=20
> constraint is set on the device, it will select a low power mode in=20
> which the device is kept on or can wake the system up. the MMC is part=
=20
> of main domain and there is no low power mode in which the MMC can stay=
=20
> alive or generate a wake up interrupt. so when a constraint is set of=20
> MMC, we cannot enter any low power mode. that why you see a failure.
>=20

This is consistent with what we observed. I am open to suggestions if there=
 is a
better way to handle this.

Thanks,
Vitor Soares


