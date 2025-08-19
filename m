Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F74ECA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 22:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=nxOh5XxKUnu8jGcd1ACzcR/mEwet5btd4yImPg4prHs=; b=eMtauxSnj26TzT
	HANKOr5SZ4whT4ZOWb7RDW/H00xyb9bs/AMdRevVhoYB1kZ/TaeFu0grQp1nwKOH3LL+bDMD2Thn+
	5MG1tXBo2hKCkXuJFompra4T/UW0MqXOWCc5zA3pmiqfFxPB3yXwICSDHIgEvB0bSLp77PiScxSGI
	YTmW8hexVfFKIJGRsc+8boOA8HOENeNnZfftEGrryvk2o5GfnzRgCnouVTQMlIE8YCdPPMAGE/UPy
	33YbbNfrAqCkavJMb88Fr5TSR0xHFotC6TTGrzjX8M4G/TcSthYSLo+NUVqw5rD8+o7tN6jMjh1Cz
	3vCtZEI0KRn9FMRGgXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV1j-0000000BkZ4-310d;
	Tue, 19 Aug 2025 22:41:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoS0m-0000000BQk2-0X3n
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 Aug 2025 19:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=nxOh5XxKUnu8jGcd1ACzcR/mEwet5btd4yImPg4prHs=; b=i0Gy1PJtLOCjAYFPxHx78s6Z3z
	Tf+Uh/Fu+VSEfthaf0SeJ8VFy0ocVIFYtYDqDBJLxnEM3b4VNNly5h9O9w2tAtXXCK3YTf0+mWiTr
	qAAxzAOyaRxIzGWyzi5i9UnFlyh/CLINrgmJMtbC+Sm1xCS+TYcAdHi2PcTnFdR/a4uA1xOqZqiLn
	Wa0ljyo8GmfgdEHajL+81fFN52fWj8Pm9eB2eL33fLKrEjLbhcqX5hqTaO5xUl0cOcPzHg9u5RhW+
	qqaLnd7a0DM+U3FresrvkDbJr4myF+rP+U17YX3KeZYFG412zpJ9464+chZqXKTZFClYSroySHeIx
	0Cu0PFOg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoS0i-000000005gV-2QEL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 19:28:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 767B95C65E8;
	Tue, 19 Aug 2025 19:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99BAC113D0;
	Tue, 19 Aug 2025 19:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755631720;
	bh=qIY9X5+FcNSBcRXsswBUCWwRon9tdY925kQ+7aOF53E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=d09VmNxnHQsrp01pzJ2k0NQXUM52ufcrA/bx2D1gwV3NlFYWtTmOpBnbdUAnzYgBV
	 uGreB32dj6zGdGdlm8cfZ95goFqQsSPsfRqdcEVFCS3oGFlNX4yZFNPgW55pDwVkz9
	 x8wBl2sKFXPIbZBcgczoY+tlH+V5UP10pw03Qb/l/jk6QZzU5tpkkVr1VLhD58s+Xg
	 /1mji4MytITb/G54D7eladJ3VaBQJYxpjqlfhRqsdEgaqUUbsyeyUC0rhWQDpzXZqK
	 5CAcY5Tq0G1uSpAcmiwoToBpde3z6A6fGyjqqMWdhKL+hixW+/TQtuMJqq+KBDr0hy
	 INwIYTu8XkN0g==
Date: Tue, 19 Aug 2025 14:28:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RESEND v3 1/5] PCI: dwc: Don't poll L2 if QUIRK_NOL2POLL_IN_PM
 is existing in suspend
Message-ID: <20250819192838.GA526045@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818073205.1412507-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_202845_163950_0B754978 
X-CRM114-Status: GOOD (  32.51  )
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

On Mon, Aug 18, 2025 at 03:32:01PM +0800, Richard Zhu wrote:
> Refer to PCIe r6.0, sec 5.2, fig 5-1 Link Power Management State Flow
> Diagram. Both L0 and L2/L3 Ready can be transferred to LDn directly.
> 
> It's harmless to let dw_pcie_suspend_noirq() proceed suspend after the
> PME_Turn_Off is sent out, whatever the LTSSM state is in L2 or L3 after
> a recommended 10ms max wait refer to PCIe r6.0, sec 5.3.3.2.1 PME
> Synchronization.
> 
> The LTSSM states are inaccessible on i.MX6QP and i.MX7D after the
> PME_Turn_Off is sent out.
> 
> To support this case, don't poll L2 state and apply a simple delay of
> PCIE_PME_TO_L2_TIMEOUT_US(10ms) if the QUIRK_NOL2POLL_IN_PM flag is set
> in suspend.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../pci/controller/dwc/pcie-designware-host.c | 31 +++++++++++++------
>  drivers/pci/controller/dwc/pcie-designware.h  |  4 +++
>  2 files changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 952f8594b5012..20a7f827babbf 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1007,7 +1007,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
>  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>  	u32 val;
> -	int ret;
> +	int ret = 0;

I think it's pointless to initialize "ret" because in every case where
ret is set, we return it immediately if it is non-zero.  We should
just return 0 explicitly at the end of the function and skip this
initialization.

>       /*
>        * If L1SS is supported, then do not put the link into L2 as some
> @@ -1024,15 +1024,26 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
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
> +	if (dwc_quirk(pci, QUIRK_NOL2POLL_IN_PM)) {
> +		/*
> +		 * Refer to PCIe r6.0, sec 5.2, fig 5-1 Link Power Management
> +		 * State Flow Diagram. Both L0 and L2/L3 Ready can be
> +		 * transferred to LDn directly. On the LTSSM states poll broken
> +		 * platforms, add a max 10ms delay refer to PCIe r6.0,
> +		 * sec 5.3.3.2.1 PME Synchronization.

IIUC, the read_poll_timeout() below is waiting for the PME_TO_Ack
responses to the PME_Turn_Off message.

The Link state transition to L2/L3 Ready (or the subsequent L2, L3, or
LDn states) is the indication that the downstream components have
"performed any necessary local conditioning in preparation for power
removal" and then responded with PME_TO_Ack.

And the PCIE_PME_TO_L2_TIMEOUT_US timeout is the deadlock avoidance
delay for cases where "one or more devices do not respond with a
PME_TO_Ack".

In the QUIRK_NOL2POLL_IN_PM case, I think the problem is that we can't
*read* the LTSSM state to learn whether the Link transitioned to L2/L3
Ready, L2, L3, or LDn.  That wouldn't be surprising because per sec
5.2, "the LTSSM is typically powered by main power (not Vaux), so
LTSSM will not be powered in either the L2 or the L3 state."

I don't know what's different about i.MX6QP and i.MX7D.  Maybe on most
DWC platforms the LTSSM *is* powered in L2/L3/LDn, but on i.MX6QP and
i.MX7D, it *isn't* powered in those states?

If that's the case, we should say that somewhere here.  And we should
say what happens when we try to read the LTSSM when it's not powered.
Does the read hang or cause some kind of error?

> +		 */
> +		mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> +	} else {
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
> index 00f52d472dcdd..4e5bf6cb6ce80 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -295,6 +295,9 @@
>  /* Default eDMA LLP memory size */
>  #define DMA_LLP_MEM_SIZE		PAGE_SIZE
>  
> +#define QUIRK_NOL2POLL_IN_PM		BIT(0)
> +#define dwc_quirk(pci, val)		(pci->quirk_flag & val)
> +
>  struct dw_pcie;
>  struct dw_pcie_rp;
>  struct dw_pcie_ep;
> @@ -504,6 +507,7 @@ struct dw_pcie {
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

