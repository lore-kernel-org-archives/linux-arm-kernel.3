Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C267CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLq1D7uP5MxHvai6FqrEhNmJ5qKAoR2b/ce+Jxe1kds=; b=LzF11y+eaEr2HG43ATVgkIm7hk
	CvBNBJ7Pd0UzWsq+Ld+0PCl9/9zvf3md342mpPAIUVbzxlradDk9MVed0lZRP7VdTVRJ8EFjAFxyG
	ZNKyV5i7SdYZuZvb0p6ZzDPwBewXDBWoAFy4BnzKpIR0HvrXbMQnUEt9xEERK40H682xiIvFgoRo9
	bildI9nSdUkmQU5DSYzQhDH9YSOEqGvpw3AaKovM/t8ujFIVsMes02/o3I9cCwjTug210HzMXj6Im
	k9ine4S4WbEOUhumDngnEUF6wmELaYUEQBj+GlFqgY2HDDMBcZKt/Xzmbjd83+9ug9aTBg/ZVRG01
	wvFlcndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUwd-000000031vw-00ls;
	Mon, 08 Jun 2026 08:02:51 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUwZ-000000031ug-2BmU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 08:02:49 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-68bac6e24fdso5351912a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 01:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780905765; cv=none;
        d=google.com; s=arc-20240605;
        b=Pnd50VL4rDPgTa+IFowLLlvugVhU3V4q0xWFDr8a4Eb+p8P07yKq8+1Uf1c1bEATac
         gFKBZh9LiEepB/gz8mTolz+LRjuph/MWsEFGwxPDwmQB6OtSkmME0Hto8XCoMJRhBhbx
         1zJW+pZPSrpn7xFaHtuwRZ0OlzZpSKUZbEzuY3R5tVot+FOiikiq3VvkcApbOCabDGcr
         oNhxCdpHIwQDgxdJYAgTz07c/X3p0MigAsqmFbHtxkBAtdK2LHjG6JaDA6bcIjBTCp0z
         iectuc/7zQqHJi0004F+IX3zMe9MrjCvZ8bYrhHYm8Pn/V7LDh/+7sP+0vECcW1VFa15
         CIzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bLq1D7uP5MxHvai6FqrEhNmJ5qKAoR2b/ce+Jxe1kds=;
        fh=UI46pMVbs9WVxPDWa4RSVqEZcTnLoLASjwb+io4aPQ0=;
        b=DSSZGu4at1gNyqr5SasbPRId+JW6BMRncuhnWg/H95v304fexe9DNWLDU3dYQhoa3C
         cLDKKCNDnq+ZjdDxR0qLBVBB7yP2ptX/fOYk78zjLr88PHbxQnvmUZ9/Xl9ILmgO2PRT
         Z5PFnqrykLu2f1pK+8nT3h7kHj8ow2M7r4MLUzL0+Tccu8w5sfxgLVxCpPrgft/2LmRK
         HMA8Fhidy+MUD51LWeT21aZlvJCdHe9TMgHRttQkeLUaiL+MPyG9IcC+H/7bGgGdR4jl
         X0aQsKlL33FEXpa9XdW6is4/n+7bnhb3sARK7GvA+eXsZnsJU/531W7t00Wp/DG8Dhzv
         Qeyw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780905765; x=1781510565; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLq1D7uP5MxHvai6FqrEhNmJ5qKAoR2b/ce+Jxe1kds=;
        b=I4obooXRjadVsVD8DtvILypmY1WqHk4JGE8R+6+sCPC9tgqTE0UofOv/DPugvtYUXW
         AzWiBz3e6KldibjOfmn/jdkqn1w7KHBE+pvOvecNnW2ZeifCS825JNosx9XzuFnBH25n
         M5SdK5YWl6GGVUoYTVB5wlNXexr/6UOm7WwxgJSWwi97EIdAHctQRH6Rt7Z/UmIkNlhV
         gxFDUrTuOn9yUvBxmbPCXCBeS+FmYZRErNT0fMEkYM0brhVb3nHjurZiD0udUH4hLXkY
         p/7iqYnw1ao5BHd/DPZ2v/C/4UJNnckwg6NMF2+Df1IBF4w57S+ITuTT/JisAw36A5oG
         JRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780905765; x=1781510565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLq1D7uP5MxHvai6FqrEhNmJ5qKAoR2b/ce+Jxe1kds=;
        b=H/wZnIGrvPBSXtnStuExSYGicBRU2kL41hva/FsHzWfSC7uLW7yC5bNihbTSqza7X7
         G+mUKcl1K/+INK/pR3d6stR6HDkOqMdy1HQGwcshUHDi+I1kVzBnYX5Of2UZhXWz32td
         LEzuYRRL7iIYvT20N8rP0TUOyzjfVQi1t/PfYzPHDyzU0lCNFWxWv3JF6r1m+yaQ5wyp
         DpC/vDmgg61XfRJ0R9SE/DsWqW10k9woFCxwY4je2T60DHqv2cMmxiJs8Faklo6Z3nSx
         QugB0RHsfWFEfPQhn0Eon8z/1g5XhleEc5coKZ9JBEU3KFyNqVxNuEwNLz16c8vTneSn
         4wkg==
