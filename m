Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599BCCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 18:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flt0kxjBMaFtcGGsVmeAGdaBovxcVAdiMpj86O+vOGM=; b=ucoXANU5SMJ2YNeYoRoQCnoIPh
	rEHK7xhTJlHt16vqo7ijlsox/4jLKOZR2XJtrsvTqIndNJGluNyA7qpLu8xaBzd4qNsGUrtiyKoNL
	SciUPLX0GJfGVaVwT2/lhQl0WHXOwjsfU626PztDpm4v1si0WR0tOHERYxUSFnbjm+tBq0MOtDHYx
	XvnOuxxn+T9xhwbnrIT/9minvD03lWoVMwgkkzbOVMAYVX/rsy6VXdtR1s80Yx4YRYVOc8Hm1a2qQ
	6SICeeR/H1mTFOJiQt8HRR5DTP5Z619eYVz2PzcrK8DdpIJOA585VP8CYo90D0fgGgmJV8XvpfgvD
	1zrehtpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXSq-00000008oPF-19RE;
	Mon, 11 Aug 2025 18:41:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUh7-00000008FFM-3hoc;
	Mon, 11 Aug 2025 15:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0FA74A5733D;
	Mon, 11 Aug 2025 15:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C125C4CEF5;
	Mon, 11 Aug 2025 15:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754927056;
	bh=+ZafSPu4xL/UKuGsxxL1GvEE5JWzMOCzAIFJcdOdwHY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BvPXbUCvlj4Xf1D2IQHKisy0OQo/KCIar+Kv2NnTG6mY0H1m2Q4IgauioHX0RANm6
	 8Ut7Aw8NHszmC35ncb4nXrUsb+HXgH+08tRf70qiZkgdPt8bNHKf3f43yOpDKvoD3f
	 uKHKXqvYUuU0Tcl/4ZKCGNN/uqfNV0ovMXCohp1OFFXUNeavi+XFJFG9uA1ZiA1T6V
	 EN1N1WLu+LYh7oY9v7UUq0FN39vMXqY/UtxAKy+S32ugM+Ydq69MjykOM8OhoUBWH4
	 hwnyOwzH0yjBhqiSpEuYfqVK1nzk1xdFDR3tSSPQfz/ba17Zrc1sn4UYskE8FQMTlQ
	 Pmu+T9vsu0sYA==
Date: Mon, 11 Aug 2025 08:44:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, Rex Lu
 <rex.lu@mediatek.com>
Subject: Re: [PATCH net-next v2] net: mediatek: wed: Introduce MT7992 WED
 support to MT7988 SoC
Message-ID: <20250811084414.6089720d@kernel.org>
In-Reply-To: <aJoK7e4aEKR96V4h@lore-rh-laptop>
References: <20250811-mt7992-wed-support-v2-1-e43024c05305@kernel.org>
	<aJoK7e4aEKR96V4h@lore-rh-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_084417_995553_505A275C 
X-CRM114-Status: UNSURE (   8.79  )
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

On Mon, 11 Aug 2025 17:23:25 +0200 Lorenzo Bianconi wrote:
> > Introduce the second WDMA RX ring in WED driver for MT7988 SoC since the
> > Mediatek MT7992 WiFi chipset supports two separated WDMA rings.
> > Add missing MT7988 configurations to properly support WED for MT7992 in
> > MT76 driver.  
> 
> I sent this email twice wrongly. Please ignore this one.

patchwork decided to ignore the other one.
Are they identical?

