Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED54CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Loo48Cqc0sttLWPXwus4d54m/xuBTKFODYQYcFHWVEc=; b=Wq54jbXu6BGcMP
	n55Px6SXUsrgKRMHx79o4M5td3KTthxGW65ujvwmhErExJ+gi9TMMyO27vE+J2oFHBjn3VbPICXLf
	xPC1evJVm/QHdRZrHgOFh0z37T27ZT7g1sjEVv101CYyHuvJ72MoeXm6SarxfzvOpdZ/3nzLoIzmj
	plwnKaTxRl8tGbXYKWq6iYQjAahJZ5wAp+gJHQchMpKxVpr4s2HWATzKUiXziFEhM790jHBW0ycQG
	v9aVL7SxB75kgAEomyiuIZ6WomGLD/c9W8Gf3eTH+rS94sPoj7oilynm02VfEiQMJ1QzJ8epsTfXT
	oan612Lw/TWB7YEZIlvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYp1-00000002EQb-2vpl;
	Tue, 02 Sep 2025 21:45:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utV7P-00000001GKn-1e78;
	Tue, 02 Sep 2025 17:48:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98A1060055;
	Tue,  2 Sep 2025 17:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B832C4CEED;
	Tue,  2 Sep 2025 17:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756835310;
	bh=Ml5xDwIj2ou2yj2DtWoHvojD3g+Fyp27UWcuuPsZx30=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VpgiDiHIzDRjLEPSlhTvW8AjxfDsKuQE4Ar7rjQicUnXODvJeZ41RJ+LppU5vwSuU
	 K8qGjkNpw1qFDxJnNzZvYBc70U9C71dbTP/DLqYceHZuNFvfB14g9spGiLkmmw8Jcf
	 DMznEoe3YYXsuGT5+WYNjofzk2zqkGeAFIKBjRPTJ7eMobvVP1j7z7eK8WfyN7n2hf
	 xiMaDMHewuZ16HSj/lXJUTU5Sj847GIDrNK3qHS/CjHacl2Ud6yTaeHcolYR0u/WwB
	 OhvnrJiaZOXBbr2QsG38HCoIrFKje9afPMVrqbes7OpiR+eFs4LFi3zHYO9IRYL1JN
	 IXvExVf8LLogA==
Date: Tue, 2 Sep 2025 12:48:28 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
	heiko@sntech.de, mani@kernel.org, yue.wang@amlogic.com,
	pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v5 1/2] PCI: Configure root port MPS during host probing
Message-ID: <20250902174828.GA1165373@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620155507.1022099-2-18255117159@163.com>
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

On Fri, Jun 20, 2025 at 11:55:06PM +0800, Hans Zhang wrote:
> Current PCIe initialization logic may leave root ports operating with
> non-optimal Maximum Payload Size (MPS) settings. While downstream device
> configuration is handled during bus enumeration, root port MPS values
> inherited from firmware or hardware defaults ...

Apparently Root Port MPS configuration is different from that for
downstream devices?

> might not utilize the full
> capabilities supported by the controller hardware. This can result in
> suboptimal data transfer efficiency across the PCIe hierarchy.
> 
> During host controller probing phase, when PCIe bus tuning is enabled,
> the implementation now configures root port MPS settings to their
> hardware-supported maximum values. Specifically, when configuring the MPS
> for a PCIe device, if the device is a root port and the bus tuning is not
> disabled (PCIE_BUS_TUNE_OFF), the MPS is set to 128 << dev->pcie_mpss to
> match the Root Port's maximum supported payload size. The Max Read Request
> Size (MRRS) is subsequently adjusted through existing companion logic to
> maintain compatibility with PCIe specifications.
> 
> Note that this initial setting of the root port MPS to the maximum might
> be reduced later during the enumeration of downstream devices if any of
> those devices do not support the maximum MPS of the root port.
> 
> Explicit initialization at host probing stage ensures consistent PCIe
> topology configuration before downstream devices perform their own MPS
> negotiations. This proactive approach addresses platform-specific
> requirements where controller drivers depend on properly initialized
> root port settings, while maintaining backward compatibility through
> PCIE_BUS_TUNE_OFF conditional checks. Hardware capabilities are fully
> utilized without altering existing device negotiation behaviors.

This last paragraph seems kind of like marketing without any real
content.  Is there something important in there?

Nits:
s/root port/Root Port/

Reword "implementation now configures" to be clear about whether "now"
refers to before this patch or after.

Update the MRRS "to maintain compatibility" part.  I'm dubious about
there being a spec compatibility issue with respect to MRRS.  Cite the
relevant section if there is an issue.

> Suggested-by: Niklas Cassel <cassel@kernel.org>
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/probe.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 4b8693ec9e4c..9f8803da914c 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2178,6 +2178,16 @@ static void pci_configure_mps(struct pci_dev *dev)
>  		return;
>  	}
>  
> +	/*
> +	 * Unless MPS strategy is PCIE_BUS_TUNE_OFF (don't touch MPS at all),
> +	 * start off by setting root ports' MPS to MPSS. Depending on the MPS
> +	 * strategy, and the MPSS of the devices below the root port, the MPS
> +	 * of the root port might get overridden later.
> +	 */
> +	if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT &&
> +	    pcie_bus_config != PCIE_BUS_TUNE_OFF)
> +		pcie_set_mps(dev, 128 << dev->pcie_mpss);
> +
>  	if (!bridge || !pci_is_pcie(bridge))
>  		return;
>  
> -- 
> 2.25.1
> 

