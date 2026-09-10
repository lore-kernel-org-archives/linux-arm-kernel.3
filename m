Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5A0C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9s3dbjpQkzsiVVJyqVDj2DYOx7r7jEs5RAl7koa46/0=; b=yRsmSxaXCUoa/bxbyLRCuMhUfi
	2WGjaL46b28CsOP5BvIFFcXBRDas1738bOM0oN4zXxvJuPmY2/iEYAMHxxsbp1oVKCKufBPQqzM8T
	9VKg+sKZg+6h5aegJ0DMpmzfjbkjj2d5B76DGiqY83bFGCmuxP8aaHs40l5pGSBi+utLhUXJAEoC0
	xnY4z0l0gHiUA9AzCeQOej4Bw7xGb0gy4racLGyhd7hr6yWoV5hR9W93oarWRYZLZ/3UPQ5FtDRpM
	Q4PUnpIxWwQnu7Zn3CQ9cLh/HQ+C9weRMZZZwAmE/JOhYmDmv4S+wLuA8PObC5G0R8zzgJNwlxKu+
	ZpJCwDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fQi-0000000EZdp-0pfw;
	Thu, 10 Sep 2026 14:07:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fQa-0000000EZUW-03Zv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:07:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 75BAB601F1;
	Thu, 10 Sep 2026 14:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4821F0089C;
	Thu, 10 Sep 2026 14:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049219;
	bh=9s3dbjpQkzsiVVJyqVDj2DYOx7r7jEs5RAl7koa46/0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WskmYreAF4fUUx0w9aQ7KU9ip/RwqHAMgCarp2hhnSv+5/AuLtIxnvhlFLlQM2jvu
	 Qbk1O8JA2RW8JgdSpvFvgOQXw2tYkkIJj8tMYM/q3t4XpKa/ZLwCGB7QsQkeaqT+TO
	 s8Fkvqzg8wm7FfvgiO6dhooCkQQSq5bOC4UFzJJsRfhk2BkJYWgIfu8x50be9gikkB
	 Sm4njabqa1Md2c6v0llvrlkcJoSPDS5ddh2pSwb4UCxYpVLe6xOutBe7DDLU/3Qp8i
	 6d7d5MvMOumrobWJzgOWOUIT9RVlCLPOgSM2kyM2D0RlgjqCQhz2U6NRssgn9JxCLw
	 cdlBnTKWtA9gA==
From: Vinod Koul <vkoul@kernel.org>
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Frank Li <Frank.Li@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20260817-dmaengine-pxa-v2-1-f42ab0569a48@pengutronix.de>
References: <20260817-dmaengine-pxa-v2-1-f42ab0569a48@pengutronix.de>
Subject: Re: [PATCH v2] dmaengine: pxa: fix double counting of the hw
 descriptors
Message-Id: <178904921538.109109.3118643113304356856.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:36:55 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Mon, 17 Aug 2026 22:44:33 +0200, Sascha Hauer wrote:
> pxad_alloc_desc() was converted from
> 
>         kzalloc(struct_size(sw_desc, hw_desc, nb_hw_desc), GFP_NOWAIT)
> 
> to kzalloc_flex(), which sets the __counted_by() counter sw_desc->nb_desc
> itself - but only where the compiler has __builtin_counted_by_ref(), so
> from gcc 15.1 or clang 22.1 on. The loop below it still increments
> nb_desc, which makes it come out doubled there and correct elsewhere.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: pxa: fix double counting of the hw descriptors
      commit: f6504be006aa4bb4bd26285f410a885c17920d65

Best regards,
-- 
~Vinod



