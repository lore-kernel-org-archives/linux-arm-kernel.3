Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DACFD29C33
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IbXNhWIbZbrbqZXRIFNlWrdzKYdRYk3QnEEbv0798c=; b=33OHBmoSzApzNQncd2CW/r7tU8
	/diXB5eEy2OBMO4MKmOE3LeWGPIG+BmyUdslCb30GV2Fx/TdIepeUtdUAbNiRWl8LqJNfqUT2Kwo3
	JM/wt6OcHldqZtBYZ4QYecfVYfvYH56LU7doLEvJoEwFJmcmNy3LmTgkNuPFyw5LscMp7h3yBk9nD
	eh4zzzoJLimYGIc0aVNAr0zwVZEb/N5GZCi23kKMXi7O29x0qvSV17Elbw+s5O4QRv4midlfZGBzE
	iFZWGYuUxm8937zy35Pryc+lqV36GGgpl5RvoJWOyXL8V/4uRdodVpPBu85syp+zPd/Bgr36UueJ/
	9bShD49w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqkd-00000002IyB-2HJB;
	Mon, 19 Jan 2026 15:01:07 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqkZ-00000002IxA-0cGM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:01:06 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-81ed3e6b8e3so2054514b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 07:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768834860; x=1769439660; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2IbXNhWIbZbrbqZXRIFNlWrdzKYdRYk3QnEEbv0798c=;
        b=imI39eN5PebfjVJkZH1IHzSUFtWpz4NjvyvaWJwirmdnkW7cbSzNQlsBGtSfsu0L2i
         lfsC2SAU5ZCIzBqndS41JN6O1ZiNQRxw4nYH5IfYQHD5m33sch4EkVw0CWOyjL0dRPCc
         NQimm7346wm34tIxwuqiRLU1O6H1jrdhj/2o6SqGgylzK8ay2WiaqwbB86kefcZov3WF
         KskdWQbn7a6mJl1muzdGfP5cEHdv+NzcBA1qhl7eFj7u2lvjUvq5AKR8+rxyo2KXCquT
         ZlEC5nMUFAt3WSapIatwuFXKgTAYvpmgP2rqvjBgZTBVzeLp+eUJs8Z8ob2nLRC9oGuO
         DOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768834860; x=1769439660;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2IbXNhWIbZbrbqZXRIFNlWrdzKYdRYk3QnEEbv0798c=;
        b=cwsdNMyLuYiXxDBJEg/oFc4pC8v61eOTuLG71fWDSpFk0aVZxtAz8t7zF/x52QAu5t
         zbOt60bjMJS5mZZ4lZzDyHREqWOTRU9jdjH6LFSyCyoW4pJmkYF+PUPWzchvSXwhdEv8
         YPG4u5GX27ZZkOfccy+nxRRKR7TYnpY3pa56SFALqWI+yh8Ga9CqpjHFtbCfI8KGleWA
         q3kXRqmQlxckNM/bcO7rRMRZ5pf3Z8dfVDE2TM5Cw9HheH4eLVyKQjEu/f8M1g8l3zqg
         NMonHe6AvA3YsTk2XDqnwZI4z4fh2fbRlULBKNWe8bg7u/saqtFe3Q4Q47O1WHHNnExw
         2DXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxx+ML4c2iHbx52IxHLk2X93eCS2tsdCoWZBbFo6SUEC3bfVeSIPDNIOGDMh8jSsPY+al9Rw8r2v3/4rgxuTsp@lists.infradead.org
X-Gm-Message-State: AOJu0YwgEQQjookMGk/K75ph0fZbzca4mU2BH5K3zVwGBi8wP8vE+Vao
	6qfAJBJ55nO9Z9Np3fH0kHe7dbc+rmj2ez3SZ8v1wxWJBQLtZY4KqeTZvUhWgrthMR8=
X-Gm-Gg: AY/fxX6lskPG9RS8cly9qrRI9zoAVLYBzRkuYipl8DHqIIShRpa9eQoxftAu021QtK4
	gNKQVzDhv2DKCbjAznZ6BUgabUDc8rRi8ZpJUO8So48QwvD45cf/yUymeiaDDGs2ff6XKDW6Key
	JbLM4mEFY+Jl5YstfmdY6sOLsyO1OLSgGnH8t3L1Wt++pvrPVPVPCfCZNmJVjVB7wzxXuP1ahT5
	g7LWT69767XL9rvnlhH9CoeZIBjVySTZuLfLbOS71N9w9zlSL3F0/j+pNadWCGp5PeXCffeT7iu
	aHfCgLc48fGqmxVJICCCfai5thG3YRgv6AFpPi6srKjyuV4xYqv3xKFl027At8oSqlH2zE0ag7Z
	rMdQF3Jx3QNVYKVKeygSX2eL/aetcumCHt3Hmk2sbTNFVF1vSgqSrS5TUHAcnyy+k5qQjhG7W/m
	T4Gey+hDxYX91SzXj4cw==
X-Received: by 2002:a05:6a21:1505:b0:38d:fad1:cf2a with SMTP id adf61e73a8af0-38e00bb969bmr10563241637.13.1768834858332;
        Mon, 19 Jan 2026 07:00:58 -0800 (PST)
