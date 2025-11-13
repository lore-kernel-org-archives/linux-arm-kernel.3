Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DD1CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 10:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBsaFtA2xBcklMBM2lcRD3QQiiT0+IpJhfUOqJ08udk=; b=MDyF8CnLXeGEPAkBmsx+FCAF13
	Ac4BKnaHf6OXBR5ZYCaXboR4fySAzm4vuc1mpuuEyolQIQ/PoZZXBu6lXXoRF6O32ztHBSXYQz2Or
	ecda6cFVpVYQIPsWrEHZ/O3JxKZRLUBwtQ6f2gqo2lFI2u6MRl8Joa/Y2rOYcSvqvcvlSXD1lcHuk
	U+DzrT3QuXShGBdaG7fyyY4sUZCfoI125B0dqf3PtzfzKSdneK3oRbdBFdBv1DGK1GvVM/eZ4XbhR
	uWcMMz5ZH5xpgOEpBUmRLbFyDx3hwUnSRZ/PtMvtZANpIb7DfTEb4xJ3Ntqq2qjSlfU/wMmH9/M4W
	UliSpEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUKW-0000000AFin-395Z;
	Thu, 13 Nov 2025 10:13:28 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUKT-0000000AFiO-3Avn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 10:13:27 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E525A140016D;
	Thu, 13 Nov 2025 05:13:23 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 13 Nov 2025 05:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763028803;
	 x=1763115203; bh=eBsaFtA2xBcklMBM2lcRD3QQiiT0+IpJhfUOqJ08udk=; b=
	dx4L72BG/Weyjy69zTnbObR32UfXg1Kw8iNWEtEAsc5ctiYB9KiV+Y5KHXKAAFyV
	znTtPr97A7XPqUq6kqTG0t4x99wH0CL0wo/+Io92jdFb+M9ltLQjRLpoPtFnMpab
	uIharEfdRj55SEfwSiacBpy1LhsYiikhOnXYysamSQrk6+RqhNZh/VfIEkVDpPoV
	Ggsu1ixpcpYPec3hKZJ+kqvRxsC81YJ1j7EyK61SKZ6djuLHixpcJ6NjlGzhqBwB
	ySqAiolMiio8+z/7Sw085mu9UwA88QaYT9qIpnhwIEHk+BTOPQgbvv4X0SUjvwlE
	HBmXzg//bKE7FUKziXnKIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763028803; x=
	1763115203; bh=eBsaFtA2xBcklMBM2lcRD3QQiiT0+IpJhfUOqJ08udk=; b=v
	RMchbv0sISLH4MACLD2Xur8OemJoKpH/lrUkmb2bd06oHzddVHR9Jh6Y7wTEf9SV
	UPl9b5NoPy8Ud9grx8HXjADs9RFvs45cR0/bBzgELXkdBdMwsN0chXusr646LhlM
	Z0jF7I4izj996Y5tUh4VJkhdqyQM1Tco/J8Fy/eWwZCkdT0ghxcnkhAzmQgr0Kcj
	iEQagtz9GgaB3r1kojoaWWUXGl1BiIhu08/vJTUKCMm9HlI7f4neW2N6YjORV3G0
	EssG57zQTapGcEaNqzv0uFAzGMc9U1MO652ZRYRBtn1zyLOTYaofyYjIe7RHe91+
	Uim604CkGUgpDyJ0j1JIw==
X-ME-Sender: <xms:Q68VaSHBnABlehvIB8HPLW1ZPP6tZIr4l4xh6kr1kC9kKKzEywDbgA>
    <xme:Q68VaeK0PJywiAn5sO0QtCbhWtpa4C6k-C1LKuTzyX5bfrjrBpD7MgOsquQjAGuPh
    7xBxjzgvlJBGWEjJYhsmwvos-8QjSPCa460qPCjU7sHm8CzpWV0UcM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdeiieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghhvghlghgrrg
    hssehgohhoghhlvgdrtghomhdprhgtphhtthhopehkihhshhhonheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepkhifihhltgiihihnshhkiheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhpihgvrhgrlhhishhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehm
    rghniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhn
    fhhrrgguvggrugdrohhrghdprhgtphhtthhopehunhhitghorhhnpgifrghnghesohhuth
    hlohhokhdrtghomhdprhgtphhtthhopehsqdhvrggurghprghllhhisehtihdrtghomh
