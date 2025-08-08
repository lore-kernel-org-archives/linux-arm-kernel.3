Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D1BC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 16:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=RzaCEXEAQxzsSaj124PHxu8J4VO/7uCXq1QhTrpUV0U=; b=CaUh/1lAYKiZVu
	93UJCAXK8ATT6/G/e66Sqke5YG3oDAvORirDIM3G7YSGyJhmjS4eeiruNl/E1flOFoplrzzw+Yt5q
	Ly+ZJK2RP9rO6hioLGaG+Jkidbadundgs8Rt4qFUwiUQnwN2NaRtOkYkPCVZQQB/hD8eS4pHaXx+z
	/o8tCrUVPKCVp2swl39JUmGXkYWFZdA5veGcM976YOkDeUn61axKjWLZDkkuNoo4iXm8RbI4ftvgy
	3I9OaR3xcoIfv+r6D+Z+C2WDrgZ/SXQx1/s+dbIjS2t+6asKd7iiPaQBoYyuVwR4HMG0BqC9+PiJp
	uvtvok0h0q+QSJFSX4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukQGH-00000003LCH-3Efe;
	Fri, 08 Aug 2025 16:48:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukQDi-00000003L3j-1gGo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 16:45:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BFE3741990;
	Fri,  8 Aug 2025 16:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B18C4CEED;
	Fri,  8 Aug 2025 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754671529;
	bh=//umrJE1AbcTB9AycRys08E8KmLxAmzbvhRupedv5Dc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SvHuX7FEsNr/3GDzQCcVIGtDMzLvyEzFXv2qcJIyKcwE3G78CSt/D7BpyK8W2wlnq
	 JcneXt1bupQaxlOiNKQqGSnYPJN3gHF2rsyY9huClbmsgeaaWtB6ztvE8lig3YSkom
	 typw/etKQmR4W3aFAdlT3O1MtBlp3Ep1wqgigkNBBW9L/SL+AkcJKVVpBD//k/2gSL
	 VjeTSEi189qln5PGC1fpGpcbTwSuFr32t8jznTpd45Yw4mTx9q/Wd/Cns+n+M12cC2
	 Se0DxDoj28CwAkOJDftgEKv/PP5dBs1tSEC+Fc0no1sAx+NaR6LTEctwBcOto5dXzv
	 ABu30wpzFBPDA==
Date: Fri, 8 Aug 2025 11:45:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	p.zabel@pengutronix.de, johan+linaro@kernel.org, cassel@kernel.org,
	shradha.t@samsung.com, thippeswamy.havalige@amd.com,
	quic_schintav@quicinc.com, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/9] PCI: stm32: Add PCIe host support for STM32MP25
Message-ID: <20250808164527.GA92564@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7cd764d-bc6d-4e39-aa03-0eee8e30d3e5@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_094530_458438_CCDF18BD 
X-CRM114-Status: GOOD (  19.86  )
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

On Fri, Aug 08, 2025 at 04:55:52PM +0200, Christian Bruel wrote:
> On 8/7/25 20:09, Bjorn Helgaas wrote:
> > [+to Linus for pinctrl usage question below]
> > 
> > On Tue, Jun 10, 2025 at 11:07:07AM +0200, Christian Bruel wrote:
> > > Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
> > > controller based on the DesignWare PCIe core.

> > > +	return pinctrl_pm_select_sleep_state(dev);
> > 
> > Isn't there some setup required before we can use
> > pinctrl_select_state(), pinctrl_pm_select_sleep_state(),
> > pinctrl_pm_select_default_state(), etc?
> > 
> > I expected something like devm_pinctrl_get() in the .probe() path, but
> > I don't see anything.  I don't know how pinctrl works, but I don't see
> > how dev->pins gets set up.
> 
> Linus knows better, but the dev->pins states are attached to the dev struct
> before probe by the pinctrl driver
> 
> /**
>  * pinctrl_bind_pins() - called by the device core before probe
>  * @dev: the device that is just about to probe
>  */
> int pinctrl_bind_pins(struct device *dev)

Thanks for the pointer.  Might be worthy of a mention in
Documentation/driver-api/pin-control.rst.  Maybe pinctrl/consumer.h
could even have a bread crumb to that effect since drivers use all
those interfaces that rely in the implicit initialization done before
their .probe().

pin-control.rst mentions pinctrl_get_select_default() being called
just before the driver probe, but that's now unused and it looks like
pinctrl_bind_pins() does something similar:

  really_probe
    pinctrl_bind_pins
      dev->pins = devm_kzalloc()
      devm_pinctrl_get
      pinctrl_lookup_state(PINCTRL_STATE_DEFAULT)
      pinctrl_lookup_state(PINCTRL_STATE_INIT)
      pinctrl_select_state(init)      # if present, else default
    call_driver_probe

Bjorn

