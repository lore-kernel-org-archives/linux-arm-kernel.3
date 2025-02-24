Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0144CC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 21:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWgDmirhzznnhYt9Uvfv+vpk+ZdMO5bn771mAVTAPUA=; b=YWO/Hw8Ge0b9a9xyvHndZtmzII
	YeTP5TTIcGQjRRQypZS55r80Uo7gV3m1dnnn4y8ZTi9C1Ef0RE80qp446ZXTlgtgXQGWrhNS6dpkA
	JVo3lfQP3Km8W6D6KETeaP4O6btniMHOeMVzvbRr4z4QWVV9EYan9nVYw83rD+9oWzzgN8zxCMvst
	tvqsn41UvTnkRAVKUeSWs/LlKXt2xS6IZQnKUdCG0sJLQOK5vq40SY+nUcmM1fhz5tnXclMO+MDcS
	VP1AMMaF7lJkgYJFsTLWAkRiGWXFv9ueLt91BEjkjmj5dGn7Lap9eZgZTEqs62LYkUVyzP3xg+PPY
	+A2kxrzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmg2v-0000000FEiv-3a6x;
	Mon, 24 Feb 2025 21:31:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmg1E-0000000FEV9-2j36
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 21:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13D3361129;
	Mon, 24 Feb 2025 21:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB4CC4CED6;
	Mon, 24 Feb 2025 21:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740432579;
	bh=2wIuo2JpNrpSXzbijZXMds2t2FH5opDQp0MBirv33i0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zi8MSJVFCqiwf9OUs5sWKRYW6666HCAE9LClfaJJdld4CT/dvQKA+mFh2yqDuuYBh
	 T+ucoLngVzPbDBvHyZ5jfD9Ggsqclh1bmtQc+l9ErARAKBGVnboakH0OrS9fPEZ4l0
	 8AyA1C0Zpy48ekBhKpai+u1Byg0pgOq3QvgeVDrgjuf8uQRvg0gorn02FYrtDEAV5R
	 OaLvg3LI+yxKXvmuIFCs67v+udlk1dVD32+Sv3v6OY2Qr/NRNFLFngTo3ChIDJ5txa
	 mNxBw3qqV55ohBwvQCa9yjuCXY8UEdbWpXalhDGoMxEFF3XaKBqiujWbxBDrRjd/sw
	 Lfca3buOi7lPw==
Date: Mon, 24 Feb 2025 13:29:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwc-qos: clean up clock
 initialisation
Message-ID: <20250224132938.4b352786@kernel.org>
In-Reply-To: <Z7yjLjfNq89vPnOd@shell.armlinux.org.uk>
References: <Z7yGdNuX2mYph8X8@shell.armlinux.org.uk>
	<E1tmZjr-004uJP-82@rmk-PC.armlinux.org.uk>
	<Z7yjLjfNq89vPnOd@shell.armlinux.org.uk>
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

On Mon, 24 Feb 2025 16:49:50 +0000 Russell King (Oracle) wrote:
> On Mon, Feb 24, 2025 at 02:47:19PM +0000, Russell King (Oracle) wrote:
> > Clean up the clock initialisation by providing a helper to find a
> > named clock in the bulk clocks, and provide the name of the stmmac
> > clock in match data so we can locate the stmmac clock in generic
> > code.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>  
> 
> Yet more warnings and errors from NIPA, yet this patch passes my local
> build tests.
> 
> As no one looked at v1, I don't see the point of waiting 24h before
> posting v3... no one is probably looking at v2.

NIPA builds with W=1 C=1, FWIW, looks like a sparse warning.

