Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546BEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WXfhZCiqVgcV7ok5vlycj7VwBsplyGEx/STby8IVdo=; b=rtnv1aCSNEtzrysofGxCaLhSpH
	g/EdYYSMnj04WUHUO/XPKPFbwVhTms4USyT2xC4Srq5aIFqXtnWz207gdiejbV9culqCYqSM3nokn
	6YqHuYkLBTQwOHczYSP6zFnroJ6qrZpHwBRUvVDoKUb/c8p2jXzZ+ndbel1/URxNS2DhpvcCRgefP
	wOrJa6avPvX9UZQ6OokHPxjNhpyKw7ayLxpctS9ZdmIOLOBGwYFr/ffq/PeiqtrGb/0kKR9GCqFXA
	48vp7ULIHZEwUsPEQTs/N6xdxf1c9Gw/zFoz3hFakJlI5lorjdGtFDR751zZie0wVi7gJV6aAZdd6
	EIpmwTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCvP-0000000BHtN-0Mhr;
	Thu, 06 Mar 2025 15:14:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCto-0000000BHkr-1kWK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 15:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=3WXfhZCiqVgcV7ok5vlycj7VwBsplyGEx/STby8IVdo=; b=S2qNA6yLmOd/9MALotPSe0pb6P
	dnoCmb9BlMMNaoeVKg7xK8o2G2nZ45yfHSgig7vMHoDh2dvMeVscYINP1FlV7gn0Q03cMysxjvfcY
	9oUlMCeifJChriuhy8I6hx78fhAV3VhawYHnLahkEvRKgKDbu0RjaV2Ji6/EHyG8q8sJqLJh8g9gY
	U2ylFrHsiJlfmtXGslGY1WJss3zsyeWu9o7hKR1VdR0zD/5rtmzwFZquJ3wxJFSMVW5E+Det/SRJy
	qHQxqkDKS2DFmUosQsae730NoYVlggLTeUW2YcbNqBBT6kokT/q5QrpcziG+8czTyhmWgoNssYoN/
	pIzID+7g==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCth-0000000ANF6-32d7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 15:12:34 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e4d50ed90aso940772a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 07:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741273933; x=1741878733; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3WXfhZCiqVgcV7ok5vlycj7VwBsplyGEx/STby8IVdo=;
        b=fPC57IdJOxLhjqqPjwnYcR4Eh31Wb3WGb06IWdTfJJA7eC5Q1WMaS4wF5UmUfxAL6/
         OdWgz2AMvpmO1PQFm//7f9jmlaHVnv5N5dYl46tIVBIpUfQ2mR9okoaY5GwpKyFpaCmT
         dB30OEB2WCtbPkX2eD3XrqvIWxogxnc/zXTd6ZOqeiy+UT9Rf10kWQE5ioYG/yE4AL27
         9x5Menx1E4qhcYgmordbaxP7AkGIFbOTg0Rs9K2hQUFtw0+VdveKBmFbHO9ObTS1kPVN
         O+RFv8mD0aTN/sxZOS35mLOxbUPFDiwgQNY5IUDwa8YYj1jznRZy7zLuFLvZxqqVUpMK
         xASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741273933; x=1741878733;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3WXfhZCiqVgcV7ok5vlycj7VwBsplyGEx/STby8IVdo=;
        b=vAydEPDhS08jCegELA/rLMId55hJglO6g7YIza4MbxIiKEa7KgCx1gK6efL17KZsZ4
         luN5W66RkOeFAfFG4sVdwAkK9cK22+2OdcOCsyUdlUMqvu5TtaK7gNY8oCN79r/asqeC
         HORigrNTfNLm3YVDsRoBYan6Od9F4qCqA21HRAjN8UGfmhr/bm2brqq02WAQjVQJM3Je
         p9FCJNLqOh1qR6/miBiYLR2IlQu58aGEvBMhAk4fdm3ddOXgMA0dSbwFzLwPzYQOj0bX
         JYMu4R/IfGJKcJGugCaxN2DuCF2EPaaOwpZ7OFVQr1GgVuYie9ObPkVozokvK1yzgkmj
         MDBw==
X-Gm-Message-State: AOJu0Yx4O62yBz7IG2gKDBZSHAxcINh3KIvuRvnU6JPS68IiNSxTe8Dw
	iWDbRoqPUl0Ohfl1sBPR+ZUKDUG4DU/NFMIIBhdSYbU57roKkUbZI5q1jRf9fUc=
X-Gm-Gg: ASbGncsFDYUdbuWQiVOAdgKUwAFWRcvREf+xfIrEnBpyVbEw5PRV9Ldz1ZaUx8fXBlu
	rlW6WeuDxpdeCcDezGsNGDLlHz5X8BiElvcuAxj7NMzh2vMMCU++aaIBnpo/97DP9IEzEPdogmi
	YYbtRNMXyh0RGRl3o6rf+sEe7cZdoTULID8taCv9sZyS8+03ss+YaKj7wNBjpssEd6Mjk85g1va
	IMBdE5Ls2Xa9fXqVxonCwLJ5LXciPgp9lNAotoKvO9sfzXIcgXLaY4PxTKFaxEYHps8pKITp32u
	X0HvQIz25sLmsJRDDhwOuHWg12UlQzs2YSCTo1/1O9kYFTBH
