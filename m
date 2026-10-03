Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD183CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 17:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMiH1wSVwCiyesfMWslIkjdwyDMLwOiiGX8Il+FqIEQ=; b=tEmEClLrvARSBaZph8BX8DavaL
	riRl71WAI9PR1fwqWuo+AAFBSiJQL0KUuLqR2fHfzEu0ffyfna4FRussb7+DHLfWWNH0vV+OOAe47
	zdB/+TyMlQpykfRB+Cm8RL7LUYTA9pBnGbCGXKPIWqH9nWcgC96B5P8ZnulxHBZ3j01mY0ZUsBx4/
	DwESoSwJ9Jvzw7rDSrpr2dDURUS0/Y8Z5e8vOVe4MIuCzdn8bQh1vDsAE0KSR83HMyM6DKFsWAhVN
	CbhB2BsEaZA7j40lolelU09GTgupDw721Obs0nMLT25GlfWYFoGiT+0NTiN5lprAghHm3piYowlpy
	pOk+qxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3oL-0000000DsE4-3Y7h;
	Sat, 03 Oct 2026 17:46:14 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3oJ-0000000DsDE-17iu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 17:46:12 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so129411166b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 10:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049569; cv=none;
        d=google.com; s=arc-20260327;
        b=IvXGn4nttnpu64AXHlwloCen0AC6yU3ONvD2nnEn2Z3IJrEoL02pHJObmGIk8K5udo
         AVMyxhptJ53m+VfzBM0CJCcFxY56PRBWGzsWzii1AOp58CEMbi/cYDc1msWbxLsXwoS4
         4nydiGgP8O+NorT3ClHeMzwgbNP/GiL3ldjt2gwb+4OiIi8Y+BpUP2sI8PrAIIp2lv94
         MW+l9O+nzRp9ZizbnlUM0LAZp0rgm8pZ4yJBbz2peKgY3f6wiR2JVxlxQzYl1J6grJ2B
         I3hMQwv9kqq5gmYYo57LZlpCFQ4a3WLrtr9cNSlMmOu21amEMH7SZiw+bR/pxLa60iG9
         Pu7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HMiH1wSVwCiyesfMWslIkjdwyDMLwOiiGX8Il+FqIEQ=;
        fh=Fn++ELnz2ZukOhoRwKkpMzI7zNEF6j4qA3geKATRlAs=;
        b=dAeL8SZOPq6pn3jFzIXwtO+SSL10M74PNxNa0oVKRjo/GSb7ks5YpF4cYXWvUm1VD3
         sdnXUSGxXw8IqK+d+xIUu8TOXsmNoyYZIgtdGF/sprx7ZLVKCwSYwQu/GrPHQkAcXF4/
         qSOQXnh1fhw11ayUkzKcgF83CS8LWxcxjL7B9PGsASOQ008VeMdc1A6rv5SAAUETAqOU
         MKNTDkJ6WIwiwW+JaRbG9LwYuX5u4sNosO8EutZC/WToeh2CpWboFHqcMn2xziJeUQVC
         wCS3lH1vsuXpCel3WM+0YT57Ck8TIKOkwxNEJM1MyJmxqY96EmYUzs2Go9gSKu6bH2y/
         0K6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049569; x=1791654369; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HMiH1wSVwCiyesfMWslIkjdwyDMLwOiiGX8Il+FqIEQ=;
        b=aEIUP6wb5w86fp7/XpuMS0HUc8Afe/Be+EF+Lj0Ke5jdQZ3zxttLm0S6J4F7ieiZ93
         DBAj1gi7tJsXnkf5KLAdUx7+8CBOvVJjCp2BDloYAKBxBEAS9Rzofql56CUAjycUjHOY
         TFgYpUquufpZwGDwiVH7trKGAPqtENqmn3N0HRFS217awNwAgbNFHvSnaBPdT1WFp1os
         4vBxHMfdA7ClDNbiErSZz5AgU1vS6pcrNY6QKiq8RBuDvtU0uRQIelq21g3zdKMhzc3o
         LdBRrLU+HOaAk16AZCp6OYRyw1XC9m7XKsTMIFhjWIXEwqVSEaDzdaUG7MlJYH+ETdNd
         lQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049569; x=1791654369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMiH1wSVwCiyesfMWslIkjdwyDMLwOiiGX8Il+FqIEQ=;
        b=e6xZEB7gpHmwBxieThM4V3KQuKUiXan1nMNrOaTK6+Qs3o7jPWtlpfVyqwU6a8vNDh
         MXDMRL3RNrUvv2KV9KZoVXidLJ4DhgMgdJAUfjbEPGbTzo8XviiNZEm08K17jTu70Wkg
         Z6cH8O64gTLxr1b/IxsKOPLP212YHeyT2mfQbN9fJfaQG40qGpc7KwP2559it7ygnMDX
         5bxfkBU5d2YFmx5tdbBrGX5Iy+XUZxRHUUkkjxYffKbKtT4pptGyE2N6Q/c71zkK+mmF
         gB+JL7O+N58p860A5yV9z5U19/in/TCSE7Pof13CQ4YDswomr/9RgZoLa9/Bbe6xWYAJ
         8Kjg==
