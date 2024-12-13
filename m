Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F46E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 01:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jn1DysVTcUcd9ySgqRwXIoCNYLQUOLat4q21/VMPDys=; b=Ne3O5/8D7TpO2brMkEX7Ss5Pwt
	gkuoG3Y1cDRuJg9SfUbpnEW/1YD+T4TQCFPcowOxdLziLsWq6I6oJIlfdojfPeY83wqY2A+OH2YhR
	3UrD7ina6sBaSjFKbctKu9WM87O9LKouiEFM+5d390dcFXoNfHj4uKUfnx9DmKlQhtQubhT7HqXCB
	yuns9jEnSQe9vSWX6vPgVYo5uJecQQj8lyVPvGIgOh3p/9iwj6mrfgYrkadq37MfzHo4kLF8GjGV7
	4c3ksrLqnLoA4QG4Zl2AeGvpTNgs09h1j5PGeARRC9DR3M0jZRUPkkSJ4zMckjNOYHaZpCk9HkE3s
	V2pynJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLuEn-00000002NI4-3OAQ;
	Fri, 13 Dec 2024 01:13:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLuDj-00000002NCe-2p4W
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Dec 2024 01:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Jn1DysVTcUcd9ySgqRwXIoCNYLQUOLat4q21/VMPDys=; b=nYWRRfT0BKsMaspuMG4RiehTn1
	Ejp19XxkzkL4Kr+K+dB5UCPh2aqXe5HIuQzhMCiSA3z3HUjQOtkd55URDsc+BuNJcF9FhIhADzPOn
	WTgPv4XxcDUVleOZeQgLGr/ZGFQ0juqP0Ts5DaL9Bzya0vxZYt9TZT7C7pqLe2OKza3MXu4ykH1Im
	h2PeUYj+zi7cUMjN2ztGCTdZB4Nk5WcGHzTd7q7bWYSlryoYBwOH7X2uwDXyX/syLIkB2Z5QdbUKc
	3nbfGpzHASzZi6VR7QWkLs0+Ocs5QfFcGxs9bMK9keMvg1ewnpN6rb1TStEuCxda9U20Ay5iN+vXF
	bR42OkLA==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLuDf-00000004APx-2zpY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 01:11:54 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5cedf5fe237so2050839a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 17:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734052309; x=1734657109; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jn1DysVTcUcd9ySgqRwXIoCNYLQUOLat4q21/VMPDys=;
        b=l0+S4f5ZJrjlD6zyhB5UrPsnwbx4xot7sOHiUAD13ACwO53uNbowEWRSdaKB1Pc4qa
         wi0YVdmJRJB/zW++yn0G1ZfLp+I9ISamiWSYCWHtsUnmY1viE0V4YIzHghOVzN/wcVR3
         wfcCKwQ4NTaV8yhX7TAyaQu9ACNC2MJG2JjEPncb1WyqfUZEBsUvmkaoqs2SCTpHuU4i
         6OR4dEeMAy7UGwy9q3MHSuoe+oK/IxkvOnrsNAsts1Zi5LgBqTHrBvU62P/KZ5ymgE4r
         j7IjWesWQQGX+myB5KjhPZfe0C1nD5Qk0OGiRmefj+B9zJXWm6I6PUpXRG06QuKStQy7
         eAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734052309; x=1734657109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jn1DysVTcUcd9ySgqRwXIoCNYLQUOLat4q21/VMPDys=;
        b=i3FJGOUr6fwhMxfKgWdNfWL/bUVHipgdjb3gcUtr8vNbOd8zYL5A1AQbuO2XqydIB+
         BCrLZfs6raU79QRem0tksv124iQtlcPdsuQM0Zt6WsWVBPCzNUZ0zypj+tEEByqZFzie
         CWiHf3vdbxRCY0lu8OloY4Va+KDheJaOd0fVsUYbSUWYsGDChUSfCiWqTgdzKt73tRZp
         ejtoYY9OTkhnYHBbPqlNz5nZn8ihrO74uhZkK+t8See6TQHu3AJxf2VyxbE5zaQiNmRc
         R2Ox8w0ujd4KhqnJfwciV5s1z11z39Lur6ceDpwzLRNS0U19dWvGlPK4nT1E0NMT1GQX
         zmGg==
