Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69120C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5ufyWucvww0cPxhLp4Y4P0qQXejm9pZojzLX9IgS9I=; b=Iv5pCCiD/hP5daqs7CgjyKuonG
	zvhAhc659MHX6S+yzaEl5jwP7mvsz7OtL8WVVeRE5qk8eOyr9TJe1iYcojTan4i62SxOinNmwHpgO
	afdXQzjP7jyo+PLoApQubkrgp+pm0MoxbxeVxPOEtYrP5g3HFOd2i0QJI4vRZv7s3WmQWL8kNg+eU
	WH2XuqLnEZhTzPW/UGHAlGaM7ewHFsB11/ZiYkUkgpZBBqjr4FNHfiUvEIqRKLezH3zhnFDiFFny+
	uCA0UV5e6JXmJiI91rRllMRi2bt07CUbUxIcklShe1m8D0WJp7HF/r3rp1nnm4ucwNdmOe1GudqyT
	kSw1lUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5OW3-00000000vkw-06zH;
	Sat, 12 Sep 2026 14:15:39 +0000
Received: from mail-vs2-x10.google.com ([2a00:1450:4864:3a::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5OW0-00000000vkB-2XiR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 14:15:38 +0000
Received: by mail-vs2-x10.google.com with SMTP id ada2fe7eead31-7939829b4cdso348200137.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 07:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789222534; cv=none;
        d=google.com; s=arc-20260327;
        b=I9WkulAJUojcKrKeVOUXgoC6wEFFGWrAL/eqWGHBD8PPKswvCc+KKgaoeQq8ZSWpGp
         ynEp3Clh0a4vw+B5wy9EGmJOByx7qTxvr4rF+WoOkucUM9TGjNtaAJk2R1VE92LIIUTw
         TXioH3yMh4zsPxrPSkJ4nbGTd3tW9MZa7B5A9nyYcmYor8Y+l5xjpsrojik4SIUTvr55
         M8k2DJUDD7fedo4IrtGrkxPESQVzxK5rCPvChm0TqYc7d71ILzJJVnamJA2UVyJxnb5F
         MdXsuS3pGKZgxmrcN5taMCYYLR+y2awXw7qr8BAytGiS+jFa4gXVBjk0V/dM/vOG9Wne
         h2lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z5ufyWucvww0cPxhLp4Y4P0qQXejm9pZojzLX9IgS9I=;
        fh=0rB6c31ainYFeArrmc6mfwSMJDCiq1rRt+ey3zGXcc8=;
        b=P1Cutx8I98DNLIv9TJL9Wbjw247ySyfVJBwbWrof6GOd0nXc/OsHSRjVPyuh0HuNTk
         2YyZxYtPVCWiBzdL17MC27F/3x9Y3RdoZZNUeYVWyT0O1W1FUrHj1NJ6gi/GnyP5VAs8
         6Fcch39JPVOKBY+ybOeOcSHC6coHxOqRlUGI8v0WDEySMTc12Xp2dcNa8UsZl8k+8HyM
         ziSWfhfD6ppLXW7nhMr+gV86cr3vG+29qOzOyyZLNse8MIE3PwzHeN1LyzRJgZLlHfy9
         CZ7cUFyu7qum9GVrH0/sDRh7EFGbfSOdirfCl8tZLpl6wmXmrf5Uvn12LX2epXMGNUJF
         6tsA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222534; x=1789827334; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z5ufyWucvww0cPxhLp4Y4P0qQXejm9pZojzLX9IgS9I=;
        b=ouQIqw9y/IiQLdQ17Jc5e8grcrots2uriFKe208/sY0mrKiVTVVL18LwVAgut9C07X
         uLsuB50iuPi+mDOsmVVgRkc+gpalKkQ0ajVYSlYKbqX8+zOB9HdNSKynqVJsDhCV3IsB
         A1pvCx8GX2NREdvCONZ/3fzzX0NgomSvhao0WEnvZolUq1gjdyzYRxYbyqf2c7L/KdVH
         sFUDMhejWRbYPgagbPkGY4UAds1+AQ0LTGtjNueRd6mZ7vd+l2PEmAizs96E8eAJ/nXK
         Ckb2t3oSchPqrV7GHpXvaDeF4C6+S+5gl5nqLGnxm4+Yv0PvXv447fGsnsMYGg2F8pHQ
         IOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222534; x=1789827334;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5ufyWucvww0cPxhLp4Y4P0qQXejm9pZojzLX9IgS9I=;
        b=Qkxa87O48afhyHLwncFv5vdfmFSDUbTrx+V5larDilGufaIJG7oINx3GQhSbXEOwEF
         X6be2rS+r858FkNTcGti1JE8T4Sq03n5doLB8pEpfu6yffmTle/pJwbBqZJAWQQ9REWs
         7kLmykWt9bdPJCBCqPQPDYp1AyqOgDrJvQV/u98atGm1qWxunuSYa4bmgIMqmiDaHMmh
         mYfL0NS+4DSedtbEylqE9aFYGhaKy/gYGKh8ky56GmV0EjsB9c/dKGFq/ZnoZOGqYyhr
         Ts75eBQd5i/mZQbr1Bw/Ky3G/rYdYnRK0QgbzpgSzweDyOnusXO2yHg8EpWgMQd9Z4An
         XEhA==
X-Forwarded-Encrypted: i=1; AKwUvBxjEI2xRLGw4cTptvu8Oh6GduyWiDV2wvdq7Ttohtb/2qLIfQNtd5rf3a5S+joirIRv+41P4KMpVQa4r1+MTDCa@lists.infradead.org
X-Gm-Message-State: AFuF++lWEarGAcVcGYHrzKYtXoJZBtkECJl6sAErmr+bGwZBiPgMZiyV
	KlM/FLoPb2V2cEG36xDuWu7xJJrOQ7kjDxB+Qv7AlDlppxDjmR05eMg1CbOGc+iLosf4Z4Q26Qa
	sLrfUUcBq44VXwQAH8qg4OeR2HjIqzIM=
X-Gm-Gg: AYBFou1IFzXOEd+7+9b+UG/APXgPAUATMlX18aA7gGIRFgw1vnlGfrGkth4d6x3nZRN
	Q/ptoNW1pnI5/z1t/vmaay5sHacsKF46peZyRsylWY6ppTHEWfUX48PnUH6VF7YNyHm7Vf3i4V9
	8oA8UGjVSyQl6bgViZ4hM+sePEtYpmc6ftHemCr3ngCVoFL3CejR+opEmY2jN8YxUHBrETwn6lm
	dosQYjlu7+ClVQLBb70Zn/AaULJTsHGem/X+zYycd+9vKH54U38l353+UDqeNdRVtzhtSItL2iR
	l/yvRkuBcSBGXqE8CJ4U2RukGPH5AU5RWLblgC7fcxip+zmQ6QxNJYsMFSRrrNI1C8/V8/Vs3M8
	6l55Rsp4//0yly34g9+FpD818YYqvB1uSd/mFAlk9An0=
X-Received: by 2002:a05:6102:6a92:b0:77c:6bdc:824f with SMTP id
 ada2fe7eead31-795a6c82b95mr2453657137.1.1789222534389; Sat, 12 Sep 2026
 07:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260911211559.207990-1-ehbello@gmail.com> <577c2a79-25f9-409d-be46-275821e3a2f7@rock-chips.com>
In-Reply-To: <577c2a79-25f9-409d-be46-275821e3a2f7@rock-chips.com>
From: =?UTF-8?Q?Enrique_Hern=C3=A1ndez_Bello?= <ehbello@gmail.com>
Date: Sat, 12 Sep 2026 15:14:56 +0100
X-Gm-Features: AcwNN1VzAakD72HPxt6ZZOZcKA7ZrU2_muAgwy6Cvd7dGeC7JC5VEdDo9kbd0hk
Message-ID: <CAN10OtB0VVeb_OPUzPPF3Q5oAsoK+5jsxRXp7byShJ+qDnKz+A@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: rockchip: Skip the Tpvperl wait when power is
 already valid
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: robh@kernel.org, heiko@sntech.de, dlemoal@kernel.org, 
	linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	bhelgaas@google.com, mani@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_071536_675321_652C88EF 
X-CRM114-Status: GOOD (  53.99  )
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

On Sat, 12 Sept 2026 at 02:21, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> =E5=9C=A8 2026/09/12 =E6=98=9F=E6=9C=9F=E5=85=AD 5:15, Enrique Hern=C3=A1=
ndez Bello =E5=86=99=E9=81=93:
> > Since commit c47f90be4c89 ("PCI: rockchip-host: Fix
> > rockchip_pcie_host_init_port() PERST# handling"), a JMicron JMB585
> > behind an rk3399 root port almost never becomes usable: the link trains
> > normally, but the endpoint's configuration space never answers, so the
> > device is not enumerated. On this controller a configuration read that
> > gets no usable completion is reported as an external abort rather than
> > as an all-ones response, which on arm64 brings the machine down.
> >
> > The change added an unconditional 100 ms sleep so that PERST# stays
> > asserted for at least Tpvperl after power becomes valid. The wait is
> > performed while PERST# is asserted, so it also extends the reset by
> > 100 ms, and this endpoint does not tolerate the longer assertion.
> >
> > Tpvperl is counted from the supplies becoming valid (PCIe CEM r5.1,
> > sec 2.9.2). On boards whose PCIe supplies are always-on -- vcc3v3_pcie
> > on ROCK Pi 4 is regulator-always-on and regulator-boot-on -- power has
> > been valid since boot, seconds before the driver probes, so the
> > requirement is already met and the sleep only lengthens the reset.
> >
> > Record whether the supplies were already enabled before the driver
> > enabled them, and skip the wait in that case. A supply that is already
> > on at probe was brought up either by the bootloader or by the regulator
> > core at boot, both of which precede a PCIe probe by far more than
> > Tpvperl. When the driver really does bring the rails up the full wait
> > still happens, as it does if regulator_is_enabled() cannot tell.
> >
> > The same check is repeated on resume rather than assuming that power
> > was cycled: suspend calls regulator_disable() on the 0.9V supply, which
> > only drops a reference, so on a board where that rail is always-on or
> > shared with another consumer the power stays valid across the cycle.
> >
> > Skipping the wait only when every supply is already on is strictly more
> > conservative than what this driver did for years: until the change cite=
d
> > above there was no Tpvperl wait at all, and PERST# stayed asserted only
> > for as long as the register writes in between took.
> >
> > Measured on a ROCK Pi 4C with a Radxa Penta SATA HAT (JMB585) by
> > booting repeatedly and counting how often the endpoint enumerated:
> >
> >    unmodified ....................................  0 out of 84 boots
> >    with this patch ...............................  3 out of 3 boots
> >    other ways of dropping the same wait ..........  16 out of 16 boots
> >
> > Fisher's exact test, pooling the last two rows against the first, gives
> > p =3D 4.1e-21. With the patch the endpoint enumerated on every boot and=
 all
> > four disks behind it came up.
> >
> > Each of the three PERST#-related changes that landed together in
> > v6.11-rc1 was also reverted individually; only removing this wait made
> > any difference. Moving the wait to before link training is enabled,
> > rather than removing it, did not help (0 out of 15 boots), which is
> > what identified the length of the PERST# assertion rather than any
> > interaction with link training as the cause.
> >
> > The measurements were taken on 6.18, but the code in question is
> > unchanged between v6.11 and v7.2.
> >
> > Fixes: c47f90be4c89 ("PCI: rockchip-host: Fix rockchip_pcie_host_init_p=
ort() PERST# handling")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Enrique Hern=C3=A1ndez Bello <ehbello@gmail.com>
> > ---
> > ---
> > v2:
> >   - Re-evaluate the supplies in rockchip_pcie_resume_noirq() instead of
> >     assuming that the 0.9V rail was really turned off. On a board where
> >     that rail is always-on or shared, regulator_disable() leaves it on,
> >     and forcing the wait there would reintroduce on resume exactly the
> >     failure this patch fixes. Spotted by an automated review of v1.
> >   - Factor the test into rockchip_pcie_supplies_enabled() now that it
> >     has two callers.
> >
> > v1: https://lore.kernel.org/all/20260911104952.4190994-1-ehbello@gmail.=
com/
> >
> > --- a/drivers/pci/controller/pcie-rockchip.h
> > +++ b/drivers/pci/controller/pcie-rockchip.h
> > @@ -318,6 +318,7 @@
> >       struct  regulator *vpcie1v8; /* 1.8V power supply */
> >       struct  regulator *vpcie0v9; /* 0.9V power supply */
> >       struct  gpio_desc *perst_gpio;
> > +     bool    supplies_pre_enabled;
> >       u32     lanes;
> >       u8      lanes_map;
> >       int     link_gen;
> > --- a/drivers/pci/controller/pcie-rockchip-host.c
> > +++ b/drivers/pci/controller/pcie-rockchip-host.c
> > @@ -314,7 +314,9 @@
> >       rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
> >                           PCIE_CLIENT_CONFIG);
> >
> > -     msleep(PCIE_T_PVPERL_MS);
> > +     if (!rockchip->supplies_pre_enabled)
> > +             msleep(PCIE_T_PVPERL_MS);
> > +
> >       gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
> >
> >       msleep(PCIE_RESET_CONFIG_WAIT_MS);
> > @@ -609,11 +611,33 @@
> >       return 0;
> >   }
> >
> > +/*
> > + * Tpvperl is counted from the supplies becoming valid, and the driver=
 waits
> > + * for it with PERST# asserted, so the wait also lengthens the reset p=
ulse.
> > + * Supplies that are already enabled before this driver enables them w=
ere
> > + * brought up by the bootloader or by the regulator core at boot, both=
 of
> > + * which precede this point by far more than Tpvperl, so the requireme=
nt is
> > + * already met. Treat an error from regulator_is_enabled() as "not kno=
wn to
> > + * be on" so that the caller waits.
> > + */
> > +static bool rockchip_pcie_supplies_enabled(struct rockchip_pcie *rockc=
hip)
> > +{
> > +     return (IS_ERR(rockchip->vpcie12v) ||
> > +             regulator_is_enabled(rockchip->vpcie12v) > 0) &&
> > +            (IS_ERR(rockchip->vpcie3v3) ||
> > +             regulator_is_enabled(rockchip->vpcie3v3) > 0) &&
> > +            regulator_is_enabled(rockchip->vpcie1v8) > 0 &&
> > +            regulator_is_enabled(rockchip->vpcie0v9) > 0;
> > +}
> > +
> >   static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
> >   {
> >       struct device *dev =3D rockchip->dev;
> >       int err;
> >
> > +     rockchip->supplies_pre_enabled =3D
> > +             rockchip_pcie_supplies_enabled(rockchip);
> > +
>
> If it's pre-enabled, should we still need to enable this regulator just
> for adding a refcount for it?
>

Yes, I think the regulator_enable() calls have to stay, and the patch
deliberately leaves them untouched: the new flag only records what the
Tpvperl requirement already is, it does not take over the supply's
lifetime management.

Two reasons.

1) Without a reference the regulator core can switch the rail off
   underneath us. regulator_late_cleanup() disables, at late_initcall,
   every regulator that is not always_on, whose status it is allowed to
   change, and whose use_count is zero:

        if (c && c->always_on)
                return 0;
        if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_STATUS))
                return 0;
        regulator_lock(rdev);
        if (rdev->use_count)
                goto unlock;
        /* If reading the status failed, assume that it's off. */
        if (_regulator_is_enabled(rdev) <=3D 0)
                goto unlock;
        if (have_full_constraints()) {
                rdev_info(rdev, "disabling\n");
                ret =3D _regulator_do_disable(rdev);

   have_full_constraints() is true for any populated device tree, so
   this is the normal path here. A supply that the bootloader merely
   left on -- as opposed to one marked regulator-always-on, which is
   what ROCK Pi 4 happens to use -- would be turned off shortly after
   probe if this driver had not taken a reference on it.

2) The disables would become unbalanced. rockchip_pcie_suspend_noirq()
   and the probe error paths call regulator_disable(), and with no
   matching enable _regulator_disable() trips

        WARN(regulator->enable_count =3D=3D 0,
             "unbalanced disables for %s\n", rdev_get_name(rdev))

   and returns -EIO.

So the enables are about owning the supply, which is orthogonal to how
long PERST# is held. Keeping them is also what makes the change minimal:
the only behavioural difference is whether a 100 ms sleep happens inside
the PERST# assertion.

If you think it would help the next reader, I am happy to send a v3 that
notes in the comment that the enables are kept for the reference count
and are independent of the Tpvperl question.

Thanks for taking a look.

> >       if (!IS_ERR(rockchip->vpcie12v)) {
> >               err =3D regulator_enable(rockchip->vpcie12v);
> >               if (err) {
> > @@ -890,6 +914,13 @@
> >       struct rockchip_pcie *rockchip =3D dev_get_drvdata(dev);
> >       int err;
> >
> > +     /*
> > +      * Suspend calls regulator_disable() on the 0.9V supply, but on b=
oards
> > +      * where it is always-on or shared the rail does not actually dro=
p, so
> > +      * re-evaluate instead of assuming that power was cycled.
> > +      */
> > +     rockchip->supplies_pre_enabled =3D rockchip_pcie_supplies_enabled=
(rockchip);
> > +
> >       err =3D regulator_enable(rockchip->vpcie0v9);
> >       if (err) {
> >               dev_err(dev, "fail to enable vpcie0v9 regulator\n");
> >
> >
>

