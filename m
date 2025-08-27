Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDB0CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 18:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jALJDGR5muHNEHQHO515jfWtFn/DpI92ODDzJD/5Z5U=; b=mEqiU/wY3iejaU
	VKV7F+399eXRIOphbWLt6RaRAxZjjPE2lMKM81SkNHldxcyxDQrvyt1WYjjX2uWBrKQzMMGguDIr+
	rvGOHC11DvVl6+RBz8Cp+IlJeKrN5T5ZPbPjYIuNK3wnS8RfTb28f6v75HthtBzHKIk/7xXvf5L3d
	RrQAL6mvr0/btJnv3UwEiOVztiDKfDY2eFV26PheRuUlVaQQwx+AM0uKVTaO6UO7Lm6f+R2hXnmE1
	0ZdSDOEnzJ0JQq2VYyLFlQ32agIyE+kGp61IcVoyNnbO16lTr7bNBzyNotetA0nyMsP9qpCNCw4Ro
	/BExpdzFTF6bfsppZE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urKRi-0000000GOyW-1Wif;
	Wed, 27 Aug 2025 18:00:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIhD-0000000G8Fc-1oeI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0214243878;
	Wed, 27 Aug 2025 16:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4E8C4CEEB;
	Wed, 27 Aug 2025 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756310902;
	bh=SxfV7g3bJ3UTbiAX8JrQoOzoxVhuSn7Pvqg2XycEaKM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lrkvv4e7eJQy4Zz5yfvpinu/QMxwq/F8HNUwdmLBYgqHcq+FrQRwdSjHI/2hfYUXh
	 bqPW0Ugqtkbytgn+i8GsSDSGSLvyBmdQkZXfr2cEyjJrrcVRqcfyyaoGjuN2cIPssx
	 J0TY/n+tPQusZrDU3Dxo3AYCDWo5Ami7+Rih3hT6ZYAL+n+50F3vVm0riyeIGJMicK
	 KG9aS6zxE6emkOMe1JIxRy5YlI98UClzkWAFzf0KPxH4GeJ3r3gqXHZVj4rShTTFpK
	 6gRK8WpLbR1w1AxwE6e4UtZKFJqO81EjSl2tb3z2tUhwfA5UfnkEjHmpBOV/12Vc+J
	 iixZ9MZ9UQG7g==
Date: Wed, 27 Aug 2025 09:08:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v14 4/5] net: ti: icssm-prueth: Adds link
 detection, RX and TX support.
Message-ID: <20250827090820.12a58d22@kernel.org>
In-Reply-To: <20250822144023.2772544-5-parvathi@couthit.com>
References: <20250822132758.2771308-1-parvathi@couthit.com>
	<20250822144023.2772544-5-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_090823_495553_F31F34BA 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: pratheesh@ti.com, vigneshr@ti.com, praneeth@ti.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, saikrishnag@marvell.com, m-karicheri2@ti.com, bastien.curutchet@bootlin.com, mohan@couthit.com, jacob.e.keller@intel.com, pabeni@redhat.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org, conor+dt@kernel.org, alok.a.tiwari@oracle.com, richardcochran@gmail.com, johan@kernel.org, prajith@ti.com, rogerq@kernel.org, basharath@couthit.com, ssantosh@kernel.org, vadim.fedorenko@linux.dev, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, kory.maincent@bootlin.com, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 22 Aug 2025 20:09:16 +0530 Parvathi Pudi wrote:
> +	struct net_device_stats *ndevstats;

> +	ndevstats = &emac->ndev->stats;

Please don't use netdev stats, quoting the header:

	struct net_device_stats	stats; /* not used by modern drivers */

Store the counters you need in driver's private struct and implement
.ndo_get_stats64

> +	if (!pkt_info->sv_frame) {

sv_frame seems to always be false at this stage?
Maybe delete this diff if that's the case, otherwise it feels like
the skb_free below should be accompanied by some stat increment.

> +		skb_put(skb, actual_pkt_len);
> +
> +		/* send packet up the stack */
> +		skb->protocol = eth_type_trans(skb, ndev);
> +		netif_receive_skb(skb);
> +	} else {
> +		dev_kfree_skb_any(skb);
> +	}

The rest LGTM.

