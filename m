Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA05D1D48A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=BT8Ud6c5itL/5ERTjrIYXZvaHManap3P4er3xoSs8TM=; b=rJaZ6nnk0o4hFP
	RSz120r5JoL4THAJNlZk47L4kKvcnxueZ4wDB8xi0yZgJOagSwscUr17MPU8XNdtVV1tyJwAFBAgU
	yT1ZvyNQw3tIIGsmWYCqFbvZfIZZx4W8kywRjOn4gyYHlMvUMIY+CnXMVvLoJqgNjdJputVHg8k7r
	5zWpNMIvKv5gNZgUQeKVx7mNH7htkfwc8b1JG547A/A1cIIdcyqAGTqp7GzMkSkyDJmX9P6f7QVph
	yKELLbRDZBmDk0kGDPj+4EabYE/YdlozmXmJgT+PgB3NbSKctR4ZXubRVZD8hjOJX4XFl155Mn9ZL
	pqSqusH4T9gMWxkdxTsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxtU-00000000vTD-12ha;
	Thu, 08 Jan 2026 21:50:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxtQ-00000000vSg-3yrL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0114F60130;
	Thu,  8 Jan 2026 21:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C72C116C6;
	Thu,  8 Jan 2026 21:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767909007;
	bh=ujqWTzFk9nolBdZNDjtupYATI3vdeJZCz+XdzgKg28s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PUT2l1JCTusoAIgJ7ZrrASS1i+Aj7iPocBvdiYs3Gk/NMz7wzH31SJLr0//KsOHEm
	 z5KjxU7jHoCbmXMSc/jvBBDbUHjLWmaPAz4eKTYO19rmFBGjNXLHEFzJSWE3qKSoxR
	 IpQ+zl8laZ7+vF1vMcYWWdQiu1qeYgeytokrU6sam5BDnirzsqRK6Q4bX7Dx3BR9Xs
	 manamF5HmsOmVjeVljuWYUDvfX9p0EHWVIplpC/1E/2XRj7TfxNEAmw2PMz2pLwL3E
	 W1FKIX4cJc2F/aR6sRRvei/r/Xuhl6yjzi8OT52PQ6gnOgs1EBccvvcoE5Kdk9vXVN
	 QPSFgOMLtAMlA==
Date: Thu, 8 Jan 2026 15:50:06 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 08/11] PCI: dwc: Invoke post_init in
 dw_pcie_resume_noirq()
Message-ID: <20260108215006.GA500164@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015030428.2980427-9-hongxing.zhu@nxp.com>
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

On Wed, Oct 15, 2025 at 11:04:25AM +0800, Richard Zhu wrote:
> If the ops has post_init callback, invoke it in dw_pcie_resume_noirq().

I'm trying to write the merge commit log for this branch, and I don't
quite understand this.

The effect is to apply the GEN3_ZRXDC_NONCOMPL workaround for the
ERR051586 erratum, and Mani added the hint that this enables REFCLK
during resume.  But it seems weird that we apply a REFCLK workaround
after the link is already up.

During probe, .post_init() is run after pci_host_probe(), so we apply
the workaround after enumerating all the devices, which means REFCLK
must already be valid and the link is already up.

Is "enabling REFCLK" actually what imx_pcie_host_post_init() does?

Could the workaround be done in imx_pcie_host_init() before the link
is brought up?  If it could, it looks like we wouldn't need
imx_pcie_host_post_init() at all.

For now, I put this in the merge commit log:

  - Apply i.MX95 ERR051586 erratum workaround for REFCLK issue during
    resume (Richard Zhu)

> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 20c9333bcb1c4..2b59e7d2e6179 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1199,6 +1199,9 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
>  	if (ret)
>  		return ret;
>  
> +	if (pci->pp.ops->post_init)
> +		pci->pp.ops->post_init(&pci->pp);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_resume_noirq);
> -- 
> 2.37.1
> 

