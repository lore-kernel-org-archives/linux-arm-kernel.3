Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC24D35666
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 02:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Gl4hGtCQ5x6KQhmJaDiXMA9jzWT2O+n+v/Xr8viABg=; b=Y8POiKkHnix6LWBsIroJ4+xzG6
	2F694n/+D0zmnnQDKhh2ekratogmJmkXCCWw0G/zjjvuM9ixnVaSkT6F7u9LQiX0JoRnT9qsE3Kg5
	HjKrFAXe/kgEjEyWgyTXbsAoxSUrgnJ+n/nifH/OsHcgd1Nosc4XS3unfXtBagAidh6xOymyv6NMF
	WYcVPGWrQrKh5mgPTvNgSQjBwOyxbVFR+Ept/mdmbOEOWnYMDD0g2RMFUw4hUtM6tiLTUHy0NTpsf
	Kj3ffL67FKymKJ4NhN0tMCgXQNopJua2HK58gVpHO+pwAJU4eD7w8FUyClwqpu//5+6CK3yS+tUQw
	5F5vy7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvG9-0000000FJEj-3ij3;
	Wed, 28 Jan 2026 02:26:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvFs-0000000FJAW-081K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 02:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D0956012A;
	Wed, 28 Jan 2026 02:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E6CC116C6;
	Wed, 28 Jan 2026 02:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769567162;
	bh=vMscZPC7Wm4F8hG6O11Kv6/ikZ5BwfwyLFx3n8gvzBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jCNRmhuBQjbShiqbz4z31FkueWSDBPkmtn1rJxqTFBzXspIPjbGEAzVXLDAgd1efr
	 MSmmHPpxVDjmAGRVjCh+xx4fIXRbNFWWs6DrHvU+hYAn2hmQvK5SlOlOrMCO4rGt8c
	 iVX3yrMsqOv6g4ch0owr09ljYZH1PwA8p83eVN01KtGUe5mBbBlLe6hPVK1jUXPcyK
	 DcpBM3873zFsafatju0/8VHGPhTm2abxt7qA9izTm+MBpKpQHvW9ihrpTu6d/heT9a
	 XiRVZT97S0cFs5Prmkkk9L2F+IswfLtg+WQZmF+7jm8iqa7Pj0T5VH+uR+RojW+L0b
	 abTanKCTBrgtg==
From: Jakub Kicinski <kuba@kernel.org>
To: lukasz.majewski@mailbox.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	horms@kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	wahrenst@gmx.net,
	pabeni@redhat.com,
	davem@davemloft.net,
	netdev@vger.kernel.org,
	richardcochran@gmail.com,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	andrew@lunn.ch
Subject: Re: [net-next,v20,7/7] net: mtip: Extend the L2 switch driver for imx287 with bridge operations
Date: Tue, 27 Jan 2026 18:26:00 -0800
Message-ID: <20260128022600.4151612-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126103400.1683125-8-lukasz.majewski@mailbox.org>
References: <20260126103400.1683125-8-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patch adds bridge operations support to the MTIP L2 switch driver,
enabling hardware offloading for packet switching when a bridge is
created on the switch interfaces.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c
> new file mode 100644
> index 000000000000..f961b9cc4e6a
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c

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
> +			return notifier_from_errno(-EOPNOTSUPP);
                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Should this return -EOPNOTSUPP instead of notifier_from_errno(-EOPNOTSUPP)?
The caller mtip_netdevice_event() already wraps the return value with
notifier_from_errno(ret), so double-wrapping corrupts the return value.

Looking at similar drivers like cpsw_new.c (cpsw_netdevice_port_link),
the pattern is to return raw errno values here and let the event handler
do the conversion.

> +		}
> +
> +		fep->br_offload = 1;
> +		mtip_switch_dis_port_separation(fep);
> +		mtip_clear_atable(fep);
> +	}
> +
> +	if (!priv->master_dev)
> +		priv->master_dev = br_ndev;
> +
> +	fep->br_members |= BIT(priv->portnum - 1);
> +
> +	err = switchdev_bridge_port_offload(ndev, ndev, NULL, NULL, NULL,
> +					    false, extack);
> +	if (err) {
> +		dev_err(&ndev->dev, "can't offload bridge port %s [err: %d]\n",
> +			ndev->name, err);
> +		return err;
> +	}

If switchdev_bridge_port_offload() fails, the state changes made earlier
in the function (br_offload, br_members, master_dev, and the hardware
configuration via mtip_switch_dis_port_separation and mtip_clear_atable)
are not rolled back.

Looking at cpsw_new.c for reference, it modifies br_members after the
switchdev call succeeds, avoiding the need for rollback. Could the state
updates here be reordered to happen after switchdev_bridge_port_offload()
returns successfully?

[ ... ]

> +static int mtip_netdevice_event(struct notifier_block *unused,
> +				unsigned long event, void *ptr)
> +{

[ ... ]

> +	return notifier_from_errno(ret);
> +}

[ ... ]

