Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43437C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9b9i47N2hN51JYCksU49+E73DkaYdsYznNi6qRyjP2o=; b=p+Z4vxFM+pfMob/6dxewcN6nz7
	37KkD25cvE6DarHuVpZwgALr5zWmDLabnTUYhBgk7M+wpnQ2JWOrmunzySOGo+/OTLZ9bABjRKczI
	1Tip2vQFOkiWiwS263MP1gpz55XKxeEb91aDzwgxyJn6HRokK0DXWyr+SpeNo7Uy4jWkqJ3UIZQi5
	HEPjROI6ACSxM/CpkkViF4ir9BILRX4C7fwjFx7g7jKW3BTk8jvsFQiMUtpdx/cUlZdlA/3m4Vxj2
	/67RtG0of/FaF5Md+3MVJHdccgwFraxlN0ccGOHP2Vau4PNE6kqwrGU3V9nJCF8hMqQXZivzmuJ2J
	ocORNWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujOv0-0000000Dnsu-10bW;
	Tue, 05 Aug 2025 21:09:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujOsP-0000000DnUG-10O6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 21:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9b9i47N2hN51JYCksU49+E73DkaYdsYznNi6qRyjP2o=; b=l5A1mj8qyUXiNYdEnCROkG0fnc
	CfxTeZVTkTS3GEMvYksMoX3/JG/ftB6ekDLe/RZkysQlnskMNp031c7eAfC1ZEf0qMGCFK92mCo50
	MmJjUSV1Yq2KTrepkbA0tuOxDVqLojQRwX/wt696+6X6dgDE2vau+A9h5NpBWd1pOl1w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ujOsL-003pKI-WA; Tue, 05 Aug 2025 23:07:14 +0200
Date: Tue, 5 Aug 2025 23:07:13 +0200
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
Subject: Re: [PATCH net-next v4 3/7] net: axienet: Use MDIO bus device in
 prints
Message-ID: <8a28ce41-f28d-4089-8a8e-a82ae2ccfc82@lunn.ch>
References: <20250805153456.1313661-1-sean.anderson@linux.dev>
 <20250805153456.1313661-4-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805153456.1313661-4-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_140717_279516_C0D4C1E3 
X-CRM114-Status: UNSURE (   9.97  )
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

On Tue, Aug 05, 2025 at 11:34:52AM -0400, Sean Anderson wrote:
> For clarity and to remove the dependency on the parent netdev, use the
> MDIO bus device in print statements.

> @@ -186,28 +187,31 @@ static int axienet_mdio_enable(struct axienet_local *lp, struct device_node *np)
>  		/* Legacy fallback: detect CPU clock frequency and use as AXI
>  		 * bus clock frequency. This only works on certain platforms.
>  		 */
> -		np1 = of_find_node_by_name(NULL, "cpu");
> +		np1 = of_find_node_by_name(NULL, "lpu");

There is nothing about dev in this change?

	Andrew

