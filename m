Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F219D68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 17:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=yfUzXmB04ofTgBEHXl7/APs3CylNZDZ/sY3E7jcM7xc=; b=kGRAEHMk0eVQYv
	Fp+JIeoI9NFBqlnUxesIy3tn2oSmry6HSZRMlNlSzHO/34EenqspPZtqHOlaFdQy5vnUwCD+kVUT+
	Up/NW5Op83IYuxeU4NKgOiNG9OGE9Rsp63m9R+yfT8KX17SvrS5274bg2Err2Y7T1gseEINGDVF4x
	V2cKRTAbj5GJSrJ2HnjN6oYuUgpbOCU0c7oPHK/NYJY+7qkZLcF/5KVTUcDkyi2rV8vkzyerkoEkj
	cWNSI6vzWC1AzTzHbALNrj4ckhBNN1dhs6SLnTdEXtGVIRAAItjoVvMnglGoK/AnvDQdnA3Q7IJw5
	6ndl9QxKrQVW858aQUAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC05c-00000003Y3V-407L;
	Fri, 15 Nov 2024 17:26:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC04g-00000003XsN-2czA;
	Fri, 15 Nov 2024 17:25:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7FE7EA42BAB;
	Fri, 15 Nov 2024 17:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7167C4CECF;
	Fri, 15 Nov 2024 17:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731691537;
	bh=B5HD6FNYjbwvelKHX9O/ZdMyYIKdSlEvRVWHBFf74j8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=WcXaPIm6WdUXfZSjMdG+JVztfyMit+f2yPV6YeN1NZzQXkpO0wmt1PgI3au1RF50R
	 LHUBGZ0Cvt86wCrxygPt98TmAcFHPzMWjkT3D1CDHcOtALCHGLjhUqBMq2esM83LRq
	 dC66w/GliM5szwN6wE+X7c/6i3JYnQuI/lnIZY+ygQMmilIqVDGWBQ0s7jdMYZPnhZ
	 LGzZEKSxuQVpXUUyDg6A0Nff5ZAb+Z2yKW0E2cNDRAc4xifpGzAGBPW56dlr5j/X/S
	 hRyM4fl66Rjw6Ohf2wPWaNZLQ3guLNCoFS6Dfkw4CK7FEwjGTwli+8n9i49ABjNtR7
	 cN9Lq0wdTNFLw==
Date: Fri, 15 Nov 2024 11:25:34 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, stable@vger.kernel.org
Subject: Re: [PATCH] PCI: of_property: Assign PCI instead of CPU bus address
 to dynamic PCI nodes
Message-ID: <20241115172534.GA2044163@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108094256.28933-1-andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_092538_791404_9117D457 
X-CRM114-Status: GOOD (  18.64  )
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

On Fri, Nov 08, 2024 at 10:42:56AM +0100, Andrea della Porta wrote:
> When populating "ranges" property for a PCI bridge or endpoint,
> of_pci_prop_ranges() incorrectly use the CPU bus address of the resource.
> In such PCI nodes, the window should instead be in PCI address space. Call
> pci_bus_address() on the resource in order to obtain the PCI bus
> address.
> 
> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Herve Codina <herve.codina@bootlin.com>

I picked this up on pci/of for v6.13, thanks!  Rob, let me know if
you'd prefer to take it or ack/review it.

> ---
> This patch, originally preparatory for a bigger patchset (see [1]), has
> been splitted in a standalone one for better management and because it
> contains a bugfix which is probably of interest to stable branch.
> 
>  drivers/pci/of_property.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
> index 5a0b98e69795..886c236e5de6 100644
> --- a/drivers/pci/of_property.c
> +++ b/drivers/pci/of_property.c
> @@ -126,7 +126,7 @@ static int of_pci_prop_ranges(struct pci_dev *pdev, struct of_changeset *ocs,
>  		if (of_pci_get_addr_flags(&res[j], &flags))
>  			continue;
>  
> -		val64 = res[j].start;
> +		val64 = pci_bus_address(pdev, &res[j] - pdev->resource);
>  		of_pci_set_address(pdev, rp[i].parent_addr, val64, 0, flags,
>  				   false);
>  		if (pci_is_bridge(pdev)) {
> -- 
> 2.35.3
> 

