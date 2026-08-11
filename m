Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F592C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 17:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KO+GQvTpU4Dc3+Qb0U26Z5L427UcMiAqmtgW7rmBTdc=; b=BIrLY+2sfSravVx+lrcQ0CNArk
	x/4LDKQJFaYrRsoW8hOUZ82AJfer5Mb85MBHjlkheCdxUZsYfgwfADTJr0de21FVl8uNm1We+nybj
	9cduuZTth8J427DM4yPNIrHgJtpLvFiyu5zZGeg+SsxrIVbSVQk0tzKpFZECQmO+JRtIofBcp+OuM
	x66OP6gkbejBIaia6sfskwctSiZ71vcHukXfMgoL9HeaXi7hbcjffMnU2tKyuAVketEY1oeXGZsIJ
	e9WDUT3guux3ZHa3cXR5B1nvaCM3aoO021GG71di/jo6NQe0omaXNZp+F/TKUGAIkDhC0wpFQhjji
	a/vLt3gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpqM-0000000EZxI-3Ojx;
	Tue, 11 Aug 2026 17:00:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpqJ-0000000EZwZ-3jQ3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 17:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KO+GQvTpU4Dc3+Qb0U26Z5L427UcMiAqmtgW7rmBTdc=; b=g2BeTUvik9NjlHPterAuR2rOUg
	egfqQJPDxuvzH/9QEOFqEtCqi7zfx+0Mr4nEq7o7uAYfDH6MeoDDctIvbAigkRTTK87j/Z/GbZiQI
	HYbwFkacDo0f93SMBoZLxhfIWs8i6bLNnDJyahrwknChr8kZews9SFEZn/iPJT8Wfcz4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wtpqC-00H82l-Aq; Tue, 11 Aug 2026 19:00:40 +0200
Date: Tue, 11 Aug 2026 19:00:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: phucduc.bui@gmail.com
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: xilinx: axienet: Propagate errors from optional IRQ
 lookup
Message-ID: <81a38486-d4d8-4ca2-8d22-d3d178c17665@lunn.ch>
References: <20260811034715.6034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811034715.6034-1-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_100047_926538_647E6993 
X-CRM114-Status: GOOD (  15.50  )
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

On Tue, Aug 11, 2026 at 10:47:15AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagated.
> 
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.
> 
> Another call to platform_get_irq_optional() in the same function already
> handles the return value this way. Apply the same error handling to this
> call site for consistency.

> @@ -3047,7 +3051,7 @@ static int axienet_probe(struct platform_device *pdev)
>  		ndev->ethtool_ops = &axienet_ethtool_ops;
>  	}
>  	/* Check for Ethernet core IRQ (optional) */
> -	if (lp->eth_irq <= 0)
> +	if (lp->eth_irq < 0)
>  		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");

What has this change got to do with what is described in the commit
message? If you think this is a needed change, please put it in a
commit of its own, with a good commit message.

	Andrew

