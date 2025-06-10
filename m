Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2DDC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJ2EibwYrHKuwkGgy7UaDo0dDOz7bGTb8OT6K/FalDM=; b=LQ1hJlOfHc3dOXAY1ZTl8AqxHb
	mW8XIqe9A6bGyP/x+EgCxiAWIKlDobwLDxDUzsTx4qdsbwn/BgGy7GODG3ej07SYH5vL6IhLTyAcJ
	L9hbyPA4NIb0OWzkmbDZEdqCpqNCZlOCIfN1FFLDhOcOw7h8X/LFol0cCXqsVpVdz3ed1we92/Lv0
	+5YZCrpnJKkFRJNgOTjxfT4RQigA0cXvsotUrQ/16ke4XoRNK4YenDDnd/OQRFe+cmMdZuAY+qk+0
	OVhH6poalm8c/hvB5TJZUeGxwpMas3aJIhUpeJsLVHHlCZvn7n8yUZ+ya8clj2PCTKZusWqj4lNXi
	Ua8x5N/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0pX-00000007INj-19En;
	Tue, 10 Jun 2025 15:24:03 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyDC-00000006n2e-2O4U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:36:19 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5532f9ac219so6245790e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749558977; x=1750163777; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJ2EibwYrHKuwkGgy7UaDo0dDOz7bGTb8OT6K/FalDM=;
        b=iXhOnEmnEEQAvOMNqyWbNni9Qjlrz9ocFUF7PwDLQ8EYMvBS6tm2USqqc9G8M1i58Y
         q8WfqCp3yW9HXC+asA9DX+frc25kxERgRjH+R9PMXca9Z++B5k0Wj1O/A4+hkkmHPrjb
         uYbWhr3wv8WJ+gDxauR4v/xkU3c+C8RgkgPi4b1xpW90Cg3p6O+/mJrWKjjnCQBV4UUx
         P5aCWeuFackJ4duAeV9pLIGSqexbUOHOmK7dQtaIdVPs+NFrzLvZSiQUIEvSes4ubbme
         QJ2uMlNL+UwLooxwsC4DA13egMCPtqeCJOD/Kq7wb8TV2wQB/fLtvaofrRPbhx8SsLB5
         hu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558977; x=1750163777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJ2EibwYrHKuwkGgy7UaDo0dDOz7bGTb8OT6K/FalDM=;
        b=CYlAusUoWScFQ2o8DWR2eILfd7yxE4fcrrAfGMwP/mbd3+02FEaOuCqHNAfLqLt/mV
         1OGa1twdS08EiIcPlq8UvX3bkItaKNW7q6hnZVmkT6+IpWe9VHo3PU6ck/AjAXDRBcTY
         sPlb22amcTrX+E5VdT3Ik/BhcMQKp7ZRk2GK9TUAEhagQkrBH6asZmg27ReDTIktpEbw
         hbij0BXegfa6HzWX6Ec0j5RRvUaEAyRw/qyolcV1Vw1G8bc6PubFblTCX3S8yJup2v5Q
         /CTmCG9sVPvfV+2y5g0E+makr8Jn52U2BoK7AL2z6ImfACs6e/KZK6ulSYJM+Rm+81Rf
         uOmg==
X-Forwarded-Encrypted: i=1; AJvYcCXQrzLRni2NwWZp5Wg1JVd8jPXVd78nVRnXVvx/qlE/YMfMznaGK1c+suAOZYmyO5lsJ0E7Ka1LjmxS+wyGSgDf@lists.infradead.org
X-Gm-Message-State: AOJu0YxkMQBT6lbn7tvi0ZniWan4MmEanE3qivH1l8CbuuHisuiONU3i
	5oLIhj0uwKa8F/Y6Msm6QH/6jw651MffbuxfTy3+54736dvdxLY5D8mm5s5tp1tyY5rpH8qw5zT
	zHGYu8VZiwLeY87Yy9uD9cD4pzE40KZbIzLstp7faug==
X-Gm-Gg: ASbGncumiOmSf72GHo59vrMnXQ2C/fVks2NoM4eNU9uRbmPBscFamUiYeRXWaYt0kzu
	JIZ0kTWVfOB/K1FXHVknKLSumSNkJNGSfa19wYU0syv+dzjQudn0Qirs9BSqpomqqnz+RUDr8Hc
	tuvlI3DM75j/hb19p/PRB2QTEyLHPImEHubab+oI3cjiiz9JduoHuEiA==
X-Google-Smtp-Source: AGHT+IELdA+tq9VR5udoo0SjBqgjtXdlCnUFk1ZiTiteFNoU/sAmnTRRf2Lggd+JrBptHGv6llHTchs9v9E5K8zOTw0=
X-Received: by 2002:a05:6512:3091:b0:553:37e7:867a with SMTP id
 2adb3069b0e04-553947dd220mr757785e87.49.1749558976880; Tue, 10 Jun 2025
 05:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250607135203.2085226-1-wens@kernel.org>
In-Reply-To: <20250607135203.2085226-1-wens@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:36:05 +0200
X-Gm-Features: AX0GCFvyRHimADR81nq1Y9XLD3rNjaMG2YYHVtzY0J60cBE6h0su1u4nLP7Bn_w
Message-ID: <CACRpkdZRROZHK2nr5nx0UzwYZaoTrLLt8CzOtYWOsJg=hKoDwA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: Consider pin base when calculating
 bank number from pin
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_053618_612006_6D8CB36F 
X-CRM114-Status: GOOD (  10.55  )
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

On Sat, Jun 7, 2025 at 3:52=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrote=
:

> From: Chen-Yu Tsai <wens@csie.org>
>
> In prepare_function_table() when the pinctrl function table IRQ entries
> are generated, the pin bank is calculated from the absolute pin number;
> however the IRQ bank mux array is indexed from the first pin bank of the
> controller. For R_PIO controllers, this means the absolute pin bank is
> way off from the relative pin bank used for array indexing.
>
> Correct this by taking into account the pin base of the controller.
>
> Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Patch applied for fixes!

Yours,
Linus Walleij

