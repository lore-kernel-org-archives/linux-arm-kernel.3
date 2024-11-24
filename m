Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF74CE668BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 19:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GykA3KcCgiZFrIubEllhonhwTqAWArBryLo6OL2K7A=; b=sk3elU0fyhAmok1KsR4SOTUw6T
	n55yzyi2/e9h6plPB+ZxiJ8X3CZXh9XEBfnPrJYjLi8WTArQrY76M0BxawgGjxPZrwWXuGOWaB4ta
	JagA+brtS1lGJcMPxJR/DlzLWsVStNyjHoEoIorL6GXVHbq9rElRI+R6Nfd/B+jhD7c7L9FqDFlhN
	RPVv92s89+ZKX4mxcMH6aCJ91uJkFrk7rSsiRisD6cyLkXKvy5Dtko2GsoWt6+TDsrBVaD2L/aImO
	kMCdJfFbDQEwUvkKFO2LjAqG32A6KrjwSra7IROhg38kfSTkfEwNWZlkTx87zW5Q9tz8YtsoG0DBX
	nusY0kwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFIV7-00000006acF-20Gy;
	Sun, 24 Nov 2024 19:42:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFIUA-00000006aXW-38sl;
	Sun, 24 Nov 2024 19:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+GykA3KcCgiZFrIubEllhonhwTqAWArBryLo6OL2K7A=; b=WsgF/ZrBh40RGoTDGIj8izylFB
	NPbyHzySRoNccf9RLlCl2XoPoDVvbXBoebGwykMuVwg9ueGS2YkG8g82X51zwJaL/D2+7LhLWcyGs
	nR2h1WCN9quegZbNlrYg7eYVo7OEBTeYR2dRZ70erM5Vf3JDpX2JU3z4XMYUc0zGdeXo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tFIU1-00EJYp-SE; Sun, 24 Nov 2024 20:41:25 +0100
Date: Sun, 24 Nov 2024 20:41:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 09/10] arm64: dts: bcm2712: Add external clock for RP1
 chipset on Rpi5
Message-ID: <9abb376c-3399-4c2c-8e7c-cea1184ea370@lunn.ch>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <8deccbd7ab8915957342a097410473445987b044.1732444746.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8deccbd7ab8915957342a097410473445987b044.1732444746.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_114134_787896_F97C8C73 
X-CRM114-Status: GOOD (  12.35  )
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

On Sun, Nov 24, 2024 at 11:51:46AM +0100, Andrea della Porta wrote:
> The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
> Add clk_rp1_xosc node to provide that.

I'm wondering if this is the correct place for this clock. From your
description, the bcm2712 itself does not provide the clock. There is a
crystal on the board. So the board provides the clock. What happens
when the RP1 is used on other boards? Also, does the RP1 need an
actual crystal, or can you feed it a clock? Often such inputs are
flexible, you can connect a crystal across two pins, or you can feed a
clock into one pin.

If a crystal is the only choice, i would probably have it part of the
RP1 overlay. If a clock can be used, i would make it a board property.

	Andrew

