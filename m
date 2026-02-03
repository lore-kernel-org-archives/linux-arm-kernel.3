Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17290E7317E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 01:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg1DU/XeyVT2ygAI0kcHcX8EFBp1aZcW4C/j1cNjSas=; b=l2zIou1w1cSI6YyeWvj634GPpN
	S3zVBijp1zeB52c5fGBb3XT65KMTyz7Ur/ypdrHnZFF85CYPoiq5whHnz48ynYU5PCdAR9qSPAgwY
	u46wKRkU7sOjOFVaf2jGsB1VxRj9et7EHQRDuGj8v6ls8h/S6j7PCQ0Hv9+YDpptB+p6Y51CMpfWh
	P3n50hrmsgvwKIDgS8sKkdw+fIpKThKZ93O46jJ1sUzT/5Fe3q0731eOzp/yqNGC8g1A87EgNU70S
	Tid5Csq9h7H/ZIFLQZOT/RO64pXf7kQUUzLnvP1IhL+4mtC6vmgZuMJjQvKLhmIl6e41eNhcmnhSk
	b19olLsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5Sv-00000005rfm-2zI4;
	Tue, 03 Feb 2026 01:44:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5St-00000005rew-1yPk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 01:44:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0873B405AC;
	Tue,  3 Feb 2026 01:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025F1C116C6;
	Tue,  3 Feb 2026 01:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770083066;
	bh=uniYDI0bTTA8++3uJAQoOjtAdjCqnnfCLvtGF7pr7Ug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rSweUKQbO6ntU9uzE0+2CGsGehX5MKkDQGvDDPMLXyYUfhHUlHEPnQjUJoeC8JyGT
	 vUJfryFNq0NvbnLbaUajc0cTzpBIMKP6qcPWUjOoyEDo3i/5Z3nW64laUu0aAJcdtU
	 AqJb74XI4bxpUsvYAE3SsofXg1YniULwWrxo2foLJoDk9FsOqYb3EkJZ1eg5npii4Y
	 KvJ27eKXhTPS7idTQ68jji9H+SBhVhtIhU40/0hBf4SaZD5W6Mbc2tUyZ4FqwjeQsR
	 +F/DDMhNsO5TYLnZzL+7bkzX7cemi6RAZSgCVlmHmL+TWYKGnfmW9TsqAeQwv7OPwv
	 /ik84nTmwEa3w==
From: Jakub Kicinski <kuba@kernel.org>
To: lukasz.majewski@mailbox.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew@lunn.ch,
	shawnguo@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	edumazet@google.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	conor+dt@kernel.org,
	horms@kernel.org,
	richardcochran@gmail.com,
	robh@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	wahrenst@gmx.net,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Subject: Re: [net-next,v22,7/7] net: mtip: Extend the L2 switch driver for imx287 with bridge operations
Date: Mon,  2 Feb 2026 17:44:07 -0800
Message-ID: <20260203014406.825146-2-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131233459.1625279-8-lukasz.majewski@mailbox.org>
References: <20260131233459.1625279-8-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_174427_565329_F49358F6 
X-CRM114-Status: GOOD (  15.43  )
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

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: mtip: Extend the L2 switch driver for imx287 with bridge operations

This commit adds bridge offloading support to the MTIP L2 switch driver,
allowing the switch to offload packet switching when a bridge is
created on its interfaces.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c
> @@ -0,0 +1,132 @@

[ ... ]

> +static int mtip_ndev_port_link(struct net_device *ndev,
> +			       struct net_device *br_ndev,
> +			       struct netlink_ext_ack *extack)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(ndev), *other_priv;
> +	struct switch_enet_private *fep = priv->fep;
> +	struct net_device *other_ndev;
> +	int err;
> +
> +	/* Check if one port of MTIP switch is already bridged */
> +	if (fep->br_members && !fep->br_offload) {
> +		/* Get the second bridge ndev */
> +		other_ndev = fep->ndev[fep->br_members - 1];
> +		other_priv = netdev_priv(other_ndev);
> +		if (other_priv->master_dev != br_ndev) {
> +			NL_SET_ERR_MSG_MOD(extack,
> +					   "L2 offloading only possible for the same bridge!");
> +			return -EOPNOTSUPP;
> +		}
> +
> +		fep->br_offload = 1;
> +		mtip_switch_dis_port_separation(fep);
> +		mtip_clear_atable(fep);
> +	}
> +
> +	err = switchdev_bridge_port_offload(ndev, ndev, NULL, NULL, NULL,
> +					    false, extack);
> +	if (err) {
> +		dev_err(&ndev->dev, "can't offload bridge port %s [err: %d]\n",
> +			ndev->name, err);
> +		return err;
> +	}

When switchdev_bridge_port_offload() fails after the second port joins the
same bridge, should the error path also revert br_offload and port
separation state?

In mtip_ndev_port_link() when the second port joins, the code sets
fep->br_offload = 1 and calls mtip_switch_dis_port_separation() before
attempting switchdev_bridge_port_offload(). If that call fails, the error
returns without reverting these changes.

This could leave the hardware with port separation disabled and br_offload
set to 1, even though only one port is actually bridged.

This concern was raised by Jakub Kicinski:
https://lore.kernel.org/netdev/20260131015440.972531-1-kuba@kernel.org/

