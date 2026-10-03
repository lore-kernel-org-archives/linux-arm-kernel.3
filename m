Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAC2CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrBYuxJRI8Q0gYPvH2mARUPM0a0QmKyyZXNcWC/6qBU=; b=bk49pm/cvFSkbNfNkrCClLpGBs
	zBBJAimBmbR1UYDBtf/CFgBn1aNPU/dJz6PFE5rB2Z6c6e4OsNLzIPl/Fx/q1ykzmF8e6kbaXOkBy
	KEdWIhGudtnvANWyslN/OoUFfY8griO39/R+6rLu2bf/oQnS/UHgJdyUM2XJjLRykb2sCS21ul4wd
	ypLSMQh6MlodfC4ng3MopCBp3zTYNtwYgaayQNHtD0nQxUST7d8AYmtsTiC5uO0fGGemECHv2J+YH
	CluXvVNopnB99Oble/qiUYD+PPcZfH/M74ZTP+ZKHX7W8Ka0hxPRfjfcuZWv2dao086XR12PuF8pR
	ghvVh+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwAN-0000000DHj4-0mTD;
	Sat, 03 Oct 2026 09:36:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwAL-0000000DHii-2HUm;
	Sat, 03 Oct 2026 09:36:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 408FA4359F;
	Sat,  3 Oct 2026 09:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04801F0089C;
	Sat,  3 Oct 2026 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791020185;
	bh=MrBYuxJRI8Q0gYPvH2mARUPM0a0QmKyyZXNcWC/6qBU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kzA2DMIs3EUtDVSj0D37/deDvrCJb8OHldkuyNuYtIzVLVnjGVEr6538nJKIb9M0i
	 XGPf2Uf/IDYVGE5zoBZbX8hbpT4O3+aj6QG/4Hsh/msjtBZ6EvSUIW6L74StrtVTty
	 wTh+Yz932o20f9ZY2jO4BQS8xXIZHaNC2RHjrEyQ1hJE0P8PbBAmyAxk2TaR5bi+eb
	 8+VY1kshFzf0cH9hD9OYt5DOhylO5OTtE/AO9zOGTXKFZWffYxAg3mCkBhlWPLP7e7
	 uerw1wJ868hHFRf1bhxEUUhhtV7W2QC/Ctm6yqKUHBf67HvkQip+HCopBTa8Vlxaoi
	 gjdBa9B8WGADA==
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nikolai Burov <nikolai.burov@jolla.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nikolai Burov <nikolai.burov+review@abscue.de>
In-Reply-To: <20260711-mt6858-xsphy-poweron-v1-1-dee2fb71c7d5@jolla.com>
References: <20260711-mt6858-xsphy-poweron-v1-1-dee2fb71c7d5@jolla.com>
Subject: Re: [PATCH] phy: mediatek: xsphy: clear U2 DTM0 force bits during
 init
Message-Id: <179102018248.199361.12549208373713075681.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 11:36:22 +0200
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


On Sat, 11 Jul 2026 13:34:46 +0300, Nikolai Burov wrote:
> On mobile SoCs, the USB PHY is completely powered off during bootup.
> As a result, various bits in the DTM0 register are set that prevent
> the USB 2.0 PHY from functioning. Clear them as part of the
> initialization sequence.
> 
> 

Applied, thanks!

[1/1] phy: mediatek: xsphy: clear U2 DTM0 force bits during init
      commit: 02df7fe1297d35d33c9841f345f61bf10f969300

Best regards,
-- 
~Vinod



