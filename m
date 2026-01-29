Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C91D61017
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 13:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U623dX4RFpkw20riF9BbOspWLI1Mth4SOSMFwzOgUzs=; b=v34n+ceFdJPjjMZ6VmHoPqhv/g
	VS5gYTpb+GsYGeX/RaMQGN+oDBh9MGJuLmTa5G/ggC2nVbrREmPSILiaXOvN+WUZ8IYe6bunFL+Q9
	qb37eexZHRLsbUz7AzU82TVxHnco3Rdnzklvrxu9tjbDFSiSIiQpAfveGFgBMcmbbSagM7U0Ec9ql
	6EwULCzEh0GCiiZ/CvUANGVF+HQWlgIj8PQymWLefB/wW8ZJPjqvGnQKjJmrUVaSrA+HqUOlp3gan
	XwyRhLrrg2U3nW336rIyyBR9FHEGlhYBz7lcVxbfvKs+XJ3n5nwX02KgZ+dlUDFY11XnnhU/jk1S2
	q43exQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSPY-00000000B4y-0BXx;
	Thu, 29 Jan 2026 13:50:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSPV-00000000B47-1PHy;
	Thu, 29 Jan 2026 13:50:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64A3760125;
	Thu, 29 Jan 2026 13:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173B4C116D0;
	Thu, 29 Jan 2026 13:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769694612;
	bh=njAphseulUjoK8AcV8JEhX+CD2myxOkOYR9RBZrz5cM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u0WZL1tkJowyLwckCyw8Rdp7Hy6l7Ju1AFUKkMjjazQl5IbCZcbdcuV/oL2Yu5tzE
	 5odwCTVEMcKCeOEmantn7kbzk04mJ9R4n1q7T8l7bnuffpA+7TvrEjM+Lxkno51MYG
	 pjw+bAgdwYflOmorrKAMV9vMbtUOM/fnkM/6efv8WU4pQqHD2HkfHnfa+P9ywrQ2Tf
	 R5nVNq6uwI7irsKZBEviIYr99UCPoXDukVvmvRH9YyiuUBJDIDVKFewwVjzauAsEin
	 2u8BwEcz1Eiux4WdFepqcB58psKEPMcxcK9lEfZILlEliWRV7cJ/mR1ugetoN2/oG1
	 gSM3zG1+4bTAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EB4B380CEC7;
	Thu, 29 Jan 2026 13:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] net: fix segmentation of forwarding fraglist GRO
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176969460511.2509271.18000962996568146768.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jan 2026 13:50:05 +0000
References: <20260126152114.1211-1-jibin.zhang@mediatek.com>
In-Reply-To: <20260126152114.1211-1-jibin.zhang@mediatek.com>
To: Jibin Zhang <jibin.zhang@mediatek.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 ncardwell@google.com, kuniyu@google.com, dsahern@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 bpf@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com
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

On Mon, 26 Jan 2026 23:21:11 +0800 you wrote:
> This patch enhances GSO segment handling by properly checking
> the SKB_GSO_DODGY flag for frag_list GSO packets, addressing
> low throughput issues observed when a station accesses IPv4
> servers via hotspots with an IPv6-only upstream interface.
> 
> Specifically, it fixes a bug in GSO segmentation when forwarding
> GRO packets containing a frag_list. The function skb_segment_list
> cannot correctly process GRO skbs that have been converted by XLAT,
> since XLAT only translates the header of the head skb. Consequently,
> skbs in the frag_list may remain untranslated, resulting in protocol
> inconsistencies and reduced throughput.
> 
> [...]

Here is the summary with links:
  - [v4] net: fix segmentation of forwarding fraglist GRO
    https://git.kernel.org/netdev/net/c/426ca15c7f6c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



