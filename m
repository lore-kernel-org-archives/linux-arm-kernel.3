Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D945CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WboogWqcoT+OL/ZD2SYskMF+y3oh6ksVJtvN7OeY8rI=; b=ZOmjNvxUfla50aOeLMXR315Zuu
	TRt8h5snCg7paPeKLjgN6Iaw1hvl4h6ORXW3jViixNVyVHng67u9vq3GqJwgWEg1i5YW/AafVTsHu
	aZM3YXn9fRmFIc6aVF3FL5SFAvT0ISDS+HtGhpTgI7/FeLXoCAgYUVObVC6ZFqwFsewv2PhzpG24x
	Oqn1BO+4/0L/g54QrgHnzFForVvMnSzat2nC/4pmxa30R3qy+i1xeCAJ8UfFHLILSWYTgrjsUbTRq
	g+KjRIbIIjIUEfhMHZKFg700cXMp2jRVjyVSr4lH4k8nILoHuJXeAQ3tGdrnGQR85FxKPPvCMxXVh
	AySYEO6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJ5m-00000007nIs-27C0;
	Wed, 10 Jun 2026 13:35:38 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJ5i-00000007nHY-2yU9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 13:35:36 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-beeba001887so906765266b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 06:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781098532; cv=none;
        d=google.com; s=arc-20240605;
        b=Gvo3AjiZYswURd4p5T3xPSMrutXJF+YHpP+1yV+qqv5mCcLZlE/9TmEmjfbjBFGS4J
         n0zqxwQVx4ITQR2x8QmFFtfBL5u/MbM/PLF5900z7pHFp8MlNLxgXqpxXBNW7Eru1oSz
         zY58sm5J0I4BjBeYPXZqBSVoyQKV+eURHxbBu+u9kL2/VDZf3K6jL6CWdyL71efL3oBb
         1/jmcqJuLktHP8XatnZxeZyUhhMr47WXsRa/efFvDGtzqMcFZaYtkFYQadnGQ/LctXzp
         MuQT3fVk6VCRMuaX+7RvHDKyC/sJH1w3nbDptoLk4C6IhR4GA8aqE9TGrKFEa9gf/Rvs
         0jPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WboogWqcoT+OL/ZD2SYskMF+y3oh6ksVJtvN7OeY8rI=;
        fh=Kq/RsUejqvZy8aL4L6V6zv04xaia/3C7CWDgvtolqrY=;
        b=CXUEqeTs+1X9y2wUcO5BBRm+ZsuyCAnir691397svC2fFAGjb4Xw4qXH7wOxwYsKe9
         OUSQJL8fks3s11oxqspZjB3U3RX0o7+diOAxjqAkoAEjVySQKgIawThi6oaNOESR48Av
         xczYlZ2zanBay4wq/MaZwNE1aicCFJNsT0xZgN7KIwm0+IIZHUnoCa4yYeuYgUgEFmHP
         uAASGmxo5hWHr60bgGlw6VS0o9COncQSfW/28d0dj3ujpRq3uTUt/gJDyrj5IfzyIEyB
         eNLwv0HGOBHZM3bYDRNeI+ZJhOlhS8yzCMgJGbw3rYkMmdjXEkjeEuLFH2kMuOmcHMQK
         iKKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781098532; x=1781703332; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WboogWqcoT+OL/ZD2SYskMF+y3oh6ksVJtvN7OeY8rI=;
        b=Hu1zpaaWTprKykg//N+jU0fpHLBi6TBgbeiL9ecG1HBfhGwB2Pm02v0Tra82Mtn5UX
         xt0JQrtJuVyK7pIPmrKVn3NclFnRvjSxIJK12xz5FFeS5ie7sknRY/eMzOh7hH4madQF
         62wsDztEd74MJSYUETAkDD5OgiBKKEHGluNM3xf8Rx/lJf1oxMBH+xer18Typ1ZwWo8B
         UEbSJxEGcAINXxvisdq59RPR6OupUfcIVWCznD55b6KBygAITAViFE9KJdokwG/n16o0
         URU4RXZdQY1Pkv1To0zXucvsrfotN1eJvDwpFAXGU60hsrBat7858iF5misC1OPaZHcL
         OR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098532; x=1781703332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WboogWqcoT+OL/ZD2SYskMF+y3oh6ksVJtvN7OeY8rI=;
        b=atR3ecRJrakq7aLPYkcwcLPQPpI9rC+/vNgC3K+cgBGWNbs4abGij3Rhe1TcuSnf8R
         ZFkwnYJ6xQhg00YL9jpBT357ZBcS5yy1Dxvy1VppqMGUaR6mPQEZoaNlHLDliI7+kq2O
         BbfJfRz26ZxrSBH92himN3vNxrbL2SCU9gn5qkhqD06M5s0ATWb7SMAY5NiaXHjYjyxB
         0JlxfPT64k33DZSL6rUkPTRZvz8k92v82aIa263Z4th+UR6ZRQg+3BRiv3zatJCBsjFB
         NUxsQA+Rzf/tqY8Cpjv4KQ1tIB8RybHbPuyGImcxORHya4t1gnEtjg3YlxD1RcUP3Qzy
         WWeg==
