Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E54CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJXT1xI3v37y2AY37i2OD+8feP3/HvD7NTqxseZjEsg=; b=R4ffln9De2v+LZN/0b3UpLDyP4
	pO4sp9wdlEYiMVZALIacohbNTauJwV9m0lfsa8/DYK5NdTCM2N0+ikGrWbE/N7dwkhEUI5hHLnGWi
	1cljl936J4i74ud2ypZRiI45is5BMHE1oCXNQladRxvxH3CS35Gkx0BZXgqLxdhJOXDjysg4lYLqB
	zBTgXBUzx2j3I855wiYwsB9wkcJyr6s/7HONQiLdqwmFuixa22ZryeONr8+KB9Dr7QjFhJV5/xYC6
	lAc9/vg0lhsC7Xlg6k9md58UPNNUCUhS3e6T/TfaGoFeM7/lv2GGoQiFyYKXkV2WCuTCLP1hKJBT1
	TidhWnOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8DMt-0000000CWsi-0sFv;
	Mon, 13 Oct 2025 07:53:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8DMr-0000000CWsa-3uaN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 07:53:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2E1E60EDF;
	Mon, 13 Oct 2025 07:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54617C4CEE7;
	Mon, 13 Oct 2025 07:53:15 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id D4A8E5FA42;
	Mon, 13 Oct 2025 15:53:12 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250923140247.2622602-1-wens@kernel.org>
References: <20250923140247.2622602-1-wens@kernel.org>
Subject: Re: (subset) [PATCH net-next v7 0/6] net: stmmac: Add support for
 Allwinner A523 GMAC200
Message-Id: <176034199282.234636.10650174207490097271.b4-ty@csie.org>
Date: Mon, 13 Oct 2025 15:53:12 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Tue, 23 Sep 2025 22:02:40 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Hi everyone,
> 
> This is v7 of my Allwinner A523 GMAC200 support series. This is based on
> next-20250922.
> 
> [...]

Applied to sunxi/dt-for-6.19 in local tree, thanks!

[3/6] arm64: dts: allwinner: a523: Add GMAC200 ethernet controller
      commit: 460a71b5642a60574809032f0a21afff0f942474
[4/6] arm64: dts: allwinner: a527: cubie-a5e: Enable second Ethernet port
      commit: 7076938d20d22d5f75641f417f11edeee192e3cf
[5/6] arm64: dts: allwinner: t527: avaota-a1: enable second Ethernet port
      commit: 2e5d147ba90e887271297f69721d2d88122c7c4f
[6/6] arm64: dts: allwinner: t527: orangepi-4a: Enable Ethernet port
      commit: a3606e8a7819534026b46e2b8c7b0e156e292f13

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


