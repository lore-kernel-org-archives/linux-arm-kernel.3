Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8851AF43854
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 16:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpnoSDDGsBCL+2BDd4JTT1XxKpjuL1ghLwvkFgcvTjA=; b=gc9fq4/zcvTN1Afn6haXvBsyaq
	ttLa5+HymQiPg5KG8rhyyhm5kKZFhdXyDFPYvS+g2cXPVqxfyP+h9+19wkaqbN56EHhgZ2S47PAy8
	bHScaiFz7kQnOah63XgWowinSF+kMu9TVa42RIJxfSbt9WLrCCrSdHe/mCUv3fA6Tv/YkJ61jgoTh
	lRy7bZvVYAl7w8xIlF3iuG+ef8krPFW8tGu07SsCLJiO8oZ1Q99PYZFlZ18MDyJCI4b793NdrumEo
	PDe4rCb/pGxEPW9VcCAetx+EQbdbK8qlQaCbvBV3KMND/sQivl8G9FenQmYVybvZah2T3MQIiSPPp
	e1ECBQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD36e-00000001NUz-1WYH;
	Wed, 15 Apr 2026 16:28:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD36b-00000001NUS-3DcH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 16:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xpnoSDDGsBCL+2BDd4JTT1XxKpjuL1ghLwvkFgcvTjA=; b=nMR9rhZHp02XU3aSVh1bIewT7H
	Xgo9Jdkgy1fEEb7SgxTiqMZO5/IOYh6iOuPqlHM7P0qcFq/Cz5ZxKt7zQ+rlZMaI2TBw2UgXBMHU5
	HriC4AedygCY5+7VjHUYQUGcYOgcZXIRjZNYjCWAejcjmNe2GFDZZfIeUopiIIMIb9xmOjMtea/Cc
	IZyVMbecLSxdYh7dmwr7LDrDAJ6VDKEZ4GLZ2nIEA0nmHkUBCudEyk/VgNCDISD6yOKZAFxxa7Bjg
	ofArRRTshrucwsaKkGej5QQ6qcRl0a/6wOM8tgCs5b+wJSZ76Nvbz+8BuOD1D10HLy984fUXXb+0P
	RXVJsO5A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60524)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wD36N-000000002I9-1yPN;
	Wed, 15 Apr 2026 17:28:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wD36J-000000002LW-20lB;
	Wed, 15 Apr 2026 17:28:27 +0100
Date: Wed, 15 Apr 2026 17:28:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Serge Semin <fancer.lancer@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net v5] net: stmmac: Prevent NULL deref when RX memory
 exhausted
Message-ID: <ad-8q4OrOm-VtGrO@shell.armlinux.org.uk>
References: <20260415023947.7627-1-CFSworks@gmail.com>
 <ad-LAB08-_rpmMzK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad-LAB08-_rpmMzK@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_092846_075965_AA71B4F7 
X-CRM114-Status: GOOD (  33.96  )
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

On Wed, Apr 15, 2026 at 01:56:32PM +0100, Russell King (Oracle) wrote:
> On Tue, Apr 14, 2026 at 07:39:47PM -0700, Sam Edwards wrote:
> > The CPU receives frames from the MAC through conventional DMA: the CPU
> > allocates buffers for the MAC, then the MAC fills them and returns
> > ownership to the CPU. For each hardware RX queue, the CPU and MAC
> > coordinate through a shared ring array of DMA descriptors: one
> > descriptor per DMA buffer. Each descriptor includes the buffer's
> > physical address and a status flag ("OWN") indicating which side owns
> > the buffer: OWN=0 for CPU, OWN=1 for MAC. The CPU is only allowed to set
> > the flag and the MAC is only allowed to clear it, and both must move
> > through the ring in sequence: thus the ring is used for both
> > "submissions" and "completions."
> > 
> > In the stmmac driver, stmmac_rx() bookmarks its position in the ring
> > with the `cur_rx` index. The main receive loop in that function checks
> > for rx_descs[cur_rx].own=0, gives the corresponding buffer to the
> > network stack (NULLing the pointer), and increments `cur_rx` modulo the
> > ring size. After the loop exits, stmmac_rx_refill(), which bookmarks its
> > position with `dirty_rx`, allocates fresh buffers and rearms the
> > descriptors (setting OWN=1). If it fails any allocation, it simply stops
> > early (leaving OWN=0) and will retry where it left off when next called.
> > 
> > This means descriptors have a three-stage lifecycle (terms my own):
> > - `empty` (OWN=1, buffer valid)
> > - `full` (OWN=0, buffer valid and populated)
> > - `dirty` (OWN=0, buffer NULL)
> > 
> > But because stmmac_rx() only checks OWN, it confuses `full`/`dirty`. In
> > the past (see 'Fixes:'), there was a bug where the loop could cycle
> > `cur_rx` all the way back to the first descriptor it dirtied, resulting
> > in a NULL dereference when mistaken for `full`. The aforementioned
> > commit resolved that *specific* failure by capping the loop's iteration
> > limit at `dma_rx_size - 1`, but this is only a partial fix: if the
> > previous stmmac_rx_refill() didn't complete, then there are leftover
> > `dirty` descriptors that the loop might encounter without needing to
> > cycle fully around. The current code therefore panics (see 'Closes:')
> > when stmmac_rx_refill() is memory-starved long enough for `cur_rx` to
> > catch up to `dirty_rx`.
> > 
> > Fix this by further tightening the clamp from `dma_rx_size - 1` to
> > `dma_rx_size - stmmac_rx_dirty() - 1`, subtracting any remnant dirty
> > entries and limiting the loop so that `cur_rx` cannot catch back up to
> > `dirty_rx`. This carries no risk of arithmetic underflow: since the
> > maximum possible return value of stmmac_rx_dirty() is `dma_rx_size - 1`,
> > the worst the clamp can do is prevent the loop from running at all.
> > 
> > Fixes: b6cb4541853c7 ("net: stmmac: avoid rx queue overrun")
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221010
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sam Edwards <CFSworks@gmail.com>
> 
> Locally, while debugging my issues, I used this to prevent cur_rx
> catching up with dirty_rx:
> 
>                 status = stmmac_rx_status(priv, &priv->xstats, p);
>                 /* check if managed by the DMA otherwise go ahead */
>                 if (unlikely(status & dma_own))
>                         break;
> 
>                 next_entry = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
>                                                priv->dma_conf.dma_rx_size);
>                 if (unlikely(next_entry == rx_q->dirty_rx))
>                         break;
> 
>                 rx_q->cur_rx = next_entry;
> 
> If we care about the cost of reloading rx_q->dirty_rx on every
> iteration, then I'd suggest that the cost we already incur reading and
> writing rx_q->cur_rx is something that should be addressed, and
> eliminating that would counter the cost of reading rx_q->dirty_rx. I
> suspect, however, that the cost is minimal, as cur_tx and dirty_rx are
> likely in the same cache line.
> 
> It looks like any fix to stmmac_rx() will also need a corresponding
> fix for stmmac_rx_zc().

I have some further information, but a new curveball has just been
chucked... and I've no idea what this will mean at this stage. Just
take it that I won't be responding for a while.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

