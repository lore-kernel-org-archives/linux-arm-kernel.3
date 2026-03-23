Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE3BEC01C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 11:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IJUWFVuRtnRrcxOAe+qH0nHesEXlr9bnFCdCu3nBCU=; b=r0aSQxaOfmaZCr3fUyHexBJLs/
	5yY/TIwFwOIYL+aDnznk26p353lr5324yTAMdjsjTABGOti5PgXFoS8LQRELGYV2Xg9Z+qaML3r4X
	13SIMmXmesPJJuFsbgxXMGj2FojmfkCvPiXnBlUqhl13DS4/xL8Ac9S+CkAiKVIPBCdGP7BuZzIzx
	Lsn/+WCWgb1yctVrUOwZP+o0aSfdhg8r6Oh5PV7m4dAmDVRRR/RSWK5d/53j9GPbCT0QeYknQvxYU
	nwzZ0/WALjiuy+LMDOcZ1QrNSc4xm0fr1w4+ZXZUdj+yNIWMvHR9cDe3dz+WDR8FNB2y83bHK1iCi
	SONHNIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dEq-0000000GbBH-0Qvs;
	Mon, 23 Mar 2026 11:14:28 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dEn-0000000GbAW-0erT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 11:14:26 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a277379151so1824248e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774264462; cv=none;
        d=google.com; s=arc-20240605;
        b=HFv8tnW+hgGoIzLe2g8Hx+zilz7qxlTV39AfEOFh5uHnZiPv7IzeI91TLk6VjFTHQv
         G/tv9OZ38iiDhHPV5a/OZk3cmgienV34Lu0QDK09A1F3YojoCc6orGnp4HxMrj2lPyOG
         WpuhOGQqS6K8Fd8vklG9cnmyi470VB/c905OSa5HVNEfCJ95S/GiTPK4GRj/fsOW8Md/
         uMzIWVmKIDeQFKggssXmJ9jpbWNbQvsjD3kiUN9aJJGVQCeHOj4+Jrmk7cdvXdK2ymAK
         YdDv1B5gmB5xrWPKJ+U0DVL2YU6epUuMptquOppfxAEU7+f7VooJithq7yXqaq12t1GE
         rPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+IJUWFVuRtnRrcxOAe+qH0nHesEXlr9bnFCdCu3nBCU=;
        fh=5w813dBG/5IErWAPwMvGCORVbvc0FDi1jVgYyBStjdQ=;
        b=ars8KuXHEqB3vg9Q52P/OrIrqMAuV9XcYXjpooKqAef/NoTBIgOdyRT8yU81L/bR/i
         kMjUWHRYvkjEAY2wouX8brQ9QksM61LukdPfJE1S78zDLG4idXcv2pFJeF/TvIz1qJGf
         G+8wE1yFVtjr75y1eiU4wEJhj6dAW412+B+jnEs3J8neAjRnitDBlqqmd9ju2kaFh+1H
         q8BfGQWsP1xtz0MxeJo2cMaCu2rG7GDBO4Ki+CA6Q93Iftv1v30jAUsE6UDCvYrhaPK3
         /JyZs1LnGpGYacKcnnzIS7GiV1iEbt5jizBxbIL62ELqR7rL4z/zLXHnpTsuaoJbntSj
         4yIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774264462; x=1774869262; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IJUWFVuRtnRrcxOAe+qH0nHesEXlr9bnFCdCu3nBCU=;
        b=Tqq0ieyL75UfuOVlMyVPJGmrt15WxhlmaCBU6Y+fNiXgmlRV7dzPAY4R0GK8f1Mb51
         FlQdeR3ckrqrD9zKIC7sE/rFmm3iKIpdaWT5EHT1SAWdCcxStu2ffnyy0EbvbFcsq7aH
         imV5PcIFZZ6TXSGgbBJ1rvgKcJPWRoKTTH8NitvP3m689bQMcfWMbsfvZeou1FikNo/V
         4yZGtgdOm1yFFg8eiac1ndVwYSQThNsNOtxj+VRvyw6ZYLRxsMbnDFVinyjqmx8u2eyX
         Q4X/OCGWBVFZENYu7o3F6wMFbvHn7wvUFdcegql4cBsSq/jNbDaTvXp58nr56VMqJsy9
         MHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774264462; x=1774869262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+IJUWFVuRtnRrcxOAe+qH0nHesEXlr9bnFCdCu3nBCU=;
        b=COjaG97kXP5nHAUX0a/oq59wkcrTxqXQnp/zUWITmqIypCwmlS16RpqJyL1rnEjCy6
         c2q5+c9qwR1n65cpKoid/LVFiDAARkYzzGuxTAv69AyMWhCCHVO/lcNKlbNcSNWvk/O/
         HvJY7fJFqLMZ8YqW737XbXjSDbRmss1UJZzsOtUPsobKtNz6fdBOJ2GNPw9tiUh5r8MJ
         Yusls6NIaNYVGJIhu4pjmv13V3MbFkmMyrt3S6qikGbpKhlHe459XV9KD/T0k5+KAyaB
         zHglZHOSSsD1m7AxaqlmXcZvpPKf0ip4x8m1AakKJzZBK3ayq7iYUxcz//MdU+r4+wXL
         PD6g==
