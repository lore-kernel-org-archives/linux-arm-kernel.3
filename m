Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62549C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HirNLTF6E7mhNhLaSQKScEQLOYAqQZVgjyZpc3XGDrg=; b=DCyGd+BCji3+0cDJi9lYVF/kdI
	VmYbB40sDhfyziLQ9WmAMSCsjCpAbF101ZsYmgIgqb6xkphT2m2hLI+LIwhMjdsh9ePlHtoIWuIDC
	WXvCn84RbdhMX21TmuX9huIbQ71icH2250AaPRzncy1IAgo4HhAj1Jme/DR8Ia9naXUkmxW6cTrou
	7DIceRTUH1OhW6so21GF44qqaheLeR6oAuIPvyyDhAFrg0n+38pRZWSZ8xzxrB/Zz2OJ+jFRqNsPO
	XtSdWmsOeLcH5/Wi2A/LgbQSn73peJgzJtfW/NTirlMAKutyIIRiTlZj2P8tTM9L9JB25ACMm049w
	MxLpkl/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHUl-0000000DWZa-41h8;
	Thu, 19 Jun 2025 15:48:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEXi-0000000D4vc-2J66;
	Thu, 19 Jun 2025 12:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C9667A54493;
	Thu, 19 Jun 2025 12:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD5EC4CEEA;
	Thu, 19 Jun 2025 12:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750336737;
	bh=0O8KUs11HYzYDV9dS+Fjh+t+vw87oB0LvVgWoJBSoKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=emSXN9QNT3nkgNQTuAleo3mJHp4mZ0ARLDH9YcB5KZfxJhext93gFSgvVOAJScqdJ
	 G5fB2V2QcQ9rDIO5Sb3u0vVsPysUlfbhTkEWgCSMcF+/b/98dNvK7u7OIps8FVWID0
	 07I+/dBO6Ij7UUHpr4m9jVILeLIJimvgAmvPtmVq3TfzUfx4e5DvsYLgg0WnAnnObJ
	 AtwLwuwSY3qRoW/yFQeB4sXurSWkn2TlJGzItFPQPUgGPyje5ERerhuu21IujH8SPd
	 t2WzcvqtBzmirpKBx95bxkuNxtB8kpIWHEEI8JROzkPoQ9iMKsnIWYEX6oYkFV/Jai
	 wyVBqjyFb3gfA==
Date: Thu, 19 Jun 2025 13:38:52 +0100
From: Simon Horman <horms@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>, arinc.unal@arinc9.com
Subject: Re: [net-next v4 1/3] net: ethernet: mtk_eth_soc: support named IRQs
Message-ID: <20250619123852.GM1699@horms.kernel.org>
References: <20250616080738.117993-1-linux@fw-web.de>
 <20250616080738.117993-2-linux@fw-web.de>
 <9FD09C8D-A9DC-4270-AB4A-6EBE25959F12@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9FD09C8D-A9DC-4270-AB4A-6EBE25959F12@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_053858_655527_0D64B68F 
X-CRM114-Status: GOOD (  16.88  )
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

On Thu, Jun 19, 2025 at 09:44:34AM +0200, Frank Wunderlich wrote:
> Am 16. Juni 2025 10:07:34 MESZ schrieb Frank Wunderlich <linux@fw-web.de>:
> >From: Frank Wunderlich <frank-w@public-files.de>
> >
> >Add named interrupts and keep index based fallback for exiting devicetrees.
> >
> >Currently only rx and tx IRQs are defined to be used with mt7988, but
> >later extended with RSS/LRO support.
> >
> >Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> >Reviewed-by: Simon Horman <horms@kernel.org>
> >---
> >v2:
> >- move irqs loading part into own helper function
> >- reduce indentation
> >- place mtk_get_irqs helper before the irq_handler (note for simon)
> >---
> > drivers/net/ethernet/mediatek/mtk_eth_soc.c | 39 +++++++++++++++------
> > 1 file changed, 28 insertions(+), 11 deletions(-)
> >
> >diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> >index b76d35069887..81ae8a6fe838 100644
> >--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> >+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> >@@ -3337,6 +3337,30 @@ static void mtk_tx_timeout(struct net_device *dev, unsigned int txqueue)
> > 	schedule_work(&eth->pending_work);
> > }
> > 
> >+static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
> >+{
> >+	int i;
> >+
> >+	eth->irq[1] = platform_get_irq_byname(pdev, "tx");
> >+	eth->irq[2] = platform_get_irq_byname(pdev, "rx");
> 
> Hi Simon,
> 
> I got information that reserved frame-engine 
>  irqs are not unusable and have no fixed
>  meaning. So i would add fe0..fe3 in
>  dts+binding and change these names from
> tx/rx to fe1 and fe2.
> 
> Can i keep your RB here?

Since the meaning is changing somewhat maybe best to drop the RB.
I'll look out for the new version to review.

