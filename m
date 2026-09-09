Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED75CC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 01:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbpeY8A/bkmtJlJ/cwp8vEYR3E9oMYSezTRlhuo4liw=; b=ggq/CewoOLCJDwHMpDUMNJ+/Rf
	Qnb9DlVrciADpxXe8JR3z+5yNvP6QwWIai80t+GO7KplIe6EsMbRJBFZlIldY3AOlLfGNop5evV61
	SKA0PYAlEJjBw2c08HYO49po54DYiKONn3ZKc50JS9JHcFvZZBOKpMUncpdxZDOWoQ1NdwCNj/MZm
	HWeMClwNRNDEb6yiyyBma6DWrnZqP/9PFrH28uhNw+gQOJ2LlujqZhAZCr7wsdxsIaVI0wC6qA6KY
	DYU1jaKofrYrk0jaBYLHl4fNHZBz60WkR/luHjEH6l2iizyti71MJUwtkIwNxbd10cEM2yR3OQ4QG
	8kxUtwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46qe-0000000Aa8o-0Ins;
	Wed, 09 Sep 2026 01:11:36 +0000
Received: from mail-m81110.xmail.ntesmail.com ([156.224.81.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46qa-0000000Aa7t-4BFY;
	Wed, 09 Sep 2026 01:11:34 +0000
Received: from [172.16.12.48] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d09a7d19;
	Wed, 9 Sep 2026 09:11:28 +0800 (GMT+08:00)
Message-ID: <1255b90b-1388-4ca4-a869-75db37100a2d@rock-chips.com>
Date: Wed, 9 Sep 2026 09:11:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Alexey Charkov <alchark@flipper.net>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v6 08/10] PCI: dw-rockchip: Set broken L1SS resume flag
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
References: <20260908-rockchip-pcie-system-suspend-v6-0-fbabcca9921b@collabora.com>
 <20260908-rockchip-pcie-system-suspend-v6-8-fbabcca9921b@collabora.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-8-fbabcca9921b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa083b84b0203a4kunm0f25797c442935
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGUgeH1YfGhhOGkkZTx
	0YSBlWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ASB17gow20NLkS56QPasneUGrbAw71hZaG2hR4uSIADguVNkQym4V5wJ7fVuZH2HvxZKRkqicThjzBM2JW+i4SGaKA0ye4mUUWp1pIRh0eWD5mhzO454Vco7GwOlBG5khWE2m/NXWgdsftFaxXEsqwhsZGZf3iEHBAEd3NEQiGs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=UbpeY8A/bkmtJlJ/cwp8vEYR3E9oMYSezTRlhuo4liw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_181133_312547_E2F50CE7 
X-CRM114-Status: GOOD (  19.22  )
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

在 2026/09/08 星期二 22:51, Sebastian Reichel 写道:
> Setup the broken_l1ss_resume flag, so that pci_suspend_retains_context()
> returns false on the Rockchip platform allowing PCIe peripheral device
> drivers to act upon.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 17530507e41b..47d9cab909bc 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -458,6 +458,21 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
>   	return 0;
>   }
>   
> +static void rockchip_pcie_host_post_init(struct dw_pcie_rp *pp)
> +{
> +	/*
> +	 * During system suspend, the Rockchip RC driver effectively powers off
> +	 * the controller. If the link is in L1SS and the endpoint asserts
> +	 * CLKREQ# to exit L1SS, the time required to wake the system and
> +	 * restore the PHY/REFCLK may exceed the L1SS exit timing
> +	 * (L10_REFCLK_ON + T_COMMONMODE), resulting in Link Down (LDn) and a
> +	 * reset of the endpoint. Set this flag to indicate this limitation to
> +	 * client drivers so that they can avoid relying on device state being
> +	 * preserved during system suspend.
> +	 */

Yes, this is ture for Rockchip platforms that powering off the
controller as well as PHY is a default action during system suspend.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> +	pp->bridge->broken_l1ss_resume = true;
> +}
> +
>   static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
>   {
>   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -497,6 +512,7 @@ static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
>   
>   static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
>   	.init = rockchip_pcie_host_init,
> +	.post_init = rockchip_pcie_host_post_init,
>   	.pme_turn_off = rockchip_pcie_pme_turn_off,
>   };
>   
> 


