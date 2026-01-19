Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C8AD29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOLfqWIhNexAHWIet0YvT9M8UoWng/1ht2LzlUGoS5k=; b=puTwRSFUZVwwi7+Od4/3pIJy/n
	YLx/VTHJRrAb9XKlWcImjOjS7R1sfR7uMV7I0406cgNEvxe6Wj2bhcL17JP4XBPPkKU2PEhvUdQPw
	ve5qShUAEvYXl0a6bh+0PxizGhHidgB0lAvnz948e2/ixPe/YiitL5ia5Zv/1bI7CcSC9oZ8N1fcI
	HNyxjZiXnO/41oUfV+GBwJ3CUZ7V0v/5gYdFySDLWX2rMB8eW3lQe5sm90cLs9b6pz1zU5nM87RVu
	lMKYuYRaTH4d/scUJJK/Mb2D7aTyggP8P8IBNOY0bSxolAiNo3AIcW+nP0deTdzdKKeRas4QxUkUa
	XWgC3XYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhr5K-00000002LEt-2zSo;
	Mon, 19 Jan 2026 15:22:30 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhr5D-00000002LCq-05wG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:22:29 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-81ef4b87291so2218685b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 07:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768836142; x=1769440942; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bOLfqWIhNexAHWIet0YvT9M8UoWng/1ht2LzlUGoS5k=;
        b=qB0oLPQ5exlcaf2kqhsb+vbj9p3Ysvp3Dwyc0U04yMKLI3EqtbLhrwoKofNJiiuPqb
         yM1/tl5EeQxKCd7Ws1ud2Zs+45Ox/HtphclGQG7iYlLu1gKZDyPSy0pNicDespp7ak+a
         wqFzGy/CvDRHeTUQ3m0DI9GG8xqHhHcnkE5tf8Ww/KTkIjHfgQAD0fRl5FKo1WLjTjbZ
         xXzfkC50lnUF6KqGDfVsYm6I9lG6Iq/cvnWh5IPw/dIFYwJkNOm3/Y2kxVuQJfYb8d+O
         vbAbVPkl8wCFda50UgpiwvMzoPx8Gh+ReTEyyLCmg0kIqsvx56z+TyZa8ICHmAkflP1k
         gEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768836142; x=1769440942;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bOLfqWIhNexAHWIet0YvT9M8UoWng/1ht2LzlUGoS5k=;
        b=E43e790G4myumq0ebW3uPsIQtcBVbeGfoiUMImTluS4QPprOvM+2xEtmt1CQmY+BpN
         2htqOPMp0hMosvisRJjtHccBGomPGqq/v5nIVtNzeC0dXplfELzGDhioFKHAe2S8x6rd
         YIFbU22QUg2yArmXgBcnGf6jdPzoRm+y81P9Bryctck3IA81rcWHnO3bvexWVyvS6rL+
         r23oBrRFrLLoJxlPMDuO2zCOIYdvjyGPtDYYbpe5xSdviTZaamO6iLNzNiyaV1RLKjUq
         l7SaolFWLcuBaTA1ytZiVeSLtqGbBlVi+7zrhtlMCpPM7OEysJrJGAQ9QZ0CiT326R3x
         37dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtLFBr2HYq9SeJ7Nc0z6o7MmAZ/uNPc/JCBKgkr3MJNZDOHBb4KQfjpFdQ5VwXkE4sZ8qZiq3N1yHZfLVP9T/v@lists.infradead.org
X-Gm-Message-State: AOJu0YzC1gztJ+7lRAsnCGUH3egloQlCngGKUfGbHe3/bYv1oQvkkTjB
	6ywxxmvvrLhXOzhxuqShgRODdUwLY30RK+mQ+WlVB5ym15Z7vzSNuo53Y0Ug2iOJTlk=
X-Gm-Gg: AY/fxX6U0j4L3SEnwa1FO21xx5eX93ZJwsxsVXSTm4ULTJIX7vn8Ok21iYyrsZTxa/3
	+XU3MsvWO+ORV7PK6WgE/RSgnB2LuvoiSzAoeSHt7hGhuDVt0lfGFwhntHpXQyhMJrKDy5qQx1c
	uy8UVFzsfTAybRqLLAuJD7cMAQLtBe6Rv5vBoQKRcbeUvMRmqc4ERGagIefLW0qAWfuTfbgt5h1
	T417xhapygkq+4s3sbn9JGXOujQfPJyIt2fH52jiQ5D8cgacdVRcD1ERKNtOkBS24GiB17NNDOW
	kXqa1dL85Y5TzbvkldDXTaNL5nJRm0zk8bNTOkemTxJ73ArrNm2vIBFJfLJFyyEV3uwiTHsjQwL
	6IAIY8fwyZyBxLEwOdTaHdvoN+jiCW4AlOWVgW2rIHmNZzJVgOGR7FEbdH5EhuEOF3bdZIZ+Gl8
	21DRhKUJnyPB/YP9kkBA==
X-Received: by 2002:a05:6a21:3397:b0:366:1926:1e1d with SMTP id adf61e73a8af0-38dfe590993mr13488970637.4.1768836141975;
        Mon, 19 Jan 2026 07:22:21 -0800 (PST)
Received: from draszik.lan ([212.129.73.116])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf232f00sm9691868a12.2.2026.01.19.07.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 07:22:21 -0800 (PST)
Message-ID: <872f487ab2c5f6c2b1b2d7f7ee3cc26beec7970a.camel@linaro.org>
Subject: Re: [PATCH 3/3] clk: samsung: allow runtime PM with auto clock
 gating
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, Juan
 Yescas <jyescas@google.com>, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 19 Jan 2026 15:22:16 +0000
