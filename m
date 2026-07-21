Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F97C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEDb1rdTXXaOxGcVedScyLy6E03LA81nmhhVXtSJWRo=; b=Q2U5hMifMjE1nr8ACZTC3dEUfV
	VzXtVKRcvp1+6i+I9CKBHDaqvyG1cPD/rGk2geuvxiUZ9l2ZotEjEqIlznORNGRuouHmJrZRUD8QR
	fTwLzoQ6q39EirFFUQJprk5a5BCue4ormGv0snwclFwXJhE56xhtTwx+7U8PBH259GhWptBrpauoY
	rITXsNFkAZUID7sxIdmN2wF0Rb+CfXsHCS1lTdjEY/InYG3KbP9OsQFeJLlRcYe5bll5gWsx52n1Q
	DGsCg4KqoQTe8KIzxeohDAWtXsotBp0PW1VCAklea/Py5htl8dQ4tkWO8g6MnXiR4HS/vaEYMwZHH
	N1hUHUZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDD3-00000009sKg-2zRd;
	Tue, 21 Jul 2026 16:20:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDD3-00000009sKP-1Lw4;
	Tue, 21 Jul 2026 16:20:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 565CC60204;
	Tue, 21 Jul 2026 16:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4071F000E9;
	Tue, 21 Jul 2026 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784650844;
	bh=TEDb1rdTXXaOxGcVedScyLy6E03LA81nmhhVXtSJWRo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Iqx5EZH6ygkfr0meqZq3fusjkqWib9uCYd7aOapnev/TowlPDbzWI2gmLCW+irH5P
	 fGa2vMQq2/E2s1ACy/jHVO+UCubIWZD9zkjbbWLjeUpxs8Rh5v8zpZWWu9fDzUGMXs
	 47TqWH3l/7jyAn21OBokR+GZD5IOh4btZpSCf6drWWejmbl3Tv89sjMMS4APpl9PR9
	 QvuhZp1JmQqYKOrq9JkmS8PKwuKSD87AM8fvor21xTDkNQlkmORNvRQCujabxV/d2L
	 YA15rGFzWJsDkoCaVkur79X78Oy1x25B5erzHToXjxG/uYSCsv3Avl9W9uSrvAZj8Y
	 27Isyc+e11nWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A6E3924FFE;
	Tue, 21 Jul 2026 16:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7] net: gro: fix double aggregation of flush-marked skbs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178465081339.386198.5230421842534744687.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2026 16:20:13 +0000
References: <20260709014704.3625-1-shiming.cheng@mediatek.com>
In-Reply-To: <20260709014704.3625-1-shiming.cheng@mediatek.com>
To: =?utf-8?b?U2hpbWluZyBDaGVuZyAo5oiQ6K+X5piOKSA8c2hpbWluZy5jaGVuZ0BtZWRpYXRl?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?b?ay5jb20+?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, willemb@google.com,
 daniel.zahka@gmail.com, alice@isovalent.com, sd@queasysnail.net,
 eilaimemedsnaimel@gmail.com, imv4bel@gmail.com, nbd@nbd.name,
 dsahern@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, steffen.klassert@secunet.com, lena.wang@mediatek.com
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

On Thu, 9 Jul 2026 09:46:39 +0800 you wrote:
> Commit 0ab03f353d36 ("net-gro: Fix GRO flush when receiving a GSO
> packet.") added a flush check to skb_gro_receive(), but
> skb_gro_receive_list() lacks the same validation.
> 
> As a result, packets marked with NAPI_GRO_CB(skb)->flush may still be
> re-aggregated.
> 
> [...]

Here is the summary with links:
  - [v7] net: gro: fix double aggregation of flush-marked skbs
    https://git.kernel.org/netdev/net/c/e751256486d0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



