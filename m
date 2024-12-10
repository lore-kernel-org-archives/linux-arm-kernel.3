Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E6EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 22:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mek5W+2DRa12CodhgWjGtQ3OZ8TM4EmFbwA2yovNbmE=; b=adTVW0wwqFzHEZdWJbbjD48H1x
	xyBIvhdW02fprDpzebqY5BT2uPS2cCxfuVGVWiAdh04k1YIYV0BCEpdfco8znik2koc+1Xh95Hhjg
	A6XuCHjEb40M3uOPVurzI7dDqQQEZ6Jf935bVSK7fHLh8PxYPOUJ2CV7ou72dWGNBCxoAjv9IbbwS
	tq4FJc9PC1osp5ST2Py9ZbAq8YZS+P7veuNY4LyBNBOWQi5pHk4gzNloiuP7X7ZZqIQ64xd7BvUTv
	i0gnpB1dWC12BIGGCA3W+Uk8dtsfwAOQO/UNVbQ5ZpdenftEUWdITSxFZvz51YzpyiW8oRAsw+2mV
	m08HxKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9AH-0000000D4vq-1235;
	Tue, 10 Dec 2024 22:57:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL98H-0000000D4O9-1s6d;
	Tue, 10 Dec 2024 22:55:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 58EDC5C6300;
	Tue, 10 Dec 2024 22:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D0CC4CED6;
	Tue, 10 Dec 2024 22:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733871308;
	bh=9J1aa/Yh3HudPCpHSSxjlghwlr0RlKDY/3giY0+oXAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cM/4VcruTmwaKzBl3kR1lSSTuI66cHreDK5675IsNhiplmDizdIGMfZ+nI44JMql5
	 DH3X4ohXX3l/ep1vMlb7vIzPn9+2AU7LUII2O8Se2NtKiyCJXUMiAmF1f8W6U8gp9G
	 FS8MX3tervSTGlzOXNvMVZt1tmwQCVgj3Rd4lZdFtqMVJJalSKAXgKeZpo2fLKXYNX
	 N2znVb6+Nw+vmeaZl+nMgu0owQDAgr+5DaN49jhV8j22NoPIkhmIMTTMofMhYell/e
	 ReYtTk5PNKoBXB+W/Jds/GnthHUuDkwvBz5wTKmYz9yPN9Hnpc/27Rseyz6KRVtDSV
	 lSM7prZIWZ8vQ==
Date: Tue, 10 Dec 2024 16:55:06 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	linux-kernel@vger.kernel.org, Krzysztof Wilczynski <kw@linux.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Will Deacon <will@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	Saravana Kannan <saravanak@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-rpi-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
	linux-pci@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v5 04/10] dt-bindings: misc: Add device specific bindings
 for RaspberryPi RP1
Message-ID: <173387130632.752894.7048832305370106368.robh@kernel.org>
References: <cover.1733136811.git.andrea.porta@suse.com>
 <99c23bd584d7b1b998d2cafb7807e0650db73f20.1733136811.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99c23bd584d7b1b998d2cafb7807e0650db73f20.1733136811.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_145509_527068_11F08547 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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


On Mon, 02 Dec 2024 12:19:28 +0100, Andrea della Porta wrote:
> The RP1 is a MFD that exposes its peripherals through PCI BARs. This
> schema is intended as minimal support for the clock generator and
> gpio controller peripherals which are accessible through BAR1.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  .../devicetree/bindings/misc/pci1de4,1.yaml   | 73 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


