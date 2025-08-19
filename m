Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6F6CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 21:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=iw3RlRQJXZlRBZ4emdsRqj4JFJnjpuspckc44kU8lI8=; b=2IZZ8OqEgL0oY3
	DGPMOGOUd74EyjeYpTFZdDEHczcWkXUg31ie46IPNk/Jcp2jiiguXKY423UKMAeEzG3+1DXYbw27U
	GNxNhqwEWAsVhPbcuYKGb59Gt6HADMT/a+NUPCIsvUISrT4IkidfodBSx01ADMKiU+J2Hy18x/SC1
	cgwucelwLvLnau36EVgNZPFNPDw7rZFV/u+cxV1EdMVjvmgDUvoBnsSZWR6ejUzPXkHFlWTlQQmgp
	HzChRJd/QWZPPAHfYBvM+qD14PcFZh1CTJt357oIN9b/D8NeZHifKg3OHYqOXuY7Cg10j4YBfhN6o
	DOTQKo67mKjQgoZa6yrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUGo-0000000Bfg9-2Pr5;
	Tue, 19 Aug 2025 21:53:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRg4-0000000BN4k-2wto
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 19:07:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0C2C613EF;
	Tue, 19 Aug 2025 19:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1622AC4CEF1;
	Tue, 19 Aug 2025 19:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755630441;
	bh=EhPwi7uM8bEX6mz/D+2QkJ4QnZQxgt8yu80Tgm2qqx8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=U4QrDKEmu+cy0+u+n9LbZ/mdyRzNpo/0x7oc1EXA6v0Jl1rmMOMgZ0dREPMp63n73
	 qoT2zeChi7GzvWa8XuqJ8uMpKi7FEECSuyv3XQWjICn9xVCYl50OpNAOPPPgtx2VkD
	 UALIyZWElFbpx7PBzJswhu0yRQc5GsWbJNoxhcFKnxq3UqocWPK/+rKgY1QtjKkrmp
	 gVl1/UixsC7wf5gRZGViFIjpSoKkmCSQr/3Qy9K+3d+4YIoUOcy6pkuiPZmuUJoqvP
	 ePgUZ9uZbRzaNIq2IMtLjjiR/4J04V4jaydHaasX3QQNswoS0M/x2+tGpcIgNMVsAR
	 XSQL7Q0fl/uqA==
Date: Tue, 19 Aug 2025 14:07:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RESEND v3 4/5] PCI: dwc: Skip PME_Turn_Off message if there is
 no endpoint connected
Message-ID: <20250819190719.GA553003@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818073205.1412507-5-hongxing.zhu@nxp.com>
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

On Mon, Aug 18, 2025 at 03:32:04PM +0800, Richard Zhu wrote:
> Skip PME_Turn_Off message if there is no endpoint connected.

What's the value of doing this?  Is this to make something faster?  If
so, what and by how much?

Or does it fix something that's currently broken?

Seems like the discussion at
https://lore.kernel.org/linux-pci/20241107084455.3623576-1-hongxing.zhu@nxp.com/t/#u
might be relevant.

This commit log only restates what the code does.  In my opinion we
need actual justification for making this change.

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 20a7f827babbf..868e7db4e3381 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1016,12 +1016,15 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>  		return 0;
>  
> -	if (pci->pp.ops->pme_turn_off) {
> -		pci->pp.ops->pme_turn_off(&pci->pp);
> -	} else {
> -		ret = dw_pcie_pme_turn_off(pci);
> -		if (ret)
> -			return ret;
> +	/* Skip PME_Turn_Off message if there is no endpoint connected */
> +	if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_WAIT) {
> +		if (pci->pp.ops->pme_turn_off) {
> +			pci->pp.ops->pme_turn_off(&pci->pp);
> +		} else {
> +			ret = dw_pcie_pme_turn_off(pci);
> +			if (ret)
> +				return ret;
> +		}
>  	}
>
>  	if (dwc_quirk(pci, QUIRK_NOL2POLL_IN_PM)) {
> -- 
> 2.37.1
> 

