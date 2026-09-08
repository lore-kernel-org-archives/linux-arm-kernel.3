Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACE7C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4UIowynbF07Wy7Vh7mDdrS3+ucFbjTlgVg501LnxLs=; b=aVfRuqqUFLSAgpT89FmGc49abh
	/78zrNSYbRzNXcj3Okw3cUwcejsskBp81iLmE+23013LFn4vpZd5CWfhHPADF3XXpi/MPcdx9kiHS
	zWxfagDGmS8aL9exvoVZew9GAfp9Whf4xWRnlDfrvFX3W1sAKQ5ILOkSZicHVSWoHe8A7CmHk5I/+
	lOphYQkI+TpdaxjFltIOaLz/SeOWhEUlFM9fG6vzD6VhDfLrpWgbiFzoynUc8JUqbf1IECktaRaEr
	txv8KQJKo8DGmoJ8ud5obyy0eqj1m5ovLdJSxOR/9yYss8emDAvD18DK/W2wAobkgXpx9lU4gmQmd
	C7VavYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zuv-00000009t2z-0Zt6;
	Tue, 08 Sep 2026 17:47:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zus-00000009t2U-4AoE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:47:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 309AC601F9
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCCC61F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889649;
	bh=f4UIowynbF07Wy7Vh7mDdrS3+ucFbjTlgVg501LnxLs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QWiq73/bUJBaSql6XPvEpO5haopq+QZUsDg3Pfb88lO3bqF9sJ65Zuq7MrAvl603A
	 JLAIVFGOdFnNVCvnSkW3Q7vk3pjvzgJLICGFRCzz125LaHjZaL7+44VgddM/YstuQz
	 aUE1wtOYEHX05idPL3O02/sDZ7+xe11PXB7vHigTrd88hDk39LmLg/E5+FTLMLAje4
	 ORWCtsuL7FixLiau1JtOgKRSZHn+fJ4cfagitqQFJpBht14DH5CjD4j9FXkg58osBh
	 xUW74eVlWl0hF1mn3p/0M0c2pOppqakSWaH5sJza7NUNsRH2eBqm2PSxg6ON9bEqVk
	 MURVU9lRYUYNA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4af4be667so4901302e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:47:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwuS+DPY8EwhuQbiIrYkSyUPaLq4391uCPOUIFIey2Yix40S7DHD7o+a+npES7BznwzZyd7sk3L/x0XxKovAdmC@lists.infradead.org
X-Gm-Message-State: AFuF++lXA4o3KlP/cvnUYFYq4BtehVs60NdawvXHk4NKXwsTf6C1WCbL
	mkjgWLmYRI7Jb/weR3SZJ76c0DGmQCKPiS/1NcRobNgK1ojV7Y/eXErkTPJPYa5corXz24uStib
	a4drgurrjMuudxmYCnht/sn2JnVKbwdM=
X-Received: by 2002:a05:6512:3ca9:b0:5b6:183c:5c87 with SMTP id
 2adb3069b0e04-5b6183c5e04mr5069176e87.37.1788889259016; Tue, 08 Sep 2026
 10:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-14-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-14-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 19:40:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLndhdr2XYp2rYvngPMr4hkCtX3Xqv=bs76kuEK5MAq91Q@mail.gmail.com>
X-Gm-Features: AcwNN1Ujo9rjMuk24CQogLFJvH7ujiRz2lorQ7l9osv6uL8Ek2VIq58WljFfaCg
Message-ID: <CAD++jLndhdr2XYp2rYvngPMr4hkCtX3Xqv=bs76kuEK5MAq91Q@mail.gmail.com>
Subject: Re: [PATCH 13/13] ARM: axxia: remove entire platform
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Anders Berg <anders.berg@lsi.com>
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

On Tue, Sep 8, 2026 at 5:30=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The initial Axxia port was contributed by LSI in 2014, but never complete=
d
> after the sale of the business unit to Intel, which kept supporting the
> bulk of the drivers in their own downstream BSP.
>
> The downstream work has also ended now, and there is no realistic chance
> that anyone would rewrite it all into an upstreamable port.
>
> Remove it now that the 7.3LTS release is out and can be used as the
> base for one more downstream rebase of the downstream patches if needed.
>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> Cc: Anders Berg <anders.berg@lsi.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

