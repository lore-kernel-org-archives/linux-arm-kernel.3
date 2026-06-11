Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C78CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 16:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=As/pP/Wl9lgSZeirNEJQtG+sKd/tXccaEi6RDRuHzhA=; b=k+gY4Napc+4xiK8bLm2DshDfwX
	sPt9aiMumXZ3DhSrGee4wHD+4m7mByAhu78ep+HI7a5A44vZCHRBqcWuGI4JXzf0H/572X4Hhmi0Y
	xNmfFcJtqF3ggyUYRtyuwKSZycHQOU74TXHs+g2SGpj8pFs/NKp6w9SlRcqvy+7LHTmJHZz1lyHgh
	nxLfHswxAc0bp6u9yv6sF3vrEtP/VWl4AckSrNMrd/Hx6gWhvkvZg7x0MKy1j56WrSkDn8orjqupz
	/DcgaFx0AaEBoHkIvCPM1a2q7Id37q6qnPY/qBUveUMoUOH8+ryViyBKmJzkAEVm7cj/btSVbbAtz
	N901tTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXi2v-00000009k0G-49ws;
	Thu, 11 Jun 2026 16:14:21 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXi2t-00000009jzJ-083T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 16:14:20 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-68bac6e24fdso18916a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 09:14:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781194457; cv=none;
        d=google.com; s=arc-20240605;
        b=bHn+hUh730EZUr4Wfno4+TgoG7fvxPxi5AIuHMbUwJfFYVNV+8EuQWtcMZeEi5RSP6
         IUZwqEfJJpsiUl8VLxHG1K2J67REOo6py5H2bnIrOPLz8SZu2zIYEKQG9wkvMcnac08J
         SLRRw81oabjvfYJsCNy6ANWY7ZLNBXzkRH/9XnNBkRnTuc0Y5YrSKNVlwVFGP6H6aP/Q
         txIZWVnSXcWgbE7chJfRFLo/FI5K296YKTCndcqweW0JOUprXkJ6bAyCvYKTfgDMx+qm
         ck7PsLkZq2qHKaKuzE8xj36hNiQgl3mV9e2n9oXFPoaQV+Llq++ND+jplWfOcwSfWiTo
         8gEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=As/pP/Wl9lgSZeirNEJQtG+sKd/tXccaEi6RDRuHzhA=;
        fh=pNg42xRjXJ2nozx86lIjmAnwzRZLoRUrFvp+r4KjLr8=;
        b=GIyOUxGTsKOZeGITDV3t5eG2hDtDIES51g7fPoJI2IhVxkyOtS/xT1U32PHIb0RrrO
         t4M62D7HNKdEO5lmtHWaKqF1OLAI8F+lWIWGoPMPSSP7AzDAbZQgJv69n/9R4AxvKunP
         DUbClDqri3urQUm6P9GoLCWEG8qcIiYFPskrZ/0SJfsMquKucAcASS+s3FC2ipqNGucD
         ixkj+oZRB5jgBaueJONLYu9m9xSivzm8aXCgSFq+y89fsELeG/krRqVPAw8ctOfyveEC
         aXhT+t1eSjy7KBMToaKN+lLytPl8D2l/xWTdH2QyISzGVCufmDmUArzBBPUlhuCoTMdk
         eQnA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194457; x=1781799257; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=As/pP/Wl9lgSZeirNEJQtG+sKd/tXccaEi6RDRuHzhA=;
        b=jlJQnBrkoNWUMMB8lbKgO4/sWvJwRk9nFp+u5ye7fHkCw3GuibOT6pv+M/SUvZSFSo
         ziHsDAkZMuQHwDa/zuZrFDDEukAnxzdTY6VsrVtajiVTBoBXGcYj6C9utMGgcR01i4lA
         7qz9xS4M4q8T68aU0o0XtbFO4O8+0sB57XmM8RlD4BQ87mi9Z2PZCSr7T/6eWBeZNth7
         ixMuj9sLu7BDKm7KRTf/MsXFyqkvi6UGfYiEMMMbaz9u71POpjdjOmhQUq0qWyToDycS
         qMHc/4lni59axPykvTqb9Mle8N31pIoYidDRlpCF1wNXDtOy/AXI0wNrCpBAj+pLDI25
         9gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194457; x=1781799257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=As/pP/Wl9lgSZeirNEJQtG+sKd/tXccaEi6RDRuHzhA=;
        b=GciCD9WVUuILLpWdrdVzmv+myOVyaVXbQE14guiLQSiiTwt6a9+HDrlp1/NL9RlXzF
         QmiijTffTs2pUgY8IX1rOYucO0yQZJ3D7ImWAb9eN3z7Jnpm+x3gsIfelk2lliuvWJ/1
         PJ2bxOP65afL99J4oOQHojkonwKRhb2TM2nTo/9dLqzJUxekTVYHbDXv0W49uqZM+mxl
         DOIg8HhOAZibai5b3LAsW0UylqikwGa6F5K9Z1/ax5Sd93idSU7yJtzzmWC3uoVEhdp9
         tqsOugApT/CXEr+4MkM0b63YBuAi2Z23UKKjz4/m9T/n3KkZ4DKND/LYb39x1R3vQper
         49/A==
