Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0300CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WelUToYaunngdS4iiekhxlbrmFbbBfrAT5j9UWPzR4A=; b=GeirDg+3pcnpvgXNCK9cPEtbBI
	gYteg8Gt4rvnSrr14EqGyCNgffIdqXWa7nhyFb/nMBynPUnmIgeDzqXj4bOjhGNJjW+BuYelXpiw/
	JHnxRPpoftZG67PLVZmIIebsUFJ1viiK2yLC/JbXF+GBZD4NgSLCoLI8ggIuTXWRljVkOcn2L6DNw
	/bgV1UVIxc23nej1lQiKou6YX/ODXrnHzST+p8lKDB1iMfDShnfbl0UC0qz+gCXNJ6kxrpyTeOgMa
	SfHvN3HJX4JZSmsDkJSEAEm+Uv2Mc1/aN380Y8XWRZpWbHEfNE54sMiDD4lBJSwP1Pf485BSK6ApE
	4la6kxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWW18-000000039S4-10nI;
	Mon, 08 Jun 2026 09:11:34 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWW15-000000039RC-03Qw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:11:32 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-68c3421b009so7275139a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 02:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780909889; cv=none;
        d=google.com; s=arc-20240605;
        b=iLYSXV6+eghnCcQ+N+v8SN8OyU5OhZ67csR77wW/2kFjL8OJr710JxDg2OoozJD9WP
         krOJbgXGuAcAlKs8o3Q34d1Y0/XBkFc721a66x/5gzAWQE1E5yoameeuVBMhRpYxb4pL
         dxj6LT/BCpCQiPoQDPmpBmxx+0wW1qKXyE6VYujkWmR86Utn+yD1eovtTDoTFy8oCzdr
         UcFfSaUYWZ0kV+HpK5ZUPp+V9CFVjdT/ORI56/8eZm3FZYo/HULLK0xpt85qxEWtsKy/
         9c+OKUa4iCLBjEkrMDuqggdJc8xV4DlEw8zEtaIu6zXgxTezN46+FMEMVdQCO5oQU+sf
         vk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WelUToYaunngdS4iiekhxlbrmFbbBfrAT5j9UWPzR4A=;
        fh=AIoh7s2Jbk5IFip76ktKi5MIqpHM6E3U+eAOYYeV9qI=;
        b=ggR1U3s+CGt3/uLXmWHZiny5aBdyoTpwkXEMOrHADGvBohy94Vr6dtQkcLufSs+b9v
         7eVh8Dl9JvbcoPeID4pAOGS08nLC1ICWL37yT5KaTPrA+yq2281nLuOwMqFMRjyxMAbz
         7E9kmfaSUarsb4xfBQ0o2YvfFGNM8vT8e6PFwhTjYGb/x3chye1M4yfpFe2P2Qiui0A4
         bM7EjyYwaUnFrmBNQARAxuv279XeiK+tRrwEGPY///sdu772Av57yfFxjcPRil1NI9pp
         My3ZzDLgF+7GtBVgTXVwVx5PLgYMY0WQk/L6zSfc4VRgF1yzwIz95rSTgfJ0HG7x7qni
         pWpA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780909889; x=1781514689; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WelUToYaunngdS4iiekhxlbrmFbbBfrAT5j9UWPzR4A=;
        b=RcuXsiBDWA8lUMHZvwQprkF8L75do0Od1qeqa8orKV1Gdo761CfoCVjblJ5UVv6cfi
         tfc3+R9SrIXO+BkQ+DHCxCuULTt3/Yw71b54GObTCf50oUO9UwckzuBzIzNXkt2e/ezz
         QnSzxuKuQAXlWDDSKciqtpWn814F9kQzlZhIumVxJbQLLIsF8eSch38CS6v/r+OGXpzl
         eCf6+x7iD1HXCtMSMXLjJMpIq4/PTeXb/0IrQb5yuNJiGmrgXCrt64LUWI9PoaxhB9/6
         vFY0Zrc6EIEodE2luXn7lQ6mef/24QS1uOXXFOZlpcM/TwoKnHGQ1vsvNhSnmwLEVaYa
         aB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780909889; x=1781514689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WelUToYaunngdS4iiekhxlbrmFbbBfrAT5j9UWPzR4A=;
        b=UdH1jh62DJPKn0GrGuwl/YERpTak2sNrXOIAk/A3vgnjmZJe3gManjvMX3f1fGcGKn
         TX3UuazHomdR0+d0FRPTaoUB3MEImQmKJGG8on5dyv4K6aEVdL+bvedkTxWDlUU8PJJP
         nw4lqeD0tbXRW2Pom8+qJy+Ab1U7DeHN5xYPuWj6CAWNAKARvrMDHuBZkQCRLf+Osp/S
         /XLWcF8V22LlT7BB9bcKSrgzGaHm0ePjCCrNbqDmOi7B9PFTUFU++bAihjf/jv6a+tm7
         9kSCDqDSSk73wxR9WphCVSCyCXWSdhih6im8cD3H/Ie6Rt2g9+CHuL55KZ0XLrSbv3nu
         i0Hg==
