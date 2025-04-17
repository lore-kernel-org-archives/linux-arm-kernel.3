Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34978C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5cCZAWKDm6+Qeuwa/9YylW4qKECvxAC2UN1OjNfOxQ=; b=rMyu3/Mf+bQFb70mOTlsln5vnx
	LMmzbWBt/HsS8Jp5LP2+GDy9WIP2eVkF0/KiqPzMMEwUCFHcC+/u4RJN7OZYJAMSGBdhgoVbx+mjX
	akEDWpw2rrv3b3xO0JdC6bElN+FknISTI5N2AohrIwdOotWzQ6+DSMJjv7iPt729zWG2DrbkgYXLU
	2sMCdFuOwZB7W3dFbTvPXBGCkBoHBc12XW0hMyqm14VxhPzgMm7bKnZFZg7W6Zm8ER1XdMEsN02J1
	1yjYifph7HHfD4rQxULFPG/On52EWBa9xbAwv8nolrImOzXPl6mPyO4lCsTirueK1FOSlDaFENdqM
	4M/eglfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SKf-0000000DhxY-2XiG;
	Thu, 17 Apr 2025 16:43:21 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Rls-0000000DcAu-0bOL;
	Thu, 17 Apr 2025 16:07:25 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u5Ra5-000000001zt-0Tra;
	Thu, 17 Apr 2025 15:57:51 +0000
Date: Thu, 17 Apr 2025 16:57:48 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 5/5] net: ethernet: mtk_eth_soc: convert cap_bit
 in mtk_eth_muxc struct to u64
Message-ID: <aAEk_J9JCi3lkuGD@makrotopia.org>
References: <8ab7381447e6cdcb317d5b5a6ddd90a1734efcb0.1744764277.git.daniel@makrotopia.org>
 <99177094f957c7ad66116aba0ef877df42590dec.1744764277.git.daniel@makrotopia.org>
 <20250417081325.0e0345ee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417081325.0e0345ee@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_090724_180428_005C8B16 
X-CRM114-Status: GOOD (  20.56  )
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

On Thu, Apr 17, 2025 at 08:13:25AM -0700, Jakub Kicinski wrote:
> On Wed, 16 Apr 2025 01:52:03 +0100 Daniel Golle wrote:
> > The capabilities bitfield was converted to a 64-bit value, but a cap_bit
> > in struct mtk_eth_muxc which is used to store a full bitfield (rather
> > than the bit number, as the name would suggest) still holds only a
> > 32-bit value.
> > 
> > Change the type of cap_bit to u64 in order to avoid truncating the
> > bitfield which results in path selection to not work with capabilities
> > above the 32-bit limit.
> 
> Could you please be more specific and name a bit or a field that goes
> over 32b? Since this is a fix ideally we'd also have impact to the user
> described in the commit message. But having enough info for the reviewer
> to quickly validate the change is the bare minimum.

I reckon it's too late to include that information in the commit
description. However, let me still illustrate the problem here now:

In mtk_eth_soc.h:

enum mkt_eth_capabilities {
	MTK_RGMII_BIT = 0,
	MTK_TRGMII_BIT,
	MTK_SGMII_BIT,
	MTK_USXGMII_BIT,
	MTK_2P5GPHY_BIT,
	MTK_ESW_BIT,
	MTK_GEPHY_BIT,
	MTK_MUX_BIT,
	MTK_INFRA_BIT,
	MTK_SHARED_SGMII_BIT,
	MTK_HWLRO_BIT,
	MTK_RSS_BIT,
	MTK_SHARED_INT_BIT,
	MTK_PDMA_INT_BIT,
	MTK_TRGMII_MT7621_CLK_BIT,
	MTK_QDMA_BIT,
	MTK_SOC_MT7628_BIT,
	MTK_RSTCTRL_PPE1_BIT,
	MTK_RSTCTRL_PPE2_BIT,
	MTK_U3_COPHY_V2_BIT,
	MTK_SRAM_BIT,
	MTK_36BIT_DMA_BIT,

