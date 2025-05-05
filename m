Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA93C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 20:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFmYm/gH7A0STrQALijXm5mhTj1Le2eWxnLvg5P4hcQ=; b=jjpE6Oy6HnZ9Od6OQAF7ubuToy
	CEWGkv9k/GR5jNPdQVWblLSr7yd8ogxHahw0QgAUzI+c16uQcszGs7J2QYU5+sUBiB67+8q27/wGw
	v6CkXgX8tpHIjdAtJH20Thre8Z8ZitxJb++WIsBoEoMYSl/ICstaq9S2dCN2d4vYfiuypb7aoBMEO
	hBFQzV89eok/vhg9wOn7d+ISfqUozDvJL7YlVKwoFgZCG3lSJ5Fkvmcjsf91OtABjrUE26vu6ZXiy
	zMkzrsTrZIraH/YdcetCJ+Pwlyuho9U1E+pbeMPHh/cKoLILQDePwzCUvHAvSUJeKIeyUeGRvIbtn
	Pc73y1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC2GX-00000008UBD-3pUR;
	Mon, 05 May 2025 20:18:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC2EX-00000008Txi-3w12
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 20:16:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D44961F1E;
	Mon,  5 May 2025 20:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB09C4CEE4;
	Mon,  5 May 2025 20:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746476172;
	bh=349bf66eeGny6rwMfg6X1fE0CZMMIkpNGVwbI75oRZU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QZoQNGLsK0ooAHqLgBDKlX+R9oisnbhXSEsZ1oYjUlST9fwXGW8F1oZLlKUY3JwnT
	 kg3g6lHfCJ+42ocGBRjPOyc7cqrpDEyoRkKZsFCkgQnZZ45jf26knamqgC2XUrf++D
	 x0qvo/aL5HpPlE4bJ0mhBdrL3FspH/U7o8Ki1tDERBCDJESoeBrJHniWytA7UBv0iv
	 TPbIom3KLa4EnUAd1D8PIs+puObJif3OSr+qtp4+9v3bIdZZnjcn/YQFQVoqUrKKhU
	 jVlb98MzKteV5zBKz1X2TYFApyxJ2oGPjZhJljLcxdJX+ZZ8mEUQtufWaxPycyorOe
	 aIhQ/XqCEy6Qg==
Date: Mon, 5 May 2025 13:16:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v10 4/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250505131611.0c779894@kernel.org>
In-Reply-To: <20250504082811.4893afaa@wsk>
References: <20250502074447.2153837-1-lukma@denx.de>
	<20250502074447.2153837-5-lukma@denx.de>
	<20250502071328.069d0933@kernel.org>
	<20250504082811.4893afaa@wsk>
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

On Sun, 4 May 2025 08:28:11 +0200 Lukasz Majewski wrote:
> > Now that basic build is green the series has advanced to full testing,
> > where coccicheck says:
> > 
> > drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:1961:1-6: WARNING:
> > invalid free of devm_ allocated data
> > drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:1237:16-19: ERROR:
> > bus is NULL but dereferenced.  
> 
> I'm sorry for not checking the code with coccinelle.
> 
> I do have already used sparse and checkpatch.

No worries. Not testing a build W=1 is a bit of a faux pas.
But coccinelle is finicky and slow.

