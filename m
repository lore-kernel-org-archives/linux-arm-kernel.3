Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044A2CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nZLD9diL5Nl54JqOLMmgecUuCsULo/6MkV2RzeMUYA=; b=EnErpep6HgVECb8KlIZsCGXESD
	1QOLUHchDTcQN8VlqEFV0BFxEmwXb+ygPpfYTwhgXzA2RS4LrhpgFu3x5FIWOStOWKS8+TyCypLjE
	dBPVkN4iwVjtffdEj29HF2C7+sVMgQa8I7v793gHVjIrgDsmUwpHu2eCzx72KK87iBuOk/2bwVuQi
	Wb4Nr9+SCWttsmvWU6FoGkPK+Dr9YNalYF8YNyu4cXoD17f/1YXs22/TcWM0AbO1crqeMjtiaDsWq
	hklHFH5zJl2cWuwbnduvxAocQ8BBLX/cQ9FvfMCkpF0jTdKBequw/2tEht076RH425cdgW9X0Td8Q
	4T1y15EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIU5z-00000005iwo-3F0A;
	Mon, 10 Nov 2025 15:46:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIU5x-00000005iwE-0VSw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8nZLD9diL5Nl54JqOLMmgecUuCsULo/6MkV2RzeMUYA=; b=F7VuTdwMDensrQoEHPLpu3zbJi
	62AkImrh5wvQK3G572aiWMaUpJbB2vNNXs6TxVhfz1pVQ8gU+8Cycs3KCY9PGuIeYiScScJj4Q77/
	H4/1yTstNex7J7LSb+gGbvhqamTNVcVqL4NDtUE9IovP4a5Cwwq9+hYQzPG9RDHvewmQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIU5e-00DXER-4n; Mon, 10 Nov 2025 16:45:58 +0100
Date: Mon, 10 Nov 2025 16:45:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, taoren@meta.com
Subject: Re: [PATCH net-next v4 4/4] net: ftgmac100: Add RGMII delay support
 for AST2600
Message-ID: <8c6e1286-782a-44c5-ac9b-21d1db177d6e@lunn.ch>
References: <20251110-rgmii_delay_2600-v4-0-5cad32c766f7@aspeedtech.com>
 <20251110-rgmii_delay_2600-v4-4-5cad32c766f7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-rgmii_delay_2600-v4-4-5cad32c766f7@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_074617_627867_267E00D2 
X-CRM114-Status: GOOD (  33.32  )
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

On Mon, Nov 10, 2025 at 07:09:28PM +0800, Jacky Chou wrote:
> On the AST2600 platform, the RGMII delay is controlled via the
> SCU registers. The delay chain configuration differs between MAC0/1
> and MAC2/3, even though all four MACs use a 32-stage delay chain.
> +------+----------+-----------+-------------+-------------+
> |      |Delay Unit|Delay Stage|TX Edge Stage|RX Edge Stage|
> +------+----------+-----------+-------------+-------------+
> |MAC0/1|     45 ps|        32 |           0 |           0 |
> +------+----------+-----------+-------------+-------------+
> |MAC2/3|    250 ps|        32 |           0 |          26 |
> +------+----------+-----------+-------------+-------------+
> For MAC2/3, the "no delay" condition starts from stage 26.
> Setting the RX delay stage to 26 means that no additional RX
> delay is applied.
> Here lists the RX delay setting of MAC2/3 below.
> 26 -> 0   ns, 27 -> 0.25 ns, ... , 31 -> 1.25 ns,
> 0  -> 1.5 ns, 1  -> 1.75 ns, ... , 25 -> 7.75 ns
> 
> Therefore, we calculate the delay stage from the
> rx-internal-delay-ps of MAC2/3 to add 26. If the stage is equel
> to or bigger than 32, the delay stage will be mask 0x1f to get
> the correct setting.
> The delay chain is like a ring for configuration.
> Example for the rx-internal-delay-ps of MAC2/3 is 2000 ps,
> we will get the delay stage is 2.
> 
> Strating to this patch, driver will remind the legacy dts to update the
> "phy-mode" to "rgmii-id, and add the corresponding rgmii delay with
> "rx-internal-delay-id" and "tx-internal-delay-id".
> If lack these properties, driver will configure the default rgmii delay,
> that means driver will disable the TX and RX delay in MAC side.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 148 +++++++++++++++++++++++++++++++
>  drivers/net/ethernet/faraday/ftgmac100.h |  20 +++++
>  2 files changed, 168 insertions(+)
> 
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index a863f7841210..5cecdd4583f6 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +static int ftgmac100_set_ast2600_rgmii_delay(struct ftgmac100 *priv,
> +					     u32 rgmii_tx_delay,
> +					     u32 rgmii_rx_delay)
> +{
> +	struct device *dev = priv->dev;
> +	struct device_node *np;
> +	u32 rgmii_delay_unit;
> +	u32 rx_delay_index;
> +	u32 tx_delay_index;
> +	struct regmap *scu;
> +	int dly_mask;
> +	int dly_reg;
> +	int mac_id;
> +	int ret;
> +
> +	np = dev->of_node;
> +
> +	/* Add a warning to notify the existed dts based on AST2600. It is
> +	 * recommended to update the dts to add the rx/tx-internal-delay-ps to
> +	 * specify the RGMII delay and we recommend using the "rgmii-id" for
> +	 * phy-mode property to tell the PHY enables TX/RX internal delay and
> +	 * add the corresponding rx/tx-internal-delay-ps properties.
> +	 */
> +	if (priv->netdev->phydev->interface != PHY_INTERFACE_MODE_RGMII_ID)
> +		dev_warn(dev, "Update the phy-mode to 'rgmii-id'.\n");
> +
> +	scu = syscon_regmap_lookup_by_phandle(np, "aspeed,scu");
> +	if (IS_ERR(scu)) {
> +		dev_err(dev, "failed to get aspeed,scu");
> +		return PTR_ERR(scu);
> +	}

You are adding the scu to the dtsi.

> +
> +	ret = of_property_read_u32(np, "aspeed,rgmii-delay-ps",
> +				   &rgmii_delay_unit);
> +	if (ret) {
> +		dev_err(dev, "failed to get aspeed,rgmii-delay-ps value\n");
> +		return -EINVAL;
> +	}

This is probably going away, replaced by hard coded values.

> +	tx_delay_index = DIV_ROUND_CLOSEST(rgmii_tx_delay, rgmii_delay_unit);
> +	if (tx_delay_index >= 32) {
> +		dev_err(dev, "The %u ps of TX delay is out of range\n",
> +			rgmii_tx_delay);
> +		return -EINVAL;
> +	}
> +
> +	rx_delay_index = DIV_ROUND_CLOSEST(rgmii_rx_delay, rgmii_delay_unit);
> +	if (rx_delay_index >= 32) {
> +		dev_err(dev, "The %u ps of RX delay is out of range\n",
> +			rgmii_rx_delay);
> +		return -EINVAL;
> +	}

> +	regmap_update_bits(scu, dly_reg, dly_mask, tx_delay_index | rx_delay_index);

How does backwards compatibility work? rgmii_rx_delay and
rgmii_tx_delay default to zero? So by default, todays working DT blobs
will have 'rgmii', so end up turning off delays here. And then they
pass _RGMII to the PHY, and have no delays. And networking is broken.

I think you actually need to be reading the current SCU settings and
then deciding if you want to override it or not.

I suggest you change the order of the patches in this series. Move
this patch before you update your RDK .dts file. That way, you get to
test both an old and new blob.

	Andrew

