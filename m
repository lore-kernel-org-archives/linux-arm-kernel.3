Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9768C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 11:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V59F5LeFLLk0hiR6HVyBNdzVUev2yIANYpC8FeFlguU=; b=ruILNhu+AIdLlngSMdVHbVrx51
	aA+lchst11CXNlWqGDhNbFNwISxNhocEh0WnFZy4hd2WEoPhBy/IPODNdAeZsMu+1c5qSrPuXDxvp
	655n/G0ET8ZggPk5kIsdyRIAmBp0Vmw5gbWfyvPKmM5VULuWc2koSuS9yJNXJs9TRjYbc4v6O1JUq
	tEwGd8gsvxPQW5A91M0iKtmKAadKICDhIK0mfKjgUzgn5wERYZJ9U/x9Yfwcbh+k3qYaRBzSYy1Tx
	X/L3HCul1SXBz8G81LPDF/EMAiQtgbOBQtMFpBAPg4hWGUGhY1G56hAzkUoDA2VYoSb+u4TmeqHwM
	nv3+77gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfG59-00000004N9s-0whM;
	Thu, 02 Jul 2026 11:59:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfG57-00000004N7q-0UD1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Jul 2026 11:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V59F5LeFLLk0hiR6HVyBNdzVUev2yIANYpC8FeFlguU=; b=OutkGWzxXx7M8LQMhloU9ATZyR
	Iye5/XEP+f1z6Ye/tHyHi5lEF/ahNeLVw90RxSDKUf/V4zXneTqBq4a/TpdchvDuT6OWw63K9JQl5
	UC88leaNfUs/KCVMbpVo4JA5DvSldIrc55gfU99M8mUvCk/0/h2B91LAk1o8voXmHC0FQi3gh5t3V
	reX40qWgzBSv1VnN5vPRtMp+Hdg0ETCOZX0tzJEjC6oV0FAYn617MBep2vePX8DfgLsdSCMNDi5w9
	00vYAaj0iTlks2rTV3PKWpvxw9SF+4f4KxJ5ZjdS27MEUAPBiEp4DPY/I16G6UlXewWTytCCD2ZPi
	bEtbk3Jg==;
Received: from [72.10.137.214] (helo=rfs.netwinder.org)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfG4z-00000008Tfh-24bT;
	Thu, 02 Jul 2026 11:59:42 +0000
Date: Thu, 2 Jul 2026 07:59:40 -0400
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
Subject: Re: [PATCH v2 09/19] ARM: update FPE_NWFPE help text
Message-ID: <akZSrFc_8ra8sysq@rfs.lan>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-10-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260701212353.2196041-10-arnd@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <ralphs@netwinder.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Wed, Jul 01, 2026 at 11:23:43PM +0200, Arnd Bergmann wrote:
>
>The help text is seriously outdated and predates the introduction of
>VFP floating point units that were available as early as some ARM926
>based systems.
>
>Change the help text to reflect that this is now a legacy feature
>and that it will go away along with OABI support in the future.

Indeed NWFPE was initially added in order to be able to execute 
pre-existing binaries from even earlier systems.

Once soft-float became available in the toolchain, the netwinder
userspace was rebuilt, and NWFPE became largely unnecessary.

All of this happened in the early 2000's.

>Acked-by: Linus Walleij <linus.walleij@linaro.org>
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Ralph Siemsen <ralphs@netwinder.org>

Regards,
Ralph

