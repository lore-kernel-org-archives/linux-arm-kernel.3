Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27065C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Szu5ukrfYXfTm6C9Qb878RxirJPyxaH86BgGzOTkErk=; b=QJanuLf5lBgwye4dK3uqosPttc
	rXPhw7o5dMp7qD0KAeX2UObEv/j5U1DV0sgyCYYd4U/4WJmZu6+/xawH9KPq2GoRGq6JqcxWlW/hs
	deuvp5xUDxXcn5/F4xLN8dgsgkDFk6wrJzfFuoNLmPi0ORTPh5o6MKd1yNJvwF4Gi6C08aIUS/KCJ
	yobQFjwUzt/vhAQRd/4hEw1niuXq0MzrGA6J/6CcdmLk/6Iehag/lbOJj56EG9dfo+Vtbekl9iLsx
	GmmqULjhPdwGYmbnxp1QJxq5eukBnyfzpPl776Y/+hsCSLJnxOmJ1WfW5bG3cwPSKjMfqBlFS+c6V
	fKFffPBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VIm-00000007Uru-23YO;
	Mon, 28 Apr 2025 20:42:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9V6e-00000007TM7-07vd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:29:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA8C55C6439;
	Mon, 28 Apr 2025 20:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED834C4CEE9;
	Mon, 28 Apr 2025 20:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745872173;
	bh=JEKRoGYDYh7GpfLKStdeDdeGx4K/HvHNWFPdi0kDiGk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sygfhLrR2KlkmM8Ef+lvuMO/+7q+Gb9e1Wkr3oSZAb+rneLJg1kfHDgpNpdgZJtek
	 QFtSj3g9yjAGQkMIrhNmhNeysFDzGGUCcLkngMrJ1QMvHwFbJCa/CDtZhoG+C4zZFc
	 dtGXoilUEPAeRszU2JSGKjKyu7EdMf5dok5/FBLTDOOPIHeL72WmPPWOKiqqSZZZmo
	 WVr5x6KxpBnqDP/NBXBauIjm3tQLOGfDS8M3blQiED5Ty/puxt+C4icsk1MbIWVADj
	 1QcM0WuUIu0lvQGCO5RQahGZOCor0Flwa625vQdBXvS8Ky6xp+TogRvEKbZJ7bwJoM
	 MrfsV1L2iReFw==
Date: Mon, 28 Apr 2025 13:29:32 -0700
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
Subject: Re: [net-next v8 4/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250428132932.273fc568@kernel.org>
In-Reply-To: <20250428074424.3311978-5-lukma@denx.de>
References: <20250428074424.3311978-1-lukma@denx.de>
	<20250428074424.3311978-5-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_132936_156450_7C44FD80 
X-CRM114-Status: GOOD (  15.40  )
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

On Mon, 28 Apr 2025 09:44:21 +0200 Lukasz Majewski wrote:
> This patch series provides support for More Than IP L2 switch embedded
> in the imx287 SoC.
> 
> This is a two port switch (placed between uDMA[01] and MAC-NET[01]),
> which can be used for offloading the network traffic.
> 
> It can be used interchangeably with current FEC driver - to be more
> specific: one can use either of it, depending on the requirements.
> 
> The biggest difference is the usage of DMA - when FEC is used, separate
> DMAs are available for each ENET-MAC block.
> However, with switch enabled - only the DMA0 is used to send/receive data
> to/form switch (and then switch sends them to respecitive ports).
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Linking fails with allmodconfig

ERROR: modpost: missing MODULE_LICENSE() in drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.o
ERROR: modpost: missing MODULE_LICENSE() in drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.o
ERROR: modpost: "mtip_forced_forward" [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined!
ERROR: modpost: "mtip_port_learning_config" [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined!
ERROR: modpost: "mtip_port_blocking_config" [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined!
ERROR: modpost: "mtip_port_enable_config" [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined!
ERROR: modpost: "mtip_port_broadcast_config" [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined!
ERROR: modpost: "mtip_port_multicast_config" [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined!
ERROR: modpost: "mtip_switch_en_port_separation" [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined!
ERROR: modpost: "mtip_register_notifiers" [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined!
ERROR: modpost: "mtip_unregister_notifiers" [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined!
ERROR: modpost: "mtip_is_switch_netdev_port" [drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.ko] undefined!
WARNING: modpost: suppressed 3 unresolved symbol warnings because there were too many)

