Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3860CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 01:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHK1Tz54e/Ifee6N7/zns9tcx8F25+FcDpSUAMb1Lb0=; b=LKfJ77/0Vz01oYRZfvRoeXEDWM
	X676Qh+G/jU9xCBiavxFKJWPT+4VQfwPic3B5oJDh/Jr4ziAjyzZnkZlrtazNevMUve/IciHTfDIE
	+EgKLQSlSfJk/xK7KevY2GUfi7HkSNksXzON6GlIXc9O6KsknVjS7LynIhSSIL4PGwlWbr6XipmKk
	vuLcMBh8BaflSY4i9K1WNvsS4BdnWNmgAIK4g882jFGl8Vu3YjKLz+vkcejKTcrtF1QWI0rwr6HQl
	D/gMNdvFyBCiwxnI9YeoKRYXlNUthyeGxced4GK4RSaPFHCnnqdSfhRI99c9GN+YAUgjj09GPBhK3
	6lTvMIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Oqg-00000003kxJ-2RiX;
	Tue, 30 Sep 2025 01:08:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Oqd-00000003kwN-2ise
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 01:08:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6E6440A01;
	Tue, 30 Sep 2025 01:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B454AC4CEF4;
	Tue, 30 Sep 2025 01:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759194486;
	bh=bHK1Tz54e/Ifee6N7/zns9tcx8F25+FcDpSUAMb1Lb0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ygq4HwhlykpA5CGfYsyjzP8zgqMVS1ZAhFUon3xmKXRU21GqqzwTGl8bmgWxlYSVn
	 gLz5fQ2dKiM8rRY3F6CrfiVHbnQLvXNSKm+pVehSjR0t9jKqK369WJ/gm1ot3ksySY
	 klbd8NsjCGKEuZnC+cw3Wl1JhH7ojDg5LQeWB+l+XxZhg5O3hI1F7KPDfAcGn44OEP
	 dIMZCqONsnhGcxZMt/sBewGBBUeyEXXmj671Q52PF/DrUDQxPEVWTIsHvcqnGgdTXY
	 iE4z2qKM50gNJysR3PY01mzmDK5SsSvzbqLPo2TixLRvMsTRO6O2W8VRQo36GyIQZi
	 CWKrN4SfMGYjA==
Date: Mon, 29 Sep 2025 18:08:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Chen-Yu Tsai <wens@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH net-next v8 2/2] net: stmmac: Add support for Allwinner
 A523 GMAC200
Message-ID: <20250929180804.3bd18dd9@kernel.org>
In-Reply-To: <20250925191600.3306595-3-wens@kernel.org>
References: <20250925191600.3306595-1-wens@kernel.org>
	<20250925191600.3306595-3-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_180807_710500_675DA017 
X-CRM114-Status: GOOD (  13.01  )
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

On Fri, 26 Sep 2025 03:15:59 +0800 Chen-Yu Tsai wrote:
> The Allwinner A523 SoC family has a second Ethernet controller, called
> the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
> numbering. This controller, according to BSP sources, is fully
> compatible with a slightly newer version of the Synopsys DWMAC core.
> The glue layer around the controller is the same as found around older
> DWMAC cores on Allwinner SoCs. The only slight difference is that since
> this is the second controller on the SoC, the register for the clock
> delay controls is at a different offset. Last, the integration includes
> a dedicated clock gate for the memory bus and the whole thing is put in
> a separately controllable power domain.

Hi Andrew, does this look good ?

thread: https://lore.kernel.org/20250925191600.3306595-3-wens@kernel.org

