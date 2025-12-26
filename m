Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C591E8FDAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 17:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=pn3jWKOAN9LJ4OZOX/YxyUbn+m0ZyCIe22i+ZU1xmHw=; b=EaFdiXt8gXy+kA
	pkrFPB0GODHB2rbVJ/z1Z0J/g9pd5uahzbRkMDB/esuvyMdA0l4FL1zD/TVhQUZ7/rbz3nmYmTksy
	ILhfTrkH+GN9S6Zdbe08tRCoTI79hpEnnOapDKjZpfIJdEWjP4X/a4wklJGbwnywUGZ9dU8A3og6E
	HNCOzD4HAz4BpN8O+Vlgyt7sQsRI15/oyGcxgqZ05geqWLsSdJ4hzy3PraZ/PwiWeW8cIHWHmGgG9
	zgVO84wBHsyftX6Dhr9FC34ioGK5r+kQYhe6pwxZs3QP7KMRfPMKiGruJGtFUGJii2jOb+9kPc1mh
	MpgJ1F13PVWAZQRLis8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZBTK-00000001KNy-0Bpw;
	Fri, 26 Dec 2025 17:19:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZBTH-00000001KND-3NsQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 17:19:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 134024081E;
	Fri, 26 Dec 2025 17:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1B7C4CEF7;
	Fri, 26 Dec 2025 17:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766769560;
	bh=R7Xe8Vo0sAqcTqxB+ijnQow2uxhO0kGbyfHDUMMcV7M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=eGR7GzLhAOzoM/tW2iHh7BICj3wp6aJVpL1auZt5PIo8y14Aah7cHx+VU6wDZU2Pl
	 TqZDTKbjHnLHXrNmSUqSmQ9z2vMhqD4F53kR3cFbQYJ4AaBJd1teUunFB+qyc/zsC5
	 DQaODq0Sm/zgpvSXU1MHAiRUHU3yMN8QCDi3V+NhHH53qkgpED1HNKxaTjq0k+ptIT
	 +YMNKdP6N4ivct58Q9+hdFhmE0ahD1SQ6DtZmuAlJXzhrBt2VASeyBK66+TO7+IORA
	 gwKTuW2+pQabXKk8+V9FVCSJZ5vf0owUAy+qbrGzGwj7seTL91q5wQBN72TH6Fp6jH
	 CgOIgWdlrJeqg==
Date: Fri, 26 Dec 2025 11:19:19 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: vigneshr@ti.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, bhelgaas@google.com,
	arnd@arndb.de, kishon@kernel.org, stable@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH] PCI: j721e: Add config guards for Cadence Host and
 Endpoint library APIs
Message-ID: <20251226171919.GA4131469@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117113246.1460644-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_091923_946460_922A8E0F 
X-CRM114-Status: GOOD (  28.62  )
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

On Mon, Nov 17, 2025 at 05:02:06PM +0530, Siddharth Vadapalli wrote:
> Commit under Fixes enabled loadable module support for the driver under
> the assumption that it shall be the sole user of the Cadence Host and
> Endpoint library APIs. This assumption guarantees that we won't end up
> in a case where the driver is built-in and the library support is built
> as a loadable module.
> 
> With the introduction of [1], this assumption is no longer valid. The
> SG2042 driver could be built as a loadable module, implying that the
> Cadence Host library is also selected as a loadable module. However, the
> pci-j721e.c driver could be built-in as indicated by CONFIG_PCI_J721E=y
> due to which the Cadence Endpoint library is built-in. Despite the
> library drivers being built as specified by their respective consumers,
> since the 'pci-j721e.c' driver has references to the Cadence Host
> library APIs as well, we run into a build error as reported at [0].
> 
> Fix this by adding config guards as a temporary workaround. The proper
> fix is to split the 'pci-j721e.c' driver into independent Host and
> Endpoint drivers as aligned at [2].

If we know what the proper fix is, why aren't we just doing that
instead of adding a temporary workaround?

