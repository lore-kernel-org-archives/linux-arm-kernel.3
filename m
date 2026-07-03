Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6824AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 16:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QJAmkOnoHA495YFan6Ky8WtBEo4v0J5CtKrSDPHCEg=; b=0iUI/DUUUpJTJYUkErf2ptoU5m
	ReZdakRbwBOFab1bWABX0pcfsralCdSJ1CdAOhnTeZf7hAZt0OtnVUzSPl6VSsbih+QhgGileXcs2
	7JuTMqhQvqxP4Zsp0OESRBmxAQa77xiOp30pSkYl/+5StiHwtwg0uYonBuxRrqIwzGjcDfAGyC2KR
	fkiDp2E0cOkwr33JVWYPpbUAi70HO/sqdxSPVDT/ZmlUdtz5a0IlDnV0nUUPrQVlo4biuzE3UUdEE
	8mJ/jDfOBsT08MwxJyTScZoslRRtpQDjoASchH9P+Y4lJVgs3XOYxdIVBjgrM3BOEJ+rLHRR4DlGB
	2e+Vt+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgbi-00000007Xzn-3buS;
	Fri, 03 Jul 2026 16:19:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgbf-00000007Xz5-1ymW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 16:19:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 907964E40C6E;
	Fri,  3 Jul 2026 16:19:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49DDA60300;
	Fri,  3 Jul 2026 16:19:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 447B011BB8526;
	Fri,  3 Jul 2026 18:18:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783095544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/QJAmkOnoHA495YFan6Ky8WtBEo4v0J5CtKrSDPHCEg=;
	b=whj5jeAO6iCTFq0BeQBQC4nFBg4yNtvwwlzpeXzd1S6uO6lqsB7ZJVl/1/tqfzVQ3a5KkD
	bq2U8kDlCTijPK9qC8AwLzRwUFrdzolVBYPpbzxSRFSO5TBncDpn581K0Wz9ph8JmvNxpV
	gJhwBVgnqegNOR1fdWVP6fHuPGGpmJKGlM7ynmWo/Hp7cMwj27yMs3TTiAu2tz6jCWCTKk
	gEKUu/Is60Y4BQf5hQ6EoCZOieTx5zzmXP5/QfbBJvutrnsx5Nc5EW0slTi8Z77rDW6mKM
	CpMwSIUT0FPlHPHxfozL31kvcaeBrDFxVmzvJ8kvRK76ZsAoKF6hzxXVUMIhIQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin
 <alexander.sverdlin@siemens.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, Ard
 Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Daniel Mack <daniel@zonque.org>, Ethan Nelson-Moore
 <enelsonmoore@gmail.com>, Frank Li <Frank.Li@nxp.com>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, Mark Brown
 <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>, Ralph Siemsen
 <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>, Sascha Hauer
 <s.hauer@pengutronix.de>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, Stefan
 Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 19/19] ARM: mark mv78xx0 support as deprecated
In-Reply-To: <20260701212353.2196041-20-arnd@kernel.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-20-arnd@kernel.org>
Date: Fri, 03 Jul 2026 18:18:54 +0200
Message-ID: <87y0fs6o7l.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_091911_672771_33281FEE 
X-CRM114-Status: GOOD (  19.60  )
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

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Only one machine remains supported and was kept in 2022 for the
> Debian_on_Buffalo project that was still using this, with plans to
> convert it to devicetree.
>
> The conversion never happened, and Debian_on_Buffalo does not provide
> kernels later than linux-6.1, so it is unlikely to still be useful
> for a DT conversion in the future.
>
> Mark the platform for deprecation after the next LTS kernel, which
> should give any remaining users a few more years of bugfixes.
>
> Link: https://lore.kernel.org/all/20221019150410.3851944-6-arnd@kernel.or=
g/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory
> ---
>  arch/arm/mach-mv78xx0/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-mv78xx0/Kconfig b/arch/arm/mach-mv78xx0/Kconfig
> index 670e6587827e..98b35f5d05ba 100644
> --- a/arch/arm/mach-mv78xx0/Kconfig
> +++ b/arch/arm/mach-mv78xx0/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  menuconfig ARCH_MV78XX0
> -	bool "Marvell MV78xx0"
> +	bool "Marvell MV78xx0 (DEPRECATED)"
>  	depends on ARCH_MULTI_V5
>  	depends on CPU_LITTLE_ENDIAN
>  	depends on ATAGS
> @@ -14,6 +14,8 @@ menuconfig ARCH_MV78XX0
>  	  Support for the following Marvell MV78xx0 series SoCs:
>  	  MV781x0, MV782x0.
>=20=20
> +	  This platform is scheduled for removal in early 2027.
> +
>  if ARCH_MV78XX0
>=20=20
>  config MACH_TERASTATION_WXL
> --=20
> 2.39.5
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

