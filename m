Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F06CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=kuvfK/YCPQfw4+3RRMu5L6n+t6jezOLSK+LXGO8R10Y=; b=LURm1Fdhcd22M4
	71qRAuGJet3332QY6lHOYMeZzoaX9JzHS2lKDk3Fm0QBE2TIdo9Wk5HFgDDNoIMBgHAgT5Obg29EC
	Eu+s2R3G3E+j3WW8fcwfSqK/VESuf2Ajg9yPkYnFZ0egcMTRDPFRIXLkmU7s4bVd+cJX6vSE3Ot0S
	6FjO7Dd/PHxLo9oOyAx9zNR30zDmwu4Kl2i0bygzaIDows+OfpwsfdJMceVGBPPqyySOsBJ8EdsXa
	ILtjQMlVpxmSYTgrlcg+PK9I/bQo0u7HvjqCQjuYACvwO3ApuXOohHqSbRdtNWNGGP2JxgXSlQ/e+
	TTZC6A4qgioCXXxMf3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3iS-00000008ATk-36p1;
	Mon, 18 Aug 2025 17:32:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1qU-00000007vSz-3vDR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:32:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 505C460054;
	Mon, 18 Aug 2025 15:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DF8C4CEEB;
	Mon, 18 Aug 2025 15:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755531146;
	bh=dKQCX01Dgpw9dc/KO/HCmSw5Ji9XL1b1m8P0ZMz1jPQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=i4GwIKRvXxjZa4rtVFv3GPe+eKTHZRFSrtqyusSq+MuQuHgUtaQV4CG8/ZLcGjfqe
	 mbVBgHbeekUgLdChCoG7oxukfrmg/Qrpw+xXjBVXs2AkgoK9TShnzv35dbsP+DtOOz
	 g1/wDkxxdtijZLbTyqZKZkpfth4XrAuP5v1sGPQwgNVm/dmQkJ0yLAjOXZLAjlCLmy
	 J6o+FsD8UWqSTSRv3+4tZhDeDG80Vcmegt+cyDCx/w+q45AQxQdmUgZ1GLeFse1mwP
	 WKaWpyqCTQNh5ukob9V5r0XJrPzz8lAe7bNQFb7o+odmrt7qYLqqMI55cifKWuG1Zu
	 WfTl821z0bJiQ==
Date: Mon, 18 Aug 2025 10:32:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RESEND v3 5/5] PCI: dwc: Don't return error when wait for link
 up
Message-ID: <20250818153224.GA527775@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818073205.1412507-6-hongxing.zhu@nxp.com>
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

On Mon, Aug 18, 2025 at 03:32:05PM +0800, Richard Zhu wrote:
> When waiting for the PCIe link to come up, both link up and link down
> are valid results depending on the device state. Do not return an error,
> as the outcome has already been reported in dw_pcie_wait_for_link().

The reporting in dw_pcie_wait_for_link() is only a note in dmesg (and
the -EDTIMEDOUT return, which we're throwing away here).

We need an explanation here about why the caller of
dw_pcie_resume_noirq() doesn't need to know whether the link came up.
A short comment in the code would be useful as well.

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 868e7db4e3381..e90fd34925702 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1089,9 +1089,7 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
>  	if (ret)
>  		return ret;
>  
> -	ret = dw_pcie_wait_for_link(pci);
> -	if (ret)
> -		return ret;
> +	dw_pcie_wait_for_link(pci);
>  
>  	return ret;

This should be "return 0" because if "ret" was non-zero, we returned
that earlier.

>  }
> -- 
> 2.37.1
> 

