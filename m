Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A58CC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 01:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lhfqNwmlYPEmtkhry3f4Q6skAru1oITFPhiAonca38=; b=MjNEZQpxz3jAEBZVyjTWJ6dGba
	CmsVFpdE1a0Zpo0zkbeeuIAuSG3iPfU7G0zJvzgfBqtbfSgDgA+7r9STur9quZ5JoZ9Ntp4DeO9Vt
	xm6M8i0D1QBmnyzKxt5KYv8ttPn4XemOCoVgHOQ1FgDBKgqtPoIAhtQrILztCDyWrwhbMade76mK2
	YZrz38SP5G/FA4rw/j0lPW9CNa+QMvwl7Oj1g9zyUDOJ8tvQCwFKyBEpCq3ZdxNjjuS41anqOrw74
	3RUEuhNaQYqMCd+hPbT4jBG6CppgcCiQgjvxjBmdTiIOfBR0qDlR+NKALcyIweJN9X7QtFa+b53zw
	jBF2gjlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjsj-0000000FiIM-2Sp3;
	Tue, 25 Feb 2025 01:37:09 +0000
Received: from mail-m3270.qiye.163.com ([220.197.32.70])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjrC-0000000FiBw-2WBa;
	Tue, 25 Feb 2025 01:35:36 +0000
Received: from [172.16.12.45] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c1077187;
	Tue, 25 Feb 2025 09:35:22 +0800 (GMT+08:00)
Message-ID: <93cdce39-1ae6-4939-a3fc-db10be7564e5@rock-chips.com>
Date: Tue, 25 Feb 2025 09:35:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Damien Le Moal <dlemoal@kernel.org>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/2] PCI: dw-rockchip: hide broken ATS capability
To: Niklas Cassel <cassel@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>
References: <20250221202646.395252-3-cassel@kernel.org>
 <20250221202646.395252-4-cassel@kernel.org>
Content-Language: en-GB
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20250221202646.395252-4-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRgfSlZNQ0oaGU0aTh9LGRlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a953abe91f409cckunmc1077187
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mwg6Thw5DTIIKxEeQxEWOiEv
	P0wwCh5VSlVKTE9LT09MSElPSU1KVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU9LS0k3Bg++
DKIM-Signature: a=rsa-sha256;
	b=Ce40YqQGRf1rwHhVMFysWNkvy7+RMtWiqnjH8k4P/B4ce9F917tbhazdTdT4/6nYEB5TmqyQO+AjmTVKG6x5xPH3Vi0QYI7M7Tgl8McRTGxqepYnRcvZPEKtXJLzHxquzTNcI05ahbWvmnNDZNPA7bnMn6266N+SwE3HxTPWXZA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=1lhfqNwmlYPEmtkhry3f4Q6skAru1oITFPhiAonca38=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_173535_141469_ACB41086 
X-CRM114-Status: GOOD (  29.44  )
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

On 2025/2/22 4:26, Niklas Cassel wrote:
> When running the rk3588 in endpoint mode, with an Intel host with IOMMU
> enabled, the host side prints:
> DMAR: VT-d detected Invalidation Time-out Error: SID 0
> 
> When running the rk3588 in endpoint mode, with an AMD host with IOMMU
> enabled, the host side prints:
> iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT device=63:00.0 address=0x42b5b01a0]
> 
> Usually, to handle these issues, we add a quirk for the PCI vendor and
> device ID in drivers/pci/quirks.c with quirk_no_ats(). That is because
> we cannot usually modify the capabilities on the EP side.
> 
> In this case, we can modify the capabilties on the EP side. Thus, hide the
> broken ATS capability on rk3588 when running in EP mode. That way,

Niklas, Thanks for reporting this issue. It's been a while before
getting confirmation from the design team. Now I can confirm the ATS 
support for RK3588 is only available running as RC but I'm still
requesting erratum about this issue if possible.

Acked-by: Shawn Lin <shawn.lin@rock-chips.com>

> we don't need any quirk on the host side, and we see no errors on the host
> side, and we can run pci_endpoint_test successfully, with the IOMMU
> enabled on the host side.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 46 +++++++++++++++++++
>   1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 836ea10eafbb..2be005c1a161 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -242,6 +242,51 @@ static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
>   	.init = rockchip_pcie_host_init,
>   };
>   
> +/*
> + * ATS does not work on rk3588 when running in EP mode.
> + * After a host has enabled ATS on the EP side, it will send an IOTLB
> + * invalidation request to the EP side. The rk3588 will never send a completion
> + * back and eventually the host will print an IOTLB_INV_TIMEOUT error, and the
> + * EP will not be operational. If we hide the ATS cap, things work as expected.
> + */
> +static void rockchip_pcie_ep_hide_broken_ats_cap_rk3588(struct dw_pcie_ep *ep)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct device *dev = pci->dev;
> +	unsigned int spcie_cap_offset, next_cap_offset;
> +	u32 spcie_cap_header, next_cap_header;
> +
> +	/* only hide the ATS cap for rk3588 running in EP mode */
> +	if (!of_device_is_compatible(dev->of_node, "rockchip,rk3588-pcie-ep"))
> +		return;
> +
> +	spcie_cap_offset = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_SECPCI);
> +	if (!spcie_cap_offset)
> +		return;
> +
> +	spcie_cap_header = dw_pcie_readl_dbi(pci, spcie_cap_offset);
> +	next_cap_offset = PCI_EXT_CAP_NEXT(spcie_cap_header);
> +
> +	next_cap_header = dw_pcie_readl_dbi(pci, next_cap_offset);
> +	if (PCI_EXT_CAP_ID(next_cap_header) != PCI_EXT_CAP_ID_ATS)
> +		return;
> +
> +	/* clear next ptr */
> +	spcie_cap_header &= ~GENMASK(31, 20);
> +
> +	/* set next ptr to next ptr of ATS_CAP */
> +	spcie_cap_header |= next_cap_header & GENMASK(31, 20);
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +	dw_pcie_writel_dbi(pci, spcie_cap_offset, spcie_cap_header);
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +}
> +
> +static void rockchip_pcie_ep_pre_init(struct dw_pcie_ep *ep)
> +{
> +	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
> +}
> +
>   static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
>   {
>   	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> @@ -314,6 +359,7 @@ rockchip_pcie_get_features(struct dw_pcie_ep *ep)
>   
>   static const struct dw_pcie_ep_ops rockchip_pcie_ep_ops = {
>   	.init = rockchip_pcie_ep_init,
> +	.pre_init = rockchip_pcie_ep_pre_init,
>   	.raise_irq = rockchip_pcie_raise_irq,
>   	.get_features = rockchip_pcie_get_features,
>   };


