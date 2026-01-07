Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6A2CF6C1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUQ2FZFamqfueQvHyQVTRqAwPzH7oh4++3k/htlzBQE=; b=mtVSIzbxHLodrQBxVlqeXbj1so
	O9EqkKA4WyLtkPr+FqNwXtrVSDi2kV/ntPQoFL6RKXtlySDnLpzzsPFKEyLg49udR61SFLh9yn187
	L0xApQDMSI1lDQ9ThTECAMx+agWkEtsfDh/Kn9uxf/oJ951hQO8T1TY1m9mvYztexUFTNsvazYjE/
	TsmyTLA07WkSZBQKw5py5B5hNanYHkkJ2kQSAtXOPO8ETXRSrlryeAM0T2wZPKi9ztAkPcP8ix8cE
	/tRAvye7W7Ts2JOYhNOloNfc/1NgxT1qKdH63lXRtS0XAoQDOvqzr3KZFBdtITjVDDENOVNajikeb
	s5qoR0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPpZ-0000000EWdI-2JMi;
	Wed, 07 Jan 2026 09:27:53 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPpW-0000000EWcv-3pA2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:27:52 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so2963474a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 01:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767778069; x=1768382869; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUQ2FZFamqfueQvHyQVTRqAwPzH7oh4++3k/htlzBQE=;
        b=BdjD5JiuGYO9Ul1qsCYHzBWsgS5LFDpC96ttRNtj5AqMS8axiMAkk9vjwQKe/DoHk6
         +p7jDQb0pocZOrpT4b6zjz9fkP/531igDmORjxW47pkFM+F1bJyyPSbOLBKtRLJgENqS
         HlaS9x2LwrvauUxYh61FxcWRDv/eauHCVSBLOzUur/6YrvhU9xN5mKZtxaHTzVqM5tx5
         574DWZPNptWYkadwRTSpbaBuClTZnCVt50vy4HkmMPmkTlqkXrxLdB5ftXNxezrVK1Ug
         fCgR9X+jRa9Yi0WBv3o1s5yW13WNRz0CxVl7s4UeFCGPC1bfOdlgn3GUQKmGrqWX1PTR
         6AhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767778069; x=1768382869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rUQ2FZFamqfueQvHyQVTRqAwPzH7oh4++3k/htlzBQE=;
        b=sUYJuMOJUHejWvfdzADvrSs+PYOvYiLD0RvSfFF6V44I52/ftjd+FH5gRUKDx1B3Su
         scQw8jWjulaDR5bxrGfvrGjR4zpZItFH8GHMI2XUV5BQZ447X+8aUACbHHHNR7GujvP0
         s3MHVziRYneLnFqYRiV8CteJZhbWl8Gf5nJHTf5+8d29ahCe42+k/PpeXcpL87OU1Fc6
         TM4Rci5ZWZ6F1cUJYzuzcdJWgYQ3v4qwz1Gr7RhbydCwEnVhwjs+Kezu8fk629UPbIkG
         jzCohBFdDUG9+DDR2cmyoeczmafZRu9TLN6J5zpaATOj8QR2VhiOkqylwAYbIcJNZ37R
         lZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCXZIWq8YbUIzJM1Cb4GZ15Kay3FJvRrGeqJgtw7lcJHeb36XN8K/cC0LqMGlNsiqCFLLZUx+sc85Assze9bbHoB@lists.infradead.org
X-Gm-Message-State: AOJu0YzktQxI7X5x+80XsbW9oNQhLnNz9NR15687dlPf2ZKUQ9mYL7gY
	uwQXtSSTQaoNFUSSf0siDJCS/sRl+bts0hS6XjyWWMMnoaM+fRsLF/erPv8NqVSTY/q5y+j/G+3
	yNjgla0Hh/NNrFCB4rA0PKrZf3DliX9htiw5znPxI8Q==
X-Gm-Gg: AY/fxX5YbVsbckJoAkTextUMk5kq7gW5kMKh5CfqWm7glvAm0ikM2m3ghwj5/iAcpW8
	ty5GVou/XC+zajLKte/OmkV48CVVf5UlaS41cI8w7fAOgpIV9XbAQiudyw8vx1TVHt88HRHDL+M
	PYtVBNTluWCNBJT9U8sw/DsmpsLrXXn+86WwkQYLav20KYoOhXUVFORdnQxOWN6H+aJ0pUcbVWR
	zvAp1YcQSBS68gC9v5IatKn4PiLMyHG8gGeymkupA5krMWYMFRhJCzrbwDyrj7Z4WzXyK9p
X-Google-Smtp-Source: AGHT+IHiv/XFqOWBUi/CNmLl6EwV4ivEMM/garbS3U0jXJNjchmOMi1m/XfEc/owU/7EasgEeZaY3c7VeTK0LzQnHO8=
X-Received: by 2002:a05:6402:4309:b0:64d:65d:2315 with SMTP id
 4fb4d7f45d1cf-65097e8e3b3mr1716117a12.30.1767778068941; Wed, 07 Jan 2026
 01:27:48 -0800 (PST)
