Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97240CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 00:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifI6+QG6/qY9ph4H6akJ2gwdOb0wTyL2kFP/EzfV+vc=; b=jgORIBBV/BotFQ2IxOTwrJ+77S
	5IdZgjX7aFFir84unQ1JK0cF3bPvEZbFc6uLfDqzD5aL2a6k+tRMArRa56J/YWrehrGekyrfDYno+
	nhB6Ln9TG6miW9LanV+uLkx7Q0fVUdgifkKqNPENgFpsvGH7ocGOJUAaAFh2DjTTnyzrhCwwU0pFU
	2rgniVTprKZF/K8a/wvVzycDTn+ThSkVKzmeb7yBmIemK5HaiBGfnNRCCQ1HYoCocAhSAo86O7zT4
	QB7BCLg6ngMVGIc8aJxQLSd1qVgcVs6lKFk9GB7kj5lbJBxn5rXopI3V2DJRg6ftqbdX9D1z0HLSv
	3PSnW7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG5NJ-0000000Arvs-0N4q;
	Tue, 04 Nov 2025 00:58:17 +0000
Received: from mail-m15573.qiye.163.com ([101.71.155.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG5NF-0000000Aruz-2FP3;
	Tue, 04 Nov 2025 00:58:15 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 284017063;
	Tue, 4 Nov 2025 08:58:03 +0800 (GMT+08:00)
Message-ID: <0e32766b-b951-4ab4-ae3d-c802cf649edf@rock-chips.com>
Date: Tue, 4 Nov 2025 08:58:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>, Simon Xue <xxm@rock-chips.com>,
 Damien Le Moal <dlemoal@kernel.org>, Dragan Simic <dsimic@manjaro.org>,
 FUKAUMI Naoki <naoki@radxa.com>, Diederik de Haas <diederik@cknow-tech.com>,
 stable@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Prevent advertising L1 Substates
 support
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20251103213206.GA1818418@bhelgaas>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20251103213206.GA1818418@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a4c5ef5ba09cckunmc021633caac835
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0MaGlZIHR5LSkpNTx1CSkhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=OOilC0TS6CmRYaAWmUwHiSnh1xyTkxm21fbPezQSTIgU3wGR55vbYVdtJ0IGRH46A34Aj/6u4O25ceGZ7zl3RJvff8gahyY0PmHAucbj8RIF6KqdQz6Zc7FPJckglGuMchZUaWIB378rBj09SookHJEBErPM6uqhPpLJZHVhSuo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ifI6+QG6/qY9ph4H6akJ2gwdOb0wTyL2kFP/EzfV+vc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_165814_096261_B672E8C3 
X-CRM114-Status: GOOD (  31.33  )
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

Hi Bjorn,

在 2025/11/04 星期二 5:32, Bjorn Helgaas 写道:
> On Tue, Oct 28, 2025 at 02:02:18PM -0500, Bjorn Helgaas wrote:
>> On Fri, Oct 17, 2025 at 06:32:53PM +0200, Niklas Cassel wrote:
>>> The L1 substates support requires additional steps to work, namely:
>>> -Proper handling of the CLKREQ# sideband signal. (It is mostly handled by
>>>   hardware, but software still needs to set the clkreq fields in the
>>>   PCIE_CLIENT_POWER_CON register to match the hardware implementation.)
>>> -Program the frequency of the aux clock into the
>>>   DSP_PCIE_PL_AUX_CLK_FREQ_OFF register. (During L1 substates the core_clk
>>>   is turned off and the aux_clk is used instead.)
>> ...
> 
>>> +static void rockchip_pcie_disable_l1sub(struct dw_pcie *pci)
>>> +{
>>> +	u32 cap, l1subcap;
>>> +
>>> +	cap = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
>>> +	if (cap) {
>>> +		l1subcap = dw_pcie_readl_dbi(pci, cap + PCI_L1SS_CAP);
>>> +		l1subcap &= ~(PCI_L1SS_CAP_L1_PM_SS | PCI_L1SS_CAP_ASPM_L1_1 |
>>> +			      PCI_L1SS_CAP_ASPM_L1_2 | PCI_L1SS_CAP_PCIPM_L1_1 |
>>> +			      PCI_L1SS_CAP_PCIPM_L1_2);
>>> +		dw_pcie_writel_dbi(pci, cap + PCI_L1SS_CAP, l1subcap);
>>> +	}
>>> +}
>>
>> I like this.  But why should we do it just for dw-rockchip?  Is there
>> something special about dw-rockchip that makes this a problem?  Maybe
>> we should consider doing this in the dwc, cadence, mobiveil, and plda
>> cores instead of trying to do it for every driver individually?
>>
>> Advertising L1SS support via PCI_EXT_CAP_ID_L1SS means users can
>> enable L1SS via CONFIG_PCIEASPM_POWER_SUPERSAVE=y or sysfs, and that
>> seems likely to cause problems unless CLKREQ# is supported.
> 
> Any thoughts on this?  There's nothing rockchip-specific in this
> patch.  What I'm proposing is something like this:

I like your idea, though. But could it be another form of regression
that we may breaks the platform which have already support L1SS
properly? It's even harder to detect because a functional break is 
easier to notice than increased power consumption. Or maybe we could
just export dw_pcie_clear_l1ss_advert() in dwc for host drivers to
call it?

> 
>      PCI: dwc: Prevent advertising L1 PM Substates
>      
>      L1 PM Substates require the CLKREF# signal and driver-specific support.  If
>      CLKREF# is not supported or the driver support is lacking, enabling L1.1 or
>      L1.2 may cause errors when accessing devices, e.g.,
>      
>        nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
>      
>      If both ends of a link advertise support for L1 PM Substates, and the
>      kernel is built with CONFIG_PCIEASPM_POWER_SUPERSAVE=y or users enable L1.x
>      via sysfs, Linux tries to enable them.
>      
>      To prevent errors when L1.x may not work, disable advertising the L1 PM
>      Substates.  Drivers can enable advertising them if they know CLKREF# is
>      present and the Root Port is configured correctly.
>      
>      Based on Niklas's patch from
>      https://patch.msgid.link/20251017163252.598812-2-cassel@kernel.org
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 20c9333bcb1c..83b5330c9e45 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -950,6 +950,27 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>   	return 0;
>   }
>   
> +static void dw_pcie_clear_l1ss_advert(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	u16 l1ss;
> +	u32 l1ss_cap;
> +
> +	l1ss = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
> +	if (!l1ss)
> +		return;
> +
> +	/*
> +	 * By default, don't advertise L1 PM Substates because they require
> +	 * CLKREF# and other driver-specific support.
> +	 */
> +	l1ss_cap = dw_pcie_readl_dbi(pci, l1ss + PCI_L1SS_CAP);
> +	l1ss_cap &= ~(PCI_L1SS_CAP_PCIPM_L1_1 | PCI_L1SS_CAP_ASPM_L1_1 |
> +		      PCI_L1SS_CAP_PCIPM_L1_2 | PCI_L1SS_CAP_ASPM_L1_2 |
> +		      PCI_L1SS_CAP_L1_PM_SS);
> +	dw_pcie_writel_dbi(pci, l1ss + PCI_L1SS_CAP, l1ss_cap);
> +}
> +
>   static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed speed)
>   {
>   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -1060,6 +1081,7 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>   		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
>   	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
>   
> +	dw_pcie_clear_l1ss_advert(pp);
>   	dw_pcie_config_presets(pp);
>   	/*
>   	 * If the platform provides its own child bus config accesses, it means
> 


