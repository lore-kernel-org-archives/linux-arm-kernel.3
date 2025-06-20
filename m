Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE507C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 12:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FU5wnW5pAEweNIjRa+IL3W8lXVfXik1QBE844ZhYcTo=; b=rQhS0jcj8tL+WoAaQE3eUgexLW
	5ZQavSHzPC099QQoDDBbzsnD6Xp3AflKiufG4lZjS/fc09hMSGPPdi9tHtz7sfHRlxoDoOgDenkNt
	21PSG9l69zow5aKLkSWBH2+xhudCW/zzmVyB0b3b5PR3psew2uDgj6TE46JDnlNgml8lPPGtATfCF
	yVqZC3O1e4Gr/JKoXs4Vv9XDhjxWp3z/k+0MT2X+wLmayX3r15DvE8kloTM4KPIO+Pflx+YA5B09v
	bSfYN4f2ZVklRfrAAL4xc/yUXaG5hlj0i110G6UiPBTjL0gV/qPv2VS2aF+Sd0HBszeZyIfxbtikL
	g2J9v7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbJY-0000000Fc74-2RJr;
	Fri, 20 Jun 2025 12:57:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaUE-0000000FX2B-2HtL;
	Fri, 20 Jun 2025 12:04:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E59D106F;
	Fri, 20 Jun 2025 05:04:30 -0700 (PDT)
Received: from [192.168.1.102] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD2173F58B;
	Fri, 20 Jun 2025 05:04:47 -0700 (PDT)
Message-ID: <4c2c9a15-50bc-4a89-b5fe-d9014657fca7@arm.com>
Date: Fri, 20 Jun 2025 13:04:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 3/4] phy: rockchip-pcie: Enable all four lanes
To: Geraldo Nascimento <geraldogabriel@gmail.com>,
 linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rick wertenbroek <rick.wertenbroek@gmail.com>,
 linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1749833986.git.geraldogabriel@gmail.com>
 <ce661babb3e2f08c8b28554ccb5508da503db7ba.1749833987.git.geraldogabriel@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <ce661babb3e2f08c8b28554ccb5508da503db7ba.1749833987.git.geraldogabriel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_050450_632035_BAD5A28A 
X-CRM114-Status: GOOD (  14.17  )
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

On 2025-06-13 6:03 pm, Geraldo Nascimento wrote:
> Current code enables only Lane 0 because pwr_cnt will be incremented
> on first call to the function. Use for-loop to enable all 4 lanes
> through GRF.

If this was really necessary, then surely it would also need the 
equivalent changes in rockchip_pcie_phy_power_off() too?

However, I'm not sure it *is* necessary - the NVMe on my RK3399 board 
happily claims to be using an x4 link, so I stuck a print of inst->index 
in this function, and sure enough I do see it being called for each 
instance already:

[    1.737479] phy phy-ff770000.syscon:pcie-phy.1: power_on 0
[    1.738810] phy phy-ff770000.syscon:pcie-phy.2: power_on 1
[    1.745193] phy phy-ff770000.syscon:pcie-phy.3: power_on 2
[    1.745196] phy phy-ff770000.syscon:pcie-phy.4: power_on 3

Thanks,
Robin.

> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-pcie.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
> index bd44af36c67a..48bcc7d2b33b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-pcie.c
> +++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
> @@ -176,11 +176,13 @@ static int rockchip_pcie_phy_power_on(struct phy *phy)
>   				   PHY_CFG_ADDR_MASK,
>   				   PHY_CFG_ADDR_SHIFT));
>   
> -	regmap_write(rk_phy->reg_base,
> -		     rk_phy->phy_data->pcie_laneoff,
> -		     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
> -				   PHY_LANE_IDLE_MASK,
> -				   PHY_LANE_IDLE_A_SHIFT + inst->index));
> +	for (int i=0; i < PHY_MAX_LANE_NUM; i++) {
> +		regmap_write(rk_phy->reg_base,
> +			     rk_phy->phy_data->pcie_laneoff,
> +			     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
> +					   PHY_LANE_IDLE_MASK,
> +					   PHY_LANE_IDLE_A_SHIFT + i));
> +	}
>   
>   	/*
>   	 * No documented timeout value for phy operation below,


