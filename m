Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFB0C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 00:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yirCD5X6JRo6FnvaQn8dOoocTC1WS5mRd3Z8F+DJEGI=; b=YuUULHSaijQaIZr6wIIZvTp1cs
	NSD8Zn5rXiIPU7xbthad7LfD2gFp6eRU6A+VXiH/l2d87I1Pq5apzSJQ9zFwMm0+IWMzNQvo+dO9k
	3j/zcrDke3oNI23qpO311GR/mXYcnaXrVfQUpMuTgTudYxE2v6+MjJxuYo5fqQfV6zz4uFHbyLFPA
	aIvwg92+gOkZB/sTxj9aa2JoTpuX8Gi0dl0F8/tjezCJqvtrikh1PuQuK9F/ESmiZrNwLFARPcvag
	Cm/J/PtfAHSe3QHoIRDS1JQ3walvh5h/nVV2iycymhJP0/8m0aEdBKII0V3xFLVntNkPd+gYuPTIn
	X39sPwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuJez-0000000HDfW-0Mc7;
	Thu, 13 Aug 2026 00:51:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuJey-0000000HDfP-27dh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 00:51:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CD6D5439C2;
	Thu, 13 Aug 2026 00:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0131F000E9;
	Thu, 13 Aug 2026 00:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786582263;
	bh=yirCD5X6JRo6FnvaQn8dOoocTC1WS5mRd3Z8F+DJEGI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=lCq9pPB1LayH5HtbYkpt4oX+TiDhrC2ZJv8lbWaZJ7i7gw/4l82h1cydXjhWWHJpA
	 q+WYj4ve6Hg/HclNwhCB3+IQdvRfBtRePYCyn3PVkc6brvbQIyEQFMSlfGvhao9CEJ
	 7+6mayWRKkUtsbi9a4EJSlCHrpfiNe5Jt6/yZ1mGTYHcA1qIFNwI3A8N0Ow7IGVzmn
	 zCvSBSGGmpbaFetVsHP7EkJUW87yT2Qt7/bpQceb91yJDBk5+cHgxdQm5ausQf2ipE
	 fnvyt1qQr4pbN5nafhEJuG6wEB97q/VdibcN/shcIt3KjCJDQXwdlQCTpmU2gOG0Fm
	 O2lcfHXSZMAUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19913380CED0;
	Thu, 13 Aug 2026 00:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: ti: am65-cpsw-nuss: Fix port_id
 extraction
 from SRC TAG
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178658221863.2168272.12259674468445322692.git-patchwork-notify@kernel.org>
Date: Thu, 13 Aug 2026 00:50:18 +0000
References: <20260807111738.2055900-1-s-vadapalli@ti.com>
In-Reply-To: <20260807111738.2055900-1-s-vadapalli@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, c-vankar@ti.com, horms@kernel.org,
 vadim.fedorenko@linux.dev, v-singh1@ti.com, nm@ti.com,
 daniel.zahka@gmail.com, nora.schiffer@ew.tq-group.com, oss@vassilevski.com,
 grygorii.strashko@ti.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srk@ti.com
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

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 7 Aug 2026 16:47:37 +0530 you wrote:
> On the packet reception path, the ID of the MAC Port on which the packet
> was received, is embedded in the RX DMA Descriptor's metadata. The ID is
> extracted using the helper function cppi5_desc_get_tags_ids() which fills
> in the 16-bit Source Tag into the 'port_id' variable. However, it is only
> the lower 8-bits of the 16-bit Source Tag that represent the MAC Port ID,
> while the upper 8-bits are Hardware-Reserved and carry an arbitrary value.
> With the existing logic, sporadic kernel crash is observed due to the
> subsequent driver code accessing out-of-bound memory because of an invalid
> port_id.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: ti: am65-cpsw-nuss: Fix port_id extraction from SRC TAG
    https://git.kernel.org/netdev/net/c/36a05d282007

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



