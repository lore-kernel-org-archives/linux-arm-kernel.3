Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C9EC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 06:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3skZsSAWHWds/Pvaes0a2uYpJ5JahEApGQi1xCYVmE=; b=XFAJ1LS4ecfM/kglPZbuvbwi4u
	0aOan89SaSNuD3ElJCW6HN2g3oBAW9v7Yi45dTayC+hZErJVc5Wr4mxhGeoBjsWWlgwoEEij1n63F
	rFsVZh+XTUMuWYUmJsN+C9bUTjTJg5G1yz6l+7UhMAvp5h1J3u2ACZG0yZFlr7fkoBLnorsQNwwtg
	ndC0s2Wk8NHTyfDWH19HI5AxJzgyuikLoO4OZ4wLV+T1VReauSXn6K++OR194qXmUMVnrqUS7W4OA
	o3R+Gb6hVaylPO7/mU0+t3u0hstFHZkhx/peYa/UfPSTYHFSR3TasZ1smWkkjAhFj1AVVrl2KuapS
	wwzCXVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woF9W-000000023j3-2feQ;
	Mon, 27 Jul 2026 06:49:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woF9T-000000023ig-0xyO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 06:49:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 72DF11A11E5;
	Mon, 27 Jul 2026 06:49:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43113601BE;
	Mon, 27 Jul 2026 06:49:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC97D11C1205D;
	Mon, 27 Jul 2026 08:49:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785134957; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=L3skZsSAWHWds/Pvaes0a2uYpJ5JahEApGQi1xCYVmE=;
	b=0/6VQATyYeKE4urAK9n+dItmhfCVw/3COJXVsJL3ynqnTquInpzp1c37NZki8Xg5Dl9Lq7
	BzGCUA/tBnHLP+G6VJhwP0ymg+sMBH6CDo+IXjyYOVn++MYVxGO2ZvXIrcV/heWrCdk9Hr
	ufpuDArirUX0lJ0RCkymckijtF0Acc6SWx+eIqw1fTxaeKBKCKzkw+RskNCUhJckD0NHqO
	9VSlEgefgCgemycRjqZ8ZZnWeem01fa/cn/Fpi4Zbs0auY+brJceRf2lKFVvjG11k2MhBB
	gcLJ4sxlVRUboGtBMU4aaSEGO6z4HkopkxHlOg4TO5dA6m9b7Y06vC9HW7bbmA==
Message-ID: <f14a1712-8315-4e64-b23b-ac00d7f82c3a@bootlin.com>
Date: Mon, 27 Jul 2026 08:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: Fix PHY attach when custom
 PCS is in use
To: Zxyan Zhu <zxyan0222@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Hariprasad Kelam <hkelam@marvell.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260726132618.3580612-1-zxyan0222@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260726132618.3580612-1-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_234927_438699_BD014999 
X-CRM114-Status: UNSURE (   9.50  )
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

Hi,

On 7/26/26 15:26, Zxyan Zhu wrote:
> This series fixes the issue where stmmac platforms using a custom PCS
> via the pcs_init callback fail to probe when no phy-handle is specified
> in the device tree.
> 
> Patch 1 is Russell King's phylink patch that relaxes phylink_expects_phy()
> to allow PHYs to be attached in 802.3z inband mode.
> 
> Patch 2 skips the PHY attach in stmmac when a custom PCS is already
> configured via priv->hw->phylink_pcs, avoiding the "no phy found" error
> for platforms that manage link state entirely through the PCS.

I've tested this series on the board that saw the regression from Russell's
first attempt, and now with the associated stmmac patch, it works :)

Thanks for that, for the series :

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