	/* MUX BITS*/
	MTK_ETH_MUX_GDM1_TO_GMAC1_ESW_BIT,
	MTK_ETH_MUX_GMAC2_GMAC0_TO_GEPHY_BIT,
	MTK_ETH_MUX_U3_GMAC2_TO_QPHY_BIT,
	MTK_ETH_MUX_GMAC2_TO_2P5GPHY_BIT,
	MTK_ETH_MUX_GMAC1_GMAC2_TO_SGMII_RGMII_BIT,
	MTK_ETH_MUX_GMAC12_TO_GEPHY_SGMII_BIT,
	MTK_ETH_MUX_GMAC123_TO_GEPHY_SGMII_BIT,
	MTK_ETH_MUX_GMAC123_TO_USXGMII_BIT,

	/* PATH BITS */
	MTK_ETH_PATH_GMAC1_RGMII_BIT,
	MTK_ETH_PATH_GMAC1_TRGMII_BIT,
	MTK_ETH_PATH_GMAC1_SGMII_BIT,
	MTK_ETH_PATH_GMAC2_RGMII_BIT,
	MTK_ETH_PATH_GMAC2_SGMII_BIT,
	MTK_ETH_PATH_GMAC2_2P5GPHY_BIT,
	MTK_ETH_PATH_GMAC2_GEPHY_BIT,
	MTK_ETH_PATH_GMAC3_SGMII_BIT,
	MTK_ETH_PATH_GDM1_ESW_BIT,
	MTK_ETH_PATH_GMAC1_USXGMII_BIT,
	MTK_ETH_PATH_GMAC2_USXGMII_BIT,
	MTK_ETH_PATH_GMAC3_USXGMII_BIT,
};

...

#define MTK_ETH_MUX_GDM1_TO_GMAC1_ESW		\
	BIT_ULL(MTK_ETH_MUX_GDM1_TO_GMAC1_ESW_BIT)
#define MTK_ETH_MUX_GMAC2_GMAC0_TO_GEPHY	\
	BIT_ULL(MTK_ETH_MUX_GMAC2_GMAC0_TO_GEPHY_BIT)
#define MTK_ETH_MUX_U3_GMAC2_TO_QPHY		\
	BIT_ULL(MTK_ETH_MUX_U3_GMAC2_TO_QPHY_BIT)
#define MTK_ETH_MUX_GMAC2_TO_2P5GPHY		\
	BIT_ULL(MTK_ETH_MUX_GMAC2_TO_2P5GPHY_BIT)
#define MTK_ETH_MUX_GMAC1_GMAC2_TO_SGMII_RGMII	\
	BIT_ULL(MTK_ETH_MUX_GMAC1_GMAC2_TO_SGMII_RGMII_BIT)
#define MTK_ETH_MUX_GMAC12_TO_GEPHY_SGMII	\
	BIT_ULL(MTK_ETH_MUX_GMAC12_TO_GEPHY_SGMII_BIT)
#define MTK_ETH_MUX_GMAC123_TO_GEPHY_SGMII	\
	BIT_ULL(MTK_ETH_MUX_GMAC123_TO_GEPHY_SGMII_BIT)
#define MTK_ETH_MUX_GMAC123_TO_USXGMII	\
	BIT_ULL(MTK_ETH_MUX_GMAC123_TO_USXGMII_BIT)

The above MTK_ETH_MUX_* macros are the ones used as values for cap_bit in
mtk_eth_path.c.
So technically MTK_ETH_MUX_GMAC123_TO_USXGMII == BIT_ULL(29)
which is still fine for a 32-bit value, but never the less BIT_ULL returns
a 64-bit type and hence using a 32-bit type to store the result is at
least misleading.

However, you are right that with the currently supported SoCs this doesn't
result in an actual bug (but it will with the upcoming addition of newer SoC
like MT7987).

