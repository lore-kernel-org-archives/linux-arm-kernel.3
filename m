Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9192C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Pm6YjVPTn66E175rLBZQYOV6tuo0Tyec/7ISEHA5r0=; b=tLjrm+p/U1Uy6/TC0pXGtaHEhW
	zY7Khbs5VS4pkf7pn12fLowb1wqg2Q27Lhno5MbPFMEMvTU9LEk+izqvjUJL6POYqvcISoBsXune+
	gP9p086U1eZUsD2LqbhQK9QWJLNWAuvC/8juTJhsIjATBcUQ030RlNHlkKq9BgOhQGMlO5kc3fQCK
	n07nwQ8kirUsmLMbjG3zJ/PvUjUQwsmtEQ8nrZZJcxw7zevwyIIL2OzeYNRCOaHwIeX/9vI7Ad0E7
	05yT0Z4xUHA/iYyeHZCAqdphHQTu/HKUi+fTAGCCkTBa8ghbKSXBSPxZdsdinPP3+wdRFIYhSuZ2i
	OCidfudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiC2c-000000054HG-2IPK;
	Fri, 10 Jul 2026 14:17:22 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiC2a-000000054GZ-03CO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:17:21 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id C0F5BEC01AE;
	Fri, 10 Jul 2026 10:17:16 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 10 Jul 2026 10:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783693036;
	 x=1783779436; bh=/Pm6YjVPTn66E175rLBZQYOV6tuo0Tyec/7ISEHA5r0=; b=
	ZGXnd8Pi59/LlTc2LG27zo/SicfS0oRRwDSZyIPFtp7dN6Q9U5zTEdJU4yxFJDF7
	Ygl6dDAlye/yAMOSkV2cc18oGcfgsHz4g2ev/LjPNKwGtYHbpxRByVssBM1z7Xz8
	ye+E03ywUv73k9viTgIbiB4+gb64r53+RYne1SpK+YbjuT+gflEfjBOeIklNRfDb
	0ju+ulq0LzpdVGzCi3h4jDOVflhIbF9NKeLqaf8xOj/sZRXtudB3GF0fBqLz2fsU
	LSNHaiycaPS0QgMdC/0BVAwSpge1JXCrwf0twMshFwPYhM4jaFUOPhfk++X9JZ4U
	9wA1OXR4FYvmHhSKraQPYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783693036; x=
	1783779436; bh=/Pm6YjVPTn66E175rLBZQYOV6tuo0Tyec/7ISEHA5r0=; b=L
	PfOkad6DKsgoqekGgh5N8vib0ODDalz/2FiPfQdkBOyWYns6AhM9BiqtWTXd9JzS
	0J9ztURUmaLRHTAj9Zra+qq6yxkAjqehvX6kFsSRjh7BkxDkpTPpxuv2Q7c0QiXE
	9worAagS5gDre1SL7zckgPd1qnK9gUg0RI+cIwE6NU2/9PZzJzNaUxoLUv9ci4jb
	hNljeyWtG+jpgzj+fsaoGIW7zVxV8BbvliDAnzugDUXCVW3oWputWH87v5QddNfo
	SD9w0x5u54dVugzc20v75jJI32SKHpT3UVT6pYrPKVJHeYk+jnA0y5S5Qfk02wLK
	fylKd7qY+TwOCmR2UBfNw==
X-ME-Sender: <xms:6_5Qar4QGDvj3vQzFs_WDJTKmQbqznB91egj8n6tMznBxpJALetoGw>
    <xme:6_5QaruoANe28olDeO-rLPdBh5N7gVXube6tnPiF6NnBP3x-OdB80a8ZUnCuMs7Fn
    y3regZxu8j5FUu49oTiDEa-DBaIQg2QDAlJqeCZBCr-72F7cWx4R4Q>
