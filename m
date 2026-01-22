Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC14C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 07:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YphWGYdugj+TzDs3oTHQA8YUU8yI49MJ8VruBQ9OUdM=; b=q7CbkKQcWPg72ecnC748ChQ5/r
	C3bDtplhFIg7Srihupr8zlXFRkn7BQ047k899H+li0YAdZP33Rltuayr2VXSXyy27MTbMQxCSQoXG
	VjoiedjQUMS8qNyUG+4XY/pmh+TiR3ykmcpMjCWrRst6ctlJFzcxMKsKU2JwDYI7KdZuARAwpN6K8
	1x5xFIp70/ZvhSPwDemvCwDMwrLO1b29bb+LmrHnJNN9bL8HOlWfF11am2uneNS2DTwoK38Jt5Ewv
	gvFdWhl9PONJqoFJ7p2mgcOceb/ALP4BvepNKxjSBJ65riDi86qj3MSYNSLwaNY09ll9VWsbNM4o3
	QCMLam5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipFw-00000006ajD-3EfE;
	Thu, 22 Jan 2026 07:37:28 +0000
Received: from mail-ej1-f43.google.com ([209.85.218.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipFu-00000006aid-26fF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 07:37:27 +0000
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b879d5c1526so127348566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 23:37:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769067444; cv=none;
        d=google.com; s=arc-20240605;
        b=XAGyC0yLW4SL144DQZVR1VMK1R8hrUFUpAStaeiQRkf7FOOAQopjigMBNUnqJ4VOSR
         PAjufqb3JF34RRC2PihUBnk5EIwKIarZm/S0FJnsdea3IQF0Y3Gl36P0aH1VnX1AVLOj
         njOXWymBogByLJSXU244BvkmHxID/AGwB5AnNgYncF6cn737SW81/lbn8YcIj5Wkj+bo
         Iv+8MnNqpFv2G3UmEujx6XOhUxSTV9D31leru2PNUTHtksBCS8SLTOe672U8UKi3mTns
         airHRKlwLJrzuZhgZORre33Ti4uojiTBZL0MZkXx7noUQvAkh2mOybtesmFNosY66Mny
         mAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YphWGYdugj+TzDs3oTHQA8YUU8yI49MJ8VruBQ9OUdM=;
        fh=6FtWLszT2zSNFvrhnaluCMtDHI5uyvcU2VUPaXWQFz0=;
        b=IKHtmQCnazTq4/od5MnK2jH3RcFwy3DzvdNYSW1l6ezoJ6RBlYBbzSNs3u+ceBLkc8
         GK6o3DbZ9D+pnRkRWQ3wV0p+vqRK4vRUlKj+GJ9zHj1NSLd33RSn//KHBfTjZLPq9OXn
         xWaR7Z9v0c8ycmrfX0DbnBWZhZQDac/yzp/slY6DyA3IRZGtyqHS8/pdCXW4lVIxQq59
         Y7vn72W0bBfjfvqSIvb3U9VEKodIgQpcoSH/3jiUNXDW98cHv1HYHRUcxypZQ76l1jiG
         F+sK5Hs9tNuW0la98KK5YEbOB58lmvLxnYhcstMQeDTW5VgpI0ojL36uQW14ImteZaaT
         o2CA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769067444; x=1769672244; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YphWGYdugj+TzDs3oTHQA8YUU8yI49MJ8VruBQ9OUdM=;
        b=jy9730cp9rrNAzD/NYXFrx+4Kyi3UkKre68ypTMoi6tCmQETvXu+xieSawscwiZVS0
         FPvILg1F0ocpHbkwJ0pB7jhWGX8SIGS5ONWs5qLSxOUD21EqsRdlE5zzwjVm62CGFf3E
         /t24LM9F6F2pnws7ZYGiEr7OiNOHCYFD51uX4yY+CK+pOc15zmAdV1tuqmL1TGBDZWwM
         Nt0SimtNHFftcwgvjp7esvPpDp0+H4APkX/GgSzK1SA5vCnRyIDfSSNxhHdQNcFyGRvU
         XtbNefb22VDE/NpmOZnzj2n8KCp0iAz/9Uv6elJ7FSuA7QkUWiPCPEUJZ5BQqK4b46PE
         axNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067444; x=1769672244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YphWGYdugj+TzDs3oTHQA8YUU8yI49MJ8VruBQ9OUdM=;
        b=p/49mvtgQborozSaCih9Cm24074P063hY7zt0plCA4ZoshQT8M/MCcYk7k0yywn7IE
         W2IRJyNOEDoBB8r6WD6r+K55JYNEa6JE8t2NB9VkZq8MzwRaQORoDI0HScKjd5VWGYWj
         dh3X9ccPjam+tYYdQKo5or5AVlnbyKsCWPQKO61vMdp6SFwWXjk1WsiQLd1wRGJIcv0V
         DwBur6cdwp3plt8GMau4SR67g3gtIrtfZ7alu5vV05uS/KP+bfEoA0OwiyD8YUch8dko
         Qzu8kXPauIbbTrfxg/JIBG+JTFvAXj/eLROhY9qIunX39gvVXCg8CiOvGSeZruto2fgp
         UQog==
X-Forwarded-Encrypted: i=1; AJvYcCX9Ov2aXelpvg7nhZqJ96jgLX6BRD+M7E7PV/vRseZ1IGj0dP7WGMGJwFQSkZM3Pc9PjPJ/gmUY8tErEIIDr40z@lists.infradead.org
X-Gm-Message-State: AOJu0YxZxCeyQHv1a7e6JevrC+2uBw7F/pqNG9vlQe0CbuKcIPfFKu7y
	7dSMtQEc7JlLwTeOUATrGmwH+BUoYgb9M6xUpl6+JX9V5FJRD+xPQoXbqiTVuslNPYr+9UQFI+2
	/yQIWGc2MRqC0JWQS6U6OAFmGlEnjPtQ=
X-Gm-Gg: AZuq6aKqUA9kJLFWl9WwjPp6owPDcoZQIiU+OlZ+I+aVqz1VBDcBbUHbkf5Zn36b6aG
	TtFNz612eHJLLevgIno1+wAc9z1X4ckObf1mT04TvRDjqj3KmCy2dcc7ccoMCnRwbpN5V2LU2cS
	AIMhZ8W/JahQW4Pi3IAS2YgQYR/mtYg8anGus3I1wieUpC+9dFnyYqpBeQzKqzFonym3dQvgskQ
	RVEEWzAb8zZ8cXLI05P2hnUPM9ZhTDXCiGV9pqJB0rU00j/oei75FV31dbyCclLCu+KoHDiKP7o
	nxpyM13+vM4bwqy405QELs9T32ATTJ699g3ReAxyFvZLo6Sr7sWAtHXX8Sae6cdMTHWJxv4=
X-Received: by 2002:a17:907:d716:b0:b87:3beb:194a with SMTP id
 a640c23a62f3a-b8796b3121dmr1604257266b.44.1769067443570; Wed, 21 Jan 2026
 23:37:23 -0800 (PST)
MIME-Version: 1.0
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com> <20260122010516.1200630-3-florian.fainelli@broadcom.com>
In-Reply-To: <20260122010516.1200630-3-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 22 Jan 2026 09:36:46 +0200
X-Gm-Features: AZwV_QgHlyPeg-jfLq6w7Lfoz9utODZVsyacjaI519GGrv-Z_nWFKLu2EeJQ13Q
Message-ID: <CAHp75Vc=ejHPwA05MHBxJQdJWv49pcuTNax0VikXruvwVM+Y9A@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: brcmstb: implement irq_mask_ack
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_233726_556010_DCBD0886 
X-CRM114-Status: GOOD (  18.03  )
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

On Thu, Jan 22, 2026 at 3:06=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> From: Doug Berger <opendmb@gmail.com>
>
> The irq_mask_ack operation is slightly more efficient than doing
> irq_mask and irq_ack separately.

I would refer to the callbacks as

.irq_mask()
.irq_ack()

et cetera.

> More importantly for this driver it bypasses the check of
> irqd_irq_masked ensuring a previously masked but still active
> interrupt gets remasked if unmasked at the hardware level. This
> allows the driver to more efficiently unmask the wake capable
> interrupts when quiescing without needing to enable the irqs
> individually to clear the irqd_irq_masked state.

...

> -// Copyright (C) 2015-2017 Broadcom
> +// Copyright (C) 2015-2026 Broadcom

Shouldn't it be rather 2015-2017,2026 ? (In one case when I updated a
driver for Intel, I went via Git history to gather the info.)

...

>  static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
> -               unsigned int hwirq, bool enable)
> +               unsigned int hwirq, bool enable, bool ack)

This type of interface is usually discouraged as it makes code harder
to read and follow. Since there are a lot of duplication, I recommend
to move the ack op to a separate helper.

...

> -       gpio_generic_write_reg(&bank->chip,
> -                              priv->reg_base + GIO_MASK(bank->id), imask=
);
> +       if (ack)
> +               gpio_generic_write_reg(&bank->chip,
> +                                      priv->reg_base + GIO_MASK(bank->id=
),
> +                                      imask);

Id est this piece...



> +static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct brcmstb_gpio_bank *bank =3D gpiochip_get_data(gc);
> +
> +       brcmstb_gpio_set_imask(bank, d->hwirq, false, true);

...and call it here explicitly (seems the only place for it, so it can
even be just moved here without an intermediate helper).

>  }

--=20
With Best Regards,
Andy Shevchenko

