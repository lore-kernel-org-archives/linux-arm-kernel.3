Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFDDC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 00:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYKsDualVcY24VNtcS5u8y82LmuzCJJCUn2vZTgsIyA=; b=TXFE9i2rGJ3ZeAE2NDumq5NIxn
	Gn6Wl2dfZb1DmzmkxPPu+YRcr91jfN7RPfx6YauOjSYRtmFRlutCdl4cbxueuNm7dl4+U9Td8Jlr/
	vr134Dh3TmGq8vH2t6r/o4Db6SvCVTg198r3Rcxofkpjx6bbaenlvjjy47QLDAuwzTLMZPF9fZYSD
	OKgu3iWh2NSpMqPVEpuLn0USf1alr5mpuPSSkTBHjU2ExBaSQLeT8eiCWY81C7IVMLDM+RPhLewG6
	py5QSe2bBbLItHcdHBHUAsvnyaYB4CHUJqMZf40dWjmwGjk9C7iX1bzRoNFi+LcUduOTyvlwE/jM/
	xhPA9ZXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK51h-0000000BrRo-0Ftn;
	Wed, 28 May 2025 00:52:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK4zY-0000000Br51-0CAk;
	Wed, 28 May 2025 00:50:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38AF14AAAA;
	Wed, 28 May 2025 00:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17999C4CEED;
	Wed, 28 May 2025 00:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748393399;
	bh=CfqVPgulqZestb/yPNFJQru5z9P9asOFSloEWbORY3w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZuKiHcdKz/TbDOo1ZDkFcDVIdEWmQ2y9oFEVDTbpMEZvSbQCMSAhq2x+IuTekBHNV
	 9TOTPmEuX6FusfWxuabVwb1HktdypjecnZkPE414o2yw9Lh6bSrnQUh1RiKZcSNqpP
	 dq1405TgknJ8AEppaPwwhqna13/e9tF8SAvpxkIDuC6tai/ztqX9HsS/rau9oF4O2w
	 XKvH9vFynmjs1ALmWnH2h7XWrerKHuc2HCek8OG0ibgZBlYU5sfYKgyIRfqO7xRK2R
	 Fn3emF/cJwIbOsanuLdHoXoEYznHuSIqwUtoab3u1kJKE4y8X6ehvxS9D8GmRLXU9h
	 mpLwMoOvMibdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71120380AAE2;
	Wed, 28 May 2025 00:50:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 net] net: airoha: Fix an error handling path in
 airoha_alloc_gdm_port()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174839343325.1843884.14339456243155225714.git-patchwork-notify@kernel.org>
Date: Wed, 28 May 2025 00:50:33 +0000
References: <1b94b91345017429ed653e2f05d25620dc2823f9.1746715755.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <1b94b91345017429ed653e2f05d25620dc2823f9.1746715755.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 horms@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_175000_114779_3403C60A 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

On Sat, 24 May 2025 09:29:11 +0200 you wrote:
> If register_netdev() fails, the error handling path of the probe will not
> free the memory allocated by the previous airoha_metadata_dst_alloc() call
> because port->dev->reg_state will not be NETREG_REGISTERED.
> 
> So, an explicit airoha_metadata_dst_free() call is needed in this case to
> avoid a memory leak.
> 
> [...]

Here is the summary with links:
  - [v4,net] net: airoha: Fix an error handling path in airoha_alloc_gdm_port()
    https://git.kernel.org/netdev/net/c/c59783780c8a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