X-Forwarded-Encrypted: i=1; AFNElJ8tW6wvcb54Nmxr1+qJ8OcxG0nfo3G4aikfjFsTD1j3xtgKWJV1DnKe8vi/4qXItePL/xdz2DdVDdwTRtStoKnx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8ZkAkjwHjQxLQotJ60skDolXq+OsNfaaoC3CreP0hIH3nOuXs
	2hMZ94PEphiELT/Ne9Uox3JXuJf6kzZC/yFoPTR51ZY8H74mrch7N0uFwmtGsfwjwlsXthILYXo
	+J0cVZqdqBzaMV5VPpDw6JvWUmfx5o2U=
X-Gm-Gg: Acq92OGwflXB7jwi1dUJj3vp2pc3QL6x5RZdLYIkOwlzdg0cwTFyYiWC006ewMhL1q3
	SIF3LXMq+A10QLXU9JIBRZYJCeR/+S8yOTp86we6IBsUGWtiG0+xGaNIEO16KvY6Xt/YkwBLF2k
	xog7gTQkF+I3l/5juJUWbtu0IN2cT5SdS2Z13FoACRvWI/CMjzrubY5HBfDH4+38RZe4rzPBZI/
	Kk1W8JdbD8IOdb2sTuQ+FO2tDfrOrJMFUCas9ucTVHZGeTvibQo9EKKD0HPd94PmV56O8v+sI06
	Zi5f8JE2nPR6OM/5iA==
X-Received: by 2002:a17:907:948e:b0:bec:5ebd:e169 with SMTP id
 a640c23a62f3a-bf37263c586mr1377264466b.22.1781098531867; Wed, 10 Jun 2026
 06:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260604135255.62682-1-midgy971@gmail.com> <3d99569e-9c3a-49d1-93fb-1335382523e9@rock-chips.com>
 <CA+GS1Y1s78PwN63X2YJoS8VEGp7CpTERo_K65yKs00U4VRAw4Q@mail.gmail.com>
 <e5058919-9485-4de5-8eea-331ebfc2987c@rock-chips.com> <CA+GS1Y3ysdWZ3qCq3ip_Pbw+v4LxHZd95aBo=jwB+orYaMBBNw@mail.gmail.com>
 <CA+GS1Y0kAM_XGLQuKPTphif2HcQg18ZXhd8RHHr2xPOEMCDvXA@mail.gmail.com>
 <bcedaff0-abf8-4585-a0ea-057062cd0411@rock-chips.com> <CA+GS1Y2-hRqpGgsknh+oOX+-uZ3DZtdekdP9viTP6a40zhhUhg@mail.gmail.com>
 <b05f7154-e85f-4207-80ae-f080282ba780@rock-chips.com> <DJ5A9XL183RZ.20J3ASQ3EWUZ6@cknow-tech.com>
In-Reply-To: <DJ5A9XL183RZ.20J3ASQ3EWUZ6@cknow-tech.com>
From: Midgy Balon <midgy971@gmail.com>
Date: Wed, 10 Jun 2026 15:38:24 +0200
X-Gm-Features: AVVi8Cf8gCpLbNssJy_FW_CB2ltoJNgKiOGOa6bXMaOGRFQOxsnQSP0W6Cmk0Xc
Message-ID: <CA+GS1Y1xAq-9eMyMmoVE6NG9KLG7XRxgPoSr5RkW=6fT5D820g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/9] accel: rocket: Add RK3568 NPU support
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>, tomeu@tomeuvizoso.net, ogabbay@kernel.org, 
	heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Simon Xue <xxm@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_063534_801644_307B422E 
