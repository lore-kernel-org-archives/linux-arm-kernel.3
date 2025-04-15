Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7459CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 15:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNMtICMK42MSDQJVWE0Ea5akCzQRixQqjmWk6aOLa4o=; b=qi8kA/xqbInsswAnn7d4so5hKp
	e9kWff9hufWg7qDszLJ0JDT8ZBDqrjxJt2/xs/EAZUzTl3911Y7N/Ej1iBi9BOwFur4FD5MZDsj3P
	fE4CeUN1Q1RKYGNLQ23mjS6/jqMDpFHFtavLKyVjNB7Bj2XVgFTzIJKnOK4Yy9tn/ZKAhjP2rg6c5
	SCl7Yrt949g7UgIlLSxjx8SwNTNHTFalPx5nphXg8W9WOTtZCkdeFUsxiku73P2wlQM7JEqK0zpYC
	IWCvzxpLEda/vEtvksT83d1VG5EzrdzC/VzysTnDxM1RQPnBFX9QdBVktIJO4FmONJV4Y79iBXBdi
	62pnOL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4i1c-00000006DvM-433I;
	Tue, 15 Apr 2025 15:16:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hzm-00000006Den-3NLy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:14:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 609E2A4A400;
	Tue, 15 Apr 2025 15:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADF4C4CEEB;
	Tue, 15 Apr 2025 15:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744730081;
	bh=NNkg4KBG1XF1rTXXMic0/x6nqkOh+W1QMwlkngBnbt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/pMlr3UVFCYWBcvpZLOuCoJgy02g1s9zvI/HbBU0IB5Ekwz/NQIU4hYUtuS7/kGp
	 gQPoFcHfZNCkuUntHqGxew5OAMaa9ofiCoclWpcBNC9IhsaNt1Ch6dIe9a1idXXebt
	 8X55QOY5Pi2zPWt2+UtyT/8B724qof+ccML8BPh0=
Date: Tue, 15 Apr 2025 17:14:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
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
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 08/13] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <2025041531-dubiously-duchess-276a@gregkh>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <3fbc487bc0e4b855ffbee8ed62cfb6bf3b0592e8.1742418429.git.andrea.porta@suse.com>
 <2025041557-masculine-abrasive-c372@gregkh>
 <20250415165505.0c05bc61@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415165505.0c05bc61@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_081442_905638_56298008 
X-CRM114-Status: GOOD (  17.44  )
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

On Tue, Apr 15, 2025 at 04:55:05PM +0200, Herve Codina wrote:
> Hi Greg,
> 
> On Tue, 15 Apr 2025 16:06:43 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Wed, Mar 19, 2025 at 10:52:29PM +0100, Andrea della Porta wrote:
> > > The RaspberryPi RP1 is a PCI multi function device containing
> > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > and others.  
> > 
> > So shouldn't this be using the auxbus code?  That's designed to "split
> > up" PCI devices such that you can share them this way.
> > 
> > Or did that get rejected somewhere previously?
> > 
> 
> It doesn't use auxbus probably for the exact same reason that the
> one given for the LAN966x PCI device driver [0] and [1].
> 
> Avoid all boiler plate needed with auxbus whereas drivers already exist
> as platform drivers. Internal devices are handled by those platform drivers.
> Those devi just need to be described as platform devices and device-tree is
> fully relevant for that description.
> 
> [0] https://lore.kernel.org/all/CAL_Jsq+1r3SSaXupdNAcXO-4rcV-_3_hwh0XJaBsB9fuX5nBCQ@mail.gmail.com/
> [1] https://lore.kernel.org/all/Y9kuxrL3XaCG+blk@kroah.com/

I really hate creating platform devices below a PCI device, so I'll keep
complaining about this every time people try to do it.

thanks,

greg k-h

