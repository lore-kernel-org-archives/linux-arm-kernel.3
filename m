Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05E7606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 23:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=doFNYa0h;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irnYylYB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B4X6R6clBD6tXnVEq+6/Y8yIwCW7vHn+gYyLWLvCsUw=; b=doFNYa0hqTkEpY
	YUWAYDl7iNTOPYlCRBTqQkrBo/HxCwFlr+R9iAFeqHmc/mtfTxEF4maZq53+pxCLXBu4lQg6urPn7
	bRBprQOEakeEUKbJryLhWo5PyokeIrMeO72ThMamgKMRkYoeiywX+QDyB/6TyiP8j0K2XmhJES8AQ
	n74HUBe7zJxGYz24DJlNI1csx7NtY544dWL89dH2S2tf3UyHalOMGPb6pwqqKQAnb1VNtMCT1vvqo
	NqfLfkvI5Zuq9VyeCP3Dj0BtsBKnRv1uUg/6+8HIP1fMq8uKbaDMsHRBFH/aKOdgwhrs2vlKwyj4V
	JR9Moi3fYtPRJVZg0AVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLU8o-00000003Riv-47NE;
	Mon, 26 Oct 2026 23:30:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLU8n-00000003Rin-42UI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 23:30:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BF11601EF;
	Mon, 26 Oct 2026 23:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAD61F031E0;
	Mon, 26 Oct 2026 23:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793057409;
	bh=B4X6R6clBD6tXnVEq+6/Y8yIwCW7vHn+gYyLWLvCsUw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=irnYylYBh2P5GdWXfWXL4A1zTWCO/1lWXxkOxsXB8j9CCgThrhA7C06HYWdE8grsG
	 /92hwzF67mDpJl0UhJEydDheA0Ac25qOGYpc6c3K6OaXq2ExwNGO7juyv9CCFNtBCv
	 fqKE0ULcLVWl/yFjvOrtB1RZel2a3qLWT7AajEPzEnOGC2HamKbfWrdt/Xq9S2P5TF
	 zLHf+CkQKIxcbyQWRNo1A6+gKFRH8p9j7ixSbKFhc7ijHOyBQwXSobsp2Gm4EfL3VE
	 vdWqFb81ZYwTDSB5bPu8GY8g5BG0c6kAFitrQJ6EfFYIgUFmYj3S4iiFfAwF6s2AQA
	 d+0EHXHa/e5Kw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 075573AA80F0;
	Mon, 26 Oct 2026 23:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: stmmac: fix rx checksum offload with extended
 descriptors
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179305740777.3456332.8291409987867601935.git-patchwork-notify@kernel.org>
Date: Mon, 26 Oct 2026 23:30:07 +0000
References: <20261020-stmmac-rx-csum-v2-1-330c8d0951ea@proton.me>
In-Reply-To: <20261020-stmmac-rx-csum-v2-1-330c8d0951ea@proton.me>
To: alex todadze <todadzealexi19@proton.me>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
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

On Tue, 20 Oct 2026 22:42:24 +0000 you wrote:
> From: alex todadze <todadzealexi19@proton.me>
> 
> With extended descriptors, bit 0 of RDES0 is the Extended Status
> Available flag. enh_desc_get_rx_status() still reads it as the payload
> checksum error bit of the checksum offload table, so every IP frame that
> has extended status is reported as csum_none and its checksum is
> verified again in software.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: fix rx checksum offload with extended descriptors
    https://git.kernel.org/netdev/net/c/72ee27b97986

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