X-Forwarded-Encrypted: i=1; AKwUvBwcOaQkDGgh+dPEmMIcektsvzAb/Xf+R7yzOB9VC1RtBdEaC46Eul/Bb/Rb/JFfQ9pUt/G8wY5V76NzD4eZbp2t@lists.infradead.org
X-Gm-Message-State: AFq9FYL9L2MeD4Oskdc+v0Pc+pb+cQTosWNzX25wz5fAomKKPQ2M5Pmt
	0YnmzowHl6s1RFdA/88uh4pO76wmpdbu4GNUCOgYvBdu/TyevgSSEYKPCFAedAFJcb5VAjxazQx
	33Aqi4CNKovY8p7QNqdMxdSBfjs9/ljk=
X-Gm-Gg: AYBFou0QvlKCxyBNTUT2vjs1H61Lx7V52RTaaiN7PbHlH/C0sO57ntxm6TxPR2USkI3
	n6jRBsyyL3uj7qUd3n4x+AZqXsA+EApiRqbZuaILmdIdAixdexgjawG+mhNAXNUAngodI3Qs6PZ
	ORfH9K3anEwdz/0UX8q/kh3pM8qYlcOpvXuPb5iVDhVAjlaZwNYBLnRae9UPs8ke7YutJrLbiar
	v2fqZgJdWgf7oRCQ74HZkieuYEvWCSKNOasyHsGmFL5g/0BRkUAAHDYmiDE220X+3Z5+bRdywIy
	8jnyxD4Y2z6yc1pG6QCe/y474pVYrZBJSkgBI03xMFgd3qNksWYzB3FvULrOi8q7g1cpdSeEzps
	UGlbrnDZJLk22VD1GH6DI8kZgn83rLDYEdQPVgNadP/94lnflsa25OZbRFLyhTJVL//uYpNeZe4
	WvroA85ycYyeIdrsMvyzCeFU3arKw72JUoSOUIOuIS
X-Received: by 2002:a17:907:7296:b0:c2e:3ed7:7da6 with SMTP id
 a640c23a62f3a-c2e4ada63f0mr521651166b.25.1791049569085; Sat, 03 Oct 2026
 10:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-3-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-3-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:45:32 +0300
X-Gm-Features: AclHuK_DTCjZOQTCqmPG6gDQzEj7LZ2x25KMdK3y7HmSttC0mQYSQAXn5_TTUz0
Message-ID: <CAHp75Ve+qpAhf-LcsNnFwyzQU31FmHkxqZGsEMxd-GEUZcEt_g@mail.gmail.com>
Subject: Re: [PATCH 3/9] gpio: mxc: cache compatible checks at probe time
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_104611_322219_65B87BBC 
X-CRM114-Status: GOOD (  11.19  )
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

> mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
> of_device_is_compatible() on every invocation to determine pad wakeup
> capability and i.MX8QM-specific behavior. These properties are
> invariant for the lifetime of the device.
>
> Cache them as bool fields (has_pad_wakeup, is_imx8qm) in mxc_gpio_port
> during probe, eliminating repeated device tree string comparisons in
> the suspend/resume hot path.

...

>  {
> -       struct device_node *np =3D port->dev->of_node;
> -
> -       if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
> -           of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
> -           of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> -               return (gpiochip_generic_config(&port->gen_gc.gc,
> -                                               offset, conf) =3D=3D 0);
> +       if (!port->has_pad_wakeup)
> +               return false;
>
> -       return false;
> +       return (gpiochip_generic_config(&port->gen_gc.gc, offset, conf) =
=3D=3D 0);

Too many parentheses, also the semantic of 0 is not obvious. Better,
for example, this one

  int ret;
  ...
  ret =3D gpiochip_generic_config(...);
  if (ret)
    return false;

  return true;

>  }

--=20
With Best Regards,
Andy Shevchenko

