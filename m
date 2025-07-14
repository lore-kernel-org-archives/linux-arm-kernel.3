Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA0BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yt0pEgiOw5D20asS7w9+koIyg+3FrGpHgzGJycRNdqs=; b=dTVbo1ZDM0EK9TGiezc2SjcZZR
	8TEi4xt3XOmNs/af8Sla1Ogo+Vp/JX1GtmO32gtHGzABWS2sqg9lYMFvzFb5cdlchip9tuADnMihI
	O4VM2oCZunxadKR2XWMqOtHvGn65mY6y1TJoFKViXhjiOUC0JXwotRGpfBj9KwsmRvcpddFXFS++n
	nhabdD35vEvp+HujtbHLYn2xqVrhr4tsJpLLm0x338ACOTeoi8w+i4FAyM/8J411rxN7gEzdhn3Vp
	XtpWpy+LBl3D7RR7qLT8FvILZFlnViHv/SEHynIvkb5vTS6Z55Cqcgvk5+E7IAIW4QH3UwlQVvhjL
	wiw8wYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHPI-000000022Kw-0bEa;
	Mon, 14 Jul 2025 11:31:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHMp-0000000229Y-3GAb;
	Mon, 14 Jul 2025 11:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Yt0pEgiOw5D20asS7w9+koIyg+3FrGpHgzGJycRNdqs=; b=gFzHwEOunPxcWiAMs5c57JGmBA
	1i9gdYcrvYX29m70SzdEFbb949zBkFdvThNwJKQhzyJ3vz63/HJ1jVg/SqRuGP6n4gWIfjUiccouh
	P6KnCGtkMsx1a1QQNrL8jQIZ49P75WLOx+rlYn0bQB+2wVwhdnl721IvhTuDmNYdNVe5pAbt9ry3r
	/RoZjj89dZL+hcZYQojrwClpv3YSiPvK4/2ywr4rKpCY38bVQj98vjQR3JbcWmt8iXRlTCD0vcUbS
	UQwyw9zH6H36xlLQYifZECz0isuti6nChKskuuzSIiEqCqAEDnDQFMnIb/oDf1WYaJgVwW4dg+ZXE
	kcLZNHaA==;
Received: from i53875a13.versanet.de ([83.135.90.19] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ubHMj-0007NV-40; Mon, 14 Jul 2025 13:29:01 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Cercueil <paul@crapouillou.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 09/12] pinctrl: allow to mark pin functions as requestable
 GPIOs
Date: Mon, 14 Jul 2025 13:29:01 +0200
Message-ID: <5911205.31r3eYUQgx@diego>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-9-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-9-b6135149c0d9@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_042907_813696_97A18DE6 
X-CRM114-Status: GOOD (  19.09  )
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

Am Mittwoch, 9. Juli 2025, 16:39:05 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Bartosz Golaszewski:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> The name of the pin function has no real meaning to pinctrl core and is
> there only for human readability of device properties. Some pins are
> muxed as GPIOs but for "strict" pinmuxers it's impossible to request
> them as GPIOs if they're bound to a devide - even if their function name
> explicitly says "gpio". Add a new field to struct pinfunction that
> allows to pass additional flags to pinctrl core. While we could go with
> a boolean "is_gpio" field, a flags field is more future-proof.
>=20
> If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
> to it can be requested as GPIO even on strict pin controllers. Add a new
> callback to struct pinmux_ops - function_is_gpio() - that allows pinmux
> core to inspect a function and see if it's a GPIO one. Provide a generic
> implementation of this callback.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

> diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmu=
x.h
> index d6f7b58d6ad0cce421aad80463529c9ccc65d68e..6db6c3e1ccc2249d4b4204e6f=
c19bf7b4397cc81 100644
> --- a/include/linux/pinctrl/pinmux.h
> +++ b/include/linux/pinctrl/pinmux.h
> @@ -66,6 +66,8 @@ struct pinmux_ops {
>  				    unsigned int selector,
>  				    const char * const **groups,
>  				    unsigned int *num_groups);
> +	bool (*function_is_gpio) (struct pinctrl_dev *pctldev,
> +				  unsigned int selector);

hmm, I think using the set_mux function arguments here might make this
usable by more drivers? Aka func_selector + group_selector ?

While the generic pinmux might not need that, when pinmuxings are
arranged in functions + pingroups in them, this would be helpful.


Heiko