X-Forwarded-Encrypted: i=1; AFNElJ+7tyIYk8gDNkDZezlWXd3uV5mYfFLIe/bA8EQZnGxTL1cKfQJtTfI7wFrKU2sIqbLkwlDJ4BZqmRd7UT9A6JtM@lists.infradead.org
X-Gm-Message-State: AOJu0YwAUVDyY1XnmDb6BRZTmJ4cor+V89g2U65gyqd/RWdoHf4KaIkl
	zXKcz72iD1iUdZDWPHbNCE2nj24nwiZtXb2W/Wh+ChxLq7QqL52iMuaeLfe02akG5YlSITnWW7d
	KGt2heUv2KOtCfWWICKaxjn+f1GdO+sk=
X-Gm-Gg: Acq92OH1LQcxpdwjF4ug8YCUMhRY+1pA6gpo8gQvw5qEll7nYxo1BnTk1ZfCoWgOqZB
	rNz4yP/qL+TSyYVyBXt6hTlM2X4GQ100k8Rw0CQ00g34yjrpg8G7fH6BNwC39ZsTIneVbV4ZUiV
	/LLjgoUYqZp5SzhsXk9dudAhWAjQjtLGMbIUvKF5d9LVE2QnfjPlCQfuKRztSV91+Yzwf5VTCAl
	j7nna+xR34y30u4o372DClwTdoy2ogCcTfUDYYxqVCOClO3AR+55IImxENR5KBBzFb1F8M5h75Q
	MW+D52gTekSz12/qLA==
X-Received: by 2002:a17:907:2d12:b0:beb:2980:e2d2 with SMTP id
 a640c23a62f3a-bf3a6b13b16mr580109766b.8.1780909888634; Mon, 08 Jun 2026
 02:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260604135255.62682-1-midgy971@gmail.com> <3d99569e-9c3a-49d1-93fb-1335382523e9@rock-chips.com>
 <CA+GS1Y1s78PwN63X2YJoS8VEGp7CpTERo_K65yKs00U4VRAw4Q@mail.gmail.com>
 <e5058919-9485-4de5-8eea-331ebfc2987c@rock-chips.com> <CA+GS1Y3ysdWZ3qCq3ip_Pbw+v4LxHZd95aBo=jwB+orYaMBBNw@mail.gmail.com>
In-Reply-To: <CA+GS1Y3ysdWZ3qCq3ip_Pbw+v4LxHZd95aBo=jwB+orYaMBBNw@mail.gmail.com>
From: Midgy Balon <midgy971@gmail.com>
Date: Mon, 8 Jun 2026 11:14:17 +0200
X-Gm-Features: AVVi8CefQKT7ky3Sqeq6MkiJ04hcvCvZiupw30w_yNvYYxCVtDBxVUNhbRaFSOk
Message-ID: <CA+GS1Y0kAM_XGLQuKPTphif2HcQg18ZXhd8RHHr2xPOEMCDvXA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260608_021131_101335_ABE9F5F4 
X-CRM114-Status: GOOD (  50.28  )
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

Following up on the need_regulator suggestion -- I implemented and
tested it on the
board, and unfortunately it doesn't avoid the deadlock on RK3568; it
moves it from
boot to the NPU job submit.

