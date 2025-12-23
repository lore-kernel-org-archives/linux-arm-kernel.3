Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9218AE6F081
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VW/cRPo8LKvRyH919j4YxeyMCTrtYxKo0u6s8/ZPXcs=; b=xEn9KhrCbqqEiu/P3W8ayE4F3q
	xydv2EEhLynnaFmjNZPcW+nTCTdkem1Dll15d62pCejUiJGIYQ0P0R3zyagBW9Vr789tOyzW6SWcI
	ogj3XrAdzikjffkHscNPTPUSoMDCEmTo6BCNNmbvG4LgVJmPjUU5VwDOsAG6qcfITZDU3eng3FoVd
	n2i7DzUs3m9QBenjXij18ORzfPvyiNerDmL5gB6iBIvbqmkrWe5zqPaTlQ5wlYMhQcPvljwUmtRfi
	mPwVvn6/fHAEn3vjCQ0El+m2RFEoQVefgYibnuXzDXBnl+wSOgzEDEuFXrrrf3/vLO1kDOtgYHH5U
	zVGIHkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzTo-0000000EsVU-1hIC;
	Tue, 23 Dec 2025 10:19:00 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzTm-0000000EsV3-1MHw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:18:59 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-34c84dc332cso4135766a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766485137; x=1767089937; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VW/cRPo8LKvRyH919j4YxeyMCTrtYxKo0u6s8/ZPXcs=;
        b=REyHTQ+NCaeE04tu/+dwC+ASqbYQ0G42LYWLYr/l75ORf3pm6qjqJbGwBlUOYHqLk5
         OmfixWXjh0Nd3g42OT+E0otrAIZEecUySGBwsaevuW27Vlr3DtWp0E03ei+bE6x3D6GM
         uxs/O6a6CVC2NuXTkvwN7n13+//m5+AJg1ObVGyqupGrdxI0fzzAjfdqHTx1FH5Bo0xM
         UcKewfaGPrEEIhvohWBhRyiTW42+kt+0YVxwik6epj1IMe2CfZdR/sTy/DHzbOn8tTHB
         ahDw4UPtGwKT9I6NREGC2uA/s5jeg+DgLVFs7iiweQzDrrDfDIzSfyq6pdG6mOoNaMlq
         WuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766485137; x=1767089937;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VW/cRPo8LKvRyH919j4YxeyMCTrtYxKo0u6s8/ZPXcs=;
        b=PPfmw0xKoYmv6XrZE2x1LL4AM9b1vfLW920JzJJwNW6t/nt2w6NMvaXSsVeSigF8W+
         Y6ydQwoINzgg1wtiandTSMcOZoZ3jIXswZ/R1fBLNDq3uX7f4J1BlMLEYo06F2degbsB
         55bpG9kK28CFWqtWpIhQuY9XvUBcLRTZtsiYqxlC/3vvwj5C6FcDroKj0sB8YTTkgzl7
         ouw+U451aYnBZv7vsa9LlbLbxYQF46rBBje1+2mskDDRvEmx/DDJBly1ksVe2o/TOxL2
         5IcJZ1oVQ5RMTeVeeWi0TDPPoiKSMW9WFZrIsEa8h47eKDU6s8EfYQx1Husslg/TFLd5
         448w==
X-Forwarded-Encrypted: i=1; AJvYcCXdBLi1zAVY1kFxNIvGYcoECQeeeoSTdeOQPuWyDtyqm/WJhZeRSV9ih0kbgJaGfn7zF25XArO1SpApaj1VT8ri@lists.infradead.org
X-Gm-Message-State: AOJu0YyMjh6yGqVccKX1YJZlvDWja4ewFjfQjnqUKoYUApc888pc6YTD
	gHkXkXunr81Bzmnm89D8Do+a/sn3DBavZvLAeKKA61a13QDsnyOWKB6lMdJMayA565A=
X-Gm-Gg: AY/fxX47DJ/sLRcEtfEwzJBLwgZ949MqaQZOUO9dV9PAT09z6pjsSjtNf/7waJWrKll
	gbEsrxTO/o2K/ni9eseMRG6gRMPzoguOTzbPXkSdbIGyRjyMpqWQqxSXtu5m3ERP8GDr3dCJtDq
	4hX+xi3ltQfyu/v7rebTyylZ/QfdGGYCJD7NeL5yVadDGLhoqQp8uh8WqFCrY2OmPAs9sjPKhxI
	XPfsZ7tYAXEqoZKW8CcsEul65PCn1KXlZ9GY0v57gShL00uiViX1wtEuB0u1v6und5zRIMgp5OW
	KhUdiphev8Zo2hfyAzDI6GMfV4e6cGfu6RchlnQnAkEVK3YDil8ceUhmXt5hIIwLUz+3n+3IHAk
	XjOnZsaAFWiJatUnqsMBSnOD2dk6gl+W49PPVGtS9ipuKN7dnZkDtS09Bo93qHcLjs16diH3ZLk
	b90a6zrrom5bX+XCwV
X-Google-Smtp-Source: AGHT+IGp4L0lCDedpR8cpLerixGXZgyRPWS/NrfGTL438LLgC62TRKM17kQJDDB4qVnzc0Z89xbxQQ==
X-Received: by 2002:a17:90b:5245:b0:349:19a8:e00e with SMTP id 98e67ed59e1d1-34e921bc767mr11429789a91.31.1766485137075;
        Tue, 23 Dec 2025 02:18:57 -0800 (PST)
