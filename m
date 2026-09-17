Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A767C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJOwgYi9AsLFETj5P07KS7icxDQTYVsi9d2yzmRT4T0=; b=OavTcL8gb76rcmdpbmt+ZlrhDX
	SVGkKe+lqUdE9GlOO7yWODnDazIaR6gnYZ8TI/ceSAiw61pNYtOQk/1Kpg9CPc1+CsAMM2ClJTDVu
	c57lcYs1dcS2IiA+cJ47aJU83yx+DqB/XMxzwRwcQGh3Y+o4pGnzTMdhJYiU4lWeknd+zJRVqO6WC
	eom/qT7+0xayHtUQaVF9ixCoO+pwpX1AYF5XUSqxdpaXHVfjHKtv3IVju0vWwnURDlgc2c5yko1qh
	oMLJtGRSOshC8faHIHfHsPJnjYNdYWp0g4hRx+hKvIkUS8z8Ma+rj+xIEj0D4XCcvwd4aipye8DEJ
	2CEUlpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DgF-0000000Bcyn-16gT;
	Thu, 17 Sep 2026 15:05:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DgD-0000000BcyP-0Hbg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xJOwgYi9AsLFETj5P07KS7icxDQTYVsi9d2yzmRT4T0=; b=t2/qzzzyp9tTNVrahR16BD/kfi
	QGsz5UiuR0lAl4EpGn+qCgG78KupUM6RXniV88PUv3kprugmNm3aT5Xm+smJDRlIbg55yRhPd42ba
	2qfi/hL9zPhWcg78bfSyCnRipuf2Qhzqwev7E2gYZyXWIrlJHyyFFbuIRCbcipo9cGkk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x7Dft-005hJS-1x; Thu, 17 Sep 2026 17:05:21 +0200
Date: Thu, 17 Sep 2026 17:05:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Linkui Xiao <xiaolinkui@126.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Linkui Xiao <xiaolinkui@kylinos.cn>, stable@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: ethtool: validate TX coalesce before
 reprogramming RX
Message-ID: <15b8cbc2-f3ca-4845-9a93-7fff6c5aede6@lunn.ch>
References: <20260917131235.1360959-1-xiaolinkui@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917131235.1360959-1-xiaolinkui@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_080541_106651_C1A1E7CA 
X-CRM114-Status: GOOD (  20.85  )
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

On Thu, Sep 17, 2026 at 09:12:35PM +0800, Linkui Xiao wrote:
> From: Linkui Xiao <xiaolinkui@kylinos.cn>
> 
> __stmmac_set_coalesce() applies the RX part of the request first and
> only afterwards checks the TX parameters. The RX path already calls
> stmmac_rx_watchdog() and stores rx_riwt[] and rx_coal_frames[], so when
> the TX check rejects the request the driver returns -EINVAL after having
> silently changed the hardware. A following ethtool -c then reports the
> new RX values even though the command failed.
> 
> This became easy to hit once the per-queue interface was added.
> __stmmac_get_coalesce() reports tx-usecs and tx-frames as 0 for a queue
> index that is RX-only, and ethtool applies per-queue coalesce by reading
> the current values first and sending them straight back. The next set is
> therefore guaranteed to trip the test for both TX fields being zero,
> right after the RX watchdog has been reprogrammed.
> 
> Move both TX checks in front of the RX block so a request is either
> applied completely or rejected without touching the device.
> 
> Fixes: db2f2842e6f5 ("net: stmmac: add per-queue TX & RX coalesce ethtool support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
> ---
>  .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 154cc0c7623d..325db062f72a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -850,6 +850,19 @@ static int __stmmac_set_coalesce(struct net_device *dev,
>  	else if (queue >= max_cnt)
>  		return -EINVAL;
>  
> +	/* Check the TX parameters before anything is applied: the RX part
> +	 * below already writes to the hardware, so rejecting the request
> +	 * afterwards would leave the device with only half of the settings
> +	 * the caller asked for while reporting a failure.
> +	 */

Why such a verbose comment? Look at the rest of the code and make your
comments similar in verbosity.

    Andrew

---
pw-bot: cr