What I did: gave the RK3568 NPU power domain a regulator (a DOMAIN_M_R
variant with
need_regulator =3D true), wired domain-supply =3D <&vdd_npu>, and dropped t=
he
regulator-always-on workaround.

Boot is now clean and the NPU probes, but there is a warning during boot:

  rockchip-pm-domain ...: Failed to create device link (0x180) with supplie=
r
  0-0020 for .../power-domain@6

(0-0020 is the rk809 PMIC that supplies vdd_npu.) Then on the first NPU job
submit the board hard-hangs with an RCU stall:

  rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
  rcu:     3-...!: (1 GPs behind) ...
  rcu: rcu_preempt kthread starved for 5115 jiffies! ... RCU_GP_WAIT_FQS(5)
  rcu: Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expe=
cted

My reading: vdd_npu is on the rk809 *I2C* PMIC, so when genpd
enables/disables the
regulator during the NPU's runtime-PM power transition, the I2C
transfer runs in a
context that starves RCU and the box freezes. (I suspect
need_regulator is fine on
the RK3588 NPU because its supply isn't behind an I2C PMIC.) The always-on
workaround avoids this precisely because genpd never touches the I2C
regulator in
that path.

So: for an NPU domain whose supply is an I2C PMIC, is there a
supported way to let
genpd own the regulator without performing the I2C op in the
power-transition path
(a deferred/async regulator enable, or a flag), or should RK3568 keep vdd_n=
pu as
regulator-always-on? For v4 I'll keep always-on unless there's a cleaner pa=
th.


Thanks,
Midgy

Le lun. 8 juin 2026 =C3=A0 10:05, Midgy Balon <midgy971@gmail.com> a =C3=A9=
crit :
>
> Hello Chaoyi,
>
> Thanks -- this is exactly what I needed.
>
> - v2/DTE: will do. I'll keep building on Simon's per-device-ops series --=
 with
>   that in place the NPU MMU can use the 32-bit-DTE ops (the per-ops GFP_D=
MA32
>   that's already in mainline) without the global rk_ops conflict. I'll
> keep it as
>   a stated dependency of the v4 cover letter.
>
> - vdd_npu:  I'll switch the RK3568 NPU
>   power domain to need_regulator + domain-supply =3D <&vdd_npu> and drop =
the
>   regulator-always-on workaround. I suspect that's also the right fix for=
 the
>   power-off/on de-idle issue I described -- the always-on was really
> just papering
>   over the domain not being modelled with a regulator. I'll confirm on
> the board.
>
> - AUTO_GATING: thanks for the commit references -- I'll keep the bit-31
>   read-modify-write form with your Suggested-by and write the comment
> from those.
>   For the record: on v7.1-rc6 the NPU MMU also completes translations
> on the reset
>   value (I couldn't reproduce a page-walk stall without the write), so I'=
ll note
>   in the commit that it matches the vendor clock-gating handling rather t=
han
>   fixing a failure I can reproduce here -- happy to drop it if the iommu
>   maintainers would prefer.
>
> - PVTPLL/NoC: I'll follow up with Finley. First I'll check whether the
>   need_regulator change resolves the NoC re-power de-idle on its own;
> if it still
>   I'll bring him the details (the genpd power-on de-idle ack and the
>   BUS_IDLE_ST state).
>
> I'll send a v4 with these. Thanks again for the quick, detailed answers.
>
> Kind regards,
> Midgy
>
> Le lun. 8 juin 2026 =C3=A0 03:40, Chaoyi Chen <chaoyi.chen@rock-chips.com=
> a =C3=A9crit :
> >
> > Hi Midgy,
> >
> > On 6/8/2026 5:03 AM, Midgy Balon wrote:
> > > Hi Chaoyi,
> > >
> > > Thanks a lot for looking at this -- input from Rockchip is exactly wh=
at this
> > > series needs.
> > >
> > >> Hmmm. If I understand correctly, the NPU IOMMU should be v2 rather t=
han v1,
> > >> implying it should support 40-bit PAs. Nevertheless, please note tha=
t the
> > >> upper limit for DTE is 32 bits.
> > >
> > > Understood, and that 32-bit-DTE note is the crux of the trouble I had=
, so let
> > > me lay out what I see and ask how you'd prefer to solve it.
> > >
> > > The mainline node is already v2 (rockchip,rk3568-iommu in rk356x-base=
.dtsi).
> > > The problem on this 8 GiB board: with the v2 ops the page-table alloc=
ations
> > > (gfp_flags =3D=3D 0) can land above 4 GiB, so the DTE ends up > 32 bi=
ts and the
> > > NPU's first translation faults with DMA_READ_ERROR. To work around th=
at I had
> > > switched the NPU MMU to the v1 compatible (rockchip,iommu), whose ops=
 set
> > > GFP_DMA32 and keep the DTE sub-4 GiB. That works in isolation, but be=
cause the
> > > driver keeps a single global rk_ops, a v1 NPU MMU then trips
> > > WARN_ON(rk_ops !=3D ops) against the SoC's v2 instances (VOP/VDEC), w=
hich is why
> > > I based the series on Simon's per-device-ops work.
> > >
> > > So my question: with per-device ops in place, what's the intended way=
 to keep
> > > the NPU MMU on v2 *and* cap its DTE at 32 bits on boards with >4 GiB =
of RAM?
> > > A v2 ops variant carrying GFP_DMA32 for this device, or is there a re=
gister/
> > > config bit that constrains the DTE address? I'd rather follow the Roc=
kchip
> > > intent here than carry the v1 workaround. (Simon, cc'd -- this is rig=
ht next to
> > > your per-device-ops series.)
> > >
> >
> > If Simon's method works, please use it :)
> >
> > >> Can these operations not be completed via the pmdomain driver?
> > >> If some operations are controlled by TF-A, are you using open source=
 TF-A?
> > >
> > > Most of it is in pmdomain already. Power-on and NoC de-idle are done =
by the
> > > RK3568 NPU power domain (genpd) at power-on -- the driver no longer p=
okes the
> > > PMU directly. Two things remain outside it:
> > >
> > >  - vdd_npu: I mark it regulator-always-on in DT rather than wiring it=
 as the
> > >    domain's domain-supply, because as a domain-supply it created a de=
vice-link
> > >    to the I2C PMIC (rk809) and genpd's power-off QoS-save path then h=
ung
> > >    reading the NPU QoS registers behind the (gated) NoC. If there's a=
 clean way
> > >    to let genpd own vdd_npu without that I2C ordering deadlock I'd mu=
ch prefer
> > >    that -- pointers welcome.
> > >
> >
> > Please refer to the patch below regarding the RK3588 NPU pmdomain.
> > In short, you need to set a "need_regulator" for the RK3568 NPU pmdomai=
n.
> >
> > https://lore.kernel.org/all/20251216055247.13150-1-rmxpzlb@gmail.com/
> >
> > >  - the NPU compute clock (PVTPLL): set from the driver via SCMI, and =
only
> > >    needed for actual compute, not for bring-up.
> > >
> > > One more pmdomain observation from testing, possibly relevant to how =
the NPU
> > > domain should be modelled: the domain's power-off/on cycle doesn't re=
liably
> > > re-de-idle the NoC. If the NPU is probed after genpd has already powe=
red the
> > > (unused) domain off, the power-on de-idle fails ("failed to set idle =
on domain
> > > 'npu'") and the NPU IOMMU then takes an external abort on its first M=
MIO access.
> > > Probing the NPU before the unused-domain power-off, or marking the do=
main
> > > always-on, both avoid it. Is the NoC de-idle expected to work on a ge=
npd
> > > re-power here, or should this domain effectively stay on?
> > >
> >
> > Not quite sure what's going on with PVTPLL and NOC.
> > Maybe @Finley knows about this?
> >
> > > On TF-A: yes -- bl31 is built from upstream arm-trusted-firmware
> > > (github.com/ARM-software/arm-trusted-firmware, RK3568 platform), prov=
iding PSCI
> > > and the SCMI clock service. The only closed blob in the boot chain is=
 Rockchip's
> > > DDR init (rkbin), which is the standard situation for mainline RK356x=
.
> >
> > --
> > Best,
> > Chaoyi

