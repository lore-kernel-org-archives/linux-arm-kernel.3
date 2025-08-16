Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE69CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 01:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SereSk3IzSe+yevYM2dBIaiMU9ZL/2lmkZoD0P6WcpY=; b=UAAARzsAgN9NiQ1OOUM7fTAqUT
	cmzWy/l21Vq8uM+pgmBQbmEB9ITKph+qh6jKV4uzK2u/XdnOsosBN1sJIU368eEclpAFLrCZCiAc3
	8S6jeETJjIrrs/kfWSZkk1X0rRNLRVRoOzrfGoqbDZJ+JvFmVdiHQznXriIuSeFcVda1CWAsDF5rW
	kfZdAD0R7ylEwLzqHbjNNo6ocNTeXwID3Y3aZ4VbSolKDTZ3Mdu/H8PDOdgfkReb/2hxhgJX4Fu6+
	Cx1UoeBG3FNRHbDroCS3XDu7gwf7jixpIJ5L5Yr4RDMwRFJ6auwdX77/hmG90js9ib/hDz1gwhgka
	fawgS1rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un5mJ-00000003rxc-1j8z;
	Sat, 16 Aug 2025 01:32:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un5jg-00000003riQ-26SS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 01:29:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97C486141C;
	Sat, 16 Aug 2025 01:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA582C4CEF4;
	Sat, 16 Aug 2025 01:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755307771;
	bh=DDOaVcjvN+Gdp6VEXtKQ3oqSO2YyXy4+KuhN05/0C/o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JB4ABSy62DS6ltXeHJdz3vKd7MkTxYq7DBvqNQnUQH7rWclUeZPUo3N2Mw4kfsVQ4
	 9hpPhf5poMiiyABewuY965yhMOLFf81FGFtyr2C+MUN5jpsOK/cikSam3/qjh22KMe
	 oKIeXTvzK0cIbK6FIZdUAINMSDXD7JDV77XYuy5S+auVihFqABEqfpFT+hOVObVY4y
	 2RkYWy9YnE2f0zu+U7bnH/93kRicuVtbO6Z8IbaGDIFGlNplDj7zmzRLjx4/+ghL+7
	 1SprBtEO+jrSYabo6qrpTb2OSstSXjeqmx3aVpWbkGnzywtQncaeAFh153JPABfMfb
	 828YJ8+KqjKtA==
Date: Fri, 15 Aug 2025 18:29:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukasz.majewski@mailbox.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v18 2/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250815182930.196973bb@kernel.org>
In-Reply-To: <20250813070755.1523898-3-lukasz.majewski@mailbox.org>
References: <20250813070755.1523898-1-lukasz.majewski@mailbox.org>
	<20250813070755.1523898-3-lukasz.majewski@mailbox.org>
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

On Wed, 13 Aug 2025 09:07:50 +0200 Lukasz Majewski wrote:
> +	pkts = mtip_switch_rx(napi->dev, budget, &port);
> +	if (pkts == -ENOMEM) {
> +		napi_complete(napi);
> +		return 0;

And what happens next? looks like you're not unmasking the interrupt in
this case so we'll never get an IRQ until timeout kicks in?

> +	}
> +
> +	if ((port == 1 || port == 2) && fep->ndev[port - 1])
> +		mtip_switch_tx(fep->ndev[port - 1]);
> +	else
> +		mtip_switch_tx(napi->dev);
> +
> +	if (pkts < budget) {
> +		napi_complete_done(napi, pkts);

Please take napi_complete_done()'s return value into account

> +		/* Set default interrupt mask for L2 switch */
> +		writel(MCF_ESW_IMR_RXF | MCF_ESW_IMR_TXF,
> +		       fep->hwp + ESW_IMR);
> +	}

