Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0570C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 20:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRnzVLZ2mALBOhto1MDSmmKU9u5xJvvkLsi8w3JW6n4=; b=05VOB1K/tnh0/l25x+xNstdHEV
	ObSL5ASugaMbTxO50Y01J3netN82LkIcDWDeEI1xZDA9UL6FrIZwCFgTRchzHMeD7ow1Te6iA8VVQ
	MwH7sQouilwQG0+BKarkjxLnneo15XPiKa15qh1v0vZSwTyiLYQYqKz+UBODIF3497nAzMZLSlIcf
	Y7xiECrHTyR+xuKpB/G2PWVv/Z5CSLeivYkd9IqSfCmhClq8YR4vMY8NXL4p/CzudhmLXu7eTsWGX
	vLImxqzobMV+fl3pA/LPC+chkHgsxEf7svMrgkZ/qHmpnCJ4wfmUWngvOoGqLvmPm2SiYoPs0d6vi
	WVg3TqVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2yr8-0000000BpTX-2uFx;
	Thu, 10 Apr 2025 20:50:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ypL-0000000Bp1m-21XF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 20:48:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60A944A47D;
	Thu, 10 Apr 2025 20:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BB1C4CEE7;
	Thu, 10 Apr 2025 20:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744318127;
	bh=eG+6Ol7t6Jj0rmtAVTf0NWu+4c3ZvYZT4LmvW2k3t+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1YIhwyEzq71tlj7GHnadKh+rEg9ITWeOv8zeoZNsiU0nGaIob+u0Q2Jo8BE+TjkB
	 prQ5Vdlv/gsCfYVrzjIZP8RQVzpASF8CQ/ONtjT2JY9yxLAfjvffjMj3TMhQNY2JzB
	 nICPWXrNe+4kUK5Me79C/rcdmdF84K2CI4jTs336XzThQ/Qp/iVINPo3Kaiq21jQRR
	 DlPRbD7Fh7mH0tzYrFss6IbV2hj32w3w4rX2qLIOz477Fbq02KuVpElNwX59tWQiPB
	 QPPAje5HiyT3iyTPJvD4IndiDkQluWy6djxG2sQHEhHIOZv4K4Rh+uaMrKmB/TTS6I
	 B74GPRvtmKlRw==
Date: Thu, 10 Apr 2025 15:48:45 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document
 optional aux clock
Message-ID: <20250410204845.GA1027003-robh@kernel.org>
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
 <20250406144822.21784-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250406144822.21784-2-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_134847_556256_4EE88E7B 
X-CRM114-Status: GOOD (  13.60  )
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

On Sun, Apr 06, 2025 at 04:45:21PM +0200, Marek Vasut wrote:
> Document 'aux' clock which are used to supply the PCIe bus. This
> is useful in case of a hardware setup, where the PCIe controller
> input clock and the PCIe bus clock are supplied from the same
> clock synthesiser, but from different differential clock outputs:
> 
>  ____________                    _____________
> | R-Car PCIe |                  | PCIe device |
> |            |                  |             |
> |    PCIe RX<|==================|>PCIe TX     |
> |    PCIe TX<|==================|>PCIe RX     |
> |            |                  |             |
> |   PCIe CLK<|======..  ..======|>PCIe CLK    |
> '------------'      ||  ||      '-------------'
>                     ||  ||
>  ____________       ||  ||
> |  9FGV0441  |      ||  ||
> |            |      ||  ||
> |   CLK DIF0<|======''  ||
> |   CLK DIF1<|==========''
> |   CLK DIF2<|
> |   CLK DIF3<|
> '------------'
> 
> The clock are named 'aux' because those are one of the clock listed in
> Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml which
> fit closest to the PCIe bus clock. According to that binding document,
> the 'aux' clock describe clock which supply the PMC domain, which is
> likely PCIe Mezzanine Card domain.

Pretty sure that PMC is "power management controller" given it talks 
about low power states.


> 
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> NOTE: Shall we patch Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
>       instead and add 'bus' clock outright ?

Based on the diagram, this has nothing to do with the specific 
controller. It should also probably a root port property, not host 
bridge.

Rob

