Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41208E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbvIMH5+pmJeLk2Ms9sMvM9Wx9MqPeOBr+0S5rSdz30=; b=pcu7Bbrbzj3oFNx6CnwzTDVWiW
	ENZk0zy97MqGiKdwk4ti+dhDZ0C79AZxqrdB5LrBSbWmJCA6S5jtfid5P5OI8YZzFGjRMH+yqB5QS
	ESjHqICZNsDb2gg6AzqCbIa57xCaeP/+qNxjJDRVKPhnm/WxdO4fJj4vO7gIHgwCARdHse95q2ehq
	t8EfG64PnEHqbz6UTUjDTqrd5WfKMYOepmcYHz9RJBhFbFyUfedwfYwjGH9jYvhSj2/QDjuE8bmct
	LWT4yyY/2TwqJ7mTBwYS/UAFCJ1n/I8Wrcyo7gtWqTJh9X60PSsPFafaOLtxu1XJ802Gpsf4xU/8P
	OQnpbOOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYtw-0000000DpI4-1fXW;
	Tue, 17 Dec 2024 14:50:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYsp-0000000Dp47-0kKS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 932475C44DB;
	Tue, 17 Dec 2024 14:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC30C4CED4;
	Tue, 17 Dec 2024 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734446950;
	bh=S5/ik6fbwrpyH3KSs+GVUj/CwVH+gNMOhnzP7q730h0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IqHQ23rNJvtV2zSWtz1Es0/zYfqBOVMSlTnIkbbPmk2R1d5jMnegR/jaVbOQdNwy5
	 FVMq/xQd+jsedpESIGo7NCI+aQtoUtPuU4EcrT9DeTBmDfAD+h/at4RRBKhpQx0w5V
	 /mj54HSZ1Cf0TzeGBfxwsSywidecWbwuBpOd4MY6kcKUsY6fOihCe+DXedu6u0rHV7
	 upgf8hqlwkc9fm/M6L00ZcFJKs2XC2JRXZJCdeacJ3PKJagahHY/fjLsE9YjOLiXy+
	 0GOsrJH+VuoIhHw9kzWHb/6mIVDM3SZZTxhTIBN4Cuxw7LnRu1ABU0nBAz8s3An6Rf
	 WSlKf7rBrlnEQ==
Date: Tue, 17 Dec 2024 06:49:07 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-socfpga: Set interface
 modes from Lynx PCS as supported
Message-ID: <20241217064907.0e509769@kernel.org>
In-Reply-To: <20241217135932.60711288@fedora.home>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
	<20241213090526.71516-3-maxime.chevallier@bootlin.com>
	<Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
	<20241213182904.55eb2504@fedora.home>
	<Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
	<20241216094224.199e8df7@fedora.home>
	<20241216173333.55e35f34@kernel.org>
	<20241217135932.60711288@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_064911_260304_D920946A 
X-CRM114-Status: UNSURE (   8.66  )
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

Let me triple check ;)

On Tue, 17 Dec 2024 13:59:32 +0100 Maxime Chevallier wrote:
> - The priv->phylink_config.supported_interfaces is incomplete on
> dwmac-socfpga. Russell's patch 5 intersects these modes with that the
                                   ^^^^^^^^^^
> PCS supports :
> 
> +		phy_interface_or(priv->phylink_config.supported_interfaces,
                              ^^
> +				 priv->phylink_config.supported_interfaces,
> +				 pcs->supported_interfaces);
> 
> So without patch 2 in the series, we'll be missing
> PHY_INTERFACE_MODE_1000BASEX in the end result :)

"Or" is a sum/union, not intersection.

You set the bits in priv->phylink_config.supported_interfaces.
Russell does:

	priv->phylink_config.supported_interfaces |=
		pcs->supported_interfaces;

If I'm missing the point please repost once Russell's patches 
are merged :)

