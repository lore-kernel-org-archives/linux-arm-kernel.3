Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710E3E668BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 19:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3bP0t16qsr90BwN1tiQOKPDR7z/6lXOBhQWdTBTAaU=; b=5GI93gu9i389V9d835FveSCqs/
	q0UZu9U2FuoiZVG6C++Sg8L1J2J2eco5pEkYzBXlejFdQhrWbXr3IqbCDxia+pNhY2PddKR621Xno
	SUTfTQ68HQCvoTPfIGeG2LIm4AKUm50itJhK7Lj/w6D0fHSUsBdqot5CKeT95mw+FC7NHKeVhi6hb
	KoSt0resHfKXVrhU0FPy4AJ/le6aEmTWVhpr5e6RRwj7jpZVbagkV0EgO0OP2OG9lVNYQfSzZZEY0
	sRa9n8gZtDqb28hzvcuNCb4sLuU7fcjw2A9yTAunTGxh77+fcnyIxqtDsZvi/Uy/AHghqU/Ct36/K
	EX/EvgnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFIGI-00000006Zlp-3rMj;
	Sun, 24 Nov 2024 19:27:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFIFL-00000006Zdy-3wtT;
	Sun, 24 Nov 2024 19:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=i3bP0t16qsr90BwN1tiQOKPDR7z/6lXOBhQWdTBTAaU=; b=PknNvkSMC52LiAhA92txLc/aKX
	447dPAd8ahF9BHssahwaLfnKSsifKDkUd4TYXyjF4o6JEW4XQQFdhGrop/Qf/mwgGR0oNpvHs7xh2
	GcH42RuOLGW36Dks561K1Eb7Vf4RK/3p4gB49E1sC7CMYd+mADqhuVEbWT3QVXisIBZM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tFIF7-00EJWL-1B; Sun, 24 Nov 2024 20:26:01 +0100
Date: Sun, 24 Nov 2024 20:26:01 +0100
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
Subject: Re: [PATCH v4 00/10] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <22e08939-fa89-4781-824e-1ea01648fb1b@lunn.ch>
References: <cover.1732444746.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1732444746.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_112615_982119_1E8BD572 
X-CRM114-Status: GOOD (  11.44  )
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

> This patchset is also a first attempt to be more agnostic wrt hardware
> description standards such as OF devicetree and ACPI, where 'agnostic'
> means "using DT in coexistence with ACPI", as been already promoted
> by e.g. AL (see [4]). Although there's currently no evidence it will also
> run out of the box on purely ACPI system, it is a first step towards
> that direction.

When combined with CONFIG_PCI_DYNAMIC_OF_NODES and this patch series:

https://patchwork.kernel.org/project/linux-pci/cover/20241114165446.611458-1-herve.codina@bootlin.com/

It probably does work, or is very near to working. Bootlin appear to
have the LAN966x working on an ACPI system, and what you are adding is
not very different.

I'm also currently playing around in this area, trying to instantiate
some complex networking hardware using DT overlays on an ACPI system.

     Andrew

