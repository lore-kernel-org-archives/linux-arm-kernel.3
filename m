Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106EFC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 02:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7dA1KFOUnW8nxWm55N4DeJuVD3fe/HXDBn/67aoe7I=; b=n72si7lI4yZjnh1sRgwpQG5YWj
	XcoXZBxP0+NceHEFo5E1ltbcpbkSOYu3jnxP6/p/3NVE3l2i7R/PafOKHSWa73gY/no4T0Nc/Cqhj
	FOQKXDdjgY59gIDMY5f+xUc6ty5b0k9PFO4cbM9LBwQq87aU3GG2dwhHk9IKfiRlu48PqmezgtHTh
	CyxMEUzq9Tf+kgJM3zwBUqGNpniWNOdpL8rFE111XfNixbtdL7mobCgW01iMug9vDkdyGJranfT6+
	N4haYbAWUh9P8yJyAdgW8Td7nGm5zYPMjabc58RPfI9xCuG2O0Kr3nduZhgltL4ZGzUxcf446EmaT
	jIIT24Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotmD-00000006epf-0x7z;
	Wed, 29 Jul 2026 02:12:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotmB-00000006epQ-3j0a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 02:12:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23D8741981;
	Wed, 29 Jul 2026 02:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A36D1F000E9;
	Wed, 29 Jul 2026 02:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785291127;
	bh=/7dA1KFOUnW8nxWm55N4DeJuVD3fe/HXDBn/67aoe7I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Ct8e0p7szQVbpJH+qZ1dT2HyXHUzAtO1cX8aTSGeLRzjp+JWhS5SA0erZ/iR3tR2B
	 a8XciTQ42vAD2KBkiHxYVXc2+0wSYwe13MsKjw1lU/t//hQeyLzax7YMaYR2O5Vrze
	 MA4UXoLDSbEy5klno4WbB70lh+bXCm1Do0GlGnwPult6mBOmh4dru0MUJ2n66iT/5N
	 dSd4gC4VB6+/59885+4M+SetwNpazQhorY7o6hprrv7uRBMhsuQnUObw7tPZFYVpA8
	 gXstjHOanrvj1u0Vc8aN3602WBveLJmB2ZRK67dlmlPuebf0UAYqOvpbQo67QyCvK/
	 8YADF5M/nnaaQ==
Date: Tue, 28 Jul 2026 19:12:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Zxyan Zhu <zxyan0222@gmail.com>, netdev@vger.kernel.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Russell King <rmk+kernel@armlinux.org.uk>, Serge Semin
 <fancer.lancer@gmail.com>, Romain Gantois <romain.gantois@bootlin.com>,
 Hariprasad Kelam <hkelam@marvell.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: Fix PHY attach when custom
 PCS is in use
Message-ID: <20260728191205.53e347c0@kernel.org>
In-Reply-To: <f14a1712-8315-4e64-b23b-ac00d7f82c3a@bootlin.com>
References: <20260726132618.3580612-1-zxyan0222@gmail.com>
	<f14a1712-8315-4e64-b23b-ac00d7f82c3a@bootlin.com>
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

On Mon, 27 Jul 2026 08:49:11 +0200 Maxime Chevallier wrote:
> On 7/26/26 15:26, Zxyan Zhu wrote:
> > This series fixes the issue where stmmac platforms using a custom PCS
> > via the pcs_init callback fail to probe when no phy-handle is specified
> > in the device tree.
> > 
> > Patch 1 is Russell King's phylink patch that relaxes phylink_expects_phy()
> > to allow PHYs to be attached in 802.3z inband mode.
> > 
> > Patch 2 skips the PHY attach in stmmac when a custom PCS is already
> > configured via priv->hw->phylink_pcs, avoiding the "no phy found" error
> > for platforms that manage link state entirely through the PCS.  
> 
> I've tested this series on the board that saw the regression from Russell's
> first attempt, and now with the associated stmmac patch, it works :)

Both Sashikos see a risk of regression here, could you TAL and confirm
it's not real / unlikely?

