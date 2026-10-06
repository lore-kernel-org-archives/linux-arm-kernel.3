Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C62CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 12:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgWbEUgSz0YKuspgKjuMWLzlYWgwmePe2UooMv1UNow=; b=4x/Flz5bq5In9xmIE+mvlGnGAT
	Qlh4z5uFFPSKzE1Z0wXZx9Wt6+BtTA3J287ArjvsGlN+tMZbgc9a4Hi4ZriWhfvRqNdumV5TZf9vD
	dWerQ6ZFQM+b+HIBMw1mNb9F/w6cyuGrf4Q2MQiNlB1Jehmt0hrU/Pg7pNwqFX/6j12XBh+3IPV6n
	shZ0jUBFY1DoaaKtZQ2JxXlFQwcjzYxsqMgFEg1hcHKcHrzmiI0GGItNIwcjeD2B3ahj6rRm3NqeG
	jEO8hz2qC9/0WUKxauJkZptTOWjeC5BpCYRNuhQM6XCo8Hok9gfDdI8NU+2vYFMMtmPIiNsHaCVPR
	I2aMD4gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3ws-00000000hnX-0kK5;
	Tue, 06 Oct 2026 12:07:10 +0000
Received: from mail-m10313119179.xmail.ntesmail.com ([103.131.191.79])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3wn-00000000hlr-1WmB;
	Tue, 06 Oct 2026 12:07:08 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50150b1f5;
	Tue, 6 Oct 2026 20:06:49 +0800 (GMT+08:00)
Message-ID: <8dc2f33d-6c1e-4f5e-9f78-1f74405925a6@rock-chips.com>
Date: Tue, 6 Oct 2026 20:06:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Manivannan Sadhasivam <mani@kernel.org>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: Update saved Max Payload Size in pcie_set_mps()
To: Niklas Cassel <cassel@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Frank Li <Frank.Li@nxp.com>
References: <20261005124154.2190628-2-cassel@kernel.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261005124154.2190628-2-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1111bfc5503a4kunm971a00f5c37249
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZT01IVkhPTx1JQkgZSRlDGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=VP8/HEUqOtHBWrLrpK7O/mHzeRtOuXHwK5HPZDWDRTF6/sHhOH66ytHkco/0RYMYC8SLs5lFPhXvLSVridSALej40TD1llEbEyNG1iOj3Pjl3f34bdIQvzRrUOY4j8krCKeMm3jJgSCUbD81+rYvXGRBktbGjKchWdgao9MuKII=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=lgWbEUgSz0YKuspgKjuMWLzlYWgwmePe2UooMv1UNow=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_050706_040011_B81D5869 
X-CRM114-Status: GOOD (  28.92  )
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

Hi Niklas,

在 2026/10/05 星期一 20:41, Niklas Cassel 写道:
> pcie_set_mps() changes the Max Payload Size (MPS) in the Device Control
> register but leaves the copy saved by pci_save_state() alone, so the next
> pci_restore_state() puts back the old value.
> 
> The PCI core does change the MPS of devices whose state has already been
> saved: pci_configure_mps() reduces a Root Port's MPS when a device with a
> smaller MPS Supported is hot-added directly below it (commit 9f0e89359775
> ("PCI: Match Root Port's MPS to endpoint's MPSS as necessary")), and with
> "pci=pcie_bus_safe", pcie_bus_configure_settings() can do the same when
> pciehp calls it after a hot-add.  The Root Port's state was saved when it
> was added and again when portdrv probed it.
> 
> Since commit 3fc686d550f6 ("PCI/ERR: Add support for resetting the Root
> Ports in a platform-specific way"), pcibios_reset_secondary_bus() restores
> that saved state, without saving it first, after host->reset_root_port()
> has reset the Root Port, e.g. during AER recovery or on Link Down with the
> qcom and Rockchip DWC drivers.  The Root Port then goes back to the old,
> larger MPS while the device below it is restored to the smaller one, so
> the Root Port may send TLPs that the device treats as Malformed.
> 
> Update the saved copy of Device Control when pcie_set_mps() changes the
> MPS, like commit 909f7bf9b080 ("PCI: Update saved_config_space upon
> resource assignment") does for BARs.
> 

LGTM,

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

Note that I saw pcie_set_readrq() also changes Device Control register 
without updating the saved copy, so the reset-restore path reverts it
too.  Since you added pcie_update_saved_devctl(), mind fixing that here
as well?



> Fixes: 3fc686d550f6 ("PCI/ERR: Add support for resetting the Root Ports in a platform-specific way")
> Assisted-by: LLM
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
> This fix was originally sent out as part of my RFC series:
> https://lore.kernel.org/linux-pci/20260930145017.1356088-6-cassel@kernel.org/
> 
> But sending this fix as a separate patch, as the fix is really unrelated
> to the rest of the series, so it could be picked up independently.
> 
>   drivers/pci/pci.c | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 8cc6a89130b5..f3b82eb7bfaf 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -1736,6 +1736,24 @@ static void pci_restore_pcie_state(struct pci_dev *dev)
>   	pcie_capability_write_word(dev, PCI_EXP_SLTCTL2, cap[i++]);
>   }
>   
> +/*
> + * Update the saved copy of the Device Control register after changing it, so
> + * that pci_restore_state() doesn't put back a stale value.  Device Control is
> + * the first register saved by pci_save_pcie_state().
> + */
> +static void pcie_update_saved_devctl(struct pci_dev *dev, u16 clear, u16 set)
> +{
> +	struct pci_cap_saved_state *save_state;
> +	u16 *devctl;
> +
> +	save_state = pci_find_saved_cap(dev, PCI_CAP_ID_EXP);
> +	if (!save_state)
> +		return;
> +
> +	devctl = (u16 *)&save_state->cap.data[0];
> +	*devctl = (*devctl & ~clear) | set;
> +}
> +
>   static int pci_save_pcix_state(struct pci_dev *dev)
>   {
>   	int pos;
> @@ -5983,8 +6001,12 @@ int pcie_set_mps(struct pci_dev *dev, int mps)
>   
>   	ret = pcie_capability_clear_and_set_word(dev, PCI_EXP_DEVCTL,
>   						  PCI_EXP_DEVCTL_PAYLOAD, v);
> +	if (ret)
> +		return pcibios_err_to_errno(ret);
>   
> -	return pcibios_err_to_errno(ret);
> +	pcie_update_saved_devctl(dev, PCI_EXP_DEVCTL_PAYLOAD, v);
> +
> +	return 0;
>   }
>   EXPORT_SYMBOL(pcie_set_mps);
>   


