Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3798C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 20:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txwIcghIDFQCole2IsQwq4GyoOsv4SwBZ6WsmT3EGbI=; b=MfduKPsKFOMaviE5qPnLZIqhxp
	hiK4DiCZp5LuH9h29D+B4T089SbScUu8vnh1u8wMhULFv/Z2kvGMH2trQH26pXV9I3g/kDGd05sve
	fp/r1jxzlTHmHX6lJghTYvu0TQx7Dj5OCDzxrgnvuo+L3ON2jWta6gkl9M8anvoxuuxqwTMw6PG8f
	Y70Il1jAJ9fdLld6nntlAzCxqJr7Wry/JgaBwmE8va58SMbVNt6rfDL3g/g45jrXRPpfCEvlGI12N
	BKP9mDdm4LrSe0gh4fTlO6OushW0UaHWqkaYSF27BNpoSxJgqaknvvQWa+POzge1hi70A9Kd+SIvc
	wrmd9vRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyx8-00000003BLu-1NOv;
	Fri, 14 Aug 2026 20:56:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyx6-00000003BLg-35Lu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 20:56:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42FEE432F6;
	Fri, 14 Aug 2026 20:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7B81F000E9;
	Fri, 14 Aug 2026 20:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786740992;
	bh=txwIcghIDFQCole2IsQwq4GyoOsv4SwBZ6WsmT3EGbI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FUWUtxyY657nby0HMqTftl3yTxOs+pbLkKWwCXElBHayuIGmDamX6czcgqqQy5aNi
	 qtMNU+N++LxoDxCvKKnIIT5vl9nsTXnmR7UqtrrAhKGgo+iHXfw7xK0SyayGiH8ZeK
	 S29KvMpUX4MeFyEZIHqMfoZFYHa4Tac0FV3xVBvooq375wj8e6CNGhN5KfTdPUMbSj
	 c+IYnyC09YbKJtp4GGbFS7RVetJZjyKLRQ6EqCKxW2rdPkkpR4B+jqgJJ3FiltsnKK
	 1d93DxnpcxlGy6P4xpdi/U+kBglFsxs452seqVxh3Crtypl5+DOP3d48qWSfRsrIb2
	 ds4R5FquXjpcQ==
Date: Fri, 14 Aug 2026 13:56:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Daniel Thompson <daniel@riscstar.com>, Alex
 Elder <elder@riscstar.com>, Davide Caratti <dcaratti@redhat.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 2/3] net: stmmac: add tc-mqprio qdisc
 offload
Message-ID: <20260814135631.766ceb41@kernel.org>
In-Reply-To: <20260808-stmmac-ets-offload-v3-2-b714466142b9@oss.qualcomm.com>
References: <20260808-stmmac-ets-offload-v3-0-b714466142b9@oss.qualcomm.com>
	<20260808-stmmac-ets-offload-v3-2-b714466142b9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 08 Aug 2026 16:49:58 +0200 Lorenzo Bianconi wrote:
> Subject: [PATCH net-next v3 2/3] net: stmmac: add tc-mqprio qdisc offload
> 
> Implement offload of the tc-mqprio qdisc in the stmmac driver. The MTL TX
> scheduler is switched to strict priority, and the PSTQX/PSTC priority
> bitmask of each TX queue is programmed from the set of frame priorities
> mapped to the owning traffic class (qopt->prio_tc_map).
> 
> The offload requires the DCB feature and a 1:1 TC to TX queue mapping,
> with the queue ranges bounded by the number of queues the MAC implements.
> Configurations with AVB queues are rejected, since forcing strict
> priority conflicts with the CBS algorithm.

Clashiko has a bunch of comments, I assume at least one of them is
actionable. High level - you say "add tc-mqprio qdisc offload"
but the driver already has a bunch of mqprio code. Background
would be useful. You also say "1:1 TC to TX queue mapping", if there's
only one queue per priority why offload mqprio and not prio?
At least a note in the commit message would be useful.

