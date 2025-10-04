Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46639CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Oct 2025 09:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqllOZK9U+yuVjLZYWx4gl1axVBFC8c8SSKXlJ5ZqxE=; b=Y77xPA//sx05UwpNM9dyaAZ/ov
	KiIIlBVgnQVk0V8KFjD8FvK/ewV97blFSDJnQriPuATsVF1q1cakTRZZPy6TPX6FMLOcQHd3QFoLN
	aruMIWA+vC0aFpvZZ9GZCDNkF+zwFfTu9cfsX72MYBxbqKMZIb9LCu2lVVQ+0Zb2+tSIrOFwISSSM
	QqUjeI/haCvjQtV/RKQFEeItjnXbqGnT7mOLAe4dvNDkt+8Ddt5NFez/PltHoOnTn4IL6aXhGu7Pr
	XEm5U1q//4FmaUHTDcljdGHflfH4FBXNSM+Fgr5/0WAquu6WsGR/aYStlGIkQCKZeylJkjWEmdsFY
	xV8Xlarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4yZC-0000000Dawu-2r5i;
	Sat, 04 Oct 2025 09:28:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4yZB-0000000Dawn-3i94
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Oct 2025 09:28:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EAF606013E;
	Sat,  4 Oct 2025 09:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72F9C4CEF1;
	Sat,  4 Oct 2025 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759570116;
	bh=tXSdGLKEgFkWWOgWzyr7SPiWmc6rtEPxhddbzExB3sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFIjcC4P7wdEySIshhYn7XmL311iWKwUAsnj/Mz9zZdtsqr/i3sH3GyFL9X45qHOC
	 lOdgnPGa7HbXDHS4DupvYZwO5xJtIWEZNdfqz7k0QZC6iAeZzJI3ISw7RWf2yjOdy/
	 G3DP53ICpW+bw78oY5he2kKSPvI9uI07lCsHxWWG3VSXVfRF3rJisxBNLalt+4+SXj
	 arJXP28gjH0gPsXa7YJP8vfaU8UZ7whwzaB1szMMyVB6qJxkn5ZVDQbxHC6g/eIC7i
	 jEmBEQx9uB/K3DZ63Knt8sn/Nd6blSygL/VvGVR3CBJHNOXrAfjqKZ4XHSqp2a7xLF
	 osOuCEFr25qXw==
Date: Sat, 4 Oct 2025 10:28:31 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com,
	Steen Hegelund <steen.hegelund@microchip.com>,
	jacob.e.keller@intel.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: sparx5/lan969x: fix flooding configuration on
 bridge join/leave
Message-ID: <20251004092831.GA3060232@horms.kernel.org>
References: <20251003-fix-flood-fwd-v1-1-48eb478b2904@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251003-fix-flood-fwd-v1-1-48eb478b2904@microchip.com>
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

On Fri, Oct 03, 2025 at 02:35:59PM +0200, Daniel Machon wrote:
> The sparx5 driver programs UC/MC/BC flooding in sparx5_update_fwd() by
> unconditionally applying bridge_fwd_mask to all flood PGIDs. Any bridge
> topology change that triggers sparx5_update_fwd() (for example enslaving
> another port) therefore reinstalls flooding in hardware for already
> bridged ports, regardless of their per-port flood flags.
> 
> This results in clobbering of the flood masks, and desynchronization
> between software and hardware: the bridge still reports “flood off” for
> the port, but hardware has flooding enabled due to unconditional PGID
> reprogramming.
> 
> Steps to reproduce:
> 
>     $ ip link add br0 type bridge
>     $ ip link set br0 up
>     $ ip link set eth0 master br0
>     $ ip link set eth0 up
>     $ bridge link set dev eth0 flood off
>     $ ip link set eth1 master br0
>     $ ip link set eth1 up
> 
> At this point, flooding is silently re-enabled for eth0. Software still
> shows “flood off” for eth0, but hardware has flooding enabled.
> 
> To fix this, flooding is now set explicitly during bridge join/leave,
> through sparx5_port_attr_bridge_flags():
> 
>     On bridge join, UC/MC/BC flooding is enabled by default.
> 
>     On bridge leave, UC/MC/BC flooding is disabled.
> 
>     sparx5_update_fwd() no longer touches the flood PGIDs, clobbering
>     the flood masks, and desynchronizing software and hardware.
> 
>     Initialization of the flooding PGIDs have been moved to
>     sparx5_start(). This is required as flooding PGIDs defaults to
>     0x3fffffff in hardware and the initialization was previously handled
>     in sparx5_update_fwd(), which was removed.
> 
> With this change, user-configured flooding flags persist across bridge
> updates and are no longer overridden by sparx5_update_fwd().
> 
> Fixes: d6fce5141929 ("net: sparx5: add switching support")
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


