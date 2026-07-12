Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94201C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 14:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rgbu6YiDUX9kznSJSlo+OHz7QKMcuRkPsGR/yA4U/Cc=; b=YCLF5abtjbsr3WNHFrwiA0HFfy
	R/oCLDVz9h65o5Kd9FoKkRCnBDsAU8XwiMT6Mv9EjKpdRQsr2Vo0bTd3WTdtUslQiX9izBeA+vfpy
	i1Fp5hCAMs8A4Sr9BPY8fegbmix2e9Klv/sfx7qDedbuRkXqjb7TiHmvYopsPEKLOTZl3fGn+nu7P
	J6x5bRzs5APRTUWJcxTNIm6flOkIkwt+Th7YTad/urGSKezIITX4bx3jugdiDb5G/5LqvAWO7b2JY
	0evESznLpsp74k0pBVJLePP6h9uWIDnVsyzxJQ/XtCiHRejL+svkOcCSu3vGfFptntfs7ya/ZaYFN
	ciZACZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivVY-00000007XJ9-0dkg;
	Sun, 12 Jul 2026 14:50:16 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivVV-00000007XId-2KZA;
	Sun, 12 Jul 2026 14:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1783867767;
	bh=Rgbu6YiDUX9kznSJSlo+OHz7QKMcuRkPsGR/yA4U/Cc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e1f+qC+L/WnrDmmFa5VDmWfCQGJJmU9bOVHt5snbPF8fi/BKsz3/qb1GkPUE0p/3+
	 M2KLArFP9AgM+wzed/pgadxFOk3u4quiCcXHV+X24rR6A9PwmtC3ieuuiW3K5gsMKj
	 14cSfFjUJ9Q+9MPOpdj9frQWqoxI7TAs/e9hKriXEqerM733L5CwqAVqwBJ0kbBVM8
	 P7/aowqXTgMMcCah3k1GJYwucCF4Ild3dlLv/bcCa24dRK9+bK4QJgmoAiKzut1sC9
	 tZhstVazyV3ZN6Rtp7UT837VBE+896rjsA33YVVLfM6o0cNetHLRZuGPa8ueBTwJXy
	 l7eKaYLWxXNkw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 11F2EB2214E1;
	Sun, 12 Jul 2026 16:49:23 +0200 (CEST)
Message-ID: <203fffef-bef1-4d56-a6f0-a2fe482821db@freeshell.de>
Date: Sun, 12 Jul 2026 07:49:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Failed to reinit phy of spacemit-dwmac when reset-gpio is present
To: Andrew Lunn <andrew@lunn.ch>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yixun Lan <dlan@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Han Gao <gaohan@iscas.ac.cn>
References: <20260712045233.800748-1-inochiama@gmail.com>
 <bc78469c-3f45-4234-88b0-49f050d651db@bootlin.com>
 <8689bf7d-e00d-4097-bd3c-4d7d7844d1d2@lunn.ch>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <8689bf7d-e00d-4097-bd3c-4d7d7844d1d2@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_075014_056700_4A605920 
X-CRM114-Status: GOOD (  10.40  )
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


On 7/12/26 06:49, Andrew Lunn wrote:
>>> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
>>> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
>>> @@ -196,7 +196,8 @@ &eth0 {
>>>
>>>  	mdio {
>>>  		phy0: phy@1 {
>>> -			compatible = "ethernet-phy-ieee802.3-c22";
>>> +			compatible = "ethernet-phy-id001c.c916",
>>> +				     "ethernet-phy-ieee802.3-c22";
>>
>> Indeed that's merely a workaround :(
> 
> Despite is being a workaround, there has not been much progress on a
> generic framework for dealing with clocks, resets, regulators etc,
> before probing PHYs. So this is probably what you want to do.
> 
>        Andrew

Aside for my participation in reporting and testing here, I confirm that
the above addition to 'compatible' node does not itself resolve what I
observed to be a problem for debian-installer, however it does itself
resolve the rmmod/modprobe cycling issue of the eventual installed
Debian system as I described and what I am quoted as having reported
from dmesg output.

So the other report of increasing de-assert from 10ms to 50ms is needed
for success of the debian-installer hwprobe detection, and this here
issue of adding to the 'compatible' is needed for success of
rmmod/modprobe cycling. In concert together both fixes resolve all of
the trouble I observed and reported, tested and verified on Sipeed K3
Pico ITX.

Thanks for tracking this down it is very much appreciated :)

With that,

Tested-by: E Shattow <e@freeshell.de>

