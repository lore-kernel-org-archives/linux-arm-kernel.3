Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B02CC369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 19:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=sLL3Rk04mgf4fJSpP8L0B5HUGnIWGNmLFxz9gyU48tg=; b=FX+Yb8YgF9YaOi
	nS9Xlu5YD686SfaeCe3EXkO9ipx9OBLAyA5h5khOCjIZKSSf9T7B5K8KQ84GGTNsbD/6JvtfXWHKk
	/CpaWWxm53dUsRJvXsz9VycNu2HiavuxuKUmrjIwINa50WwSdPtN/7LSmTomus08Tval8QbN8AVy1
	xOw5SdWDhH/033h1g9o2U42497m+j6yoDBJf1GgiReyUY6GiiE5LOumZYCVRWTF0RNeulWIxDV+k1
	OlJ1BklrwrR4hTJ8cIzK90FGJ2d6+xg/ixkM0FgzSsfqNy/HnArB4vRXy6s4S6AzK3EhtP+kipyOa
	GcPKdxUiO3rjeXPE9xZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u58TN-0000000AhaQ-1d7W;
	Wed, 16 Apr 2025 19:31:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u58RX-0000000AhKC-3klU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 19:29:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E29506156A;
	Wed, 16 Apr 2025 19:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C10C4CEE2;
	Wed, 16 Apr 2025 19:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744831746;
	bh=sLL3Rk04mgf4fJSpP8L0B5HUGnIWGNmLFxz9gyU48tg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Jm7ONVrFXm90RmgYMNYqOQxFXK+iVgTyH2ydbIvPHFYjBI0WtvLmNjQNdwnAlRtk6
	 yuNLpqUtcgxIBMDZWIj595dApop2VZd0Ry5WnkDss1TWn48Xe82tJnBXdBlQHjOqki
	 s03LJr+6CS/XOpoQLEy6LSm3S4dDF40ayMzomUqhYhHqYMtYw91j951vSMo5WkYWkh
	 FU+KAUjzczFCj9CXWchFtxjb6PqJuT1PnBVQJciCITE5OPzJWTjZrmn5hMbwTXjhTU
	 hiNCOQs6s4/JRALCiYNu0ox0k6AoLPuZms6yNfzq42ItXcwBUYU7bZJ66ljqsrx7o3
	 DDqpk6FI2BWRw==
Date: Wed, 16 Apr 2025 14:29:05 -0500
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
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 07/13] arm64: dts: rp1: Add support for RaspberryPi's
 RP1 device
Message-ID: <20250416192905.GA78240@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99269f7762ec0124315e0e8977d9ca4f469f89ce.1742418429.git.andrea.porta@suse.com>
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

On Wed, Mar 19, 2025 at 10:52:28PM +0100, Andrea della Porta wrote:
> RaspberryPi RP1 is a multi function PCI endpoint device that
> exposes several subperipherals via PCI BAR.
> Add a dtb overlay that will be compiled into a binary blob
> and linked in the RP1 driver.
> This overlay offers just minimal support to represent the
> RP1 device itself, the sub-peripherals will be added by
> future patches.

Would be nice to have a blank line between paragraphs.

