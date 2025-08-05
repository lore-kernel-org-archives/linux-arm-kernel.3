Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86B4C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 21:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/T32B0iDAc73yD8QSjnheCBq97UTHskJn2BHI0l6/+A=; b=dLutISlsZrjzSFqmEkf406nqd/
	V2+3hbiGmcWQpwEf+HclKPtj/jkK6kZO2xtZmsSEAOVK0fb5v14hCFNVChcYVYB4qM7QFfUUZUiyu
	uSY9g8nPpab11xv4KbsePIxWtCEGHqVfvxSYEcB8VJgTOQmWPv+cnQTgpVJN3BKtlAkgwr21ZN9+3
	KA3UUQ3YxrJzQkIPlEqi/apZlivCi/3gMbZd7VvChimm+306YKKSX7ZupjlOIwYUlLl85TtxUq18P
	XAa8AsEOFln5jGdtyrZRlcKKk9Hd459dfLRfdAb57WeNmkiwVwvjgXiAchv3bTxD4WnUuuRkI+ycx
	wt5uj0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujPRe-0000000DqZD-0SSn;
	Tue, 05 Aug 2025 21:43:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujPP3-0000000DqRA-3ril
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 21:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/T32B0iDAc73yD8QSjnheCBq97UTHskJn2BHI0l6/+A=; b=eXFzQppguDZBk4N1x1nydTBhMH
	4k9rwb2TiweuCZcxlpYtGI6DEj2Tw/lyKgp3Wi7rrb83QJ9iPS+U+bhWb/8x7LK1M3p1KnxwCOnDL
	YVoF2hVg8//OrxT6UTIN2sNpQ9i68CW9KZ5Pv5f2Fpw/eOarCGp8snbFj1855WW5trIU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ujPOz-003pTN-UN; Tue, 05 Aug 2025 23:40:57 +0200
Date: Tue, 5 Aug 2025 23:40:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH net-next v4 7/7] net: axienet: Split into MAC and MDIO
 drivers
Message-ID: <c320da3b-6e55-474a-93d6-666092b70774@lunn.ch>
References: <20250805153456.1313661-1-sean.anderson@linux.dev>
 <20250805153456.1313661-8-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805153456.1313661-8-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_144101_963144_74BFDD35 
X-CRM114-Status: UNSURE (   8.82  )
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

> Fixes: 1a02556086fc ("net: axienet: Properly handle PCS/PMA PHY for 1000BaseX mode")

If this is for net-next, please don't have a Fixes: tag.

>  struct axienet_common {
>  	struct platform_device *pdev;
> +	struct auxiliary_device mac;
>  
>  	struct clk *axi_clk;
>  
>  	struct mutex reset_lock;
> -	struct mii_bus *mii_bus;
> +	struct auxiliary_device mii_bus;

Keeping the name mii_bus for something which is not an struct mii_bus
is going to cause confusion. Please give it a different name.

This is another patch which needs splitting up.

   Andrew