Received: from draszik.lan ([212.129.73.116])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf130f1csm9530167a12.0.2026.01.19.07.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 07:00:57 -0800 (PST)
Message-ID: <6dde4f443be88d6fc412c08feb3e1f082c088118.camel@linaro.org>
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
Date: Mon, 19 Jan 2026 15:00:53 +0000
In-Reply-To: <dfc3f6ee-08c8-4673-91c2-e9c863105753@kernel.org>
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
	 <20260109-clk-samsung-autoclk-updates-v1-3-2394dcf242a9@linaro.org>
	 <dfc3f6ee-08c8-4673-91c2-e9c863105753@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_070103_448502_E380B04C 
X-CRM114-Status: GOOD (  35.10  )
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

Hi Krzysztof,

On Sat, 2026-01-17 at 20:25 +0100, Krzysztof Kozlowski wrote:
> On 09/01/2026 18:27, Andr=C3=A9 Draszik wrote:
> > When automatic clock gating is enabled, runtime PM (RPM) isn't entered
> > even if enabled for a CMU if a sysreg clock exists and is provided by
> > this CMU (as is generally the case).
> >=20
> > The reason is that this driver acquires a CMU's sysreg registers using
> > syscon_regmap_lookup_by_phandle() which ends up preparing the sysreg
> > clock. Given the sysreg clock is provided by this CMU, this CMU's usage
> > count is therefore bumped and RPM can not be entered as this CMU never
> > becomes idle.
> >=20
> > Switch to using device_node_to_regmap() which doesn't handle resources
> > (the clock), leaving the CMU's usage count unaffected.
> >=20
> > Note1: sysreg clock handling is completely removed with this commit
>=20
> I miss where do you remove in this commit the sysreg clock handling?

The CMU driver originally used syscon_regmap_lookup_by_phandle() for sysreg=
,
which does clk_get() and clk_prepare(), and then implicitly and for each
register access clk_enable()/disable() for the clock specified in DT for th=
e
(sysreg) node.

This commit changes it to using device_node_to_regmap(), which does nothing
with the clock (or any other resources). I opted to have the CMU driver sti=
ll
do a clk_get(), so that the relationship is still visible, e.g. in
$debugfs/clk/clk_summary.

> > because sysreg register access is only required during suspend/resume.
> > In the runtime suspend case, we would have to enable the clock to read
> > the registers, but we can not do that as that would cause a resume of
> > this driver which is not allowed. This is not a problem because we
> > would only need to handle the clock manually if automatic clock gating
> > wasn't enabled in the first. This code is only relevant if automatic
> > clock gating is enabled, though.
> >=20
> > Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mo=
de for CMUs")
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/clk/samsung/clk.c | 92 ++++++++++++++++++++++++++++++++++=
+------------
> > =C2=A0drivers/clk/samsung/clk.h |=C2=A0 2 ++
> > =C2=A02 files changed, 71 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> > index 9f68f079fd552f8dfb6898dbfb47dec0e84c626c..6515df81fcbc79b90f52628=
43e67575f6a4e0dda 100644
> > --- a/drivers/clk/samsung/clk.c
> > +++ b/drivers/clk/samsung/clk.c
> > @@ -9,11 +9,13 @@
> > =C2=A0 */
> > =C2=A0
> > =C2=A0#include <linux/slab.h>
> > +#include <linux/clk.h>
> > =C2=A0#include <linux/clkdev.h>
> > =C2=A0#include <linux/clk-provider.h>
> > =C2=A0#include <linux/io.h>
> > =C2=A0#include <linux/mfd/syscon.h>
> > =C2=A0#include <linux/mod_devicetable.h>
> > +#include <linux/of.h>
> > =C2=A0#include <linux/of_address.h>
> > =C2=A0#include <linux/regmap.h>
> > =C2=A0#include <linux/syscore_ops.h>
> > @@ -489,6 +491,50 @@ void __init samsung_cmu_register_clocks(struct sam=
sung_clk_provider *ctx,
> > =C2=A0		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
> > =C2=A0}
> > =C2=A0
> > +static int samsung_get_sysreg_regmap(struct device_node *np,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct samsung_clk_provider *ctx)
> > +{
> > +	struct device_node *sysreg_np;
> > +	struct clk *sysreg_clk;
> > +	struct regmap *regmap;
> > +	int ret;
> > +
> > +	sysreg_np =3D of_parse_phandle(np, "samsung,sysreg", 0);
> > +	if (!sysreg_np)
> > +		return -ENODEV;
> > +
> > +	sysreg_clk =3D of_clk_get(sysreg_np, 0);
>=20
> I don't think you should be poking clock of some other device. This
> clearly breaks encapsulation. What sysreg is needs to do to access
> registers, is only business of sysreg. No other drivers should
> re-implement this.

Similarly, to how other drivers (like UFS and peric/USI) also poke in
the sysreg region in a similar way, the CMU related parts of sysreg are
handled in this driver, though, as only the CMU driver knows how to
configure them based on the gating (auto vs. manual).

No separate driver was sysreg was added when this code was introduced.
The clk_get() used to be part of syscon_regmap_lookup_by_phandle(), and
I chose to keep only that, as per above.

I propose to add an actual sysreg driver once the need arises, then
this can also move, but for now keeping it here seems straight forward.

Is that OK with you?

Cheers,
Andre'

