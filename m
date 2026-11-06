Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77FD606D838
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CE0fdqK2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UFT1Mkbp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0s74ZEYdly1/UkkGryzb8KYuxZCSbi/EUf0lzGtMVLU=; b=CE0fdqK2oM4fAt
	lteE6bpPrlD9McYLNmvI1upxEuTDTAYVTBBrfizcVV0Gf7aqILLdl7y4s070xdwY/BjsO1tmeiVpf
	yKKN0cKeJvZtQQu+DbIfo7Wntfy3NxYDGh4KNWR2VLunpY2VE0MzzusGSrEif9+nELYcNP+6+ci3k
	Cdxmjx9t0dcRGeMx82Ol8pNymg3TROf1YplC6fLMjkeQDBuRR2thZ7EGL0axpcplGTowv/F2jkiZC
	ywFO55vTxaJtXqnxGvgHmmz/B/zEKuJq5+ksKmkogSNI529PUjHBpZiFPj8fSeBEZQ8Y5EUcZo3jI
	jragjF++je5iyUixZp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKUb-0000000CZE9-1ee2;
	Fri, 06 Nov 2026 14:00:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKUB-0000000CYMx-2W9X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:00:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 38BDA60D0B;
	Fri,  6 Nov 2026 14:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C491F00930;
	Fri,  6 Nov 2026 14:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793973605;
	bh=0s74ZEYdly1/UkkGryzb8KYuxZCSbi/EUf0lzGtMVLU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UFT1Mkbpzj/FgwZXmo3/zUgSAXZOzE0O9HPeYktfVJ5RHCBugmr1RmF5tt62cNqUj
	 C7yBGaaEJV4Q+RRnJgs7iZn+ESrZYznI6mIBREwVd3+MtHWiVOEaGH052CzEY7FUyD
	 ZvmSiCpC3ct9J8djnUwMS7jNgy6NdlTZWE3akXerqKfa6Fsijm8t0Kews8bf1sHahB
	 seqs+Nm7zrIkpQ0fhu3/N2ANJ01pzoGty330V+9CuMWps6OAI6mnBPvrVJn1+NXdwG
	 NBaVDIX/NVX/+/NC3xu5CIT6mr8e4Kdga0aeAXUeTGdto0hsFNNNTYWRTAh7CcpORC
	 dt6k9NQahhOmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D829439E9636;
	Fri,  6 Nov 2026 14:00:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: selftests: Add missing endianness
 conversions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179397360441.639202.10722722859154063493.git-patchwork-notify@kernel.org>
Date: Fri, 06 Nov 2026 14:00:04 +0000
References: <20261103122249.951523-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20261103122249.951523-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue,  3 Nov 2026 13:22:48 +0100 you wrote:
> The kbuild bot found some endianness issues in the stmmac ethtool
> selftests [1] let's address these.
> 
> In practice these missing conversions didn't cause any issue, as the
> masks / values on which the conversions were missing were either always
> 0 or ~0, so skipping the byte swaps lead to the same value being passed
> anyway.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: selftests: Add missing endianness conversions
    https://git.kernel.org/netdev/net-next/c/bb67589c8724

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



