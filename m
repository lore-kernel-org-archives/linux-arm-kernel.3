Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0316C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 19:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+r/nHRyZltKy41tZTedOu70Px/F9mZ4F2bNtsI59OU=; b=AS4H+oy2jmRCDtUYfKOUpzfohw
	fj8h7Ns9qL9T2uJgoAawVKEwPLRRJm9h5nN4rnZagJjIJA5ybazlcq2/f+6rbmEiBbSlr62CwSMfa
	rBrJer/97PPycyUan4LArduYN3/BEwF09l0Qk7idiizPhVxKDoDLTNWkQh07X/DoauDFqKvSe8USl
	Oeclyqa0tRmjGAbnFNR5NgMvWwjL29xI2tLGYXNC8/B7CnZmB8wsYVncF8fbe6gKrn7T1aZSE0Bz1
	+5WRSWPuNsHhAtpG9aJdg6ZQ8gHx1w1n+nRBrK7RCSnJE4n5BkfDCqXQRsshRdJ+rxdwosON3k2CP
	SwVOcdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJdxx-00000009RpA-2ZHm;
	Mon, 26 May 2025 19:58:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJdvp-00000009Rgr-3jLc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 19:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4+r/nHRyZltKy41tZTedOu70Px/F9mZ4F2bNtsI59OU=; b=4tEXRGQfPFBKpQqSc4z3gLgkOI
	2o4h5Mvi6Sh0ZTFi1D2+yNvmyXjWCGYdmEHfGYz0Cg28GnJ2XGysRQrywM1DpEhKGquRqpftFPcNI
	8DjUFHygH594V/sfYAptUWciuDPafHD5BXrYWXj9wRwcblq7YpMgBF+7bvyXY3SQXb9Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uJdvL-00E1V8-N2; Mon, 26 May 2025 21:55:51 +0200
Date: Mon, 26 May 2025 21:55:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] net: stmmac: dwmac-sun8i: Allow runtime
 AC200/AC300 phy selection
Message-ID: <a2ac65eb-e240-48f1-b787-c57b5f3ce135@lunn.ch>
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526182939.2593553-2-james.hilliard1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_125621_923829_FEA92FA7 
X-CRM114-Status: UNSURE (   9.33  )
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

On Mon, May 26, 2025 at 12:29:35PM -0600, James Hilliard wrote:
> The Allwinner H616 ships with two different on-die phy variants, in
> order to determine the phy being used we need to read an efuse and
> then select the appropriate PHY based on the AC300 bit.
> 
> By defining an emac node without a phy-handle we can override the
> default PHY selection logic in stmmac by passing a specific phy_node
> selected based on the ac200 and ac300 names in a phys list.

The normal way to do this is phy_find_first().

    Andrew

