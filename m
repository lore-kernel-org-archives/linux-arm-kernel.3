Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF489C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrCtCQOVAGw4hlc72vY1O4djToo7fnbmZ9mj9ihMSmY=; b=f0OJjTg/KD9/fBnn7m5ZPPYnIP
	nkNBEchHGABO+LAKRdk/tRQY7YSwBDax4v1tKyCvE+Pt6EnmrkIA1DMgZdk0xBdndQMertvhozANq
	x/1H/yzJ+cDOS4AAwm0OqXi+9uK45/vi3OgtDvdrFSxdU085X4tN4xGJym92c0eYICfejE7M69XTj
	chR8VxlsT1sFntGkpXQ8hS9K6rJ+vMVkkFzQHPzKp80SK1Y9jYaxRJWZ40HiMOBByI6UmODkLgrDE
	S6U7ehut/7bOEMNp52g/EMSFJ+C8ChkdNEWtO1gqk9ArdgQ4cxiBwVjh4BalZZSWuWiYDyECHjIix
	tK3gS6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2RhD-00000006hPt-0Npa;
	Wed, 09 Apr 2025 09:26:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2RfR-00000006h9N-22Iq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 09:24:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 300596843E;
	Wed,  9 Apr 2025 09:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F195BC4CEE3;
	Wed,  9 Apr 2025 09:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744190660;
	bh=DwGnLL6yRkvpHKgsWq2KLkFsuAMpxTUYys1PXFd8l/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I5IgcAlRk1EgDie6uaxayYtmeWyKVS9fIZR/1/0nWhopGT1klDsqsAR7EEvpioDBA
	 fT+AelYZcJx98j9ircBrA/HFfrqqKxbfjSa6MQrT5xWwUW8xPgSSMzDlert4absJ6f
	 bN0q1tjepncf6SDptO1blqFqaz/am//rlMjDmRAeUp/jdX/eN4wmAAvTDvgkNHDN+x
	 Hr06pPWxCq93goCnSt6PUrlzRR3E2sHbGERKzE+hRoSqOzeWpPubGNxQuyfeVRghR+
	 HKyRoY10GR+tr2P6I3RsaFu6Nnz2Hc+vRvi4fdIdM6Yo0Gw7CvaddfZs/7/qYPcVXK
	 RSmto31DVfR+Q==
Date: Wed, 9 Apr 2025 10:24:15 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: stm32: simplify clock handling
Message-ID: <20250409092415.GI395307@horms.kernel.org>
References: <E1u1rwV-0013jc-Ez@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u1rwV-0013jc-Ez@rmk-PC.armlinux.org.uk>
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

On Mon, Apr 07, 2025 at 08:15:35PM +0100, Russell King (Oracle) wrote:
> Some stm32 implementations need the receive clock running in suspend,
> as indicated by dwmac->ops->clk_rx_enable_in_suspend. The existing
> code achieved this in a rather complex way, by passing a flag around.
> 
> However, the clk API prepare/enables are counted - which means that a
> clock won't be stopped as long as there are more prepare and enables
> than disables and unprepares, just like a reference count.
> 
> Therefore, we can simplify this logic by calling clk_prepare_enable()
> an additional time in the probe function if this flag is set, and then
> balancing that at remove time.
> 
> With this, we can avoid passing a "are we suspending" and "are we
> resuming" flag to various functions in the driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> This patch has been only build tested, so I would be grateful if
> someone with the hardware could run-test this change please.

Yes, agreed that would be nice.
But this is a very nice cleanup.

Reviewed-by: Simon Horman <horms@kernel.org>

