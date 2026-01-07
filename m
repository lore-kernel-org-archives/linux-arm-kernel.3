Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D04CF6BF0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 07:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0fvD/6IVkbuhi2W+VfhGVpu8UbGrrkC5tRDibWmgTw=; b=xY//fij+booqT5RcHFlbcIRDFc
	Y8gh/Vlb4nMXI/J72hKtpK1RRp09wwjfb2Fe0O95aNiSXgPkIBQ+wANYOSJLGVbcanv4SAVZCsbxi
	X6WauajDxNqYdBhDErqdmgqCAL2tuUfcVWyqu+ZyJOp7jEi8/bIsZsK0TwXPJiDhBK3dN9DAA5vSx
	etNYyYKyI0QsqCG1QXpMvx1q3jWAjqKTLauah3gU5M+RrdGQqrh96MEslbGIXI+B/5Wp6pliyfFpZ
	jCrUH8ya2P/h8Bbcsio9K5RYulkLvpQUvfXar/lMV/Ivup1ten0gbZMQIfERSvAM6IUfzPXAwZlqh
	Jqc1jo7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdNs9-0000000EHVf-05M3;
	Wed, 07 Jan 2026 07:22:25 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdNs5-0000000EHUu-3sHd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 07:22:23 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7ba55660769so1183376b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 23:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767770540; x=1768375340; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j0fvD/6IVkbuhi2W+VfhGVpu8UbGrrkC5tRDibWmgTw=;
        b=pfiuaIWYSPz4LMK8P9e9NPglhgnUwr4v5bkDtLO4a/lsfGm7bnhhk0zsj8U4jwqi3W
         RGp44IlcbZHIVyseVlzWFXXS+3AtfXcQKoPHKGKekd5HjWG/0gi17EzQ2sUkZln1VSRb
         FuA7rf7bwwu/pXjq4iirXuGOu95FiAX9PBug9pCBiHq5je8CpzfrwKsSh83QepcPkd7y
         tFZ08ymreUIlOT1T6BowBays8vio81ecbOjYOazIbroF/AfLenHtWFcosFcorXTo/aKJ
         ukiM8d2A5PVGZ3wZwxWxmOBJoxBCcpaTSQNyhB4gmqLIQB8NZNILazKy64a8wAoukEk6
         Ny2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767770540; x=1768375340;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0fvD/6IVkbuhi2W+VfhGVpu8UbGrrkC5tRDibWmgTw=;
        b=s+CwRf2TqnawkWKp8F9tmCx5HO08oWsy1+0MqBe2cv1PIFM7tM0KSxIKQkpijk9U5Q
         ROsi0LSn9TXfvTvj70Za1UcJA02P3ma2FnJAJgDfolinx4RPWSlhRNYMKA2UngoE0lgk
         qeKnJTe07cRTC/z2UwWIPGCAKezS2kJ5l1mqhim+19VnyN1vmfsvx8jADqCV8ihGcMvr
         34IxIrD/Vq4OV6YZMGCZfOnC77cmDntVnJC9/5Dq/ra/AURSkJjGVCb7WDHZRkCBAnjx
         K0aJq5XZkBODz3tpGx0mWF9Kwky6N9IPxiZoIxu9brPHP1Snxc9V008ib6JZzeWFLTdW
         WlwA==
X-Forwarded-Encrypted: i=1; AJvYcCUa3Mg/lbFT791D4eRVWWwoRiVQI2Kk7skrIxTZHf23CtjlQHkT2IIFDC6bpPSh4kKMAm1/ckcZwQSwU/6H5sel@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ4mgNg3i1U8w9COiJLHhdM6s7K2Lg1l14DYjYnb8R0iK6aFHu
	40oLmMu4aTXvXo5BeQJBjEgIZ8e5g0A4EwVVpxAQYvHVNDG6lEXqhQJ9ksQwjJs8imc=
X-Gm-Gg: AY/fxX4eGARzD/xWmFTgRI3MjbJ55jWQGlAxCqo9jnCoKyMzNJQXsgrtngiltOBvOP8
	mgM3A32qtMlxu7kHFJqbC9DQMHxHqmX4WLUMLtkC0g15lano1cLUhFDAq6GGyvkc8MCeIo2Zyoc
	2rLi+GODy0H6k0xypGgmGwYQFLHLhcfFg8wuP7YgnVws8JHF0Z4fhPEMFdw5j/Fb0oLGiOLwFrw
	Hh1Ah9GDcZmWjYTrNhEvBMxhH/+UidiyXkb0cm/Rry2yYiJ3QyPWI83EjwfWM+CdFlNL9ur4p1u
	0LxOIX1FyVekdzLfhvP+Zn7vphifc/LlILEh4PUU3l23au3GtGl6qMKtWG7fDvAINldC/XH0o9+
	D1adFl3rGD0dZcCtgYVbuXO4vMZ3cXyG5Q1KhWJoPit4b6xMPBLZxu5kzJU75UeSwU3WAOT0xy9
	nh6POlQGlD4DXwmnzHXA==
