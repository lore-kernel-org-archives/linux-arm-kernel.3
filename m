Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F330C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 13:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzyTwl1p+cEGj5URTbjLB3SAhx1VbhpDtnJ4EC40KQg=; b=CCkdmjhJpPSUzsORdJFXpadsc3
	Gnbca85JHlTpajOfe372hU6ulriF2mf8eqa+YpGpYgY3RiOwOEVlbCFB+MOy2D/oMtmJ/qI3Lh2D2
	Ti+EwtixxydxL+OWpMLsppkw1CLlJxlaJIlfeG02Ba8coZJ0RNRFEaeG/MwWXuFW60mhMOicQ+MLN
	QsckuY6vVct+4KRtYHNe46hSYCm5JR+kFZgfZtYshkQ/wYccQlnBM3qmGCLt5X8F88yxypNoa+C6N
	1VxAzGxOviSRIsN3IyxUis1TZuLNHsG2bpnxi3SQ8k96LsE4FEcpdKMWmVKeUksY3+4RwSF4JuhzL
	9hmOSScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyUc-00000006J35-2hd9;
	Wed, 02 Apr 2025 13:50:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyRG-00000006ISp-0Bjp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 13:47:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C1EFA44535;
	Wed,  2 Apr 2025 13:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714F0C4CEDD;
	Wed,  2 Apr 2025 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743601648;
	bh=mqlsTKVrn+AgGvdUDfL4V1yyT+cMX8N7L5XXQmEr3Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g/o5JVCQG+s/zpSNBsc2udu6u3eF1njWqXvag/0VmwJLHFrNy9dtkIAELz8/OXM3t
	 8EoMZk22fAUMhMiwnmZ5UVKvOYFAoSKAbcLkHDf3PA2zQNlwQkQcRrJO+lETPEzTkp
	 ipGfjXqV1nLY/xqXrvpDZeJ1KEZrcG2P9Dkg6HDj+Ty7Jl+C1xjrqbVNUNl91JZrud
	 KpRC+Fi+0xUXFl2+wgyc2KJkPpdspeGYbUAeciYUZrE4GkyuooaZsDk8oSqzbEIycw
	 yhf/iY9lSk5iST5iWWdKaapkJ1XUp+dmSyosSxt693xE7kXNaycLxsxvr1g77h/THd
	 LY9628QXysVCw==
Date: Wed, 2 Apr 2025 08:47:25 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, christophe.kerello@foss.st.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/7] dt-bindings: memory-controllers: Add STM32 Octo
 Memory Manager controller
Message-ID: <20250402134725.GA145044-robh@kernel.org>
References: <20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com>
 <20250401-upstream_ospi_v6-v7-2-0ef28513ed81@foss.st.com>
 <20250401222015.GA4071342-robh@kernel.org>
 <71c301ea-0be7-4349-92d6-93b3ffc9c593@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71c301ea-0be7-4349-92d6-93b3ffc9c593@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_064730_383859_F78B6A43 
X-CRM114-Status: GOOD (  19.83  )
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

On Wed, Apr 02, 2025 at 10:45:08AM +0200, Krzysztof Kozlowski wrote:
> On 02/04/2025 00:20, Rob Herring wrote:
> >> +      clocks = <&rcc CK_BUS_OSPIIOM>,
> >> +               <&scmi_clk CK_SCMI_OSPI1>,
> >> +               <&scmi_clk CK_SCMI_OSPI2>;
> >> +      clock-names = "omm", "ospi1", "ospi2";
> >> +      resets = <&rcc OSPIIOM_R>,
> >> +               <&scmi_reset RST_SCMI_OSPI1>,
> >> +               <&scmi_reset RST_SCMI_OSPI2>;
> >> +      reset-names = "omm", "ospi1", "ospi2";
> >> +      access-controllers = <&rifsc 111>;
> >> +      power-domains = <&CLUSTER_PD>;
> >> +      #address-cells = <2>;
> >> +      #size-cells = <1>;
> >> +      st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
> >> +      st,omm-req2ack-ns = <0>;
> >> +      st,omm-mux = <0>;
> >> +      st,omm-cssel-ovr = <0>;
> >> +
> >> +      spi@0 {
> >> +        compatible = "st,stm32mp25-ospi";
> >> +        reg = <0 0 0x400>;
> >> +        memory-region = <&mm_ospi1>;
> >> +        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> >> +        dmas = <&hpdma 2 0x62 0x00003121 0x0>,
> >> +               <&hpdma 2 0x42 0x00003112 0x0>;
> >> +        dma-names = "tx", "rx";
> >> +        clocks = <&scmi_clk CK_SCMI_OSPI1>;
> >> +        resets = <&scmi_reset RST_SCMI_OSPI1>, <&scmi_reset RST_SCMI_OSPI1DLL>;
> > 
> > Looks like you are duplicating properties in the parent and child nodes. 
> > Maybe that accurately models the h/w, but if it is just so the drivers 
> > can get the resources from "the driver's node", you can always just look 
> > in the child nodes for the resources (as probably you want to drop the 
> > per instance resources from the parent).
> 
> 
> The current solution was actually my suggestion because if a parent
> device has to toggle child's reset, it means it actually is the consumer
> of that reset one way or another. IOW, it is one of its resources.
> 
> This also might matter for some of the implementations because we might
> need to setup device links or do some probe-ordering (in the future)
> between parent and the reset provider.
> 
> Without reset resource in the parent, I could imagine probe order:
> 1. parent (pokes into the child for reset)
> 2. reset and clock providers
> 3. child
> which would defer between 1 and 2.
> 
> With parent having the resource it would be re-ordered into:
> 1. reset and clock providers
> 2. parent
> 3. child

Okay, fair enough.

Rob

