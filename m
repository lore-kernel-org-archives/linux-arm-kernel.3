Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69285607BDCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i4gXci43;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENFUc5T3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rQnZk0VZ7tBSErGjfV3N7YHWRigm1gxu9g9fBoGEz/I=; b=i4gXci43yMgv0+
	v5vsJORwGEhemJGzoPyImXIi/bPPyHpMrOOAB1xumqO01yUaYNUha2iwh7k/3JI6T5+TNIVqRXVZm
	2n/7Z2MQFMJMZyO0uUYwsspCTWAxrhw0OTj3u+5tZlMZO6Uim/Srp2uClvXD1wTJBmPkY5dn24ZQ7
	sl5pG91KCd6AxTTB7fa2s6FhNPNpkDZfaD72rJyPxJQnPZniWOOc8hm+p7BaDIEWRPWy3BpaLW/7/
	Mij4doOkfVU99ARIl9EUq8LAOYgCyOW2RfhtfGN9ERlAB9Y2UegCMa71eTlFcZkrnl/jGYNFy5jBe
	ChkMFCx465/k792kJssA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtCq-0000000Grbe-0UIY;
	Mon, 02 Nov 2026 14:40:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtCo-0000000GrbB-2bbc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:40:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1C296060B;
	Mon,  2 Nov 2026 14:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8696B1F00A16;
	Mon,  2 Nov 2026 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793630413;
	bh=rQnZk0VZ7tBSErGjfV3N7YHWRigm1gxu9g9fBoGEz/I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ENFUc5T3oqtbWbwOPDsru93h+m3LkCW7hJztXMho9ZzJmdQsJZ+J9biZUW6x2/bgT
	 en62y8e6VFMjgo1kfiycgfxWfDDRxZVeWw38TlH3A016j8BwNUUWpOQIzkWIdwRQ6k
	 bqWLosUOkMBthgLILIUiH5qCwIzFTjOpK6Sb0cHeA3nuBCJGD3D2t99RVG2L6k8vSq
	 VYdMfGWv/26vDueQQ35GxMQasN4nsdeI1w606kHH6D98vAPLV7BTvo+mrb6IbJLOpw
	 eJdjZ/lghw6WoocWqCF3mhPahK57bSt+iMSoc1O67raKjGN4+HiqVvEGwUEtFwIFxk
	 rcBGzVMFMSkIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D244380821F;
	Mon,  2 Nov 2026 14:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: sparx5/lan969x: release the in-flight slot of a
 stale TX skb
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179363041231.4096563.5352456270164745162.git-patchwork-notify@kernel.org>
Date: Mon, 02 Nov 2026 14:40:12 +0000
References: <20261029-sparx5-ptp-stale-tx-slot-v1-1-ec15f391bbb7@microchip.com>
In-Reply-To: <20261029-sparx5-ptp-stale-tx-slot-v1-1-ec15f391bbb7@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com,
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 29 Oct 2026 12:48:10 +0100 you wrote:
> sparx5_ptp_txtstamp_request() counts every two step TX skb waiting for
> its timestamp in sparx5->ptp_skbs, and refuses new ones once
> SPARX5_MAX_PTP_ID are in flight. sparx5_ptp_txtstamp_old_release()
> frees the skbs that have waited longer than SPARX5_PTP_TIMEOUT.
> 
> Before this patch, old_release() does not decrement ptp_skbs, so every
> skb whose timestamp never arrives, for example because the switch
> discarded the frame, keeps its slot forever. Once SPARX5_MAX_PTP_ID
> slots are lost, two step frames fail to transmit on every port of the
> switch.
> 
> [...]

Here is the summary with links:
  - [net] net: sparx5/lan969x: release the in-flight slot of a stale TX skb
    https://git.kernel.org/netdev/net/c/873363ac591a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



