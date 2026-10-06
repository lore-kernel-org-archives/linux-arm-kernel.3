Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B487CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 08:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPUBVtwXpkjB73xJy9d9sGCYrAAokkcesa5s+T0NIQc=; b=XZsu7LIlT8NLy99O37qSSbrzYy
	sO0t5NfRq4vKFbgyDdYyenY+AcE0vqTW73Snuyh8EqPMBKIjGyp5en2II8zCgh3VbAmYIrv8vKDSr
	NzULeYMyPTdsAIqHHS+H6lpxM3Dt+vQBWYA/KnvuKWL7Sutl4xkL6NaiY/jvHDoA4f3CnVCQIw7iu
	9p3u4UMvN6kZabDw2eo4jiwhIlan+yFYdJfW9AYwibux8S9pXAPs/cMhyXNISbfCIJAdaYfzfd+Zs
	I2NjdlNjS2/hsqDcDxFtsxhlLl1lNnZDN+CGnqASKsxOB9S2iRcqGFX/H2saK3SBMtN7gUycAUTmL
	adOt/rQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0fR-00000000IZW-2TS9;
	Tue, 06 Oct 2026 08:36:57 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0fP-00000000IYA-1Jjl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 08:36:56 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c2a4e013a44so383823566b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 01:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791275813; cv=none;
        d=google.com; s=arc-20260327;
        b=aojbxYGtRSzQkjKDDCvKT4pZn3rrUpVIFc74LmX95Q0tutoRnI/ZfJsF9KvISimzUW
         uKFoc9uQtcvoAgYGA5wPrRdtQA7yvYGKCS8dX7cP0m1fZQ8hOMI2XzbLxqiIhv6OTGfP
         v62D1/RVYnIXk+VhLJCn/xVALujRfHe3oY9jVaXCAn7LguM6Bg0jlJKHVoNhfIGu9g4I
         ylTiIWPflqCOUMlYngS0lRhfcMcX2kuOcUv7U2x5yVoPSG197sqj8tqVgFge7MYbUg/I
         AR+pju+RhAhFt/Mvz2SCVPIALcKtawbckPJgyfYktQUQSL97ex5Bw83szXLuOJUahzQQ
         nBlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dPUBVtwXpkjB73xJy9d9sGCYrAAokkcesa5s+T0NIQc=;
        fh=63t6jzsB+R+yM6wYaCaiduFzFymVWiKK4h4nqIWG0XE=;
        b=EnWk/EpvONrLXImdw0i+6FbLsaaGJMA6yNdx5gpoV7bSvvHEKsvWSZDVUVh8BVXCyG
         NxWwNLwliqCRVKw2jrm+8cuGeaKOgoIWFNYrJjXW6Gay+70IaAmyctdQD3OyhBVa7LIJ
         PK4i9KLtfJtqj95iwfa7uGuDUMYGkau1+01Bc+Ss6K4XXBECdraX1vP3wxHAeR3G1Sa2
         OOR39yBiLtEA/EHvQnE/ANSG80F3qUvLa0JCTy0CiZFnZc5x51nlCAtiGTOCYMD2n6+w
         DuQExefahDAfdTqxqglzjdAHl/kjOSlmy4UVA9BmymdpZkYl9GFTe2CG3LFVJoiB1ZyO
         betg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791275813; x=1791880613; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dPUBVtwXpkjB73xJy9d9sGCYrAAokkcesa5s+T0NIQc=;
        b=FmPY7E72UUfl61Cq+E8XuVlA/b7PlIPZJhIAXC0rXEZ51UrbrrjujMO4eUdE42Mi+e
         8eh2DNi9maoH9NjKS4+v+yTVGM5gSyF4Scsri1MVYKeadtFaHBTim/2o4evDiE5CGJ5v
         wmvMTW/FvPe1CqA7luK9X5+zMqeVFwoGBP72B/qPmmKjhyBS7veJihVngrjsOlaJSIRA
         IS8UCY5brY3OJ18iWnEfLJH7nvW7jPMJwuC7Hr5nR73dRnRMy7U2RvqmS0d3dylUoG7r
         tRXmWLXbdinOdX6DqJBtD77cTxZ8P8Ok6Pv3nH6FaoSidxAdKpYOhvdKSiI1IgE6ISpa
         QHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275813; x=1791880613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPUBVtwXpkjB73xJy9d9sGCYrAAokkcesa5s+T0NIQc=;
        b=F2Ids8AroQDE7O7/3FvTClU+ROMVT/2c82zPhBqz0G0KOz7IoCQUWW/UiYp1ZkUw8M
         BwtQaouRm41UbzMnhKwSTlQFgCZtogqCXDl6cldKU04eV8k4AW7LwukSawwJaNlLBbg4
         i5bpo8dLznnDba4YfwvV1TgfXV7vSXWdFkHQNEtqubbRt2axgz4QGy8HPRRyUHNWgo/Y
         TW+teW/p/uGOAokFIKqEIV7WYeqqVHlHvltAK1RLqTInokuAqdVZ43D4eCz7lOiP0pDY
         NmK6c2rwcBw2efsAhD2wYVtW8vz8St3zPdAC7aSEcoeffUSZhmYTctzMLEqF6FrEpCuF
         COyQ==
