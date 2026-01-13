Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE24AD2F338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zw/Mcjd1dCXa9Ipfmt1SPG7oKV90eX3qucYQSRlH9Vw=; b=F8dimfL2y4jTJZaRCUG78HaZ6r
	DpFMIZj3TQgUCqCFLz2eD1EVL57CJ6zlPCMT+8XPkRLz2EyrjFACxwxA/uPkvD+LHXpmiJbc1UktX
	NXc2lR3hQ950kORXcTuFBulCBmoC8YwNr0k+SXoMiXFlspqGoNIPjMKs7eP/ZZx9e76kgBUEljyiX
	dqVCavPChsgdXON54sTIDFd/kymD8uLBkqA/83kT/6dEvF3ZyEokdZcqC3XY/Hz4GfDEXeXezZWvp
	F8G0TUYo3AA2Lft4eucrfvoLazLzOrVUouvb4t8vGFnOGhIDTWyqwsQbPy/9V58OBWYIH0HngdDdW
	TEWqC3sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgLT-00000007NeO-3Q4O;
	Tue, 13 Jan 2026 15:30:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgLS-00000007Ndd-28Gk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23F2F60018;
	Tue, 13 Jan 2026 15:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B2EC19421;
	Tue, 13 Jan 2026 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768318207;
	bh=WgEe/MDg5GDJ9RD4sxJBGuALxPFpoPlF76iKnLPpSHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyd3AN3/NLo4E6aWTbjnhX4eVBd4vmYpuMLT4fBGFXaysXWKxqie0AZh0zVhvbJXK
	 08CzliUSNfo2vc9GA8vFE+8y2fj6HFrL+O8aT24S5dE8OSwN+nI1K44UvY//GPL6KP
	 dJh6FWvF+mr839ZCDzRlY+jKfiwX3MDCkG7Hm9U7VGPzwqbljuEAEstAmh+0eQM4iZ
	 bvZCPz2x9UpbNb02IZXmeYjGB7DRGQs5xoE3V1mOYSAtiR1N1/KUyZErtbE2ji8RNN
	 ZMnk/Ro6rBt37GFE8c7kTmORdog5LZXyxKQuMFz+CbKjL61amvu5lQixKlLWp39QkK
	 gHeBTi7H42QMw==
Date: Tue, 13 Jan 2026 20:59:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v8 2/2] PCI: dwc: Don't return error when wait for link
 up in dw_pcie_resume_noirq()
Message-ID: <7akwvdfve5jcj2tm7jiwowkvcctsmqeslia4pulvtdgcgicp4p@h5ztwyp4h7ft>
References: <20260107024553.3307205-1-hongxing.zhu@nxp.com>
 <20260107024553.3307205-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107024553.3307205-3-hongxing.zhu@nxp.com>
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

On Wed, Jan 07, 2026 at 10:45:53AM +0800, Richard Zhu wrote:
> When waiting for the PCIe link to come up, both link up and link down
> are valid results depending on the device state.
> 
> Since the link may come up later and to get rid of the following
> mis-reported PM errors. Do not return an -ETIMEDOUT error, as the
> outcome has already been reported in dw_pcie_wait_for_link().
> 
> PM error logs introduced by the -ETIMEDOUT error return.
> imx6q-pcie 33800000.pcie: Phy link never came up
> imx6q-pcie 33800000.pcie: PM: dpm_run_callback(): genpd_resume_noirq returns -110
> imx6q-pcie 33800000.pcie: PM: failed to resume noirq: error -110
> 
> Cc: stable@vger.kernel.org
> Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 06cbfd9e1f1e..025e11ebd571 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1245,10 +1245,9 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
>  	if (ret)
>  		return ret;
>  
> -	ret = dw_pcie_wait_for_link(pci);
> -	if (ret)
> -		return ret;
> +	/* Ignore errors, the link may come up later */
> +	dw_pcie_wait_for_link(pci);

It is not safe to ignore failures during resume. Because, if a device gets
removed during suspend, the link up error will be unnoticed. I've proposed a
different logic in this series, which should address your issue:
https://lore.kernel.org/linux-pci/20260107-pci-dwc-suspend-rework-v4-0-9b5f3c72df0a@oss.qualcomm.com/

Please test it out.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