X-Forwarded-Encrypted: i=1; AFNElJ8OTEBgR7F15recON2ZC0d1qRctfaqxwSl+RKP6G2XYkWw6iu/vav+S/VrDWR2FXBggTqVb1i1Dn8HZkZXgdpjP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfl1EP2o7+FdyNl1IJ3RJPTwc30F35FCWSvhJ8ys0VPXGpoKDN
	UAok01LAHYwXDI2vawmtmSFwPXBtnPpCK1s9EeyOZyIq4fkbBQk3a0oF2GheNHb/Nk8RPb0mq2b
	wHUjnjzflVIj2jYBxptY7f8tlfJluauM=
X-Gm-Gg: Acq92OFyDlB9GVp/9TJkeGpph2aB6HOI8UW0vIAVRrXmnLF+xvrLPxw281tUNRj5APp
	flKN1MCDfeHgAoiP51HL98dEmFQcn8YhwqpliTHXPbtoy4u/8ioReI1UQYFfX+TWR2S6UYiRcSY
	SZxi6iGSo4dqWipfu1e20JMG/y21AT866xxr2MLt7LoKqsj7u1SAjLsro43hefbJA+8L9+ObM8Z
	dW/ewFUfhYms8WZ3078bUxpkfu3X2mcQIPdK8Z6LjTVK/l+S/T84m9/1DFx9JagrK4OiEPRN4aM
	rf4na6wZpnTiCVdsNg==
X-Received: by 2002:a17:906:8a46:b0:bec:4b96:5fb9 with SMTP id
 a640c23a62f3a-bf3701806dcmr422529166b.3.1780905765057; Mon, 08 Jun 2026
 01:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260604135255.62682-1-midgy971@gmail.com> <3d99569e-9c3a-49d1-93fb-1335382523e9@rock-chips.com>
 <CA+GS1Y1s78PwN63X2YJoS8VEGp7CpTERo_K65yKs00U4VRAw4Q@mail.gmail.com> <e5058919-9485-4de5-8eea-331ebfc2987c@rock-chips.com>
In-Reply-To: <e5058919-9485-4de5-8eea-331ebfc2987c@rock-chips.com>
From: Midgy Balon <midgy971@gmail.com>
Date: Mon, 8 Jun 2026 10:05:33 +0200
X-Gm-Features: AVVi8Cc-kS2uobepJQqeen5fwApM6uunQz9mBN_BXk5X1LlYp7Vi43yabrw2ZY0
Message-ID: <CA+GS1Y3ysdWZ3qCq3ip_Pbw+v4LxHZd95aBo=jwB+orYaMBBNw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/9] accel: rocket: Add RK3568 NPU support
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: tomeu@tomeuvizoso.net, ogabbay@kernel.org, heiko@sntech.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Simon Xue <xxm@rock-chips.com>, 
	Finley Xiao <finley.xiao@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_010247_602373_976B70E0 
X-CRM114-Status: GOOD (  44.05  )
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

Hello Chaoyi,

Thanks -- this is exactly what I needed.