X-Google-Smtp-Source: AGHT+IFjntT6k4Ggqzs01daHSIuv7X/dX6d2z4MC/qp/LQTz6WPJPvTolP0ZHgvqrsUi80U9YGSOCw==
X-Received: by 2002:a05:6a00:ace:b0:81b:ad93:a874 with SMTP id d2e1a72fcca58-81bad93a9d0mr1219225b3a.16.1767770539968;
        Tue, 06 Jan 2026 23:22:19 -0800 (PST)
Received: from draszik.lan ([212.129.72.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52f8e10sm4038040b3a.44.2026.01.06.23.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 23:22:19 -0800 (PST)
Message-ID: <39019203631fdd183fb5ddaa7fada5da5f2a31ad.camel@linaro.org>
Subject: Re: [PATCH v7 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko
 <semen.protsenko@linaro.org>, Sylwester Nawrocki	 <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 kernel-team@android.com,  Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Date: Wed, 07 Jan 2026 07:22:44 +0000
In-Reply-To: <20251222-automatic-clocks-v7-3-fec86fa89874@linaro.org>
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
	 <20251222-automatic-clocks-v7-3-fec86fa89874@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_232221_976299_A32DCF63 
X-CRM114-Status: GOOD (  21.51  )
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

Hi,

On Mon, 2025-12-22 at 10:22 +0000, Peter Griffin wrote:
> Update exynos_arm64_init_clocks() so that it enables the automatic clock
> mode bits in the CMU option register if the auto_clock_gate flag and
> option_offset fields are set for the CMU. To ensure compatibility with
> older DTs (that specified an incorrect CMU reg size), detect this and
> fallback to manual clock gate mode as the auto clock mode feature depends
> on registers in this area.
>=20
> The CMU option register bits are global and effect every clock component =
in
> the CMU, as such clearing the GATE_ENABLE_HWACG bit and setting GATE_MANU=
AL
> bit on every gate register is only required if auto_clock_gate is false.
>=20
> Additionally if auto_clock_gate is enabled the dynamic root clock gating
> and memclk registers will be configured in the corresponding CMUs sysreg
> bank. These registers are exposed via syscon, so the register
> samsung_clk_save/restore paths are updated to also take a regmap.

The implementation described in this paragraph this causes pm-runtime to
stop working for the CMU if auto clock gating is enabled.

See below.

> [...]
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index c149ca6c221725195faeb76b0d73374c3b48261b..06ea5deef4ee2ffb87dcd1410=
2561886ea80b7bc 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> [...]
> @@ -357,6 +489,37 @@ void __init samsung_cmu_register_clocks(struct samsu=
ng_clk_provider *ctx,
> =C2=A0		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
> =C2=A0}
> =C2=A0
> +/* Each bit enable/disables DRCG of a bus component */
> +#define DRCG_EN_MSK	GENMASK(31, 0)
> +#define MEMCLK_EN	BIT(0)
> +
> +/* Enable Dynamic Root Clock Gating (DRCG) of bus components */
> +void samsung_en_dyn_root_clk_gating(struct device_node *np,
> +				=C2=A0=C2=A0=C2=A0 struct samsung_clk_provider *ctx,
> +				=C2=A0=C2=A0=C2=A0 const struct samsung_cmu_info *cmu)
> +{
> +	if (!ctx->auto_clock_gate)
> +		return;
> +
> +	ctx->sysreg =3D syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");

With this, the CMU driver (e.g. cmu_hsi0) now gets a reference to the respe=
ctive
sysreg (sysreg_hsi0), which in turn creates a regmap with a clock handle
(CLK_GOUT_HSI0_SYSREG_HSI0_PCLK), and the clock is 'prepared'. Hence the CM=
U
providing this clock (cmu_hsi0) is not idle anymore, and runtime PM for thi=
s
CMU can't kick in anymore

I see two straight forward options to fix this:

1) The easiest fix is to just drop the clock from the sysreg DT node. The s=
ysreg
clock shouldn't matter now, as the whole CMU is in auto mode now anyway.

2) change above code to use device_node_to_regmap() which ignores resources=
 (the
sysreg clock in the example case), and manage the clock manually during sav=
e and
restore in samsung_clk_save() and samsung_clk_restore()

Any better ideas?


Cheers,
Andre'

