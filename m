Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B00CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 07:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2URYXFsdVZ7zfE6UHaRcVDaEOGeqXpHsK6sM6HYXxw=; b=NT64KAdRR1dllylqxWLVcsnHzQ
	W46wta4CBoGEv7KNcpaXnJSd2JHzp9hAn6eqknpvZz/mhKYQBXNBcXAO5J8pMSqircz1LISMftjC0
	NQOJdoiAMFJpNeHLpoHpB34ZRdvMtUOffrcpKEe5F0EuGi2SAK8HV6iiOI0auT9vs+Txs0GXsfGTw
	b/kEJGMWsvQ1cnKBqFitvK539mfn0Rfy2DnK1FEa8lfgY+dnWjLU7rBNPb3NKzXBij4Y4kH9dyZLj
	6SrqEZWSQ5K5lxK3tJVGn6g0lmqWXMuCyBAOBySk0O/JTqKP0I6xEnY8i2vBtjesC0LccvdZJ9wl9
	hIDnXELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKBN-0000000A431-05C5;
	Fri, 22 May 2026 07:20:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKBK-0000000A421-1Bci;
	Fri, 22 May 2026 07:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+2URYXFsdVZ7zfE6UHaRcVDaEOGeqXpHsK6sM6HYXxw=; b=UV9FlgTJ+SpBVSlQknaczKW1He
	0KdJMHYQO06VGWA2ke80QVYABG29Wjp2+inK0WpjBCWHQWKWu51yEzHk4cnqUpXgCr9LHdEZzAND4
	HixlCGro6pQBcX/IKZOlsY86FmBmLLWnDQglnk06zfl6wi4BrW7sWDPDjAlvcR+HGShk3FTAjdvf9
	vp+JBtgg59CjIs9vKc0bqvhv5OJQ0pTzdyXYCMJXVc2fHkDwiIMKhJsUX7xtEFCYYrVBqC/m8tESA
	EeKM5Q7FICE+UhXPl1y4pKqiMgFTzLI5+fq0WjqLWnDXyc2rxqv5JOueMCiqD1BoUGe949aLeNJQV
	4AXKitKQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Steven Price <steven.price@arm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: rockchip: keep reset control around
Date: Fri, 22 May 2026 09:20:23 +0200
Message-ID: <7845032.1B3tZ46Xf9@phil>
In-Reply-To: <20260521210915.2331176-1-heiko@sntech.de>
References: <20260521210915.2331176-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_002030_349355_7DA308A6 
X-CRM114-Status: GOOD (  22.00  )
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

Am Donnerstag, 21. Mai 2026, 23:09:15 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Heiko Stuebner:
> Do not put the reset control, retain exclusive control over it.
> After turning on a CPU, the corresponding reset line must stay
> deasserted.
>=20
> This also avoids calling reset_control_put() before workqueues
> are operational.
>=20
> Fixes: 78ebbff6d1a0 ("reset: handle removing supplier before consumers")
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Tested-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/mach-rockchip/platsmp.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/pl=
atsmp.c
> index f432d22bfed8..f659d894bfae 100644
> --- a/arch/arm/mach-rockchip/platsmp.c
> +++ b/arch/arm/mach-rockchip/platsmp.c
> @@ -34,6 +34,7 @@ static int ncores;
> =20
>  static struct regmap *pmu;
>  static int has_pmu =3D true;
> +static struct reset_control *cpu_rstc[4];

After sleeping on that, this should be cpu_rstc[5];

Coretx-A9 SoCs need to enable the SCU power-domain which thankfully
sits at index 4 of the power-domain register.

So while we (already) expect no reset control for that, we need at least
make sure, it's not reading into undefined memory and thus need that
empty field in the array.


Heiko

> =20
>  static int pmu_power_domain_is_on(int pd)
>  {
> @@ -64,9 +65,11 @@ static struct reset_control *rockchip_get_core_reset(i=
nt cpu)
>  static int pmu_set_power_domain(int pd, bool on)
>  {
>  	u32 val =3D (on) ? 0 : BIT(pd);
> -	struct reset_control *rstc =3D rockchip_get_core_reset(pd);
> +	struct reset_control *rstc;
>  	int ret;
> =20
> +	rstc =3D pd < ARRAY_SIZE(cpu_rstc) ? cpu_rstc[pd] : ERR_PTR(-EINVAL);
> +
>  	if (IS_ERR(rstc) && read_cpuid_part() !=3D ARM_CPU_PART_CORTEX_A9) {
>  		pr_err("%s: could not get reset control for core %d\n",
>  		       __func__, pd);
> @@ -100,11 +103,8 @@ static int pmu_set_power_domain(int pd, bool on)
>  		}
>  	}
> =20
> -	if (!IS_ERR(rstc)) {
> -		if (on)
> -			reset_control_deassert(rstc);
> -		reset_control_put(rstc);
> -	}
> +	if (!IS_ERR(rstc) && on)
> +		reset_control_deassert(rstc);
> =20
>  	return 0;
>  }
> @@ -312,6 +312,10 @@ static void __init rockchip_smp_prepare_cpus(unsigne=
d int max_cpus)
>  		ncores =3D ((l2ctlr >> 24) & 0x3) + 1;
>  	}
> =20
> +	/* Collect cpu core reset control for each core */
> +	for (i =3D 0; i < ncores; i++)
> +		cpu_rstc[i] =3D rockchip_get_core_reset(i);
> +
>  	/* Make sure that all cores except the first are really off */
>  	for (i =3D 1; i < ncores; i++)
>  		pmu_set_power_domain(0 + i, false);
>=20





