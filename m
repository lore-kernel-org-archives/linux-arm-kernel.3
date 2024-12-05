Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969B2E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=1e46pdpnT9CSYQe5DJOMaM6Dwd+CNl1ccsQf/yiUpls=; b=GWHx0M4TW2C3NA
	QoGDeYI2KR5eu/X3FPy+oMNsXFG14iI6Ec8/uhW4hCKQjYgs5IRhj7RYADkOnw3XTdXaNKIVRABFT
	FEXxVIyu49XXPCZed8N6MriMmQRK0mDYLp+2zEAdgH7XIGbsmXiRGHIIvNBjr3Ix52m4+S5MFG1ow
	gxIIz9WLP2ZQR/DzjFLLVbZsN+FweLAqIQURqKKpnlQpcVd5APVj8fopjBxb4s1iTBDEauNKT8cAy
	KLfaTXHgSmncYw7VFP04Gd7fFQ/wbpqoKzyMhctaw0XcGwB/g14mjhpkBG9zzrTDYg6N/3yI4lXIN
	rTiKkPJm1thvjiY8LrcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFf6-0000000GxI5-19Wp;
	Thu, 05 Dec 2024 17:29:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFWa-0000000GvQh-37Vf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:20:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A37D5C67D6;
	Thu,  5 Dec 2024 17:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FD3C4CED1;
	Thu,  5 Dec 2024 17:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733419223;
	bh=J4RkZ5QcEl8BbbxZ0oiUNZ6PyUOhfVv0KK0hpYX0QHI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rftU0Zqtc9rZbHZ3b72ZLSyJ+U1EXcTYa5W6E7+3oB48oYixbQ6rPv41EdATIKyPA
	 eceinoMbrJOg2T+pWNemssUo+s2q2FALIGGfuMiyZNOHhkdFw42D/2FcopxvVKJXC4
	 8lL5dr+LSh7aWZZMYTtFB1nvFOS2f0GurLvUb8wNkB3SgOa9p9Oon25AEz+X5Ne/6/
	 xM5wD4MOqGx00Q37pa0Htl/wWXrID9mZszE8JWqVlDzqZi6uG1Iq2vjVQkZ+o9AQgp
	 rjypv9377pYhtbLIceudyFqTvMInGom0gyAtzceg/vyPdXLTTEgFh7GD03QzOZK6yd
	 e0wjh2DmCu4BQ==
Date: Thu, 5 Dec 2024 11:20:22 -0600
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
Message-ID: <20241205172022.GA3053765@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <569904ad-2b70-4a58-98fe-4f24e1089e17@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_092024_867953_DC15D9FB 
X-CRM114-Status: GOOD (  22.85  )
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

[cc->to: Rob for RC/RP separation conversation]

On Thu, Dec 05, 2024 at 02:41:26PM +0100, Christian Bruel wrote:
> On 12/3/24 23:25, Bjorn Helgaas wrote:
> > On Tue, Nov 26, 2024 at 04:51:15PM +0100, Christian Bruel wrote:
> > > Document the bindings for STM32MP25 PCIe Controller configured in
> > > root complex mode.
> > > 
> > > Supports 4 legacy interrupts and MSI interrupts from the ARM
> > > GICv2m controller.

> > > +  wake-gpios:
> > > +    description: GPIO controlled connection to WAKE# input signal
> > 
> > I'm not a hardware guy, but this sounds like a GPIO that *reads*
> > WAKE#, not controls it.
> 
> Rephrasing as
> "GPIO used as WAKE# input signal" (output for the endpoint bindings)

Perfect, that makes a lot of sense.

> > > +    pcie@48400000 {
> > > +        compatible = "st,stm32mp25-pcie-rc";
> > > +        device_type = "pci";
> > > +        num-lanes = <1>;
> > 
> > num-lanes applies to a Root Port, not to a Root Complex.  I know most
> > bindings conflate Root Ports with the Root Complex, maybe because many
> > of these controllers only support a single Root Port?
> > 
> > But are we ever going to separate these out?  I assume someday
> > controllers will support multiple Root Ports and/or additional devices
> > on the root bus, like RCiEPs, RCECs, etc., and we'll need per-RP phys,
> > max-link-speed, num-lanes, reset-gpios, etc.
> > 
> > Seems like it would be to our benefit to split out the Root Ports when
> > we can, even if the current hardware only supports one, so we can
> > start untangling the code and data structures.
> 
> OK. and we support only 1 lane anyway, so drop it.

Makes sense.  What about phys, resets, etc?  I'm pretty sure a PHY
would be a per-Root Port thing, and some resets and wakeup signals
also.

For new drivers, I think we should start adding Root Port stanzas to
specifically associate those things with the Root Port, e.g.,
something like this?

  pcie@48400000 {
    compatible = "st,stm32mp25-pcie-rc";

    pcie@0,0 {
      reg = <0x0000 0 0 0 0>;
      phys = <&combophy PHY_TYPE_PCIE>;
      phy-names = "pcie-phy";
    };
  };

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml?id=v6.12#n111
is one binding that does this, others include apple,pcie.yaml,
brcm,stb-pcie.yaml, hisilicon,kirin-pcie.yaml.

Bjorn

