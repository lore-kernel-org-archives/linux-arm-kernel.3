Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9007AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xjxo+arxaOZxBChABFfzBHpsuNkoe9hGWT15tHXeyLU=; b=0jTe5qyp9uXrP8
	mIE2Hh51vtYCzHceuv5ToCM8G1P0qNbyy/+m3KvNx/WHMm1AIqxPSvwQleWKumb8M0r1TVXIqmAov
	erdm3Azu28rnwQV9QsGcUpsNR/LP9kD02ZR1gfgHDrXBMc2aCCCrvgHocuex4/vcH74awYSzuie5K
	P6wXqvpMKlC6yVNOia03KGwAgvTE3fOvD8/pnX7s/4CtGgmESb1SZ2HL4+r/EZ2XkA7ciQ0R4Et+j
	IILVQEH26gD3JX1FdchJQDU6DLyWrJYTAKT2NtN6wYd8ZV182DqE9ztTPlXw/e/vNCm/xXWQvo3po
	+WqbO5UmCuEJ5m1OFm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYlV-00000007p6O-2rlQ;
	Tue, 17 Jun 2025 16:02:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXf8-00000007e3j-3fxo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:51:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 70F4D43850;
	Tue, 17 Jun 2025 14:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF6EC4CEE3;
	Tue, 17 Jun 2025 14:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750171906;
	bh=GJNDpDkdKnWwO964hGEn7dPszcj2MajR6OvVee6Hb1o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Z2+LJqlx6+TL/hZHm8WCskW3k2OV7kpcNCs02+3FZQFT09KQ8TJU3zto91XJ+DyEq
	 /z/1HcGzaeoptb5J2eo2eIBP1CkROT1/0SuZW74f55fEybTsVTIsF9Kr4NSDPf6oEz
	 oxyGbN6RUfnxd1apQerveF99Mt7FaIifoK7VnV0Ic803vdpspcb5VlalWI0JaXMCbo
	 mm8fU076psXpF1DAbIx94NXo8gSq0eWYe//4sEuGwCLi1Uid0UGjtXdR03tScpHa4j
	 s9I5TTvL2fLecj9y89qIvyrhifu9krBxJMMCDQyulGp2DcYqgLVTlycV4nlBKcCOof
	 7842kN3i4S7kw==
Date: Tue, 17 Jun 2025 09:51:44 -0500
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
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH stblinux/next 2/2] clk: rp1: Implement ramaining clock
 tree
Message-ID: <20250617145144.GA1135520@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b70b9f2d50e3155509c2672e6779c0840f38ad5e.1750165398.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_075146_933245_26E5A22E 
X-CRM114-Status: GOOD (  12.26  )
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

On Tue, Jun 17, 2025 at 03:10:27PM +0200, Andrea della Porta wrote:
> The RP1 clock generator driver currently defines only the fundamental
> clocks such as the front PLLs for system, audio and video subsystems
> and the ethernet clock.
> 
> Add the remaining clocks to the tree so as to be completed.

In subject, s/ramaining/remaining/

I guess we actually get some functional benefit here (something that
previously did not work, will start working after this patch)?  It
would be good to mention that here.  "Completing the tree" sounds
nice, but if I were being asked to merge this, I'd like to know what
benefit it brings.

Bjorn

