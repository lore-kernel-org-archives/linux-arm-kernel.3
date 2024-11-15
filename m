Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE402D6DDC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 03:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4dhbkJNMvW0DmenN+A6Mts0TXTqO556j9EErgHA5W8=; b=3D06xNOffML/VEgGtKnxzrIXMN
	10oNvQ/p8jHHHQZIdPOigrXUrWVyGxQEieBZ/gvNpGE6JHKvumFOOOT0+ScazBJi/HV0oTTLZr5tC
	xifhAUIpyTxhqmE+D94V8LB6yKAXN6dcA/PIbVxi4AFglKTnFeQG2ARjeJGW13ZPjRdQVj2Ee+MbQ
	z1SOElZjXve6rxtBfsgtZhYl9EpEUNyz36lH1ntngnr+IoJulJEzM/VLNMcDc+KqYw5wuMoHYZrWu
	4/muqbSnRfqE3HoniOjtHllh6IyvxHZRGykKUnp5lPMA/tfyG/7L800/it+IPpscgXx8UdKe6JGM2
	OixmVgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBmvI-00000001TUR-17mY;
	Fri, 15 Nov 2024 03:23:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBmuL-00000001TGg-3Wss;
	Fri, 15 Nov 2024 03:22:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BAAAAA41DC4;
	Fri, 15 Nov 2024 03:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8D0C4CECD;
	Fri, 15 Nov 2024 03:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731640924;
	bh=hbfvdurmQjEVxYb6k7AOAGgfnneezr5EVZ7PBjoghW0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lhpdQXWrz/EBT1Qf7tnSUwgb1Wk5EF1S5pJliSXTPUUFsTk/J5ZbUjY5p60gu5EKH
	 y/fQLTC8qBgENpQ1tSnpmOrwcaveVVYzeeTY+rWcwt3tuDICjfC2G95Wd1xHuq9Zh3
	 IHcNWdCfbhxRANZwlWF6FiLAvrdEGazO+lUaBDGhxi2sqdbjRdCUcnDaT0NMfDTyrg
	 aZo5nhDiFKBXWEC4XCcPuGgN7QKipi3iroYA21u4jABCqHiuAMbTa/7O8earrfK52y
	 JMQw8i4CaxOqY6iijDAC4mCqrARM2JZDNyCuorVxNSCxo/zVl0HawOGebv0MdT0NWt
	 a/1d+DVKifdSA==
Date: Thu, 14 Nov 2024 19:22:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
Subject: Re: [net-next PATCH v5 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <20241114192202.215869ed@kernel.org>
In-Reply-To: <20241112204743.6710-4-ansuelsmth@gmail.com>
References: <20241112204743.6710-1-ansuelsmth@gmail.com>
	<20241112204743.6710-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_192206_015713_67292AD3 
X-CRM114-Status: UNSURE (   6.81  )
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

On Tue, 12 Nov 2024 21:47:26 +0100 Christian Marangi wrote:
> +	MIB_DESC(1, 0x00, "TxDrop"),
> +	MIB_DESC(1, 0x04, "TxCrcErr"),

What is a CRC Tx error :o 
Just out of curiosity, not saying its worng.

> +	MIB_DESC(1, 0x08, "TxUnicast"),
> +	MIB_DESC(1, 0x0c, "TxMulticast"),
> +	MIB_DESC(1, 0x10, "TxBroadcast"),
> +	MIB_DESC(1, 0x14, "TxCollision"),

Why can't these be rtnl stats, please keep in mind that we ask that
people don't duplicate in ethtool -S what can be exposed via standard
stats

> +	MIB_DESC(1, 0x18, "TxSingleCollision"),
> +	MIB_DESC(1, 0x1c, "TxMultipleCollision"),
> +	MIB_DESC(1, 0x20, "TxDeferred"),
> +	MIB_DESC(1, 0x24, "TxLateCollision"),
> +	MIB_DESC(1, 0x28, "TxExcessiveCollistion"),
> +	MIB_DESC(1, 0x2c, "TxPause"),
> +	MIB_DESC(1, 0x30, "TxPktSz64"),
> +	MIB_DESC(1, 0x34, "TxPktSz65To127"),
> +	MIB_DESC(1, 0x38, "TxPktSz128To255"),
> +	MIB_DESC(1, 0x3c, "TxPktSz256To511"),
> +	MIB_DESC(1, 0x40, "TxPktSz512To1023"),
> +	MIB_DESC(1, 0x44, "TxPktSz1024To1518"),
> +	MIB_DESC(1, 0x48, "TxPktSz1519ToMax"),

we have standard stats for rmon, too

> +	MIB_DESC(2, 0x4c, "TxBytes"),
> +	MIB_DESC(1, 0x54, "TxOversizeDrop"),
> +	MIB_DESC(2, 0x58, "TxBadPktBytes"),
> +	MIB_DESC(1, 0x80, "RxDrop"),
> +	MIB_DESC(1, 0x84, "RxFiltering"),
> +	MIB_DESC(1, 0x88, "RxUnicast"),
> +	MIB_DESC(1, 0x8c, "RxMulticast"),
> +	MIB_DESC(1, 0x90, "RxBroadcast"),
> +	MIB_DESC(1, 0x94, "RxAlignErr"),
> +	MIB_DESC(1, 0x98, "RxCrcErr"),
> +	MIB_DESC(1, 0x9c, "RxUnderSizeErr"),
> +	MIB_DESC(1, 0xa0, "RxFragErr"),
> +	MIB_DESC(1, 0xa4, "RxOverSzErr"),
> +	MIB_DESC(1, 0xa8, "RxJabberErr"),
> +	MIB_DESC(1, 0xac, "RxPause"),
> +	MIB_DESC(1, 0xb0, "RxPktSz64"),
> +	MIB_DESC(1, 0xb4, "RxPktSz65To127"),
> +	MIB_DESC(1, 0xb8, "RxPktSz128To255"),
> +	MIB_DESC(1, 0xbc, "RxPktSz256To511"),
> +	MIB_DESC(1, 0xc0, "RxPktSz512To1023"),
> +	MIB_DESC(1, 0xc4, "RxPktSz1024To1518"),
> +	MIB_DESC(1, 0xc8, "RxPktSz1519ToMax"),
> +	MIB_DESC(2, 0xcc, "RxBytes"),
> +	MIB_DESC(1, 0xd4, "RxCtrlDrop"),
> +	MIB_DESC(1, 0xd8, "RxIngressDrop"),
> +	MIB_DESC(1, 0xdc, "RxArlDrop"),
> +	MIB_DESC(1, 0xe0, "FlowControlDrop"),
> +	MIB_DESC(1, 0xe4, "WredDrop"),
> +	MIB_DESC(1, 0xe8, "MirrorDrop"),
> +	MIB_DESC(2, 0xec, "RxBadPktBytes"),
> +	MIB_DESC(1, 0xf4, "RxsFlowSamplingPktDrop"),
> +	MIB_DESC(1, 0xf8, "RxsFlowTotalPktDrop"),
> +	MIB_DESC(1, 0xfc, "PortControlDrop"),
-- 
pw-bot: cr

