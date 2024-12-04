Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6208CE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJkZ1b+Bgh1Cw7S0YP/b9ztjzr/OipaCqC5BDrpRtNQ=; b=IPYMbeE+V8sTUzykIbBClqVNrw
	a+9zHGWeI8WLUCvbBCCIzczZhcO/nnyKcl1eTLTA2OfAD1ZBzVDWmlzJHCfWKF5LPX193jZvq0cq9
	/Tawy3BwHulgwuqD6hi8PKtq5VGjGlVkbEB0LCNvXbP+9ngsqnDcwDglBjGZCJU6PSJ1xGkF/Vaas
	1INuvv7zVwNJ3huvN7gQHk2iQ2zPLy19fie75eqTHfWE6qY9qDW7Qp4R8nrHcmae2b281ysDlLKU/
	Q5dstoedG8LFdd/nW9cp/fQvr5mF1N1Ae229aGThact5212rO3kzV8aj4ciZzqxfGGviy1IuwzvDv
	l6eVSSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIq10-0000000ClNe-2oHN;
	Wed, 04 Dec 2024 14:06:06 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpzW-0000000Cl5Y-3IcZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:04:35 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53dd57589c8so1017227e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 06:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733321073; x=1733925873; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJkZ1b+Bgh1Cw7S0YP/b9ztjzr/OipaCqC5BDrpRtNQ=;
        b=RmxAgoIZoTtGkAmxxblevVhnz2YvA2JY0KVpGsrBO0pFI5s8D1q5ysfC38rsimG18/
         Mokkf3aut8O4OgTqOKaLG+VlyRIoHkhggg27zdkh+dDVL2WPT85Aom2OAkCUz9q41g2n
         gHbw6NAmP6TURLl8SPp4Bupm9EhBkFphCJ3ZFjaMi7wYatQgGF0gBmDfv2XtWfRzxnIK
         83sajAHrRwRpjSHkY029vrcp2H/3gXXZcrWBxTEjg7AKD4Y4WtBlHgzF3beEBN/yqrOv
         ag8shLh4KolL1SuflgMJMOf/1NfAMltnwp0paqKaV0aKJqvMmpmt6dZAA8l1SOcIQixw
         COaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733321073; x=1733925873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJkZ1b+Bgh1Cw7S0YP/b9ztjzr/OipaCqC5BDrpRtNQ=;
        b=YzAo1psAllR21i5Vdvsd3lAm99ckSbV8J46cqzfFjU4UaiyIoE6q9xHrFvqc/BDqmI
         oxHsojTZW1Ac61ct7tfejz4gBJhY6vc2ty+bDu9UBKjDfOcTZp7We+szC3IuU3fbVE7v
         dnrBUQo21Q23CQ2kI3cfg9p5rILgxtN/WqNWlPs9jShHz4pIdQAVj/NY5Puh9FtaMDX1
         GomHsvXze1zcv7LGqHoO3Xw7Y0O+gkcUIObwusBTfLPGZfiE6J7EDRQP09zfsdzt4YiD
         cpXSyDidkUBX7NF9WIMnFdSxWzarHpJwbMea6Xxy2OPHYzB4SZZO7DemdWrzxVhLNsa/
         oS0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5BtgFZYsdhiDjpYK9rxzCLg8MOl3yH8wcGaQkGEzesEQ/cDA4c7UKvqQ2UBESpTRnoxgEBjell1Q9XyVRgYeV@lists.infradead.org
X-Gm-Message-State: AOJu0YxYbelvaEOTCWCJiZoL4gyuDhcCsaOjq2iZ/J1G4lWMPVNe23RT
	z6h5/+wZcniPAt+6tpr8IPODxJqJ+J5TipmXoLkFfnonzmAtHQb8mk0B/N7VLbaLfjrG7OV05GQ
	6gJccAs+8zfU2mlmb6ZHJUXzy4UUwO0NQ8hr6JQ==
X-Gm-Gg: ASbGncvJkYdOTrpZpQzK8Ykwnz4INXL4uNwAGpHBoU3RF9SRTGTH2t5AVDMsEOvK0HX
	rfQJ2jCsOrOVndw/L3EqKaKNTY3aRug==
X-Google-Smtp-Source: AGHT+IFeNAy9KprAhgnIP+heCKM8AwjjL7AAMKzf4r/s9Hvqlilw63furRQM24t+dpERHTojSCrwlM3mqs/OvmZmpvs=
X-Received: by 2002:a05:6512:1108:b0:53d:f67d:d580 with SMTP id
 2adb3069b0e04-53df67dd58fmr8534117e87.2.1733321073129; Wed, 04 Dec 2024
 06:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20241204102904.1863796-1-arnd@kernel.org> <20241204102904.1863796-6-arnd@kernel.org>
In-Reply-To: <20241204102904.1863796-6-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Dec 2024 15:04:22 +0100
Message-ID: <CACRpkdbMjRbn3D5T26FtfUPN16b-3BMHr4Teak-Cd8O=iufU0A@mail.gmail.com>
Subject: Re: [PATCH 05/15] ARM: turn CONFIG_ATAGS off by default
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_060434_821821_342FB7E4 
X-CRM114-Status: GOOD (  18.65  )
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

On Wed, Dec 4, 2024 at 11:29=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Only a very small number of machines remain that rely on
> traditional board files with the ATAGS boot data instead
> of devicetree, and we have not accepted new ones for
> a decade.
>
> Most of the remaining ones are on their way out of the
> kernel, but the Kconfig option that controls ATAGS
> is still enabled by default.
>
> To reflect the actual status of ATAGS support and alert
> the remaining users of upstream and out-of-tree platforms
> with this, chanyge it to being default-disabled and
> add a dependency on CONFIG_EXPERT.
>
> The board specific defconfig files that rely on ATAGS
> are changed to turn on both EXPERT and ATAGS if they
> were not doing thath already, and the ones that explicitly
> turned it off before no longer need to.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For:

>  arch/arm/configs/integrator_defconfig  |  1 -
>  arch/arm/configs/multi_v4t_defconfig   |  1 -
>  arch/arm/configs/netwinder_defconfig   |  2 ++

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