X-Forwarded-Encrypted: i=1; AJvYcCWllYKWgWdYbQ/vB3a2u34+TnF+Lz+qQSddaeYFUsOaqGDiWxyMBhbPrxFMkv/kA1XZ1hwff2CHtdZeKpIGWFPf@lists.infradead.org
X-Gm-Message-State: AOJu0YzLbLyqFgK/4TAUGdJaf4bzPwMqs2F47ooRrf2gsEJZqEaZVw83
	AwW++ntWwWBBRKgooHe50KMKB6ORIW2CaTMe7QYf9qRbfOCIuPu9zf3EgRl/DHZ0y67CeZJ+RzG
	Y1jWowfrBJNBbrF8ioy2C1zTfLKE66QQiYbxyyoPFqQ==
X-Gm-Gg: ATEYQzyarMl72KzcCJ9prJNpd2BlG6Bx+Jm4h9f18R9qtFlFnOMoZD84nuGV/w0ProJ
	IiehYB/4IYSKvz2xJwy5jvj2oRjUAKxu33amII5zl8ufu02qSKm1Zt19P/NESpHYF85hQzWUIqB
	kLp3Kmo4RPPXaS0U4tfbewOgZzdEGOwg7Dv0CNXlWI+igXYgcjYbnoLm4RKnYQp3o0AMVqoQnxp
	BqezvO97O+fqE4DLklfPWW2HAmlTTr14RqW2upxZJCN4ViQDCKyH5tfq6dFCpxq7gmBmC4xoLrL
	iIo1cN2O
X-Received: by 2002:a05:6512:10cf:b0:5a1:2b2b:479d with SMTP id
 2adb3069b0e04-5a285b6125fmr4577456e87.31.1774264462090; Mon, 23 Mar 2026
 04:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org> <177409907930.268981.5882592990447577348.b4-ty@b4>
In-Reply-To: <177409907930.268981.5882592990447577348.b4-ty@b4>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Mar 2026 12:13:46 +0100
X-Gm-Features: AQROBzDb0FyhDsEJ4InmRtciuv9Wo1DbFap7YBMqRE1Hh3qfHVm60c1Z9Vi7vPA
Message-ID: <CAPDyKFoz-sm0pfvn5iSYFY0mrW38vaGRZsFvrVPqsv7BsYxeWQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v8 00/10] pmdomain: samsung: add support for
 Google GS101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_041425_279667_DD35104D 
X-CRM114-Status: GOOD (  18.13  )
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

On Sat, 21 Mar 2026 at 14:18, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
>
> On Wed, 18 Mar 2026 15:27:45 +0000, Andr=C3=A9 Draszik wrote:
> > This series adds support for the power domains on Google GS101.
> >
> > There are a few differences compared to SoCs already supported by this
> > driver:
> > * register access does not work via plain ioremap() / readl() /
> >   writel().
> >   Instead, the regmap created by the PMU driver must be used (which
> >   uses Arm SMCC calls under the hood).
> > * DTZPC: a call needs to be made before and after power domain off/on,
> >   to inform the EL3 firmware of the request.
> > * power domains can and are fed by a regulator rail and therefore
> >   regulator control needed be implemented.
> >
> > [...]
>
> Applied, thanks!
>
> [01/10] dt-bindings: soc: google: add google,gs101-dtzpc
>         https://git.kernel.org/krzk/linux/c/10084aeadadfab72648f6ed1cc78f=
7cd87b861ba
> [03/10] dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into separa=
te binding
>         https://git.kernel.org/krzk/linux/c/3ec3c42b426fe5e2b48ff19c551de=
c50bc78788c
> [04/10] dt-bindings: soc: google: gs101-pmu: allow power domains as child=
ren
>         https://git.kernel.org/krzk/linux/c/c8229a5160eea145b796f54317d6e=
659cec9b080
>
> Best regards,

Usually I pick up the power-domain related changes for the DT bindings
and host them via an immutable branch called "dt". If needed, SOC
maintainers can pull it to apply/test the corresponding DTS changes.

That said, I am open to whatever you think is best here. Perhaps it's
easier if you can drop the DT patches and provide your acks instead or
if you can share them via an immutable branch for me to pull?

Kind regards
Uffe






> --
> Krzysztof Kozlowski <krzk@kernel.org>
>

