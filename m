Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBF710A3D9E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 02:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Szm82a7QWvbG1l4cNod3Rb11XZkTJ1mmIxeDQmZ4i3c=; b=1UykYawrxlU+vEij3oolvsvTYj
	o08/JwEDocawMqoat1MNdd4eVCXdNXAF8XypgOxaDWFu7ShhH3MvBQRb+ZYAYjZ7QXRU5VYZsvt2N
	Bab6iN3ngIUk7WSa5bvsGdC0WmZMW3+lIRxY7Gcl3Wkt3APR7WS55TJ2C3h1AYtMJWmG6RAR1Bq5Z
	0QID6YOc1NG1x4yhCer4UqQ6DnStP+hdVoLI6CWDhV+uERYNfItzmr44+WPP8TwDMv9Z+C37ugveB
	NWol5uomCNzarRHPLiIWTxRuzXxlyhSHH7dHuRmXQFttzWYP+kbw36NFktfxDh/O9/V61z3zNKwhx
	yyVHfTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5weX-00000006Wcu-144d;
	Fri, 27 Mar 2026 02:10:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5weU-00000006Wbk-3yfe;
	Fri, 27 Mar 2026 02:10:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4683244354;
	Fri, 27 Mar 2026 02:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FA2C116C6;
	Fri, 27 Mar 2026 02:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774577420;
	bh=HWwilsjJarrXBHBtNXrPyxHPRfiQkF06LtsZJa2qGkA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DSuJmIORxKBJJtnJzkNSMJXiooHONZU2DElijz/D7oxorXHmt0c+wnNgMsF3t+0im
	 /l8CBDrFEy8Sk6/YUwytwUbF8WF69hNuMJjVxSzUO9qRoMMfOAWeBT68+m2wwfuQZN
	 7XWEGkLgvq91e8ndQ3sgQneprjb4C9PEIZ52h+UCL4VHLjTShmHK66qGLJRYdwTzcC
	 33Tff46XKsp6nVTEGYlzQApKluVCbj7/KWePE8odAzTdID5FyX5KRakEs8gen5QBEP
	 q1mGN3WSZ3JdMjcXRx04rkhUVG/dUpwaQvp6iJ3d7yw3Itgak66hlmoBe0ixOns4mL
	 2dXSOnZW6N6CQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CEC23809A07;
	Fri, 27 Mar 2026 02:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_ppe: avoid NULL deref when gmac0
 is
 disabled
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177457740729.3263687.4179857130043396261.git-patchwork-notify@kernel.org>
Date: Fri, 27 Mar 2026 02:10:07 +0000
References: <20260324-wed-crash-gmac0-disabled-v1-1-3bc388aee565@simonwunderlich.de>
In-Reply-To: <20260324-wed-crash-gmac0-disabled-v1-1-3bc388aee565@simonwunderlich.de>
To: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 eladwf@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_191023_004946_012D37FC 
X-CRM114-Status: GOOD (  11.30  )
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

On Tue, 24 Mar 2026 09:36:01 +0100 you wrote:
> If the gmac0 is disabled, the precheck for a valid ingress device will
> cause a NULL pointer deref and crash the system. This happens because
> eth->netdev[0] will be NULL but the code will directly try to access
> netdev_ops.
> 
> Instead of just checking for the first net_device, it must be checked if
> any of the mtk_eth net_devices is matching the netdev_ops of the ingress
> device.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_ppe: avoid NULL deref when gmac0 is disabled
    https://git.kernel.org/netdev/net/c/976ff48c2ac6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