In-Reply-To: <6dde4f443be88d6fc412c08feb3e1f082c088118.camel@linaro.org>
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
		 <20260109-clk-samsung-autoclk-updates-v1-3-2394dcf242a9@linaro.org>
		 <dfc3f6ee-08c8-4673-91c2-e9c863105753@kernel.org>
	 <6dde4f443be88d6fc412c08feb3e1f082c088118.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_072223_990607_3210048E 
X-CRM114-Status: GOOD (  38.74  )
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

On Mon, 2026-01-19 at 15:00 +0000, Andr=C3=A9 Draszik wrote:
> Hi Krzysztof,
>=20
> On Sat, 2026-01-17 at 20:25 +0100, Krzysztof Kozlowski wrote:
> > On 09/01/2026 18:27, Andr=C3=A9 Draszik wrote:
> > > When automatic clock gating is enabled, runtime PM (RPM) isn't entere=
d
> > > even if enabled for a CMU if a sysreg clock exists and is provided by
> > > this CMU (as is generally the case).
> > >=20
> > > The reason is that this driver acquires a CMU's sysreg registers usin=
g
> > > syscon_regmap_lookup_by_phandle() which ends up preparing the sysreg
> > > clock. Given the sysreg clock is provided by this CMU, this CMU's usa=
ge
> > > count is therefore bumped and RPM can not be entered as this CMU neve=
r
> > > becomes idle.
> > >=20
> > > Switch to using device_node_to_regmap() which doesn't handle resource=
s
> > > (the clock), leaving the CMU's usage count unaffected.
> > >=20
> > > Note1: sysreg clock handling is completely removed with this commit
> >=20
> > I miss where do you remove in this commit the sysreg clock handling?
>=20
> The CMU driver originally used syscon_regmap_lookup_by_phandle() for sysr=
eg,
> which does clk_get() and clk_prepare(), and then implicitly and for each
> register access clk_enable()/disable() for the clock specified in DT for =
the
> (sysreg) node.
>=20
> This commit changes it to using device_node_to_regmap(), which does nothi=
ng
> with the clock (or any other resources). I opted to have the CMU driver s=
till
> do a clk_get(), so that the relationship is still visible, e.g. in
> $debugfs/clk/clk_summary.
>=20
> > > because sysreg register access is only required during suspend/resume=
.
> > > In the runtime suspend case, we would have to enable the clock to rea=
d
> > > the registers, but we can not do that as that would cause a resume of
> > > this driver which is not allowed. This is not a problem because we
> > > would only need to handle the clock manually if automatic clock gatin=
g
> > > wasn't enabled in the first. This code is only relevant if automatic
> > > clock gating is enabled, though.
> > >=20
> > > Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating =
mode for CMUs")
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > > ---
> > > =C2=A0drivers/clk/samsung/clk.c | 92 ++++++++++++++++++++++++++++++++=
+++------------
> > > =C2=A0drivers/clk/samsung/clk.h |=C2=A0 2 ++
> > > =C2=A02 files changed, 71 insertions(+), 23 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> > > index 9f68f079fd552f8dfb6898dbfb47dec0e84c626c..6515df81fcbc79b90f526=
2843e67575f6a4e0dda 100644
> > > --- a/drivers/clk/samsung/clk.c
> > > +++ b/drivers/clk/samsung/clk.c
> > > @@ -9,11 +9,13 @@
> > > =C2=A0 */
> > > =C2=A0
> > > =C2=A0#include <linux/slab.h>
> > > +#include <linux/clk.h>
> > > =C2=A0#include <linux/clkdev.h>
> > > =C2=A0#include <linux/clk-provider.h>
> > > =C2=A0#include <linux/io.h>
> > > =C2=A0#include <linux/mfd/syscon.h>
> > > =C2=A0#include <linux/mod_devicetable.h>
> > > +#include <linux/of.h>
> > > =C2=A0#include <linux/of_address.h>
> > > =C2=A0#include <linux/regmap.h>
> > > =C2=A0#include <linux/syscore_ops.h>
> > > @@ -489,6 +491,50 @@ void __init samsung_cmu_register_clocks(struct s=
amsung_clk_provider *ctx,
> > > =C2=A0		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks=
);
> > > =C2=A0}
> > > =C2=A0
> > > +static int samsung_get_sysreg_regmap(struct device_node *np,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct samsung_clk_provider *ctx)
> > > +{
> > > +	struct device_node *sysreg_np;
> > > +	struct clk *sysreg_clk;
> > > +	struct regmap *regmap;
> > > +	int ret;
> > > +
> > > +	sysreg_np =3D of_parse_phandle(np, "samsung,sysreg", 0);
> > > +	if (!sysreg_np)
> > > +		return -ENODEV;
> > > +
> > > +	sysreg_clk =3D of_clk_get(sysreg_np, 0);
> >=20
> > I don't think you should be poking clock of some other device. This
> > clearly breaks encapsulation. What sysreg is needs to do to access
> > registers, is only business of sysreg. No other drivers should
> > re-implement this.
>=20
> Similarly, to how other drivers (like UFS and peric/USI) also poke in
> the sysreg region in a similar way, the CMU related parts of sysreg are
> handled in this driver, though, as only the CMU driver knows how to
> configure them based on the gating (auto vs. manual).
>=20
> No separate driver was sysreg was added when this code was introduced.
> The clk_get() used to be part of syscon_regmap_lookup_by_phandle(), and
> I chose to keep only that, as per above.
>=20
> I propose to add an actual sysreg driver once the need arises, then
> this can also move, but for now keeping it here seems straight forward.
>=20
> Is that OK with you?

Forgot to say, I can of course remove all clock related code (clk_get() etc=
).

What do you think? Is that acceptable?


CHeers,
Andre'

