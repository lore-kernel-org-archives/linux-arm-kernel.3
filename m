Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A94C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W65ZNRPEmcbNMi7U9IIGGMHb8CAjInAzmkGtNRzRCow=; b=tAG/8/OeoVhovXf+7UwNEMmn/9
	xHzM9NhG2T1jagy6WqxAiUSK1Kz7mJnYtqBVb2YlsipyfSrcK8giOcZhgn4IT5UC/Y2BXaQ9wnFVO
	vMBp41stuKkuU0lMJr/OiPCxDzjFNwT+CGnVib72CIAaeTYo1frW39tBp466CRn8KsASX/lxiXQwS
	2iLeGzs/0wghSKgCks2EiqUpGIhqVXakZ6KeiI7gE7nWutwLe4rT8FtL+7gKlvlnwbmJn3Oo9IJvC
	kPocKIvRAWtFZag5MuU5DGBMvQuTgv3EEziXNDc64LdHiKK3wUiXZPlcxAxIVC4PQ/BhyQ0tIKSS1
	K+VURMRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24io-0000000H65t-3Rco;
	Thu, 03 Sep 2026 10:31:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24in-0000000H65I-2AsK;
	Thu, 03 Sep 2026 10:31:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10E7F40519;
	Thu,  3 Sep 2026 10:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55E51F000E9;
	Thu,  3 Sep 2026 10:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788431464;
	bh=W65ZNRPEmcbNMi7U9IIGGMHb8CAjInAzmkGtNRzRCow=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=OrgdujeEpZ2zTyi3PEuWNgcwgCV/bmsydX4SxC9rBRTKiSiAzz3wFwlaJpwDHC5Is
	 tzbpGhMVNjVjP3jT3iXt0Tedg8sfZkhv15HQwe4pHdY8NJbAYpY1zUP5XEJWaXw/dj
	 toJRQf3Bwmd5GHsZkHo6EcpAUyfi2tBDxY8PwpeDUHBdb3UTW8MsL29UWJQEM4auWE
	 Eh09q9JJ/Yr06BiF4ft8kE/JI7f2pwgpSktbQprw35J9JfNiGgfc6JDnGoSB3bdWtu
	 J25N9MGVavgGSDrI+fyRMSey/MIKu3I5IMVlEAbhf+iM+btkXLvbFmLWtJihkkwOy4
	 jTayLArmL92Kg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A033811967;
	Thu,  3 Sep 2026 10:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5] net: gro: Fix nesting of TCP GSO SKBs in
 skb_gro_receive_list()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178843140634.3256648.8035373141485573563.git-patchwork-notify@kernel.org>
Date: Thu, 03 Sep 2026 10:30:06 +0000
References: <20260901082312.14596-1-zhaoping.shu@mediatek.com>
In-Reply-To: <20260901082312.14596-1-zhaoping.shu@mediatek.com>
To: =?utf-8?b?Wmhhb3BpbmcgU2h1ICjoiJLlj6zlubMpIDx6aGFvcGluZy5zaHVAbWVkaWF0ZWsu?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?b?Y29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 dsahern@kernel.org, willemb@google.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 haijun.liu@mediatek.com, xiayu.zhang@mediatek.com, lambert.wang@mediatek.com,
 Iven.Yang@mediatek.com, nbd@nbd.name, hw.he@mediatek.com
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 1 Sep 2026 16:23:12 +0800 you wrote:
> From: HW He <hw.he@mediatek.com>
> 
> Fraglist GRO and hardware GRO can create an fraglist of
> HW-GRO packets. This cannot be segmented back into
> the original form on TCP tethering scenario.
> 
> Avoid constructing such a GSO packet, by flushing an already
> built fraglist GRO packet if a hardware GRO packet arrives.
> 
> [...]

Here is the summary with links:
  - [net,v5] net: gro: Fix nesting of TCP GSO SKBs in skb_gro_receive_list()
    https://git.kernel.org/netdev/net/c/66817a979426

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



