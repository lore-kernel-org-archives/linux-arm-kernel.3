Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F8BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ax00npaur3Kx2vEm2lwqTG6mCucVrxlLU3BWge3a1sE=; b=a3MU8GbHTcVRpBRwGJTNs2naB2
	gwbqgTmCPj5bWAAF59dNBzR6GnBuVHY9sOPRRSKwms10O0RhyP+NlD3qc86P7DIcraNlwKwuL57vR
	5p5sgK871ip3LlbpWgMJ9P/7V89qvhEB/NptODPxVxboDb12lVr7FTBhj82m9LEHBSfnB1dQN7a0Z
	Yx3J/xFtWSmfr+kaRJ+9krJa8mfP66P+GjTZlSf6Up3LSFkrNfftNYKnhxHmiOeUD35A8tARKJCxn
	f6cDb1+Pn6QeRDu9ldAwsGCpkQTD1J3odO9oy2FCEmFOx4/fRuT7GHAjCTbslo8aooJNDBiYrArnY
	zBabbbGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkWF-00000007rcE-0EuP;
	Fri, 03 Jul 2026 20:29:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkWD-00000007rc8-0VN7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:29:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2094F433E7
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 20:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082151F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 20:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110587;
	bh=Ax00npaur3Kx2vEm2lwqTG6mCucVrxlLU3BWge3a1sE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aGKFdNxyWvTOC+T8XIHEaXu8dWXQ9e5X32MeGnPwP60lRibp2w9QYehkWNbKUxYXr
	 7jct3ztl/GJ3HPi6mWYOGbtHDmDl5AeEE7yKhW3X9oF1CnRv6t2TvA5GA/npiRT0KA
	 yhepArPWpr5qEmvUFu58AxJ5FR4rY2HJbhvHcNpeIxnT2Ka+7uPyCwc/s9aPogat1v
	 /PKfqhDLxn/DX48eNwF9OfB4s3qtgqYegOE8D7YDv8hwvz7MnYMfUDhVinqpN1xORc
	 994hSjQOfTkdHhE+1XII/NyMU5wKB8nx0OBVNAgyx1QSQ/Hr/aZ8oDpzE5U2VgEa2s
	 fMjTy3f/Kr1SA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so788699e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:29:46 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywv1fl/Zsf0KE+GsCH7INxjqoB/SZOgXWS0ZFcms3uuH+BxjtjT
	5//Qb3n3lkwWQW8RSI+p/W3uhTVOBqmql1dBhsQNxA0QVBmhgsXbDcKXWiCd0Ib8q9RzO1EenPY
	m/8MHO555U0UeKlMrRpy3eQhm5RcUTsk=
X-Received: by 2002:ac2:5692:0:b0:5ae:b688:8b9f with SMTP id
 2adb3069b0e04-5aed509045amr84106e87.15.1783110585654; Fri, 03 Jul 2026
 13:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-7-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-7-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 22:29:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLmX9Kt0TJ7ZV5z6C71STSFasj+tteAuRZf1kskLPyg+8w@mail.gmail.com>
X-Gm-Features: AVVi8CcuZBhH0CBAHhIVaixVPU2Zy7Zyv-gFQ3BsH65cnHDfWbC27Khp2xsrQZQ
Message-ID: <CAD++jLmX9Kt0TJ7ZV5z6C71STSFasj+tteAuRZf1kskLPyg+8w@mail.gmail.com>
Subject: Re: [PATCH v2 06/19] ARM: mark CPU_ENDIAN_BE8 as deprecated
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Mack <daniel@zonque.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>
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

Hi Arnd,

thanks for your patch!

On Wed, Jul 1, 2026 at 11:25=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

>  config CPU_BIG_ENDIAN
> -       bool "Build big-endian kernel"
> +       bool "Build big-endian kernel (DEPRECATED)"

I'm not so sure about this patch because it will look like IXP4XX is
using a deprecated feature. The IXP4xx actually has many OpenWrt
users.

As mentioned on IRC I tried *very* hard to boot IXP4xx in LE mode,
by adding some code to the kernel to force-switch to LE but failed:
the bit in cp15 can be cleared for sure but after this the machine
nevertheless stays in BE mode.

If someone has done this successfully and can tell of magic tricks
I'm all ears...

> +       depends on ARCH_MULTI_V5 || BROKEN

... but this is all fine.

Yours,
Linus Walleij

