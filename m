Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F4BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 02:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzTaQw0I4DCqNdV3XbT1uU84Y8+BcPXmBxbBNcSW7I0=; b=HMkwtp4XGZhnc4rP0zYy/OuIVP
	XCt2vJ0eis9c/332vGxQ+nQuYQzggf9CMSzzJ2vDLwd+1lwokErIoKsrdJKp9id/Fc/a3jJK//Gg6
	WMLalxqrlvwwfH4Nbnb/RIneNpzcnJ5904n4orLCDtmQjjaBgn3nEAdsiLfCOErG0+UTiC8Ocoh55
	t6106Q4JXz/3qaCg48GPBDkZK1PT9KrENhxKNwC2CMscaAoPTpdraeUVDGQzn3hMWLI8KmKgwmfE2
	fVVwbmjjtswF1CwkOpU9gCYK+bBOAYWfb60G92A27phPMXlb5uWZiKG6s9M9/yF4q4L9UoNbQiwPP
	kjPrPrYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPY87-000000099eu-0BqH;
	Mon, 23 Dec 2024 02:25:11 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPY6v-000000099Yj-1CV5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 02:23:58 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fc01so7012031a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 18:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734920635; x=1735525435; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzTaQw0I4DCqNdV3XbT1uU84Y8+BcPXmBxbBNcSW7I0=;
        b=bf5TxOXOQseE9anlbnlbsqUD8ReCeaTPipjui9maorBK+M9POG6MvA1FS1pO3OOzKD
         lWBFzeNlscVisMW8cGGcWoAfe/n8GfBVfjOpsiCG4rBXnw3umBhXC8hWGeDF3+NTgaOw
         L6REsa4rMrl18UbDtQzkGxMeNRZpwxzoevA5ElEnTp8T77W0GooLX/h8hnqeKn9u+vgw
         x/6s5iaQQ+xOnEjKqUjFa/9qj+snjfaIw51pSD2jsVj62T+XHEC7w3b0TJ2r7rIbehhs
         dNz+QvFR5zXWMLsPLW6mNkuAiD9NWMTDlWjqnY0vZeyQi2cQLN9//eySKQiQTdf2adgZ
         UHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734920635; x=1735525435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzTaQw0I4DCqNdV3XbT1uU84Y8+BcPXmBxbBNcSW7I0=;
        b=UQRhoolJ8xKqTNHSrKQHfPHfaakSrhG60z+1zVKTNoUs+khBV5qjp0stX5uJZqVS4E
         p4Bn0GAhg98a+sIDK0DPDVcK90xZz7A/lCZky+NlPfv7Z8r9We4QL1WahUrJE3T7Uo6d
         KVlzw1Q8eDL0vAtNhXL6cpa8PrKZcEBGpRAhl2egXeqwlPhw3RTwgFNeNhs9l342Xy/v
         sZJVJuU7xPfXaJNywgLr6HdBzc2mKY2NlRcDnTAeuQ/W8XinlrT0liAsOjMjniMjBLfo
         m7+CUnYWeF+e9+hZQGS7JlA0uhO/i+NROzGVStftPQKVrLoWGG8bYpSTe8ZNEypmKowe
         Q57A==
X-Forwarded-Encrypted: i=1; AJvYcCUvIpDkoapI76zZQ8bSSIusDOhIfuGBeYHgjGEmFSCRHfpWG4woC+eyF36GqKKrdbVym8pNL+VaBm7Eytr+VzDD@lists.infradead.org
X-Gm-Message-State: AOJu0YxIHw88CyWsbfg/YdbDIiuTlfuwtAU6sZFnvSJWdtMcVciqGJog
	ev4Eja0asGmynVpClhjt9LNTk4RqhyEo/Vwj4ruMgglYsRrA2lBOTMKtvIRfuPzOpjSRFq1WY7k
	e791R7RBWlOKYE7GqNbJrKFB0eg4=
X-Gm-Gg: ASbGncsQWOvZfqo2HgQLd5RUJAq40lZ0AqlUz75XIAP4DSIpuWhD8UsjZDu3N33N2El
	pDtoLwXpmS3WYJXDz0sYpx38sm9y9MB0qOo51uJiuGPDWAK+ju4pFwzIOgl5OczKyp+JdAh0=
X-Google-Smtp-Source: AGHT+IFOQ+YJJjZ98YVVZNwOrG0qsOM9r08CSwciPXEClz4vbTeokWJahyw8uhtMV2WnJ1NN+6tN5a7MOjvOSmVwcIw=
X-Received: by 2002:a05:6402:5251:b0:5cf:43c1:6ba7 with SMTP id
 4fb4d7f45d1cf-5d81de162acmr11181357a12.30.1734920635218; Sun, 22 Dec 2024
 18:23:55 -0800 (PST)
MIME-Version: 1.0
References: <20241215204014.4076659-1-zmw12306@gmail.com> <9745b3ee-ae89-4edb-8ff7-b20096dbe1de@denx.de>
In-Reply-To: <9745b3ee-ae89-4edb-8ff7-b20096dbe1de@denx.de>
From: Mingwei Zheng <zmw12306@gmail.com>
Date: Sun, 22 Dec 2024 21:23:43 -0500
X-Gm-Features: AbW1kvZUUzJKKpkCx1FgWYjvLlCb7cV9If9o4mEuNky8MJMq5ODnIq-nWEKhIdY
Message-ID: <CAN4iqtRuj9M=GzFbY-hY4Ks3ktSKfA2W5yLT19vkJ2CSe1it9Q@mail.gmail.com>
Subject: Re: [PATCH v5] pinctrl: stm32: Add check for clk_enable()
To: Marek Vasut <marex@denx.de>
Cc: antonio.borneo@foss.st.com, linus.walleij@linaro.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, make24@iscas.ac.cn, 
	peng.fan@nxp.com, fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_182357_336021_E0833204 
X-CRM114-Status: GOOD (  12.96  )
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

Hi Marek,

On Sun, Dec 15, 2024 at 6:54=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 12/15/24 9:40 PM, Mingwei Zheng wrote:
>
> [...]
>
> > @@ -1617,10 +1602,18 @@ int stm32_pctl_probe(struct platform_device *pd=
ev)
> >               return -EINVAL;
> >       }
> >       pctl->banks =3D devm_kcalloc(dev, banks, sizeof(*pctl->banks),
> > -                     GFP_KERNEL);
> > +                                GFP_KERNEL);
>
> Please drop this one change.

Fixed in PATCH v6.

>
> >       if (!pctl->banks)
> >               return -ENOMEM;
> >
> > +     pctl->clks =3D devm_kcalloc(dev, banks, sizeof(*pctl->clks),
> > +                               GFP_KERNEL);
> > +     if (!pctl->clks)
> > +             return -ENOMEM;
> > +
> > +     for (i =3D 0; i < banks; ++i)
> > +             pctl->clks[i].id =3D "";
>
> Is this ^ assignment necessary ? If so, why ?
>
> [...]

Thanks for pointing this out. We call devm_clk_bulk_get_all in
stm32_pctl_probe() to handle get clk in PATCH v6.

Best,
Mingwei

