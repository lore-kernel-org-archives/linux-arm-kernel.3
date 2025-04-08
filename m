Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3212CC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=FGNBxXoMYTu6R2OiEjtloPIeLQk3ONnnCAwoymG47rc=; b=ZnLsgYqaGHHynk
	9PSH1fPovdkzvXBM7KztsOdC/OEM+UOSYvwgrl+TPMUHgCbQZSExV6tE6BQNtYyIsdwAvQnMtHEBe
	mQaMXowYnhmBIWlHmPiUevYAJdXlne3AKCKlftRMs/oBTdZJvrt6Fhq5RuL15g9G4c4ZM10ahHHk3
	9Tgl64ZMN9ItTPrFtz+AfL3pYeGjZLN/D39Kmb7LCN8kxoNgRdPEiBo5IqQlNZw9NI12JO8OWXDBV
	lDKG8BzYzZBm6yTeCbCiWfx/cUiMDXCNeKtf7+IroUmsGIRuvYDJ7MrCGayQQd4HY0PDFqrpxSQcJ
	XDvTR4gv36pOd2nmiFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2ARG-00000004UUo-1CGf;
	Tue, 08 Apr 2025 15:00:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2APU-00000004U8V-2PAG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:58:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E63D143B4B;
	Tue,  8 Apr 2025 14:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514B8C4CEE7;
	Tue,  8 Apr 2025 14:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744124322;
	bh=5qALSFBZ7L1tAKOyN1L/oKlk3jA7LDA7goT+jZYqeQE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=K4GkieZEjPaQUxrBjrfFf+HbVXS8mw+BEAtGOYNOXTvf4VF8m3MCpnlZPMPOSRlfH
	 8vYR05N6YB7ZEJ5MQ87vjONWAfQkVD6jETSGWA2UFuQ/szVITaH3AIVNLrcoGCj003
	 87PFmhZtVwUET57ZIpb/XhgdSo4xkltqb1f9Zj3ylSM9NY6sqLG6A0EH2344ToQiuD
	 KEgwjURPS77QNjkzaQIq3IlTuPLSVd2U8mTP3DjYmhIOMPV9v8vLBzcvzI8rGj1Y6D
	 9mZLYg6pM+BxUWkElUqJrUaxNif2yaFj/pmr0rTbAPnFBQy4FK5AqLp/ut01PAtYPr
	 T3bEU0hrhAEGA==
Date: Tue, 8 Apr 2025 09:58:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: jingoohan1@gmail.com, frank.li@nxp.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] PCI: dwc: Add quirk to fix hang issue in L2 poll
 of suspend
Message-ID: <20250408145840.GA231894@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408065221.1941928-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_075844_653413_A142439C 
X-CRM114-Status: GOOD (  22.11  )
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

On Tue, Apr 08, 2025 at 02:52:18PM +0800, Richard Zhu wrote:
> i.MX6QP PCIe is hang in L2 poll during suspend when one endpoint device is
> connected, for example the Intel e1000e network card.
> 
> Refer to Figure5-1 Link Power Management State Flow Diagram of PCI
> Express Base Spec Rev6.0. L0 can be transferred to LDn directly.

Please include the section number.  Section numbers are easy to find
because they're in the spec PDF contents, but figures are not.  E.g.,
"PCIe r6.0, sec 5.2, fig 5-1"

> It's harmless to let dw_pcie_suspend_noirq() proceed suspend after the
> PME_Turn_Off is sent out, whatever the ltssm state is in L2 or L3 on
> some PME_Turn_Off handshake broken platforms.

Maybe we don't need to poll for these LTSSM states on *any* platform,
and we could just remove the poll and timeout completely?

If not, we need to explain why it is safe to skip the poll on some
platforms.  "Skipping the poll avoids a hang" is not a sufficient
explanation.

s/ltssm/LTSSM/

> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -947,7 +947,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
>  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>  	u32 val;
> -	int ret;
> +	int ret = 0;
>  
>  	/*
>  	 * If L1SS is supported, then do not put the link into L2 as some
> @@ -964,15 +964,17 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  			return ret;
>  	}
>  
> -	ret = read_poll_timeout(dw_pcie_get_ltssm, val,
> -				val == DW_PCIE_LTSSM_L2_IDLE ||
> -				val <= DW_PCIE_LTSSM_DETECT_WAIT,
> -				PCIE_PME_TO_L2_TIMEOUT_US/10,
> -				PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> -	if (ret) {
> -		/* Only log message when LTSSM isn't in DETECT or POLL */
> -		dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
> -		return ret;
> +	if (!dwc_check_quirk(pci, QUIRK_NOL2POLL_IN_PM)) {
> +		ret = read_poll_timeout(dw_pcie_get_ltssm, val,
> +					val == DW_PCIE_LTSSM_L2_IDLE ||
> +					val <= DW_PCIE_LTSSM_DETECT_WAIT,
> +					PCIE_PME_TO_L2_TIMEOUT_US/10,
> +					PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> +		if (ret) {
> +			/* Only log message when LTSSM isn't in DETECT or POLL */
> +			dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
> +			return ret;
> +		}
>  	}
>  
>  	/*
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 56aafdbcdaca..05fe654d7761 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -282,6 +282,9 @@
>  /* Default eDMA LLP memory size */
>  #define DMA_LLP_MEM_SIZE		PAGE_SIZE
>  
> +#define QUIRK_NOL2POLL_IN_PM		BIT(0)
> +#define dwc_check_quirk(pci, val)	(pci->quirk_flag & val)

Maybe just my personal preference, but I don't like things named
"check" because that just means "look at"; it doesn't give any hint
about how to interpret the result of looking at it.

>  struct dw_pcie;
>  struct dw_pcie_rp;
>  struct dw_pcie_ep;
> @@ -491,6 +494,7 @@ struct dw_pcie {
>  	const struct dw_pcie_ops *ops;
>  	u32			version;
>  	u32			type;
> +	u32			quirk_flag;
>  	unsigned long		caps;
>  	int			num_lanes;
>  	int			max_link_speed;
> -- 
> 2.37.1
> 

