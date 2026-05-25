Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB286CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 15:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7Os4s2IEuxuriK9SstbnqCyxryE75fG4oDhRKfyRQ0=; b=cGgfm8xbt2i1Xlp1TVht9IVgVB
	eTz9fIx/E3YlfbfDh/GwclCKEVCkqZf1X+7/2I40vkvSEGQ0zA2XTGlX/YwXxeONqh8cWrVIb1fR1
	61jTiSqTXub6L5U+U+hsAXEFavbLEJK2GN42powApQ43Yj1wGlM1oK/94j5AUxa5cNpQLQU5t9UCa
	0FIrvGBXhxGd/SOk09QhrbgKhsUiQ4wBYRdxOXO4AOP6uZ+42W8D0k4nLM6wTvhqYpyg7f4sUDF+2
	01fU0tK/Yf1PRgyNwi9LwGCfeApEwIzQCKEirZjyBZEcEFk5iINLPSBw/eD9i1SDs+mOWBJDbBVwr
	Gr3XxhQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXEc-0000000HWTE-3OFO;
	Mon, 25 May 2026 15:28:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXEb-0000000HWSy-34As;
	Mon, 25 May 2026 15:28:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 26E29601E3;
	Mon, 25 May 2026 15:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3F81F000E9;
	Mon, 25 May 2026 15:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779722932;
	bh=L7Os4s2IEuxuriK9SstbnqCyxryE75fG4oDhRKfyRQ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=J7d9Nt7deToD+0JArcSe6D/WQ30cExBmwO8G+hjU4HwPlMuidVbSufI2Q9q0Tl3g6
	 XUP1tarwDa2XAR8KEydzGbSJDVoXMjXTDxrHa5mpQkmdP8RfMSZ3g1xSNTu3uq3FFV
	 3Dnmc136VKn/fBnRkjaZIVZTK59mEO3CZ9iI2uOd6/i4f7adZKl3W23JUfWWUQRoPy
	 5pqwai6cS3O22Tx8y3G1TBBih4lpnnr6T6gnoOr+zQ1y6ARiFMfJ9j6XNrQiBGQIeb
	 weTLvh2zz4OTMRb4qDrBxBjvQ2KwXXIiWh5YgMzejn5cJrE01VUJQITdAP2BlVaMff
	 Ac1nMwk3xdc6A==
Date: Mon, 25 May 2026 08:28:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Frank Wunderlich (linux)" <linux@fw-web.de>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Alexander Couzens
 <lynxis@fe80.eu>, Daniel Golle <daniel@makrotopia.org>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Frank Wunderlich
 <frank-w@public-files.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [RFC net PATCH v1] net: pcs: pcs-mtk-lynxi: fix bpi-r3 serdes
 configuration
Message-ID: <20260525082851.6840b4dd@kernel.org>
In-Reply-To: <64b40fbee19dc108752574419a38bcfc@fw-web.de>
References: <20260409133344.129620-1-linux@fw-web.de>
	<20260409215509.si2dy63seo4iaspa@skbuf>
	<64b40fbee19dc108752574419a38bcfc@fw-web.de>
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

On Mon, 25 May 2026 12:07:33 +0200 Frank Wunderlich (linux) wrote:
> Am 2026-04-09 23:55, schrieb Vladimir Oltean:
> > On Thu, Apr 09, 2026 at 03:33:42PM +0200, Frank Wunderlich wrote:  
> >> From: Frank Wunderlich <frank-w@public-files.de>
> >> 
> >> Commit 8871389da151 introduces common pcs dts properties which writes
> >> rx=normal,tx=normal polarity to register SGMSYS_QPHY_WRAP_CTRL of 
> >> switch.
> >> This is initialized with tx-bit set and so change inverts polarity
> >> compared to before.
> >> 
> >> It looks like mt7531 has tx polarity inverted in hardware and set 
> >> tx-bit
> >> by default to restore the normal polarity.
> >> 
> >> Till this patch the register write was only called when 
> >> mediatek,pnswap
> >> property was set which cannot be done for switch because the fw-node 
> >> param
> >> was always NULL from switch driver in the mtk_pcs_lynxi_create call.
> >> 
> >> Do not configure switch side like it's done before.
> >> 
> >> Fixes: 8871389da151 ("net: pcs: pcs-mtk-lynxi: deprecate 
> >> "mediatek,pnswap"")
> >> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> >> ---  
> > 
> > Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>  
> 
> just a gentle ping as i still not see this in torvalds/master.
 
You posted it as RFC, patchwork treats RFC as "no action required".
Since the posting is now >1mo old, please resend without the RFC tag?

