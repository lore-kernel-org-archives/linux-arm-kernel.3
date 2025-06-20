Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43E9C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOeipMVy1qgYxSusPYoAgVzI/NzzXASY/LRIXeicWSM=; b=vp/us5SQblV3MpBgsovo3g4G47
	34MSpAgw0WseRyNsDlrYyyYrDxSFDHrrLjloXX8C67zSz49uoTbZFfMqJmaVxCfD0ugIWR4qEqVTU
	Ygdo8H3+kaHPj2kpasNPM4Xew97Ppq7ttbC8H7psDwx5l1dLHFcLMd54Hwiv0e/fDe85ANpFqhxti
	OAS+B42/di4ytvoLcpJMDzjgZRHOqoh5WQtHb2c1ZGCopmw8W6pzr2F78KzuPUy34WP+5LOcAQSIZ
	+qk1Lvs3sOX8EXpFQaj5PcFqMNHSOIcDeFmNC6yRG8Ywol3yHxF72tIuXmMvjj+x3Ckh/oixHvw1J
	blUx/Vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScf1-0000000FqHh-3QPH;
	Fri, 20 Jun 2025 14:24:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScaF-0000000FpuT-3rj5;
	Fri, 20 Jun 2025 14:19:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 483E816F2;
	Fri, 20 Jun 2025 07:18:51 -0700 (PDT)
Received: from [10.57.27.59] (unknown [10.57.27.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 795A33F58B;
	Fri, 20 Jun 2025 07:19:08 -0700 (PDT)
Message-ID: <d52fce68-d01e-4b92-825f-f7408df2ca18@arm.com>
Date: Fri, 20 Jun 2025 15:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 4/4] phy: rockchip-pcie: Adjust read mask and write
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
 <7068a941037eca8ef37cc65e8e08a136c7aac924.1749833987.git.geraldogabriel@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <7068a941037eca8ef37cc65e8e08a136c7aac924.1749833987.git.geraldogabriel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_071912_009070_72E341D4 
X-CRM114-Status: GOOD (  15.66  )
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

On 2025-06-13 6:04 pm, Geraldo Nascimento wrote:
> Section 17.6.10 of the RK3399 TRM "PCIe PIPE PHY registers Description"
> defines asynchronous strobe TEST_WRITE which should be enabled then
> disabled and seems to have been copy-pasted as of current. Adjust it.

FWIW that's a bit hard to make sense of, given that it bears no relation 
whatsoever to the naming used in the code :/

(Not least because the mapping of register fields to phy signals here is 
really a property of GRF_SOC_CON8 rather than the phy itself)

> While at it, adjust read mask which should be the same as write mask.

Which write mask? Certainly not PHY_CFG_WR_MASK... However as this 
definition is unused since 64cdc0360811 ("phy: rockchip-pcie: remove 
unused phy_rd_cfg function"), I don't see much point in touching it 
other than to remove it entirely. If it is the case that only the 
address field is significant for whatever a "read" operation actually 
means, well then that's just another job for ADDR_MASK (which I guess is 
what the open-coded business with PHY_CFG_PLL_LOCK is actually doing...)

Thanks,
Robin.

> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-pcie.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
> index 48bcc7d2b33b..35d2523ee776 100644
> --- a/drivers/phy/rockchip/phy-rockchip-pcie.c
> +++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
> @@ -30,9 +30,9 @@
>   #define PHY_CFG_ADDR_SHIFT    1
>   #define PHY_CFG_DATA_MASK     0xf
>   #define PHY_CFG_ADDR_MASK     0x3f
> -#define PHY_CFG_RD_MASK       0x3ff
> +#define PHY_CFG_RD_MASK       0x3f
>   #define PHY_CFG_WR_ENABLE     1
> -#define PHY_CFG_WR_DISABLE    1
> +#define PHY_CFG_WR_DISABLE    0
>   #define PHY_CFG_WR_SHIFT      0
>   #define PHY_CFG_WR_MASK       1
>   #define PHY_CFG_PLL_LOCK      0x10


