Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDC9C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 22:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udONfB0KqPlNsNyooEvhiKK+MK28bo75R+x50okB03I=; b=bHLDOmhbl70py8/tvLUsaSph2j
	rhsxCi021caBqMMhIjGvWIX/JzaTo6iHcGmrVT3X+VBsDxkTpaJSw4IYDM9jurz4YKLvwJ1bUlAm1
	lA8VODb+5rUJMFJnUN0+dKecyVo7HPG+HZklNZqvRWjcdVJrvfg7dBLG2yLrKBHt9GtNd7Sfq7Hi4
	BrskR6YEcgZ18sbvae9CMjvlr+N31CAJZg8NP3mch4yE4EBVlyHCsoRSFxyENqU0aa63ZI1iQd90B
	jYhOEjG3VbdYLYqGE579HECKuHGjq0E7BcMr07vP5OiKmVfpfU783pGPr9gosIxnIACshTDNxrbho
	ilEzhYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5zu-00000006whS-30iY;
	Mon, 17 Aug 2026 22:40:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5zt-00000006whC-2sy5;
	Mon, 17 Aug 2026 22:40:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20771600C8;
	Mon, 17 Aug 2026 22:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9C41F000E9;
	Mon, 17 Aug 2026 22:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787006400;
	bh=udONfB0KqPlNsNyooEvhiKK+MK28bo75R+x50okB03I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VQHiLBMFGQCgeoew6Cp4Ows756OkMTcKte3toNPglY/bGSasnVZuHKMz8eXnxbElh
	 jsBGBwsL3xfxOTdgVVpOTDDU2C70vLO5VTYBveLAOTn8yG/FNoeanEwmfEDd0peSw8
	 7CsCsSF0+XSukhQmxxssL1Sly8Ixga9t1wvzsXXwhuj3kGtIpCuHEdMypW4KOpaBaX
	 XAu0FMlO4QQkI3hO6viDTnZPCS6YhpoVyK82jTwb1uLmVC8SwU5WWXN0ITiBkwvwJZ
	 aKpy5RJNdPbI9ZbvayusP0l7sPqUN6YOJqvwCcAU6D8YF54bDafqh6+DiNPEfsiJJY
	 Ip1r2Gyhdzlcw==
Date: Mon, 17 Aug 2026 15:39:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Cc: jackbb_wu@compal.com, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg
 <johannes@sipsolutions.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, Minano Tseng
 <Minano.tseng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Simon
 Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Robert Yu <robert_yu@compal.com>, Jeff Chang
 <Jeff_Chang@compal.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 0/7] net: wwan: t9xx: Add MediaTek T9XX WWAN driver
Message-ID: <20260817153958.4b120ce9@kernel.org>
In-Reply-To: <20260811-t9xx_driver_v1-v6-0-2c969fad57c6@compal.com>
References: <20260811-t9xx_driver_v1-v6-0-2c969fad57c6@compal.com>
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

On Tue, 11 Aug 2026 15:14:22 +0800 Jack Wu via B4 Relay wrote:
> * Core logic - Contains the core logic to keep the
>    device working. It includes:
> 
>    * FSM (Finite State Machine) - Monitors the state
>      of the device, and notifies each module when the
>      state changes.

This FSM exists in the driver, even tho you call it "core logic".
Please provide more details in the patch description of patch 5
and consider whether any of this logic should live in the WWAN
framework.

