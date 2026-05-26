Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C85CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhuqxR/QIe3nS20UsYxd6qka1LHnS/Vv+3trUyjXJgY=; b=LdR81eN5x6FV4Bk5rOjckWV3NI
	2lILd8xXEnwPd8H+v9LjDg5rbT2oXvYExWugm4m2bl955MmRGynO7Y2TZfX5b0vek9gx85ZiNz5ki
	CewQgGVFbNeBmwH+JQiwWlYL50F3eikXSEiNYLRUEsYOSwTZmWMD/JYgZEq61s0tzwpbqZhEsd7bT
	wWgG0AkeRyXtgt/qTWfc1e5UvpWxZEMCKGZBMU8KEry5HAhlYdFnvBc0svWT7hJMaRbVIAIkjakpS
	W6RMWCyllqcYiFxx0tc20ziBcVvIyK+9a9VvX3PoHo1oRCUg1rMXZrRBwEEIivHz/lMicYf26YG9+
	4M/DA/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpPs-00000001hRP-1was;
	Tue, 26 May 2026 10:53:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpPp-00000001hQJ-3otR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 10:53:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F472437BF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139A61F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779792821;
	bh=WhuqxR/QIe3nS20UsYxd6qka1LHnS/Vv+3trUyjXJgY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oL2Gh0JsgYvwkQlyQh9IICOYgChS38+93irPAGfuq9/vZ9gxJ9VXQbee7s2dv3A5n
	 VLjuylBuUJtjOZ9C7X7zM1TN5puJ8UyHYCdzbbIO3u6FqfdYLTzWyK01KThe+QLC1l
	 bdIiooU3boem5n37PN4Q4JQoAdO+6xrzFG8MTy7QTWcmWPKHck/4rhVKi3cnVoAAF1
	 B2zhCztsa0+ScJTcM/wkjP/N1W1VvgVvzXxQrvSxYEFx5lbvxAIfAzhwbAZ652q0Jv
	 7AHUjLSHy9BzwYdZb/oAOuYJZi94BoR2IRGdJlpLoSwqRTkM1pUv1EZ3/zcyLWXjAy
	 i5uYyX3KlEIqw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso4947981e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 03:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Jyrlx9Kc5ix7PAGbGoNcpZN68gsIw1Q2LBZmFeNij1DWef4ux+NsWksy4QMLbijSuz1qKMguRnayXewAFAWXf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx24JhxjrQouJixjuREnwRX0Wns532GsYeVoyOCIB4/wI/Hhqja
	8Q82sBf8bNe2JlujL5yBYtCu7PPLPmqBDeQmiOtES6HrkyYQ+3hNQpiSrJMx+Mfask3KQQAvzzh
	bQmO+wzIbP/8TyUhPX9Ufz9HQlMyKXgNJdFUNBvFCcw==
X-Received: by 2002:ac2:4c4d:0:b0:5a8:7ca9:9f81 with SMTP id
 2adb3069b0e04-5aa322fed0amr7213835e87.0.1779792819733; Tue, 26 May 2026
 03:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260525164230.43307-1-scardracs@disroot.org> <20260525164230.43307-3-scardracs@disroot.org>
In-Reply-To: <20260525164230.43307-3-scardracs@disroot.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 26 May 2026 12:53:27 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
X-Gm-Features: AVHnY4I2BwinMwSq8u5U4_yQOEEUDoRNRKEENiOHIvRdG1GkR8xNAptPz-zlq5o
Message-ID: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rockchip: fix teardown bugs and resource leaks
To: "Marco Scardovi (scardracs)" <scardracs@disroot.org>
Cc: linusw@kernel.org, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_035341_994327_CF1035AA 
X-CRM114-Status: GOOD (  28.81  )
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

On Mon, May 25, 2026 at 6:42=E2=80=AFPM Marco Scardovi (scardracs)
<scardracs@disroot.org> wrote:
>
> This commit addresses several teardown issues and resource leaks in the
> driver's remove path and error handling:
>
> 1. Debounce clock reference leak: The debounce clock (bank->db_clk) was
>    obtained using of_clk_get() which increments the clock's reference
>    count, but clk_put() was never called. A devm action is now registered
>    to cleanly release it on unbind. Note that of_clk_get(..., 1) remains
>    necessary over devm_clk_get() because the DT binding does not define
>    clock-names, precluding name-based lookup.
>
> 2. Unregistered chained IRQ handler: The chained IRQ handler was not
>    disconnected in remove(). If a stray interrupt fired after the driver
>    was removed, the kernel would attempt to execute a stale handler,
>    leading to a panic. This is fixed by clearing the handler in remove().
>
> 3. IRQ domain leak: The linear IRQ domain and its generic chips were
>    allocated manually during probe but never removed. The IRQ domain is
>    now removed during driver teardown to free the associated generic chip=
s
>    and mappings.
>

I suppose the description comes from the LMM. Please use imperative
mode as is customary in kernel commit messages.

> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/gpio/gpio-rockchip.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 33580093a4e7..c804f970d823 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -638,10 +638,17 @@ static int rockchip_gpiolib_register(struct rockchi=
p_pin_bank *bank)
>         return ret;
>  }
>
> +static void rockchip_clk_put(void *data)
> +{
> +       struct clk *clk =3D data;
> +
> +       clk_put(clk);
> +}
> +
>  static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  {
>         struct resource res;
> -       int id =3D 0;
> +       int id =3D 0, ret;
>
>         if (of_address_to_resource(bank->of_node, 0, &res)) {
>                 dev_err(bank->dev, "cannot find IO resource for bank\n");
> @@ -673,6 +680,13 @@ static int rockchip_get_bank_data(struct rockchip_pi=
n_bank *bank)
>                         dev_err(bank->dev, "cannot find debounce clk\n");
>                         return -EINVAL;
>                 }
> +
> +               ret =3D devm_add_action_or_reset(bank->dev, rockchip_clk_=
put,
> +                                              bank->db_clk);

Is there any reason to not convert his call into a devm_clk_get() variant t=
oo?

> +               if (ret) {
> +                       dev_err(bank->dev, "failed to register debounce c=
lk action\n");
> +                       return ret;
> +               }
>                 break;
>         case GPIO_TYPE_V1:
>                 bank->gpio_regs =3D &gpio_regs_v1;
> @@ -789,6 +803,9 @@ static void rockchip_gpio_remove(struct platform_devi=
ce *pdev)
>  {
>         struct rockchip_pin_bank *bank =3D platform_get_drvdata(pdev);
>
> +       irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
> +       if (bank->domain)
> +               irq_domain_remove(bank->domain);
>         gpiochip_remove(&bank->gpio_chip);
>  }
>
> --
> 2.54.0
>
>

Bart

