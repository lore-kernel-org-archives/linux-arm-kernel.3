Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F11C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 00:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xur8hs8BfN3yvBe6ZczBsztqT5EKjZoG4BgLL2OfChc=; b=BsXSQ7T414XXxCY+9Nf4vUMfqZ
	y++yn/p1Pkj40RbRnlrLosBfLSnKcnkh8zU3CDDIhfT4hR6tKwgDUwhaH6KuIcibTITnACvHNcC5/
	lXyOdvN8WKwHaAAmat9FsWr92X7/2rcOwnR6bfkZPIPRtNuPyG2kYqkTNQuDkhGp4MkgaXrXK7sz/
	dIyOIQypA+NMn+mFPfGXK7RaQjTIRLf3A2TndU3TEPc5BcRO5aqcCoXkdagsTaYvqYVK2AilxR+QX
	pY6N9lz4Bqe3tQPHBroFBROIb/5fzcTf7ehoedLL+mWU76T5o5n1cWEXRZqwWvb+qjuuuZ9gHl2lC
	XQb3A0yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAekF-00000000Rzz-1RmH;
	Fri, 02 May 2025 00:59:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAeiK-00000000RpP-2QqW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 00:57:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92F4B5C4763;
	Fri,  2 May 2025 00:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C32C4CEE3;
	Fri,  2 May 2025 00:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746147435;
	bh=MoqpqiYmYsjQ16yN73Y7SVxbPLWAuOZzKEnuNo+e/Lw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KoKfvxiYkOFnahr34ekNz23PL+yeDdfBJIyL5MdW8IwgD0IxzGRGB6VjzXjXmh1aJ
	 at5E4VYqg8hLg0DsqD41btJu+cgTTmJNJbd1+qVpO+4kMU5UKr72cev98KbpnZMQ5b
	 +1LI5ukrFFsaiVwKcG+5V/1/p4aEGnSpzQiiuv4JlZfMLolyRq6Vg5Zka5FBjltgpQ
	 MUgpUz5K9yhFMDyypTBEHbytEUITAt/a375ixRBuBqq3IkwcYzPju4XV6fNUb3uy0e
	 hnJIGJYYxS+gPLYSfTCKwsOvOelO/wDOLQLT2QnTuJgcG3zgydww5cKZqmskvfJC2E
	 2INRE/s0errdA==
Date: Thu, 1 May 2025 17:57:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
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
Subject: Re: [net-next v9 4/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250501175713.54aa656e@kernel.org>
In-Reply-To: <20250430051756.574067-5-lukma@denx.de>
References: <20250430051756.574067-1-lukma@denx.de>
	<20250430051756.574067-5-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_175716_663913_258AA92A 
X-CRM114-Status: UNSURE (   7.90  )
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

On Wed, 30 Apr 2025 07:17:53 +0200 Lukasz Majewski wrote:
> +static int __init mtip_switch_dma_init(struct switch_enet_private *fep)
> +{
...
> +}

> +static int mtip_sw_probe(struct platform_device *pdev)

One more warning:

WARNING: modpost: drivers/net/ethernet/freescale/mtipsw/nxp-mtipl2sw: section mismatch in reference: mtip_sw_probe+0xa50 (section: .text) -> mtip_switch_dma_init (section: .init.text)

We only see it with clang, not sure why. The warning looks legit.
-- 
pw-bot: cr