Received: from draszik.lan ([212.129.75.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd61b4csm11634759a12.18.2025.12.23.02.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:18:56 -0800 (PST)
Message-ID: <aa55c3865d151697120a2855e711d59468bdcd0a.camel@linaro.org>
Subject: Re: [PATCH v4 4/5] soc: samsung: exynos-chipid: add
 google,gs101-otp support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 23 Dec 2025 10:18:56 +0000
In-Reply-To: <20251222-gs101-chipid-v4-4-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
	 <20251222-gs101-chipid-v4-4-aa8e20ce7bb3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_021858_372574_811F72DD 
X-CRM114-Status: GOOD (  25.67  )
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

On Mon, 2025-12-22 at 16:30 +0000, Tudor Ambarus wrote:
> GS101 is different (but also e850 and autov9 I assume) from the SoCs
> that are currently handled by the exynos-chipid driver because the
> chip ID info is part of the OTP registers. GS101 OTP has a clock, an
> interrupt line, a register space (that contains product and chip ID,
> TMU data, ASV, etc) and a 32Kbit memory space that can be
> read/program/locked with specific commands. On GS101 the "ChipID block"
> is just an abstraction, it's not a physical device. When the power-on
> sequence progresses, the OTP chipid values are loaded to the OTP
> registers.
>=20
> Add the GS101 chip ID support. The support is intentionally added in the
> exynos-chipid driver, and not in a dedicated Exynos OTP driver, because
> we estimate that there will not be any OTP consumers in the kernel other
> than the chip ID/SoC interface. The downstream GS101 drivers confirm
> this supposition.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0drivers/soc/samsung/exynos-chipid.c | 70 ++++++++++++++++++++++++++=
++++++-----
> =C2=A01 file changed, 61 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/ex=
ynos-chipid.c
> index 5c8660374269c87ec38ebca242918bd7b1d362e5..6ef9751e2509c94bd9625072d=
0b81ddb93048d4a 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -15,7 +15,8 @@
> =C2=A0#include <linux/array_size.h>
> =C2=A0#include <linux/device.h>
> =C2=A0#include <linux/device/devres.h>
> -#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/ioport.h>
> =C2=A0#include <linux/mfd/syscon.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/of.h>
> @@ -28,9 +29,11 @@
> =C2=A0#include "exynos-asv.h"
> =C2=A0
> =C2=A0struct exynos_chipid_variant {
> -	unsigned int rev_reg;		/* revision register offset */
> +	unsigned int main_rev_reg;	/* main revision register offset */
> +	unsigned int sub_rev_reg;	/* sub revision register offset */
> =C2=A0	unsigned int main_rev_shift;	/* main revision offset in rev_reg */
> =C2=A0	unsigned int sub_rev_shift;	/* sub revision offset in rev_reg */
> +	bool efuse;
> =C2=A0};
> =C2=A0
> =C2=A0struct exynos_chipid_info {
> @@ -69,6 +72,8 @@ static const struct exynos_soc_id {
> =C2=A0	{ "EXYNOS990", 0xE9830000 },
> =C2=A0	{ "EXYNOSAUTOV9", 0xAAA80000 },
> =C2=A0	{ "EXYNOSAUTOV920", 0x0A920000 },
> +	/* Compatible with: google,gs101-otp */
> +	{ "GS101", 0x9845000 },
> =C2=A0};
> =C2=A0
> =C2=A0static const char *exynos_product_id_to_name(unsigned int product_i=
d)
> @@ -93,19 +98,53 @@ static int exynos_chipid_get_chipid_info(struct devic=
e *dev,
> =C2=A0		return dev_err_probe(dev, ret, "failed to read Product ID\n");
> =C2=A0	soc_info->product_id =3D val & EXYNOS_MASK;
> =C2=A0
> -	if (data->rev_reg !=3D EXYNOS_CHIPID_REG_PRO_ID) {
> -		ret =3D regmap_read(regmap, data->rev_reg, &val);
> +	if (data->sub_rev_reg =3D=3D EXYNOS_CHIPID_REG_PRO_ID) {
> +		/* exynos4210 case */
> +		main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> +		sub_rev =3D (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> +	} else {
> +		unsigned int val2;
> +
> +		ret =3D regmap_read(regmap, data->sub_rev_reg, &val2);
> =C2=A0		if (ret < 0)
> =C2=A0			return dev_err_probe(dev, ret,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to read revision\n");
> +
> +		if (data->main_rev_reg =3D=3D EXYNOS_CHIPID_REG_PRO_ID)
> +			/* gs101 case */
> +			main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> +		else
> +			/* exynos850 case */
> +			main_rev =3D (val2 >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;

Looking closer, why is this not val? Now you're shifting the sub_rev
register value by the main rev shift, assigning the sub_rev register
value to the main rev variable.

And then, all assignments to main_rev become identical and don't need to
be duplicated.

> +
> +		sub_rev =3D (val2 >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> =C2=A0	}
> -	main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> -	sub_rev =3D (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> +
> =C2=A0	soc_info->revision =3D (main_rev << EXYNOS_REV_PART_SHIFT) | sub_r=
ev;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}


Cheers,
Andre'