> Fixes: a2790bf81f0f ("PCI: j721e: Add support to build as a loadable module")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511111705.MZ7ls8Hm-lkp@intel.com/
> Cc: <stable@vger.kernel.org>
> [0]: https://lore.kernel.org/r/202511111705.MZ7ls8Hm-lkp@intel.com/
> [1]: commit 1c72774df028 ("PCI: sg2042: Add Sophgo SG2042 PCIe driver")
> [2]: https://lore.kernel.org/r/37f6f8ce-12b2-44ee-a94c-f21b29c98821@app.fastmail.com/
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  drivers/pci/controller/cadence/pci-j721e.c | 43 +++++++++++++---------
>  1 file changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index 5bc5ab20aa6d..67c5e02afccf 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -628,10 +628,12 @@ static int j721e_pcie_probe(struct platform_device *pdev)
>  			gpiod_set_value_cansleep(gpiod, 1);
>  		}
>  
> -		ret = cdns_pcie_host_setup(rc);
> -		if (ret < 0) {
> -			clk_disable_unprepare(pcie->refclk);
> -			goto err_pcie_setup;
> +		if (IS_ENABLED(CONFIG_PCI_J721E_HOST)) {
> +			ret = cdns_pcie_host_setup(rc);
> +			if (ret < 0) {
> +				clk_disable_unprepare(pcie->refclk);
> +				goto err_pcie_setup;
> +			}
>  		}
>  
>  		break;
> @@ -642,9 +644,11 @@ static int j721e_pcie_probe(struct platform_device *pdev)
>  			goto err_get_sync;
>  		}
>  
> -		ret = cdns_pcie_ep_setup(ep);
> -		if (ret < 0)
> -			goto err_pcie_setup;
> +		if (IS_ENABLED(CONFIG_PCI_J721E_EP)) {
> +			ret = cdns_pcie_ep_setup(ep);
> +			if (ret < 0)
> +				goto err_pcie_setup;
> +		}
>  
>  		break;
>  	}
> @@ -669,10 +673,11 @@ static void j721e_pcie_remove(struct platform_device *pdev)
>  	struct cdns_pcie_ep *ep;
>  	struct cdns_pcie_rc *rc;
>  
> -	if (pcie->mode == PCI_MODE_RC) {
> +	if (IS_ENABLED(CONFIG_PCI_J721E_HOST) &&
> +	    pcie->mode == PCI_MODE_RC) {
>  		rc = container_of(cdns_pcie, struct cdns_pcie_rc, pcie);
>  		cdns_pcie_host_disable(rc);
> -	} else {
> +	} else if (IS_ENABLED(CONFIG_PCI_J721E_EP)) {
>  		ep = container_of(cdns_pcie, struct cdns_pcie_ep, pcie);
>  		cdns_pcie_ep_disable(ep);
>  	}
> @@ -739,10 +744,12 @@ static int j721e_pcie_resume_noirq(struct device *dev)
>  			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
>  		}
>  
> -		ret = cdns_pcie_host_link_setup(rc);
> -		if (ret < 0) {
> -			clk_disable_unprepare(pcie->refclk);
> -			return ret;
> +		if (IS_ENABLED(CONFIG_PCI_J721E_HOST)) {
> +			ret = cdns_pcie_host_link_setup(rc);
> +			if (ret < 0) {
> +				clk_disable_unprepare(pcie->refclk);
> +				return ret;
> +			}
>  		}
>  
>  		/*
> @@ -752,10 +759,12 @@ static int j721e_pcie_resume_noirq(struct device *dev)
>  		for (enum cdns_pcie_rp_bar bar = RP_BAR0; bar <= RP_NO_BAR; bar++)
>  			rc->avail_ib_bar[bar] = true;
>  
> -		ret = cdns_pcie_host_init(rc);
> -		if (ret) {
> -			clk_disable_unprepare(pcie->refclk);
> -			return ret;
> +		if (IS_ENABLED(CONFIG_PCI_J721E_HOST)) {
> +			ret = cdns_pcie_host_init(rc);
> +			if (ret) {
> +				clk_disable_unprepare(pcie->refclk);
> +				return ret;
> +			}
>  		}
>  	}
>  
> -- 
> 2.51.1
> 

