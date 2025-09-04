Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EF2CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3bQF2gp251DcQgalU4BELuM5R45YeVQZjcPHAOrjvE=; b=bdWS7XeCkbCUZ+gV2949JSgRpN
	3m27e5wdlgKmBQlZjrh1tqbyPKXPMP01dHSkkXwd1oEoNnHQf1lnRbFufvlMJaveZRmYcacV2Tv5V
	MPaeyW1wMrsQ4xLTkLAXGitYj2EdEcY9wTE9/DPrlPs0+BfVhjNq13hJRudku7UINd2XC/IVYyiZg
	hGkV/dLpyJnSsiXnaOE2PnBlD1DxKh/gUgD0bNBYNPLTcveWHNgc/rKHX7NQLmxgtibNy+ReYUwcD
	lL1kP1ob+6gxBLhpYyUZWCbF2tZYK5Vdumr21WjTnbikt1nIwydi326dh1b6IxxVVR9WJvtOiF4jg
	ift2OfHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6G-0000000G5CC-0KNg;
	Fri, 05 Sep 2025 02:22:52 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuIFS-0000000Enlc-2LmQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 22:16:11 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 00813C00151A;
	Thu,  4 Sep 2025 15:16:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 00813C00151A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757024165;
	bh=FfkRI+Thfq9FLWdeGquE+YXJSXWp3aWZQCznOMbITyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jj5agdIupuNpfglCUEa2dAc3pRYIR+M/3P1yNtjfospVkOl8dfiOPDXtFcjcZc0sl
	 eArjms3P9QmpLWWz9ORrwX30AtSoOAraPOsvB//vvB6dy32Khkc8G+s3384E8r85bd
	 e9z4/294XS+ibqTGk0Y2m9N0FdrJIZhZb1BgLxlg=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 58A7C18000530;
	Thu,  4 Sep 2025 15:15:34 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>,
	iivanov@suse.de,
	svarbanov@suse.de
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: broadcom: amend the comment about the role of BCM2712 board DTS
Date: Thu,  4 Sep 2025 15:15:33 -0700
Message-ID: <20250904221533.227156-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <47f6368a77d6bd846c02942d20c07dd48e0ae7df.1754914766.git.andrea.porta@suse.com>
References: <cover.1754914766.git.andrea.porta@suse.com> <47f6368a77d6bd846c02942d20c07dd48e0ae7df.1754914766.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_151606_695708_91CC7B16 
X-CRM114-Status: GOOD (  14.27  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 11 Aug 2025 16:12:35 +0200, Andrea della Porta <andrea.porta@suse.com> wrote:
> Current board DTS for Raspberry Pi5 states that bcm2712-rpi-5-b.dts
> should not be modified and all declarations should go in the overlay
> board DTS instead (bcm2712-rpi-5-b-ovl-rp1.dts).
> 
> There's a caveat though: there's currently no infrastructure to reliably
> reference nodes that have not been declared yet, as is the case when
> loading those nodes from a runtime overlay. For more details about
> these limitations see [1] and follow-ups.
> 
> Change the comment to make it clear which DTS file will host specific
> nodes, especially the RP1 related nodes which should be customized
> outside the overlay DTS.
> 
> Link
> [1] - https://lore.kernel.org/all/CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com/
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

