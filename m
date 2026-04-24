Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D6BFB44C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 07:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciAlsa0vHFigJqeo3ptgM4Yx67zHMqEoXBu2Oa4l5+o=; b=EJZl0HPpPfo5eNihqGVDgMcDEe
	kT32844PdnzYj1chiO68zGb2iNYAlKCDbvAwFQpTRF7ILpbcjgJVWTrgQGrbcarVpZQrBTAM12A8t
	kAID3ZWq317gNnBKoUmbsmpDIptje9skRgo3WvCKKYp7diMj4CNeVen2BK/0g+LWM9/oj4S1ltyBN
	PWjmhb26hmresNnytg3neiE4AqdOweN0a5LPQKcFHL5rBbkpvj6f/4QItWmlcwIR45T2G/LYM6YxO
	iAq4vo771jiKDBllT8qFy3jcKwVhUYtmSjTdrP90PH/Zp8F6yaRnm4iVGTWtKjEv4qVe0HC2IqDx7
	+rrZtVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBD3-0000000Cp7F-2XTX;
	Fri, 24 Apr 2026 07:44:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBD1-0000000Cp6r-2POv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 07:44:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46500442B8
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D8CC2BCB4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777016657;
	bh=5ObiY7L/NEZ2AVzTJWRLxmU4Cg40y2szTcf05CZbkBE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XzVBZ0emHqYcfGw31lpnCzF0BdOdMSefCvbGjl08UMCG9TeIxzEjs/QybM5efbsCH
	 TsAIXP0XnM/gayvMyDXKONLXjvwb+rPKxn4Akjc/07VMHdFtL+rJKN5utcpjbvutA5
	 oTyS5H3KIN4B7dkVK14WfxwfaSnc8d7V0g/jt/GDjSy9orqxSyN6wau8JpNxFleeyl
	 GHXyxNvJHYyxrtXy9G0rlvB1SRliyxvdFiFT3LOFIClDm3eHD1AhwoGYBG1wM5uAF0
	 rpmjYB8O+goJLsapKNzzlQDd6ISSNQaNVWJUulEBS6un/lWFn+I5Kq5Nt1QQv7yhuE
	 BsmyjzIVdXL1Q==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a3be187ffbso8024867e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 00:44:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/fIiU26hds697mADEu4DETpdsQFoxoUmK0djWDWfmLmyPeTKg7Cnslr0guDVTIkAbr0Q6RiGJXifP9XK+TB3H2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywes5wXagcUUqoLhqIzPodOLxZqJKpVfrZC9mKMJ/PvX8prEo/j
	kuoM5cBQEYc9nEZ5FiWjqv5CJtynH9xbACAkUuqrfiCyUwVpFPHy91uxVbe4HiEjygKUH/1j9/t
	3+rqWILwwePwHWmMqk39IMGqHiUtJ750=
X-Received: by 2002:a05:6512:1095:b0:5a4:e53:f52c with SMTP id
 2adb3069b0e04-5a417299818mr9911885e87.16.1777016655855; Fri, 24 Apr 2026
 00:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-2-b5c7e4c2e69b@axiado.com>
In-Reply-To: <20260414-axiado-ax3000-sgpio-controller-v1-2-b5c7e4c2e69b@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:44:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLkqD25mudwd0wBCz=-FCzgzssOv5bXTNDdizxdCOY0j=A@mail.gmail.com>
X-Gm-Features: AQROBzCRgiauT9XkDa0yKpB-HNsx8xcHz9gG5I0VdXMGNJPbGVtGHrNlM1aaYHA
Message-ID: <CAD++jLkqD25mudwd0wBCz=-FCzgzssOv5bXTNDdizxdCOY0j=A@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: axiado: add SGPIO controller support
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_004419_651935_43AD78EC 
X-CRM114-Status: GOOD (  11.72  )
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

Hi Petar,

thanks for your patch!

On Tue, Apr 14, 2026 at 3:48=E2=80=AFPM Petar Stepanovic <pstepanovic@axiad=
o.com> wrote:

> Add support for the Axiado SGPIO controller.
>
> The controller provides a serialized interface for GPIOs with
> configurable direction and interrupt support.
>
> The driver registers the controller as a gpio_chip and uses
> regmap for register access.
>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

(...)

> +static void ax3000_sgpio_set(struct gpio_chip *chip, unsigned int offset=
,
> +                            int value)
> +{
> +       struct ax3000_sgpio *sgpio =3D gpiochip_get_data(chip);
> +       unsigned long flags;
> +       u32 bank =3D (offset / 2) / 32;
> +       u32 position =3D (offset / 2) % 32;

This systematic calculation of offsets from bank and position and the
whole bank concept makes me feel that perhaps the bindings are
better off reflecting the bank structure either by defining several banks
using 2 cells or by using a 3-cell binding?

For 3-cell see:
commit bd3ce71078bde4ecbfc60d49c96d1c55de0635cc
"gpiolib: of: Handle threecell GPIO chips"
for some details on how this can help.

Either of these approaches will further probably help you to
use GPIO_GENERIC (gpio-mmio) helper functions with this hardware,

Yours,
Linus Walleij

