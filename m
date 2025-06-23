Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CAFC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=jEQi7zwrzyDIj3PdB7vMHUhBM8BUzUufnuUw+YHWca4=; b=wbjhDRZy+Ubekg
	6R88AgfYCLLqIxvV3P01hDWT4cGsDKkOuLVQK6IiEC8BlBBHNarUrm+PkY4Tntvo28yy7nBoTiTPh
	z2ggn77ziet1Y7UJB8rBgZXtVocYZg/S6f73VO/kv9BlNS+rJJ4zQ6wej6Kvqb76pkwExPGS1jz6S
	XylwK8GaACo8cbEICS5iD4i3f1mEbCZ6+8rli1gT5372I9kb3qFTmiGIAcS1w3tVvCqBeppGUtt0e
	TU9ok2wOsWt4+3vtGAjyzCSWCES0DZ0Pct2jkT1AvnxHBU7J8GdUznkCvFNow2wIFXApvP+7JpEs/
	5aayjauT0BHBXye73nvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscf-00000004OFF-3KJE;
	Tue, 24 Jun 2025 01:38:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTqNF-000000049LI-3su4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 23:14:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8484C5C58A4;
	Mon, 23 Jun 2025 23:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C9BC4CEEA;
	Mon, 23 Jun 2025 23:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750720488;
	bh=6LzesJl0kmLg/Yoa6T382QmQxVwEVUfX/TAiShEDAEk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kMx7Wr4fbnk/OW/YvdljcMwfmBjZhDh0Q/9ALni+SFRZvk8ogsIogtkBFck15xHZs
	 oKelFlmsXQgR7XLJoiMShq98NGyWzsGi7AuplNLuw0GdmkYKB7U4Rxnj+60kW6CDHi
	 W0YJVlA5fFOMFPdnbucDFKkLuR8ILnblAy0jY/4Sc9O1jG7MfuQ3oxjwOYrwAhpMMZ
	 4ALzWQ/bHaLnLeUJqada7xvk/desc+kQCG5Tq8tbdpbxpNb9qk0XliDwBklYtFLk/2
	 FzxBBOzRttdHDDi9xHVtjWYATXb7IrOzaj6ybNDVcb4CLu1oU4tNuFtGpBMu7lbZyf
	 SANU2FJJvYBvw==
Date: Mon, 23 Jun 2025 18:14:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v2 stblinux/next 2/2] clk: rp1: Implement remaining clock
 tree
Message-ID: <20250623231447.GA1450188@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17e5c6e0c085cfa0bf4b63b639cdc92c6a4c1418.1750714412.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_161450_000849_A389EFC6 
X-CRM114-Status: GOOD (  12.55  )
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

On Mon, Jun 23, 2025 at 11:46:28PM +0200, Andrea della Porta wrote:
> The RP1 clock generator driver currently defines only the fundamental
> clocks such as the front PLLs for system, audio and video subsystems
> and the ethernet clock.
> 
> Add the remaining clocks to the tree so as to be completed, which means
> that the following RP1 peripherals could now consume their specific clocks
> and be enabled to work (provided that the relevant driver changes for each
> specific peripheral, if any, are committed):
> 
> - ADC
> - Audio IN/OUT
> - DMA controller
> - I2S
> - MIPI DPI/DSI
> - PWM
> - SDIO
> - UART
> - Video Encoder

Thanks for this detail, that's exactly what I hoped for!

