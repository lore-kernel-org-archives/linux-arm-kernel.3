Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D7BCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qlNbTonn3k9dHTKDIxbFD3ecc/jQTJTOnDOSezLWog=; b=sMq4Lr6f9yGLjBZUqMLxMj07xc
	XJp5CcIx1W5UOeLBKO6TIDhkcnUtZEo5LUxX4ZN9O87q5z5b9YveJD1zVEcKOPf54Ee9ucMOF5noQ
	IbCcOqx+jVHzZ8XB8ZcA5rF0/Dndp4zqyVx05koDp8DqQnL2b32aLA/XgY6C7V7sCN2RBX7kJjMCC
	pHpmsBzrMNnr+ayXiR8GujWBYbXyV2AjvfgBjK/zrw3wbgNBPlyAr6XTXfvDL4TK/yWnbm3Gmuak4
	IfzPK0Tz2009zqeHA1QJxLJc243I59cpEgkEyR05fqB4gQ4xCBUT4xmq6B9PHJmBkg3aA9YgrJtQf
	Q0+r09tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYfZ-00000008M96-0pZi;
	Mon, 25 Aug 2025 14:59:37 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWqF-000000082Ed-1SfR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 13:02:32 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55ce521f77bso4857720e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 06:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756126950; x=1756731750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qlNbTonn3k9dHTKDIxbFD3ecc/jQTJTOnDOSezLWog=;
        b=zeq+PxOyS6QErBLFyDLQ/nvb3oMdXgoKhK+HKBLjtFim6o+wAX+G4qI13ZaTJTU5ZB
         t7wKkHvT/lJA2S+enwS4sEY0dq3NwuyJCYNPwYneU/H9xjrsnDI4+ph1R7/WGjr7P+Uj
         L+1RO9Gq86w1ZYKf6rOV9rpGt02fNrKxlEEv1TmII4W60JthwxVNVaW+VRcBJKffK8E6
         YH3g17QQVJ6yrCQEYX0zSSq6eDkUPX3i1YkdtvkipOn2wo+iUyFvl5y4xfD/uVDcuBET
         ArXV5QIk2z5eXKqTU3XqgBa4timQSUXxjv8HI+3lzWEZdfEhd+iyMITgycn4lSg4WpLh
         27cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756126950; x=1756731750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qlNbTonn3k9dHTKDIxbFD3ecc/jQTJTOnDOSezLWog=;
        b=kaXEorq/PL5gdsiTXNV7n6MLvNI7yYlkwZNsmvAFVNVjul5hYzM6cO9dnmVYImg++O
         SpPN0ak1ffc8keSLJ956Uez5v8y6ceJjP7Wi0B76hWdhfjApCkb6G+AOEr59ayw924YY
         JnLNIDj3eAmIdnST/jZD6REJIHPBY0SGJDWMPqRZtrIrZqD9Rb3F07XUFwJw8faXxADv
         zinKhQ8q5El+CFCohTmyE9HJuVXoczi6G0cduM0oMfgIFcz9T0h8I885tl99QKxwJV2p
         3QMIinwRwpQyBaKCUIxiIR4yXGNcnjgRkhrMBSmfsipYgYLqSEceleBV5xkv1ZILmTO3
         96YA==
X-Forwarded-Encrypted: i=1; AJvYcCWW+7ZqgOuhcHx2LTKZ+RDACIFKWWY5KEKOe9nHxbkuvn2Hg7d0fdrofi6iMGuUBGyY4JlHtYLXaAdvbBn8GtIp@lists.infradead.org
X-Gm-Message-State: AOJu0YzZBGOeuT6VFTjiZnA++ZAkqKvBcm32tkNdP4iS0dKDrINrPbRa
	laWsTQo/5aTn5ZLN5pSqFwHbaLjeZkkEh10Xeeq9EfUBfxQ74gPV2912yxOxNksQZLLALLmmLzf
	ndYz8IkLlkyq6SXbbhnvCP2xRMh5LycCIy2120QQm8g==
X-Gm-Gg: ASbGncu84k4iKlCusBy/DLf1O/cBDBP+lMosQ2/MhfpQc97khNP+mquHROM2S1gUSVB
	vHlkmgGmbOvFl1lETVuxccP8BzSO0Kh2rcINltjlOVN4CAEjvk0yb4MHRbzpgJSbyCVYX123T/Q
	Utpx9CMooydmEs5xVhBeFPL9JkVK0iT83+h5f2A2V+YRTzQpWkOYCpdWDLGotSGGE4H30+KVhpP
	rrifPZSSqnQ2MJ1ts8MmvrB6NucEtQXrMCGCdU=
