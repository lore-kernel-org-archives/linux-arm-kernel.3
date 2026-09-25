Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F94BC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjEFWSQNzvV2cy7ibgDjEb2o00pPnzmhtpFfAirbXj0=; b=OLBwwow/keM+697IItq4L/LXJG
	YN9i3C1xAZDTvZE+Fm1YOTQ/yTBSveM71wjuCDz8AKIyMUKBExBx4cIhl2MwV9GS0sV2kh9Rwpyib
	rKuThNldDmEMx9tjG3QLC19p+fDnk8Fukj90RF0AwXx8xe/9hiNU8gFQJXBcX6yEFEga5bgts6ynD
	ZWWOqwkHUupg5TsWx5vrbYysRe751WfCeyAdC9uGpVyKbIPeu1VFJZEuFQD6TcNhnt4BQkp0bunms
	VamuBmhFfvtLqpXVu3YkoOBmQyakISJIlulzRhLc6gcNjXz3PJbszUPvdxQiFgaBCUs4ge6XBIJwm
	WKuS0oKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA60N-0000000DQlv-0j4n;
	Fri, 25 Sep 2026 13:30:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA60L-0000000DQln-1ETx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:30:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4E5E444EE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 13:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35591F008A1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790343020;
	bh=hjEFWSQNzvV2cy7ibgDjEb2o00pPnzmhtpFfAirbXj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BLJ6EOp3/teQGF4Z82GqbDk1ISdqixvgqoFpvboexYsyn0LdOG9ImSBQvSVdscpVx
	 wD3YnH6iTcML4IJrMqZVmmfdAnmj1OZe0hqQlgp3r+FlQV4DHqarG1wTok/jG1HK/7
	 NcevHggAYLOOLsKswOtKUIhp2nGkGdtWs1LFIpThudzx0DqAa+ukcUHGgdge7rAISq
	 OSTdJRe3EaqHD/pmiV7E67uuOBvLsCE7MV83veEncrzzwVjtoAPczPmD2vf18mLKEX
	 n3iHAnAI1BkabQPxBZgX15nKh8j2vOq10iMHmBClPLb8O210D0EX6GZJWVEcDyD9Gn
	 TftJhpnZpKauQ==
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-7f4f0d37f9dso383701a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 06:30:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxpvtfsvsWOQaaU52xFyYMogqhKEnBJS1ced/2WSTOis+jcIJXAUKiXJqhtSySloAJz/2TUUNuIIL+RveO0EeQV@lists.infradead.org
X-Gm-Message-State: AFuF++kWviicQb2sFTyr/FB5gczTERaIm/TrhrkRDKQn3NtURSvbe0AU
	dwTVbxyoS1nGLs1atr1eOOtQqxUfixumuSnOPGTt8PNRufhHjX65+Z7Bju5e3r0yQKOyHcyTU6r
	IHF+CIYlOBzN0Fi1j12pem+KLzO5TRZc=
X-Received: by 2002:a05:6820:818f:b0:6cd:3ffc:ad01 with SMTP id
 006d021491bc7-6d441c7de80mr5856938eaf.81.1790343019904; Fri, 25 Sep 2026
 06:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260914140821.1805449-1-arnd@kernel.org> <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
In-Reply-To: <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 15:30:05 +0200
X-Gmail-Original-Message-ID: <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
X-Gm-Features: AclHuK_tdwElKKmMYGPFlmZM1P8fO1IIRCqgIQbs7o9aMikBwWdJXpQ3EUUcqPA
Message-ID: <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: Yoshifumi SHU <envzhu@gmail.com>
Cc: arnd@kernel.org, Frank.Li@nxp.com, aaro.koskinen@iki.fi, 
	alexander.sverdlin@siemens.com, alexandre.belloni@bootlin.com, 
	alexandre.torgue@foss.st.com, andreas@kemnade.info, andrew@lunn.ch, 
	arnd@arndb.de, claudiu.beznea@tuxon.dev, conor+dt@kernel.org, 
	david@kernel.org, devicetree@vger.kernel.org, enelsonmoore@gmail.com, 
	festevam@gmail.com, geert@linux-m68k.org, gregory.clement@bootlin.com, 
	imx@lists.linux.dev, kernel@pengutronix.de, khilman@baylibre.com, 
	kmehltretter@gmail.com, kristoffer.ericson@gmail.com, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk, 
	liviu.dudau@arm.com, lpieralisi@kernel.org, mcoquelin.stm32@gmail.com, 
	nicolas.ferre@microchip.com, npitre@baylibre.com, robert.jarzmik@free.fr, 
	robh@kernel.org, rogerq@kernel.org, s.hauer@pengutronix.de, 
	sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, soc@lists.linux.dev, 
	stefan@agner.ch, sudeep.holla@kernel.org, tony@atomide.com, vz@mleia.com, 
	thehajime@gmail.com
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

On Mon, Sep 21, 2026 at 1:06=E2=80=AFPM Yoshifumi SHU <envzhu@gmail.com> wr=
ote:

> I would like to request that the core Arm Cortex-M support be retained, s=
pecifically for v8-M.
(...)
> I am willing to help maintain this support, including modernizing the rel=
evant code. I can regularly test kernels on real Armv8-M hardware.
> If an active maintainer is required to keep the support, I am willing to =
take on that responsibility.
> Please let me know how I can help keep the support.

All right, now we're talking! Could you test and review this patch:
https://lore.kernel.org/linux-arm-kernel/20260910-arm-generic-irq-entry-v7-=
1-v3-1-5fd90f6859e1@kernel.org/

I do avoid touching the v7m path and it worked last time I tested
it  (on an STM32) but I'd like to see your take on it, AFAICT generic
entry is not really possible (easily) on v7m because of the
pendable service call mechanism but maybe we can think of a
really complicated solution? ;)

Yours,
Linus Walleij