X-Forwarded-Encrypted: i=1; AJvYcCV6mVUflR1POURRCyu12NXpHTMptwSVQZIvsr/oOPdyHE1PaWJyTSyYKWb1aOBFsxPDOA3JrVzftc73EE3itqeT@lists.infradead.org
X-Gm-Message-State: AOJu0YwMBXheMiWSC/k6f52Tyd0jFq4CAE149vNJa16fXiynvAeXa4gj
	xkw7vh36Mrz6A+QAYFrYjPoVA1eVa+XvhqXGniQx7BqDNVjebQN+43SV4zJtpMQW8XMVPZt2JFO
	7OXwDNlWYCxLUR8Kgqw89FiR/Lc8=
X-Gm-Gg: ASbGncttk714SQ/l/iOwUDst57m1hRyB5Gd79YqJ+ddz+vhbdj9sWXAPL7u6wlpGoIF
	0juaGo3OivKPlWkIH9akMdpt5mz0RqRsahP+pnLNTUd1Hm1aC2Sse7Q3T4yCqDHbVH5w9tA==
X-Google-Smtp-Source: AGHT+IFQ4XNOkc8sPX1M8qZSVacYSK9EidDYtS/NoHmzSlgwZHZDH0Ukd2SJ8UKW79iATKfg796ugAZZITmrQz+qNYA=
X-Received: by 2002:a05:6402:27cb:b0:5d0:8359:7a49 with SMTP id
 4fb4d7f45d1cf-5d63c1575f0mr474365a12.0.1734052309059; Thu, 12 Dec 2024
 17:11:49 -0800 (PST)
MIME-Version: 1.0
References: <20241206214315.3385033-1-zmw12306@gmail.com> <21f4927382a3cf3bb433bc1f1d7d4ad9ea1a2a5e.camel@foss.st.com>
In-Reply-To: <21f4927382a3cf3bb433bc1f1d7d4ad9ea1a2a5e.camel@foss.st.com>
From: Mingwei Zheng <zmw12306@gmail.com>
Date: Thu, 12 Dec 2024 20:11:37 -0500
Message-ID: <CAN4iqtTcdZ8tqwPx=WeG6j6k17OHF3rj_YcXUgJAwseoTUKDeQ@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3] pinctrl: stm32: Add check for clk_enable()
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: marex@denx.de, peng.fan@nxp.com, make24@iscas.ac.cn, 
	linus.walleij@linaro.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>, 
	fabien.dessenne@foss.st.com, mcoquelin.stm32@gmail.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_011152_171672_93DF3012 
X-CRM114-Status: GOOD (  31.19  )
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

Hi Antonio,

