Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4553CC6B3F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 01:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meWBkb9JLY55JlrbJk4pJtQ1K06TmCWc4A9vSb/0KTI=; b=sH4rTvcBL3hgD/ATC+4NXXY4Eh
	D3b+JXkJpp2wdok2kldnbhhsKBnl6GsxCq3RNrYskZXa1eV2bv0GavWnvwFB4V8zJx1ziCr7i7JOL
	Qs5+2wngLjPC1KECUFUxDXksqp5NGfRol7ipcLIdKvbROmi84EJL81thn6bMSyxhUp+tBY8qyh8H3
	RZKZ4nsiL3+O97zLTS2FAojXeTHIMkRAF5zTAxI+t0TZCi9i9EMcl7qMYC3KoAWW5wEJ7RFKRYuvp
	C2/1BwZaFYCvo5W1K6f/IppjDOVSlJKPtbEpjzgrcDUOts2WvXSnOHAUGg8/ofb4sMIsqBAcTTcBo
	ptSNJ4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TA9-000000011ij-2y4i;
	Fri, 03 Apr 2026 01:17:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TA8-000000011iL-0Gr8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 01:17:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5657443DB;
	Fri,  3 Apr 2026 01:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5498C116C6;
	Fri,  3 Apr 2026 01:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775179046;
	bh=JaZaqXx7UjhAu1o2iKmm1mcnfKWDRIbQehAs9zgMebg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=odmCkW0vCuh4urc8EBRzGnbdsI1D7bki86zEYeShQ5iBGE0KbhZtGUh1TYW61UifM
	 vlZHEIb9RaVRJGFQM90CW2FTMdJVg7rTtV3Cn6qKnA6Udo6V2mCALGdOOkpc7sWyL7
	 1/mYbbTxLddFsySO148Z/Di7Bi0W8SPd3NAHFa/gBoX46ljq7C9wKjgbsSufCiBleV
	 BzDqEBm7D2ZkGrCurTK/ahccod50nLtj/EEtaNvDUbNyMG3jUXrtG9MXFelGSUExpp
	 lLGnyvayMqtQU/dbr2Mwt942GBzYgPP47aePrQlIDLtC0Iir7STP++CxmJmplaBXM5
	 iC2+aAECkb13Q==
From: Jakub Kicinski <kuba@kernel.org>
To: wei.fang@nxp.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	f.fainelli@gmail.com,
	frank.li@nxp.com,
	chleroy@kernel.org,
	horms@kernel.org,
	linux@armlinux.org.uk,
	andrew@lunn.ch,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 net-next 03/14] net: enetc: add pre-boot initialization for i.MX94 switch
Date: Thu,  2 Apr 2026 18:17:23 -0700
Message-ID: <20260403011723.1795349-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331113025.1566878-4-wei.fang@nxp.com>
References: <20260331113025.1566878-4-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_181728_168164_4C45EA39 
X-CRM114-Status: GOOD (  24.72  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: enetc: add pre-boot initialization for i.MX94 switch

This commit adds pre-boot initialization logic for the i.MX94 switch
in the NETC block control driver. It configures external ports, MII
protocols, and MDIO PHY addresses, and handles the MAC selection
constraint between switch port 2 and ENETC 0.

> diff --git a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
> index 92a0f824dae7..c21230f7a7fb 100644
> --- a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
> +++ b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
[ ... ]
> +static int imx94_switch_link_config(struct netc_blk_ctrl *priv,
> +				    struct device_node *np,
> +				    bool *swp2_en)
> +{
> +	struct device_node *ports;
> +	int port_id, err = 0;

Since of_property_read_u32() expects a u32 pointer, does passing a
signed int pointer here trigger an incompatible pointer types warning
during compilation?

> +
> +	ports = netc_get_switch_ports(np);
> +	if (!ports)
> +		return -ENODEV;
> +
> +	for_each_available_child_of_node_scoped(ports, child) {
> +		if (of_property_read_u32(child, "reg", &port_id) < 0) {

If the device tree provides a reg value with the MSB set, port_id
would be evaluated as a negative number.

[ ... ]
>  static int imx94_netcmix_init(struct platform_device *pdev)
>  {
>  	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
>  	struct device_node *np = pdev->dev.of_node;
> +	bool enetc0_en = false, swp2_en = false;
>  	u32 val;
>  	int err;
>  
>  	for_each_child_of_node_scoped(np, child) {
>  		for_each_child_of_node_scoped(child, gchild) {
> -			if (!of_device_is_compatible(gchild, "pci1131,e101"))
> -				continue;
> -
> -			err = imx94_enetc_link_config(priv, gchild);
> -			if (err)
> -				return err;
> +			if (of_device_is_compatible(gchild, "pci1131,e101")) {
> +				err = imx94_enetc_link_config(priv, gchild,
> +							      &enetc0_en);
> +				if (err)
> +					return err;
> +			} else if (of_device_is_compatible(gchild,
> +							   "pci1131,eef2")) {

Is it possible for the switch node to be disabled in the device tree?

If so, should we check of_device_is_available() for gchild before proceeding,
similar to how it is checked for enetc0_en?

Without checking availability, if the disabled switch lacks a ports subnode,
imx94_switch_link_config() might return -ENODEV and abort the entire probe.

Alternatively, if the disabled switch node has a ports subnode with an
available port 2, it could spuriously set swp2_en = true and cause a false
conflict with ENETC 0.

> +				err = imx94_switch_link_config(priv, gchild,
> +							       &swp2_en);
> +				if (err)
> +					return err;
> +			}
>  		}
>  	}
[ ... ]
> @@ -610,6 +682,77 @@ static int imx94_enetc_mdio_phyaddr_config(struct netc_blk_ctrl *priv,
>  	return 0;
>  }
>  
> +static int imx94_ierb_enetc_init(struct netc_blk_ctrl *priv,
[ ... ]
> +static int imx94_switch_mdio_phyaddr_config(struct netc_blk_ctrl *priv,
> +					    struct device_node *np,
> +					    int port_id, u32 phy_mask)
> +{
> +	int addr;
> +
> +	/* The switch has 3 external ports at most */
> +	if (port_id > 2)
> +		return 0;

If port_id is negative due to the signed type, it will bypass this upper
bound check.

> +
> +	addr = netc_get_phy_addr(np);
> +	if (addr < 0) {
> +		if (addr == -ENODEV)
> +			return 0;
> +
> +		return addr;
> +	}
> +
> +	if (phy_mask & BIT(addr)) {
> +		dev_err(&priv->pdev->dev,
> +			"Found same PHY address in EMDIO and switch node\n");
> +		return -EINVAL;
> +	}
> +
> +	netc_reg_write(priv->ierb, IERB_LBCR(port_id),
> +		       LBCR_MDIO_PHYAD_PRTAD(addr));

Could this lead to an out-of-bounds register write prior to the array base
since port_id is negative?

> +
> +	return 0;
> +}
> +
> +static int imx94_ierb_switch_init(struct netc_blk_ctrl *priv,
> +				  struct device_node *np,
> +				  u32 phy_mask)
> +{
> +	struct device_node *ports;
> +	int port_id, err = 0;

A similar signed int declaration is used here for port_id, which would run
into the same pointer type warning and negative value issues.

> +
> +	ports = netc_get_switch_ports(np);
> +	if (!ports)
> +		return -ENODEV;
[ ... ]
-- 
pw-bot: cr