- v2/DTE: will do. I'll keep building on Simon's per-device-ops series -- w=
ith
  that in place the NPU MMU can use the 32-bit-DTE ops (the per-ops GFP_DMA=
32
  that's already in mainline) without the global rk_ops conflict. I'll
keep it as
  a stated dependency of the v4 cover letter.

- vdd_npu:  I'll switch the RK3568 NPU
  power domain to need_regulator + domain-supply =3D <&vdd_npu> and drop th=
e
  regulator-always-on workaround. I suspect that's also the right fix for t=
he
  power-off/on de-idle issue I described -- the always-on was really
just papering
  over the domain not being modelled with a regulator. I'll confirm on
the board.

- AUTO_GATING: thanks for the commit references -- I'll keep the bit-31
  read-modify-write form with your Suggested-by and write the comment
from those.
  For the record: on v7.1-rc6 the NPU MMU also completes translations
on the reset
  value (I couldn't reproduce a page-walk stall without the write), so I'll=
 note
  in the commit that it matches the vendor clock-gating handling rather tha=
n
  fixing a failure I can reproduce here -- happy to drop it if the iommu
  maintainers would prefer.

- PVTPLL/NoC: I'll follow up with Finley. First I'll check whether the
  need_regulator change resolves the NoC re-power de-idle on its own;
if it still
  I'll bring him the details (the genpd power-on de-idle ack and the
  BUS_IDLE_ST state).

I'll send a v4 with these. Thanks again for the quick, detailed answers.

Kind regards,
Midgy

Le lun. 8 juin 2026 =C3=A0 03:40, Chaoyi Chen <chaoyi.chen@rock-chips.com> =
a =C3=A9crit :
>
> Hi Midgy,
>
> On 6/8/2026 5:03 AM, Midgy Balon wrote:
> > Hi Chaoyi,
> >
> > Thanks a lot for looking at this -- input from Rockchip is exactly what=
 this
> > series needs.
> >
> >> Hmmm. If I understand correctly, the NPU IOMMU should be v2 rather tha=
n v1,
> >> implying it should support 40-bit PAs. Nevertheless, please note that =
the
> >> upper limit for DTE is 32 bits.
> >
> > Understood, and that 32-bit-DTE note is the crux of the trouble I had, =
so let
> > me lay out what I see and ask how you'd prefer to solve it.
> >
> > The mainline node is already v2 (rockchip,rk3568-iommu in rk356x-base.d=
tsi).
> > The problem on this 8 GiB board: with the v2 ops the page-table allocat=
ions
> > (gfp_flags =3D=3D 0) can land above 4 GiB, so the DTE ends up > 32 bits=
 and the
> > NPU's first translation faults with DMA_READ_ERROR. To work around that=
 I had
> > switched the NPU MMU to the v1 compatible (rockchip,iommu), whose ops s=
et
> > GFP_DMA32 and keep the DTE sub-4 GiB. That works in isolation, but beca=
use the
> > driver keeps a single global rk_ops, a v1 NPU MMU then trips
> > WARN_ON(rk_ops !=3D ops) against the SoC's v2 instances (VOP/VDEC), whi=
ch is why
> > I based the series on Simon's per-device-ops work.
> >
> > So my question: with per-device ops in place, what's the intended way t=
o keep
> > the NPU MMU on v2 *and* cap its DTE at 32 bits on boards with >4 GiB of=
 RAM?
> > A v2 ops variant carrying GFP_DMA32 for this device, or is there a regi=
ster/
> > config bit that constrains the DTE address? I'd rather follow the Rockc=
hip
> > intent here than carry the v1 workaround. (Simon, cc'd -- this is right=
 next to
> > your per-device-ops series.)
> >
>
> If Simon's method works, please use it :)
>
> >> Can these operations not be completed via the pmdomain driver?
> >> If some operations are controlled by TF-A, are you using open source T=
F-A?
> >
> > Most of it is in pmdomain already. Power-on and NoC de-idle are done by=
 the
> > RK3568 NPU power domain (genpd) at power-on -- the driver no longer pok=
es the
> > PMU directly. Two things remain outside it:
> >
> >  - vdd_npu: I mark it regulator-always-on in DT rather than wiring it a=
s the
> >    domain's domain-supply, because as a domain-supply it created a devi=
ce-link
> >    to the I2C PMIC (rk809) and genpd's power-off QoS-save path then hun=
g
> >    reading the NPU QoS registers behind the (gated) NoC. If there's a c=
lean way
> >    to let genpd own vdd_npu without that I2C ordering deadlock I'd much=
 prefer
> >    that -- pointers welcome.
> >
>
> Please refer to the patch below regarding the RK3588 NPU pmdomain.
> In short, you need to set a "need_regulator" for the RK3568 NPU pmdomain.
>
> https://lore.kernel.org/all/20251216055247.13150-1-rmxpzlb@gmail.com/
>
> >  - the NPU compute clock (PVTPLL): set from the driver via SCMI, and on=
ly
> >    needed for actual compute, not for bring-up.
> >
> > One more pmdomain observation from testing, possibly relevant to how th=
e NPU
> > domain should be modelled: the domain's power-off/on cycle doesn't reli=
ably
> > re-de-idle the NoC. If the NPU is probed after genpd has already powere=
d the
> > (unused) domain off, the power-on de-idle fails ("failed to set idle on=
 domain
> > 'npu'") and the NPU IOMMU then takes an external abort on its first MMI=
O access.
> > Probing the NPU before the unused-domain power-off, or marking the doma=
in
> > always-on, both avoid it. Is the NoC de-idle expected to work on a genp=
d
> > re-power here, or should this domain effectively stay on?
> >
>
> Not quite sure what's going on with PVTPLL and NOC.
> Maybe @Finley knows about this?
>
> > On TF-A: yes -- bl31 is built from upstream arm-trusted-firmware
> > (github.com/ARM-software/arm-trusted-firmware, RK3568 platform), provid=
ing PSCI
> > and the SCMI clock service. The only closed blob in the boot chain is R=
ockchip's
> > DDR init (rkbin), which is the standard situation for mainline RK356x.
>
> --
> Best,
> Chaoyi

