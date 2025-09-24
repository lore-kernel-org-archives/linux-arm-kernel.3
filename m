Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9405CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 20:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=jM6zgU1lCSMljAQh35sE4RZFjQgx2HJB2iPImrH5iSA=; b=xnLFMubpfv82Ay
	KXFsi7wAK/Jni8E2mREUKxJjiQvRKB1Q+sFtUsmQZ6nqO5pjW/n/RYMM6yhTPkyLvPopXKjtNfakb
	EgbE4302mO1/1ScOP9kPBuVb4o4rie2Wh8nm2+zyu0F+hwDk8MCmuW6pHiNP30DcFQw+8G58+otA5
	HVoL16rZhc0d4wbZ1G171ov+4XovhFAui9XinoeLnRYoqvf4dXAXSTjnreo2ivBe6pVbcG64eoVEj
	4H+Qex1LkNydAJHJwApPAOHBQp9PafUK9btaII7ATSahGz2ye+1/sT3veedXav3mbXVxHO5pPtCKv
	iasm1IENTGRoBBIHTcfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Veh-00000003HFB-34pj;
	Wed, 24 Sep 2025 19:59:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Vef-00000003HDl-1be2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 19:59:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 064C243308;
	Wed, 24 Sep 2025 19:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E9FC4CEE7;
	Wed, 24 Sep 2025 19:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758743996;
	bh=73wTCutzdqB7e3bMkutV3dF3j841Mh5OPxmNu0G40w4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=IU8Blo7g52ooQwvBxy9BqSMyKa1yhskXxlBQZWapZs9L4jgfF+jYxe8s4zDSSkv8p
	 rvAPMNRzeor6O33mrqQteJy1N3XUCe6+wsRvf23JNzDW5KHZNPxC4KywGBleuC6pc/
	 19KnPI1p3LU1bc/+AxF8pEJTRnh3sd17QL0XxlkHutS7UjWYQ9J/a6rr9lx1qdPkTN
	 84t5puB/CDJYsv+80qGLHgO1jBHRtEVewq2NLuRlcVBbXqXDi8H47KzePEpOeKEbV1
	 WDdr5/uKYVlj+Utdt0GXLNOGRoiTZiOyMWBgeKvjhFxuwRoi6doarYX5Xj7DTA9pgv
	 B4uA1cPkg/xCQ==
Date: Wed, 24 Sep 2025 14:59:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 3/4] PCI: dwc: Skip PME_Turn_Off message if there is
 no endpoint connected
Message-ID: <20250924195955.GA2132329@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924072324.3046687-4-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_125957_453387_CB8C0E07 
X-CRM114-Status: GOOD (  18.86  )
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

On Wed, Sep 24, 2025 at 03:23:23PM +0800, Richard Zhu wrote:
> A chip freeze is observed on i.MX7D when PCIe RC kicks off the PM_PME
> message and no any devices are connected on the port.

s/no any/no/

> To workaroud such kind of issue, skip PME_Turn_Off message if there is
> no endpoint connected.

s/workaroud/work around/

> Cc: stable@vger.kernel.org
> Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
> Fixes: a528d1a72597 ("PCI: imx6: Use DWC common suspend resume method")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 57a1ba08c427..b303a74b0fd7 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1008,12 +1008,15 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	u32 val;
>  	int ret;
>  
> -	if (pci->pp.ops->pme_turn_off) {
> -		pci->pp.ops->pme_turn_off(&pci->pp);
> -	} else {
> -		ret = dw_pcie_pme_turn_off(pci);
> -		if (ret)
> -			return ret;
> +	/* Skip PME_Turn_Off message if there is no endpoint connected */
> +	if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_WAIT) {

This looks racy and it sounds like this is a workaround for an i.MX7D
defect.  Should it be some kind of quirk just for i.MX7D?

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
> 

