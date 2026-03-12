Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F70E105A593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VYAGwg3xJVqZ6ED+4iEbnnq6LZZq3rNWT+MD/LpG68=; b=2yp6DnzpRVyXN4Y7A+BZoFIQIl
	wSU0+iN30H8dMmwa0362xMc3NHxhqX6C9c9aMhRW5KiAePBPbMJtTtOuARN45KTZY+h7Uw/EP4IUB
	JIMgdvcT6hPN+2S2Q0yxr9lRACxBb3Xm6LYF7JLngCjYHLbOb8hsh/GbSt/hqsjLS7SPVh0yppDpj
	aNnqEsPIHQ+aBq/ehBI3ujsPQEb6Xyp5ECyD3PoBwIEMWAebXG3GAnaS5OIK1WephGzRKwRmGqtd2
	MdKthjxUkCihKTrZ+TQ7rAQ5nuEkQdcllKz+A/U4lyIUYzWtlOC+RC9Y9dxvOB9+pUnMwY01vBpDu
	vIgHvuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fF6-0000000E39X-3JKI;
	Thu, 12 Mar 2026 12:34:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fF4-0000000E38k-1iE9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+VYAGwg3xJVqZ6ED+4iEbnnq6LZZq3rNWT+MD/LpG68=; b=q78eQRd6Wb12x9J6acMLNga4Vi
	rjSqiJgA/qNQ/+/Kuzn7C9NMhYDmt8QprMs0sgeZRxC7ibKWngo7LvWcFlTZlsYegwNePc/9DUedc
	wAQwH8N5uYMXSRKENZKIHKvoWhvQHhzZGOgu7t7hmmqvPJ7uZ/JV/GUFthcd5pT08+LTIrnTPcd34
	UIoXpHG403jiIa/+3gDHoZPOaUQwUCu/bhxwgD2Lf/sc/k8V0H4MsUnhrK2JBs68y+6xr+c1yULmm
	oVGF4qRt2jVpcyDCvNwcj//teDOlpGzNKxPb3rJrK0fWyxImiqUk6baorIEq7+4LXsWnk1aNxv5nS
	xV3aj6MA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40838)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w0fEv-000000007n5-2Vv8;
	Thu, 12 Mar 2026 12:34:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w0fEs-000000007Dk-3LAp;
	Thu, 12 Mar 2026 12:34:06 +0000
Date: Thu, 12 Mar 2026 12:34:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: Re: [PATCH net-next v2 13/15] net: stmmac: add helper to set
 transmit tail pointer
Message-ID: <abKyvowPxQW9iTCc@shell.armlinux.org.uk>
References: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
 <E1w0czK-0000000CzH7-19Fb@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w0czK-0000000CzH7-19Fb@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_053418_463977_81293E4E 
X-CRM114-Status: GOOD (  11.20  )
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

On Thu, Mar 12, 2026 at 10:09:54AM +0000, Russell King (Oracle) wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> index 1bbf02504dad..d5c003f3fbbc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> @@ -427,7 +427,7 @@ static void dwmac4_display_ring(void *head, unsigned int size, bool rx,
>  			extp++;
>  		}
>  	} else if (desc_size == sizeof(struct dma_edesc)) {
> -		struct dma_edesc *ep = (struct dma_edesc *)head;
> +		struct dma_edesc *ep = dma_desc_to_edesc(head);

Too-many-outstanding-patches-itis strikes again (I have more than 100
outstnading patches at the moment.) dma_desc_to_edesc() is in a later
patch that isn't part of this series.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

