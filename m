Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1558C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 03:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wW6XHUZe7A0L89v9ZQyQbrdJMAy9VIHQ3PLmkH+tRlc=; b=NyLMw+440WmfKGYXUw81W79tzG
	aZHSf+qTt5Hf9fGMpVwfoe88cylhy7k0iIVYBsojnj33oHeUhwjht8Nk35yr4XBTjzOKviOOrI8oB
	OsUqE1YCZRzynk9/jDnY0Lehr4USHvXLIkKOex2bFtdqrMwNubt6h3OEA7eDBpFmPduMUA8Aa/5CG
	eYBEy3v+UmbSOEfWMvQiHRSk4uqQKEe8sAqWY1LrEcTC1HVESgFlPn5OcZr9AnanX48NAkQG/W7Oh
	ZjtyINsLa4td19TqjGhrGIj83mN687P/8rDt7V2diqpKwpvkDvDUmCbIFM8G9OLnnTfgCOHVm7LYi
	UxsvF2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnUpN-00000006Dan-1Ojd;
	Thu, 27 Feb 2025 03:44:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnUnq-00000006DQg-2muM;
	Thu, 27 Feb 2025 03:43:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85080612BB;
	Thu, 27 Feb 2025 03:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9152BC4CEDD;
	Thu, 27 Feb 2025 03:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740627792;
	bh=HRAUJZiaXmc4gvllAhWu+rvpOk514k1RBIfgmxusrUo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dtmgAtm+Qe2PheNsliaKRMSteSGk5zN7eklfKXZ8ucTjoq/tFgrq23nfNLtEFuPJd
	 5vGDqgp0mJkY0URP8UVPlmOKF6rT4poVrSntpgkNHclC6tbtLPvghLxBavUCUZzWoz
	 hRqGJ29uPhdG3NYkMSaiH1BBaHg04ei1MwlCyGLX/f+eJZ/YUpN6gxdMOwfXhOJSdP
	 J7MmCZreolXJdyZbAlZ4ICWvgzIOZPb6VlMDp+HFEFu4WjD2yA1ATKKbNQLNcVKdbd
	 jOuB0zd4ixcsqyiQX2NwkIubjFHu1e6R1IoAhI9dJMA/JwTrvNWe6rFVJ3bJhHaxwI
	 skTFGGCISA09Q==
Date: Wed, 26 Feb 2025 19:43:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 upstream@airoha.com, Sayantan Nandy <sayantan.nandy@airoha.com>
Subject: Re: [PATCH net-next v7 13/15] net: airoha: Introduce flowtable
 offload support
Message-ID: <20250226194310.03398da0@kernel.org>
In-Reply-To: <20250224-airoha-en7581-flowtable-offload-v7-13-b4a22ad8364e@kernel.org>
References: <20250224-airoha-en7581-flowtable-offload-v7-0-b4a22ad8364e@kernel.org>
	<20250224-airoha-en7581-flowtable-offload-v7-13-b4a22ad8364e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 24 Feb 2025 12:25:33 +0100 Lorenzo Bianconi wrote:
> +	foe_size = PPE_NUM_ENTRIES * sizeof(struct airoha_foe_entry);
> +	ppe->foe = dmam_alloc_coherent(eth->dev, foe_size, &ppe->foe_dma,
> +				       GFP_KERNEL | __GFP_ZERO);

dmam_alloc_coherent() always zeros the memory, the GFP_ZERO is not necessary

