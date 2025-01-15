Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA24C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 12:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gVENKObdf0yD4+Qjax0lZMr103GKoN9lZ9RQF8JuYw=; b=NRX7zoGmIe90ww8QeAaeo3ee6U
	0E35z45BM6oORh9Aog/LdfM6ticdK/G9Y22HRylP8ICWGZczrjwU92NgxKSoJ3i8574KqnqFMD/5D
	DCo3juey8wx+H9N/VNKHxD95JI2HPOt/2WWa6Z4Tn5KYyV7V9V6TQQHNB36eInCrmfbaQejlwyNSy
	WF41S3csjPlLooGAEQhSbA/+B3dpRpmcjmZWG5r0qKcP2w13u1FT6IPxbqXeW320ZZ4wPgxOa2FFE
	eyLKWxRxq3IGakVhFeWl798Tmgu4DYh4wUDFPN6IkqH1gvvEgW2NieUYXqoyr61Z4CEquEWsAb6tk
	IUdifiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY25k-0000000Bmls-3MXi;
	Wed, 15 Jan 2025 12:01:48 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY24V-0000000BmeK-3t1O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 12:00:33 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so60912251fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 04:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736942430; x=1737547230; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gVENKObdf0yD4+Qjax0lZMr103GKoN9lZ9RQF8JuYw=;
        b=q4dGOH7PLTN1jAQXOHC+3k/gyvXeExtN419R6GmUHqJNGfh7XalUMWZMpwio/L4Anv
         u0aJ5+4ekwSeVPHQ8W8rkiYVcTb1NHqzIVYynBr62bhOmUylzWElvDVdkH0+cAGTpgFx
         T90JQmo8JaPwRDWUfNSGp+beg4DeMjaSUpz1xusLWwWZTVciWZGbPs+m0u1bznH91fUJ
         IV5N+/fV/z+r2Mj4D82512ifwhmOyLRt33Pc8pZvCZL114dalr2OsFM6k3nEHxGzgqnm
         lKAgJX1wyxMfv1kBaTsN/58m7i7UvRvBqtBH9RX3+DybxCefQ/F0rBR5QfptrIqo56KD
         iXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736942430; x=1737547230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gVENKObdf0yD4+Qjax0lZMr103GKoN9lZ9RQF8JuYw=;
        b=W3XVFMG8JEABx7U2xnOJ0pdNxesTZHI6OBLFzofqn3UsDDaUXMAFMJHt2u4C7mOJNH
         SUBqOU7ppTlN2WMHZ7mEsdbUagMT9VLoYG5jk5Tqtpe9TFcWBtWezsoWOhViXa6y9YyQ
         lv8sVvcP44MCV36d4Na4HZV/UzkXFZAcRz8f5oPmppNuJyt56P9r1EaygoM4s+ENV/4Z
         wb/wjl10A48lyuXzv7H9sSrWvMq1e7wqgm3ujfDab5aDPuZ1l1MlEtwg/nrtpU5tMWK9
         kWoEJ4ZLqx/IJHfixsjj9vmo8piOHufSCCB4Tvv4D1qObX0JiNl5Dt4MwB5Tvd3BPTpA
         9SBA==
X-Forwarded-Encrypted: i=1; AJvYcCX3Tye7k9712T/8jigl4T8Gn0iy4WlyiAFX0xc1anfW1AhdrOvtfmiuO3EGYjpjDApA3h9s09C3QzN/U/vZNplr@lists.infradead.org
X-Gm-Message-State: AOJu0YwQCOjVDYAgIcmfG2eOOkRH2HaESrjE0J9TaTCCKqB2BhUMdGS3
	TqkCv+qQKq6E9uFaZbsglNILe9Sj1Eq8RFi/G8dI4a0bfCPRsQTyWq1weM9R/HIwZxPi1K7K5Ch
	/vDyWYxoGJKdEx/kDh8hOFOdQtBwYnQfsu8KTxg==
X-Gm-Gg: ASbGncsH7N4veVKOt9CImej+2eJtac6fdbPyTeSOTEGMh4vCYXnHdSTpYiZT20X19Vw
	bSbXXls6vqVRbMQpc/6YP57HB0f/S8rGiESAwqA==
X-Google-Smtp-Source: AGHT+IHZ8JRFA9z0BuxNxyKFpxc+uTJeyjFf7mDX60c40bksrJbFP5JGtyqLP/0FmsVVL1BT/l2aWdaK1Gw0mCFy5FM=
X-Received: by 2002:a05:651c:4010:b0:300:8ff:d93f with SMTP id
 38308e7fff4ca-305f4575ec2mr56064611fa.22.1736942429711; Wed, 15 Jan 2025
 04:00:29 -0800 (PST)
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 13:00:18 +0100
X-Gm-Features: AbW1kvZbTfRxw2_bbKGeAzy184NtDYFQ65gHsjdE84o_WvgwJ8_KVgNBHdw_LLg
Message-ID: <CACRpkdbgv5BhP_iv1fV7-=w6qF3H+=GiUJz=hQko3rcd6uq4BQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_040031_965874_ACCF1ED1 
X-CRM114-Status: GOOD (  12.68  )
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

On Mon, Jan 13, 2025 at 11:19=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:

> As these concerns won't go away until the sysfs interface is removed,
> let's add a new struct gpio_chip::legacy_static_base member that can be
> used by existing drivers that have been grandfathered in to suppress
> the warning currently being printed:

I think entire drivers, pertaining to in worst case several generations
of SoCs is not the way to approach this. It could be a SoC or, more
likely, single systems using a SoC, that has a problem with this.

If you want to safeguard this I would use some code loop in the
gpiolib(-sysfs) that looks at of_machine_is_compatible("foo,bar-machine")
to match the top-level compatible for known problematic machines
so we can be fine-grained of this so when that machines retires
the driver can start using dynamic GPIO number allotment.

Yours,
Linus Walleij