X-ME-Proxy: <xmx:Q68VafAHyv8bK6Ia8xhwRSoZVJZ-23YfWweBZ8eMyvWbXODYpACFVg>
    <xmx:Q68VaatI5w3AsYwXW5HDHo4k-RdK6zja_vVWsVXJ8gWGFG6YFWdmGg>
    <xmx:Q68Vad8a0h3ovFMUiJiwnhwyAPdtiKYPFGlTB08M6a7RPOIDx1Rfdw>
    <xmx:Q68VaRQKTDzHimbKtlnbdrZjMFhicrKweFiiliNmy2Ndb_wdL1U8LQ>
    <xmx:Q68Vaevt84g7sRauZ_invuhu7qkg2Yo7dhzae9iFqMsr3pCTZAV471Hv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 02C82700054; Thu, 13 Nov 2025 05:13:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AO4N9SNPwumV
Date: Thu, 13 Nov 2025 11:13:01 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Siddharth Vadapalli" <s-vadapalli@ti.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 bhelgaas@google.com, "Chen Wang" <unicorn_wang@outlook.com>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>
Cc: stable@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srk@ti.com
Message-Id: <084b804f-2999-4f8d-8372-43cfbf0c0d28@app.fastmail.com>
In-Reply-To: <20251113092721.3757387-1-s-vadapalli@ti.com>
References: <20251113092721.3757387-1-s-vadapalli@ti.com>
Subject: Re: [PATCH] PCI: cadence: Kconfig: change PCIE_CADENCE configs from tristate
 to bool
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_021326_355800_158805F9 
X-CRM114-Status: GOOD (  17.21  )
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

On Thu, Nov 13, 2025, at 10:27, Siddharth Vadapalli wrote:
> The drivers associated with the PCIE_CADENCE, PCIE_CADENCE_HOST AND
> PCIE_CADENCE_EP configs are used by multiple vendor drivers and serve as a
> library of helpers. Since the vendor drivers could individually be built
> as built-in or as loadable modules, it is possible to select a build
> configuration wherein a vendor driver is built-in while the library is
> built as a loadable module. This will result in a build error as reported
> in the 'Closes' link below.
>
> Address the build error by changing the library configs to be 'bool'
> instead of 'tristate'.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: 
> https://lore.kernel.org/oe-kbuild-all/202511111705.MZ7ls8Hm-lkp@intel.com/
> Fixes: 1c72774df028 ("PCI: sg2042: Add Sophgo SG2042 PCIe driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

I really think there has to be a better solution here, this is not
an unusual problem.

> @@ -4,16 +4,16 @@ menu "Cadence-based PCIe controllers"
>  	depends on PCI
> 
>  config PCIE_CADENCE
> -	tristate
> +	bool
> 
>  config PCIE_CADENCE_HOST
> -	tristate
> +	bool
>  	depends on OF
>  	select IRQ_DOMAIN
>  	select PCIE_CADENCE
> 
>  config PCIE_CADENCE_EP
> -	tristate
> +	bool
>  	depends on OF
>  	depends on PCI_ENDPOINT
>  	select PCIE_CADENCE

I think the easiest way would be to leave PCIE_CADENCE as
a 'tristate' symbol but make the other two 'bool', and then
adjust the Makefile logic to use CONFIG_PCIE_CADENCE as
the thing that controls how the individual drivers are built.

That way, if any platform specific driver is built-in, both
the EP and HOST support are built-in or disabled but never
loadable modules. As long as all platform drivers are
loadable modules, so would be the base support.

     Arnd