X-Google-Smtp-Source: AGHT+IFDRd2HtWQGN+lgCyn+h+CpAHDpxE2ZJ3AjyT5NxJhCZf4locWiqN2iafEdYoLlz6zCbZ2aZw==
X-Received: by 2002:a17:907:3e13:b0:ac1:e00c:a566 with SMTP id a640c23a62f3a-ac20da97b7amr825015366b.45.1741273933241;
        Thu, 06 Mar 2025 07:12:13 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2399d4802sm109953966b.175.2025.03.06.07.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 07:12:12 -0800 (PST)
Message-ID: <4f91fe1c5eed00e58a3587bceaef3e5e2a1124cf.camel@linaro.org>
Subject: Re: [PATCH v2 2/4] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Thu, 06 Mar 2025 15:12:11 +0000
In-Reply-To: <f7c0101ff26ac0d4ef70a374ae31ee5d23b3c8fc.camel@linaro.org>
References: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
		 <20250301-pinctrl-fltcon-suspend-v2-2-a7eef9bb443b@linaro.org>
	 <f7c0101ff26ac0d4ef70a374ae31ee5d23b3c8fc.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_151230_022924_71DD95F4 
X-CRM114-Status: GOOD (  10.71  )
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

On Thu, 2025-03-06 at 11:57 +0000, Andr=C3=A9 Draszik wrote:
> On Sat, 2025-03-01 at 11:43 +0000, Peter Griffin wrote:
> > [...]
> > =C2=A0
> > -static void exynos_pinctrl_resume_bank(
> > -				struct samsung_pinctrl_drv_data *drvdata,
> > -				struct samsung_pin_bank *bank)
> > +void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
> > =C2=A0{
> > =C2=A0	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> > =C2=A0	void __iomem *regs =3D bank->eint_base;
> > =C2=A0
> > -	if (clk_enable(bank->drvdata->pclk)) {
> > -		dev_err(bank->gpio_chip.parent,
> > -			"unable to enable clock for restoring state\n");
> > -		return;
> > +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> > +		pr_debug("%s:=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x =3D> %#010x\n", ban=
k->name,
> > +			 readl(regs + EXYNOS_GPIO_ECON_OFFSET
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset), save->ei=
nt_con);
> > +		pr_debug("%s: fltcon0 %#010x =3D> %#010x\n", bank->name,
> > +			 readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + 2 * bank->eint_offset), save=
->eint_fltcon0);
> > +		pr_debug("%s: fltcon1 %#010x =3D> %#010x\n", bank->name,
> > +			 readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + 2 * bank->eint_offset + 4),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 save->eint_fltcon1);

The indent on this last line is a bit off.

> > +		pr_debug("%s:=C2=A0=C2=A0=C2=A0 mask %#010x =3D> %#010x\n", bank->na=
me,
> > +			 readl(regs + bank->irq_chip->eint_mask
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset), save->ei=
nt_mask);
> > +
> > +		writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> > +		writel(save->eint_fltcon0, regs + EXYNOS_GPIO_EFLTCON_OFFSET
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + 2 * bank->eint_offset);
> > +		writel(save->eint_fltcon1, regs + EXYNOS_GPIO_EFLTCON_OFFSET
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + 2 * bank->eint_offset + 4);
> > +		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> > =C2=A0	}
> > -
> > -	pr_debug("%s:=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x =3D> %#010x\n", bank=
->name,
> > -			readl(regs + EXYNOS_GPIO_ECON_OFFSET
> > -			+ bank->eint_offset), save->eint_con);
> > -	pr_debug("%s: fltcon0 %#010x =3D> %#010x\n", bank->name,
> > -			readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> > -			+ 2 * bank->eint_offset), save->eint_fltcon0);
> > -	pr_debug("%s: fltcon1 %#010x =3D> %#010x\n", bank->name,
> > -			readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> > -			+ 2 * bank->eint_offset + 4), save->eint_fltcon1);
> > -	pr_debug("%s:=C2=A0=C2=A0=C2=A0 mask %#010x =3D> %#010x\n", bank->nam=
e,
> > -			readl(regs + bank->irq_chip->eint_mask
> > -			+ bank->eint_offset), save->eint_mask);
> > -
> > -	writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
> > -						+ bank->eint_offset);
> > -	writel(save->eint_fltcon0, regs + EXYNOS_GPIO_EFLTCON_OFFSET
> > -						+ 2 * bank->eint_offset);
> > -	writel(save->eint_fltcon1, regs + EXYNOS_GPIO_EFLTCON_OFFSET
> > -						+ 2 * bank->eint_offset + 4);
> > -	writel(save->eint_mask, regs + bank->irq_chip->eint_mask
> > -						+ bank->eint_offset);
> > -
> > -	clk_disable(bank->drvdata->pclk);
> > =C2=A0}
> > =C2=A0
> > -static void exynosauto_pinctrl_resume_bank(struct samsung_pinctrl_drv_=
data *drvdata,
> > -					=C2=A0=C2=A0 struct samsung_pin_bank *bank)
> > +void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank)
> > =C2=A0{
> > =C2=A0	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> > =C2=A0	void __iomem *regs =3D bank->eint_base;
> > =C2=A0
> > -	if (clk_enable(bank->drvdata->pclk)) {
> > -		dev_err(bank->gpio_chip.parent,
> > -			"unable to enable clock for restoring state\n");
> > -		return;
> > +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> > +		/* exynosautov920 has eint_con_offset for all but one bank */
> > +		if (!bank->eint_con_offset)
> > +			exynos_pinctrl_resume(bank);
> > +
> > +		pr_debug("%s:=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x =3D> %#010x\n", ban=
k->name,
> > +			 readl(regs + bank->pctl_offset + bank->eint_con_offset),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 save->eint_con);

and here

Cheers,
Andre'


