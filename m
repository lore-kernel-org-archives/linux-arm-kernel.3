Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB4DCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 08:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ki6uWxNT/B00QDkxwb3Oci7j2KyejSG6wxzHzrChn8=; b=V8moGs+fccEndtazB2SFAxGelU
	7MQ5XAXlXXJ9aTwh/0c8N9/hYziGLqcaBOTp1rX30KMveRnjVDh+M5z2J07PvpGzjIl8d2f1+eg37
	YhlvvCUKHgEYYTtkMb3JOo6cCyCn52lgSTFuheQh8mxIoM/hzy2hRkAnMcg82kQhWodAYftlJ7gUM
	hTuslKzK7+obYPNnsyAW5T4XM2ZHArn8bVtoIOcZKotz34jFJhvcQtIxZU3CA3uMBFGKqUSMaolQ1
	OGkz4xbHHimpSypgggPJfPuj6L9R76X2V295nmSdH2VUFhWxrCRbtmYy+SdYgODjDboMJZQfiRXtF
	BLIYNICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnLH-00000001OYI-0fX3;
	Tue, 26 May 2026 08:40:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnL1-00000001OLj-4Bhu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 08:40:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 72C2843860
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 08:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BA81F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 08:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779784835;
	bh=+Ki6uWxNT/B00QDkxwb3Oci7j2KyejSG6wxzHzrChn8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DWeYAlqgj5FLsoLgUmVUDmDgShJarvffGYWpmR91ZUTQiAeyLz2Mv9mhOcRT9b6zi
	 fycwcOlT3oge6cR04gYvbiTFzt+KDEMmTDcaA3Fs4n3lZtB1P6BDmWN9bnLBRCdfsf
	 91sM2wZYlcLkLL0MV4Q0TkjhRJF01tzmZ08Jvu09WpD2Znol67paALt3ciRB3Mut0K
	 Bst7gBCEtjiD4R96HXqLbVTbLSXGL/n/DFBtdEknjjj79Qy6HPIVYQ49JE0Vg7LKVo
	 7zDv2UnHXMmb+BhwniyQmHWidYQtATWSj0J8mpAEy298bvlsUuDdFtpHGAAsmJQlrn
	 RrDLAy/2BOWIA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso10176357e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 01:40:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+qEdNW8xbtIC+MvGqcZKrLmHrk6IDt6WKFPFegvw5pDhfexskYe4e31QI3lYofbhDMCK7eeISzGjkOYNk/d/9s@lists.infradead.org
X-Gm-Message-State: AOJu0YzRtOG/qknKfaXhAXkW83BOXcJkWVJqeJCaky7gjMAEWWZhWcKK
	AzFPp2uDEc02oMA+YYsO56lm6hVmXkkiiYfW7LToK3Aem0vG5EW5+8DdXstKVJ0cLMP08d38zC8
	HCUvHKYMCSfIzzwYZchyyqnauaByFxfvZGwPns02M6A==
X-Received: by 2002:a05:6512:694:b0:5a8:63e0:cd92 with SMTP id
 2adb3069b0e04-5aa323b29f9mr5504025e87.33.1779784834004; Tue, 26 May 2026
 01:40:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 04:40:32 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 04:40:32 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260525144629.498630-4-jerrysteve1101@gmail.com>
MIME-Version: 1.0
References: <20260525144629.498630-1-jerrysteve1101@gmail.com> <20260525144629.498630-4-jerrysteve1101@gmail.com>
Date: Tue, 26 May 2026 04:40:32 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mearb0F8CSNUqo-J8Zp2bbR6ti1aE4UO1A0v+pfZ9dtUg@mail.gmail.com>
X-Gm-Features: AVHnY4Kv0sUH774IV01K5ycsVeEWPf8Q4-jYLuoJnpteIVsc5mnJpzvEPaA9BR0
Message-ID: <CAMRc=Mearb0F8CSNUqo-J8Zp2bbR6ti1aE4UO1A0v+pfZ9dtUg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] gpiolib: of: add quirk for IS31FL319X shutdown line
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzk@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Peter Rosin <peda@axentia.se>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linusw@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>, 
	Andre Przywara <andre.przywara@arm.com>, Tony Lindgren <tony@atomide.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Romain Perier <romain.perier@gmail.com>, 
	Jesper Nilsson <jesper.nilsson@axis.com>, Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_014036_108435_0AE96BFD 
X-CRM114-Status: GOOD (  16.38  )
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

On Mon, 25 May 2026 16:46:09 +0200, Jun Yan <jerrysteve1101@gmail.com> said=
:
> According to the IS31FL319x datasheet[1], the SDB pin is active=E2=80=91l=
ow.
> However, existing device tree incorrectly configure it as active=E2=80=91=
high.
>
> Add a fixup to force the consumer active low for legacy device trees.
>
> [1] https://lumissil.com/assets/pdf/core/IS31FL3196_DS.pdf
>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  drivers/gpio/gpiolib-of.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index ef1ac68b94b7..8a79aaadc9ea 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -194,6 +194,16 @@ static void of_gpio_try_fixup_polarity(const struct =
device_node *np,
>  		{ "himax,hx8357",	"gpios-reset",	false },
>  		{ "himax,hx8369",	"gpios-reset",	false },
>  #endif
> +#if IS_ENABLED(CONFIG_LEDS_IS31FL319X)
> +		/*
> +		 * According to the IS31FL319x datasheet, the SDB pin is active=E2=80=
=91low.
> +		 * However, existing device tree incorrectly configure it
> +		 * as active=E2=80=91high.
> +		 */
> +		{ "issi,is31fl3199",	"shutdown-gpios",	false },
> +		{ "si-en,sn3190",	"shutdown-gpios",	false },
> +		{ "si-en,sn3193",	"shutdown-gpios",	false },
> +#endif
>  #if IS_ENABLED(CONFIG_MTD_NAND_JZ4780)
>  		/*
>  		 * The rb-gpios semantics was undocumented and qi,lb60 (along with
> --
> 2.54.0
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