X-ME-Proxy-Cause: dmFkZTEtICzMuIfiBuDNE7cd8mZ+0Rq9QDzaIvGcbw6GT5FEBB6x3ZrMUbqJCGQTT0mK9M
    OGw1i2dN09a8qyFf7tgrfim9F+r99hNqMGCm/hNe52E+Ouidfu77eaHT74/+cyOMjZZxsS
    UeXObk1CSaJEg8CnUGxh8aWtqoqMoJZSc40nW/l/Z8RGBYMDWe+azDRFCoq2TtlMYX/I+f
    JdhL7gX+oD37ISvAWda2aKnXUAuyrer/H0v0dh7Di8E3/ZmIyEewctv6qJRny6nkb0PBb4
    /rQzXilfz7bs2NPC8FHmlrUdV2Rjk7kzEN28Eyr8v4ciTOx4bzUcpJgo8Tn82DJ6QWVfoG
    n/WvbYshFr9AN5V5rbfiIgFtXCFfV2d6vtjfVy9BdJRp4EzM1I8IFIAL7mj4b0iG5rL0mu
    pjSC+CJbYBlH8Bg04UM3BAKQDh3RB0BTrweCkk8XwJ7DWOmNJ99mgeQXRfLUVQzNWE1K+s
    0E506931Llr/MJBa5mBIHwwlWeJG337aBNyVpLmXyI/m8ZijyNBytQBEVyR5FFgMPomuZI
    3sNtuu8mbZ80uMeYV5YPORgDSsJxmyl6zUoHEqWAlPmzuRO1h1FUTKaNhQxAE7Pfz3BHKm
    UjG/S2veFn3D1qYWKuZS5GULleHsagQnmcQY/OBxHoeTAvUxFtN+W1oicZPg
X-ME-Proxy: <xmx:6_5QaivKAzR7v5lsVARuzembA89SKAntJpZaB0-Y7nyFmOI7hSd-Qw>
    <xmx:6_5QakICjkQ88MEOvR87A8TzQ01cWfJphkBb5E4U3P51kk5TYNUhEA>
    <xmx:6_5QaholRJF7W8-3fS8DDAxOoIN88AZKg0l7yB-mr_AoiECY7H75HA>
    <xmx:6_5QanUbF3HCrthZaVQG8JS3Rn2I-9YZD8yhMVCuaBOLp59Kpv-dXA>
    <xmx:7P5Qai-HNID-NT-yBw_ZZYdUMyB1-OOpErNqL09Oh0gZHfHsyZYP4HsA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8FFA91820082; Fri, 10 Jul 2026 10:17:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AdFLe7-IZaaF
Date: Fri, 10 Jul 2026 16:16:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zi-Yu Chen" <zychennvt@gmail.com>, "Olof Johansson" <olof@lixom.net>
Cc: soc@lists.linux.dev, "Jacky Huang" <ychuang3@nuvoton.com>,
 schung@nuvoton.com, "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>
Message-Id: <5f2954e4-2e0c-40d0-b67f-933446c83cc1@app.fastmail.com>
In-Reply-To: <20260708082457.460710-1-zychennvt@gmail.com>
References: <20260708082457.460710-1-zychennvt@gmail.com>
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_071720_298940_525BE65A 
X-CRM114-Status: GOOD (  19.61  )
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

On Wed, Jul 8, 2026, at 10:24, Zi-Yu Chen wrote:
> Add controller nodes for the four Bosch M_CAN blocks found on the
> Nuvoton MA35D1 SoC.
>
> Additionally, configure pinctrl and enable CAN1 and CAN3 on the
> MA35D1 SOM board. Also, update the APLL frequency to 200MHz to ensure
> the CAN controllers receive the required input clock for 50MHz operation.
>
> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
> ---
> Resend note:
>  - resend with the complete Cc list; no patch changes

Hi,

I don't see anything wrong with the patch contents, but I think you still
have the wrong Cc list. You have sent the patch Cc: soc@lists.linux.dev,
which is where maintainers should send the patch when it is ready for
inclusion in the SoC tree, and you have sent it To Olof and me.
Olof retired as SoC tree maintainer a while ago, and I'm not going to
apply this because it should go through the Nuvoton tree maintained
by Jacky Huang and Shan-Chun Hung.

Please send future patches to the maintainers that are in charge of
applying the patches, without adding soc@lists.linux.dev yourself.
The maintainers will then forward it when they are happy with the
changes.

I just noticed that we have two conflicting maintainers entries
for ma35:

 - Jacky and Shan-Chun are listed for the ma35 SoC, but have
   not sent any updates after the initial merge in 2024 and
   don't currently have a git tree in linux-next

 - Andrew Jeffery and his team are listed for npcm with
   arch/arm64/boot/dts/nuvoton/ listed as one of the file
   locations, though that contains both ma35 and npcm.
   Andrew has the bmc tree in linux-next and has recently
   picked up patches for both npcm and ma35.

I see there is a lot of activity at the moment working on
ma35 drivers, so it would be good if the maintainers could
figure this out together and provide better guidance to
individual developers. I don't mind pulling from one
team or the other, but I would definitely prefer the MAINTAINERS
file to reflect the actual state here.

If Jacky and Shan-Chun are planning to do the merges going
forward, they should add their git tree to linux-next and
update the MAINTAINERS file to list the git URL.

      Arnd

