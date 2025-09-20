Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D73BCAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 05:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9i0zcjJlz9fl2aPBhjmovpnOBBZA+60TJfzeyaZDOyc=; b=VKh1uXj5ZfPFSWp8RzEUFyWZJv
	c/+KXyUNQE2oHD6Pkf5Reff7gw9E4WHBBH+zyzqns5Zp4S86Zfht/RKBdSugJ9jHBi6hq0JyeBke0
	lIPQGTbHp6aFt353ShQCbgUgmeLrsyBAD1h4t4ZjjwZLTFo6hXibAVRCfllEKelkpLinF+xFvS8Df
	BrSnmrLDTCxog2nHIzMiEiyGLgKaB7LixS3CC3CKPWtoeU5Nxyqa0tzML2+VMM5huse9dN2+QNP//
	JXJifq5ujPKTl2WWJFr9IeneFKcCKcp3L/MBg5DWrdwd66r0mtfYu69zFNs47isD/Y0MDRfySqL3m
	I5xaLyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqcC-00000004qe9-2gJT;
	Sat, 20 Sep 2025 05:58:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqcA-00000004qdk-15Kp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 05:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85EE644096;
	Sat, 20 Sep 2025 05:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779D2C4CEEB;
	Sat, 20 Sep 2025 05:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758347909;
	bh=LgoGjH1XdA48//RXYVqBWOJOuvKHUowW2mhgoXCVrHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCqcihvz61B5+wy2FpVXUwtjvMzvln8X6FRMQOD/j9FdLd378Qf5zX49TiZ2SUL9s
	 JJ/7kr5F5pVk6Up+CIq+oznzJJC7ne7xgUjGGncNYuRzpae0a/jouzrxEY29SifkR8
	 ynFtNFqPLGBRTQHhtTUMWTs1Obkx0YYxdmPB2nW8UC5TjzLS8uBtl6l+0J9QCl+mGy
	 XwoxvUmgVkiaq0poYdOyebqmfVpdSImmejR7DuQE3roADaEt805Y/I9gRwxrsBNSAV
	 lWbdqGtJiTralJxpLuFRA7Tum6vZjGOm7faz8C8axm6XvxV01rJ0RWZMTcrEhB1NYk
	 M2IcNU+vx+c4w==
Date: Sat, 20 Sep 2025 11:28:20 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] PCI: dwc: Remove the L1SS check before putting
 the link into L2
Message-ID: <b44numhx2wnelicynz36b3wdqrkudchn6l2s2jjmg6iecjk6ae@uo535zip3vq3>
References: <20250902080151.3748965-1-hongxing.zhu@nxp.com>
 <20250902080151.3748965-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902080151.3748965-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_225830_320714_BECF80EE 
X-CRM114-Status: GOOD (  17.82  )
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

On Tue, Sep 02, 2025 at 04:01:46PM +0800, Richard Zhu wrote:
> Since this L1SS check is just an encapsulation problem, and the ASPM
> shouldn't leak out here. Remove the L1SS check during L2 entry.
> 

Sorry, I couldnt' decipher this statement. Could you please elaborate?

- Mani

> Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 952f8594b501..9d46d1f0334b 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1005,17 +1005,9 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>  
>  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
> -	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>  	u32 val;
>  	int ret;
>  
> -	/*
> -	 * If L1SS is supported, then do not put the link into L2 as some
> -	 * devices such as NVMe expect low resume latency.
> -	 */
> -	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
> -		return 0;
> -
>  	if (pci->pp.ops->pme_turn_off) {
>  		pci->pp.ops->pme_turn_off(&pci->pp);
>  	} else {
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

