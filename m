Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9261CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kV/daCkEcG+SwQxwP8rLI06AhxP77k2xK+9iHAJSDFM=; b=TIn/RXgWbjt0f3vxfpW/YYMRzR
	4SB3maTuUtBXF+cXXgwNpsuz9auus9cBv95gWhdeUknsKUYjXpaxfok044RPXatEz7cvdlt6qLqcY
	wh3T9kLQP0dvaYQ2KNw5b6RN8BRpOt6dTzwtq5lOmckw+8TO2VPZdQgBvuCxvKGL3y1bOgX3R04vh
	2/VkCALgiv+iKpBWS/5H7Hh2pfRzuoQfU/B4w9rMwMtiTQlUB7rbX+NV4fwCZgzZuxlZDAcK3rbFe
	1b/3yqP74GYihKqjLFRlenAKi+ET1WshfwXMlFTe6w6vTQytj6jp4J8GyOHFwiQCEAgnr71hG+2NS
	Cu+uX4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCMt-0000000A3xg-1SqU;
	Mon, 12 Oct 2026 09:30:51 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCMq-0000000A3wJ-1EPF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:30:49 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so11665881fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 02:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797446; cv=none;
        d=google.com; s=arc-20260327;
        b=A9GmPZZqMLginO9kXFLbLb5ReTgA+C0sgHHuApMdJCy+z1ZaQOEEAivhZDr71BxigY
         mn4Y2EhZ8n7Y8LTqx59lninTtx4zMaomzQf2X3pqxYNg1+vIlI3eU9AM5wgmsdBthUXe
         /gzff2EgRu6fL7PnD87xtuMYHSva8d+Wbnyr9LBP6Y6MuJiRi7OUkkr3R0aVGfV6tVzZ
         aDJDBavrDE4HO5OrfPlUMUiaLs+CqjJon5gndkVfOK5OclDMm38KRAeYBDDrsZ6k31De
         BNvOFm0SLxfHRo1bzxQy8DJMxe3hxptKOEmQEJxc5YBij9e4IEOJOI1X1U9A1pb4hSt5
         S35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kV/daCkEcG+SwQxwP8rLI06AhxP77k2xK+9iHAJSDFM=;
        fh=krkpBRxrJL5FbfqAPoHL//G17K+Ee/LVYQok3QyzENg=;
        b=CvDcIseUZ9yGd84FceTNDdbMVuVZc2nvXSFjF3dYrbsdaw5hTorNIUC/THEwAOGe9t
         i6HOifb7UDG7noIexXuXtw1plJwnJu4k9jwQ5fdT+ol5eDCLN17iZC3nM5IZT2c0ciDp
         ATw3f7fsfsIBn28jmUfNgZmK73nxfpqI+I+LpRTdT7wJMO+U4IriL8qC3hY0MCdPJjWk
         VhoLA32JINe2pGvykDUfzUD4XIv87D5umX9iHqarqS64Jhkkp4bV0qF4T9xPdgBURjKI
         UafWm9zbJIkjJ59rrfyr3I0vWXzRb+FvjJfxs14+Mn49BQu3E8ZW1RfY2T1HInDmwOV6
         5ybg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797446; x=1792402246; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kV/daCkEcG+SwQxwP8rLI06AhxP77k2xK+9iHAJSDFM=;
        b=fGMdlG/4PA4ng0E/poKJUQj5Bj+7nK7UHlWwjh0VFKpDsPHcIHPE3Z8995uOqLMWUx
         wBWWYeg24PgxT7b4qCT8LsaYAJaeaa3uPSrDyh2Zy8BiRinv/d0jC7eoqkUaYIk4GN+G
         ps8YbKACBongbchOJxST/gpPzIAUWYfEzNDtU6OYtPrW5Q0a8x32VSh3kC1Q2BUbKKQ+
         v4EOzNxX7g/8B5Ljzd8FQSgR1Z6lcJsO/FSoaU18Lvu4UUvS94IE7WsNVIKJbni18c1L
         GArQcoV0IARk8YFgyuaD6qTmomHdzV/u4xNviYQpwm4D7uxrbomfMNLHVpXtrWcRfDKZ
         YSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797446; x=1792402246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kV/daCkEcG+SwQxwP8rLI06AhxP77k2xK+9iHAJSDFM=;
        b=J6ER+iX3vNTq0PXxFClzmehlStziwIUW10X30Na3VzqX9R2S3natb1Z1qAP0X0ylh3
         ePeeuOUuRHpsTfea5uEbQBEruxza9nG/xCVTSyOatu6YiVeXKao3slgVPGRQ+5rmK4Dz
         KbeYzafc+0MojSi/Hc19QTvY4QZdg0V32b/ct+E3pV0ScFOQ/MC2yvqT+sL9RiL+dNJi
         8JCbaJzxvuZN63gYmM925TlQ4RQ3IIrnfzL6pA1NO2rAURt+SlxgllFH04VmSF5AEvrf
         0QleZvkJ52xfUx6MyWeji6Xld59r7frjJXvriXXDGdVtTr47If1atWI8ifPo/p+XYMkE
         sx8A==
