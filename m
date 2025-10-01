Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D839CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qctZSXMhs2xeiqfjqCMk0nsDO98tXumKc7sHsixp5Vw=; b=bwRtP2G+om3qhpBmXC04XCBoiY
	Cs6EmM085GT3jPxyZ1mCRXih+d7idF5MmlUEbICfBOsvqr33tKDxnY+qufJa47Z56Rje3zesCn7UA
	b8S1xkEvv6CF0IiniH85T0PFfgXdZWIweOPAqrWvc3oDrTjgnWjcPTBAXTWzw7K9eaSO1nAKrW2zt
	VUos0eyNwzJT1/5Odcg0ARh9o9+eKMWmAlcASA7xYBpWWwFdQ4toJJqn0ngbYQQO2WUaUOEYAUmt5
	elo6wMYcc0Apv1qOJZwVRrke18rBSsD9t8uLgi06cGZFL9aaCkBlkCzNS4GXUgFHSkwjtE4FrI4DP
	vFxaVPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3vDB-00000007Qxp-2HKg;
	Wed, 01 Oct 2025 11:41:33 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3vD8-00000007QwM-2pdB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:41:32 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-57992ba129eso8549971e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 04:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759318888; x=1759923688; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qctZSXMhs2xeiqfjqCMk0nsDO98tXumKc7sHsixp5Vw=;
        b=VxiU7EW0nrdZbfsNJPNxb87JPZf3JGprDrnTUGsYBOLW2W2OBIjB0vUNHuPIsXU8AX
         BfQht5jc9KFxOUeZhk1ENuTfI+PFPlInB4u9KYHSR3MUIw/71GEkcXAT+oWKaPjTam2w
         xujUcPwF96aP4X/1TZyS0gzDnaQsXYerDfctNZpDxUoh69g+uwhqjhicT86ALhGKo/p3
         Qpm2OERr2XzGTlzYsXJcTuxOoVw5VXADdD5OTkB8+kRJ/bGnNAjjlppfKEbva3Wgcw6M
         bwRrYYWfXj1spC3nV5CZ12T/Y+DHRvnPJea4/tw5OdPCsH2JpzBnU2CT07IElDfzPGv1
         vqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759318888; x=1759923688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qctZSXMhs2xeiqfjqCMk0nsDO98tXumKc7sHsixp5Vw=;
        b=EZecaYaOnz0ihDlq20g5Q//bfQ7FGeueuHCMKzts3QxhX5n5ZCvzTff0NwLpNstmRp
         KUx/D3eARdLlN9VYop9cvnZoKO9zoiEL8bEKnoMGiBDxuL+//+SbFTkqYMYVg1H1d1Vw
         AC24fVL6BAxUjvb9qkfLcVWk05pu0A/poYhIGjd022nzC085XhEHUlFeCU8JAz/W0mHX
         o19FTDAzf/777aAVybzrMKClYdouL+9jWSjMGvHrnwMrKgFm5hP07k3OKjC3wrBpLEVF
         OhsiGeAr5T/ClLOjk0CMIQ43s+gYeAYS8J/ALY3r96qbnNUPT13oRo8NA1pvCdKap++S
         RN6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUN6fO1ak0T4y80zVDjWoRCcyXVKXWZk1LpoA0F8M4hTvckXPoo6r90bYWTHHYWizLpssqxSrbeTRVSkUAgTA8w@lists.infradead.org
X-Gm-Message-State: AOJu0YxGWJNAycvOWCTq++zWd8asKHaZEcYclwCU0NvXCL4SqT6XQFGG
	29PbOSn2qhxLVbg86p3pQ/P0QCWN8oVKLpCjdwlbvTTudRh9W8GEA11QCMd3gz4pkd9MGHNkNCx
	EZ7yLQnI1A5MwGsZ2B6a4pDQ2Lww3j44UCwe8FXx6vw==
X-Gm-Gg: ASbGncsK3u5cM3ZBRfrPMJ+lX6CGE4py3PdCjH3k7gSyAZeKjuvp70WYAXm7iV7osyp
	f/PYNpqpOXs1UUwHK6hkt90AcAco7CD+DDbQR1WYODj35x6ogvjRD+VDYtDiDuqkKasl4ff0KPk
	z9qmEWB5lgDfO8+Zx6/LP6PBGyLINl63bfCZhWrJVWZf2cAzH0Jxw4jhReT5aq1wLg0HdwlGnPl
	YVxI5lcdBvYNLSdEp9BjB0XTeW8RHo=
X-Google-Smtp-Source: AGHT+IGh0WRelayFPhpsyMTnu/QogCxki2FOJNlaiws2mA6RsyILjodYZSp8V+kDGxU8+sBc5yZrKN2O5uWz8LJyuPc=
X-Received: by 2002:a05:6512:b12:b0:581:75eb:cb0b with SMTP id
 2adb3069b0e04-58af9f4df8fmr956846e87.48.1759318888565; Wed, 01 Oct 2025
 04:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org> <20250927-rda8810pl-gpio-fix-v3-1-3641cdcf6c1e@mainlining.org>
In-Reply-To: <20250927-rda8810pl-gpio-fix-v3-1-3641cdcf6c1e@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 13:41:17 +0200
X-Gm-Features: AS18NWBXAbHjbTdnQXpt6IR8KxMLhgGpEzULsJ3KqRHyjfQNnQcsJ6eT4En0sws
Message-ID: <CACRpkdZD+QFsFSTL0c6HbPp_4op2axjpZRL=y-KEMw_rNpxgqA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: rda: Make interrupts optional
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_044130_723373_E5BAE4E9 
X-CRM114-Status: GOOD (  11.67  )
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

Hi Dang,

thanks for your patch!

On Sat, Sep 27, 2025 at 7:02=E2=80=AFAM Dang Huynh <dang.huynh@mainlining.o=
rg> wrote:

> The GPIO controller from the modem does not have an interrupt.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>

If the GPIO controllers are so different, should they not have different
compatible strings?

Maybe add rda,8810pl-modem-gpio compatible for the modem
GPIO then?

 +++ b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
> @@ -41,9 +41,6 @@ required:
>    - gpio-controller
>    - "#gpio-cells"
>    - ngpios
> -  - interrupt-controller
> -  - "#interrupt-cells"
> -  - interrupts

Then this can be conditional using an if:-statement such that
it is only mandatory for rda,8810pl-gpio and not for
rda,8810pl-modem-gpio.

Yours,
Linus Walleij

