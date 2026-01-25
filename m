Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03EBE63CA4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2X891Ez3ofU6acQZJKt3+66chDjYg1lXlCjzKU3OXs=; b=UOHN7DnIdIF/0w8Vdxiz1CBnKN
	dNOsjF2cdLUDsOQnOe59JrZ3EUpM95rzZ5TPphLjwdoQFlGTs999brQXBjRB6yD7hhgbkOJvSQ/RW
	w3pq7QfWHY6b2sVEZlf2rf2LW+rDGl4Rvwey9OfP1c2XjiLAkjubH9n6vDCyDwJ2Oy+Ytp+zGf1yF
	27KLRl0JZPGaKbdYLxEw0xiZccgfhkv4ke9J4SxmBhz4gmLS69BZ0yFhdrtZHMbHDOrE2QSrlNipp
	1lp/CNPGtLqW0dRaFbEOjVk55c1zvTb33fechoY2lckxTPIVb4vMVtPP+3zz13B/xdu12rQMuZ9VW
	3PJ5/CBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8aT-0000000BaI7-2zNP;
	Sun, 25 Jan 2026 22:28:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8aQ-0000000BaHj-0PUE;
	Sun, 25 Jan 2026 22:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=L2X891Ez3ofU6acQZJKt3+66chDjYg1lXlCjzKU3OXs=; b=EiMjt/g8Z82n8WlxNZmZG5T5uv
	EpAjk6l6Np519Lwq+KkIQztvA05OO68xBvl4i4UH4rCD6tE/kWAlPtCG36okJQ90uoxrF0MKwI88Y
	auR0oGXM5QGKFUj/H3GZUNe1Gi+qBPj3kv3f7a1CLwJxhnz/K5cpA04j8U18MkO8MbjraI15eE+e7
	cghAlzquIBy4Fdx21Vr6RI3Nw1qzwneiiNp4eCth+mDWvwUWjra7Sgv/WbnvqMNgvMGgGVyM/l6ct
	I3TujEL3WSTM6cm2MgI5Qu1HKYwJKsEvIdoDxYGvvsuZd/4PYkPhr5aty+knLWa+LKs3+uCV/r80m
	Y4iR2Dyw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32798)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vk8aI-0000000041d-2tWj;
	Sun, 25 Jan 2026 22:27:54 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vk8aE-000000004Ma-3W6u;
	Sun, 25 Jan 2026 22:27:50 +0000
Date: Sun, 25 Jan 2026 22:27:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, andrew@lunn.ch,
	davem@davemloft.net, alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	heiko@sntech.de, andrew+netdev@lunn.ch,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,18/21] net: stmmac: rk: rk3328: gmac2phy only supports
 RMII
Message-ID: <aXaY5nKGFdBhVsnb@shell.armlinux.org.uk>
References: <E1vjEvF-00000005ghI-3CYC@rmk-PC.armlinux.org.uk>
 <20260125221631.3396200-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125221631.3396200-1-kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_142802_448922_BCC8338D 
X-CRM114-Status: UNSURE (   7.27  )
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

On Sun, Jan 25, 2026 at 02:16:31PM -0800, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html

This, and all the other AI generated comments on subsequent patches
are repeats of patch 17.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

