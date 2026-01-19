Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CFDD29C4D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 19:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Y1wTxdZLJ7XhSQYYR0Ku2EXGP2C5XG02vKe6+mSL78=; b=sO7GRIIPvP4yTQFGQqnuPJRMZc
	wyWAWAIKej3A4lY5iJ/ItKG/28RiqrP+qWKdAJ7yZ/CBN0EN+yhjU23Nwo9E1sULHUaB0NpkyliWr
	8ozc2t2C6O7UY2oS7dQprzxnvZ6T+DGX6/CEVCauLjOhKT1SfnrclCi61RJPDOUDR7cqpiIGfAQi0
	DiUAb5a8Rhz8zZKqzXnH1IjZtiHpRiJnJ4XBuHpDrZefpj0gW1xLw4C86/tTiMm4y2ikNnumIiIz1
	ltMJW4fN9X2vL2r41td7AQQPApnlwjaWnqcozSy3lZEXqyXa10FCNlICrMZ1LPvKIzGOGByv2hqva
	edgUqpLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhusk-00000002mTT-3Bt2;
	Mon, 19 Jan 2026 19:25:51 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuse-00000002mS3-2OC4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 19:25:41 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5636274b338so3784166e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 11:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768850739; x=1769455539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y1wTxdZLJ7XhSQYYR0Ku2EXGP2C5XG02vKe6+mSL78=;
        b=jlB0UKW8lrspmzmB7w0US/+5XghzOhjiZxsB9FTr3ftxLVgbimH4vXYXz6IY9tlaOr
         4cZAleLHtuttUiqytVRNYOKDDN/xjvSgEq6wQR9CSrlv8atYo0HZY7XaE+8jA+elHXZy
         jkEuOplE7LI6vYq/D+HscGit1ROnOMYcaghgYim/F7c89P3RBTNTEew3xrk5wnagLikY
         3sk2IwpxK122Xz6LOe5QWj5aKvWPF0ws3+sxEAVphacSLzDH2qiZ5nYEiIRJgqgNhSHR
         oKcvdcxvq92UcZAIGD3KeWpaf4grfkJ4ulRVnCV7oioaMb/2AaJU0EQh8+WyFeFQJPZg
         JSvw==
X-Forwarded-Encrypted: i=1; AJvYcCUR7y6fNwxu619nezsR2ynOqfaYiJnZVujHKmCzJq2FdOdZ3w8+l/Phj6LhXU2755Nhqm4cnydjekqC6aTPY+GF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8q63+l8FTllFSFB2KsYIjBjMNgkvRo0F/WZ3ApNtcbmyOUZkr
	UctrKj/qxPCmpBBdoCqC2m9L4oYAE7TfjDE0bLbY+M7V7QFTZPE88RSs/msI39or
X-Gm-Gg: AY/fxX6X6Pr0VFRB5iAhvon96+EQZ/E82E90EBujIvVIhRXl0jAolxj29GWYMc9PtSF
	tMvCjU5JRIC8MOjopAW/RW/KwwGX+ae5e0qpDMoJhdyIikFrFt4332NiftwC6sMmsTNoXYiSc4k
	HGRA1WmU5u2q1HtETd4Ic8+UeINHdtpukgGmhQELhupc1FytP6kARPzrsvVoxdsD+pvpvtKRYJo
	EofgY1VbqL8Nbhrv9cueeRrkLN/nsnvj6Zm6UJgnJuSd5aWhrBRSnUTtOp56nzswDCikyjI+9d2
	PVqcyXYKEASu+ao6uDW7SpUKL4K5zx919UHO1KmQQDcZKN+eGIfqKdBEzduRffUcQnTWOCz/EjX
	dv0FbtfmxYV10pIlj/R313/rBNzCmnQz1v5TDlWVpLQtnOB9Lmk57s0+aYx1bHcA6XfbixKXY2m
	xA4nzs2vZuIZGYQYOVHZhhupMmwXJdlvNJhbYO5HsO3UOt4jh5
X-Received: by 2002:a05:6122:8008:b0:563:50ff:69b4 with SMTP id 71dfb90a1353d-563aa9c7454mr4681078e0c.7.1768850739113;
        Mon, 19 Jan 2026 11:25:39 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b6ffd215sm2977131e0c.6.2026.01.19.11.25.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:25:38 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93f5910b06cso2781255241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 11:25:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCnMMWR2zuWjgd2tx7f45Nj+18yEgZ7mxjUJ/jFTLaJY6nsyMB5yx2Of3YWDrcWaMsL4eMRx96qDpFe9Bwoio6@lists.infradead.org
X-Received: by 2002:a05:6102:3e96:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5f1923fb2c1mr5826988137.5.1768850738083; Mon, 19 Jan 2026
 11:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:25:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
X-Gm-Features: AZwV_QjRSaQ_qXyXNZN9OqtIjEIE6rAZwNcvdO7jDgxqMH0vtYkLnv2_hmzs9Y4
Message-ID: <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
Subject: Re: [PATCH 7/8] soc: renesas: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_112540_613442_4635BC2D 
X-CRM114-Status: GOOD (  24.80  )
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

Hi Bartosz,

On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
>         const char *soc_id;
>         int ret;
>
> -       match = of_match_node(renesas_socs, of_root);
> +       struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +       if (!root)
> +               return -ENOENT;
> +
> +       match = of_match_node(renesas_socs, root);

I am not so fond of these of_find_node_by_path("/") + something replacements.
What about adding an of_match_root() helper?

However, in the previous patch you used a different strategy:

-       if (!of_match_node(imx8_soc_match, of_root))
+       if (!of_machine_device_match(imx8_soc_match))

>         if (!match)
>                 return -ENODEV;
>
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

