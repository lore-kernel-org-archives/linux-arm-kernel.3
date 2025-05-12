Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014D2C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 17:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDJUHhhqlHmX/9Qz4a9DSn2EZNRQrJ/PdWLbr1/TTeE=; b=hnKaxgz6tFn4MXkokL3Ng1dvDH
	JAPrZG5p+z2PK2Y1bZTHcsy2NhbeJqlY07pj3w404lXC2mRETr/HrXRfNqX5QID82N5kmybTiXJad
	u9DOuK9YwtIWXCuAGyuYBx7ha+sxmhn0GGawxdW23pPZQk4EjIY597Glw2KetIQzejwmc5O9PLYCL
	LCJsFYaH8XjQebtRghqmtSR8CT/R0QOpi1L4KAgK3EBJbdnsFDyt7NaOnZhxEOpYP/e1UnLIsamMI
	tpK/mkTyUcuWe8p9/P7aBvOZT6jhJH7uEG3ht2vELFa+6bKrZZ6GQGd3okd8x2X/rzP3hKFh31X8H
	p82K5mqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEX5f-0000000AE8X-2pef;
	Mon, 12 May 2025 17:37:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWqp-0000000AC9q-14Dw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 17:22:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93110445CC;
	Mon, 12 May 2025 17:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D2DC4CEE7;
	Mon, 12 May 2025 17:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747070522;
	bh=soJO4A4AjQPFXEEm8Vly+9M2b9nOAfW43rupkSUMSm8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H800bMg9hqnv8v4VunViEWyxpF50Txz38vqJV4wqjgqkT2GMc+bvhjjfbDC3MQy6m
	 Km+rrH7e3IAP1TXIkFgg2lhUj8Km6xdpcPjsJJpr8Tb8LQ6RGLKXThqMgr5KG5gBRH
	 nJNNeqd3U9ltFLsSyXfiTUt3vQPR6oDCiVpCORJog11+UHcE8hLnl9UFGvGwkhDSRq
	 F+4HQfrDryePQ7z4LGqJejC5OPcKaJNLayof8ygKBMpPIeOotQt04MepQQRGJVtcsj
	 QoI8bVW24RVdRcmz4R9eCXWwMPffw6ZnG9mxSHshIZBfwVkMNg4jBnBudov/2XHGku
	 a1oJc3O8R/vnw==
Date: Mon, 12 May 2025 10:22:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, Richard Cochran <richardcochran@gmail.com>,
 Furong Xu <0x1207@gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: convert to ndo_hwtstamp_get() and
 ndo_hwtstamp_set()
Message-ID: <20250512102201.01a695c4@kernel.org>
In-Reply-To: <20250512143607.595490-1-vladimir.oltean@nxp.com>
References: <20250512143607.595490-1-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_102203_318310_D51B7FD2 
X-CRM114-Status: UNSURE (   6.83  )
X-CRM114-Notice: Please train this message.
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

On Mon, 12 May 2025 17:36:07 +0300 Vladimir Oltean wrote:
> -		netdev_alert(priv->dev, "No support for HW time stamping\n");
> +		NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping\n");

coccinelle says:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:594:29-64: WARNING avoid newline at end of message in NL_SET_ERR_MSG_MOD

Feel free to repost without the 24h wait.
-- 
pw-bot: cr

