Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637B9606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kHdQbm2D;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Twk5Chpi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wMxatn9ZBgj5mTbs6ATeEIyXX0vaFfQVORNtXX+SfPY=; b=kHdQbm2DhLeOxb
	dICm2UKH3spt9JdNhbCtfjgsPMlGk9esEnaWr7YxV5gZCYn2ZhU8rHE2bDzrCRFRoTwoZvkSV8b3+
	iqrYHhjOgQHNoN3xP/+3m6HZsi9IaV3OMB0lQaxdJdZPOj0NWO7VbS1Zn5LSOMN4VFhecEFybMV05
	z7kWHmrDCr5TP2G9lwkg4CoG07KFxmzvcmKzEA8FRwlQWHOVZVW6p0dweQlMS6TUdJnPtcz/MJYT6
	9hY4Z4HE92hhHJuTttfoNAvHDbUEjcrxB+YJ6TMczjvIDWGsGqWUUkQYCuKhtPa0t7HcoDQVd2TPM
	AsB6NPnJLTJwisCmwFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMNM-0000000Gxql-3Q8r;
	Fri, 23 Oct 2026 21:00:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMNG-0000000GxqC-15ZJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 21:00:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A94CD4325A;
	Fri, 23 Oct 2026 21:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8651F031E0;
	Fri, 23 Oct 2026 21:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792789225;
	bh=wMxatn9ZBgj5mTbs6ATeEIyXX0vaFfQVORNtXX+SfPY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Twk5ChpiEY7kvnfQzH1fP0t11NZBt/4OZAUPgaTYOicR84dfvLo0W3MDNoLFQiOV1
	 rJ7wx5x/ZnOhk0lm6IJIL1iO1wcShildb4EOEzIEyFPu50t+I8xVBsv0upailKrgJx
	 2+5KFkaPVAjPijNF17lATASjFV8a7rQ3DSZ7e2LLj+X35Jl6ILlreBJNejt8gkDxAl
	 3c5VfputP/93/LWJUFOBjUZCQ7UcJJh1qPoXWPW6f+HiF+NDkSWK7gV1gwZJkXLaPh
	 X5LaOo4+gcid3UM+bCiOUPCs9mX6VlypoQS73evK9UjpTu2/K0hoxuubl1qDGlyUV0
	 Jcc7DI34f+coA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 815FD391B157;
	Fri, 23 Oct 2026 21:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: sparx5/lan969x: do not read past skb->len when
 injecting a frame
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179278922406.1268720.4078185766615858241.git-patchwork-notify@kernel.org>
Date: Fri, 23 Oct 2026 21:00:24 +0000
References: <20261021-sparx5-inject-tail-bytes-v1-1-7dcc035c8ddf@microchip.com>
In-Reply-To: <20261021-sparx5-inject-tail-bytes-v1-1-7dcc035c8ddf@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, bjarni.jonasson@microchip.com,
 lars.povlsen@microchip.com, steen.hegelund@microchip.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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

On Wed, 21 Oct 2026 12:48:26 +0200 you wrote:
> sparx5_inject() writes the frame to the injection FIFO one 32-bit word
> at a time, and pads frames shorter than 60 bytes with zero words.
> 
> Before this patch, the last word is loaded whole even when skb->len is
> not a multiple of four, so 1 to 3 bytes past the end of the frame are
> read. For a frame shorter than 60 bytes those bytes are also
> transmitted, as VLD_BYTES marks the whole last word valid and the
> padding starts at the next word.
> 
> [...]

Here is the summary with links:
  - net: sparx5/lan969x: do not read past skb->len when injecting a frame
    https://git.kernel.org/netdev/net/c/9642ce6cb51e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



