Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EA7C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 01:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXq5s6eE9x6BKNrCxAM8dIL3mN6SSMsXJ035JaOrO78=; b=pFFW9sZ959lNsU
	SmajzN6UyqZf2GP/Vclj5Ke/8ZpdTDXHkwQxm75rRB2WGmHKhYtgCTiO1O3tgzumsvypLes93x2bi
	IRheZMHhSyuC93U+SKE9+UYINIcmGwcWm/cRA8bTlSdGqiC3g43riAIdVLvuKN/GfTti7F+PGGpi2
	OeRqaawIHUGz4+QQQJ7XoyyTp4SxcD9xUylvJWeBK1p5U14qdq3O4diWkqq7tH111PpPIgkdAm1Ko
	DvgAxUZayjhsRUweLp1/GZC8VK4vsD4WRPd4pcnbhFuiXrpV4t8F+l3lt+EEnaM8ilVejziTLKC/+
	uFP+INF9KEwiLdbIDWow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZJDl-0000000746t-2xWd;
	Wed, 09 Jul 2025 01:03:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZJBO-000000073VH-3UY2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 01:01:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 232D75C6536;
	Wed,  9 Jul 2025 01:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282BDC4CEED;
	Wed,  9 Jul 2025 01:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752022869;
	bh=K1gtEVcxaVd2y4FMGLAeW2csYcsmmqWlWQd+W6jNQC4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LZJGLBA7gOIUXO/NWjGr7suEmwSrwlz17LMRANZmRa8WisuRO6amGUtqRa8bxE8Jj
	 B3mbjISZnBLf0eBNLoKDcDiLLUOGtGWaTi4cjRdX5v0oSlEZTAMu0qyHbCZqtlkbU7
	 sftbBIqDNNAcVRlBVhqBJeOJfKBOW/I15/3vtTZfcgBinn9x+YiAVJ3Vm7xij9rgLK
	 tpLFC7gaVV3fgQLJIw3Dfpwbk+MuA7+3HK/6j0HUXosPFdKWEnAPmd4/I4qrPYypZ+
	 Zley5r/mZUxpJ8lz34h+OcB0NWXOs+StSoVo6J80QB7qPZdsYcV1jgt1wSuYa4vwdO
	 fNEU0kuqVJWUQ==
Date: Tue, 8 Jul 2025 18:01:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v10 04/11] net: ti: prueth: Adds link
 detection, RX and TX support.
Message-ID: <20250708180107.7886ea41@kernel.org>
In-Reply-To: <20250702151756.1656470-5-parvathi@couthit.com>
References: <20250702140633.1612269-1-parvathi@couthit.com>
	<20250702151756.1656470-5-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_180110_913323_B9858A66 
X-CRM114-Status: GOOD (  12.69  )
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
Cc: vigneshr@ti.com, praneeth@ti.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, saikrishnag@marvell.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, mohan@couthit.com, s.hauer@pengutronix.de, prajith@ti.com, rogerq@kernel.org, basharath@couthit.com, ssantosh@kernel.org, vadim.fedorenko@linux.dev, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed,  2 Jul 2025 20:47:49 +0530 Parvathi Pudi wrote:
> +			if (emac->port_id) {
> +				regmap_update_bits
> +					(prueth->mii_rt,
> +					 PRUSS_MII_RT_TXCFG1,
> +					 PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_MASK,
> +					 delay);

Instead of breaking the lines up like this you should factor the code
out or find some other way to reduce the indentation.

> +	qid = icssm_prueth_get_tx_queue_id(emac->prueth, skb);
> +	ret = icssm_prueth_tx_enqueue(emac, skb, qid);
> +	if (ret) {
> +		if (ret != -ENOBUFS && netif_msg_tx_err(emac) &&
> +		    net_ratelimit())
> +			netdev_err(ndev, "packet queue failed: %d\n", ret);
> +		goto fail_tx;
> +	}

> +	if (ret == -ENOBUFS) {
> +		ret = NETDEV_TX_BUSY;


Something needs to stop the queue, right? Otherwise the stack will 
send the frame right back to the driver.

> +static inline void icssm_emac_finish_napi(struct prueth_emac *emac,
> +					  struct napi_struct *napi,
> +					  int irq)
> +{
> +	napi_complete(napi);
> +	enable_irq(irq);

This helper has a single caller, just put the two lines of code directly
there. And use napi_complete_done(), please.

