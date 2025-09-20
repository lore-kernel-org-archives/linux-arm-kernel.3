Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245E8CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 06:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDXSgIdtMTk8X9Y3hH2ufXG9xvwt9Ha1wwvrel86eWs=; b=krDlvaHd5y4ni3NjyHZpKtY66V
	cTxxcg8N+u8uj0XrG+1A4XaIk09SWp0Y2nk2j54QAqMNPvzwUOe/T8fS9hylK8hKdZDMGC39VPAvI
	t59zzkEOMFd5p7gfhgy4W5Esjl2sbL+asERdyTkzp4eUvPqhAgrTwmdyjYIaVRsY/1KUSZ8CwM2LH
	bHLcn3299JRDgkHv+o8gusThPmZ4+rZgGB8Os/75Awl0H4VkP1Faz+ECwmqt39ulvVGGQX4/VSCqj
	FEjaohwFqal3SWZMt8abicqlNfXW5KZRaTqqoQCz8CkNfu58zYBiEP6L09XQhUhQcRMR8YCZIMpp7
	4xKwt0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzrBf-00000004tXG-3pqG;
	Sat, 20 Sep 2025 06:35:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzrBe-00000004tX5-1wr7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 06:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 135D86013C;
	Sat, 20 Sep 2025 06:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6057C4CEEB;
	Sat, 20 Sep 2025 06:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758350108;
	bh=kwd//CRsPpYonPR8lPo9/P6DkUgi8kn1wjpddW4+60c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D9OgdNF6cJgOC++kArIJCVA7PmzZXs1OTytQ8fwdI7sisUC5uYFZgmlOrHYhcjT7Q
	 RTUU8jggbblvCQYof8Gw06UanMTuh6SpluvLbDbp8Gxon5Gib1EGSPyPtSOEU+hZyu
	 Ajcj9oZlLNr8JW7Un/TlPsoJgA0r/4xQKHi51MRW/ZaPIvyYEZNPAbzMTfdNV/3qHG
	 qJwrdcgDidlWaFisbEGu0lJYROt++27+6BTHhC/O5EZRjcJPjTwBUYGA7j2spILZKn
	 eLIyAr3OZE28hx7N9imBKG+j93NbJUP4i0jUF1ZtfvmdLyKev1g4YDKQonlhdaWpRT
	 EZ/T7KKNY454A==
Date: Sat, 20 Sep 2025 12:04:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/6] PCI: dwc: Don't return error when wait for link
 up in dw_pcie_resume_noirq()
Message-ID: <lbmeboonxcvviqfc72ozrtnzqsblnv7qdt2owyxs7tcjkc6vmt@e7oe6jtssj36>
References: <20250902080151.3748965-1-hongxing.zhu@nxp.com>
 <20250902080151.3748965-7-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902080151.3748965-7-hongxing.zhu@nxp.com>
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

On Tue, Sep 02, 2025 at 04:01:51PM +0800, Richard Zhu wrote:
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
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Again, Fixes tag is needed. Also CC stable list since this should be backported.

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index b303a74b0fd7..c4386be38a07 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1084,10 +1084,9 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
>  	if (ret)
>  		return ret;
>  
> -	ret = dw_pcie_wait_for_link(pci);
> -	if (ret)
> -		return ret;
> +	/* Ignore errors, the link may come up later */
> +	dw_pcie_wait_for_link(pci);
>  
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_resume_noirq);
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