MIME-Version: 1.0
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
 <20251222-automatic-clocks-v7-3-fec86fa89874@linaro.org> <39019203631fdd183fb5ddaa7fada5da5f2a31ad.camel@linaro.org>
In-Reply-To: <39019203631fdd183fb5ddaa7fada5da5f2a31ad.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 7 Jan 2026 09:27:37 +0000
X-Gm-Features: AQt7F2q63jqr_CpXwSvIXdsTqXahUYQlfSvLBPEss-eRzMgkwuCaYjXxjzncKeY
Message-ID: <CADrjBPpZY9QfX7YEfM2tkAkt5qGpzYuJ0JkLMK0v4jujO3mRhQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_012750_996707_E807EEDB 
X-CRM114-Status: GOOD (  29.44  )
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

Hi Andr=C3=A9,

On Wed, 7 Jan 2026 at 07:22, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi,
>
> On Mon, 2025-12-22 at 10:22 +0000, Peter Griffin wrote:
> > Update exynos_arm64_init_clocks() so that it enables the automatic cloc=
k
> > mode bits in the CMU option register if the auto_clock_gate flag and
> > option_offset fields are set for the CMU. To ensure compatibility with
> > older DTs (that specified an incorrect CMU reg size), detect this and
> > fallback to manual clock gate mode as the auto clock mode feature depen=
ds
> > on registers in this area.
> >
> > The CMU option register bits are global and effect every clock componen=
t in
> > the CMU, as such clearing the GATE_ENABLE_HWACG bit and setting GATE_MA=
NUAL
> > bit on every gate register is only required if auto_clock_gate is false=
.
> >
> > Additionally if auto_clock_gate is enabled the dynamic root clock gatin=
g
> > and memclk registers will be configured in the corresponding CMUs sysre=
g
> > bank. These registers are exposed via syscon, so the register
> > samsung_clk_save/restore paths are updated to also take a regmap.
>
> The implementation described in this paragraph this causes pm-runtime to
> stop working for the CMU if auto clock gating is enabled.
>
> See below.
>
> > [...]
> > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> > index c149ca6c221725195faeb76b0d73374c3b48261b..06ea5deef4ee2ffb87dcd14=
102561886ea80b7bc 100644
> > --- a/drivers/clk/samsung/clk.c
> > +++ b/drivers/clk/samsung/clk.c
> > [...]
> > @@ -357,6 +489,37 @@ void __init samsung_cmu_register_clocks(struct sam=
sung_clk_provider *ctx,
> >               samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_=
clks);
> >  }
> >
> > +/* Each bit enable/disables DRCG of a bus component */
> > +#define DRCG_EN_MSK  GENMASK(31, 0)
> > +#define MEMCLK_EN    BIT(0)
> > +
> > +/* Enable Dynamic Root Clock Gating (DRCG) of bus components */
> > +void samsung_en_dyn_root_clk_gating(struct device_node *np,
> > +                                 struct samsung_clk_provider *ctx,
> > +                                 const struct samsung_cmu_info *cmu)
> > +{
> > +     if (!ctx->auto_clock_gate)
> > +             return;
> > +
> > +     ctx->sysreg =3D syscon_regmap_lookup_by_phandle(np, "samsung,sysr=
eg");
>
> With this, the CMU driver (e.g. cmu_hsi0) now gets a reference to the res=
pective
> sysreg (sysreg_hsi0), which in turn creates a regmap with a clock handle
> (CLK_GOUT_HSI0_SYSREG_HSI0_PCLK), and the clock is 'prepared'. Hence the =
CMU
> providing this clock (cmu_hsi0) is not idle anymore, and runtime PM for t=
his
> CMU can't kick in anymore
>
> I see two straight forward options to fix this:
>
> 1) The easiest fix is to just drop the clock from the sysreg DT node. The=
 sysreg
> clock shouldn't matter now, as the whole CMU is in auto mode now anyway.
>
> 2) change above code to use device_node_to_regmap() which ignores resourc=
es (the
> sysreg clock in the example case), and manage the clock manually during s=
ave and
> restore in samsung_clk_save() and samsung_clk_restore()

I think option 2 is likely better, as it isn't an ABI break. It would
need a comment explaining why we use that API when a clock resource is
defined in DT for the syscon though (we don't want the clock managed
as it affects runtime PM). Maybe Krzysztof has other thoughts though.

runtime pm isn't currently enabled for gs101, so auto clock support
hasn't regressed anything. But AIUI Andre was close to
posting/enabling it, and this issue would block that.

> Any better ideas?

None I can think of currently.

Thanks,

Peter.