X-Forwarded-Encrypted: i=1; AKwUvBxNTHqwEdDpNvF9q2K4yCPtuGqJz5VpmAKGju/0Ud+awCMRJYpsZ0utrSM43iWCylnJCT9OhvRyMFQCrS4LWcld@lists.infradead.org
X-Gm-Message-State: AFq9FYKHe6Log4WDja9jkZzntORzDJxzcva3fneceVKHNywe0QjVmiuy
	KLSlsWYZDAsbC9+xOpsbPQ2rcjQpo6xlAoT3nWIMGLyJVuLZT7N2L1fs8VCOlZWGWucdUJCx9F/
	KQE4G9I1kRHz+vm7bcGk+jwp1gseFu2w=
X-Gm-Gg: AYBFou3pQJtNoJ+0+nc6guVKzKQDa4rZEVXeVPakSPBO1RwO0HHyAKF90QbCQBbfrsE
	uN29FMWpb7tLbrK59inYMeTDPrL0CHo9jenll8WKzFsu7d3lmA0eydccNdt7V1Fk5Wg5KDrrUcN
	KWRy3YaltdPOxOjzbLWuxBUrQtTLCi3IhXrSEfTf90bCqcWfco1nPOGDsAoB/ODP5xP5o290bNh
	WWWZ0W8sAoFI3x6gP+WE+Icqnjs7gdDo/prmvjsfo2isb/ZJdcZs5OpOaagn9AXd0SzbQfZ6LXK
	o9fnQcK6X6Tdaw/Nq8ro1RzN/riaifxc/tEpAuf5dlJKnC9bvUbx/XskuffoUHK6iG7/o/3fx7t
	iyV2DyY2IlPAEcw5+9p7sFBZ4YKZeayS+PM61frjc7D3Guri2D2Z/vE8i9Mw2ZYyMgmRJswog5o
	DSxONeKWi62GlU1R1BcpLRvK5XTKTx7nA8D41UV9UR
X-Received: by 2002:a05:651c:3251:b0:3a9:8167:62a with SMTP id
 38308e7fff4ca-3a9c539d80dmr19489771fa.28.1791797445959; Mon, 12 Oct 2026
 02:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:30:07 +0300
X-Gm-Features: AclHuK9e_oZT5Sa46rEJHVX3lFg1Q7os3EVH632mfdiuI60h5GYQ15qLL0jo-NM
Message-ID: <CAHp75VeonKZtX8moOdXrmTJbjH5Ew5iVdDDc3KfqQ9r_tvHg1g@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] gpio: mxc: use local dev variable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_023048_361094_8D128527 
X-CRM114-Status: GOOD (  11.45  )
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

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> Introduce a local 'struct device *dev' variable to replace repeated
> '&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
> readability.

...

>  {
>         struct gpio_generic_chip_config config =3D { };
>         struct device_node *np =3D pdev->dev.of_node;

Why not this one? Is it even used? Perhaps you want to have

  struct fwnode_handle *fwnode =3D dev_fwnode(dev);

here?

> +       struct device *dev =3D &pdev->dev;
>         struct mxc_gpio_port *port;
>         int irq_count;
>         int irq_base;
>         int err;

...

> -       dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
> +       dev_info(dev, "%s failed with errno %d\n", __func__, err);

This message simply needs to be killed, with initcall_debug in the
kernel command line you will get something similar from driver core.

--=20
With Best Regards,
Andy Shevchenko

