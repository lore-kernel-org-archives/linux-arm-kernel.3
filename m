Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D932C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdPRxrEVxkRTnxbxy0G0Bkwkh+T7ymPVpHD7pAR7Pis=; b=GU0MTMhadbwS8WXrnDmTjZLVMO
	tnTPg9yG1G8Lp+Z5Grt2MY/agebzt0dlsm0QRhD2hbpS/Si20xKOpJaoevMm+CJXdWRChsn37Lm0f
	WQtVenm36jnxvGibuZ7gyT1ieMDdYJ2up1YhLYH/evW5PhB2/6JRwIv0j7r2WqOotl9XqYuvuGc0r
	K7XJEFzRnOX9IoH0rVcFZ6hvUHtVOGYhLNjPyXwH8eeW/FPhRu+6SK6EkJDlA41D7YpfJ1zkUvKZZ
	7GgzHzmbEm7JvtH6cyPo/gUv6qihc+2L9imKzy8L/ZJv7fWit0u3q2a8S525IXvT8kNY2h7rYg+kf
	+hwl/xJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLPO-00000008E9t-1Ji6;
	Tue, 18 Aug 2026 15:07:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLPM-00000008E8G-1UHZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 15:07:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pdPRxrEVxkRTnxbxy0G0Bkwkh+T7ymPVpHD7pAR7Pis=; b=HJDwoHnu3Lv5yPBl2QlpYWnyja
	0lc9+AOiFMWkuC81qlWE4K869ndtt3h3JzViNs2AVgGp75Ielx8YIvI+ykbucFWEHSCTS0mrcSmxW
	Lu3PN/KRU5qISeg6NbwJk72o3e3lqbPZFo948aIVDxZWWNu/GG+ySJlJnuzdoCeuBrOk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wwLPC-000UDp-I8; Tue, 18 Aug 2026 17:07:10 +0200
Date: Tue, 18 Aug 2026 17:07:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Zxyan Zhu <zxyan0222@gmail.com>
Cc: maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
	richardcochran@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	muhammad.nazim.amirul.nazle.asmade@altera.com
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: dwmac-socfpga: mask
 XGMAC_TSIE during cross-timestamp
Message-ID: <b53e9ebc-64c3-4291-a691-5b7ddd118cc5@lunn.ch>
References: <20260818132722.1852876-1-zxyan0222@gmail.com>
 <20260818132722.1852876-3-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818132722.1852876-3-zxyan0222@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_080720_399813_BA3B55EB 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

On Tue, Aug 18, 2026 at 09:27:22PM +0800, Zxyan Zhu wrote:
> The Agilex5 smtg_crosststamp() handler arms an internal auxiliary
> snapshot, toggles GPO0 and then polls XGMAC_INT_STATUS for TSIS in
> process context to learn that the snapshot is ready.
> 
> Once XGMAC_TSIE is unmasked (done by a companion change that enables it
> in XGMAC_INT_DEFAULT_EN), the DWXGMAC2 timestamp interrupt handler runs
> from hardirq on every timestamp event and clears TSIS by reading
> XGMAC_TIMESTAMP_STATUS.  That read can win the race against the poll
> loop, which then times out and makes PTP_SYS_OFFSET_PRECISE fail with
> "Wait for time sync operation timeout".
> 
> Mask XGMAC_TSIE around the snapshot trigger and FIFO read so the hardirq
> handler cannot clear TSIS while smtg_crosststamp() owns it, and restore
> it on every return path.

Did you look at the other system which implement crosststamp?
dwmac-intel.c? Does it need similar changes?

	Andrew

