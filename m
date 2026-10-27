Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ACA606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 22:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YdOQQ3ky;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2xcgAJs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xuq66sDnBhsAplEkzYm7QcixWPor8L5zRdirUDF98Vs=; b=YdOQQ3ky2Hts02
	wUqC4hb/eWw7XAXmYBwC33iunbFZzpfy7ZBzisPqZ0JCoa3ZVRPQBhj5o/D0oPJsxDiHEXPgeogvb
	qrXNHy8howBrH++vfHosvHkZAC9JtONbjjgx5STvFx0uKJ51eAUjWHRRmnrBxy6VnY7m7XtVQK5R5
	VJipQLpqxEN/ZHaNmWp8bJMeouFxK1yJwyq7HHwEwe6MognQR78cUadzvZfK722iT8e3dFAqhjbhb
	tvUlYZioPGR+iLdETZAtU7hDQwLQU85iB35yaxKH/a8HcaJxqFl8V8iosOm58Abvr9C99Pmr1k8ib
	87DT1aTDXz48f7R+6uwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLpgI-00000005qYs-165F;
	Tue, 27 Oct 2026 22:30:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLpgG-00000005qYj-3SL8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 22:30:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4186A601F6;
	Tue, 27 Oct 2026 22:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F321F01829;
	Tue, 27 Oct 2026 22:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793140207;
	bh=xuq66sDnBhsAplEkzYm7QcixWPor8L5zRdirUDF98Vs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=N2xcgAJsVvjA2GHoiyQcvdzZae2VtjCmB4UvxqHSPhnRgRBOwbvmrlS8vSBjyimZN
	 K7ObJX/nInju5WgC+Ku08Ga/uyeu5S4ODHA5/PWHUrfU/tb5TECyrzIC6GTPiv2Nx0
	 0tnRq4OXP0DP2V2ULVsqAinECK5qDmannYVKExh8nFCI9OsvKOS260KSt4pUIAZvMH
	 kP0dsojOAXad0PIdPBtwa6oif4UdvTnq52MtwFxvxmnslByR4qEFo/s1w2K4BcFffk
	 Q/+cziWsGEY9LAPRYrpgD+meGk5FbFF6QabkkTsc5VajyhrUkOsxHBGpQeN/zCfX7A
	 uqC7yFlb7UVGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id DC5943AA940C;
	Tue, 27 Oct 2026 22:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: microchip: fdma: fix DCB corruption under
 sustained load
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179314020569.360855.3209955034452568131.git-patchwork-notify@kernel.org>
Date: Tue, 27 Oct 2026 22:30:05 +0000
References: <20261026-microchip-fdma-dcb-corruption-v1-1-36dab6caca07@microchip.com>
In-Reply-To: <20261026-microchip-fdma-dcb-corruption-v1-1-36dab6caca07@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Steen.Hegelund@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horatiu.vultur@microchip.com,
 jensemil.schulzostergaard@microchip.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Mon, 26 Oct 2026 14:47:05 +0100 you wrote:
> __fdma_dcb_add() prepares a DCB and links it into a channel's chain by
> writing its address to the NEXT_PTR of the current last DCB. The FDMA
> may be processing the chain while this happens.
> 
> Before this patch, the link is written before the new DCB's own nextptr
> and info fields, so the FDMA can follow it to a DCB that hasn't been fully
> prepared yet. Under sustained load this stalls the FDMA.
> 
> [...]

Here is the summary with links:
  - [net] net: microchip: fdma: fix DCB corruption under sustained load
    https://git.kernel.org/netdev/net/c/573a6d4c7a21

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



