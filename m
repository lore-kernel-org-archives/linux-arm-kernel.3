Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13BAD73EB3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 01:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFmhiJAdGMJT3jItiXuGig1gXZLu2fOLM9zrzS4xCKE=; b=BhJkCd1l+kdqOIYhvAVWOfNmZJ
	8qk9EAJUwGvS+Egmcsuq/s/u17T/qC1KWZ7xQW2rhebd+3FS0MTpoL0VBsOAH/bFC+7SlZMhWb79X
	Ce1V0gDRIB9pLLVp6nBm+oGQ9ZLTUKAsHkGcQauARUf39IWQF5HvyFXks8jy4Z831xyZ0KD1HozvI
	MIETO0yLJTRmtNYoNDJg40hhpm1SafQl1HKwQQsQ7KaFn5+F25RxaQqpLiGeBu9u0DgfZZbBPWZBS
	dfm1c4cZxF3eDxidbmFiZtNtfo77w6cuh2Nrv0sJSnhyw7I7t6KZrR4uJkooyucHth8w1nVZMWs+y
	Q4CJydHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm0CF-00000002D4B-0Eh3;
	Sat, 31 Jan 2026 01:54:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm0CA-00000002D2d-2qHG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 01:54:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 644A0444DB;
	Sat, 31 Jan 2026 01:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B21C19421;
	Sat, 31 Jan 2026 01:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769824482;
	bh=TsyqeOrPuckAqP0Hj4KXTJnB1l2bVSsm7IOcY61ZTe4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PkPomI6Q0yax9KU0rc40lebfnQzP7qWqBJUMuw1c0L65LGVBshpN49QaTGfvBXj85
	 Hqq97zQvMxDDTgzkyFjphw/VBXKvzGRMPPMp/OG6yjF55IPgywh3+WAVwIBoqI2XAE
	 J0IepQAxgBIIuUA5WbNvpGXEsLcwGISZWy+B8tEkLtdYlYTvnxh5SYM5p8itnPIk3y
	 f0IIfMzUCqNkuJUo0YJn1azFrKMDJJRsgH1GAElPnfzDWyjpnob5MN5EZcAHEjCztX
	 IEQT5lpGe3zs5gVXOTHKs7niJbJDTXA+sCiBqsbs6H83yvq5J5XblNJmkEiyClwD/W
	 Rf8nHrg+IaUwQ==
From: Jakub Kicinski <kuba@kernel.org>
To: lukasz.majewski@mailbox.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	devicetree@vger.kernel.org,
	horms@kernel.org,
	krzk+dt@kernel.org,
	s.hauer@pengutronix.de,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	richardcochran@gmail.com,
	shawnguo@kernel.org,
	edumazet@google.com,
	linux-arm-kernel@lists.infradead.org,
	andrew+netdev@lunn.ch,
	pabeni@redhat.com,
	wahrenst@gmx.net,
	davem@davemloft.net,
	festevam@gmail.com,
	conor+dt@kernel.org,
	imx@lists.linux.dev,
	andrew@lunn.ch,
	robh@kernel.org
Subject: Re: [net-next,v21,7/7] net: mtip: Extend the L2 switch driver for imx287 with bridge operations
Date: Fri, 30 Jan 2026 17:54:40 -0800
Message-ID: <20260131015440.972531-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129110154.1699976-8-lukasz.majewski@mailbox.org>
References: <20260129110154.1699976-8-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_175442_758826_9BA13700 
X-CRM114-Status: GOOD (  15.35  )
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
> +			return -EOPNOTSUPP;
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
> +
> +		fep->br_members &= ~BIT(priv->portnum - 1);
> +		priv->master_dev = NULL;
> +
> +		return err;
> +	}

When switchdev_bridge_port_offload() fails, should the error path also
revert the state changes made earlier? Specifically, when the second port
joins the same bridge and passes the bridge check, the code sets
fep->br_offload = 1 and calls mtip_switch_dis_port_separation(). However,
the error handling only clears br_members and master_dev.

If switchdev_bridge_port_offload() fails at this point, fep->br_offload
remains set to 1 and port separation stays disabled, even though only
one port is actually bridged. This could leave the hardware in an
inconsistent state.

Looking at the TI cpsw driver for comparison, it modifies br_members
after switchdev_bridge_port_offload() succeeds, avoiding this ordering
issue.

