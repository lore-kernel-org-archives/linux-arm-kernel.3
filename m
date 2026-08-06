Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082E1C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 07:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bw0q5d56LIKtFiT6Te7rkJ4Ur/ITs2O5UDLJ3AFpiL0=; b=OqMa6TJN8GY+X494lG6vsM3ibd
	t9RGisZZE1ALxooHToWdr4N/UI4KDGC1RcA9FrdXvc5/+c50ev60ppveehvRL7n6VbCwNABeYgOcq
	/pZtuci06VZDS2gW4Qg0rGu6Q/YV/w0LcnUFtc2YYwBfraYe3fEUQid4hFmk3CxAMButC1g8t32Pi
	1tZB6P0AWdojWcrlmDoVk9ZsErlwq7V2mtf8m7Pk6H9MlSzP/8OBddQRBnKWYjkN6qFgozE7mR4py
	vjs3ac0YKbRDxdgj89O8hLQEUVxngTOcSFAoukAdw6bjswPM9Y3aez+E/MqkIjKXqD/LGKmc6gqVh
	R/mDGifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsro-00000005Amu-1ViY;
	Thu, 06 Aug 2026 07:50:16 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsrk-00000005AmZ-3v4T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 07:50:14 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso1010722e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 00:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786002611; x=1786607411;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bw0q5d56LIKtFiT6Te7rkJ4Ur/ITs2O5UDLJ3AFpiL0=;
        b=LKF+EQlUF7P/cBhIgnoa0cNoyzNuyTdqQDR/TJenQX8TmuQ5YkjvGggapIYawfLq/a
         mmsP4Cqpq2JKHh3aLfNoPtVSHOyC8FJrD9elrdT3DSowBlnRKLZBAvLls/+jkLCERF4R
         2TQS5vjaauS5/BwrcwQudmW2tiTKeWee1lrdVRo/rkykK7/zlTBd23LGrKZRvvwIct7G
         ncxh3j7j3YNjFn+IysLGsTT2Pe39YWMBMKinus5CiEQRMBkI4aEnyxPsK4CUM6RZDkHx
         rZuNUHwmzYZOQztBY6VHLyr1x91SYtiHHmtRa0/S1WbNnGKX30+ls661qHUlH3UnbSHf
         KMjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp44VlPq9s1Ll/CHEr3RtNt1xeCXg9BDDmiOGs6Yd/HLzrzOQuYWwQwW9M4XVIPrqnee9+EyQ3Y/pNdBCPpzRgn@lists.infradead.org
X-Gm-Message-State: AOJu0YzJulHWm+bYwGHEDg9kTdsmtmHxfCZmJLQVeo1p09FkI4CN2ga9
	2GagzOGU/q6ECYjV8TULOPRfKK2E3ogjVzxatxJe2utJJuwM/qYYBzhVpG7kbIp1
X-Gm-Gg: AR+sD13FsGAbH++fFROM4aaU6gJkT3uVOl1WjhG8408DbkTLy/5tfjdHVOQ9mA7xCRO
	VIMf7WdoZ7lA4lzjChEOi/msXYZGnJ0RVFBm7gqzMK/x4lUXPqZk0KxJgnZP8gXZZ4jNlRZjDpF
	Ogq33adVW4q4A1b3Su4NCNychMV7t14xNsqIzSjStHAg8amvQK1ROE9lDhoB/u/tFkj5fxYc/qK
	dugttpZbJiasYFg/VbCK4HciJd1qgcVYRQzJvfWKnEF1Inzrg8VLf/H/a2Lxs6ly6I0p5IIQHLH
	3O1BjqgWyzizb7wsc+J+NHjcbZEwdhBhH0VaXUJxP1cTbdaESpZvh0P5tIn/DdWVcWUZ8GdvVkd
	2IGOZqFe8Q65K19fdVQlRomdqlsCUCcpICm9XUa4RidSODgD5KOoSdZMujftr0jyH3ICtH2+l50
	D+pT/6sDaTchIZE3s4ySgC4q6uO+r84s7KfV9r9AdEvbtR0jnslc0kLwDF31OQTC0gALPY2CM7T
	WBUpWHOp1RUBChj0Yz4jcIxBKozJUwfYCEO
X-Received: by 2002:a05:6123:2e6:b0:5c2:b8a4:95c9 with SMTP id 71dfb90a1353d-5c3d924e662mr1900955e0c.11.1786002610932;
        Thu, 06 Aug 2026 00:50:10 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c3d05c594fsm2951856e0c.8.2026.08.06.00.50.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 00:50:10 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-977fca41f52so663917241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 00:50:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rod7KxCCy5nPvJ69GOcDUBI1ZZPElZD/dHiiKAN9zh5k77vFZ0i3fwMaXBWzw370WC22zSBoODT1MzU4nzPD11Y@lists.infradead.org
