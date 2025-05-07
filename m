Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E14DC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XKwR69PLxxy85KWouRANyfmgCyvHOTmvcG/jK1yua4=; b=FbY2YzYzpzHCwR5YrNw2engx6H
	Qvl6B3/M9Ivd9eJsu5Kotezd5yswfjR9DcLGtwGzRegOBuviua1b2M5Nd3bmJa30EZn0eA5T0hLfH
	Urxe9VFvtM6PgPsnbr8RExZ1pH9JrPeDSILaRajpRyqDouz5Yon7DTCHlar+JMxm5gN5q5V60P2U5
	Jf4HRRBg9kSVIPvNRvtNzk0TDXl3BvwWryN6CpbVd5XmRHXii26JK/EqYL4+cfZ/VYzavbL5KReg1
	sYyOAnd747oW1OG0Sa0no0D7z3tSJlIHxNXcoqVTbbFv/z0xJTEdtPcC1ftyKy2/Ji/fgY1JIB7og
	UgtuE3Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCg3C-0000000FqU6-3kQM;
	Wed, 07 May 2025 14:47:10 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfWT-0000000FiZu-0Vry
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:13:22 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso8876603e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746627198; x=1747231998; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XKwR69PLxxy85KWouRANyfmgCyvHOTmvcG/jK1yua4=;
        b=J8Apt5bPGoNUXvZ/mxn2Bg9BtkbW8LVFusBhNhkqZFUdQBsHrrW3+Eb0R0/p6rHqnm
         hsadgmrYOqMm0PqbMByOc6NrcbZpmPzyT/gyJ7CZdf3q7cfk9wwPnUmnfD8AG7pYqto7
         fkDuDcoxiUVLJEzHOARriCPZwzneeJQN7KXmD5Syc4B0dvBYcgVZn/71Mc5mX+CH7NHS
         LjMTqJW22V3JEIJdZ5YFMPfyPaDXyk0Ob67hqCQfk6L4WBxufaNywlNwgao4+wHeluWv
         ZiVK8VaP8Dta7v+xPSD7v+T1eG+Nbeec7lbv5zoz4Ay8lUlum02MssaFxBb2IPYEz2iH
         KALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627198; x=1747231998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XKwR69PLxxy85KWouRANyfmgCyvHOTmvcG/jK1yua4=;
        b=P3pzQgQCdz9YRpAvSfCRcYfo7kSAOMo3D58JrDOvqf/RCz/GM0mYrpQoq1u/I9yVTn
         GJuux92CpnP12HlFmQXL2aFjIZeDxb0oliaWCbasgZAayFIDX/VB0sb80zEohkkFmqQE
         Sj1Tg/zXoarTyAjQj4RjxBIirSbSXtirDfDe/tSg/HQ+M56NRDuGzprWmoOmljd9ouS/
         hv/HP66zzth4aRNBq2GzQUyPiF2TJgxJCRqSpSINdp1rBf6Nv/pFWROZXo5PCFExh3CL
         pRy1HNEUzcNQmWlNrHWDci+vjjU51loMkBhfCBGk3FJNR4tVol2io4wE7oG4AATpu1uQ
         T+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+f7Zyc2zosVyUx5y4IQyHIOf1Tw1PITnLDtIqwx7M0N5RTKCSXT55nHq8Tu2CqdsjJ866tJw3chb/9Af0mPBE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5i5O4n+a+b4x7Bc/mEekY8/bw6NJ3FBJPZiFrOAKGMcH+2Rgb
	XXly0FOJrL/Fpe9uqubbcIgrG2HKor5VKFjn713/YBK9EAeQ8+ufJoSYB4+HCrUIL0YnIjgJ4A3
	b7vUzkPvyI0N4AhPzUoFzjJUiDH2rLRFT63TV4A==
X-Gm-Gg: ASbGnctQRETDtCwJAzJOGc2DcH8Uf5wLFMioon5NsYKXt972ASidgEpkp8jLaJ6KWra
	qZXI+JwNxk8C4jFv0rBcYWXqT2v/1mrF6dKrmjqF5qK4mAYNlZFbkE/9VyW5LWAis2APIssX75M
	NqPZTFCnW4dYk2YXyW95IQ8ohUdv6dUnjIINjHrdOEtebTVflbCEUaKgWjD7BEBfm4
X-Google-Smtp-Source: AGHT+IF+13vH/Tucy6FJc2tpu4ONu7h+cxvpO55vMEqjd0zmlBV2H5HARIILcufF+MpkR2WYpDhimLvao4XJprqEy8I=
X-Received: by 2002:ac2:4bce:0:b0:549:8e5e:9d8e with SMTP id
 2adb3069b0e04-54fb9241b25mr1617333e87.0.1746627198587; Wed, 07 May 2025
 07:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <1d00c056-3d61-4c22-bedd-3bae0bf1ddc4@pengutronix.de>
In-Reply-To: <1d00c056-3d61-4c22-bedd-3bae0bf1ddc4@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 7 May 2025 16:13:07 +0200
X-Gm-Features: ATxdqUFYChlfm2buzigbVf4BUVqPRkb82fOcIeyCaDTbI87U8XuidCIMw05XLeg
Message-ID: <CAMRc=MejoUX=ZWe-BvwnRnu7-k5=g+y6hVcsLFzEp5CY8eyHRQ@mail.gmail.com>
Subject: Re: AT91 GPIO driver reading back struct gpio_chip::base
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_071321_289140_5B385A1E 
X-CRM114-Status: GOOD (  22.82  )
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

On Wed, May 7, 2025 at 3:15=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix.d=
e> wrote:
>
> Hi,
>
> just stumbled upon this comment in drivers/gpio/gpiolib.c:
>
>   /*
>    * TODO: it should not be necessary to reflect the
>    * assigned base outside of the GPIO subsystem. Go over
>    * drivers and see if anyone makes use of this, else
>    * drop this and assign a poison instead.
>    */
>   gc->base =3D base;
>
> and thought to mention that there are drivers that indeed rely on the
> base, e.g. drivers/pinctrl/pinctrl-at91.c uses struct gpio_chip::base
> to find out which bit to set in a register:
>
>   dev_dbg(npct->dev, "enable pin %u as GPIO\n", offset);
>
>   mask =3D 1 << (offset - chip->base);
>
> This needs to be fixed of course, but I don't have time for that right
> now. Thus settling instead for writing this heads up. Maybe someone is
> motivated to fix this and then do the equivalent of
>
> https://lore.kernel.org/all/20250507-b4-imx-gpio-base-warning-v2-1-d43d09=
e2c6bf@pengutronix.de/
>
> for AT91 as well, given that the driver is DT-only. :-)
>
> Cheers,
> Ahmad
>
> --
> Pengutronix e.K.                  |                             |
> Steuerwalder Str. 21              | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |
>
>

Thanks! Would you mind adding a task to the TODO list under drivers/gpio/?

Bart

