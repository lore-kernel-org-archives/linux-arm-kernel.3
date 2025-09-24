Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D9BCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 19:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=DSLxLUm6aulbheu13ImKZULrWRBfovkW8nVM2gySq7M=; b=cMAIRnHWiXinBb
	XnihclVfWwyuOWHjWRBx9PQ8tf8+3vwGn6UglQmxf4rOd3WFvWDSb9J7MuLCkUXbowZdxf6iyYkeM
	Yety9JzPG1ql1iqy+GOCMltL+YglSUdxeX6tKK7l8XxbmsYBpPm/AsnQYq9uN5Yigfvma9684tswU
	ejEwjknPCX3bCdjCC9OZRrkKtC+j+RanpOf0+m/JgN1UR24JTJZqP3IKNS05axQf7V2b1iKIgqQJi
	Y8ebHIhKh5rL3M5vunS0bcGQaq8OBamxgrW4UIfBlbs4o3goHVpAGRQKzHtC1/rdu6PfXrI1YQaiD
	RtZWe9GR4CM6s0w2jPvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1VQE-00000003Atn-06HC;
	Wed, 24 Sep 2025 19:45:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1VQB-00000003Ari-0wr4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 19:45:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C1FBE43671;
	Wed, 24 Sep 2025 19:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF3FC4CEE7;
	Wed, 24 Sep 2025 19:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758743098;
	bh=s3G5vm8zNI9Bmh0+IwNormIltha1LWLe8EQ0HF8XNg8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=jsiLHm1g1QiReRZ2bgB0YtliwwFwoN+e+oaIAu3dl0OQEVC8EYSWKb72Z8DBkotNn
	 UlPsOGVNmhgdUetimifm62ggR3xW/r67CXD6SKlGGiPMKiPAxdIY7knttQ8dwlNEo4
	 68g3P4yowkvC4j9LB/HtxJA8ue+mVRgNiZXDgrMjvDCH3yh6whip9HGbGpVcKXHUxD
	 VCEGegoeAQ0lEPOdcYTF1Bt0WY5wfiUoaNp+X5qZRiiJddnRjfdBPaqBPzu1TkUHYV
	 CHD7spFuFvOP4q3tE69VKKO2EIZBqoG12gll6j738zvjaFsMMj3CTm1hgEHq30DYFC
	 RIoA8xMXyy2Bw==
Date: Wed, 24 Sep 2025 14:44:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 1/4] PCI: dwc: Remove the L1SS check before putting
 the link into L2
Message-ID: <20250924194457.GA2131297@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924072324.3046687-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_124459_288460_9BAD1B0D 
X-CRM114-Status: GOOD (  18.67  )
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

On Wed, Sep 24, 2025 at 03:23:21PM +0800, Richard Zhu wrote:
> The ASPM configuration shouldn't leak out here. Remove the L1SS check
> during L2 entry.

I'm all in favor of removing this code if possible, but we need to
explain why this is safe.  The L1SS check was added for some reason,
and we need to explain why that reason doesn't apply.

> Cc: stable@vger.kernel.org
> Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
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

