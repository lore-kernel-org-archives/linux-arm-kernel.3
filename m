Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFC4CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=DnYkaV7Yi7urfSXkwUZ7oNo2CkgDGXu4HobllhNu8/E=; b=zrbbELk35k1Jx2
	2rrm2MG1RMirz+nAUGJtEg/p3HrzSPdBk3sN4T7EM11MgR8KErHX1M0U/QOTOXDygcFR73QtMf19v
	U4l3fRKxPT8yidTZ3ciPSN2EmactovsfGBI1/MGhZB5intllgdt2HvbvH39BxiTjTzF3uxuHObwiC
	D3I07aRjXpaFQCs1uiYT6Itdvy+QSM5j/U2lNJKUlwIR0xyWywgqCvJ1CBVWB6NEtsjnXcW3BhW71
	J4k1DbSFl5YrJWfgjjwgWXsx4MZ1OfVYROjGQY7MRbLMzw9ASCf3OXiRHizl13fE6AwKmAr2XMSS0
	tavISgpYZTzg/ewM7RNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3j1-00000008BKZ-1qBa;
	Mon, 18 Aug 2025 17:32:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo26B-00000007xAL-1L3T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:48:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52EDA5C5F5A;
	Mon, 18 Aug 2025 15:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA63DC4CEEB;
	Mon, 18 Aug 2025 15:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755532115;
	bh=SD+YffITOfZAo6Ivx+38x0kP3WuI7A8ZqDwATXhXXAk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rIyUtouvTqSQc8bVuEm61JYDwdCLFA+/97Yamt591o3sfsa8/GSMX85ag89CZO1FZ
	 v1D4Ow4jXJvA7pihd+zjhI07g2ZLM2FQPzV731bIuYu+9IN4WnYcKZAgb6ftVnoSkL
	 N9fiyUUXq32WzdvUDkgZ/NEZtlJGux/7XbfS11rWvZTna6AtjN9gYDmZpsKv51MOod
	 Z2YODUPQQ6yqbesk5Pnpi/mLaMI8IZvsSV8qOLXleFdbWlZgCtoMMDvag0sF3b1xot
	 gbiXzPWL93C5e+vRzRCRRD+1JV/a+47ZeCmhit58trvxI4B2Bn8Ek6TgR4INmDDDGU
	 snoJGHTF31DYg==
Date: Mon, 18 Aug 2025 10:48:33 -0500
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
Message-ID: <20250818154833.GA528281@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818073205.1412507-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_084839_400297_5052E538 
X-CRM114-Status: GOOD (  22.32  )
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
>  
>       /*
>        * If L1SS is supported, then do not put the link into L2 as some
         * devices such as NVMe expect low resume latency.
         */
         if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
                return 0;

You didn't change it in this patch (the L1SS test was added by
4774faf854f5 ("PCI: dwc: Implement generic suspend/resume
functionality")), but this L1SS check is an encapsulation problem.
The ASPM configuration shouldn't leak out here in such an ad hoc way.

*All* drivers, not just NVMe, would prefer low resume latency.

How do we deal with this in other host controller drivers?  If any
other driver puts links in L2, I suppose they would have the same
issue?  Maybe DWC is the only one that puts the link in L2?

What happens when we add a new driver that puts links in L2?  I guess
we'll be debugging some NVMe issue again?

Bjorn