X-CRM114-Status: GOOD (  47.76  )
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

Hello Chaoyi & Diederik,

I compared the RK3568 and RK3588 NPU power-domain + DTS as you
suggested, and it lines up
exactly with what you described.

The difference is the `need_regulator` capability. RK3588's NPU domain is
`DOMAIN_RK3588("npu", =E2=80=A6, false, true)` =E2=80=94 the trailing `true=
` is
`regulator`/`need_regulator`.
The mainline RK3568 macro `DOMAIN_RK3568(name, pwr, req, wakeup)` has
no regulator parameter at
all, so `RK3568_PD_NPU` can't be marked need_regulator. My v4 adds
that: a regulator-capable
RK3568 NPU domain (need_regulator =3D true) plus `domain-supply =3D
<&vdd_npu>` on the NPU node =E2=80=94
i.e. the same shape as RK3588.

And the fix you referenced (Frank Zhang's "pmdomain: rockchip: Fix init gen=
pd as
GENPD_STATE_ON before regulator ready", plus "quiet regulator error on
-EPROBE_DEFER") is
already in my base (v7.1-rc6), so the `if (need_regulator)
rockchip_pd_power(pd, false)`
default-off path is in effect. That's what resolves the actual problem
for me: with rocket
built as a module (the normal config), need_regulator on the NPU
domain, and those pmdomain
patches in place, the board boots cleanly and NPU jobs run with no RCU
stall / no deadlock. My
earlier hang was an artifact of a self-contained rocket=3Dy image
probing in the initcalls before
the I2C regulator core was up =E2=80=94 as a module it loads ~6.8 s in, wel=
l
after, so it's gone.

I also went back and checked the `fw_devlink=3Dpermissive` question
myself =E2=80=94 and good news, it
turns out it is NOT needed. I rebooted the exact same kernel with
permissive removed from the
cmdline (strict fw_devlink, the default), and the board boots cleanly,
the NPU probes
(`rocket fde40000.npu: Rockchip NPU core 0 version: 0`), and NPU jobs
submit and run five times
in a row with no deadlock and no RCU stall. So strict fw_devlink
resolves the NPU/PMIC ordering
fine via deferred probe.

The one remaining thing is cosmetic: at power-domain-controller probe
(~2.94 s) I still get,
in BOTH modes (with or without permissive):

  rockchip-pm-domain =E2=80=A6: Failed to create device link (0x180) with
supplier 0-0020 =E2=80=A6power-domain@6

i.e. genpd can't form the link to the rk809 (the I2C PMIC supplying
vdd_npu) because the PMIC
isn't registered yet at that point. It's non-fatal =E2=80=94 the domain
defaults off (Frank's patch),
the rail comes up via the regulator core, the NPU probes a few seconds
later, and all jobs run.

One question: on RK3588 with need_regulator, do you also see that
"Failed to create device
link =E2=80=A6 supplier <pmic>" line at pmdomain probe, or does it order
cleanly? If RK3588 is clean,
is there a DTS detail (e.g. the regulator's bus/probe order) I should
mirror on RK3568 to make
the link form in time =E2=80=94 or is this line just expected/harmless and
best left as-is?

@Diederik =E2=80=94 thanks; the DCDC_REG2 change and Jonas's USB-suspend
series look like generally
useful RK356x robustness fixes, though for this specific NPU
device-link the need_regulator +
Frank's pmdomain patches seem to be the relevant piece. I'll keep them
in mind for suspend.

The convolution-output / compute-completion issue is still separate
and open (@Finley =E2=80=94 that's
the PVTPLL/NoC one); the power-domain side is in good shape for v4.

Thanks y'all for your help :)

Kind regards,
Midgy

Le mer. 10 juin 2026 =C3=A0 12:05, Diederik de Haas
<diederik@cknow-tech.com> a =C3=A9crit :
>
> Hi,
>
> On Wed Jun 10, 2026 at 3:14 AM CEST, Chaoyi Chen wrote:
> > Hi Midgy,
> >
> > On 6/9/2026 7:11 PM, Midgy Balon wrote:
> >> Hello Chaoyi,
> >>
> >> You were right - building rocket as a module fixes it. Thanks for the =
pointer.
> >>
> >> I rebuilt with CONFIG_DRM_ACCEL_ROCKET=3Dm (everything else the same:
> >> need_regulator on
> >> the RK3568 NPU power domain via a DOMAIN_M_R variant, domain-supply =
=3D
> >> <&vdd_npu>, and the
> >> regulator-always-on workaround dropped). The board now boots cleanly
> >> and, more importantly,
> >> an NPU job submit no longer hangs: I ran the test workload five times
> >> with no RCU stall and
> >> no freeze.
> >>
> >> So with rocket=3Dm the need_regulator approach works on RK3568, and I'=
ll
> >> keep it for v4
> >> (domain-supply + need_regulator, instead of marking vdd_npu
> >> always-on). rocket=3Dm is the
> >> normal configuration anyway; my earlier hang came from building it =3D=
y
> >> in a self-contained
> >> image, so it probed in the initcalls (around 2 s) and the genpd ->
> >> I2C-PMIC regulator
> >> transition ran before the system was ready. As a module it loads from
> >> udev much later
> >> (~6.8 s here), after the I2C controller and regulator core are fully u=
p.
> >>
> >> On your question of when the device-link error is printed - it is at
> >> power-domain
> >> controller probe, not at the rocket probe:
> >>
> >>   [    2.700618] vdd_npu: Bringing 500000uV into 825000-825000uV
> >>   [    2.749637] rockchip-pm-domain fdd90000.power-management:power-co=
ntroller:
> >>                  Failed to create device link (0x180) with supplier 0-=
0020 for
> >>                  /power-management@fdd90000/power-controller/power-dom=
ain@6
> >>   [    2.945955] platform fde40000.npu: Adding to iommu group 3
> >>   ...
> >>   [    6.840374] rocket: loading out-of-tree module taints kernel.
> >>   [    6.877647] [drm] Initialized rocket 0.0.0 for rknn on minor 0
> >>   [    6.879950] rocket fde40000.npu: Rockchip NPU core 0 version: 0
> >>
> >> So the device-link to the rk809 PMIC (0-0020) fails to form at ~2.75
> >> s, well before rocket
> >> loads at ~6.8 s. It is non-fatal here - the vdd_npu rail is brought up
> >> by the regulator core
> >> and all jobs run - and there is no "failed to get ack on domain npu"
> >> NoC warning this boot
> >> (the always-on kernel had one). The complete boot log is attached.
> >>
> >> Two notes / one question:
> >> - This boot used fw_devlink=3Dpermissive on the command line. Is the
> >> "Failed to create device
> >>   link ... supplier 0-0020" at pmdomain probe expected/benign, or is
> >> there a clean way to make
> >>   it order correctly (so it also works without permissive, and a =3Dy
> >> build wouldn't deadlock in
> >>   the initcalls)?
> >
> > We encountered the same issue on the RK3588 NPU before. And it was
> > resolved with the following patch at that time.
> >
> > https://lore.kernel.org/all/20251216055247.13150-1-rmxpzlb@gmail.com/
> >
> > Please compare the differences in NPU pmdomain and DTS configuration
> > between the RK3568 and RK3588.
>
> About a month ago on #linux-rockchip we were discussing PM 'stuff':
> https://libera.catirclogs.org/linux-rockchip/2026-05-15#39939137;
> which references this paste
> https://paste.sr.ht/~diederik/89d9f84e22474e837b55286d213b67f03859ce2e
> I've since removed the DCDC_REG2 for PineTab2 and the 'fix' should likely
> be extended to cover all RK3566/RK3568 devices though.
>
> It's what I made at the time hoping to fix a suspend/resume issue when
> trying upstream TF-A. It didn't fix the issue at the time, but may still
> be useful/needed and I think it's what Chaoyi hinted at.
>
> Just yesterday, Jonas posted this patch which may be useful/needed too:
> https://lore.kernel.org/linux-rockchip/20260609154124.445182-1-jonas@kwib=
oo.se/
>
> HTH,
>   Diederik
>
> >> - (The convolution output is still uniform zero-point / the job times
> >> out - that is the
> >>   separate NPU compute-completion issue, unrelated to the power-domain
> >> work. Finley, that is
> >>   the one I flagged earlier re PVTPLL/NoC.)
> >>
> >> Kind regards,
> >> Midgy
> >>
>