X-Received: by 2002:a05:6102:5788:b0:74c:7fd8:73f5 with SMTP id
 ada2fe7eead31-760e7bec35amr3810486137.6.1786002610083; Thu, 06 Aug 2026
 00:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be> <89e6a71b35703f10e12f520af1f389b5f40f4b35.1785941595.git.geert+renesas@glider.be>
 <0124d3a3-81dc-44ce-88a2-9426c65ac46c@mailbox.org>
In-Reply-To: <0124d3a3-81dc-44ce-88a2-9426c65ac46c@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Aug 2026 09:49:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHPjzCidCkfyF0c9fndAmAte1DuhxGZt=WY=_jxpwU+Q@mail.gmail.com>
X-Gm-Features: AUfX_mxDCMXWQzEKQw-oHDEPLKfBz2gF2hlxdZi1vAhDPfXSN6ZVQ5LCO1qQ5aA
Message-ID: <CAMuHMdXHPjzCidCkfyF0c9fndAmAte1DuhxGZt=WY=_jxpwU+Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_005012_985961_DDF21E1C 
X-CRM114-Status: GOOD (  28.33  )
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

Thanks for your comments!

On Thu, 6 Aug 2026 at 00:38, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 8/5/26 5:20 PM, Geert Uytterhoeven wrote:
> > +DEFINE_MDLC_RESET_WRAPPER(reset)
> > +DEFINE_MDLC_RESET_WRAPPER(assert)
> > +DEFINE_MDLC_RESET_WRAPPER(deassert)
> > +DEFINE_MDLC_RESET_WRAPPER(status)
> > +
> > +static const struct reset_control_ops r8a78000_mdlc_reset_ops = {
> > +     .reset = r8a78000_mdlc_reset,
> > +     .assert = r8a78000_mdlc_assert,
> > +     .deassert = r8a78000_mdlc_deassert,
> > +     .status = r8a78000_mdlc_status,
> > +};
>
> Please keep the list sorted alphabetically.

This matches the order in which the members of struct reset_control_ops
are defined.

> > +static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
> > +                                 struct device *dev)
> > +{
> > +     struct device_node *np = dev->of_node;
> > +     struct r8a78000_mdlc_priv *priv;
> > +     struct of_phandle_args pd_spec;
> > +     const struct mod_map *map;
> > +     unsigned int id;
> > +     int ret;
> > +
> > +     ret = of_parse_phandle_with_args(np, "power-domains",
> > +                                      "#power-domain-cells", 0, &pd_spec);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (pd_spec.args_count != 2) {
> > +             of_node_put(pd_spec.np);
>
> Maybe some "goto error" fail path which does of_node_put() wouldn't hurt
> here, since the of_node_put() is duplicated in here multiple times.

I'd rather keep it like this, as of_node_put() must not be called in all
error paths.  Moreover, SCMI remapping will add more error paths,
and multiple fail* labels.

>
> > +             return -EINVAL;
> > +     }
> > +
> > +     scoped_guard(mutex, &r8a78000_mdlc_lock) {
> > +             hlist_for_each_entry(priv, &r8a78000_mdlc_list, link) {
> > +                     if (priv->np == pd_spec.np)
> > +                             break;
> > +             }
> > +     }
> > +
> > +     if (!priv) {
> > +             dev_err(dev, "%s: MDLC %pOF not found\n", __func__, pd_spec.np);
> > +             of_node_put(pd_spec.np);
> > +             return -ENODEV;
> > +     }
> > +
> > +     id = pd_spec.args[1];
> > +     of_node_put(pd_spec.np);
> > +
> > +     map = mod_map_find(priv->mod_map, id);
> > +     if (!map) {
> > +             dev_err(dev, "Unknown module 0x%x\n", id);
> > +             return -ENOENT;
> > +     }
> > +
> > +     dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
> > +     return 0;
> > +}
>
> [...]
>
> > +static int r8a78000_mdlc_probe(struct platform_device *pdev)
> > +{

> > +     if (!info->base) {
> > +             dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &res->start);
>
> return dev_err_probe() might be more appropriate here, even if that
> would be more chatty until the support for various MDLC nodes lands.

Indeed, it would be very chatty, and may confuse users, that's why
I used dev_dbg().  We can revisit that later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

