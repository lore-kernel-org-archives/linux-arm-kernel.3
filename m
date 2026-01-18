Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7951C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 22:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TNuFzOhdZo9UK556ojHo8BcQayQRMP/5jwSA7SfGt8=; b=w2ykt2mNbvTZCz/H0r53I79sZ3
	+2K1gmeIooVJevGUXHb1lGtMeXButokRCNNiv+QSdgczxtrOhM6xb7GYCK+WRZ6bwqwCqpVv3K5Qr
	NjWkwepF5VLazKYtEHmtjAM8V8XfVHmwE9FDKutJZnKM8yNxO+/sWPrYGawEAHUadYkp1RXTgGKms
	MOPLy6D3g9t3Wco5NP6Ux4p3PQiIqANJEAm1XwSDOZkSEO4nYARUqcAQLOhNu/JDbU59y+Rk+25Ik
	jFN13fKtook6LJtHOEmkkmNQQ1a+JaiV1qu/dYaBfMPp40SeDSRQQ+o+lj2ZY7JvjpaQBwF3/yyLW
	sdfbu4tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhb7D-000000015iH-3vOo;
	Sun, 18 Jan 2026 22:19:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhb7C-000000015i7-3tjt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 22:19:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0823360010
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 22:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1DBDC19423
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 22:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768774761;
	bh=GitHHN55bP3Z4V21wbsged0zJmuhu+nzwlOmja3RnZg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P+PbVGY6wyQ+DXIVvI6TnoL2/Fg5DPML01L50fh/oVt62XxZyVY2bfGpVdJ0zZ7rH
	 fSP8gd0yNjZ5OD9ile+eKD+e32roRN8JwXDZ25d0Bwr3YgVgS4YRwm4dcZQtH5S8E7
	 fFwJ0maQDfFuuIYHnycbvfZKlQjqbkeZFnk20iozJy3Ce5U22yyv/chpdsT722NjsQ
	 ScZKB/Kkyr52Y+2QLHaHvELf0iDvEISiE0xN2aiUpSL3fTAecYngTD5kIITB0uL0BB
	 rkRuRncqJkbquctqy1qNh6BQy6X7/y5v+6gV8MKFYiwbanR1GZ6mQ0XgL8+uG4Cr6o
	 dTp2ibrkvdxow==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6446d7a8eadso3217320d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 14:19:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLENLJX9Yy2jcEQU42hOmCJ8sA+oqJyunqMdKTyhrt93C3r9R+w8Xp2bW5tQ1WSC/sUIAIgINk73WJUyIHhQsZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxwV9KZSKn8VNrANU5vpuWv71OG3irz732g63SgV/P+NvicTLtq
	JIHMATm4oWoA1JgLak0aAYVXz7v7NGqeO4MpUrYvKawve5Yn0NbSGz41EPv447Q3SbfVY/KBGz0
	2FoCKZIYiKji3932uxsmQDsF1PGjFi4o=
X-Received: by 2002:a05:690e:1349:b0:640:caa5:57be with SMTP id
 956f58d0204a3-64916499c54mr7608440d50.28.1768774761075; Sun, 18 Jan 2026
 14:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com> <20260114-debug_bus-v2-11-5475c7841569@foss.st.com>
In-Reply-To: <20260114-debug_bus-v2-11-5475c7841569@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 18 Jan 2026 23:19:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLmW5_xDnA9UtKynaSzdM8aC439sB_n6suFmLY1TJ0cYbg@mail.gmail.com>
X-Gm-Features: AZwV_QgYRBdpelcux3ZwYKaetoDVqJ1ncGRc8cQV81PLPvRQ_gfit3YePhm3xx0
Message-ID: <CAD++jLmW5_xDnA9UtKynaSzdM8aC439sB_n6suFmLY1TJ0cYbg@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] pinctrl: stm32: add firewall checks before
 probing the HDP driver
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	jens.wiklander@linaro.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Gatien,

thanks for your patch!

On Wed, Jan 14, 2026 at 11:31=E2=80=AFAM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:

> Because the HDP peripheral both depends on debug and firewall
> configuration, when CONFIG_STM32_FIREWALL is present, use the
> stm32 firewall framework to be able to check these configuration against
> the relevant controllers.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
(...)
> +#include <linux/bus/stm32_firewall_device.h>
>  #include <linux/clk.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/gpio/generic.h>
> @@ -605,10 +606,50 @@ MODULE_DEVICE_TABLE(of, stm32_hdp_of_match);
>  static int stm32_hdp_probe(struct platform_device *pdev)
>  {
>         struct gpio_generic_chip_config config;
> +       struct stm32_firewall *firewall =3D NULL;
>         struct device *dev =3D &pdev->dev;
>         struct stm32_hdp *hdp;
> +       int nb_firewall;
>         u8 version;
>         int err;
> +       int i;
> +
> +       nb_firewall =3D of_count_phandle_with_args(pdev->dev.of_node, "ac=
cess-controllers",
> +                                                "#access-controller-cell=
s");
> +       if (IS_ENABLED(CONFIG_STM32_FIREWALL) && nb_firewall !=3D -ENOENT=
) {
> +               if (nb_firewall <=3D 0)
> +                       return -EINVAL;
> +
> +               firewall =3D devm_kcalloc(dev, nb_firewall, sizeof(*firew=
all), GFP_KERNEL);
> +               if (!firewall)
> +                       return -ENOMEM;
> +
> +               /* Get stm32 firewall information */
> +               err =3D stm32_firewall_get_firewall(dev->of_node, firewal=
l, nb_firewall);
> +               if (err)
> +                       return dev_err_probe(dev, err, "Failed to get fir=
ewall controller\n");
> +
> +               for (i =3D 0; i < nb_firewall; i++) {
> +                       err =3D stm32_firewall_grant_access_by_id(firewal=
l + i,
> +                                                               firewall[=
i].firewall_id);
> +                       if (err) {
> +                               while (i) {
> +                                       u32 id;
> +
> +                                       i--;
> +                                       id =3D firewall[i].firewall_id;
> +                                       stm32_firewall_release_access_by_=
id(firewall + i, id);
> +                               }
> +                               if (err =3D=3D -EACCES) {
> +                                       dev_info(dev, "No firewall access=
\n");
> +                                       return -ENODEV;
> +                               }
> +
> +                               return dev_err_probe(dev, err, "Error che=
cking firewall access\n");
> +                       }
> +               }
> +       }

Doesn't this whole piece of code look very generic?

Point out to me if something is pin control-specific about it?

Can't we just add a helper function such as

stm32_firewall_of_check_access(struct device *dev)
{
    struct stm32_firewall *firewall =3D NULL;
    int nb_firewall;

    nb_firewall =3D of_count_phandle_with_args(pdev->dev.of_node,
"access-controllers",
                                        "#access-controller-cells");
(...)
}

Then place the prototype for this in <linux/bus/stm32_firewall_device.h>.

I think this will be helpful for the next driver that needs to check
firewall access
before continuing.

Yours,
Linus Walleij

