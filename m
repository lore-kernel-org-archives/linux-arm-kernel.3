Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A501ACFA453
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mo5TXq2lM94AOYob7sigSv7lm1UH6+vMtcH4MaKVCI=; b=CRcD2yIIPagJQc7Mh22nX7znI6
	p8etD/NnyhUk1o3rKqGcx80h6rPOozO3aFHazSuI2eFGKFsBjQqXTTIJjlJJU2dTLr5FWMjpSd7bm
	MAnT8QiMXConLcJQW+3+UF03E+p4K+gWrlA/62+LeUIU3KU1LdYOvufzKsAHIQZYAou9G9ER08xBU
	JiD+aWZ+F/nuDiMGEJr+2XLnReP+6ILluBxTt+euT25zQRAYb7RK5ohtzbW/6Xa2e+BCqQhg/iIlz
	O1CWVHT7PTbcE4S1UePGYa+PymD7vAPIDZi/FONQ9/LYykvm0CqpnOS8VNYxhnSdKdJpfvoKmSQ7V
	xEP3JeWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eyq-0000000FLRk-00RH;
	Wed, 23 Oct 2024 17:17:08 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eHx-0000000FBJT-0ucA;
	Wed, 23 Oct 2024 16:32:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60BC940002;
	Wed, 23 Oct 2024 16:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729701164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2mo5TXq2lM94AOYob7sigSv7lm1UH6+vMtcH4MaKVCI=;
	b=iAf/g0I2OwQO00ReC6C88G//21aTCm8VlXqLUz0rDUOWS1CRki4N+V3xFVghUaJQNvn72n
	Qpk5JQCZK/Sbi2XAyf4zsqDNUyew8tVwAhxmYx+ezK0zr5DZgZK5VWfAyA5fzY2IEgyWV7
	DiH+k8QuSrgZsPY3p0v4k+Fws/eYodmishgCNQXEueUEzM3ZuN3oDY4gGT3ncZGbYTZzWP
	rFabYPUeE2ili/emKROsPngRGFeG1VimgOrtiIRQrsXqDtagozfdquWUHB5T4aARxllfNU
	6BsL05hnF4PrqEu0/dx/92y5hfmem7fy6oL2bPaBSJqrQEOsJjSzZonTu+JZGQ==
Date: Wed, 23 Oct 2024 18:32:40 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Arnd
 Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn
 Helgaas <bhelgaas@google.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kw@linux.com>, Linus Walleij
 <linus.walleij@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, St efan Wahren <wahrenst@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Will Deacon
 <will@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 phil@raspberrypi.com, jonathan@raspberrypi.com
Subject: Re: [PATCH v2 08/14] clk: rp1: Add support for clocks provided by
 RP1
Message-ID: <20241023183240.0dffae03@bootlin.com>
In-Reply-To: <ZxkX5gnDkWrTynRv@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
	<022cf4920f8147cc720eaf02fd52c0fa56f565c5.1728300189.git.andrea.porta@suse.com>
	<611de50b5f083ea4c260f920ccc0e300.sboyd@kernel.org>
	<ZxkX5gnDkWrTynRv@apocalypse>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_093249_692727_D364BD10 
X-CRM114-Status: GOOD (  14.75  )
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

Hi Andrea,


On Wed, 23 Oct 2024 17:36:06 +0200
Andrea della Porta <andrea.porta@suse.com> wrote:

> Hi Stephen,
> 
> On 15:08 Wed 09 Oct     , Stephen Boyd wrote:
> > Quoting Andrea della Porta (2024-10-07 05:39:51)  
> > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > index 299bc678ed1b..537019987f0c 100644
> > > --- a/drivers/clk/Kconfig
> > > +++ b/drivers/clk/Kconfig
> > > @@ -88,6 +88,15 @@ config COMMON_CLK_RK808
> > >           These multi-function devices have two fixed-rate oscillators, clocked at 32KHz each.
> > >           Clkout1 is always on, Clkout2 can off by control register.
> > >  
> > > +config COMMON_CLK_RP1
> > > +       tristate "Raspberry Pi RP1-based clock support"
> > > +       depends on PCI || COMPILE_TEST  
> > 
> > A better limit would be some ARCH_* config.  
> 
> I've avoided ARCH_BCM2835 since the original intention is for this driver
> to work (in the future) also for custom PCI cards with RP1 on-board, and not
> only for Rpi5.

Maybe depends on CONFIG_MISC_RP1 ?
CONFIG_MISC_RP1 enables the RP1 PCI driver

Best regards,
Hervé

