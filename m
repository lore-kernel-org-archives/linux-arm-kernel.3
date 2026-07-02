Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D496C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 13:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vYmA9TUhXqQi+P/KHutU0J8y5jxe8n/jqKbfp/W04A=; b=MRknhl9KMv5R42/GG/PvCQHCZT
	bTMSQ7mKQ/cP/16GXBP5nSlL8pLD4PeqLsG0dun0rsNmjuU7+jzmggYpueTDQGXjKwtWsEciDPDLy
	fPTa0lOx4mvmhr2udi7fhH1//VnWCovd53xFt0ZnaqZ/zC+tg5cZrfJ1qC3I9zMkJkseeEYA/EGKs
	8UOeZLFIE26HPltu7d+5jsZ484Hkl1/MA88PW9hDxqXjhSJJO0ZsgDt3ySuy/AIv6WvfZwWJrM4Ao
	eYOGcVNiB9XLyVyXJBv8MpY8eBixJnJwfEPy8Z4N8Jiexh6jBKcIamSrh6hax+G0AEGeAAhF8BZ62
	G3mrQNcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHA6-00000004Un3-0NEa;
	Thu, 02 Jul 2026 13:09:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHA4-00000004Umx-2B6l
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Jul 2026 13:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+vYmA9TUhXqQi+P/KHutU0J8y5jxe8n/jqKbfp/W04A=; b=CFgaahyDr92q2pMIzyy2szdZDW
	FAEaMniUxNoCmqkGUlz5yEeBo5Xj4Vu0/6l03ElmA8QmMeKY3OMUAgSeZ2tgamd/ccqDXMDE2UBDZ
	7jBqF7EJcbwXofEDcMFeOph0pQBMoIkItaNHafrgV4KFhfyI3MdnxqMPqbdrAVrASPOV+9NsBZRyx
	h5PlWcFvaz/6mIZbePG4xhheF0vRWR7U9LQiRXYnMpzUWLTrLFbgp+U3Ss32OG+fxmEHDVxVuPms7
	DFxEIJOngxtWwoYCT+W4jcXXSmKjYEwxoQzI4yPHpCC8cNjOeQbS20BJJpE5565+uLFbf3Q5mDHd1
	jzgG47pg==;
Received: from [72.10.137.214] (helo=rfs.netwinder.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfHA0-00000003qf1-0h0Z;
	Thu, 02 Jul 2026 13:08:56 +0000
Date: Thu, 2 Jul 2026 09:08:51 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Mack <daniel@zonque.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Stefan Wiehler <stefan.wiehler@nokia.com>,
	Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 16/19] ARM: mark footbridge as deprecated
Message-ID: <akZi2QajWgg6qgGB@rfs.lan>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-17-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260701212353.2196041-17-arnd@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <ralphs@netwinder.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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

On Wed, Jul 01, 2026 at 11:23:50PM +0200, Arnd Bergmann wrote:
>
>Along with RiscPC and SA1100, these are the last remaining Intel StrongARM
>machines. The Corel NetWinder used to be particular popular in the late
>1990s, but was discontinued during the bankruptcy of rebel.com in 2001.
>The other machine is the DEC (later Intel) EBSA285 evaluation board that
>was made in small numbers in 1997 for software developers.
>
>The footbridge/netwinder platform was the main target for the first Debian
>2.0 "Hamm" release on the Arm architecture back in 1998, but was dropped
>in Debian 6.0 "Squeeze" in 2011, which only supported ARMv4T and higher
>with the EABI based ports as ARMv4 hardware had fallen already out of
>use by that time.
>
>Link: http://netwinder.org/
>Cc: Linus Walleij <linus.walleij@linaro.org>
>Cc: Russell King <linux@armlinux.org.uk>
>Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
>Acked-by: Linus Walleij <linus.walleij@linaro.org>
>Acked-by: Marc Zyngier <maz@kernel.org>
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>---
> arch/arm/mach-footbridge/Kconfig | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>
>diff --git a/arch/arm/mach-footbridge/Kconfig b/arch/arm/mach-footbridge/Kconfig
>index 78189997caa1..96a74d447028 100644
>--- a/arch/arm/mach-footbridge/Kconfig
>+++ b/arch/arm/mach-footbridge/Kconfig
>@@ -1,6 +1,6 @@
> # SPDX-License-Identifier: GPL-2.0-only
> menuconfig ARCH_FOOTBRIDGE
>-	bool "FootBridge Implementations"
>+	bool "FootBridge Implementations (DEPRECATED)"
> 	depends on ARCH_MULTI_V4 && !(ARCH_MULTI_V4T || ARCH_MULTI_V5)
> 	depends on !(ARCH_MOXART || ARCH_GEMINI || ARCH_SA1100)
> 	depends on ATAGS
>@@ -12,7 +12,10 @@ menuconfig ARCH_FOOTBRIDGE
> 	select NEED_MACH_MEMORY_H
> 	help
> 	  Support for systems based on the DC21285 companion chip
>-	  ("FootBridge"), such as the Simtec CATS and the Rebel NetWinder.
>+	  ("FootBridge"), used in the EBSA285 and the Rebel NetWinder.
>+
>+	  Support for these machines will go away in 2027,
>+	  unless there are any remaining users that speak up.
>
> if ARCH_FOOTBRIDGE
>

Speaking for NetWinder, although it is sad to let it go, the reality is 
there have been no active users in years. This is based on the mailing 
list being silent (other than spam). And the trickle of emails I used to 
get about netwinder has also ended for many years. So with that:

Acked-by: Ralph Siemsen <ralphs@netwinder.org>

Regards,
Ralph


