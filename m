Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F971CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 17:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wb0uZA3G4W3HP4zsAOWx40esmjqDsaAyOseskYQ6rWw=; b=jdCQedx/uB1qCEgnFCxz+c9fu5
	5sF5nf5DqunRrBvvoC3eo5wB4ry4uISqbzuTCreT7XsRbh1b9Yzu/08+/g0600c1JjgnLDjFbIrgV
	pkFfRKx9qa+AHiDeMVJgVGCqtlTheXMiS0p2k1VzPRx+MIfd6VT6Ry4inbAEridiqV2WJryw/yFYR
	X/J0eCuz0R8M30B8Qg2kalliWTmHqno2Zu7xY2lyDMuWKZZmiDDIRCNy5HbsEHj4EVUlO2T1hHJA5
	YmQ1aM3JaaVSxZQREHadgOH+wjOURpiZkkVdaEEaOKuATg5B7IugdZSkfpzXeSXxM7kv4GAxTWId4
	mXnWQCBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3kZ-0000000DrvV-3qjs;
	Sat, 03 Oct 2026 17:42:19 +0000
Received: from mail-ed2-x19.google.com ([2a00:1450:4864:33::19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3kX-0000000Drv5-07G4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 17:42:19 +0000
Received: by mail-ed2-x19.google.com with SMTP id 4fb4d7f45d1cf-6afa5b9150eso616568a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 10:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049335; cv=none;
        d=google.com; s=arc-20260327;
        b=hHfFHPLEzBlCyKnB23KLeHcx0SKy9wXACbaCL+sZIAvDVoDT+ztIUfLqzQFqEm5Or2
         chqbHHLU7GYN4e6j8pLe8ubVw+w1P2qb2Py8mrNLi2AX14/DzXBH49nxBrIvINVkVl+4
         C8w8c8ZxaCL5R7ebbZcbROQz87Zm3UcucHr8iza34zy+fj8NJA2GSiW+VarRd7K/OY3V
         Go6Pc7GAvXJ9rWs/ozL8CrR83wdWxiAOIukWN0Vol2kRzFChZpJlsaRRARdu6u3nwimX
         9KobYUCCcGoOAWsQnInI9lW8ZufDWNmqTAnaMKL+J2M+xMXpUKMhXlLVNtIQhgVNsqI3
         3utA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wb0uZA3G4W3HP4zsAOWx40esmjqDsaAyOseskYQ6rWw=;
        fh=PTzhDUWuEkqe69UHMigzNz9hNncYmqQlXt89nlqzUpw=;
        b=duJubJsNUtOTuM53RRsMeGqf39MnPQNZJzvfU27yo101zdCHnb98Zb5lgzQD5uYTPJ
         XC4p1dIpFQYCZVxHw8qs1wtUK+j0KRhkBZ4BwtagbKlbr82PZf2mcdVr7M/FiVcOKvHj
         M8vrQiQWCGg+QdUU0TfRSpxK28m7ezI9Ilym70AFlUvhrJD2lL6ePZi1MVO0D6NiviWk
         ar6XEEZlFppO2w0NsWN3dJBp0gLqkoimx9wwa8kOK0Y/+tMktutduQ7JA0v64vIM1lLH
         ta23hKz6cacrAsIT0ySjqzSR2SJkI6pbndTYVTqEt0wgrNABAz9R57rI2KxoxT6WlvM3
         qo4w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049335; x=1791654135; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wb0uZA3G4W3HP4zsAOWx40esmjqDsaAyOseskYQ6rWw=;
        b=qXqInercgQtLFdidUZsCguP/2fJELj6KA3mtg4N6Swz7Q+XIZubITjqe80WHmWxvd7
         NAkwQikWoDLg3DEB0I0C5OqLV21VmftQAlRozrSS7qDeO/FL4CSGzkYQJ8HETmzMBLWi
         EyU373x7d4ZfAwxU0V+8uhcl3pGdFEqkS8DdCb7eBf8kTooMIqXml1VjO5l7gMv/3eSK
         FZJuJC6Q01NBy8iIyVVn78q/QqkUwAwuuaalr6Wqze1m6xIFkG4dX6VnxxE7HkvOKANp
         6kWLdBiX3bP9hybXpp0jgmNDh82qG1Bfeiy3TziI5fecaTyVLbclVe1r1e1nSouaQ6Et
         NN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049335; x=1791654135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wb0uZA3G4W3HP4zsAOWx40esmjqDsaAyOseskYQ6rWw=;
        b=Ke2KGw3g63cVkQE8pWNwLqu5V0rmv/7Gc5S/395VRasrqiBQuMmugxIQgkk2GInR6w
         txB5ZFRxACikceuOFGVi35ode0Y8XE4V0YB7UJPn3ZEfMbTnwk3jxpVHKtMR98ieEP+U
         3Zf/Agu0HuLYmjSXIoMSqayM5FGf+B2Fco5/VG8xPI5wbMKgDpzNTBP2KQNCmCf4oPy0
         1rTfAZZVK1TuPCjcDxkzVrMTXdXDcUPpa/OTbxWRtVZiK3gZr4hqaLvb3nzpdrZbI8IE
         shFItOgcoalsBvNjV5yr2Q7rpGeHI2BH+E5+VxUEFWKzGPUVKHdQ6/RxM5ki5IQ6f+8L
         POfA==
X-Forwarded-Encrypted: i=1; AKwUvBzksiob4qQJ8L+DZKOCOORAEexjYliv3iSQRS20ifwvQ5Gxj8dy6CoIcfcgYcZMdaDhtSLIXjahPgIo85Oa5dji@lists.infradead.org
X-Gm-Message-State: AFuF++kIKMO6V2YwiuTx/y2c8+vVORgHe6pQ1+pJC6kwwgQIAVPIK7oe
	e9a+NjXMPiN1IH/9peproztnKjrE3RRL4cEWhmjOIy+8mO9K7WWP4ZJY6MTlXP9w15XO4a6bC3H
	BX1sR7mb8gpYNBFV7kDuSruo5Iu5GtaQqbiazYW8=
X-Gm-Gg: AYBFou2hNyT+wxTD3iLelCTuIapLXA4nyPnJqOOwzwnqwAwKfqX9JCWLCGaMsa/+VIs
	kYUaMVPvhoc7ls8BJOsfoTRkpk/q89QB0SFzWWFOpSNPKiLvdev7nAY+5YglLHEr/6cIwuOnfwS
	4pR2OgfyaLvSjP+W85JEf69cUiYoruV93L5u6xtLgwI1D6f6LVM+xpQpZTJv0JwTMwBqfPA3rIG
	wEhnFpJkR4aeuDHvJVo9eQwRPPqKsYMt5dFoJgFLqUOpJedu/C56aOULjlJ80D1Ce2iaJLRpiik
	1VzuUOG/f7Kb50SFflUslYbS1+Ds45u4xCguu5CZktBz+k/uPL7kNFmMU3oHowH/eDJP7dhB2H/
	BfNkOuhKnubOFE1Mta+TvzpoJx5PXkxxPEiN/JRJxXSDA2iHys7YEHxuO1uvPrOF0gy9RmXQ4+6
	32TUURZnhBuKcvJUmjSbvDBVaLH4kYcTDqVf0J87TQjQ==
X-Received: by 2002:a17:907:3e93:b0:c26:1649:47ab with SMTP id
 a640c23a62f3a-c2e4af30556mr531245666b.33.1791049334807; Sat, 03 Oct 2026
 10:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-2-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-2-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:41:38 +0300
X-Gm-Features: AclHuK-YbJvYMQ90snp8Z-brjwfCdtteRLBnw6C84XXIIOdG-WKJaroDt_HV2CY
Message-ID: <CAHp75VcDrc0a+79HuUVQw77ALVywxag5hXrzjg8mZ7vALZ99Uw@mail.gmail.com>
Subject: Re: [PATCH 2/9] gpio: mxc: fix wakeup_pads bit operations for correctness
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_104217_096647_C986249A 
X-CRM114-Status: GOOD (  21.33  )
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

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> Replace the open-coded BIT() / mask operations with the atomic
> set_bit() / clear_bit() / test_bit() API. Atomic variants are required
> because gpio_set_wake_irq() can be called concurrently for different
> pins on the same port - irq_set_irq_wake() only holds the per-IRQ
> descriptor lock, not a per-port lock, so concurrent modification of
> different bits in wakeup_pads is possible.
>
> However wakeup_pads field is typed as u32 but accessed via set_bit() /
> clear_bit() / test_bit() which operate on unsigned long pointers. On
> 64-bit platforms this causes an 8-byte read-modify-write on a 4-byte
> field, corrupting the adjacent is_pad_wakeup field.
>
> Change wakeup_pads from u32 to unsigned long to match the bitops API
> width requirements.
>
> Also fix the disable path to only clear the wakeup_pads bit when
> disable_irq_wake() succeeds, matching the enable path which already
> checks the return value. Previously, a failed disable_irq_wake() would
> still clear the bit, causing the driver to lose track of the wakeup
> source.

The above is too verbose, try to squeeze it to the point.

> Also fix a latent signed-shift bug: the old (1 << i) expression in
> mxc_gpio_set_pad_wakeup() has implementation-defined behavior when
> i =3D=3D 31, since 1 is a signed int.

Too many words for a simple (non-critical) update.

...

>  struct mxc_gpio_port {
>         u32 both_edges;
>         struct mxc_gpio_reg_saved gpio_saved_reg;
>         bool power_off;
> -       u32 wakeup_pads;
> +       unsigned long wakeup_pads;
>         bool is_pad_wakeup;
>         u32 pad_type[32];
>         const struct mxc_gpio_hwdata *hwdata;

While at it, run `pahole` and update the arrangement (of the members
you touched here) accordingly.

...

> static int gpio_set_wake_irq(struct irq_data *d, u32 enable)

>                         ret =3D enable_irq_wake(port->irq_high);
>                 else
>                         ret =3D enable_irq_wake(port->irq);
> -               port->wakeup_pads |=3D BIT(gpio_idx);
> +               if (!ret)
> +                       set_bit(gpio_idx, &port->wakeup_pads);
>         } else {
>                 if (port->irq_high && (gpio_idx >=3D 16))
>                         ret =3D disable_irq_wake(port->irq_high);
>                 else
>                         ret =3D disable_irq_wake(port->irq);
> -               port->wakeup_pads &=3D ~BIT(gpio_idx);
> +               if (!ret)
> +                       clear_bit(gpio_idx, &port->wakeup_pads);
>         }
>
>         return ret;

Instead do the following after the if (enable) {} else {} block, namely

  if (ret)
    return ret;

  assign_bit(..., enable)
  return 0;

...

>  static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool ena=
ble)

>         for (i =3D 0; i < 32; i++) {
> -               if ((port->wakeup_pads & (1 << i))) {
> +               if (test_bit(i, &port->wakeup_pads)) {

Instead just start using for_each_set_bits() from bitops.h.

>                         type =3D port->pad_type[i];
>                         if (enable)
>                                 config =3D pad_type_map[type];

--=20
With Best Regards,
Andy Shevchenko

