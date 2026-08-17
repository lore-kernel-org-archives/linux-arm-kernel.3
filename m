Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC972C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 22:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MQDmmi489+J32O1Hp2TCiuVBnz9rSj/w+MrSjdNOg8=; b=kZU6vgwGtv47+R4j3S4EKN6Ngx
	Tatni2uw3rOEkCITakAXdpYQrHWeou4P9t/68bTp/fHUovNsF9siOiDQxE5EnIWzD8ZlmtYX5Z5CQ
	O6SpDRXvvRd1TcTSePb6KRz6s+qJzjwmjY4diAAReKRPp1GGS8spL54T3DetkS/jGbQ8jffBgw0fY
	vdhblFPJQm+dW8JNMUrapv5ES6ZiW6JZ/+foboXuw+ljD59sQefr9YBV9/fTBLh5MgRoxniQUWL2M
	94uFeIL6bB1KEdpYgxsv7Qpk6FSHmsuh4xFbyNl45SirWLRXxMIWihtR0bsjManv3QIdQE4Idi8bx
	VM1OVqJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5yK-00000006wUb-1q4c;
	Mon, 17 Aug 2026 22:38:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5yJ-00000006wUR-0qjS;
	Mon, 17 Aug 2026 22:38:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF52441AAE;
	Mon, 17 Aug 2026 22:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330CA1F00A3A;
	Mon, 17 Aug 2026 22:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787006302;
	bh=6MQDmmi489+J32O1Hp2TCiuVBnz9rSj/w+MrSjdNOg8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=B4aAyeZOXY+TB1DjdqVF58uXzHkWLQC9Fp0dpoPDAc7Y56bIobyPeLrCk7q0O1xK1
	 AYHbv6V1REHbq0WQQO66qeQJnhFcdx7nIuLiLEXMBdv9vdGoLIXYDmXTt/Pb//QPv3
	 WMrM9pBF2EM15AJGLni2ZuyxzmRR/ABnxo+Iq+ESJgbphrzxrkUWocg/Vt7YxmI3sb
	 AINxwZnrDuv34xO6dKWZdr8YHJ2nezXEwpuSIXrNa4fcQUYShxsE0gBBDA9aeLgstk
	 +26DidBbp7m0dIG7MqfhbAynQu2tCDA33RlZV0yYiNHc7qG8O237OwhbesVGOZBHy5
	 PNqm/OdjvVyrw==
Date: Mon, 17 Aug 2026 15:38:21 -0700
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
Subject: Re: [PATCH v6 7/7] net: wwan: t9xx: Add maintainers entry
Message-ID: <20260817153821.6ee1b4a8@kernel.org>
In-Reply-To: <20260811-t9xx_driver_v1-v6-7-2c969fad57c6@compal.com>
References: <20260811-t9xx_driver_v1-v6-0-2c969fad57c6@compal.com>
	<20260811-t9xx_driver_v1-v6-7-2c969fad57c6@compal.com>
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

On Tue, 11 Aug 2026 15:14:29 +0800 Jack Wu via B4 Relay wrote:
> Add MAINTAINERS entry for the MediaTek T9XX 5G WWAN modem device
> driver.


Please squash this into the first patch

