Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70487C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ai1iCuLtWHUDu1L+UQBqF+4g2Y2TKRc7LE849lL12l0=; b=PxJ6P7cXl/mHqSNKo7s8Snvopq
	2CRAWET150lWmX/oSBwaIdomFUxIVWBNcgRKhC8jfD78DIOx6CLeb63HHjRQoHBq+NBnYqWq4Vilj
	fsdSAJXzAZHcSFR8dJ2SwJFJZfDUr1cKavVDpHItjyWcz4Iu8hEhhhudqNH9g32RfkBf/dXzDQkwh
	aAEX7vZ7x7Cn9RRjeb9Z56IgYtScWsuNlIXU+WieglbHJZKF1KfAAh8WhtFxTL3Ffo2zSc++MQMh5
	FJv7qIzeuFs3tKaiN7Y5xytkzzN7ZOloGdjaCMKQe9+y6Ot7vfabzVZuCgCp5XxlYAozxhqaBYzHb
	t0xjKv7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmuR-0000000E8Xg-0yyi;
	Tue, 11 Aug 2026 13:52:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmuQ-0000000E8XS-1UPT;
	Tue, 11 Aug 2026 13:52:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C04F43C0B;
	Tue, 11 Aug 2026 13:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA0C1F00A3A;
	Tue, 11 Aug 2026 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456369;
	bh=ai1iCuLtWHUDu1L+UQBqF+4g2Y2TKRc7LE849lL12l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ph072EQm8rO1cUuzH41VQgwDhqJ45aKeUknJTFJ5Mr/89DYxfzTA6ZhWp21UOtJy+
	 QAHNLG2s+uPe0KjYBVeI6ro560IgrxaeX+xEArv98UdBgbtdEYZEHWOslsLn11kiRc
	 qmIMdXq2AcAfyxce45MKxKSQQnBJxIHycKpdfmrPMGQBiu9mzP/Sfh0oJnMZdJ+S/D
	 FymTMue1bZN6Wg7DO1qerXA7n382gZ3VzIKF4vKLj64GQgiVI81uyQM4zAN/h1386p
	 44bElrYGKImzBC6lgWp10g2YGx7+sj7V1VPkDLDRICqtA3RvpFM+R4oYSOpeI9XNWg
	 JF7LxLBcy0vfQ==
Date: Tue, 11 Aug 2026 08:52:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-rpi-kernel@lists.infradead.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jim Quinlan <jim2101024@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: PCI: Correct white-space style
Message-ID: <178645636779.2073597.16267787912876708944.robh@kernel.org>
References: <20260801195517.235161-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801195517.235161-2-krzysztof.kozlowski@oss.qualcomm.com>
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


On Sat, 01 Aug 2026 21:55:18 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/pci/brcm,stb-pcie.yaml       |  2 +-
>  .../bindings/pci/renesas,pci-rcar-gen2.yaml          |  2 +-
>  .../devicetree/bindings/pci/ti,am65-pci-ep.yaml      |  8 ++++----
>  .../devicetree/bindings/pci/ti,am65-pci-host.yaml    | 12 ++++++------
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


