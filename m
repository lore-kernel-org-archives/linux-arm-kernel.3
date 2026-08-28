Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D1FC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 21:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02/+eupWtl3O4k6yVI+71Pv7fqgZ37drhXSlQCN+ujs=; b=RrHFtsszm0zh+j2eh0ZbYnz1qt
	VO2mdSE00os3dFeC1sH2tsrEG59JaJ8pAhmOjeBITHYXCOcqfkJPLILTTdypseKK8DwmSzzRw+0pa
	76McZXuJdguT1LcdumVpvmKfAS59kf518nTm9BsZoGrZbDYAMh4Z4YiMPqZMMIlAQdcUEi8123GNN
	1KJlEGvWHneyPUHMMKXo65gOsnp1cUdZAcjBYqxg6miMCcaYBdH2+tWCjXeNLyKyWPb0XJtg+zwnx
	I90uV12QIJxmxuZAhEJfTDhMO2hm/k2qQC4cp/GKdqlu4EFESixFhGwJ1TQaJgkEYAMADaDJPGlNB
	Q5nFiM4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x046M-00000006Rfo-2FPY;
	Fri, 28 Aug 2026 21:27:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x046L-00000006Rfe-12kW;
	Fri, 28 Aug 2026 21:27:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FB59601FE;
	Fri, 28 Aug 2026 21:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356141F000E9;
	Fri, 28 Aug 2026 21:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787952423;
	bh=02/+eupWtl3O4k6yVI+71Pv7fqgZ37drhXSlQCN+ujs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=C2HFt6btPYGvEEXCOeD51VYsRyAawkN1xcRdtVHNaEfWgGFQ6Cas8WxJQj0SriTPW
	 VOpl1upc1K35RSImJFq7ZYVkvj0DyktI/g7GWioBredtOrVPQSKQD9+CxMU8qwujhR
	 W0Eb9KjLAXnCezDAqj9ZXm6TANnpD+bbMhtPeDbHXrWHX+3BROqi/47W/TBGzC0Xra
	 8hLMCLbuJKLrzblKPjpZCu0IEHHYc9COfo8w5ZSd64dKcdLsYXNuNv8y8nSmT4TkFY
	 76a4wTXy3/EdlVunwrAE27zSwGYTbJ0mjoKkiwMo8AYDX4o2LV6tycOGLVFinPczPR
	 GNwBrbNzqFOGQ==
Date: Fri, 28 Aug 2026 14:27:02 -0700
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
Subject: Re: [PATCH v7 0/6] net: wwan: t9xx: Add MediaTek T9XX WWAN driver
Message-ID: <20260828142702.0736cbee@kernel.org>
In-Reply-To: <20260828-t9xx_driver_v1-v7-0-bf8f6074d88a@compal.com>
References: <20260828-t9xx_driver_v1-v7-0-bf8f6074d88a@compal.com>
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

On Fri, 28 Aug 2026 17:17:17 +0800 Jack Wu via B4 Relay wrote:
> Subject: [PATCH v7 0/6] net: wwan: t9xx: Add MediaTek T9XX WWAN driver

net-next is closed. Please a week from now when it's open.
Before you repost please fix the bugs pointed out by AI:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260828-t9xx_driver_v1-v7-0-bf8f6074d88a%40compal.com
This link will only reveal the results next week per the embargo
message, wait for that to happen of course.
-- 
pw-bot: defer
pv-bot: closed

