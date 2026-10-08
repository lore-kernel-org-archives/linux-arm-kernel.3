Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0C0CA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FHQR9Zwf35cHXjGhBIMoGCp+MRKmr8i0WuLxV25XgE=; b=eWmOrqr03VgxgecjtOYcS5zo5E
	ygipN2NzVxi8Tvmj9s3drsZxwWxynm7jOcYtC6ddP85tZ/X91TfiMTM0Wx3V6yvvB6okfRjW3vai9
	YCvlY5PoFh/0ONhJSv4iT4E8GmcLr/w46bmtXZEVeVApi3xRXLGxazcZhWrBjlb5NoKC3gfGumW8Z
	QiXAPGEkLBCvLt8+MTssayuT/6cB7qFXPf3IqDFaFmofcAUwXQieJlFDFrnHvti63hWJmyK4LgSOi
	L8q5593NmtP3qo6PwJkCM4do/Eak6zjSer75yg4SHC6uCxOTMmfhwh4RB2pZXbHAXsDgL1jffQpF7
	SPgO4NSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsPZ-00000004pfe-2RbN;
	Thu, 08 Oct 2026 18:00:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsPY-00000004pfV-49ys
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 18:00:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70CD243B04;
	Thu,  8 Oct 2026 18:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448DE1F00893;
	Thu,  8 Oct 2026 18:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791482408;
	bh=6FHQR9Zwf35cHXjGhBIMoGCp+MRKmr8i0WuLxV25XgE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jQEp47nVYgsRS9GxV/SJEdNj91RLBkpMq72EVXSWlqh3oFQX9tjvEd/oIcnxjT9e1
	 OfOTyfq/mb5pwJT99oHjQvg2VxN62KQxzi3JZ71dILUjMXoD0yZ9uadGeX3y2yQpeX
	 /F9orb3Oh9EEgRzaOjbk6AC6suy16sdgzHwMwozm05hSvKF2b3/jB1Enpju9AMd1D+
	 /QypKOk1RGcqLIC0l435n0PCTpUmY9kNOj8VzVanAThIeigiePr2PjKMD9nLqQxAmT
	 5XfWzSTKFGiti3kxl5ngaNejdXCmKATLGW/ysZY48UcET0+aedKoaG6b3TdQTDSmY9
	 TncHHn7+tTrlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A321380CEC8;
	Thu,  8 Oct 2026 18:00:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: sparx5: free the matchall entry on destroy
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179148240704.372666.16255779189495351496.git-patchwork-notify@kernel.org>
Date: Thu, 08 Oct 2026 18:00:07 +0000
References: <20261007-sparx5-matchall-kfree-net-v1-1-c8918685b337@microchip.com>
In-Reply-To: <20261007-sparx5-matchall-kfree-net-v1-1-c8918685b337@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kees@kernel.org
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

On Wed, 7 Oct 2026 17:03:15 +0200 you wrote:
> sparx5_tc_matchall_replace() allocates a struct sparx5_mall_entry for
> every offloaded matchall filter and adds it to sparx5->mall_entries.
> sparx5_tc_matchall_destroy() removes the entry from the list, but never
> frees it, so the entry of every deleted mirror and goto matchall filter
> is leaked.
> 
> Free the entry after unlinking it.
> 
> [...]

Here is the summary with links:
  - [net] net: sparx5: free the matchall entry on destroy
    https://git.kernel.org/netdev/net/c/2b82e16d6084

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



