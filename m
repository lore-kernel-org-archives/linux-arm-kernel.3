Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACEBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 22:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zEs8V4lWPcL649keJ+/5ibHEH9EE+ydATPB+tEzuWA=; b=rceDozqdnRhJ+x8Lv1KRK45p6R
	uS+cU22ech53XR+dm87YgRbuQjXDgzwc35EjDBTvoXJwPO20pSJjHEq1CZlIUjHocK80yxLLcYTyx
	jldwYHTeMwgQdtktH577W/tuOE0HvpNC/ZLxLYZ3cnRM1+z9fUjs4V5smaTdpNpa3GTmwNfClM//f
	WieIH86IK4R4KreAaCr6pEZPrBgQbBYXPDmjzUqY0ceiqoqtbAEc/0bizAXAYO3ryU4w3Y304Ng7d
	IKNNDtn8UXIisnFTHV7pt/pIjVoll95BV282a2YEeg2/LCBC12oom9MZNZD1Rkbm9hIMkjeyUm4aA
	n6qetfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf3cP-0000000377S-2etz;
	Wed, 01 Jul 2026 22:41:21 +0000
Received: from mail-qv2-x00.google.com ([2607:f8b0:4864:33::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf3cN-0000000376j-12rm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 22:41:20 +0000
Received: by mail-qv2-x00.google.com with SMTP id 6a1803df08f44-8ed50e588d8so2229286d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 15:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782945678; cv=none;
        d=google.com; s=arc-20260327;
        b=Y+if47sueRVr91vR3L/w23sZw1lHGdR6YUxdSNqC56+jjWHDHes3ygpva66penE1Ft
         V8EGqfSBWRheO4h0n2Vcqs4AIg1uxBlJywTyLujHHG8ddXiY65tEA+DtHZYVTEvh7ZBH
         QzkUlmLn2/p9pdISz2sMaEImkOW2jZS+Hvk2/RdxqR+vBW4QFaWdWozKdhRLB/lPf8Wo
         W1UTYBW99rDZfZ9yeUpzujn4RqIkVVd+sp2oDnEcs2kAZk5RTy0ofKDxJtaZV70wP5Si
         90dDVeSWGIoJPUJdCwcYqmSujP36EeyJEhTmLtieVJYrV0y3GMKT3NmxQF3eRgBopVWn
         EehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/zEs8V4lWPcL649keJ+/5ibHEH9EE+ydATPB+tEzuWA=;
        fh=1HEoYVEKA3/4GwbvrYTnPadyX3tWB4S4oJHb1j/Y6ig=;
        b=hDhdyngoObHtClF0B3TcQGXrxugUV4nQTIaj3PxwgyshnpLTlAcqJZFE9zS/tdvcXv
         vLKVc+XZ49miONt/0J/jxAAdOvmIgKGZjrf4QcHTmgoWAYHBf1cwZOZvdkcFlt1XDeUH
         AWoRoAHKI2D1235d1MNxCaNqCdpRAuqDzU2Qs7GJWtjEJbR5juQCFZ+Wpd2oVhlqS3QD
         iXbuXiHYfWii3WeRawCW8J30dFdn1hy1opLGYldJ2eTz9Mw2fBL3+6gJOMPgNMi2JPaJ
         R3njJRyseSZGMqP4khiI5YyGh3nXCUHDzEcpyS9jErCkjG/JctdptLY1tJnbzxt6nFo7
         X52w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782945678; x=1783550478; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zEs8V4lWPcL649keJ+/5ibHEH9EE+ydATPB+tEzuWA=;
        b=aT284YWw70kvjwH7dBKPzmspqIe8Bc0qEZQ53oeJWr+XblqGArjRcGg6GTaU/wyVPx
         nOXeroWlk9qlreNkrlHlS2P/QMrW1AKdTtJ0IvPM+etyL7wNwkgZiSORpvRNwP+lJaJf
         bYF4xpoSKgva9kEenpKqklAgLqR2btmK+BgSSqI9JVrR0fnsWAhkAgC5EI17YcwTuzj2
         uhlqV+ZZq8qkDYuvGVjIIL+p5qkyugfAXnnJWVwdLfpGeXwK86ltH/caKEhzPHkPDnOn
         9+B4Y6MumPJ4NuGX6qhe4Qb9HhBATTPbpZPPkJ4UiI9vgHhuom5JCGRxvax+Ndx0s3+Q
         gc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782945678; x=1783550478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/zEs8V4lWPcL649keJ+/5ibHEH9EE+ydATPB+tEzuWA=;
        b=MBQ3eCaOaRrw+zz9QyCdnnwP7YAGO+R0R6lUOYFaKUCH8VUr7ANa/c7FdE/0G0rKew
         hOW8LByOg6Fm36+Q1wcrRNi8lnsBTM8W1tWVry/Tzf6yfeBwaATixLlZvxNLhcvHpCg/
         5booACAnXMI5jXZCrLtwHFbAv0p00/P04ctEFd2M1ahYcZWxLLAqGgx9QTcyfPyMZbJJ
         jIbIef4SaEppViA/vAFr6mb+RtIKav8WOjr4ZbQov98JQYYRVykc+E7/nx1vP3WFHmAc
         49g8vVml5FB+uK6l+sD2af8CY8DPnZojEmZXBQd/8wjspZfSjL+7gqdOxE23v/CnljG5
         3RuQ==
X-Gm-Message-State: AOJu0YwLWm9lpxV3/68guGN5Xh+iur1n2B0Jg6oBLhGfTK05uZRz0kj9
	MXfotNjB4ZBbN9YTRhnZc0RdUnCX+MpsqbuV2K3czrErXLgeZcDQ45njo8n2eYiyrSDIzNQERU2
	+HhOBx5sTYoGJaFmYl1I8ZkFBVAYQDnA=
X-Gm-Gg: AfdE7cmhqBc5WDHsBk2jlCjoR71VZCRfTZ3nXc/UByypZHpWhJcuAcIEvMHULdkLTG5
	Iv08/y40iiErpABxun5GCWTQqG7sihs8KtCeQWL5YbWkWwMhEyhzJ0ZKRzM906feaA8JObp/ibv
	u01kkSusaSa4I/4QkfP/kpRodwqK4hSq69+wN0U+UQHfdq+5+1EgdTOhhqBjFi7qO5itMIDKsOw
	OOS5USe2ptfEcdJQbpyfEfY93Wmf55qRgrjIoXF4IzDdOUo6VH1iYJ9bTberRNxKmiAj2L6WWVu
	grDGjGxhYltpVU5Scr4WzdTWO7kvhjIka3hZXcMlszpEkY1WT2EEYfZ+Qg==
X-Received: by 2002:a05:6214:21cc:b0:8f2:940e:2417 with SMTP id
 6a1803df08f44-8f3c9dabf76mr54875016d6.55.1782945677686; Wed, 01 Jul 2026
 15:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-19-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-19-arnd@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 1 Jul 2026 15:41:06 -0700
X-Gm-Features: AVVi8CfF9d6l7tqaBnW0ymwju7u7UMwSlLnAFDbskHiVs27X0kHxLxxNHiLf_kc
Message-ID: <CADkSEUhWe9aLuM7AURDKjMkrpEKOog9X59fWuZXvUVjkT9BuBw@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] ARM: mark axxia platform as deprecated
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Mack <daniel@zonque.org>, Frank Li <Frank.Li@nxp.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_154119_295721_CE1C8680 
X-CRM114-Status: GOOD (  19.24  )
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

Hi, Arnd,

On Wed, Jul 1, 2026 at 2:26=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> From: Arnd Bergmann <arnd@arndb.de>

All of these patches have this line at the beginning but were sent
from your kernel.org email - did something go wrong with git
send-email?

> The Axxia platform was initially upstream by Anders Berg for LSI and
> later Avago, but this included only support for I2C and reset drivers,
> while most of the interesting bits (network, pci, rapidio, usb, ...) or
> the arm64 platform support were never merged.

Given the incomplete state of this platform, removing it makes
complete sense to me.

>  config ARCH_AXXIA
> -       bool "LSI Axxia platforms"
> +       bool "LSI Axxia platforms (DEPRECATED)"
>         depends on ARCH_MULTI_V7 && ARM_LPAE

The dependency on LPAE reminded me of two other 32-bit ARM platforms
with lots of memory: Calxeda Midway and Highbank. Is anyone still
using those? Maybe they could be removed, since people seem to want to
remove highmem:
https://lwn.net/Articles/813201/
https://static.linaro.org/connect/lvc20/presentations/LVC20-106-0.pdf

>         select ARM_AMBA
>         select ARM_GIC
> @@ -13,3 +13,5 @@ config ARCH_AXXIA
>
>           The LSI Axxia platforms require a Flattened Device Tree to be p=
assed
>           to the kernel.
> +
> +         This platform is scheduled for removal in early 2027
microscopic nit: missing period

Reviewed-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>



Ethan

