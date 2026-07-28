Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03A4C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfhT+ID3fPeDtksWdXaPKj48BAsIgjyAU5KW0xjSCGE=; b=Ee0CydiP50fe1yh675DRpgWc+w
	2E9ZPzWAAWR5pmjmZvLHB3Y1H3qy1/N9hLwIM7fUvaR24hlhSHIimYa71MGTr1xljqFu6yM0ahFp1
	yIE906oLgRiekews65Rqdxit430gGN55k1jU2QYCvb1YSUaqIr1rfXp0caPB7HiWCgUK2H+f93bu5
	xmKM84GmKBiZFMSP4FhE8AsqdZAp0Q4G1ZIMQNRI9HuTGeGkLbtr9pTEoJE+QN9ZCRqWSPtxH+Vgp
	mt9KAlzFS5TYVi9ue1LrbmgzfiNjWKcpHqHffAiqj1hjm9hTn5hEODgXHqQSf1JO1Uog4oRnucoFS
	4urpajmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woouu-00000006Fhn-177g;
	Tue, 28 Jul 2026 21:00:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woous-00000006FhQ-0ImW;
	Tue, 28 Jul 2026 21:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HfhT+ID3fPeDtksWdXaPKj48BAsIgjyAU5KW0xjSCGE=; b=nXFp35a8/fHtQEC4CyFsp5EGXl
	KaWzXbyWojsL2GTsNFuUJSn/UnkBPcJcgF34T2AqKNObB0cSvLg8IC2vDqwE5KJBUsimPcNBARSmG
	qdwvZBMj4u+O4XGIZKU41rat3viDuejjTSQjLHtFOazfbcGMqCBD9UMJefuWJeami21o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1woouc-00EhO7-Ij; Tue, 28 Jul 2026 23:00:30 +0200
Date: Tue, 28 Jul 2026 23:00:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 3/3] net: dsa: mt7530: error out on failed reads in
 MT7531 PHY polling
Message-ID: <5f305d2f-7f5a-46b6-be73-2ab52f4ec016@lunn.ch>
References: <cover.1785213071.git.daniel@makrotopia.org>
 <79e85d68d210cc37342978171aa6432aa2954333.1785213071.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79e85d68d210cc37342978171aa6432aa2954333.1785213071.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_140046_107911_2C85E507 
X-CRM114-Status: GOOD (  10.50  )
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

On Tue, Jul 28, 2026 at 05:52:29AM +0100, Daniel Golle wrote:
> The MT7531 indirect PHY access functions poll MT7531_PHY_IAC through
> a helper which returns 0 when the underlying read fails, so a failed
> bus transaction clears MT7531_PHY_ACS_ST and the access carries on,
> returning garbage PHY register data to phylib.
> 
> Poll using regmap_read_poll_timeout(), which stops on read errors and
> propagates them. These functions hold the MDIO bus lock across the
> whole sequence, so the unlocked regmap accesses remain correct. Remove
> the now-unused _mt7530_unlocked_read().
> 
> Fixes: c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

