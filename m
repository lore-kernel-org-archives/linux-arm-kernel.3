Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DC0CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yqV/Awvfmtsj6q/00BzdhQQlByccag34Ejy1niliro=; b=acpEPI06pds7DJX+qd/K9Tm7/2
	Rmfgugpqa76m8r7Ctv2hzdCfncrAiV2xPy90Ye1XBhRqdoHJET8wSjqxQ1VFfwZqzMqgu80Aij5yu
	wyfAcJZhNGqEyAK2keUoa+9MGatSxLYmT+C3WYpNeT8hQp+kkCMB52IVBpCkdwk0AXnxgxgHtJCln
	cx2jy3bjyjJryq3C4LyP0D7LnnijgsE19vLo16Ts+ZYiz+2AmidEijJGgzmjFTPAaWjOxlyKxvCQH
	DufdXjFDkYT2qsWTmhQ91kt/59Fd/d/T0e72i6cts+uQsz2hqrnhxDpgaU16wtyE46flKb0bk/Hhs
	NCCrvDsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG5K-000000094gd-0iy6;
	Thu, 01 Oct 2026 12:40:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG5I-000000094gW-2F0c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:40:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D86760A57;
	Thu,  1 Oct 2026 12:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B14C1F000FF;
	Thu,  1 Oct 2026 12:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790858423;
	bh=2yqV/Awvfmtsj6q/00BzdhQQlByccag34Ejy1niliro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZCRnnyX8s+71IPbGhb8/YT80JuAIidJq2MhvpK0OmnrhU8tM+2O/S/Bl9VgbeSrPX
	 3yUSMWSDbh1RXwypspIpwjZ/Z1PM3duR4aqQ5YFaM18wqtZpQby0D1EYtE8k0QSZ8e
	 DoX3iA65giwjlB+w0u+rUBIopt0ZKF8dcOZLwjiJykmgjKICYBg4gER6dAUCEQaqZ5
	 PZoZQFXgI1hXXsF9qPOv4feQbT7MXXMdRjvhizrHrFEkp+CUlPa5hfyyQyv7ZuAGWk
	 2kP8fPcf8yDi1q6BuPrC+UIeF2Cb1AbHsbQvgbgAFl2g7EjyyKHiScRLdrGa3q4/RR
	 N5Mf3T94WTuVg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
 Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org
In-Reply-To: <20260914140821.1805449-1-arnd@kernel.org>
References: <20260914140821.1805449-1-arnd@kernel.org>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
Message-Id: <179085840863.602414.17097032215174834953.b4-ty@b4>
Date: Thu, 01 Oct 2026 14:40:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Mon, 14 Sep 2026 16:08:02 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> In the 7.3 kernel, I marked a number of platforms and features as
> deprecated, with the plan to keep these around for the LTS kernel, but
> remove them in 7.4, see [1].
> 
> Cleaning out the deprecated platform code has turned into a larger effort
> than I expected, currently standing at 300 patches, with a lot of them
> still in need of being split up into smaller ones, see [2] for a current
> snapshot.
> 
> [...]

Applied, thanks!

[01/14] ARM: remove sa1100 platform
        https://git.kernel.org/soc/soc/c/95664df86fdf6e70e411ad9e3910b402489a22c3
[02/14] ARM: remove footbridge
        https://git.kernel.org/soc/soc/c/21b5f207cb8b1d0a819dd1799ef8c56178d5b1d7
[03/14] ARM: remove legacy pxa board files
        https://git.kernel.org/soc/soc/c/538532cd1532f44e7c2519ecd3dfbcbed08061e2
[04/14] ARM: orion/dove/mv78xx0: remove all board files
        https://git.kernel.org/soc/soc/c/f98cb2a43e0efa32ed8723df8d687acdb69dab06
[05/14] ARM: orion5x: fold plat-orion/pcie.c and hw_pci into pci.c
        https://git.kernel.org/soc/soc/c/4fa61946d7c3e6da57a6db11551fa2ac17078370
[06/14] ARM: omap2: remove omap24xx support
        https://git.kernel.org/soc/soc/c/cbd33c61480b8fa64046d956f4f68bca5cf68fbe
[07/14] ARM: imx: remove i.MX31 SoC support
        https://git.kernel.org/soc/soc/c/104a7a07163962fe259a2e5272fb70446f19793b
[08/14] ARM: versatile: remove Integrator/CM1136JF-S option
        https://git.kernel.org/soc/soc/c/1fbbfb51f20f3d0a1da6b542d7f29acc29815403
[09/14] ARM: imx: remove nommu support
        https://git.kernel.org/soc/soc/c/2e1031df3c5f64f96660074f695e3b24e4bd3018
[10/14] ARM: lpc18xx: remove entire platform
        https://git.kernel.org/soc/soc/c/31431dc97977003efbd4fb25e77aec8744338280
[11/14] ARM: stm32: remove stm32f4/f7/h7 MCU support
        https://git.kernel.org/soc/soc/c/6fa463cad26fed984b62a764345e65a98fd0a30a
[12/14] ARM: versatile: remove mps2 support
        https://git.kernel.org/soc/soc/c/1b983b0549163d4016574b0043664cdb47eea8cd
[13/14] ARM: at91: remove samv7 support
        https://git.kernel.org/soc/soc/c/1b9867b95e1e4a88c80b2e5612b7092b90ae3f88
[14/14] ARM: axxia: remove entire platform
        https://git.kernel.org/soc/soc/c/af4f7acd7b73780c7fece5d156e7d9a7791a60af

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


