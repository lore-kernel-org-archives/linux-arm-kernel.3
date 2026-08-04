Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2583C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 02:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2EK07+wqnSMzescspEC9qsT2233v6Xmazp/HC0ovbI=; b=Hb6lZwddjBl7pUif6IS4BBxBL9
	BeeudqUMyNCicvWMwdZ55sE9s5ngIA1vWU39xfMTqibh2wI5QS50NlgK+V6YCpIQ9b1+jCwisBwKJ
	hTiGlKZNiIyc0RdzSieEOa809Mw50tTH1bGVApv7+D8jSAt3epBGVnimfTVJY2agPUr4YDUXZnJTY
	OYTY0V9q6MeZxqx4x+rZzQ+mUGY5Wgh4ktA0n0R1mqh4aRf/xp9koC5S+EAkPXuPPACiIx8OOEc4g
	pfGA55TMGws0ff6YInqNOQiHlx64Gb5KnGYkgaXwRlbUW9XcPTHxPsB9ouKcidj8fsN1Bd4Rlya1j
	m1U5L50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4aB-00000000obP-29oB;
	Tue, 04 Aug 2026 02:08:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4a8-00000000oaV-2iP8;
	Tue, 04 Aug 2026 02:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=U2EK07+wqnSMzescspEC9qsT2233v6Xmazp/HC0ovbI=; b=hysqWGGqjQ64vonaJgoLWb0oEB
	rPgAjIo1dk2UsVdsLFuox1nd/XEI2HqSWifXpDZUEpuYBDU9PLd18FApx1m/exERlbbBZ9Sj/+lX5
	bVSBi/u5JCsCQB8CcSpoHAMSCT0zAhN8+zp5Wzm/dxgI/nCRtxYQ6jupp6hekYPKCz9g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wr4Zg-00FtJQ-3B; Tue, 04 Aug 2026 04:08:12 +0200
Date: Tue, 4 Aug 2026 04:08:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 1/5] net: pcs: mtk-lynxi: check regmap reads in
 mtk_pcs_lynxi_get_state()
Message-ID: <b2f3f283-90f0-458f-ad0e-1745cf38b008@lunn.ch>
References: <cover.1785368701.git.daniel@makrotopia.org>
 <b58d5d99dddd67e35a6f14a14a6ad63d8b3fbadc.1785368701.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b58d5d99dddd67e35a6f14a14a6ad63d8b3fbadc.1785368701.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_190840_702892_5DF893E4 
X-CRM114-Status: GOOD (  10.49  )
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

On Thu, Jul 30, 2026 at 01:14:38AM +0100, Daniel Golle wrote:
> mtk_pcs_lynxi_get_state() ignores regmap_read()'s return value; a
> failed read leaves bm and adv holding uninitialized stack values
> which are then decoded into the reported link state. The regmaps
> backing the MT7531 SGMII PCS instances sit on an MDIO bus where
> reads can fail. Check both reads and leave the state untouched on
> error.
> 
> Fixes: 4765a9722e09 ("net: pcs: add driver for MediaTek SGMII PCS")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

