Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAF4C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 18:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOpYljZuYO3T7PKQuPSq6hSLphxMmYBM9c7hIldkB8Q=; b=ghoh9p9Orm9cU7WRFQ/tg70hoT
	GalZXRnsiiBfdqYWw+x8IB8o4AMNl/hPbqY7AvK4t24tYXYMTgz3DOlyT5q4BR2CxNvK4kRKODxrm
	e4zQo+Y9DC3VnQkq7JZCIrrSrcgTe3D3Oawx5/PE2UCtaRhC4p2J6moISWDJaCtKRI0TXWK1MCfxd
	2X2wwVWpzY1C+5Uf6ZIf77jjCeXzfCp2/gA3p3xlJM8a07Yy5cWvN6F8D9miWvfT0SmXIeDU1WQA+
	kHP5bU4AmfOEiKOJ3pcgnu36LYCFX6zgv5nquvMZJs/6lRgY5uEoar+sFrpKXTysFrHDEi4TZBi0s
	s5p/64uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMWGC-0000000BZrK-0e5l;
	Tue, 03 Jun 2025 18:21:16 +0000
Received: from forward502d.mail.yandex.net ([178.154.239.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMWCd-0000000BZGi-0tlQ;
	Tue, 03 Jun 2025 18:17:37 +0000
Received: from mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:842f:0:640:b96f:0])
	by forward502d.mail.yandex.net (Yandex) with ESMTPS id EBB8760C59;
	Tue,  3 Jun 2025 21:17:25 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id LHgCkEULiKo0-pLzcZTYY;
	Tue, 03 Jun 2025 21:17:24 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1748974644; bh=pOpYljZuYO3T7PKQuPSq6hSLphxMmYBM9c7hIldkB8Q=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=lfjC88AQLYLUsUJy3b7nRVzevTZKollL8zItXcXC4rgjno4MWLGx6K+HDJLEJW5Rh
	 YYsmCJsPg7cOuXLi+Dm6HNyLtLYQKa+LofdjRX7bQxnh6dlTW3AwOjaGjOb6PbLec6
	 iyRtRNFb5eGkXo7L0wJ2J1pBv0BJdWAL954cjgbw=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Message-ID: <40ac27ab-00f7-4fc4-97ca-f3b519167f5c@0upti.me>
Date: Tue, 3 Jun 2025 21:17:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: phylink: always config mac for
 (delayed) phy
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, bridge@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250107123615.161095-1-ericwouds@gmail.com>
 <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
 <4b9b2a9a-061b-43ad-b402-a49aee317f41@gmail.com>
 <Z31CJS1YUvPGiEXs@shell.armlinux.org.uk>
 <98234080-946e-4b36-832f-113b185e7bca@gmail.com>
 <Z3-Tz5WdLCat91vm@shell.armlinux.org.uk>
 <9cc913d7-7e5b-4b6c-886c-ca9778c3f970@0upti.me>
 <aD1lRha-enQ9Pw0g@shell.armlinux.org.uk>
 <2894a781-4d4b-4e3c-9f4e-7c1f04122f8a@0upti.me>
 <aD3Cc7gmB2Tev_ul@shell.armlinux.org.uk>
Content-Language: en-US
From: Ilya K <me@0upti.me>
In-Reply-To: <aD3Cc7gmB2Tev_ul@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_111735_441893_D72E629C 
X-CRM114-Status: GOOD (  11.88  )
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

On 2025-06-02 18:25, Russell King (Oracle) wrote:
> On Mon, Jun 02, 2025 at 04:00:14PM +0300, Ilya K wrote:
>> That's weird, because I do have all the patches applied. I think this may have been broken by the pcs_inband_caps changes, because without the patch I'm just getting "autoneg setting not compatible with PCS", after which it bails, when it should really reconfigure the MAC instead.
> 
> Please enable phylink and sfp debug (adding #define DEBUG to the top of
> phylink.c and sfp.c, and then send the kernel messages after reproducing
> the issue.
> 
> Thanks.
> 

OK, somehow it just works normally now, even with the patch reverted. I think I grew a few gray hairs over the last few days. Sorry for the trouble, everyone, I'm off to not touch this thing ever again.

