Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA3C606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 21:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S4VEfYTM;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gXhLbcs+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aNINpD0OqmqNIeIsXPCMxFESLxmzCmTKDHZXUaQzoLQ=; b=S4VEfYTMrZhABD
	Pb1IIIN+/Aj3el0S9HqD9d9H9spHSkD/3/2Ckg6GfGa6QmoIbegyzcFqWJKGolLT/65uTr0OwHQen
	7cS8s/M9I2JhZ2DJOrDQxhBjuxSQgHoP9FEfdC50nv+yXq26HCUE7t4lUZnBPq/4h25ffaK+cfdIp
	TEjXySzgmJa/qOlFFGX5n+vlZP3EW81NutMDc0L/CF++VpSlgod6+U7gFGF3LqtfAHm0OrAnUa9bQ
	94AZta7b3cxjRMs41AB5txZGyw2fk1wFixMyjQfFtzUtE7uGC7KMv4oI6FvWopEpBiZ9YjcrbMeTR
	4XO/TrLg/qSm7P2D+SLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMWg-0000000GyOS-0j6i;
	Fri, 23 Oct 2026 21:10:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMWe-0000000GyOL-3z2X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 21:10:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E34B5439B8;
	Fri, 23 Oct 2026 21:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80101F01825;
	Fri, 23 Oct 2026 21:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792789807;
	bh=aNINpD0OqmqNIeIsXPCMxFESLxmzCmTKDHZXUaQzoLQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gXhLbcs+2GvBbodeWXnIW1pHMKWi4m5LdZZuN/0istfhdEOzdKs8rWUr2AvJOsLJj
	 98m6a3Bw/omDsOuC//vDA4p2sO6Oa8Vphj72M5z3cty0DxMpXXNoSFQMb/V6if6B0O
	 c1GPh+UjvulHJmeOsKJUBpcGFAzfenKjvjvrXzy+AYtTV70FzAR9OTJn1xypnjusii
	 mKwVE+yuP157bK9MEf6YINU9FQxnpeQdi8mp5wFtNbjIIgIzH5BMl7kmBT8GJnayHr
	 tVAwsbtIpE9N4DKfKkb6TEBY8HtNobRxp1CzVPUvYcVnvVpMaVp+xqbFuA2NVGzQH8
	 B2qP5LKQ97r+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE56F391B157;
	Fri, 23 Oct 2026 21:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: sparx5: fix tx DCB index drift in fdma xmit
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179278980631.1272863.10742886644709270848.git-patchwork-notify@kernel.org>
Date: Fri, 23 Oct 2026 21:10:06 +0000
References: <20261021-sparx5-fdma-last-dcb-v2-1-7b8fabdb9239@microchip.com>
In-Reply-To: <20261021-sparx5-fdma-last-dcb-v2-1-7b8fabdb9239@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, jensemil.schulzostergaard@microchip.com,
 horatiu.vultur@microchip.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 21 Oct 2026 16:04:59 +0200 you wrote:
> sparx5_fdma_xmit() advances dcb_index before checking that the FDMA is
> done with the DCB, and does not undo the advance when the check fails.
> Before commit f4aa7e361ae2 ("net: sparx5: use FDMA library for adding
> DCB's in the tx path") the next DCB was always the one after last_dcb.
> Since then dcb_index drifts one DCB further away from last_dcb on every
> failed transmit.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: sparx5: fix tx DCB index drift in fdma xmit
    https://git.kernel.org/netdev/net/c/1df26063ab9b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



