Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A85CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=881iDkPEZh85ObsSmrMAZ48Htve0Wj9g+gfovyJ15uM=; b=WOrDBaOpGAYrZfWpdLlDtFTHNx
	Mbj1woouDq0+HifNva04tZq6U9PV+une4h4ils9hsLL7HboZIjWTYFR6NgNCLUtHH+iygYaBxoXPu
	6NEHOZLbZdFOQU0q/s55HOFGUEzKS2VYj5WmbO97n3m2ksJDp858pPEpZR2OBtpj3OxB8juj3NIPu
	gTWx6FZNdMYlZ0Pmr4siOf1E+HlKm+GGd2ABtM4+VhaXo8d76qsUiI5GO7Gvu+lmOEfa9vD8s/Lwz
	YtRbB/JxtJGRUiEO34/phn32f7DS26jIo4S4FcjXiO2PIEEUvbmjtJNJG5JEQi1z8ZFL8thyDMW+t
	DCb2fsiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVKr-0000000EpSp-34GQ;
	Mon, 27 Oct 2025 22:05:06 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVKp-0000000EpSP-24Jb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:05:04 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-592f5fe03dcso5895543e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761602701; x=1762207501; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=881iDkPEZh85ObsSmrMAZ48Htve0Wj9g+gfovyJ15uM=;
        b=hXw5qXUJAuMzIGKU/Tmc+PupKxRk+rVU+PggxsAX1yp7jQhZ9WpU5kfL0gXDTX41db
         ydYGb8/6TipkntoCPEXAnNQZcNqV/TvnABPCUF2lmnTNUZFYc0kXPotzRYdcg/verE1G
         dKQ2T41F+c39IB/RUdZjF3Pxp5pF7QSWyc8IriXo8ejfaFRr19z46gbElEuU8ZIZMFS7
         h6UWDddrOEz49vFoiOQdFWWeQAQ3Ey/H0CynF1dzls6tLK5nS0fDjrEOMLzFgxb+jkto
         E1ouk7cdMQVCbWtcixNAAkqJx0kdKr+90j8DGWrz2jauFncIuUjuXv/6H+ziU9rNMPkn
         wAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761602701; x=1762207501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=881iDkPEZh85ObsSmrMAZ48Htve0Wj9g+gfovyJ15uM=;
        b=IIXwvsYQxTz4t357NsbFQ1gS/PrwjnrfrtZspUOveGvXQOaeAtJAIRGuoRbLyjVpLD
         GymBBqo/lwXLiAFI2ii7yF6Me3H+jHANROA6jdGgkgfUi+vTAonkb1sUhrk3pWtB9zWk
         P/iJmKxuuXcCB1vv4YyxycOYxmhkkscXOWoxB7yCoG43vNS9dCAfIHMxs+OFYPcokAU2
         8OCnVghv94SMJCeKLEStunVsVKtlGP+3ucXJw1E8Ve4M8jgBFCueohmaFE9geZI4lN0F
         vIfZqGJpd3Q+npRGcBj3S0oNaksqqfrNmwQo0uy/P3JHb90gKndIxs3Ad0WIMjG0eZ5/
         uUFA==
X-Forwarded-Encrypted: i=1; AJvYcCUmFMNrdggD9XXsE+j+tMWssFTmsvsZbD7fB6aKAiIxkBMVFATtiaOIqJyZQNSSRZuwbDbxGeERKXA//um5dcj6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/Vlu/RSr5W8tDbjUkwGzlxjYszEzboLzqNP2KvAwB3muzmkZU
	B8WRNBKif1nPvHdsq2lEE76mIk52UxifT8FOlyQRbp4AuNu9UArASNL5cCfGAutcFIT105rko3t
	cjeEvfDece2lFhEXZef3NNjCWcQ/CY1t5yVRR3+g2Aw==
X-Gm-Gg: ASbGncsEqcgZvAhD+LVST4nhyodSVCzCKAxAONLRTa8JDtXvN0bmYXZPGULRZNpfbzz
	gtBjg+KEQSROJ3hFAxPLDbnCHJY2VxBlXdf0HZwgQSwti7CNDmOaxGfVSdVC8RucGcQOUOSX/x6
	Lv60/M6mOffppgeS20W+KQbXEDsTS12Wu7twAxmsE6+R2RW+v7pue6y+PpIm0TbQGeEK+Jl63Tl
	joqcOKxqQIOpoQHRd0CjzfW8Xyisf9VW5a4Y7ggW0k7F3tkMqb2RtwOuYZJGoAunDKSdGs=
X-Google-Smtp-Source: AGHT+IHoUF4RHiTK1ixTbcpPhI4tBBI8uNgdSo0LDy74WVyTiTCN+lBwjm/Roz3VFn6Yvs6CWMINeSQ/2LwI3eIrZ6o=
X-Received: by 2002:a2e:ac13:0:b0:378:d757:d307 with SMTP id
 38308e7fff4ca-379076bc3a7mr3168981fa.11.1761602701023; Mon, 27 Oct 2025
 15:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-2-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-2-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:04:49 +0100
X-Gm-Features: AWmQ_bkqvtHBv2ihzMqbHUb5leNu-ZCVXzL1Rr2PRCeRlwPcmd2dgcjDCOHd-pw
Message-ID: <CACRpkdYUt3mZX_KjFps_BSRQVrPcn70SrwEJGKRQUjHq3VXcDw@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] pinctrl: pinconf-generic: Fix minor typos in comments
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_150503_543747_BDCBF66E 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> s/specyfying/specifying/
> s/propertity/property/
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

