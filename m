Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D288CCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhK/5iEdOsHso7WQOtGlojYYvxbDlPHKTAFa/LVoWKk=; b=Zlt2qmV4fA+9O/t54e67BzIO+B
	ONU6vZOP516I6LMj1sd/ExVgaoEZ6Gz1lAa/kLFoww4Fo/4c2o+OPF97TiyOMPhCElDZax1ef4M9r
	96kbg+z4EG+Zg5PRGG5SJzIYS/+zifJuHNM2FYlOzprlNA/HMr9pyETGpB4u1+P2eMAggq+9CMuBY
	ty2qfrgHggM5ixps8APdeNYOMFmhXrKjkTs6FCnMIN4SlszVXYYQircNvm+lUOi9zKabIdR7JXhuH
	nnA1fq26nTPFiJs4vdFjIeeHiffx2Txx76PQkO7OumF+1GZK/VZ5mIhvMkCFTmF01/09bABxABT3n
	CNtq1C4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7zq-0000000HWgj-1cQe;
	Thu, 21 Aug 2025 16:18:38 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4Vn-0000000Gv4Y-2lXZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 12:35:24 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-333f9145edaso7426721fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755779722; x=1756384522; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhK/5iEdOsHso7WQOtGlojYYvxbDlPHKTAFa/LVoWKk=;
        b=qiWCKURZmKcvK7+zCBFoJiKq0nw5Qh9i9hCIYPbl0vvO0SYFcJ0hBKveKYqB4lxoBA
         x+0OGoo94wWK8+PHaZzLaqDab25Vfy73GlFJdfnC8fDMR7m/slyqLKmQKMszbOUHNDay
         T/qT40ihIPuEPGILTwDveA2mg9G0A5kHeSYtFKOG73jejKs+9rgD2PnrHzW3yNTZNTCE
         XgVZz/9wYLpwO+sOuWlEA3reI2t0h87iSb2qamOTWe+N77wV9CBjTSmJuI0oG/hgDuQy
         jLhU2ih+WFjIlnnT280ZSLXnmGOiaDdRaR0BuoeAWF9oyBdUG97cxI45O8y1ObNeHokP
         8FHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779722; x=1756384522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhK/5iEdOsHso7WQOtGlojYYvxbDlPHKTAFa/LVoWKk=;
        b=KE6/kZIIQPOTvX+BrgAFrNs2iso6gmeMMLDbxacDoFLoKqlu4G7pnift1xvp4+hzqC
         D3s6AuEJALXIGHmnuyEeNSvSsNAyeS/DiJD4UCrfb1loq9ENR+lbLcCzRMZq0k08sz8o
         seeCachsZOW8m9VYqyxXQSlf+BxCw8J6CgMnLHwcg2vhDVl2dA2/8ufYLjpnhe4GKGbx
         YYebqlCMLWvTZcoFY0igEemKT+3k0xE9HVUHG/Ov5IFIDKaP3LNcWa/6DpNzAQTJHlDH
         nSXeGLaQXkrpa12+6ZlLRY8hDWjfdF+AERCo+PvrfReysNXcIxfzgxR9QvFBW2y9h/q1
         r9MA==
X-Forwarded-Encrypted: i=1; AJvYcCWHEmNMeBMGNGdU32sLSaXcvH6TYNXu5UYyp6+eUNlcW6rDxQXWBby/vBpvKKScA0VEVdXQ4UpHzHwdqvjcUfk+@lists.infradead.org
X-Gm-Message-State: AOJu0YxEwbiiBXzb+ulHwgSK4Ythzr6uQbzdHn3yocenTCkQ9+/R00Ht
	vrgGYY+tpAIeuTnDNRFAjQ1EsZV7NFwt1rJzdrcM+mpV0HXg1FFaW/WlrHPapPzxnUNJpmk4zrp
	ZV8EqqliOR9+KoV0gHcQWILisqZCNld56nC07KUhMGA==
X-Gm-Gg: ASbGncseCRbfUCDC8LFbAo5hpyz7bp29Ds3sXj7cDnVqU6WddHLgUom9TsNfE3xuN2s
	xmvJuuVjc4+cRxTAnjrr0IK3yGFskiBXnp4eyMrYkR5ihU+uapDdLJyO3hpfqQFhWPsK4vE5kr3
	dxe4oNa/7kThxxf06dtGbuuouHCN5RD37AJGRtK3hTNDJ1mYdmGrw6FNiB2co6hB/dntWOSSHmI
	1+QyfU=
X-Google-Smtp-Source: AGHT+IGFT1SOHRHnznv0j24jQt6OItG+VkUUqGfuDCNg03+god9R2F302j/+MpxBGP6QnhkRVuIKkbhRbFIemE8O8FM=
X-Received: by 2002:a2e:3314:0:b0:32c:b83d:64ab with SMTP id
 38308e7fff4ca-33549f4a0e2mr4716741fa.24.1755779721325; Thu, 21 Aug 2025
 05:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250821004232.8134-1-andre.przywara@arm.com> <20250821004232.8134-7-andre.przywara@arm.com>
In-Reply-To: <20250821004232.8134-7-andre.przywara@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 14:35:10 +0200
X-Gm-Features: Ac12FXyGD4nO__iucr4UwJuUtNZrpHlCHuWUThm0Y3PsAmwji1zokHx8_NHiyLM
Message-ID: <CACRpkdb-cudZE6mZH7vEOLU=aJFaNLX2dHz8Q_=2cfh1-JBRgQ@mail.gmail.com>
Subject: Re: [RFC PATCH 6/9] pinctrl: sunxi: add support for set/clear regs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_053523_696980_51C42DB4 
X-CRM114-Status: GOOD (  14.55  )
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

Hi Andre,

thanks for your patch!

On Thu, Aug 21, 2025 at 2:45=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:

> -       raw_spin_unlock_irqrestore(&pctl->lock, flags);
> +       if (pctl->flags & SUNXI_PINCTRL_HAS_SET_CLEAR_REGS) {
> +               if (value)
> +                       writel(mask, pctl->membase + reg + DATA_SET_OFFSE=
T);
> +               else
> +                       writel(mask, pctl->membase + reg + DATA_CLR_OFFSE=
T);
> +       } else {
> +               raw_spin_lock_irqsave(&pctl->lock, flags);
> +               val =3D readl(pctl->membase + reg);
> +               if (value)
> +                       val |=3D mask;
> +               else
> +                       val &=3D ~mask;
> +               writel(val, pctl->membase + reg);
> +               raw_spin_unlock_irqrestore(&pctl->lock, flags);
> +       }

This is now starting to re-implement the generic MMIO GPIO chip,
which I'm not so happy about, this is simply the difference between
passing just a single data register to the generic config or
passing a set and clear register.

        ret =3D bgpio_init(&g->gc, dev, 4,
                         g->base + GPIO_DATA_IN,
                         g->base + GPIO_DATA_SET,
                         g->base + GPIO_DATA_CLR,
                         g->base + GPIO_DIR,
                         NULL,
                         0);

...

I also notice:
pctl->chip->of_gpio_n_cells =3D 3;

Is Allwinner one of those drivers that could actually start using
select GPIO_GENERIC nowadays?

Please look at
commit bd3ce71078bde4ecbfc60d49c96d1c55de0635cc
"gpiolib: of: Handle threecell GPIO chips"

And the example user:
drivers/gpio/gpio-spacemit-k1.c
esp how it uses spacemit_of_node_instance_match().

If it's possible to switch over to GPIO_GENERIC this hopeless
maintainer would love if that could be done first so the picture
gets more clear.

Yours,
Linus Walleij



Yours,
Linus Walleij