X-Forwarded-Encrypted: i=1; AKwUvBweIPAW9FULAK1hTb9/atMboDQNJLnyzLpzBUuGdg7VFB7WDNi92rm0Yc2Bi9jegYd9x0UXzA92bd97eY731oio@lists.infradead.org
X-Gm-Message-State: AFq9FYIT1HfWyRMWJvb7Fb0L7eKnfRYQRfwKek/sZoIAL1Zyj6JNJ0pe
	hTqwWbIwr+8zH60Nb9sBXUDu5UFosUUFWxCMvmFlE2dD2d6gHyfI5A6vhZkVNfwmgQ5+kf2x18A
	XGZweEk/InM/RGcthEEUrza/JEWjSm3I=
X-Gm-Gg: AYBFou0OodibyhwKH8GjQiw8uC3COXteI2zgAqIY9+yFIJWMoDz1ype9+9RiUAnEFwE
	MWZ/7aQJ4+F92czBaKL5dmwIOgB63+VNberyORu4bqxQxGrFz4lS7cNzgIq3BwxCbd1TNzEgcgN
	D/Af/DgiMbYODRiR2xaoeAeHtc6m92BkHXV6LMhKRIFpgKcF96VibZz7uHxOGtcQq09rwEPLjvW
	P+/k8bwP5toK+xxBetOE3fGY6D2bpsKzY51eXeLzKp36IM0z4/onMnr8xO9vI8fTzUAKDNOLwrD
	9tESgXMatf0lmL93FxwludsOjtI5hE6xr0k8HfM5X31hZmmbDq3cyZYVQWfDaD5qsOGU8v0Baf9
	YZD7E8kKwyPlyhQrMBar+31zr9bzC2xo3GVc7zpMfekchH9GjcA/M2v6dUgbpOBasYLSIcN+PGM
	e7z7fdtz9L0fPNxV1X3f6JGQlcjH1RFcj1BNO/HA==
X-Received: by 2002:a17:907:72d2:b0:c25:5d2:acf0 with SMTP id
 a640c23a62f3a-c2e6edd8780mr930969566b.8.1791275812937; Tue, 06 Oct 2026
 01:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com> <20261005-gpio-mxc-cleanup-v2-2-bdc3afbb35e2@nxp.com>
In-Reply-To: <20261005-gpio-mxc-cleanup-v2-2-bdc3afbb35e2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 6 Oct 2026 11:36:15 +0300
X-Gm-Features: AclHuK8Hq92bjRrFR2TwWslr-iyvEz8Se8OVWpb4AqiThf6eR9JzszKQNdfvLEQ
Message-ID: <CAHp75Ve+p6TMr7MwQw0orGdjxLgNBN8gfTw2SY+EKBBgCyYXgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] gpio: mxc: fix wakeup_pads bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_013655_387591_627BAA48 
X-CRM114-Status: GOOD (  19.78  )
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

On Mon, Oct 5, 2026 at 5:24=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port, so need to use atomic bitops when modifying wakeup_pads.

so we need

> Since wakeup_pads is u32 but assign_bit() operate on unsigned long

operates

> pointers.

This sentence doesn't sound like it's finished.

> On 64-bit platforms this causes an 8-byte read-modify-write
> on a 4-byte field, corrupting the adjacent is_pad_wakeup member.
> Change wakeup_pads to unsigned long and reorder to avoid the overlap.
>
> And the enable/disable path unconditionally sets/clears the wakeup_pads
> bit even when enable_irq_wake()/disable_irq_wake() fails. Only update
> the bit on success.
>
> While at here, simplify the logic by consolidating into a single
> irq_set_irq_wake() call based on the enable parameter.

...

> +       if (port->irq_high && (gpio_idx >=3D 16))
> +               ret =3D irq_set_irq_wake(port->irq_high, enable);
> +       else
> +               ret =3D irq_set_irq_wake(port->irq, enable);
>

This blank line may be removed.

> -       return ret;
> +       if (ret)
> +               return ret;

...

> -       for (i =3D 0; i < 32; i++) {
> -               if ((port->wakeup_pads & (1 << i))) {
> -                       type =3D port->pad_type[i];
> -                       if (enable)
> -                               config =3D pad_type_map[type];
> -                       else
> -                               config =3D IMX_SCU_WAKEUP_OFF;
> -
> -                       if (is_imx8qm && config =3D=3D IMX_SCU_WAKEUP_FAL=
L_EDGE) {
> -                               dev_warn_once(port->dev,
> -                                             "No falling-edge support fo=
r wakeup on i.MX8QM\n");
> -                               config =3D IMX_SCU_WAKEUP_OFF;
> -                       }
> +       for_each_set_bit(i, &port->wakeup_pads, 32) {

This change can be done later, can it?
(I mean in a separate patch)

> +               type =3D port->pad_type[i];
> +               if (enable)
> +                       config =3D pad_type_map[type];
> +               else
> +                       config =3D IMX_SCU_WAKEUP_OFF;
>
> -                       ret |=3D mxc_gpio_generic_config(port, i, config)=
;
> +               if (is_imx8qm && config =3D=3D IMX_SCU_WAKEUP_FALL_EDGE) =
{
> +                       dev_warn_once(port->dev,
> +                                     "No falling-edge support for wakeup=
 on i.MX8QM\n");
> +                       config =3D IMX_SCU_WAKEUP_OFF;
>                 }
> +
> +               ret |=3D mxc_gpio_generic_config(port, i, config);
>         }

--=20
With Best Regards,
Andy Shevchenko

