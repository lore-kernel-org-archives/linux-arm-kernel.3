Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE1DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 18:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NslrfSxDR9Zcwgcgcqz00P8rnhgZYqobMPxF/Sv42Jo=; b=0SigrYBBZb+HD7FVW0BNeOaOd0
	C2KPylpRfenVd/8Cer0dxMfTJiwPm7Y1el8Ju8f1uf0D25CZlcvg2Lr+Wd1rDlo5+8/JsNClVaPCp
	pNE9WdczIoAORn6zJqEzlPvW02w5Oxw2MUNvXYeoX4PoQbDFk7bMsqf7YcNd8GdvGsWtkgyhrW8jK
	S71sY3yoZRunJk4paN6Q92zLLO+OBN6xqEssJyi3ivcRfoVM+DoDIStfP4yGMHh3hmVDIUxDp73gB
	ta39NFqBRt6gIIViJ5FPpSwy9DBkcpfMY309lGkdICQ4HxPfRDo+8xwL0R4Fq0GA4knV87BcLZ2IE
	JPR4YD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJc5-00000002a91-39tm;
	Tue, 04 Aug 2026 18:11:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJc3-00000002a8S-2seJ;
	Tue, 04 Aug 2026 18:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NslrfSxDR9Zcwgcgcqz00P8rnhgZYqobMPxF/Sv42Jo=; b=wal0hsuVOpfztKjLsH7JZV9vr3
	vcEfrIGhQBhOFyRa6fvumQXuM/Aa8Rlg7BDKx13d1oGTnxvCbb3YW1SemOsyMjPjFmpV8OyCwVUGr
	AClwJfR130Q1GLfkkmAm67GITrQCDLNyPdlrevhYrirX10OCxVnKkakH/Bwcq9+3SsUs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wrJbl-00G2FC-H7; Tue, 04 Aug 2026 20:11:21 +0200
Date: Tue, 4 Aug 2026 20:11:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Qingfang Deng <dqfext@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: phy: mediatek: fix TX blink masks using the RX
 bits
Message-ID: <ab2f7f4f-0f46-4c6e-b3b1-ea713dbd08c6@lunn.ch>
References: <20260804113511.3371248-1-naseefkm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804113511.3371248-1-naseefkm@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_111139_726268_7FC6B40E 
X-CRM114-Status: GOOD (  12.47  )
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

On Tue, Aug 04, 2026 at 03:35:11PM +0400, Ahmed Naseef wrote:
> MTK_GPHY_LED_TX_BLINK_SET and MTK_2P5GPHY_LED_TX_BLINK_SET are built
> from the RX blink bits instead of the TX ones, so both TX masks are
> identical to their RX counterparts. The TX bits they should be using,
> MTK_PHY_LED_BLINK_{10,100,1000,2500}TX, are otherwise only referenced
> by the per-speed branch of mtk_phy_led_hw_ctrl_set().
> 
> A TX trigger selected without a link trigger therefore programs the RX
> blink bits, and the LED blinks on received traffic. The masks are also
> used to decode the blink register in mtk_phy_led_hw_ctrl_get(), which
> as a result cannot tell the two triggers apart: an RX-only
> configuration reads back as RX and TX, and a TX-only configuration
> reads back as neither.
> 
> Fixes: 7f9c320c98db ("net: phy: mediatek: Move LED helper functions into mtk phy lib")

Was this bug introduced in this commit, or did this commit just move
the code around and it was broken before? The Fixes should go back to
where the bug was added, which could be earlier.

	Andrew