X-Forwarded-Encrypted: i=1; AFNElJ8paVhUPpIJhHRtAibsmNd0g60YV/TF4KYocS4FenIpg+RvZaYunwSZ0fCyreEGz7rvf0aHJVcz2kgqvCDMl70W@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/RW30Gk5qkupTrm8nAFAm7h9Mpi16oAyV7tzT80g+BE2MWAi5
	XUm1pefzqzsc5jh+PfWCiIU0FJEYtPO+Shb0N6hegNTq1WDQsjkb5VK8s1C8/IhEeMKLQh4pmnh
	ciar6ouLJW/xLBxHo5xpBQBkllZyKq+E=
X-Gm-Gg: Acq92OHS8e+N/Ta19F+fvmsfsFRxnyMd4Iy6RQ48CvGAe45tA9T81uT8EakS3Vsd+ye
	I7am+3VrNPAumjcCDRXBGSB5ld225OV5rvy/Wy/9HEtXl1Apq6sUgaXfrF3cbK4KBoTnZYUTriZ
	nrabht8q1hknSCNAVJKxHsPmucmnpdYrjNaOA9Q6zeODrhW6HC6JStbfJOjjDF+sqyeJf1KcpyN
	L6iqSSXPhlObsxkppICa0pkLR5G5O87vXlRNQkvUDpQPwdy1YXlMw2wEQDgVAzDo8bXbG6g/5w8
	6cA5wxQcoPCsUC21t7lX8wCtxhaqVesTjS29fckQoC9BYlLYr6i6vfWAU92jSm8/gAwdgbdW16y
	Ztrv28/X4QQLMh+OEMXjCA3yfbrQ0QrTiUFXFaDvin5E1Uw9j9CnygsNIbRpZ9/vg/xpF121vS0
	F4VwA=
X-Received: by 2002:a17:907:7ba7:b0:bef:1e83:8228 with SMTP id
 a640c23a62f3a-bfc87c0f243mr220203466b.39.1781194456320; Thu, 11 Jun 2026
 09:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260611-mt6323-nvmem-v1-0-b5e1b9ce51f2@protonmail.com> <20260611-mt6323-nvmem-v1-2-b5e1b9ce51f2@protonmail.com>
In-Reply-To: <20260611-mt6323-nvmem-v1-2-b5e1b9ce51f2@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 11 Jun 2026 19:13:38 +0300
X-Gm-Features: AVVi8Ces8T60xoHtEoplh69CdNS4vvYPyDhO6krvEnoKRWh_ilPPLEaS_PgToaY
Message-ID: <CAHp75Ve-+-xaWoktFO_qG1Xkyzh7D9JsBFw_qH9zcUXWhk_qNQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] nvmem: add mt6323 PMIC EFUSE driver
To: rva333@protonmail.com
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_091419_096388_0D5ACEC0 
X-CRM114-Status: GOOD (  14.95  )
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

On Thu, Jun 11, 2026 at 1:21=E2=80=AFPM Roman Vivchar via B4 Relay
<devnull+rva333.protonmail.com@kernel.org> wrote:
>
> Add support for the EFUSE controller found in the Mediatek MT6323 PMIC.
> The MT6323 EFUSE stores 24 bytes of hardware-related data, such as
> thermal sensor calibration values.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

...

> +static int mt6323_efuse_read(void *context, unsigned int offset, void *v=
al,
> +                            size_t bytes)
> +{
> +       struct regmap *map =3D context;
> +       u32 tmp;
> +       u16 *buf =3D val;
> +       int ret;

Perhaps reversed xmas tree order? And it's actually better to see
assignments first.

> +       /*
> +        * A manual loop using regmap_read is required because PWRAP is n=
ot
> +        * a continuous MMIO space, but rather a FSM that doesn't impleme=
nt the
> +        * necessary read callback for the regmap_read_raw and regmap_rea=
d_bulk
> +        * functions.
> +        */
> +       for (size_t i =3D 0; i < bytes; i +=3D sizeof(*buf)) {
> +               ret =3D regmap_read(map, MT6323_EFUSE_DOUT_BASE + offset =
+ i, &tmp);
> +               if (ret)
> +                       return ret;
> +
> +               *buf++ =3D tmp;
> +       }
> +
> +       return 0;
> +}

--=20
With Best Regards,
Andy Shevchenko

