Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A00DCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 00:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lLvCMjk7Iv84B8VoX8uYrN5krVryc2wkS0I+dQpe9Q=; b=Cz1oSTXqXGMWfyRJX0deV8UdLx
	4YWKU66HKpjKjnHLidEv59TyPAgNoBaNrG0mAM3A+6xxnQKXXyjU7WpfrZAvxXnCQxsrlLLz+l8SF
	HZyxQaGvdSpp5uXTe0e+j6wc+t6x/ZfTudG2uZ8gW/rHmIwpBfwzmAkvdbSJt53wH1EaWhkYbfSYt
	sns6IveqU178xmKH4uhL04wj10fiVtgArcEXQspczXfRnW91V4y+BJOnxIT0/TcE2gyDoA7f8gP6w
	3edU2rihS0sxmIdgogeBS5pXxvNE7C2o/tRhHvs7AqXM9DYwYCSTx6jsp4AHTtPB/1U9Q6hDZJyyH
	rfcqOoXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ka2-00000006RMK-2wvG;
	Wed, 01 Oct 2025 00:20:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ka0-00000006RLu-3Uvc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 00:20:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F86145311;
	Wed,  1 Oct 2025 00:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A99EC113D0;
	Wed,  1 Oct 2025 00:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759278024;
	bh=m26ff45+YZIuIweKTgqVfUP8TSAnLz2buJEY7gdOkpw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uTXWjDD51MSeKOJohAhYHujiMKU3dMzHwPFwjMZCmZDPDtaKT/YGz0LPNp2Kc1FCJ
	 qlCeE8zlY9NPC5tLrrFH6RJ+0BGIMqF84MJW45OLrxv50itI4hawITmuMdNbTXqDmX
	 GBQH0tWqmJxTI8QCZ6bzVNJUQCXpz9qcgcN5zeLF8a1fdyzuGrnhQWxfnqoXXjHmQq
	 dhCCuQklmO3GXCAUniqSLjGvKrCQDsM8s2tEiZ7rxl92QIA/jvJmdICrMWihvcDgwR
	 Ln2m/wcXYJw6+YtM8Z+1e/ADU8dvhJiE9PjMazyW6R91j1az7ROl1xGilxZce/bWpa
	 IxSQvIQGPXeoA==
Date: Tue, 30 Sep 2025 17:20:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH net-next v8 2/2] net: stmmac: Add support for Allwinner
 A523 GMAC200
Message-ID: <20250930172022.3a6dd03e@kernel.org>
In-Reply-To: <20250929180804.3bd18dd9@kernel.org>
References: <20250925191600.3306595-1-wens@kernel.org>
	<20250925191600.3306595-3-wens@kernel.org>
	<20250929180804.3bd18dd9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_172024_897055_14A3CB23 
X-CRM114-Status: GOOD (  16.71  )
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

On Mon, 29 Sep 2025 18:08:04 -0700 Jakub Kicinski wrote:
> On Fri, 26 Sep 2025 03:15:59 +0800 Chen-Yu Tsai wrote:
> > The Allwinner A523 SoC family has a second Ethernet controller, called
> > the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
> > numbering. This controller, according to BSP sources, is fully
> > compatible with a slightly newer version of the Synopsys DWMAC core.
> > The glue layer around the controller is the same as found around older
> > DWMAC cores on Allwinner SoCs. The only slight difference is that since
> > this is the second controller on the SoC, the register for the clock
> > delay controls is at a different offset. Last, the integration includes
> > a dedicated clock gate for the memory bus and the whole thing is put in
> > a separately controllable power domain.  
> 
> Hi Andrew, does this look good ?
> 
> thread: https://lore.kernel.org/20250925191600.3306595-3-wens@kernel.org

Adding Heiner and Russell, in case Andrew is AFK.

We need an ack from PHY maintainers, the patch seems to be setting
delays regardless of the exact RMII mode. I don't know these things..

