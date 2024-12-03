Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C91EE69EBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 22:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=BrF1dPj2fAU1Kxupla6S7a5fRTToE9Snz8dXpZTePdM=; b=DZgSDWcjxEEsTy
	rhmn/HPv3XSHwhnZ7AMqfZyvrC9nvVRGIBIJeJS1ma6d6YzP+bqi0AGnwLwgN8/bW0MfmHKh9qFTt
	gKFPApi0ThQvdu/Rn9Y2m9LJ2Gw/vHJerpkWKFMjBS82Hyo21xvyDna++UESk7jSEMIo9gzaPjoMB
	I++aRO45C0Nf+ChTophTDB7jiZE4n0SIh5sxwUarwe3l/i5GiPSYKasjPF3Z2YHW7+x+gCYx9HcG0
	2wSYHKeuhm4fH5wmwr3pS15o82aRFMM/E/9d3Ux+j/dHoft1RV9vu8mzWYrGJN1C5MiFxz41LDnur
	Ag9wqdsv/eXX5vHzx/ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbNU-0000000AvAc-1ZOa;
	Tue, 03 Dec 2024 22:28:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbKY-0000000AudC-0Kmn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 22:25:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CBE75A40C4F;
	Tue,  3 Dec 2024 22:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81806C4CEDC;
	Tue,  3 Dec 2024 22:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733264716;
	bh=Z15C0mt3XM7YpivR1T5/W0M5swvKfGcdZ7nyxNwhLoQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qhLj8p8eyWJXXP2R4fcik2XxZ1g4PpArVVeC4x2S0kXCH2O24HAt7vH4EuYcRZa9U
	 agS0BM2aYhGkfRoh8AXjL7O1WEuoUtSxGq8aIPSUqUqT7p5kfpOKmj6WTOkNfWb6ae
	 gesaNcOwa2CvKG0o081fcGYQyV1Aiw4aQQ57Md9Ffuda70Vw/Z/TP0AI/31q1JMnlr
	 R4TnoXjduLP3en1w119e6ZYjMoLmpmNHSCdjvW4PMO4Sika9XCgkDNvThTj90uvqnI
	 HFrNGoNAfsgTkVZtdnf4kK7COX0g/5hcp3ydpoWWf+O0KZ2vGTem5n36fzY7c/FExp
	 rrf6y623PwJTQ==
Date: Tue, 3 Dec 2024 16:25:15 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	p.zabel@pengutronix.de, cassel@kernel.org,
	quic_schintav@quicinc.com, fabrice.gasnier@foss.st.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: PCI: Add STM32MP25 PCIe root complex
 bindings
Message-ID: <20241203222515.GA2967814@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126155119.1574564-2-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_142518_187290_EFFBB798 
X-CRM114-Status: GOOD (  12.94  )
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

On Tue, Nov 26, 2024 at 04:51:15PM +0100, Christian Bruel wrote:
> Document the bindings for STM32MP25 PCIe Controller configured in
> root complex mode.
> 
> Supports 4 legacy interrupts and MSI interrupts from the ARM
> GICv2m controller.

s/legacy/INTx/

> STM32 PCIe may be in a power domain which is the case for the STM32MP25
> based boards.
> 
> Supports wake# from wake-gpios

s/wake#/WAKE#/

> +  wake-gpios:
> +    description: GPIO controlled connection to WAKE# input signal

I'm not a hardware guy, but this sounds like a GPIO that *reads*
WAKE#, not controls it.

> +    pcie@48400000 {
> +        compatible = "st,stm32mp25-pcie-rc";
> +        device_type = "pci";
> +        num-lanes = <1>;

num-lanes applies to a Root Port, not to a Root Complex.  I know most
bindings conflate Root Ports with the Root Complex, maybe because many
of these controllers only support a single Root Port?

But are we ever going to separate these out?  I assume someday
controllers will support multiple Root Ports and/or additional devices
on the root bus, like RCiEPs, RCECs, etc., and we'll need per-RP phys,
max-link-speed, num-lanes, reset-gpios, etc.

Seems like it would be to our benefit to split out the Root Ports when
we can, even if the current hardware only supports one, so we can
start untangling the code and data structures.

Bjorn

