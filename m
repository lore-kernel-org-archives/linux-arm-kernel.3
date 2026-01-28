Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61140D35668
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 02:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyTO77UfUW0dgs4QM32VWI21FBjKdwVAkrYFWMpJrc8=; b=uywWyej4Pwg4H2KUaokLxsFQ6f
	VEBZSUImchqaM8y14HZAOVowiCepsXjSi4rE+bHPG2pqTlukEor1H4ymS+CL9LLsjjKlM/LH+v1Ye
	YvJytoIflLsRfIXExGodKJHAavGk+v0peK2gM4qfPJFUifPJ+v5NU+/JopsAO3xAomai/nGA+zu6o
	cIYC/y2wKHRtriStUEQgbAEYbkXos4LKQwhELXPt0WHr7s3+8gCjGC19J3OkTIg/3iD7HKbRiCGYi
	L+7N2vn2FE2gsg0K3uMU9wpp9ZwoysjthSHsiqfQDRbN+iToafk8AluLUneTHoJgTX0arudgmxFqF
	of84fEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvFs-0000000FJB4-2Egi;
	Wed, 28 Jan 2026 02:26:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvFp-0000000FJAI-1Ekd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 02:26:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B783160121;
	Wed, 28 Jan 2026 02:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD74C116C6;
	Wed, 28 Jan 2026 02:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769567160;
	bh=Q+EuPQIrMDkumGQDIIroCkKxLufMqB23kQAquVtEFq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iL0l/Alk/1GYjL6VN8j/jYe67HWVmXuY+ofgPTdFrcTTNYACh63kDrZrJNOvxBAQl
	 5ZLab1ljSqWSkCnVzyfTFYlqxsofkU/A10PuuZBt3ZRlJn5/CQSrbco1NaamcbyOIf
	 z9gZ9bP1nqmvwLm+WgPXasmlom75eBuBmrd5LAuMoOOsFIij3guuA3GFIJKiZZlRwJ
	 xE91JTbm0GzFhu85dyr3Ok+58lUXhW8HuIAwTF8Ex/tMWB8QcoRH3bHGDSINYKW7WZ
	 CxlXADypXwdv1vosUR2zL7wrfFcAY66XTSVpfGxrtklZ81b5sY0R/Rhofc1hrpgrmd
	 6D0heWtJHO4Cw==
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
Subject: Re: [net-next,v20,4/7] net: mtip: Add net_device_ops functions to the L2 switch driver
Date: Tue, 27 Jan 2026 18:25:58 -0800
Message-ID: <20260128022558.4151582-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126103400.1683125-5-lukasz.majewski@mailbox.org>
References: <20260126103400.1683125-5-lukasz.majewski@mailbox.org>
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
net: mtip: Add net_device_ops functions to the L2 switch driver

This patch adds the net_device_ops callback implementations for the MTIP
L2 switch driver including transmit, timeout handling, multicast setup,
MAC address configuration, and port parent ID retrieval.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> index 9c21a3d29c1c..a6424ee1a9d9 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c

[ ... ]

> +static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
> +					struct net_device *dev, int port)
> +{

[ ... ]

> +	/* Push the data cache so the CPM does not get stale memory
> +	 * data.
> +	 */
> +	bdp->cbd_bufaddr = dma_map_single(&fep->pdev->dev, bufaddr,
> +					  MTIP_SWITCH_TX_FRSIZE,
> +					  DMA_TO_DEVICE);

The dma_map_single() call here creates a DMA mapping, but mtip_switch_tx()
at this point in the series is an empty stub that never calls
dma_unmap_single(). Is the intention for this to be resolved by a later
patch in the series? Looking ahead, a4c3fa1c66c9 ("net: mtip: Add
mtip_switch_{rx|tx} functions to the L2 switch driver") does add the full
TX completion handler with the dma_unmap_single() call. However, this
commit on its own could cause DMA resource exhaustion if used standalone
(e.g., during bisection).

Would it make sense to merge these two patches together, or at minimum
have a note in the commit message explaining the dependency?

[ ... ]