X-Google-Smtp-Source: AGHT+IE1cPp7/f2NM1rVH6MrrLLid9uO1WDm7Tr7hJO4vukRyYAlROcawa5lviPhg4lAzMblh0nEsperMiDMgmGGDrU=
X-Received: by 2002:a05:651c:1501:b0:336:511a:5cd9 with SMTP id
 38308e7fff4ca-336511a5e23mr34251991fa.45.1756126949664; Mon, 25 Aug 2025
 06:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756104334.git.christophe.leroy@csgroup.eu> <372550a2633586d2f98b077d3f520f3262ca0e2a.1756104334.git.christophe.leroy@csgroup.eu>
In-Reply-To: <372550a2633586d2f98b077d3f520f3262ca0e2a.1756104334.git.christophe.leroy@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 15:02:18 +0200
X-Gm-Features: Ac12FXy9S__uk5RovBEBeE_m8RhEgixkMtqWHgPxd5PT8kPlrjjc0TrS2oxEL_I
Message-ID: <CAMRc=McNAC-pN1=UUrhXVx8qQiv37HRubui6DMLVRcGg2ZONKA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] soc: fsl: qe: Add support of IRQ in QE GPIO
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_060231_391097_B41A97AB 
X-CRM114-Status: GOOD (  25.50  )
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

On Mon, Aug 25, 2025 at 8:53=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> In the QE, a few GPIOs are IRQ capable. Similarly to
> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> GPIO"), add IRQ support to QE GPIO.
>
> Add property 'fsl,qe-gpio-irq-mask' similar to
> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>
> Here is an exemple for port B of mpc8323 which has IRQs for
> GPIOs PB7, PB9, PB25 and PB27.
>
>         qe_pio_b: gpio-controller@1418 {
>                 compatible =3D "fsl,mpc8323-qe-pario-bank";
>                 reg =3D <0x1418 0x18>;
>                 interrupts =3D <4 5 6 7>;
>                 interrupt-parent =3D <&qepic>;
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 fsl,qe-gpio-irq-mask =3D <0x01400050>;
>         };
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/soc/fsl/qe/gpio.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index a338469cebe4..91d469403126 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -13,6 +13,7 @@
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> +#include <linux/of_irq.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/slab.h>
> @@ -32,6 +33,8 @@ struct qe_gpio_chip {
>
>         /* saved_regs used to restore dedicated functions */
>         struct qe_pio_regs saved_regs;
> +
> +       int irq[32];
>  };
>
>  static void qe_gpio_save_regs(struct qe_gpio_chip *qe_gc)
> @@ -135,6 +138,13 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, uns=
igned int gpio, int val)
>         return 0;
>  }
>
> +static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       struct qe_gpio_chip *qe_gc =3D gpiochip_get_data(gc);
> +
> +       return qe_gc->irq[gpio] ? : -ENXIO;
> +}
> +
>  struct qe_pin {
>         /*
>          * The qe_gpio_chip name is unfortunate, we should change that to
> @@ -295,6 +305,7 @@ static int qe_gpio_probe(struct platform_device *ofde=
v)
>         struct device_node *np =3D dev->of_node;
>         struct qe_gpio_chip *qe_gc;
>         struct gpio_chip *gc;
> +       u32 mask;
>
>         qe_gc =3D devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
>         if (!qe_gc)
> @@ -302,6 +313,14 @@ static int qe_gpio_probe(struct platform_device *ofd=
ev)
>
>         spin_lock_init(&qe_gc->lock);
>
> +       if (!of_property_read_u32(np, "fsl,qe-gpio-irq-mask", &mask)) {

Please use device_property_read_u32 and stop including of.h if
possible (it seems it is upon visual inspection).

Bart

> +               int i, j;
> +
> +               for (i =3D 0, j =3D 0; i < ARRAY_SIZE(qe_gc->irq); i++)
> +                       if (mask & (1 << (31 - i)))
> +                               qe_gc->irq[i] =3D irq_of_parse_and_map(np=
, j++);
> +       }
> +
>         gc =3D &qe_gc->gc;
>
>         gc->base =3D -1;
> @@ -311,6 +330,7 @@ static int qe_gpio_probe(struct platform_device *ofde=
v)
>         gc->get =3D qe_gpio_get;
>         gc->set =3D qe_gpio_set;
>         gc->set_multiple =3D qe_gpio_set_multiple;
> +       gc->to_irq =3D qe_gpio_to_irq;
>         gc->parent =3D dev;
>         gc->owner =3D THIS_MODULE;
>
> --
> 2.49.0
>