On Sat, Dec 7, 2024 at 9:25=E2=80=AFAM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:
>
> On Fri, 2024-12-06 at 16:43 -0500, Mingwei Zheng wrote:
> > Convert the driver to clk_bulk*() API.
> > Add check for the return value of clk_bulk_enable() to catch
> > the potential error.
> >
> > Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled =
when LEVEL IRQ requested")
> > Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > ---
> > Changelog:
> >
> > v2 -> v3:
> >
> > 1. Convert clk_disable_unprepare to clk_bulk_disable
> > and clk_bulk_unprepare.
> >
> > v1 -> v2:
> >
> > 1. Move int ret declaration into if block.
> > ---
> >  drivers/pinctrl/stm32/pinctrl-stm32.c | 28 +++++++++++++--------------
> >  1 file changed, 13 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/st=
m32/pinctrl-stm32.c
> > index 5b7fa77c1184..0ef912e82736 100644
> > --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> > +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> > @@ -86,7 +86,6 @@ struct stm32_pinctrl_group {
> >
> >  struct stm32_gpio_bank {
> >         void __iomem *base;
> > -       struct clk *clk;
> >         struct reset_control *rstc;
> >         spinlock_t lock;
> >         struct gpio_chip gpio_chip;
> > @@ -108,6 +107,7 @@ struct stm32_pinctrl {
> >         unsigned ngroups;
> >         const char **grp_names;
> >         struct stm32_gpio_bank *banks;
>
> Thanks for your patch!
> While it's growing wider than your initial scope, it looks as a nice impr=
ovement.
>
> > +       struct clk_bulk_data *clks;
>
> Maybe I've missed it but, where does this array get allocated?
> There exist clk_bulk_get_all() and devm_clk_bulk_get_all() that do the al=
location for you, but they require all the clocks to be listed in the same =
"clocks" property, while this driver has a clock in
> each DT subnode!
> Some suggestion below.
>
> >         unsigned nbanks;
> >         const struct stm32_pinctrl_match_data *match_data;
> >         struct irq_domain       *domain;
> > @@ -1308,7 +1308,7 @@ static int stm32_gpiolib_register_bank(struct stm=
32_pinctrl *pctl, struct fwnode
> >         if (IS_ERR(bank->base))
> >                 return PTR_ERR(bank->base);
> >
> > -       err =3D clk_prepare_enable(bank->clk);
> > +       err =3D clk_prepare_enable(pctl->clks[pctl->nbanks].clk);
> >         if (err) {
> >                 dev_err(dev, "failed to prepare_enable clk (%d)\n", err=
);
> >                 return err;
> > @@ -1397,7 +1397,7 @@ static int stm32_gpiolib_register_bank(struct stm=
32_pinctrl *pctl, struct fwnode
> >         return 0;
> >
> >  err_clk:
> > -       clk_disable_unprepare(bank->clk);
> > +       clk_disable_unprepare(pctl->clks[pctl->nbanks].clk);
> >         return err;
> >  }
> >
> > @@ -1631,11 +1631,10 @@ int stm32_pctl_probe(struct platform_device *pd=
ev)
> >                         fwnode_handle_put(child);
> >                         return -EPROBE_DEFER;
> >                 }
> > -
> > -               bank->clk =3D of_clk_get_by_name(np, NULL);
> > -               if (IS_ERR(bank->clk)) {
> > +               pctl->clks[i].clk =3D of_clk_get_by_name(np, NULL);
>
> This is the first time the array is used, during stm32_pctl_probe(), so t=
he array should be already allocated before this line.
> The number of banks pctl->nbanks is computed few lines below, so it shoul=
d be anticipated, or being replaced by a simpler
>   pctl->nbanks =3D gpiochip_node_count(dev);
>
> then allocation could be done with
>   pctl->clks =3D devm_kmalloc_array(dev, pctl->nbanks, sizeof(*pctl->clks=
), GFP_KERNEL);
>
> Also, you never assign `pctl->clks[i].id` which is then used by the error=
 messages in, e.g., clk_bulk_enable().
> We don't mandate the property "clock-names" in the DT subnodes, so no way=
 to get a reasonable value from the DT.
> I presume it's fine to set it to NULL... to be tested.
>
> Regards,
> Antonio
>
>

Thanks for your suggestion. We used devm_kcalloc to allocate clk. We
set `pctl->clks[i].id` to "".

Best,
Mingwei

> > +               if (IS_ERR(pctl->clks[i].clk)) {
> >                         fwnode_handle_put(child);
> > -                       return dev_err_probe(dev, PTR_ERR(bank->clk),
> > +                       return dev_err_probe(dev, PTR_ERR(pctl->clks[i]=
.clk),
> >                                              "failed to get clk\n");
> >                 }
> >                 i++;
> > @@ -1646,8 +1645,8 @@ int stm32_pctl_probe(struct platform_device *pdev=
)
> >                 if (ret) {
> >                         fwnode_handle_put(child);
> >
> > -                       for (i =3D 0; i < pctl->nbanks; i++)
> > -                               clk_disable_unprepare(pctl->banks[i].cl=
k);
> > +                       clk_bulk_disable(pctl->nbanks, pctl->clks);
> > +                       clk_bulk_unprepare(pctl->nbanks, pctl->clks);
> >
> >                         return ret;
> >                 }
> > @@ -1726,10 +1725,8 @@ static int __maybe_unused stm32_pinctrl_restore_=
gpio_regs(
> >  int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
> >  {
> >         struct stm32_pinctrl *pctl =3D dev_get_drvdata(dev);
> > -       int i;
> >
> > -       for (i =3D 0; i < pctl->nbanks; i++)
> > -               clk_disable(pctl->banks[i].clk);
> > +       clk_bulk_disable(pctl->nbanks, pctl->clks);
> >
> >         return 0;
> >  }
> > @@ -1738,10 +1735,11 @@ int __maybe_unused stm32_pinctrl_resume(struct =
device *dev)
> >  {
> >         struct stm32_pinctrl *pctl =3D dev_get_drvdata(dev);
> >         struct stm32_pinctrl_group *g =3D pctl->groups;
> > -       int i;
> > +       int i, ret;
> >
> > -       for (i =3D 0; i < pctl->nbanks; i++)
> > -               clk_enable(pctl->banks[i].clk);
> > +       ret =3D clk_bulk_enable(pctl->nbanks, pctl->clks);
> > +       if (ret)
> > +               return ret;
> >
> >         for (i =3D 0; i < pctl->ngroups; i++, g++)
> >                 stm32_pinctrl_restore_gpio_regs(pctl, g->pin);

