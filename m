Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D662C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yS833fRfTqk4hSOqu5d67lTzJvylEPdj7NPQYtvP3fk=; b=2CKldOLOGXifVU3grPVTflBOtm
	0sbtOiR5924Kd7CXaDqUjWDhKivKXx2uD7ped3iIUJhZQkOtsr+lWA0XBEd0T0eqvntjMEUMp9BQJ
	uFRHfejTU/yYp9Y/eddI+A4KKfY+0Ot+cX8woGtFu4ucQXpols6ouuTkqYDOy+BFp6ACToREzJfJi
	XxuGPTUoB8sH89uUpy/CEHlS/6v+DCL+jC8c+6CKe0vuh8Lf1FqR3ME7oIcYxNObIVtI/D36vKZZE
	FfRv47eEwZEX3q5wwn/AVDCay2tv6MAijGB7F1v+RfTSwGYl9SgsrBByg12QIYodxhe4bW/FpMPSs
	usgPtX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teIY8-0000000D1VS-3mXJ;
	Sat, 01 Feb 2025 18:49:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teIWp-0000000D1T7-34JE;
	Sat, 01 Feb 2025 18:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yS833fRfTqk4hSOqu5d67lTzJvylEPdj7NPQYtvP3fk=; b=eOIr+7wbaaPPWDE+8lnaYcvT1Z
	wrUSkrDpf6jp4cR/7ITm/bLZIyWMiz7Z7q2yZ2ik4niohDmaE3P/g1TS+A35zxXGhvVF2V2+zvrDV
	tlhKsyRocluPkIcLMR9Xc8cEoB/pS5uUtjnbjNE347qnBfuN2W7DujD7JIdbmoBG/fq8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1teIWW-00A2Sf-9S; Sat, 01 Feb 2025 19:47:20 +0100
Date: Sat, 1 Feb 2025 19:47:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] net: ethernet: mtk-star-emac: Use
 of_get_available_child_by_name()
Message-ID: <28da459d-a611-48aa-8ad1-da5f6d605442@lunn.ch>
References: <20250201162135.46443-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201162135.46443-1-biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_104739_773921_FC13C0F9 
X-CRM114-Status: GOOD (  14.98  )
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

On Sat, Feb 01, 2025 at 04:21:32PM +0000, Biju Das wrote:
> Use the helper of_get_available_child_by_name() to simplify
> mtk_star_mdio_init().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch is only compile tested and depend upon[1]
> [1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renesas.com/
> ---
>  drivers/net/ethernet/mediatek/mtk_star_emac.c | 24 ++++---------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> index 25989c79c92e..beb0500fe9d5 100644
> --- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> +++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> @@ -1422,25 +1422,15 @@ static int mtk_star_mdio_init(struct net_device *ndev)
>  {
>  	struct mtk_star_priv *priv = netdev_priv(ndev);
>  	struct device *dev = mtk_star_get_dev(priv);
> -	struct device_node *of_node, *mdio_node;
> -	int ret;
> -
> -	of_node = dev->of_node;
> +	struct device_node *mdio_node _free(device_node) =
> +		of_get_available_child_by_name(dev->of_node, "mdio");

Same comment as for you other similar patch.

    Andrew

---
pw-bot: cr

