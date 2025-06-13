Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84BEC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=dVpvvucvYqfu63JD/OuOOltdFqYGu1+iCXebSLkmw0E=; b=Cmbzw2phY0XtQV
	8+ljL5dWLcvEnpvRXt+kGvFqzUt2zMTSpsog1upqIoa6ofgYddW2gUbQ8ClaEvAvhf39R/Tjnm9Mu
	yoGAcgGWKVo0wM8yShUlNpF/50lhCBtOfG6o0ijm1q7ro8RC68lJmKM2YJI0hSijVsN9aKc3OsgGT
	rCDBbLeaHjDuyMblOyJCv8kAxXzPP4RUmEaF5JaW0cMp3kPGCNtcbEwYxK9WRncBF7CWDR9pKVYFB
	naGWdc0QNaUPrywHI2EFbpvZIFQCdV1jnOlccXBZhWaA43PTq4NDJL/9ln21XjVwajkzyEa8MdtIG
	08famJ0HTWB69FZw6agw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8xc-0000000HGML-1oiY;
	Fri, 13 Jun 2025 18:17:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6kC-0000000GyDu-3jJb;
	Fri, 13 Jun 2025 15:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=dVpvvucvYqfu63JD/OuOOltdFqYGu1+iCXebSLkmw0E=; b=nEK79bFPrE4kBlNsSUJFomGUop
	0hKZBPjRAIgx/xXGXXJWb3PncadBm8irZoYz/gWWa4FQwJ9srNcqrLkuei72LGulbps+XtTITxgs5
	Iv4BrzF+bQx8N3jq4NEsly5nYCQg5V+EUoJqGExMjMeCbgRCFGvXkN0J0dW6Wl2un/y+angG+36Jw
	h6Y6wKGlcGi4EskWmW6JLfQtNTJIdn5JPrLF5QC7jVS8RmXiiXL+wGuZkiEKaqMqNjiDQ+pyNJWQh
	iC2nZICJRt12wkKPtBltc+VA1bpvn32MTtDTgGs70PvmwtlEUWnDQNvxksADh4uHLiZjVgfseBSAI
	SSCUnEOg==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6kA-000000032BF-3eEY;
	Fri, 13 Jun 2025 15:55:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 45683A5148E;
	Fri, 13 Jun 2025 15:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42EBC4CEED;
	Fri, 13 Jun 2025 15:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749830099;
	bh=txoIyDrG2vubdoOdTiTdmcJQb8y7qy5caM50Zd8G8to=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gFPoa516Ela1DPXpH0f6/CS5GkNUbZK3nAYpFk07eqEgd3MKAhYJpF0s0lR7On5mh
	 mTRs3hEkjNSmkoYXNNxat0V6bY1VSuL9RUaPNvJuo+3M4NxXHk18J9uIsBuF7BfZSP
	 LT2mpCyuW/nNNqy98L7h2qv/SXJaaEYTKmk9KlAx8hO5gtnc+f8HFC2H9FWk4DGBfW
	 6JdxNAw5ZVa4sVUYSYyFngUyMNeio0PIqep0t3E5XJuUwayNZIlc1Um9AsPD8fsgtD
	 LX9RVvGngHT5S7OMOIWzgnwkmg0oDRjT3tctQgL7cXq2tYr8yGsydjYdO2oCDGOE4x
	 7e6vKtWFkarMA==
Date: Fri, 13 Jun 2025 10:54:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	vkoul@kernel.org, kishon@kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, elbadrym@google.com, romlem@google.com,
	anhphan@google.com, wak@google.com, yuxiaozhang@google.com,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH 5/7] ARM: dts: aspeed-g6: Add PCIe RC node
Message-ID: <20250613155458.GA962010@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613033001.3153637-6-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_165503_131135_93E25D67 
X-CRM114-Status: UNSURE (   9.55  )
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

On Fri, Jun 13, 2025 at 11:29:59AM +0800, Jacky Chou wrote:
> The AST2600 has one PCIe RC, and add the relative configure regmap.

> +			pcie0: pcie@1e7700c0 {
> +				compatible = "aspeed,ast2600-pcie";
> +				device_type = "pci";
> +				reg = <0x1e7700c0 0x40>;
> +				linux,pci-domain = <0>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +				bus-range = <0x80 0xff>;
> +
> +				ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
> +					  0x02000000 0x0 0x70000000 0x70000000 0x0 0x10000000>;
> +
> +				status = "disabled";
> +
> +				resets = <&syscon ASPEED_RESET_H2X>,
> +					 <&syscon ASPEED_RESET_PCIE_RC_O>;
> +				reset-names = "h2x", "perst";

PERST# is clearly a per-Root Port item since it's a signal on the PCIe
connector.  Can you separate this and any other per-Root Port things
into a Root Port stanza to leave open the possibility of future
hardware that supports multiple Root Ports in the RC?

> +				clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_pcierc1_default>;
> +
> +				#interrupt-cells = <1>;
> +				msi-parent = <&pcie0>;
> +				msi-controller;
> +				msi_address = <0x1e77005c>;
> +
> +				aspeed,ahbc = <&ahbc>;
> +				aspeed,pciecfg = <&pcie_cfg>;
> +				aspeed,pciephy = <&pcie_phy1>;
> +
> +				interrupt-map-mask = <0 0 0 7>;
> +				interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> +						<0 0 0 2 &pcie_intc0 1>,
> +						<0 0 0 3 &pcie_intc0 2>,
> +						<0 0 0 4 &pcie_intc0 3>;
> +				pcie_intc0: interrupt-controller {
> +					interrupt-controller;
> +					#address-cells = <0>;
> +					#interrupt-cells = <1>;
> +				};
> +			};
> +
>  			gfx: display@1e6e6000 {
>  				compatible = "aspeed,ast2600-gfx", "syscon";
>  				reg = <0x1e6e6000 0x1000>;
> -- 
> 2.43.0
> 

