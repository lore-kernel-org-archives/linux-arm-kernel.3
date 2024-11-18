Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96980D6DDC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 06:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yImOF9hzGq7pUBm0HDu4DRgwX9Sp+YW5OwGghXcXJI=; b=1Tt0Yp8mGRtDBYAfvNVKNO4frN
	tfDPZphc+b8v4+G1JMbqCUzCUluHR9+C0UdfhdZFFionm74zG0VeHX0Pu/RlYQ1cXuJMeZ0O9u0YM
	FlL1nEriUNoIPj99FNonGDV+dNpb+CBuEUZwStJAsFIEMrXtRV4TeW3px+On4McB6wBUbX0L+MSi7
	Djn1F91AahYveaFeGdhNlY0PzuRi9YsPIHL+/gx9olDwZnnD7OwTinidON5zakTDWNzA6qrKE8kQ7
	1rIrKvmSq72YmfqBaEIGW2f34idbAjeN0xvOqn1GNQlB1e5SDBcpVYjehaeMCo6An/5DwKm0ESTvz
	vAncYerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvaF-00000008Z7I-2bdZ;
	Mon, 18 Nov 2024 06:50:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvZI-00000008Yrn-40pY;
	Mon, 18 Nov 2024 06:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731912543;
	bh=bjv7SkCpLSnRNZMg5tHaCssaJcWrZ5JBwsPd/AwNkSg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FKBpztrFLE9EQYgODyaNioRZ8/1WWV/UyFZlnMFaj7ZB60wEnV4YgxyR65vTql1E8
	 76antRCeEFQtWY7sBNgz12bryLFyiPAiHLYhCliTJ6CV8vCor6P1zs+Fw80B9APCaZ
	 DTVOV8rw4iPjSlvXjaF8M4nB0eSdLePnzo/d8UyH0bTqLrnMY4KCTZqgX4WVZ2Pe6B
	 ptfdUU6ckO8Umn/nrrjF/w+f4d2Ys6g3+IsQLAxefrmHDVqt3Dui39/dOTsivW8vhX
	 c0c7lLBkNeWnqYmb7ylIQt49HCRXeEh6kef23ecM1xlfP5oIyP2Wd3sQV3YIVZEiW+
	 xFgc/3EVn45DQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B304317E1232;
	Mon, 18 Nov 2024 07:49:02 +0100 (CET)
Message-ID: <a22f6d6d-1c69-4984-b9f9-3118b19721a5@collabora.com>
Date: Mon, 18 Nov 2024 07:49:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241116-pcie-en7581-fixes-v3-0-f7add3afc27e@kernel.org>
 <20241116-pcie-en7581-fixes-v3-3-f7add3afc27e@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241116-pcie-en7581-fixes-v3-3-f7add3afc27e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_224905_167468_16E5CF3C 
X-CRM114-Status: GOOD (  21.49  )
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

Il 16/11/24 09:18, Lorenzo Bianconi ha scritto:
> In order to make the code more readable, the reset_control_bulk_assert()
> for PHY reset lines is moved to make it pair with
> reset_control_bulk_deassert() in mtk_pcie_power_up() and
> mtk_pcie_en7581_power_up(). The same change is done for
> reset_control_assert() used to assert MAC reset line.
> 
> Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
> complete PCIe reset on MediaTek controller.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 27 +++++++++++++++++++--------
>   1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 3cfcb45d31508142d28d338ff213f70de9b4e608..2b80edd4462ad4e9f2a5d192db7f99307113eb8a 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -125,6 +125,8 @@
>   
>   #define MAX_NUM_PHY_RESETS		3
>   
> +#define PCIE_MTK_RESET_TIME_US		10
> +
>   /* Time in ms needed to complete PCIe reset on EN7581 SoC */
>   #define PCIE_EN7581_RESET_TIME_MS	100
>   
> @@ -912,6 +914,14 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>   	int err;
>   	u32 val;
>   
> +	/*
> +	 * The controller may have been left out of reset by the bootloader
> +	 * so make sure that we get a clean start by asserting resets here.
> +	 */
> +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> +				  pcie->phy_resets);
> +	reset_control_assert(pcie->mac_reset);
> +
>   	/*
>   	 * Wait for the time needed to complete the bulk assert in
>   	 * mtk_pcie_setup for EN7581 SoC.
> @@ -986,6 +996,15 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
>   	struct device *dev = pcie->dev;
>   	int err;
>   
> +	/*
> +	 * The controller may have been left out of reset by the bootloader
> +	 * so make sure that we get a clean start by asserting resets here.
> +	 */
> +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> +				  pcie->phy_resets);
> +	reset_control_assert(pcie->mac_reset);
> +	usleep_range(PCIE_MTK_RESET_TIME_US, 2 * PCIE_MTK_RESET_TIME_US);
> +
>   	/* PHY power on and enable pipe clock */
>   	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
>   	if (err) {
> @@ -1070,14 +1089,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>   	 * counter since the bulk is shared.
>   	 */
>   	reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> -	/*
> -	 * The controller may have been left out of reset by the bootloader
> -	 * so make sure that we get a clean start by asserting resets here.
> -	 */
> -	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> -
> -	reset_control_assert(pcie->mac_reset);
> -	usleep_range(10, 20);
>   
>   	/* Don't touch the hardware registers before power up */
>   	err = pcie->soc->power_up(pcie);
> 


-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

