Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90391E77182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 22:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnBS+k7wu7H0Sx3ToGFJQ5o/kPHFFB85Eg+xljEGHgM=; b=TmuEShosGNSzA46NhRm0+FNy8M
	D/Sw3c3taPdBnqsYnexL8wrHgWUhtjNJIJyO6cOlGzP2LJ79uY92WivSiiq778GP1mdXYHycP5OEg
	J5nFKFJdj5oyTgLp40tH19dui01ImYM+INv5SsUGurDwwegJv6zqVKvJwu5STd7iNHg7sUgwqFrlw
	iN4eThP+16mBN2mcprppw7fXPenjOYBMnuOfkzTdBYLUTmUgfD2Zw7Sx3BKheCnwkyjZwLhI69yOk
	QTog8cKA+6Pbnhmr26+AUU/FlbNKxkT0mOUPT//QiTej5P+/6t2/pwOkKqZEN85SJpexBjonyt7zh
	Vr/hYPYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL99F-0000000D4ed-0lM5;
	Tue, 10 Dec 2024 22:56:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL97E-0000000D43e-0ZEJ;
	Tue, 10 Dec 2024 22:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08B1BA41AE0;
	Tue, 10 Dec 2024 22:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD594C4CEDE;
	Tue, 10 Dec 2024 22:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733871243;
	bh=xHboJ6Nj+jUBjuysVSh5kzHiNcpv6miOBLy03WABifE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6RNkTporGLhP919FrAvtVaRdlwD6OHKF9LVyCWvSPhS6/L86mghmTp3sWhxV6wNb
	 QlFBLBsCx5p3BCADTSSJlGiZoVGQUxg0BvJZURibCzW7PEsrxr547c8BfR2mdkLGk9
	 jxaD+B41ZsnY4nGwKXLpOJSOokz1SfQvjul3MYuG+BmUdjAfMYOfMCzqvxr7mfk3gD
	 RfUh0l8GKGMp71ka3TfjDrVw0L/2n83cPMNl5jULVNenO4kzoUP92Oqil4RgXC7Abq
	 10g9W6QDZj1WACB3tkQ++E5BONJ7jF+yNA9r5RaNIdkhA5tl3jpAH7Uvt55OeEaQRl
	 lMW6sHikMq9hg==
Date: Tue, 10 Dec 2024 16:54:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Krzysztof Wilczynski <kw@linux.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Derek Kiernan <derek.kiernan@amd.com>, linux-gpio@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Will Deacon <will@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v5 03/10] dt-bindings: pci: Add common schema for devices
 accessible through PCI BARs
Message-ID: <173387124038.751229.17185539657512592303.robh@kernel.org>
References: <cover.1733136811.git.andrea.porta@suse.com>
 <92fe1c6eb3ae1e7e7c151423568be2d13f19b55a.1733136811.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92fe1c6eb3ae1e7e7c151423568be2d13f19b55a.1733136811.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_145404_240918_27370E19 
X-CRM114-Status: GOOD (  11.75  )
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


On Mon, 02 Dec 2024 12:19:27 +0100, Andrea della Porta wrote:
> Common YAML schema for devices that exports internal peripherals through
> PCI BARs. The BARs are exposed as simple-buses through which the
> peripherals can be accessed.
> 
> This is not intended to be used as a standalone binding, but should be
> included by device specific bindings.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  .../devicetree/bindings/pci/pci-ep-bus.yaml   | 58 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


